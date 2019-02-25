var express = require('express');
var moment = require('moment');
var co = require('co');
var jwt = require('jwt-simple');
var svgCaptcha = require('svg-captcha');
var uuid = require('node-uuid');
var config = require('../core/configuration/frameworkConfig');
var userCache = require('../core/utilities/cacheUtility');
var apiResult = require('../core/result/actionResult.js');
var authoricateProvider = require('../provider/authoricateProvider');
var router = express.Router();

/*
*  简单的登录接口，取消了验证码的内容
*/
router.post('/simplelogin', function (req, res) {
    co(authoricateProvider.validateUser(req.body.username, req.body.password))
        .then(function (result) {
            ///登录成功,返回调用的Token给客户端    
            if (result.successed) {
                var expires = moment().add(7, 'days').valueOf();
                var token = jwt.encode({ iss: result.user.id, exp: expires }, config.getSetting('TokenCryptKey'));
                ///save user to cache
                console.log('user token:' + token);
                userCache.setUser(token, result.user);
                result.token = token;
                result.exp = expires;
            }
            res.json(result);
        })
        .catch(result => {
            res.json(result);
        });
});


router.get('/serial', function (req, res) {
    var captcha = svgCaptcha.create();
    let key = uuid.v4();
    userCache.setVerifyCode(key, captcha.text.toUpperCase()).then(result => {
        res.json({ successed: true, key: key, code: captcha.data });
    }).catch(err => {
        res.json({ successed: false });
    });
})


module.exports = router;