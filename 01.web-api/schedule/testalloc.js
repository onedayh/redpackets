var co 					= require('co');
var alloc			    = require('./alloc');
co(function*(){
    let result =yield alloc.randAllocRedBag(2000,1200,130,210);
    let total = 0;
    result.result.forEach(element => {
        console.log('element',element)
        total+=element.money;
    });
    console.log('result',result.total,total.toFixed(2));
})