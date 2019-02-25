
var express = require('express');
var path = require('path');
var morgan = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

require('body-parser-xml')(bodyParser);
var LiteCoder = require('./core/framework');
// var fs = require('fs');
//  var ejs = require('ejs');
//  var expressLayouts = require('express-ejs-layouts');
var app = express();


//设置跨域访问
app.all('*', function (req, res, next) {
    //res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By", '3.2.1')
    //res.header("Content-Type", "application/json;charset=utf-8");
    if (req.method == "OPTIONS")
        res.status(200).end();
    else
        next();
});


app.use(express.static(__dirname + '/public'))

app.use(morgan('dev'));
// 解决微信支付通知回调数据

app.use(bodyParser.xml({
    limit: "1mb",   // Reject payload bigger than 1 MB
    xmlParseOptions: {
        normalize: true,     // Trim whitespace inside text nodes
        normalizeTags: true, // Transform tags to lowercase
        explicitArray: false // Only put nodes in array if >1
    },
    verify: function (req, res, buf, encoding) {
        if (buf && buf.length) {
            // Store the raw XML
            console.log("bodyParser verify")
            req.rawBody = buf.toString(encoding || "utf8");
        }
    }
}));

app.use(bodyParser.json({ limit: '200mb' }));
app.use(bodyParser.urlencoded({ limit: '200mb', extended: false }));
app.use(cookieParser());


app.get('/favicon.ico', function (req, res) { res.end(); });



///启动框架
var framework = new LiteCoder(app);//, require('./provider/authoricateProvider'));

// var _redisHelper1 = new redisHelper(13);
// _redisHelper1.set("key:grouporder:erweiuweruiwer:121","key:grouporder:erweiuweruiwer:121",10);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});



// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function (err, req, res, next) {
        res.status(err.status || 500);
        return res.end(err.message);
        // return res.render('error', {
        //     message: err.message,
        //     error: err
        // });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    return res.end(err.message);
    // return res.render('error', {
    //     message: err.message,
    //     error: {}
    // });
});




module.exports = app;
