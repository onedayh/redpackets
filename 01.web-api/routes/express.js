var express = require('express');
var router = express.Router();
var co = require('co');
var rpc = require('../core/rpc/rpcUtility');

router.use('/api/kdwlcx', function (req, res) {
    co(function* () {
        //返回来的XML数据，现在是以express4.X的返回数据为例子，实际中要以实际数据进行解析
        var no = req.body.no || req.query.no
        var url = "http://wuliu.market.alicloudapi.com/kdi?no=" + no;
        var appcode = "bd22fa7f734449f6a7a2944ea18cd9a8";
        let options = {
            method: 'get',
            url,
            json: true,
            headers: {
                'Authorization': "APPCODE " + appcode
            }
        };
        //httpRequest.Headers.Add("Authorization", "APPCODE " + appcode);
        return rpc.request(options)
            .then(result => {
                return res.send(result);
            })

    }).then(result => console.log(result))
        .catch(result => console.log(result));
});

module.exports = router;