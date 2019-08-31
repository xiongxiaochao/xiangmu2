/* 
    公共函数库
*/

 
/*   1、randomNum()编写生成4位数字验证码的函数，并显示在页面，点击重新生成验证码
        参数：无
        返回值：四位数随机数（数字）
*/
   
// function randomNum(){//2声明
//     var html = '';  //存字符串

//     for(var i = 0; i < 4; i++){  //4位数，4次循环
//         html += parseInt(Math.random() * 10);  //随机产生 0~9
//     }
//     return html;  //把结果返回入口
// }
// var num = randomNum();  //1入口；3会有返回值，存起来使用；按此形式直接调用


/*
    1.封装一个函数randomNum()，实现任意输入两个数，随机输出这两个数之间的数
        形参：min,max
        返回值：min和max之间一个任意值
 */ 
function randomNum(min,max){
    // parseInt(Math.random() * 10);//0 - 9
    var res = parseInt(Math.random() * (max - min) + min);//0 - 1(取不到1)  //min - (max - min + min)
    return res;
}


/*  2、randomCode()生成n位随机验证码，为数字字母组合
        参数：n   //n为所需生成的随机数个数
        返回值：n位随机数(数字+字母)
*/

function randomCheckCode(n){
    // 随机验证码
    var html = '1234567890qwertyuiopasdfghjjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    var num = '';  //存四位数

    for(var i = 0; i < n; i++){
        //随机数下标的范围  0~html.length-1
        var now = parseInt(Math.random() * html.length);
        num += html[now];   //用数组的方式取字符串第xx个值
    }
    return num;   //把结果返回入口
}

// 随机生成n位数字验证码
function randomNumCode(n){
    // 随机验证码
    var html = '1234567890';
    var num = '';  //存四位数

    for(var i = 0; i < n; i++){
        //随机数下标的范围  0~html.length-1
        var now = parseInt(Math.random() * html.length);
        num += html[now];   //用数组的方式取字符串第xx个值
    }
    return num;   //把结果返回入口
}


/*   3、ranFun封装一个得到1-100随机整数的函数
        参数：无
        返回值：1-100里的一个随机数
*/

function ranFun(){
    var num = parseInt(Math.random() * 100) + 1;
    console.log(num);
    return num;  //将结果返回入口
}



/*   4、函数factorial()实现任意数字阶乘的计算
        参数：num
        返回值：阶乘的结果sum
 */ 

function factorial(num){
    var sum = 1;//阶乘后的结果

    for(var i = 1; i <= num; i++){
        sum *= i ; //累乘
    }
    return sum;//将结果返回到入口
}


/*
    5、计算任意两个数字的加减乘除
        参数：a,b
        返回值：计算的结果sum
 */
function Add(a , b){
    var texNum1 = a - 0;
    var texNum2 = b - 0;

    var sum = texNum1 + texNum2;
    return sum;
}
function Sub(a , b){
    var texNum1 = a;
    var texNum2 = b;

    var sum = texNum1 - texNum2;
    return sum;
}
function Mul(a , b){
    var texNum1 = a;
    var texNum2 = b;

    var sum = texNum1 * texNum2;
    return sum;
}
function Div(a , b){
    var texNum1 = a;
    var texNum2 = b;

    var sum = texNum1 / texNum2;
    return sum;
}


/*
    6、Table()封装生成表格函数，根据输入的行或列得到一个表格
        参数：a,b
        返回值：表格
 */ 
function Table(a,b){
    var html = '';  //定义字符串空间

    for(var i = 1 ; i <= a; i++){
        html += '<tr>';
        for(var j = 1; j <= b; j++){
        // html += '<td>单元格</td>';
        html += '<td>第' + i + '行第' + j + '列</td>';
        }
        html += '</tr>';
    }
    return html;
}

/*
    7.封装StrToObj()函数：实现将网址参数字符串str部分传入，json输出
        参数：str
        返回值：obj
 */
function StrToObj(str){
    var arr = str.split('&');//切割成数组["name=malin", "psw=456123"]
    var obj = {};//准备一个空的对象
    arr.forEach(function (item, i){
        var innerarr = item.split('=');//切割提取所需参数                    
        obj[innerarr[0]] = innerarr[1];//json  键：键值                    
    });
    // console.log(obj);
    return obj;
}

/*
    8.需求：将上面的对象转成参数的形式：name=xiaolin&pwd=123456
        参数：obj
        返回值：str
 */
function ObjToStr(obj){
    var html = '';//准备一个空字符串
    //遍历对象obj
    for(var key in obj){
        html += key + '=' + obj[key] + '&';
    }
    return html.slice(0,-1);//取片段，去掉最后一个&
}


/*
    9.封装过滤敏感词的函数filter()
        形参：str
        返回值：str（敏感词过滤后）
 */
function filter(str){//输入字符串
    //过滤敏感词
    var arr = ['fuck','妈蛋','操','法轮功','反清复明','金三胖','去死','MMP'];//需要过滤的敏感词用数组装着
    arr.forEach(function (item){//遍历敏感词数组
        var reg = new RegExp(item,'gi');//正则构造函数，g全局变量，i忽略大小写
        str = str.replace(reg,'***');//检查到的敏感词用***替换
    });
    return str;
}

/*
    10.加零函数 toDb()：做限时购显示  xx天xx时xx分xx秒  或 电子钟  2019-04-01  09:30:01
        参数：month或day或hours或mins或secs
        返回值：加了0的同上
 */
function toDb(num){
    if(num < 10){
        return '0' + num;
    }else{
        return '' + num;
    }
}


/*
    11.毫秒数-->xx天xx时xx分xx秒（限时购）
        参数：开始时间starttime  到  结束时间endtime  之间的毫秒数（用纪元时间相减）
        返回值：包含了所需内容的一个json
 */
function setTime(time){
    var sec = time % 60;
    var min = parseInt(time / 60) % 60;
    var hour = parseInt(time / 60 / 60) % 24;
    var day = parseInt(time / 60 / 60 / 24);

    return {
        secs:sec,
        mins:min,
        hours:hour,
        days:day
    };
}


/*
    12.获取样式的方法(兼容高低版本浏览器)
        参数：ele（节点），cls（属性名）
        返回值：ele下的属性cls
 */ 
function getStyle(ele,cls){
    if(getComputedStyle(ele,false)){
        //高级浏览器
        return getComputedStyle(ele,false)[cls];
    }else{
        // 低版本  IE8-    
        return ele.currentStyle[cls];
    }
}


/*
    13.表单验证的方法：调用里面的子功能（json对象里面有很多子功能）
        var checkReg = {
            tel : function() {}
        }

    调用方法：
        checkReg.tel()
 */ 
var checkReg = {
            trim : function(str) {//去掉前后空格
                var reg = /^\s+|\s+$/g;
                return str.replace(reg,'');
            },
            tel : function(str){//号码
                var reg = /^1[0-9]\d{9}$/;
                return reg.test(str);
            },
            Fulltell : function(str){//比较全一点的号码要求
                var reg = /([1][358][0-9]{9})|([1][4][37][0-9]{8})|([1][7][01367])/;
                return reg.test(str);
            },
            email : function(str){//邮箱
                var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; //aa.ee@yi.com
                return reg.test(str);
            },
            idcard: function(str) { //身份证
                var reg = /^(\d{17}|\d{14})[\dX]$/;
                return reg.test(str);
            },
            psweasy: function(str) { //6-18位首字母开头
                var reg = /^[a-zA-Z]\w{5,17}$/;
                return reg.test(str);
            },
            pwwagain: function(str1, str2) { //确认密码
                return str1 === str2; //全等 恒等
            },
            urladr: function(str) { //路径：网址规则
                var reg = /[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?/;
                return reg.test(str);
            },
            name: function(str) { //账号字母开头,6-20位
                var reg = /^[a-zA-Z][\w\-]{5,19}$/;
                return reg.test(str);
            },
            chinese: function(str) { //中文
                var reg = /^[\u2E80-\u9FFF]+$/;
                return reg.test(str);
            },
            birthday: function(str) { //生日
                var reg = /^((((19|20)\d{2})-(0?[13-9]|1[012])-(0?[1-9]|[12]\d|30))|(((19|20)\d{2})-(0?[13578]|1[02])-31)|(((19|20)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|((((19|20)([13579][26]|[2468][048]|0[48]))|(2000))-0?2-29))$/;
                return reg.test(str);
            }
        }



/*
    运动框架封装：startMove()过渡    jq animate()
    最终版：多对象，多属性，链式运动框架(运动队列)
    参数一：对象名
    参数二：属性，目标值  键名：属性名，键值：目标值    {'width':200,'heigth':400}  实现：宽度和高度一起改变，宽度变成200，高度变成400
    参数三：回调函数(可选参数)
 */

function startMove(obj, json, fnend) {

    clearInterval(obj.timer); //防止定时器叠加
    obj.timer = setInterval(function() {

        var istrue = true;

        //1.获取属性名，获取键名：属性名->初始值
        for(var key in json) { //key:键名   json[key] :键值
            //          console.log(key); //width heigth opacity
            var cur = 0; //存初始值

            if(key == 'opacity') { //初始值
                cur = getStyle(obj, key) * 100; //透明度
            } else {
                cur = parseInt(getStyle(obj, key)); // 300px  300  width heigth borderwidth px为单位的

            }

            //2.根据初始值和目标值，进行判断确定speed方向，变形：缓冲运动
            //距离越大，速度越大,下面的公式具备方向
            var speed = (json[key] - cur) / 6; //出现小数
            speed = speed > 0 ? Math.ceil(speed) : Math.floor(speed); //不要小数部分，没有这句话或晃动

            //保证上一个属性全部都达到目标值了
            if(cur != json[key]) { //width 200 heigth 400
                istrue = false; //如果没有达到目标值，开关false
            } else {
                istrue = true; //true true
            }

            //3、运动
            if(key == 'opacity') {
                obj.style.opacity = (cur + speed) / 100;//0-1
                obj.style.filter = 'alpha(opacity:' + (cur + speed) + ')';//0-100
            } else {
                obj.style[key] = cur + speed + 'px'; //针对普通属性 left  top height 
            }

        }

        //4.回调函数:准备一个开关,确保以上json所有的属性都已经达到目标值,才能调用这个回调函数
        if(istrue) { //如果为true,证明以上属性都达到目标值了
            clearInterval(obj.timer);
            if(fnend) {//可选参数的由来
                fnend();
            }
        }

    }, 30); //obj.timer 每个对象都有自己定时器

}



/*
    深度拷贝：复制
        传参：obj      (可以是arr或obj)
        返回值：newobj      (传进来的是什么就返回什么)

    利用ES5中JSON的方法：(可能有兼容问题)
        JSON.stringify(obj)：将obj转换成标准格式的JSON字符串str
        JSON.parse(str)：将JSON字符串str转换成对象obj
 */ 

function cloneDeep(obj){
    var str = JSON.stringify(obj);
    var newobj = JSON.parse(str);

    return newobj;
}


/*
    封装css函数实现：
    能够获取元素的样式(行内和非行内)，还能设置元素的样式（行内）
*/ 

function css(){
    var ele = arguments[0];
    var attr = arguments[1];
    if(arguments.length == 2){
        // 获取样式
        // 获取样式的兼容处理
        if(getComputedStyle(ele, false)){
            // IE9+ 和 主流的浏览器
            return getComputedStyle(ele, false)[attr];
        }else{
            // 低版本IE:IE678
            return ele.currentStyle(attr);
        }
    }else if(arguments.length == 3){
        // 第3个位置写设置的样式
        var val = arguments[2];
        ele.style[attr] = val;//attr变量用[]拿到属性
    }
}


/*
    事件监听器的兼容处理，封装AddListener()函数
 */ 

// ele是元素，type是事件名(没有on的事件)，fn是回调函数
function AddListener(ele,type,fn){
    if(ele.addEventListener){
        // 存在，标准浏览器
        ele.addEventListener(type, fn, false);
    }else{
        // 低版本IE8-
        ele.attachEvent('on' + type, fn);
    }
}


/*
    阻止冒泡的兼容处理StopBubble(ev)  ev：元素对象
 */ 

function StopBubble(ev){
    if(ev.stopPropagation){
        // 存在，高级浏览器
        ev.stopPropagation();
    }else{
        // 低版本浏览器IE8-
        ev.cancelBubble = true;
    }
}


/*
    阻止浏览器的默认行为
 */ 

function StopAction(ev){
    if(ev.preventDefault){
        // 存在，高级浏览器
        ev.preventDefault();
    }else{
        // 低版本浏览器IE8-
        ev.returnValue = false;
    }
}



// ajax的两种封装

// 封装ajax
function ajax(type,url,data,fn){
    /*
        参数一：type 请求类型
        参数二：url 接口路径
        参数三：data可选  传输的数据(未加时间戳)
        参数四：成功的回调
    */ 

    let xhr = new XMLHttpRequest();//创建对象
    // 1.告诉ajax你要什么？判断type类型
    if(type.toLowerCase() == 'get') {
        //get请求
        if(data) {//有数据的情况下
            url += '?' + data;
        }
        xhr.open(type,url,true);
        xhr.send(null);//2.ajax帮你发送请求
    }else{
        // post请求
        xhr.open(type,url,true);
        xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');//设置发送头信息
        xhr.send(data);//2.ajax帮你发送请求
    }

    // 3.制作数据接口

    // 4.接收数据
    xhr.onreadystatechange = () => {
        if(xhr.readyState == 4) {//4页面内容解析完成
            if(xhr.status == 200) {//200：表示页面成功接收数据并返回页面
                // 成功接受数据
                if(fn) {
                    fn(xhr.responseText);//实参str
                }
            }else{//404 Not Found
                alert('错误http状态码是：' + xhr.status);
            }
        }
    }
}



// 封装ajax：json的形式
/*
    jq：ajax
    $.ajax({ //配置参数
        type : 'get',
        url : xxx,
        data : '',
        async : true,
        success : function(str) {

        }
    });
*/
// opt配置参数
function ajax2(opt){
    function extend(obj1,obj2) {
        for(var key in obj2) {
            obj1[key] = obj2[key];//有配置参数，就将 默认参数的值=配置参数的值，后面的defaults将会是配置参数
        }
    }

    // 默认参数
    var defaults = {
        async : true
    }

    // 后面使用默认参数
    extend(defaults,opt);

    let xhr = new XMLHttpRequest();//创建对象
    // 1.告诉ajax你要什么？判断type类型
    if(defaults.type.toLowerCase() == 'get') {
        //get请求
        if(defaults.data) {//有数据的情况下
            defaults.url += '?' + defaults.data;
        }
        xhr.open(defaults.type,defaults.url,defaults.async);
        xhr.send(null);//2.ajax帮你发送请求
    }else{
        // post请求
        xhr.open(defaults.type,defaults.url,defaults.async);
        xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');//设置发送头信息
        xhr.send(defaults.data);//2.ajax帮你发送请求
    }

    // 3.制作数据接口

    // 4.接收数据
    xhr.onreadystatechange = () => {
        if(xhr.readyState == 4) {//4页面内容解析完成
            if(xhr.status == 200) {//200：表示页面成功接收数据并返回页面
                // 成功接受数据
                if(defaults.success) {
                    defaults.success(xhr.responseText);//实参str
                }
            }else{//404 Not Found
                alert('错误http状态码是：' + xhr.status);
            }
        }
    }
}


// cookie的操作

// 存cookie
// key：键名；val：键值；iDay：失效时间
function setCookie(key,val,iDay){
    var now = new Date();//获取现在时间
    now.setDate(now.getDate() + iDay);//设置未来iDay天有效
    document.cookie = key + '=' + val + ';expires=' + now.toUTCString() + ';path=/';//设置一个站点内的文件可以共享此cookie
}

// 获取cookie值,key：键名
function getCookie(key){
    var cookies = document.cookie;//多个cookie值是用 ;+空格 隔开
    var arr = cookies.split('; ');//进行切割
    for(var i = 0;i < arr.length; i++) {
        var arr2 = arr[i].split('=');//['','']
        if(key == arr2[0]){//键名相同
            return arr2[1];//就返回键值
        }
    }
}

// 删除cookie：利用设置失效时间为过去的时间，立即失效
function removeCookie(key){
    setCookie(key,'',-1);
}

    /*
        id：轮播图可视区盒子
        cls：焦点图的样式class名
    */ 
// 切入切出
   function ImgMove(id,cls){
    /*
        利用moveStart运动框架将图片挪进挪出
     */ 
    
    // 找整个轮播图盒子的节点
    var box = document.getElementById(id);
    var lunboImg = box.children[0];//轮播图
    var light = box.children[1];//焦点图
    var imgBtn = box.children[2];//上下页

    var prevBtn = imgBtn.children[0];//上一页按钮
    var nextBtn = imgBtn.children[1];//下一页按钮

    var iw = lunboImg.children[0].offsetWidth;//轮播图可视区的宽度
    var now = 0;//当前图片下标

    // 1.初始化：第1张图放在可视区，其余图放在右边
    for(let i = 1;i < lunboImg.children.length; i++){
        lunboImg.children[i].style.left = iw + 'px';
    }

    // 2.自动轮播
    // var timer = null;
    // timer = setInterval(next,2000);


    //下一张
    function next(){
        // 旧图挪走
        startMove(lunboImg.children[now],{'left' : -iw});
        now++;
        if(now > lunboImg.children.length - 1){
            now = 0;
        }
        lunboImg.children[now].style.left = iw + 'px';//新图快速放在右边
        // 新图挪进
        startMove(lunboImg.children[now],{'left' : 0});
        lightmove();//焦点跟随
    }


    // 上一张
    function prev(){
        // 旧图挪走
        startMove(lunboImg.children[now],{'left' : iw});
        now--;
        if(now < 0){
            now = lunboImg.children.length - 1;
        }
        lunboImg.children[now].style.left = -iw + 'px';//新图快速放在左边
        // 新图挪进
        startMove(lunboImg.children[now],{'left' : 0});
        lightmove();//焦点跟随
    }

    // 3.隐藏功能：鼠标移入，停止定时器
    box.onmouseover = function(){
        // clearInterval(timer);
        imgBtn.style.display = 'block';
    }
    // 鼠标移出，开启定时器
    box.onmouseout = function(){
        // timer = setInterval(next,2000);
        imgBtn.style.display = 'none';
    }


    // 4.渲染焦点并焦点跟随
    var html = '';
    for(var i = 0; i < lunboImg.children.length; i++){
        html += `<span></span>`;
    }
    light.innerHTML = html;
    light.children[0].className = cls;

    // 焦点跟随
    function lightmove(){
        // 排他
        for(var j = 0; j < light.children.length; j++){
            light.children[j].className = '';
        }
        light.children[now].className = cls;
    }

    // 5.点击上下页按钮实现上下页切换
    prevBtn.onclick = function(){
        prev();
    }
    nextBtn.onclick = function(){
        next();
    }

    // 6.点击焦点，可视区切换对应图片
    for(let k = 0;k < light.children.length; k++){
        light.children[k].onclick = function(){
            if(k > now){
                // 旧图往左边挪走
                startMove(lunboImg.children[now],{'left' : -iw});
                // 新图快速放在右边
                lunboImg.children[k].style.left = iw + 'px';
            }
            if(k < now){
                // 旧图往右边挪走
                startMove(lunboImg.children[now],{'left' : iw});
                // 新图快速放在左边
                lunboImg.children[k].style.left = -iw + 'px';
            }
            // 新图挪进可视区
            startMove(lunboImg.children[k],{'left' : 0});
            now = k;//新图等于旧图
            lightmove();//焦点跟随
        }
    }

}

// 淡入淡出
function ImgShow(id,cls){

    /*
        淡入淡出---->利用框架moveStart()
     */ 

    // 找整个轮播图盒子的节点
    var box = document.getElementById(id);
    var lunboImg = box.children[0];//轮播图
    var light = box.children[1];//焦点图
    var imgBtn = box.children[2];//上下页

    var prevBtn = imgBtn.children[0];//上一页按钮
    var nextBtn = imgBtn.children[1];//下一页按钮
    var now = 0;//当前图片下标


    // 初始化：将所有照片放在可视区，按层级第1张在最上面(层级最高)
    for(let i = 0;i < lunboImg.children.length; i++){
        lunboImg.children[i].style.opacity = 0;
    }
    lunboImg.children[0].style.opacity = 1;
    

    // 2.自动轮播
    var timer = null;
    timer = setInterval(next,2000);


    //下一张
    function next(){
        // 旧图淡出
        startMove(lunboImg.children[now],{'opacity' : 0});
        now++;
        if(now > lunboImg.children.length - 1){
            now = 0;
        }
        // 新图淡入
        startMove(lunboImg.children[now],{'opacity' : 100});
        lightmove();//焦点跟随
    }


    // 上一张
    function prev(){
        // 旧图淡出
        startMove(lunboImg.children[now],{'opacity' : 0});
        now--;
        if(now < 0){
            now = lunboImg.children.length - 1;
        }
        // 新图淡入
        startMove(lunboImg.children[now],{'opacity' : 100});
        lightmove();//焦点跟随
    }

    // 3.隐藏功能：鼠标移入，停止定时器
    box.onmouseover = function(){
        clearInterval(timer);
    }
    // 鼠标移出，开启定时器
    box.onmouseout = function(){
        timer = setInterval(next,3000);
    }


    // 4.渲染焦点并焦点跟随
    var html = '';
    for(var i = 0; i < lunboImg.children.length; i++){
        html += `<span></span>`;
    }
    light.innerHTML = html;
    light.children[0].className = cls;

    // 焦点跟随
    function lightmove(){
        // 排他
        for(var j = 0; j < light.children.length; j++){
            light.children[j].className = '';
        }
        light.children[now].className = cls;
    }

    // 5.点击上下页按钮实现上下页切换
    prevBtn.onclick = function(){
        prev();
    }
    nextBtn.onclick = function(){
        next();
    }

    // 6.点击焦点，可视区切换对应图片
    for(let k = 0;k < light.children.length; k++){
        light.children[k].onclick = function(){
            if(k > now){
                // 旧图淡出
                startMove(lunboImg.children[now],{'opacity' : 0});
            }
            if(k < now){
                // 旧图淡出
                startMove(lunboImg.children[now],{'opacity' : 0});
            }
            // 新图淡入
            startMove(lunboImg.children[k],{'opacity' : 100});
            now = k;//新图等于旧图
            lightmove();//焦点跟随
        }
    }
}
