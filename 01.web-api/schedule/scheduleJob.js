const schedule = require('node-schedule');
const schedules = require("./schedule.json")

console.log("schedule start");


for (var i = 0; i < schedules.length; i++) {
    let item = schedules[i];
    schedule.scheduleJob(item.rule, require(item.service).execute);
}

//监听未捕获的异常
process.on('uncaughtException', function (err) {
    console.log(err.message);
});

//监听Promise没有被捕获的失败函数
process.on('unhandledRejection', function (err, promise) {
    console.log(err.message);
});
