$(function () {

    // 用户登录状态判断
    let havephone = $.cookie('phoneNum');
    if (havephone) {
        $('.weluser').html('欢迎' + havephone).css({
            'display': 'block'
        });
        $('.quit').css({
            'display': 'block'
        });
        $('.toLogin').css({
            'display': 'none'
        });
        $('.toReg').css({
            'display': 'none'
        });
    } else {
        $('.weluser').html('').css({
            'display': 'none'
        });
        $('.quit').css({
            'display': 'none'
        });
        $('.toLogin').css({
            'display': 'block'
        });
        $('.toReg').css({
            'display': 'block'
        });
    }

    // 用户退出
    $('.quit').click(function () {
        $.cookie('phoneNum', '', {
            expires: -1,
            path: '/'
        });
    });

    // 购物车数量 
    $.ajax({
        type: 'post',
        url: 'api/cart_init.php',
        data: {
            'phone': havephone
        },
        success: function (str) {
            let arr = JSON.parse(str);
            $('.cartNum span').html(arr.length);
        }
    });


    // sidebar 触摸移出，点击出现对应框
    $('.showright s').mouseenter(function(){
        $(this).parent().css({'left' : '-63px'});
    });
    $('.showright s').mouseleave(function(){
        $(this).parent().css({'left' : '0px'});
    });
    $('.showright span').mouseenter(function(){
        $(this).parent().css({'left' : '-63px'});
    });
    $('.showright span').mouseleave(function(){
        $(this).parent().css({'left' : '0px'});
    });

    // 购物车侧栏出现/消失
    $('.showcartbar span').click(function(){
        $('.sidequan').css({'width' : '256px'});
    });
    $('.emclose').click(function(){
        $('.sidequan').css({'width' : '2px'});
    });

    // 微信码 出现/消失
    $('.weiwei s').mouseenter(function(){
        $('.sina91_wechat').css({'display' : 'block'});
    });
    $('.weiwei s').mouseleave(function(){
        $('.sina91_wechat').css({'display' : 'none'});
    });
    



    // 购物车侧栏数据渲染
    if(havephone){
        let init = new Promise(function(resolved){
            $.ajax({
                type : 'post',
                url : 'api/cart_init.php',
                data : {'phone' : havephone},
                success : function(str){
                    resolved(str);
                }
            });
        });
        init.then(function resolved(data){
            let arr = JSON.parse(data);//用户的所有商品
            arr.forEach(function(item){
                $.ajax({
                    type : 'post',
                    url : 'api/cart_init.php',
                    data : {'goodsid' : item.goodsid},
                    success : function(str){
                        let sinarr = JSON.parse(str);
                        let html = `<div class="proitem" data-good="${sinarr.goodsid}">
                                        <div class="iteclo"></div>
                                        <div class="prolef fl"><a href="html/details.html?goodsid=${sinarr.goodsid}" title="${sinarr.introduce}" target="_blank">
                                        <img src="img/tabs_img/${sinarr.images}"></a></div>
                                        <div class="linedis mart3 fl"><a href="###" target="_blank" title="${sinarr.introduce}">${sinarr.introduce}</a></div>
                                        <div class="linedis fl">单价：¥<font>${sinarr.goodprice}.00</font></div>
                                        <div class="linedis mart3 fl">
                                            <div class="wrap-input1510"><a class="btn-reduce fl" href="javascript:;"></a><input name="number" class="sumtext fl" value="${item.num}"><a class="btn-add fl" href="javascript:;"></a> </div>
                                            <div class="sum1510 fl">¥${item.allprice}</div>
                                        </div>	
                                    </div>`;
                        $('.sidebar_pro').prepend(html);
                        numAndToal();
                    }
                });
            });
            if(arr.length > 0){
                $('.jiannum').html(arr.length);
                $('.showcartbar span').html('购物车' + arr.length + '件');
                $('#number1daohang').html('（' + arr.length + '件）');
            }else{
                $('.jiannum').html(0);
            }
        });
    }

    // 点击删除商品
    $('.sidebar_pro').on('click','.iteclo',function(){
        let res = confirm('您确实要把该商品移出购物车吗？');
        if (res) {
            $(this).parent().remove();
            let userphone = $.cookie('phoneNum');//用户手机号
            let good = $(this).parent().data('good');
            $.ajax({
                type : 'post',
                url : 'api/delete.php',
                data : {
                    'phone' : userphone,
                    'goodsid' : good
                }
            });
        }
    });


    // 计算总数量和总价格
    function checkedRows(){
        //判断checked序列，保存其下标 -- arr
        let arr = [];
        $('.proitem').each(function(i,item){
            arr.unshift(i);
        });
        // 降序
        arr.sort(function (a, b) {
            return b - a;
        });
        return arr;
    }
    function numAndToal() {
        let arr = checkedRows();
        console.log(arr)
        // 计算总数量和总价格
        let sum = 0;
        let allmon = 0;
        arr.forEach(function(i){
            sum += $('.sumtext').eq(i).val()*1;
            allmon += $('.sum1510').eq(i).text().slice(1) * 1;
        });
        $('#numberdaohang').html('购物车内共' + arr.length + '件商品');
        $('#pricedaohang').html(allmon.toFixed(2) + '元');
    }
    

    // 回到顶部
    $('.gobacktop').click(function(){
        document.body.scrollTop = document.documentElement.scrollTop = 0;
    });


});