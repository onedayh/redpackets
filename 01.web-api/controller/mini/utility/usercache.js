var redisHelper             = require('../../../core/utilities/redisUtility');
const USERINFO_SET          = "set:userinfo";
const PUBLIC_USERS_SET      = "set:publicuser:";
const USER_RED_BAGS         = "set:userredbags:";
const mutliuserluacode = {
    code : `
        local result ={} 
        local temp
        for i = 2,#(KEYS) do 
            result[i-1]  =  redis.call('hget',KEYS[1],KEYS[i]) 
        end 
        return result
    `,
    keysLength:1
  };
let mutliuser_luasha = null;
class UserCache{
    constructor(redis){
        if (redis)
            this._redis = redis;
        else
            this._redis = new redisHelper();
    }
    /**
     * 将用户信息缓存
     * @param {*} id 
     * @param {*} userData 
     */
    cacheUser(id,userData){
        this._redis.hset(USERINFO_SET,id,userData)
    }
    /**
     * 从redis中获取用户的数据
     * @param {*} id 
     */
    *getUser(id){
        let userData =yield this._redis.hget(USERINFO_SET,id);
        if (!userData) userData = JSON.parse(userData);
        return userData;
    }
    // *getDbSize(){
    //     let size = yield this._redis.getDBSize();
    //     return size;
    // }
    // clearDB(){
    //     return this._redis.flushDB();
    // }
    /**
     * 为用户添加参与的红包记录
     * @param {*} userid 
     * @param {*} redid 
     */
    setUserRedbag(userid,redid){
        this._redis.hset(USER_RED_BAGS+id,redid,redid); 
    }
    /**
     * 获取用户所有参与的红包记录
     * @param {*} userid 
     * @param {*} redid 
     */
    getAllJoinedRedbags(userid){
        return this._redis.hgetall(USER_RED_BAGS+id,1);
    }
    /**
     * 缓存红包用户对公众号的授权后的缓存
     * @param {*} userid 
     * @param {*} wechatpublic 
     */
    setWechatPublicAuthoried(userid,wechatpublic){
        console.log('hset wechatpublic:',PUBLIC_USERS_SET+wechatpublic.appid,wechatpublic.openid);
        this._redis.hset(
            PUBLIC_USERS_SET+wechatpublic.appid,
            userid,       
            wechatpublic.openid
        );
    }
    /**
     * 一次性获取多个用户的信息
     */
    getMutliUserInfo(userlist){
        let redisClient =   this._redis.getRedisClient();
        let userParams  = userlist.split(',');       
        let keysLength  = userParams.length+1;
        return new Promise((resolve, reject) => {
              if (mutliuser_luasha) {
                redisClient.evalsha(mutliuser_luasha,keysLength,USERINFO_SET, ...userParams, (err, result) => {
                  if (err) {
                    reject({successed:false,err:err});
                  } else {
                    let userinfo = [];
                    result.forEach(element => {
                        userinfo.push(JSON.parse(element));
                    });
                    resolve({successed:true,user:userinfo});
                  }
                });
              } else {
                redisClient.script('load', mutliuserluacode.code, (err, sha) => {
                  if (err) {
                    reject({successed:false,err:err});
                  } else {
                    mutliuser_luasha = sha;
                    redisClient.evalsha(mutliuser_luasha, keysLength,USERINFO_SET, ...userParams, (err, result) => {
                      if (err) {
                        reject({successed:false,err:err});
                      } else {
                        let userinfo = [];
                        result.forEach(element => {
                            userinfo.push(JSON.parse(element));
                        });
                        resolve({successed:true,user:userinfo});
                      }
                    });
                  }
                });
              }
          });
    }

}

exports = module.exports = UserCache;