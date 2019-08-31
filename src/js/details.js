$(function(){
     
    // 放大镜效果
    // 鼠标移入移出 hover()
    $('.small').hover(function(){
        $('.big').css('display','block');
        $('.mask').css('display','block');
    },function(){
        $('.big').css('display','none');
        $('.mask').css('display','none');
    }).mousemove(function(ev){
        // 算出鼠标在遮罩中心时遮罩的left、top值
        var x = ev.pageX - $('.small').offset().left - $('.mask').width() / 2;
        var y = ev.pageY - $('.small').offset().top - $('.mask').height() / 2;

        // 限制遮罩范围
        if(x < 0){
            x = 0;
        }else if(x > $('.small').width() - $('.mask').width()){
            x = $('.small').width() - $('.mask').width();
        }
        if(y < 0){
            y = 0;
        }else if(y > $('.small').height() - $('.mask').height()){
            y = $('.small').height() - $('.mask').height();
        }
        // 遮罩位置
        $('.mask').css({
            'left' : x + 'px',
            'top' : y + 'px'
        });

        // 放大镜比例系数
        var scalX = ($('.big img').width() - $('.big').width()) / ($('.small').width() - $('.mask').width());
        var scalY = ($('.big img').height() - $('.big').height()) / ($('.small').height() - $('.mask').height());

        // 大图的位置
        $('.big img').css({
            'left' : -scalX * x + 'px',
            'top' : -scalY * y + 'px'
        });
    });

    // 未登陆状态 -- 设cookie,点击  登陆  按钮，保存路径
    $('.toLogin').click(function(){
        $.cookie('url',location.href,{expires : 1,path : '/'});
        location.href = 'login.html';
    });

    // 用户登录状态判断
    let havephone = $.cookie('phoneNum');
    if(havephone){
        $('.weluser').html('欢迎' + havephone).css({'display' : 'block'});
        $('.quit').css({'display' : 'block'});
        $('.toLogin').css({'display' : 'none'});
        $('.toReg').css({'display' : 'none'});
    }else{
        $('.weluser').html('').css({'display' : 'none'});
        $('.quit').css({'display' : 'none'});
        $('.toLogin').css({'display' : 'block'});
        $('.toReg').css({'display' : 'block'});
    }

    // 用户退出
    $('.quit').click(function(){
        $.cookie('phoneNum','',{expires : -1,path : '/'});
    });

    // 购物车数量 
    $.ajax({
        type : 'post',
        url : '../api/cart_init.php',
        data : {'phone' : havephone},
        success : function(str){
            let arr = JSON.parse(str);
            $('.cartNum span').html(arr.length);
        }
    });


    // 1.接受列表页传过来的goodsid
    let goodurl = decodeURI(location.search);
    var str = goodurl.slice(1);

    //参数转对象函数strToObj(str)
    function strToObj(str) {
        var obj = {};
        var newarr = str.split('&');
        newarr.forEach(function(item){
            var arrinner = item.split('=');
            obj[arrinner[0]] = arrinner[1];
        })
        return obj;
    }
    var obj = strToObj(str);

    // 2.根据接收到的goodsid在数据库里面找到对应id序列的信息
    let goods1 = new Promise(resolved => {
        $.ajax({
            type: 'get',
            url: '../api/getdata.php',
            data: 'goodsid=' + obj.goodsid,
            success: str => {
                resolved(str);
            }
        });
    });

    goods1.then(data => {
        let arr = JSON.parse(data);
        
        // 3.渲染商品详情信息
        let html1 = arr.map(item => {
            return `<p class="intro" data-kucun="${item.kucun}">${item.introduce}</p>
                    <p class="price">会员价 <span class="goodprice">￥<span>${item.goodprice}</span>.00</span> <span class="freesend">免邮</span></p>
                    <p class="titleintro">通用名： &nbsp;<span>${item.goodname}</span></p>
                    <p class="titleintro">生产产家： &nbsp;<span>${item.produce}</span></p>
                    <p class="titleintro">批准文号： &nbsp;<span>${item.approve}</span></p>
                    <p class="titleintro">规 &nbsp; &nbsp; &nbsp; 格： &nbsp;<span class="guige">${item.standards}<i></i></span></p>`; 
        }).join('');
        $('#detailinf_top').html(html1);


        // 4.遍历arr拿到arr.img字符串，渲染选项卡图片  id1_1.jpg&id1_2.jpg&id1_3.jpg&id1_4.jpg&id1_5.jpg
        arr.map(item => {
            let imgarr = item.img.split('&');//切割成数组
            let html2 = '';
            html2 = imgarr.map(aa => {//渲染图片选项卡
                return `<li>
                            <a href="">
                                <img src="../img/details_img/${aa}" height="60" width="60" alt="" />
                            </a>
                        </li>`;
            }).join('');
            $('#list').html(html2);//插入生成节点


            // 8.商品数量加减，实现价格跟着改变的效果
            // 商品 - 1
            $('.goodNumdis').click(function(){
                var texNum = $('.goodNumval').val().trim();
                if(texNum){//不为空
                    if(texNum > 1){
                        $('.goodNumval').val(--texNum);
                        let allprice = item.goodprice * texNum; 
                        $('.goodprice span').html(allprice);
                    }else{
                        $('.goodNumval').val(1);
                    }
                }else{
                    //如果为空，商品数量为1
                    $('.goodNumval').val(1);
                }
            });

            // 商品 + 1
            $('.goodNumadd').click(function(){
                var texNum = $('.goodNumval').val().trim();
                var goodsNum = $('.intro').data('kucun');//商品的库存量，按需求修改该值
                // 如果不为空
                if(texNum){
                    if(texNum < goodsNum){
                        $('.goodNumval').val(++texNum);
                        let allprice = item.goodprice * texNum;
                        $('.goodprice span').html(allprice);
                    }else{
                        $('.goodNumval').val(goodsNum);;
                    }
                }else{
                    //如果为空，商品数量为1
                    $('.goodNumval').val(1);
                }
            });

            // 数量框输入数值计算总价
            $('.goodNumval').blur(function(){
                let val = $(this).val();
                var goodsNum = $('.intro').data('kucun');
                if(val >= goodsNum){
                    val = goodsNum;
                }else if(val <= 1){
                    val = 1;
                }
                $('.goodNumval').val(val);
                $('.goodprice span').html(item.goodprice*val);
            });
    
        }).join('');

        // 5.选项卡初始化
        let len = $('#list>li:eq(0)>a>img').attr('src');
        $('.small>img').attr({'src' : len});
        $('.big>img').attr({'src' : len});
        $('#list>li:eq(0)').css({'border-color' : '#FF9696'});

        // 6.抚摸选项卡，图片和高亮切换
        $('#list').on('mouseover','img',function(){
            let mouseoverimg = $(this).attr('src');
            $('.small>img').attr({'src' : mouseoverimg});
            $('.big>img').attr({'src' : mouseoverimg});
            $(this).parent().parent().css({'border-color' : '#FF9696'}).siblings().css({'border-color' : '#ccc'});
        });

        $('#list li').each(i => {
            // console.log(i);
        });

        // 7.点击上下按钮，选项卡移动
        // 下一张
        $('#next').click(function(){
            
        });
        // 上一张
        $('#prev').click(function(){

        });

        



    });





    // 立即购买 -> 跳转购物车页面，将商品信息goodsid、数量、价格传递过去
    // 结算 -> 判断用户是否登陆状态  cookie查找userid是否在后台
    // 加入购物车 -> 出现加入购物车成功提示框，商品信息加入数据库

    // 1.点击立即购买，判断用户登录状态
    // 已登录 -> 购物车，未登录 -> 登录弹窗
    
    $('.buyitnow').click(function(){
        function addCart(){
            let haveBeLogin = $.cookie('phoneNum');//用户手机号码
            let nowurl = location.href;
            let urlarr = nowurl.split('=');
            let goodsid = urlarr[1];//商品id
            let goodnum = $('.goodNumval').val();//数量
            let all = $('.goodprice span').html();//总价格
            let kucun = $('.intro').data('kucun');//库存
            if(haveBeLogin){//已登录
                $.ajax({
                    type : 'post',
                    url : '../api/cart.php',
                    data :{
                        'phone': haveBeLogin,
                        'goodsid' : goodsid,
                        'num' : goodnum,
                        'allprice' : all,
                        'kucun' : kucun
                    },
                    success : function(str){
                        console.log(str);
                        if(str == 'yes'){
                            // 去购物车页面
                            window.open('cart.html');
                        }else{
                            alert('加入购物车失败！')
                        }
                    }
                });
            }else{//未登录：出现登录弹窗
                $('.nwadd_bla').css({'display' : 'block'});
                $('.mem_logbox').css({'display' : 'block'});
            }
        }
        addCart();
    });
    

    // 2.点  x   关掉弹窗
    $('.clox').click(function(){
        $('.nwadd_bla').css({'display' : 'none'});
        $('.mem_logbox').css({'display' : 'none'});
    });
    $('.hd_colse_btn').click(function(){
        $('.nwadd_bla').css({'display' : 'none'});
        $('#popGeneral').css({'display' : 'none'});
    });

    

    // 点击 加入购物车 
    $('.addtoshop').click(function(){
        let haveBeLogin = $.cookie('phoneNum');//用户手机号码
            let nowurl = location.href;
            let urlarr = nowurl.split('=');
            let goodsid = urlarr[1];//商品id
            let goodnum = $('.goodNumval').val();//数量
            let all = $('.goodprice span').html();//总价格
            if(haveBeLogin){//已登录
                $.ajax({
                    type : 'post',
                    url : '../api/cart.php',
                    data :{
                        'phone': haveBeLogin,
                        'goodsid' : goodsid,
                        'num' : goodnum,
                        'allprice' : all
                    },
                    success : function(str){
                        console.log(str);
                        if(str == 'yes'){
                            // 去购物车页面
                            // window.open('cart.html');
                            console.log(666);
                            $('.nwadd_bla').css({'display' : 'block'});
                            $('#popGeneral').css({'display' : 'block'});
                        }else{
                            alert('加入购物车失败！')
                        }
                    }
                });
            }else{//未登录：出现登录弹窗
                $('.nwadd_bla').css({'display' : 'block'});
                $('.mem_logbox').css({'display' : 'block'});
            }

        // 继续购物
        $('.hd_btn_l').click(function(){
            $('.nwadd_bla').css({'display' : 'none'});
            $('#popGeneral').css({'display' : 'none'});
        });

        // 查看购物车
        $('.hd_btn_r').click(function(){
            $('.nwadd_bla').css({'display' : 'none'});
            $('#popGeneral').css({'display' : 'none'});
            
        });
    });
    










});