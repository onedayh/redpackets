/**
 *
 * lua脚本集合
 *
 * 用于一些对redis原有数据有执行依赖的事务
 *
 * @author {stephen.shen}
 */

// redis连接，本身不创建，由外部传入。
let redisClient;

let instance = {
  script : {
  }
};
// 用于记录已在redis缓存过的脚本sha码
let bufferScript = {};
/**
 * 抢红包动作的LUA脚本定义（keysLength值为KEY的个数）
 * 
 * KEYS[1]      红包分配队列的名称
 * KEYS[2]      红包消费的队列名称
 * KEYS[3]      红包活动已参与的用户set
 * KEYS[4]      当前参与的用户id
 * KEYS[5]      当前红包玩法是否是拼包
 * KEYS[6]      每个拼包需要参与的人数
 * KEYS[7]      拼包的set名称
 * KEYS[8]      拼的链接id
 * KEYS[9]      如果KEYS[8]已满,新的链接id
 * @return 1 成功  -1 失败1
 */
instance.script.grabbingRedPacket = {
  // code : `
  //   if redis.call('hexists', KEYS[3], KEYS[4]) ~= 0 then
  //   return 10000;
  //   else
  //       local hongBao = redis.call('rpop', KEYS[1]);
  //       if hongBao then
  //           local x = cjson.decode(hongBao);
  //           x['userid'] = KEYS[4];
  //           local re = cjson.encode(x);
  //           redis.call('hset', KEYS[3], KEYS[4], KEYS[4]);
  //           redis.call('lpush', KEYS[2], re);
  //           return re;
  //       end
  //   end
  //   return nil;
  // `,
  code : `
  local userjoin = redis.call('hget', KEYS[3], KEYS[4]);
  if userjoin then
    local attend = cjson.decode(userjoin);
    attend['result']=1;     ---result=1：用户已经参与
    ---如果用户抢到的是有拼团的，则把团上的所有用户一起返回
    if attend['groupid'] then
      local alluser = redis.call('hget', KEYS[7],attend['groupid']);
      attend['groupinfo'] = cjson.decode(alluser);
    end
    return cjson.encode(attend);
  else
      local hongBao = redis.call('rpop', KEYS[1]); 
      if hongBao then
          local x     = cjson.decode(hongBao);
          ----还剩余多少
          x['userid'] = KEYS[4];
          local gpinfo = nil;
          if KEYS[5]=='1' then  --  如果活动属于拼包行为,则检查拼包链的情况
              local grouplink = nil;
              local newgrouplink = KEYS[9];
              gpinfo=cjson.decode('{"current":0,"user":""}');
              if KEYS[8] then
                grouplink = redis.call('hget',KEYS[7],KEYS[8]);
              end
              -- 如果拼包链存在，并且参与的人数未达到数量，则将用户插入这个链接中
              if grouplink then
                  gpinfo = cjson.decode(grouplink);
                  if gpinfo['current']< tonumber(KEYS[6]) then
                    newgrouplink = KEYS[8];
                  else
                    gpinfo=cjson.decode('{"current":0,"user":""}');
                  end
              end
              gpinfo['current'] = gpinfo['current']+1;
              -- 当前正好拼包人数满足条件
              x['groupsuccess'] =gpinfo['current'] == tonumber(KEYS[6]);
              --将当前用户的红包信息插入到拼团的队列中
              gpinfo['user']  =  gpinfo['user']..','..KEYS[4]..'|'..x['money'];
              x['groupid']   =  newgrouplink;
              redis.call('hset',KEYS[7],newgrouplink,cjson.encode(gpinfo));
          end

          local re = cjson.encode(x);
          redis.call('hset', KEYS[3], KEYS[4],re);
          redis.call('lpush', KEYS[2], re);
          x['result']=0;    --result=-1:红包抢到了
          if gpinfo then
            x['groupinfo'] = gpinfo;
          end
          return  cjson.encode(x);
      end
  end
  return '{"result":-1}';   ---result=-1:红包已经抢完了
`,
  keysLength:9
};


/**
 *
 * lua执行器 自动判断是否已经缓存过  从而决定是向redis传递脚本还是sha
 *
 * @param name    本脚本所支持的指令  位于 instance.script 下
 * @param ...param  该指令所期待的参数, 按照KEYS到ARGV的顺序罗列
 */
instance.run = function(name, ...param) {
  console.log('script parameters',...param);
  return new Promise((resolve, reject) => {
    if (!redisClient) {
      console.log('redisClient is no ready');
      reject('redisClient is no ready');
    } else if (!instance.script[name]) {
      console.log('this command is not supported');
      reject('this command is not supported');
    } else {
      if (bufferScript[name]) {
        redisClient.evalsha(bufferScript[name], instance.script[name].keysLength, ...param, (err, result) => {
          if (err) {
            console.log('run eerror 1',err);
            reject({successed:false,err:err});
          } else {
            console.log('after script',result);
            let retInfo = JSON.parse(result);
                if (retInfo.result==-1) 
                    resolve({successed:true,errcode:retInfo.result,errmsg:'红包已经被抢光了！'});
                else if (retInfo.result==1)  ///用户已经抢过该活动的红包了
                  resolve({successed:true,errcode:retInfo.result,errmsg:'您已经参与过此次活动,谢谢参加',...retInfo});
                else
                  resolve({successed:true,errcode:0, ...retInfo});
          }
        });
      } else {
        redisClient.script('load', instance.script[name].code, (err, sha) => {
          if (err) {
            console.log('run eerror 2',err);
            reject({successed:false,err:err});
          } else {
            bufferScript[name] = sha;
            redisClient.evalsha(sha, instance.script[name].keysLength, ...param, (err, result) => {
              if (err) {
                console.log('run eerror 3',err);
                reject({successed:false,err:err});
              } else {
                console.log('after script',result);
                let retInfo = JSON.parse(result);
                if (retInfo.result==-1) 
                    resolve({successed:true,errcode:retInfo.result,errmsg:'红包已经被抢光了！'});
                else if (retInfo.result==1)  ///用户已经抢过该活动的红包了
                  resolve({successed:true,errcode:retInfo.result,errmsg:'您已经参与过此次活动,谢谢参加',...retInfo});
                else
                  resolve({successed:true,errcode:0,...retInfo});
              }
            });
          }
        });
      }
    }
  });
}


module.exports = function(client) {
  if (!client) {
    return;
  }
  redisClient = client;
  return instance;
}
