$(function () {

    /* 左边布局 */
    // 三级手风琴
    function Accrodion(clickone, showone) {
        clickone.each(function (i, item) {
            var num = i;
            clickone.eq(i).click(function () {
                showone.eq(num).toggle();
            });
        });
    }
    // 第二级
    Accrodion($('.accrodion1_i'), $('.accrodion2'));
    Accrodion($('.accrodion1_a'), $('.accrodion2'));

    // 第三级
    Accrodion($('.accrodion2_i'), $('.accrodion3'));
    Accrodion($('.accrodion2_a'), $('.accrodion3'));


    /* 右边布局 */
    // 数据渲染
    let iPage = 1; //第1页
    let goodNum = 20; //每页16条数据
    let promax = '';//销量，默认没有排序
    let newest = '';//最新，默认没有排序
    let findit = '';//查询

    // 初始数据渲染
    function init(){
        let goods = new Promise(resolved => {
            $.ajax({
                type: 'get',
                url: '../api/getdata.php',
                data: 'page=' + iPage + '&num=' + goodNum + '&promax=' + promax + '&newest=' + newest + '&findit=' + findit,
                success: str => {
                    resolved(str);
                }
            });
        });
    
        goods.then(data => {
            let arr = JSON.parse(data);
            // 1.渲染数据
            var html = arr.data.map(item => {
                return `<li class="prorig_product">
                            <div class="pro_pic"> 
                                <a href="details.html?goodsid=${item.goodsid}" target="blank" class="img">
                                    <img class="lazy" data-original="" src="../img/tabs_img/${item.images}" alt="法乐通"> 
                                </a>
                            </div>
                            <div class="pro_w">
                                <p class="pro_name"> 
                                    <a href="details.html?goodsid=${item.goodsid}" target="_blank" title="法乐通 ">${item.goodname}&nbsp;</a>
                                </p>
                                <p class="pro_pri"> 
                                    <strong class="price_info prinfo_6995" prinfo="6995">￥${item.goodprice}.00</strong>
                                    <span class="sta fr">在售 </span>
                                </p>
                            </div>
                            <div class="pro_way">			
                                <a href="details.html?goodsid=${item.goodsid}" target="_blank" class="detlink">查看详情</a>
                                <a id="onlinelist" href="###" class="hovphobut">在线咨询</a>
                            </div>
                            <a href="###" class="protq151019"><em></em>在线咨询</a>
                        </li>`;
            });
            $('#goodlist').html(html);

            // 2.根据总条数和每页显示条数，计算总页数，生成页码
            let pageNum = Math.ceil(arr.allpage / arr.num);//总页数
            // console.log(pageNum);
            let pageBtn = '';
            for(let i = 0;i < pageNum; i++){
                pageBtn += `<li class="active"><a href="#page1" data-page="1">${i+1}</a></li>`;
            }
            $('#moveBtn').html(pageBtn).children().eq(iPage - 1).css({
                'background' : '#7EBCFF'
            });

            // 6.总商品数
            $('.allgoodsNum').html('总计 ' + arr.allpage + ' 个记录');

            // 7.当前页码 / 总页码
            $('.changepage').html(arr.page);
            $('.allpageNum').html(pageNum);

        
        });
    }
    init();

    function change(pageindex){
        // iPage为当前页码，点击前的页码   
        let allpages =  $('#moveBtn').children().size();//总页数
        let iw = 28;
        // 4.ul移动，效果：高亮一直在中间
        // ul向左移动，条件：点击的页码大于当前页码，页码大于3时且小于倒数第2个时
        if(pageindex > iPage && pageindex > 3 && pageindex < allpages - 1){
            
            $('#moveBtn').animate({'left' : -(pageindex - 3)*iw + 'px'});
            iw = (pageindex - 3)*iw;
        }else if(pageindex > iPage && pageindex > allpages-2){
            $('#moveBtn').animate({'left' : -(allpages - 5)*iw + 'px'});
        }
        // ul向右移动，条件：点击的页码小于当前页码，小于倒数第3个时且页码大于2时
        if(pageindex < iPage && pageindex > 2 && pageindex < allpages - 2){
            // let iw = 28;
            $('#moveBtn').animate({'left' : -(pageindex - 3)*iw + 'px'});
            iw = (pageindex - 3)*iw;
        }else if(pageindex < iPage && pageindex < 3){
            $('#moveBtn').animate({'left' : '0px'});
        }

        // 5.页数大于1时，出现 上一页 和 首页
        if(pageindex > 1){
            $('.disabled').css({'display' : 'block'});
        }else{
            $('.disabled').css({'display' : 'none'});
        }
    }

    // 3.点击页码，能够按需加载新一页数据进行渲染
    $('#moveBtn').on('click','li',function() {
        let pageindex = $(this).children().eq(0).html();//点击后的页码
        change(pageindex);
        
        iPage = pageindex;
        init();//调取最新的数据渲染

    });

    // 8.首页/上一页/下一页/末页
    // 封装首页初始化，分页条的显示
    function firstPage(){
        iPage = 1;
        $('#moveBtn').animate({'left' : '0px'});
        $('.disabled').css({'display' : 'none'});
        init();
    }
    // 首页
    $('.thefirstpage').click(function(){
        firstPage();
    });
    // 上一页
    $('.theprevpage').click(function(){
        let allpages =  $('#moveBtn').children().size();//总页数
        iPage--;
        let iw = 28;
        if(iPage <= 3){
            $('#moveBtn').animate({'left' : '0px'});
            if(iPage == 1){
                $('.disabled').css({'display' : 'none'});
            }
        }
        if(iPage > 3 && iPage <= allpages - 3){
            $('#moveBtn').animate({'left' : -(iPage - 3)*iw + 'px'});
            iw = (iPage - 3)*iw;
        }
        if(iPage > allpages - 3){
            $('#moveBtn').animate({'left' : -(allpages - 5)*iw + 'px'});
        }
        init();
    });
    //下一页
    $('.thenextpage').click(function(){
        let allpages =  $('#moveBtn').children().size();//总页数
        iPage++;
        let iw = 28;
        if(iPage <= 3){
            $('#moveBtn').animate({'left' : '0px'});
            $('.disabled').css({'display' : 'block'});
        }
        if(iPage <= allpages - 3 && iPage > 3){
            $('#moveBtn').animate({'left' : -(iPage - 3)*iw + 'px'});
            iw = (iPage - 3)*iw;
        }
        if(iPage > allpages - 3){
            if(iPage > allpages){
                iPage = allpages;
            }
            $('#moveBtn').animate({'left' : -(allpages - 5)*iw + 'px'});
        }
        init();
    });
    // 末页
    $('.thelastpage').click(function(){
        let allpages =  $('#moveBtn').children().size();//总页数
        let iw = 28;
        iPage = allpages;
        $('#moveBtn').animate({'left' : -(iPage - 5)*iw + 'px'});
        $('.disabled').css({'display' : 'block'});
        init();
    });

    // 9.input框输入页码，点击确定跳转页面
    $('.sureBtn').click(function(){
        let allpages =  $('#moveBtn').children().size();//总页数
        let iw = 28;//ul移动一个li的宽度
        let val = $(this).prev().children().eq(0).val();//input框输入值
        if(val){//非空
            iPage = val;
        }
        $('.disabled').css({'display' : 'block'});//首页上一页按钮显示
        if(iPage <= 3){
            $('#moveBtn').animate({'left' : '0px'});
            if(iPage == 1){
                $('.disabled').css({'display' : 'none'});
            }
        }
        if(iPage > 3 && iPage <= allpages - 3){
            $('#moveBtn').animate({'left' : -(iPage - 3)*iw + 'px'});
            iw = (iPage - 3)*iw;
        }
        if(iPage > allpages - 3){
            if(iPage > allpages){
                iPage = allpages;
            }
            $('#moveBtn').animate({'left' : -(allpages - 5)*iw + 'px'});
        }
        init();//调取最新的数据渲染
        $(this).prev().children().eq(0).val('');//清空input框的value值
    });
    
    // 10.按销量排序 sale：从大到小
    $('.promax').click(function(){
        promax = 'desc';
        newest = '';
        firstPage();
        $('.newest').css({'color' : '#555555'});
        $('.promax').css({'color' : '#FF5C4D'});
        $('.promax>img').attr({'src' : '../img/tp/pxar.gif'});
        $('.newest>img').attr({'src' : '../img/tp/pxa.gif'});
    });
    // 11.按最新排序  goodsid：从大到小
    $('.newest').click(function(){
        promax = '';
        newest = 'desc';
        firstPage();
        $('.promax').css({'color' : '#555555'});
        $('.newest').css({'color' : '#FF5C4D'});
        $('.newest>img').attr({'src' : '../img/tp/pxar.gif'});
        $('.promax>img').attr({'src' : '../img/tp/pxa.gif'});
    });

    // 12.查询商品
    $('.checkgood').click(function(){
        $('.checkgood').focus().val('');
    });
    $('.searchgood').click(function(){
        let goodval = $(this).prev().val().trim();
        findit = goodval;
        firstPage();
    });


    // 13.点击商品，传goodid过去，跳转详情页 -->  绑在a标签上


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




});