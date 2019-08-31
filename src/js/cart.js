$(function(){

    // 顶部：显示用户登录的状态
    // 未登陆状态 -- 设cookie,点击  登陆  按钮，保存路径
    $('.toLogin').click(function(){
        location.href = 'login.html';
        $.cookie('url',location.href,{expires : 1,path : '/'});
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



    // 先在后台找到用户，找到 --> 根据用户id找出商品id --> 找到所有商品id的记录渲染
    // 找不到 --> 显示初始化界面

    // 购物车状态 -- 空 / 有商品
    function stage1(){
        $('#empty_cart').css({'display' : 'block'});
        $('#cart_list').css({'display' : 'none'});
        $('.nwcgo').css({'display' : 'none'});
        $('.nwadd_ctit').css({'display' : 'none'});
        $('.nwadd_ccon').css({'display' : 'none'});
    }
    function stage2(){
        $('#empty_cart').css({'display' : 'none'});
        $('#cart_list').css({'display' : 'block'});
        $('.nwcgo').css({'display' : 'block'});
        $('.nwadd_ctit').css({'display' : 'block'});
        $('.nwadd_ccon').css({'display' : 'block'});
    }

    // 1.判断登录状态 --> 已登录：显示该用户购物车中的所有商品
    let userphone = $.cookie('phoneNum');
    if(userphone){
        // 2.根据手机号码找到该手机号码下的所有商品
        let init = new Promise(function(resolved){
            $.ajax({
                type : 'post',
                url : '../api/cart_init.php',
                data : {'phone' : userphone},
                success : function(str){
                    resolved(str);
                }
            });
        });
        init.then(function(data){
            let arr = JSON.parse(data);//用户的所有商品
            // console.log(arr);
            if(arr.length > 0){
                stage2();
                // 3.遍历所有商品，逐条渲染
                arr.forEach(function(item){
                    // console.log(item);//单条商品记录
                    $.ajax({
                        type : 'post',
                        url : '../api/cart_init.php',
                        data : {'goodsid' : item.goodsid},
                        success : function(str){
                            let sinarr = JSON.parse(str);
                            // console.log(sinarr);//json对象  
                            let html = `<div class="nwc_item">
                                            <dl>
                                                <dd class="nwcwid01 chos">
                                                    <input type="checkbox" class="all sincheck" name="checkItem">
                                                </dd>
                                                <dd class="nwcwid02">
                                                    <a href="details.html?goodsid=${sinarr.goodsid}" target="_blank">
                                                        <img src="../img/tabs_img/${sinarr.images}" alt="${sinarr.goodname}">
                                                    </a>
                                                </dd>
                                                <dd class="nwcwid03">
                                                    <a href="details.html?goodsid=${sinarr.goodsid}" title="${sinarr.goodname}" target="_blank" class="f6">${sinarr.introduce}</a><br>&nbsp;<em class="cgui_ge">${sinarr.standards}</em>
                                                </dd>
                                                <dd class="nwcwid04 nwprif">¥<font>${sinarr.goodprice}.00</font>
                                                </dd>
                                                <dd class="nwcwid04">
                                                    <div class="nwquantity" data-id="${sinarr.goodsid}" data-price="${sinarr.goodprice}">
                                                        <a href="javascript:void(0);"  class="decrement"></a><input class="crement" data-kucun="${sinarr.kucun}" type="text" value="${item.num}" style="border:1px solid #ccc;"><a href="javascript:void(0);" class="increment"></a>
                                                    </div>
                                                </dd>
                                                <dd class="nwcwid04">省<span class="red nwprif">${sinarr.youhui}</span>元</dd>
                                                <dd class="nwcwid04 nwprif">${sinarr.weight}</dd>
                                                <dd class="nwcwid04 nwprif allmoney"><strong>￥${item.allprice}.00</strong></dd>
                                                <dd class="nwcwid01" data-good="${sinarr.goodsid}">
                                                    <a class="delete" href="javascript:void(0);">删除</a>
                                                </dd>
                                            </dl>
                                        </div>`;
                            $('.nwcpro_list').prepend(html);
                        }
                    });
                });
            }else{
                stage1();
            }
        });
    }else{
        stage1();
    }

    

    // 4.商品数量 - 1
    $('.nwcpro_list').on('click','.decrement',function(){
        let userphone = $.cookie('phoneNum');//用户手机号
        let id = $(this).parent().data('id');//商品id
        let price = $(this).parent().data('price');//商品单价
        let num = $(this).next().val();//商品数量
        num--;
        if(num <= 1){
            num = 1;
        }
        $(this).next().val(num);
        $.ajax({
            type : 'post',
            url : '../api/addgoodnum.php',
            data : {
                'phone' : userphone,
                'goodsid' : id,
                'price' : price,
                'num' : num
            }
        });
        // 改变单品总价格
        $(this).parent().parent().siblings('.allmoney').children().html('￥' + num*price + '.00');
    });

    // 5.商品数量 + 1
    $('.nwcpro_list').on('click','.increment',function(){
        let userphone = $.cookie('phoneNum');//用户手机号
        let id = $(this).parent().data('id');//商品id
        let price = $(this).parent().data('price');//商品单价
        let num = $(this).prev().val();
        let kucun = $(this).prev().data('kucun');
        num++;
        if (num >= kucun) {
            num = kucun;
        }
        $(this).prev().val(num);
        $.ajax({
            type : 'post',
            url : '../api/addgoodnum.php',
            data : {
                'phone' : userphone,
                'goodsid' : id,
                'price' : price,
                'num' : num
            }
        });
        // 改变单品总价格
        $(this).parent().parent().siblings('.allmoney').children().html('￥' + num*price + '.00');
    });

    // 6.填写商品数量
    $('.nwcpro_list').on('blur','.crement',function(){
        let userphone = $.cookie('phoneNum');//用户手机号
        let id = $(this).parent().data('id');//商品id
        let price = $(this).parent().data('price');//商品单价
        let num = $(this).val();
        let kucun = $(this).data('kucun');
        if(num >= kucun){
            num = kucun;
        }else if(num <= 1){
            num = 1;
        }
        $(this).val(num);
        $.ajax({
            type : 'post',
            url : '../api/addgoodnum.php',
            data : {
                'phone' : userphone,
                'goodsid' : id,
                'price' : price,
                'num' : num
            }
        });
        // 改变单品总价格
        $(this).parent().parent().siblings('.allmoney').children().html('￥' + num*price + '.00');
    });


    // 7.点击删除该种商品
    $('.nwcpro_list').on('click', '.delete', function () {
        let res = confirm('您确实要把该商品移出购物车吗？');
        if (res) {
            $(this).parent().parent().parent().remove();
            let userphone = $.cookie('phoneNum');//用户手机号
            let good = $(this).parent().data('good');
            $.ajax({
                type : 'post',
                url : '../api/delete.php',
                data : {
                    'phone' : userphone,
                    'goodsid' : good
                }
            });
        }
        update();
        numAndToal();
    });


    // 8.全选
    $('.allcheck').on('click', function () {
        let now = $(this).prop('checked');
        $('.sincheck').prop('checked', now);
        let chooselen = $('.sincheck:checked').size();
        $('#checknum').html(chooselen);//选中了几种商品
        numAndToal();
        bglight();
    });

    // 9.点击其他复选框反选全选
    $('.nwcpro_list').on('click','.sincheck',function(){
        let sumchecklen = $('.sincheck').size();
        let chooselen = $('.sincheck:checked').size();
        if(sumchecklen == chooselen){
            $('.allcheck').prop('checked',true);
        }else{
            $('.allcheck').prop('checked',false);
        }
        $('#checknum').html(chooselen);//选中了几种商品
        numAndToal();
        bglight();
        update();
    });


    // 10.计算总数量和总价格
    function checkedRows(){
        //判断checked序列，保存其下标 -- arr
        let arr = [];
        $('.sincheck').each(function(i,item){
            if($(item).prop('checked')){
                arr.unshift(i);
            }
        });
        // 降序
        arr.sort(function (a, b) {
            return b - a;
        });
        return arr;
    }
    function numAndToal() {
        let arr = checkedRows();
        // 计算总数量和总价格
        let sum = 0;
        let allmon = 0;
        arr.forEach(function(i){
            sum += $('.crement').eq(i).val()*1;
            allmon += $('.allmoney').eq(i).text().slice(1) * 1;
        });

        $('.goodnumber').html(sum);
        $('.jiesuan1').html(allmon.toFixed(2) + '元');
    
    }

    // 11.选中背景高亮
    function bglight(){
        $('.nwcheckout').css({'background' : '#ccc','cursor' : 'not-allowed'});
        $('.sincheck').each(function(i,item){
            if($(item).prop('checked')){
               $('.nwc_item').eq(i).css({'background' : '#E8F1FF'});
               $('.nwcheckout').css({'background' : '#E2393C','color' : '#fff','cursor' : 'pointer'});
            }else{
                $('.nwc_item').eq(i).css({'background' : '#FFFFFF'});
                // $('.nwcheckout').css({'background' : '#ccc'});
            }
        });
    }
    bglight();

    // 12.点击删除选中的商品
    $('.nwcallitem_lef a').click(function(){
        let arr = checkedRows();
        let res = confirm('您确定要删除选中商品吗？');
        if(res){
            arr.forEach(function(i){
                // 删除数据库里该页面选中的商品信息
                let userphone = $.cookie('phoneNum');//用户手机号
                let sonid = $('.delete').eq(i).parent().data('good');
                $.ajax({
                    type : 'post',
                    url : '../api/delete.php',
                    data : {
                        'phone' : userphone,
                        'goodsid' : sonid
                    }
                });
                $('.nwc_item').eq(i).remove();
            });
        }
        update();
        numAndToal();
    });

    // 13.判断购物车数量 -- 没有就显示空购物车栏
    function update() {
        let num = $('.sincheck').size();
        if (num == 0) {
            stage1();
        } else {
            stage2();
        }
    }

    // 14.结算
    $('.nwcheckout').click(function(){
        let arr = checkedRows();
        let pprice = $('#goodsprice').html();
        console.log(arr.length)
        if(arr.length > 0){
            alert('总共花费' + pprice + '。');
        }
       
        arr.forEach(function(i){
            // 删除数据库里该页面选中的商品信息
            let userphone = $.cookie('phoneNum');//用户手机号
            let sonid = $('.delete').eq(i).parent().data('good');
            console.log(sonid);
            $.ajax({
                type : 'post',
                url : '../api/delete.php',
                data : {
                    'phone' : userphone,
                    'goodsid' : sonid
                },
                success : function(str){
                    let arr = JSON.parse(str);
                    if(arr.length == 0){
                        stage1();
                    }
                }
            });
            $('.nwc_item').eq(i).remove();
        });
        update();
        numAndToal();
    });




    // 15.渲染其他
    let goods = new Promise(resolved => {
        $.ajax({
            type: 'get',
            url: '../api/getdata.php',
            data: 'page=' + 1 + '&num=' + 5,
            success: str => {
                resolved(str);
            }
        });
    });
    goods.then(function(data){
        let arr = JSON.parse(data);
        var html1 = arr.data.map(function(item){
            return `<div class="nwadd_ccon_pro">
                        <ul>
                            <li class="tu">
                                <a href="details.html?goodsid=${item.goodsid}" target="_blank" title="${item.introduce}">
                                    <img src="../img/tabs_img/${item.images}" alt="${item.introduce}">
                                </a>
                            </li>
                            <li class="zi">
                                <a href="details.html?goodsid=${item.goodsid}" target="_blank" title="${item.introduce}">${item.introduce}</a><br>
                            </li>
                            <li>
                                <strong class="price_info prinfo_5363" prinfo="5363">￥${item.goodprice}.00</strong>
                            </li>
                            <li class="gradd">
                                <div class="flolef fl">
                                    <div class="shopnum fl"><input type="text" value="1" id="buy-num-5363"><span><a class="add" href="javascript:void(0);"></a><a class="decrease" href="javascript:void(0);"></a></span></div>
                                    <div class="florig fl">
                                        <a href="javascript:addToCartlist(5363)" class="adtc151021 cur">加入购物车</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>`;
        }).join('');
        $('.nwadd_ccon').html(html1);
    });









});