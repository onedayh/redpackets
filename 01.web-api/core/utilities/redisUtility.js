var redis       = require('redis');
var wrapper     = require('co-redis');
var config      = require('../../configuration.json');
var stringUtil  = require('./stringUtility');
var redisstream = require('redis-stream');
var co = require('co');
class RedisUtil{
    constructor(dbPosition){
        if (!this._redisCo){
            if (dbPosition==null) dbPosition = config.redisConnections.db;
            this.initClient(dbPosition);
        }
    }
    /**
     * 返回redis的客户端对象
     */
    getRedisClient(){return this.redisClient;}
    /**
     * 返回redis的链接配置信息
     */
    getRedisConfig(){return config.redisConnections;}
    /**
     * 
     * @param {*} dbPosition 
     */
    initClient(dbPosition){
        console.log('redis config is:'+JSON.stringify(config.redisConnections));
        this.dbPosition = dbPosition;
        this.redisClient = redis.createClient(config.redisConnections);
        this.redisClient.select(dbPosition);
        this._redisCo = wrapper(this.redisClient);
        this.messageProcessHandler = [];
        //redis连接错误
        this.redisClient.on('error', function (err) {
            console.log(err);
        });
    }
    
    getDbIndex(){
        return  this.dbPosition ;
    }
    ///订阅键值过期消息消息
    subscribe(channel,messageHandler){
        let _instance = this;
        this.redisClient.subscribe(channel);
        if (messageHandler) this.messageProcessHandler[channel] = messageHandler;
        
        this.redisClient.on("message", function (channel, message) {
            console.log("我接收到信息了" + message);
            if (_instance.messageProcessHandler[channel]){
                _instance.messageProcessHandler[channel].call(_instance,message);
            }
        });
        this.redisClient.on("subscribe", function (channel, count) {
            console.log("client subscribed to " + channel + "," + count + "total subscriptions");
        });
    }
    /**
     * 退出redis,取消监听
     * @param {*} channel 
     */
    quit(channel){
        if (this.redisClient){
            if (channel) this.redisClient.unsubscribe(channel)
            this.redisClient.quit();
        }
    }
    /*
    * 删除key
    */
    delete(key){
        return  this._redisCo.del(key);
        
    }
    /*
    * 对key设置过期时间
    */
    expire(key,second){
        return  this._redisCo.expire(key, second);
    }

    ///设置Redis的单个Key值
    set(key, value, expire) {
        //if (expire && expire < 1) return Promise.reject(new Error("过期时间不能小于一秒"));
        let serilizeValue = typeof(value)=="string"?value:JSON.stringify(value);
        if (!expire) return  this._redisCo.set(key, serilizeValue);
        return  this._redisCo.setex(key, expire, serilizeValue)
    }
    /**获取redis string */
    get(key) {
        return this._redisCo.get(key);
    }
    
    //自动增长
    increase(key,step=1) {
        return this._redisCo.incrby(key,step);
    }
    //自动增长
    decrease(key,step=1) {
        return  this._redisCo.decrby(key,step);
    }
    ///设置redis hash
    hmset(key, ...args) {
        return  this._redisCo.hmset(key, ...args);
    }
    ///获取redis hash
    hmget(key, ...args) {
        return this._redisCo.hmget(key,...args);
    }
    /**
     * 设置MapSet的值
     */
    hset(key,field,object){

        return this._redisCo.hset(key,field,typeof(object)=="string"?object:JSON.stringify(object));
    }
    /**
     *  清空当前数据
     */
    flushDB(){
        return this._redisCo.flushdb();
    }
    /**
     * 获取当前DB的key de 大小
     */
    getDBSize(){
        return this._redisCo.dbsize();
    }
    /**
     * 获取MapSet中的一个键值
     * @param {*} key 
     * @param {*} field 
     */
    hget(key,field){
        return this._redisCo.hget(key,field);
    }
    // ///获取redis hash 子值
    // hmgetsub(key, smallkey) {
    //     return this._redisCo.hget(key, smallkey);
    // }
    ///删除整个HASH或子值
    hdel(key, field) {
        return this._redisCo.hdel(key, field);
    }
    /**
     * 获取一个hash表下的所有类型
     * @param {*} key 
     * @param {*} type  type=0，返回key value对  type=1 仅返回key  type=2 金返回value
     */
    hgetall(key,type=0){
        if(type==0) return this._redisCo.hgetall(key);
        if (type==1) return this._redisCo.hkeys(key);
        if (type==2) return this._redisCo.hvals(key);
    }

    ///添加ordered set 有序集合
    setOSValue(key,score,value){
        if(typeof(value)=="object"){
            console.log('set value is object');
            return  this._redisCo.zadd(key,score,JSON.stringify(value));
        }
        return  this._redisCo.zadd(key,score,value);
    }
    getOSValueDesc(key,maxScore,minScore){//,limitCount,offset,count){
        return  this._redisCo.zrevrangebyscore(key,maxScore || '+inf' ,minScore || '-inf');
    }
    getOSLength(key){
        return  this._redisCo.zcard(key);
    }
    /*
    * 获取到值在order set中的分数
    */
    getOSScore(key,value){
        if(typeof(value)=="object"){
            console.log('value is object');
            return  this._redisCo.zscore(key,JSON.stringify(value));
        }
        return  this._redisCo.zscore(key,value);
    }
    /*
    * 递增某个项的值
    * */
    increaseOSScore(key,value,increaseValue){
        if(typeof(value)=="object"){
            console.log('value is object');
            return  this._redisCo.zincrby(key,increaseValue,JSON.stringify(value));
        }
        return   this._redisCo.zincrby(key,increaseValue,value);
    }
     ///从list对象中获取一个元素
     poplistValue(key){
        return  this._redisCo.lpop(key);
    }
    ///设置List
    setlistValue(key,value,direction='left'){
        let realvalue = typeof(value)=="object"?JSON.stringify(value):value;
        if (direction.toLowerCase()==="left" ||  direction.toLowerCase()==="l") 
            return  this._redisCo.lpush(key, realvalue);
        return  this._redisCo.rpush(key, realvalue);
    }
    ///获取List
    getlistValue(key,startPosition,endPosition=-1,jsonFormat=true){
        if (jsonFormat==true)
            return this._redisCo.lrange(key,startPosition,endPosition)
                .then(result=>{
                    let retObject = [];
                    result.forEach(element => {
                        retObject.push(JSON.parse(element))
                    });
                    return Promise.resolve(retObject);
                });
        else
            return  this._redisCo.lrange(key,startPosition,endPosition);
    }
    ///获取List 长度
    getlistLength(key){
        return  this._redisCo.llen(key);
    }
    /**
     * 批量执行
     * @param {*} param 
     */
    batch(param,cb){
        return  this.redisClient.multi(param).exec(cb);
    }   
    
}
module.exports = RedisUtil;

