/*
* 红包工具助手
* 集成了抢红包、检查红包状态、随机生成红包方法
*/
var co              = require('co');
var moment          = require('moment');
var uuid            = require('node-uuid');
var utility         = require('../../../core/utilities/utilities');
var redisHelper     = require('../../../core/utilities/redisUtility');
var QRUtility       = require('../../../core/utilities/qrcodeUtility');
var grabUtility     = require('./grabredbag');
var uploadConfig    = require('../../../uploadconfig.json');
var wxPay           = require('../../../core/wechatapi/WechatPay');
var userCache       = require('./usercache');
var publicApi       = require('../../../core/wechatapi/PublicApi');

const REDBAG_INFO_KEY       = "key:redbag:"
const REDBAG_ALLOC_LIST     = "list:redbag:";
const REDBAG_CONSUME_LIST   = "list:redbag-consumed:";
const REDBAG_GROUP_SET      = "set:redbag-group:";
const REDBAG_USER_JOINED    = "set:redbag-user:";
const PUBLIC_USERS_SET      = "set:publicuser:";
const PUBLIC_UNSUB_USERS_SET= "set:unsubpublicuser:";  ////公众号非关注的用户，用于计算带入的新的用户
const REDBAG_FULL_USERINFO  = "key:redbaguserinfo:"

const APP_INFO       = "set:appinfo";


const BACKGROUND_KEY        = "key:background";
/**
 * 红包活动的状态
 */
const REDBAG_STATUS = {
                            "-1":"not exist",      ////红包活动不存在
                            "0":"not_payed",       ////等待红包主支付
                            "1":"activited",       ////红包已激活
                            "2":"paused"           ////红包活动暂停
                      }

class RedBagUtility
{
    /**
     * 查询物流记录
     */
    constructor(daoModel,redis){
        if (redis)
            this._redis = redis;
        else
            this._redis = new redisHelper();
        this._daoModel  = daoModel;
        this._usercache = new userCache(this._redis);
        ////实例化出来微信支付接口api
        ////this._wxApi = new wxPay();
    }
    /**
     * 检查用户是否已经有参加过活动，如果参加过则直接返回用户
     * 参与活动的结果
     * @param {*} id 
     * @param {*} userid 
     */
    *userHasbeenPlayed(id,userid,groupcount){
        ///检查CONSUME的列表中是否有用户信息存在
        let joinResult =yield this._redis.hget(REDBAG_USER_JOINED+id,userid);
        ///如果没有则返回用户没有参与过
        if (!joinResult) return {played:false};
        ///如果用户抢到的是有拼团的，则把团上的所有用户一起返回
        joinResult = JSON.parse(joinResult);
        if(joinResult.groupid){
            let linkUser =yield this._redis.hget(REDBAG_GROUP_SET+id,joinResult.groupid)
            linkUser = JSON.parse(linkUser);
            let groupUsers = linkUser.user.split(',');
            let groupUserIds = [];
            let UserMoneys = [];
            groupUsers.forEach(element => {
                if (element!=''){
                    let usergrab = element.split('|');
                    if (usergrab.length==2){
                        groupUserIds.push(usergrab[0]);
                        UserMoneys.push(usergrab[1]);
                    }
                }
            });
            if (groupUserIds.length>0){
                let userInGroup = yield this._usercache.getMutliUserInfo(groupUserIds.join(','));
                if (userInGroup.successed==true){
                    let decorUsers = [];
                    userInGroup.user.forEach((element,index)=>{
                        decorUsers.push({
                            userid:element.user_id,
                            avatarUrl:element.avatarUrl,
                            nickName:element.nickName,
                            money:UserMoneys[index]
                        });
                    });
                    joinResult.groupinfo = {user:decorUsers,current:decorUsers.length};
                     ////当前的裂变红包是否已经成功
                    joinResult.groupsuccess =decorUsers.length>=groupcount;
                }
            }
           

        }
        return {played:true,...joinResult}
    }
    /**
     * 获取一个红包活动下的所有已经抢到红包的用户
     * 用于前端的滚动
     * @param {*} id 
     */
    *getAllocedUser(id){
        // let redisUser =yield this._redis.get(REDBAG_FULL_USERINFO+id);
        // if (redisUser){
        //     console.log('load from redis');
        //     return JSON.parse(redisUser);
        // } 
        let decorUsers = [];
        let users = yield this._redis.hgetall(REDBAG_USER_JOINED+id,0);
        if (users){
            let userids = [];
            let allocinfo = [];
            Object.keys(users).forEach((element)=>{
                    userids.push(element);
                    allocinfo.push(JSON.parse(users[element]).money);
            });
            console.log('all users ,',JSON.stringify(userids));

            let allocUsers = yield this._usercache.getMutliUserInfo(userids.join(','));
            if (allocUsers.successed==true){
                allocUsers.user.forEach((element,index)=>{
                    if (element){
                        decorUsers.push({
                            userid:element.user_id,
                            avatarUrl:element.avatarUrl,
                            nickName:element.nickName,
                            money:allocinfo[index]
                        });
                    }
                });
                ////缓存到redis中，2分钟过期
                this._redis.set(REDBAG_FULL_USERINFO+id,decorUsers,120);
            }
        }
        return decorUsers;
    }
    /**
     * 获取默认的红包背景信息
     */
    getDefaultBackground(){
        return this._redis.get(BACKGROUND_KEY);
    }
    /**
     * 抢红包动作
     * @param {*} id : 红包活动id 
     * @param {*} userid : 抢红包的用户
     */
    *grabRedBag(id,groupid,userid){
        ///开抢前，检查红包活动是否启动
        let redValidResult = yield this.redBagIsValid(id);
        if (redValidResult.valid==false){
            return {successed:false,...redValidResult};
        }
        console.log('redValidResult',redValidResult);
        ///检查这个红包活动是否需要关注公众号,如果需要，则需要检查用户是否已经关注了这个公众号
       // if(redValidResult.follow==1 && redValidResult.appid){
        if(redValidResult.follow==1 && redValidResult.appinfo && redValidResult.appinfo.appType==0){
            console.log('checkMyUserSubscribePublic',userid,redValidResult.appid);
           let subscribe = yield this.checkMyUserSubscribePublic(userid,redValidResult.appid);
           if (subscribe.subscribed==false){
                ////如果没有关注过，则记录一下
                this._redis.hset(PUBLIC_UNSUB_USERS_SET+redValidResult.appid,userid,subscribe.openid);
                return {successed:false,errcode:101,errmsg:'请先关注公众号',publicname:redValidResult.appname};
           }
           ///如果已经关注了,则判断之前是不是没有关注过，如果没有，说明是本应用导流过去的
           let pubOpenId =  yield this._redis.hget(PUBLIC_UNSUB_USERS_SET+redValidResult.appid,userid);
           ////确实是是本应用导流过去的，则记录下来
           if (pubOpenId){
               ///记录到引流表中
                this._daoModel.diversion({appid:redValidResult.appid,userid:userid,id:id,openid:pubOpenId});
                ////删除redis的记录
                this._redis.hdel(PUBLIC_UNSUB_USERS_SET+redValidResult.appid,userid);
           }
        }
        /* KEYS[1]      红包分配队列的名称
        * KEYS[2]      红包消费的队列名称
        * KEYS[3]      红包活动已参与的用户set
        * KEYS[4]      当前参与的用户id
        * KEYS[5]      当前红包玩法是否是拼包
        * KEYS[6]      每个拼包需要参与的人数
        * KEYS[7]      拼包的set名称
        * KEYS[8]      拼的链接id
        * KEYS[9]      如果KEYS[8]已满,新的链接id
        * */
        const luaScript = grabUtility(this._redis.getRedisClient());
        let result = yield luaScript.run('grabbingRedPacket',
            REDBAG_ALLOC_LIST+id,
            REDBAG_CONSUME_LIST+id,
            REDBAG_USER_JOINED+id,
            userid,
            redValidResult.playtype || 0,
            redValidResult.groupcount,
            REDBAG_GROUP_SET+id,
            groupid || '',
            new Date().getTime()
            );
        console.log('after result',result);
       
        ///用户真正的抢到了红包
        if (result.successed){
            result.topic = redValidResult.topic;///活动名称
            ////如果需要跳转小程序,则返回跳转的链接
//            console.log('check public',redValidResult);
            if (redValidResult.follow=="1" && redValidResult.appid && redValidResult.appinfo && redValidResult.appinfo.appType==1){
                result.navigateMini = {
                    appid:redValidResult.appid,
                    appname:redValidResult.appinfo.appName,
                    path:redValidResult.appinfo.appPath,
                    param:redValidResult.appinfo.appParam?JSON.parse(redValidResult.appinfo.appParam):null
                }
            }
            ///用户真正的抢到了红包
            if ( result.errcode==0){
                 ///登记用户已参与
                 let paramInfo = {id:id,userid:userid,groupid:result.groupid,money:result.money}
                 this._daoModel.joined({id,userid,param:JSON.stringify(paramInfo)});
                let param = {userid:userid,redid:id,grabinfo:[]};
                ///累加当前参与的用户量
                redValidResult.usercount = (redValidResult.usercount || 0)+1;
                redValidResult.totalgrabbed = (redValidResult.totalgrabbed || 0)+result.money;
                ////重新存储一下红包活动
                this.storeRedbag(id,redValidResult);

                
                ///活动不是拼包行为,直接将钱转入用户余额，等待用户提现
                if (!result.groupid){
                    param.grabinfo.push("("+id+",'"+userid+"',"+result.money+")"); 
                    this._daoModel.grabbed(param);
                    //this._wxApi.transferMoneyToUser(userid,new Date().getTime(),Math.floor(0.3 * 100));
                }
                ////如果红包是个拼包,则需要等到拼的人数够了,才可以拆红包
                else{
                    ////拼包成功了，将拼的队伍中的用户全部插入
                        result.groupcount = redValidResult.groupcount;
                        let groupUsers = result.groupinfo.user.split(',');
                        let groupUserIds = [];
                        let UserMoneys = [];
                        groupUsers.forEach(element => {
                            if (element!=''){
                                let usergrab = element.split('|');
                                if (usergrab.length==2){
                                    groupUserIds.push(usergrab[0]);
                                    UserMoneys.push(usergrab[1]);
                                    param.grabinfo.push("("+id+",'"+usergrab[0]+"',"+usergrab[1]+")"); 
                                }
                            }
                        });
                        if (groupUserIds.length>0){
                            let userInGroup = yield this._usercache.getMutliUserInfo(groupUserIds.join(','));
                            if (userInGroup.successed==true){
                                let decorUsers = [];
                                userInGroup.user.forEach((element,index)=>{
                                    decorUsers.push({
                                        userid:element.userid,
                                        avatarUrl:element.avatarUrl,
                                        nickName:element.nickName,
                                        money:UserMoneys[index]
                                    });
                                });
                                
                                result.groupinfo.user = decorUsers;
                                //console.log('result.groupinfo.user',result.groupinfo.user);
                            }
                            
                        }
                        if (result.groupsuccess===true && result.groupinfo) this._daoModel.grabbed(param);
                    }
            }
            else if(result.errcode==-1){  ///红包已经被抢光了
                
                let isOver = yield this.setRedBagOvered(id);
            }
            else if(result.errcode==1){ ////用户已经参与过
               
            }
        }
        return result;
    }
    /**
     * 清理红包数据
     * @param {} id 
     */
    clearRedBagCache(id){
        /////删除红包活动在redis中的缓存
        this._redis.delete(REDBAG_INFO_KEY+id);
        this._redis.delete(REDBAG_ALLOC_LIST+id);
        this._redis.delete(REDBAG_CONSUME_LIST+id);
        this._redis.delete(REDBAG_GROUP_SET+id);
        this._redis.delete(REDBAG_USER_JOINED+id);
        this._redis.delete(REDBAG_FULL_USERINFO+id);
        return this._daoModel.clear(id)
    }

    /**
     * 获取用户参与的红包记录表
     * @param {*} userid 
     */
    *getUserRedbags(userid){
        let reds = yield this._usercache.setUserRedbag(userid,id);
        console.log('getUserRedbags',reds)
        return reds;
    }
    /**
     * 为红包活动生成二维码
     * @param {*} id 
     */
    *gererateRedbagQr(id){
        let param = {
            route:'/pages/index/index?id='+id
        }
        ////调用生成二维码
        let qrresult = yield QRUtility.miniQR(param);
        return qrresult;
    }
    /**
     * 创建一个红包活动
     * @param {*} param 
     */
    *createRedBag(param){
       let _this = this;
       param.status = 0;
       param.bless = param.bless || '新年快乐 恭喜发财';
       param.bgmusic = utility.checkValue(param.bgmusic,null);
       param.minimal = utility.checkValue(param.minimal,null);
       param.maximum = utility.checkValue(param.maximum,null);
       ///如果上传的图片是远程的图片,则需要下载到腾讯云上
       if (param.logo && utility.startWith(param.logo,'http')) {
            let redLogoResult = yield utility.downloadFile4upload('tencentcos',param.logo,uploadConfig.redbaglogo,null);
            if (redLogoResult.success) param.logo = redLogoResult.filePath;
       }
       ///设置了需要关注或跳转小程序
       if (param.follow && param.appid){
            param.appinfo =  yield this.getAppInfo(param.appid);
       }

       let result = yield this._daoModel.create(param);
       if (result.successed==true){
            param.id = result.redid;
            ////将红包活动的信息存储
            _this.storeRedbag(result.redid,param);  
            ////如果参数中包含立即支付，则调用立即支付
            // console.log('ready to pay ',param.paynow)
            if (param.paynow == 1){
                return yield _this.payRedBag(result,false);
            }
        }
        return result;
    }
    /**
     * 获取红包所需关联的公众号
     * @param {*} appid 
     */
    *getAppInfo(appid){
        let appinfo  = yield this._redis.hget(APP_INFO,appid);
        if (!appinfo) return null;
        appinfo = JSON.parse(appinfo);
        return {
            appId           :appinfo.appId,
            appName         :appinfo.appName,
            appType         :appinfo.appType,
            appPath         :appinfo.appPath,
            appParam        :appinfo.appParam
        };
    }
    /**
     * 用户撤销红包
     * @param {*} param 
     */
    rollback(param){
        return this._daoModel.rollback(param);
    }


    /**
     * 更新一个红包活动
     * @param {*} param 
     */
    *editRedBag(id,param){
        let _this = this;
        
        param.bless = param.bless || '新年快乐 恭喜发财';
        param.bgmusic = utility.checkValue(param.bgmusic,null);

        param.minimal = utility.checkValue(param.minimal,null);
        param.maximum = utility.checkValue(param.maximum,null);
        ///如果上传的图片是远程的图片,则需要下载到腾讯云上
        if (param.logo && utility.startWith(param.logo,'http')) {
             let redLogoResult = yield utility.downloadFile4upload('tencentcos',param.logo,uploadConfig.redbaglogo,null);
             if (redLogoResult.success) param.logo = redLogoResult.filePath;
        }
        ///设置了需要关注或跳转小程序
        if (param.follow && param.appid){
            param.appinfo =  yield this.getAppInfo(param.appid);
        }
        let result = yield this._daoModel.edit(id,param);
        if (result.successed==true){
            let cachedData = yield this.getRedBagInfo(id);
            let newRedData = Object.assign({},cachedData,param);
           // console.log('newRedData',newRedData);
             ////将红包活动的信息存储
             _this.storeRedbag(result.redid,newRedData);  
             ////如果参数中包含立即支付，则调用立即支付
             if (param.paynow == 1){
                 return yield _this.payRedBag(result,false);
             }
         }
         return result;
     }
    /**
     * 支付一个红包活动
     * @param {*} id 
     * @param {*} Repay: 是否是重新发起的支付 
     */
    *payRedBag(param,Repay=true){
        let _this = this;
        let result = param;
        if (Repay===true)  result = yield this._daoModel.repayRedbag({id:param.id});
        console.log('payRedBag',result)
        if (result.successed==true && result.paytype==0){
            ////需要进行微信支付
                let wePay = new wxPay();
                let payResult= yield wePay.payOrder(
                            param.userid,
                            result.txno,
                            result.redid,       ////将红包活动的id放置在回调的数据里面
                            //result.topic,
                            '红包主题',
                            Math.round(result.cost * 100));
                if (payResult.successed===true){
                    let jsonResult ={...payResult,...result};
                    return jsonResult;
                }
        }
        return result;
    }


    /**
     * 红包服务费线下支付
     * @param {*} param 
     */
    *offlinePay(param){
        let _this = this;
        let qrcode = yield this.gererateRedbagQr(param.id);
        if(qrcode.successed){
            param.qrcode = qrcode.qrcode;
            let result = yield _this._daoModel.offlinePayRedBag(param);
            ///支付成功
            if(result.successed){
                let baginfo = yield _this.getRedBagInfo(param.id);
                baginfo.status = 1;
                baginfo.qrcode =  param.qrcode;
                _this.storeRedbag(param.id,baginfo);
                ///执行红包的分配
                _this.allocRedbag(param.id,result.amount,result.total,result.alloctype,result.minimal,result.maximum);
                return result;
            }
        }
        return {successed:false};
    }
    /**
     * 获取红包的基本属性
     * @param {*} id 
     */
    *getRedBagInfo(id){
        ////从redis 中获取到红包信息
        let redbaginfo = yield this._redis.get(REDBAG_INFO_KEY+id);
        if (redbaginfo) {
            redbaginfo = JSON.parse(redbaginfo);
            redbaginfo.remain = redbaginfo.total -(redbaginfo.usercount || 0);
            redbaginfo.bgmusic = utility.checkValue(redbaginfo.bgmusic,null);
            return redbaginfo;
        }
        return null;
    }
    /**
     * 存储红包信息到redis
     * @param {*} rebdata 
     */
    storeRedbag(id,redbagdata){
        redbagdata.status = redbagdata.status || 0;
        ///如果这个红包开启了公众号关注,则生成一个链接，让前端简单的
        ///在小程序中request一次,用于获取用户在此对应的公众号下的openid
        this._redis.set(REDBAG_INFO_KEY+id,redbagdata);
    }
    /**
     * 设置红包全部已经被抢光
     * @param {*} id 
     */
    *setRedBagOvered(id){
        let redData = yield this.getRedBagInfo(id);
        if (!redData){
            redData.isover = 1;
        }
        this.storeRedbag(id,redData);
    }
    /**
     * 获取红包活动当前的属性
     * @param {*} id 
     */
    *getRedbagStatus(id){
        let redData = yield this.getRedBagInfo(id);
        if (!redData) return {status:-1,status_desc:REDBAG_STATUS["-1"]};
        return {...redData,status_desc:REDBAG_STATUS[redData.status]}
    }
    /**
     * 改变红包活动的状态
     * @param {*} id 
     * @param {*} statusValue 
     */
    *setRedbagStatus(id,statusValue){
        let redData = yield this.getRedBagInfo(id);
        if (redData) {
            redData.status = statusValue;
            this.storeRedbag(id,redData)
        }
    }
    
    /**
     * 检查红包活动是否可以玩了
     * @param {*} id 
     */
    *redBagIsValid(id){
        let result =yield this.getRedBagInfo(id);
        if (!result || result.status!=1) return {valid:false,errcode:100,errmsg:'活动不存在或未激活或已停止',...result};
       
        ///检查红包的活动日期是否开始
        if (result.startdate && moment().isBefore(result.startdate)) return {valid:false,errcode:99,errmsg:'活动尚未开始',...result};
        ///检查活动是否已经结束
        if (result.enddate && moment().isAfter(result.enddate)) return {valid:false,errcode:98,errmsg:'您来晚了,活动已结束',...result};
        return {valid:true,errcode:0,errmsg:'ok',...result};
    }
    /**
     * 分配红包
     * @param {*} redid  : 红包活动的id
     * @param {*} amount : 发放红包的总金额
     * @param {*} total  : 发放红包的总数量
     * @param {*} alloctype : 分配方式  0:随机 1:平均
     */
    allocRedbag(redid,amount,total,alloctype,min,max){
        if (min)  min = Math.trunc(min * 100);
        if (max)  max = Math.trunc(max * 100);
        let allocFunc = [this.randAllocRedBag,this.AverageAllocRedBag];
        return allocFunc[alloctype](this,redid,amount,total,min,max)
    }
    /**
     * 随机分配红包金额
     * @param {*} redid 
     * @param {*} amount 
     * @param {*} total 
     */
    AverageAllocRedBag(instance,redid,amount,total,min,max){
        //let redisConfig = instance._redis.getRedisConfig();
        let redlistKey  = REDBAG_ALLOC_LIST+redid;
        return new Promise(resolve=>{
            let remainTotal = Math.trunc(amount * 100),     ///剩余需要分配的钱
                remainCnt	= total,            ///还有多少个红包需要分配
                avgamount   = Math.floor(remainTotal / remainCnt )/100,  ////平均的额度；
                avgmode     = Math.floor(remainTotal % remainCnt),     //防止平均除不尽，最后一个红包就是剩余的金额 
                allocItem   = {},               ////每次分配到的数据
                seqid       = 1;                ///分配到的序号
            let result      = [];                ///最终分配出来的结果集    
            let commands    = [];                ///提交给redis批量执行的命令
            while(remainCnt>0){
                ///防止平均除不尽，最后一个红包就是剩余的金额
                if(remainCnt==1)
                    allocItem = {id:seqid++,money:avgamount+avgmode/100};
                else
                    allocItem = {id:seqid++,money:avgamount};
                result.push(allocItem)
                let itemCommand = ['lpush',redlistKey,JSON.stringify(allocItem)];
                commands.push(itemCommand);
                remainCnt--;
            };
            instance._daoModel.actualDistribute({id:redid,amount:amount,total:total})
            instance._redis.batch(commands,function(err,reply){
                resolve({successed:true,result})
             })
             commands = null;
            /**
             * 一次性写入到redis的队列中
             */
            // pushStream.on('end', function () {
            //     resolve({successed:true,result})
            // })
            //pushStream.end();
        })
    }
    /**
     * 随机分配红包金额
     * @param {*} redid 
     * @param {*} amount 
     * @param {*} total 
     */
    randAllocRedBag(instance,redid,amount,total,min,max){
        //let redisConfig = instance._redis.getRedisConfig();
        let redlistKey  = REDBAG_ALLOC_LIST+redid;
        return new Promise(resolve=>{
            let remainTotal = Math.trunc(amount * 100),     ///剩余需要分配的钱
                remainCnt	= total,            ///还有多少个红包需要分配
                allocItem   = {},               ////每次分配到的数据
                seqid       = 1;                ///分配到的序号

            let result      = [];                ///最终分配出来的结果集
            let commands    = [];                ///提交给redis批量执行的命令
           
            //console.log('redis-stream-info',redisConfig);
            //let rs = new redisstream(redisConfig.port,redisConfig.host,redisConfig.db,redisConfig.auth_pass);
            //let pushStream = rs.stream('lpush',redlistKey);
            let alloc = 0;
            let minLimit = (min?min:1);
            while(remainCnt>0 && remainTotal>minLimit){
                let bonus 	= instance.allocFunc(remainTotal,remainCnt,min,max);
                remainTotal = Math.trunc(remainTotal-bonus);
                remainCnt--;
                allocItem = {id:seqid++,money:Math.floor(bonus)/100};
                alloc+=bonus;
                let itemCommand = ['lpush',redlistKey,JSON.stringify(allocItem)];
                commands.push(itemCommand);
                //pushStream.write(JSON.stringify(allocItem));
                result.push(allocItem)
            };
            ///因为设置了红包的最大值和最小值，可能导致最终分配的金额
            ///和个数与用户设置的不一致,因此，如果实际分配的金额或个数与用户设定的不一致,则
            ///需要记录下来
            //if (Math.floor(alloc)/100!=amount || result.length!=total){
                ////记录实际生成的红包金额和红包数量
            instance._daoModel.actualDistribute({id:redid,amount:Math.floor(alloc)/100,total:result.length})
            //}
            instance._redis.batch(commands,function(err,reply){
               resolve({successed:true,result,total:Math.floor(alloc)/100})
            })
            commands = null;
            // pushStream.on('end', function () {
            //     resolve({successed:true,result,total:Math.floor(alloc)/100})
            // })
            //console.log('finished alloc',result);

            //pushStream.end();
           
        })
    }
    /**
     * 随机分配红包
     * @param {*} remainAmount 当前剩余的金额 
     * @param {*} remainCount  还剩下多少红包未分配
     * @param {*} min 最低分配的金额
     * @param {*} max 最高分配的金额
     */
    allocFunc(remainAmount,remainCount,min,max){
        var boundrange,rand=Math.random();
        ///如果是计算最后一个红包了，则将剩余的钱全部放置在这个红包上
        if(remainCount==1) {
            ///如果定义了最大值，即使最后仅剩一个了，也按最大值
            if (max) {
                if (remainAmount>max) return max;
                return remainAmount;
            }
            return remainAmount;
        }
        ///如果定义的最大值，则需取最大值，否则随机计算
        let maxBouns=max?max:((remainAmount / remainCount) * 2 - 1);
        ///如果了定义的最小值，则需取最小值，否则最小分配1分钱
        let minBouns=min?min:1;
	    boundrange = rand*(maxBouns - minBouns);
	    return Math.trunc(minBouns + boundrange);
    }
    /**
     * 检查我们的用户是否关注了某个公众号。某些红包必须要先关注公众号之后才能领取
     * @param {} userid 
     * @param {*} appid 
     */
    *checkMyUserSubscribePublic(userid,appid){
        ////首先获取我们用户对应在对方公众号下的openid
        ////如果redis中无此键值，表示用户未授权
        console.log('checkMyUserSubscribePublic hget',PUBLIC_USERS_SET+appid,userid);
        let appopenid = yield this._redis.hget(
            PUBLIC_USERS_SET+appid,
            userid
            );
        console.log('appopenid',appopenid);
        if (!appopenid) return false;  ///用户没有授权到该公众号下拿到openid
        let pubApi = new publicApi(appid);
        let subscribed= yield pubApi.userSubscribed(appopenid)
        return {subscribed:subscribed,openid:appopenid}
    }


    /**
     * 批量插入数据到队列中
     */
    /*batchList(listKey,arrayItems){
        let self = this;
        return new Promise((resolve,reject)=>{
            if (arrayItems instanceof Array ){
                var rs = new redisstream(config.redisConnections.port,config.redisConnections.host,config.redisConnections.db);
                let pushStream = rs.stream('lpush',listKey)
                arrayItems.forEach(element=>{
                        pushStream.write(JSON.stringify(element));
                });
                pushStream.on('end', function () {
                    resolve({successed:true})
                })
                pushStream.end();
            }
            else
                reject({successed:false,errmsg:'arrayItems is not an array instance'})
        });
        
    }
    */
}
exports = module.exports=RedBagUtility;