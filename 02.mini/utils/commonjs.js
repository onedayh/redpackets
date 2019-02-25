import UserUtil from './user.js'

export default class commonjs {
    /*格式化字符，类似于C# String.Format */
    static format() {
        var str = arguments[0];
        if (typeof (str) == "undefined" || str == null || str == '' || str == 'undefined') return str;
        for (var i = 1; i < arguments.length; i++) {
            var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
            str = str.replace(re, arguments[i]);
        }
        return str;
    }

    /**
     *判断对象是否为空或空字符串
     */
    static isNullOrEmpty(sourceValue) {
        if (typeof (sourceValue) == "undefined" || sourceValue == null || sourceValue == '' || sourceValue == 'undefined') return true;
        return false;
    }

    /**
     * 检查对象是否为空，如果为空则返回默认
     */
    static checkValue(sourceValue, nullValue) {
        if (typeof (sourceValue) == "undefined" || sourceValue == null || sourceValue == '' || sourceValue == 'undefined') return nullValue;
        return sourceValue;
    }

    /**
     * 检测对象是否为方法
     */
    static isfunction(fun) {
        return typeof fun === 'function';
    }

    /**
     * 检查对象是否为空对象
     */
    static isEmpty(obj) {
        if (typeof obj == 'object') {
            var name
            for (name in obj)
                return false
            return true
        } else if (obj === null || obj === undefined || obj === 'null' || obj === 'undefined' || obj === '')
            return true
        return false
    }

    /**
     * 替换字符串中的关键字信息
     */
    static replaceKeyword(str, keys) {
        if (this.isEmpty(str)) return str;
        var keywords = keys || {};
        ///定义正则准备查找sql中的特定关键字
        var matched = str.match(/{.*?}/g);
        if (!matched || matched.length <= 0) return str;
        let userinfo = UserUtil.getUser();
        matched.forEach(ele => {
            var matchValue = ele.substring(1, ele.length - 1);
            if (this.isEmpty(matchValue)) return str.replace(ele, '');
            var keyValue = keywords[matchValue];
            ///页面的关键字里面没有设置当前的key
            ///则使用用户对象中的属性来替换关键字
            if (this.isEmpty(keyValue) && userinfo) {
                ///用系统的关键字来匹配
                switch (matchValue.toLowerCase()) {
                    case "username":
                        keyValue = userinfo.nickName;
                        break;
                    ///陆续添加
                }
            }
            str = str.replace(ele, this.checkValue(keyValue, ''));
        });
        return str;
    }

    /**
     * 生成一串GUID格式的序列码
     */
    static uuid() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
    }

    // canvas绘制圆形图
    static circleImg(ctx, img, x, y, r){
        ctx.save();
        ctx.beginPath();
        const d = 2 * r,
            cx = x + r,
            cy = y + r;
        ctx.arc(cx, cy, r, 0, 2 * Math.PI);
        ctx.clip();
        ctx.drawImage(img, x, y, d, d);
        ctx.restore();
    }

    static startWith(str,prix) {
        return (str.substr(0, prix.length) === prix);
    }

    static timeToTimestamp(time = ''){
        let date = null;
        if(time){
            // ios端 只识别 2019/1/18的日期格式
            time = time.replace(/-/g, '/');
            date = new Date(time)
        }else{
            date = new Date()
        }
        return Date.parse(date) / 1000
    }

    static formatNum(num){
        num = num.toString();
        return num[1] ? num : `0${num}`
    }

    // 生成1-max的随机整数
    static getRandomOne(max){
        return Math.floor(Math.random() * max) + 1
    }

    // 生成0-max的随机整数
    static getRandomZero(max){
        return Math.floor(Math.random() * (max + 1));
    }

    // 生成min-max的随机整数
    static getRandom(min, max){
        return Math.floor(Math.random() * (max - min + 1) + min);
    }
}