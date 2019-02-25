
class Alloc {
    static randAllocRedBag(amount,total,min,max){
        //let redisConfig = instance._redis.getRedisConfig();
        return new Promise(resolve=>{
            let remainTotal = Math.trunc(amount * 100),     ///剩余需要分配的钱
                remainCnt	= total,            ///还有多少个红包需要分配
                allocItem   = {},               ////每次分配到的数据
                seqid       = 1;                ///分配到的序号
            let result      = [];                ///最终分配出来的结果集
            //console.log('redis-stream-info',redisConfig);
            //let rs = new redisstream(redisConfig.port,redisConfig.host,redisConfig.db,redisConfig.auth_pass);
            //let pushStream = rs.stream('lpush',redlistKey);
            let alloc = 0;
            while(remainCnt>0 && remainTotal>(min?min:0)){
                let bonus 	= Alloc.allocFunc(remainTotal,remainCnt,min,max);
                remainTotal = Math.trunc(remainTotal-bonus);
                remainCnt--;
                allocItem = {id:seqid++,money:Math.floor(bonus)/100};
                alloc+=bonus;
                //pushStream.write(JSON.stringify(allocItem));
                result.push(allocItem)
            };
            resolve({successed:true,result,total:Math.floor(alloc)/100})
        })
    }
    
    static allocFunc(remainAmount,remainCount,min,max){
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
        let maxBouns=max?max:(remainAmount / remainCount) * 2 - 1;
        let minBouns=min?min:1;
        boundrange = rand*(maxBouns - minBouns);
        return Math.trunc(minBouns + boundrange);
    }
}
exports = module.exports = Alloc;