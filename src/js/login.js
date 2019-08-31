$(function(){

    /*
        login: 1.点击选项卡切换区域
               2.账号密码登录 -- 在数据库找到完全匹配的账号密码
               登陆成功跳转首页
               3.短信登陆
    */ 

    // 1.点击选项卡切换区域
    $('.mem_logtab .quyu1').click(function(){
        $(this).addClass('cur').siblings().removeClass('cur');
        $('.loginmethod1').css({'display' : 'block'});
        $('.loginmethod2').css({'display' : 'none'});
    });
    $('.mem_logtab .quyu2').click(function(){
        $(this).addClass('cur').siblings().removeClass('cur');
        $('.loginmethod2').css({'display' : 'block'});
        $('.loginmethod1').css({'display' : 'none'});
    });

    // 2.通过手机号码和密码登录
    $('.gotologin').click(function(){
        let phoneNum = $('#userName2').val();
        let userpwd = $('#password1').val();
        if(phoneNum && userpwd){
            $('.message1').html('').css({'display' : 'none'});
            $('.message2').html('').css({'display' : 'none'});
            $.ajax({
                type : 'post',
                url : '../api/login.php',
                data : 'telNum=' + phoneNum + '&userpwd=' + userpwd,
                success : function(str){
                    // console.log(str);
                    if(str == 'yes'){
                        // 登陆成功，将用户号码存到cookie
                        $.cookie('phoneNum',phoneNum,{path : '/'});

                        let url = $.cookie('url');
                        if(url){
                            // 拿到cookie存有的url，返回上一页
                            location.href = url;
                            $.cookie('url','',{expires : -1,path : '/'});
                        }else{
                            // cookie没存有url就返回首页
                            location.href = '../index.html';
                        }
                    }else{
                        $('.message2').html('用户名或密码错误!').css({'display' : 'block'});
                    }
                }
            });
        }else if(phoneNum && !userpwd){
            $('.message2').html('请输入密码!').css({'display' : 'block'});
            $('.message1').html('').css({'display' : 'none'});
        }else if(!phoneNum && userpwd){
            $('.message1').html('请输入手机号!').css({'display' : 'block'});
            $('.message2').html('').css({'display' : 'none'});
        }else{
            $('.message1').html('请输入手机号!').css({'display' : 'block'});
            $('.message2').html('请输入密码!').css({'display' : 'block'});
        }
        
    });

    // 3.短信登录
    $('#LoginCaptcha').click(function(){
        let phoneVal = $('#log_phone').val();
        let reg = /([1][358][0-9]{9})|([1][4][37][0-9]{8})|([1][7][01367])/;//手机号码正则
        if(phoneVal){//非空
            let regsure = reg.test(phoneVal);
            if(regsure){//正则验证
                $('#errMsgName').html('').css({'display' : 'none'});
                $('#qq_div').css({'display' : 'none'});
                $('#yzm_div').css({'display' : 'block'});
            }else{
                $('#errMsgName').html('手机号码格式错误！').css({'display' : 'block'});
            }
        }else{
            $('#errMsgName').html('请输入手机号码！').css({'display' : 'block'});
        }
    });


    // 4.点击 发送信息  获取短信验证码
    // 重新获取验证码 -- 倒计时
    var timer = null;//准备一个定时器
    $('.sendmess').click(function(){//点击发送短信
        $('.sendmess').css({'display' : 'none'});
        $('.waitmess').css({'display' : 'block'});
        // 时间倒数
        var num = 60;
        //封装定时器
        function show(){
            num--;
            if(num >= 0){
                $('.waitmess a').html(num + 's后重新获取');
                istrue = true;
            }else{
                $('.sendmess').css({'display' : 'block'});
                $('.waitmess a').html('');
                $('.waitmess').css({'display' : 'none'});
                clearInterval(timer);//关闭定时器
            }
        }
        // 开启定时器
        timer = setInterval(show,1000);

        // 验证接收到的短信和自己填写的是否相同
        let phoneVal = $('#log_phone').val();
        
        $.ajax({
            type : 'post',
            url : '../api/message.php',
            data : 'userphone=' + phoneVal,
            success : function(str) {
                // str --> {"phonecode":118154,"message":{"reason":"操作成功","result":{"sid":"201907110945205577778551","fee":1,"count":1},"error_code":0}}
                let arr = JSON.parse(str);
                console.log(arr.phonecode);//短信验证码
                // console.log(phoneVal);
                $('#ptLogin').click(function(){
                    let yanzheng = $('#yanzhengma').val();
                    console.log(yanzheng);
                    if(yanzheng){//非空
                        $('#errMsgCode').html('').css({'display' : 'none'});
                        if(yanzheng == arr.phonecode){//短信正确性验证
                            $('#errMsgCode').html('').css({'display' : 'none'});
                            // 登陆成功，将用户号码存到cookie
                            $.cookie('phoneNum',phoneVal,{expires : 1,path : '/'});

                            let url = $.cookie('url');
                            if(url){
                                // 拿到cookie存有的url，返回上一页
                                location.href = url;
                            }else{
                                // cookie没存有url就返回首页
                                location.href = '../index.html';
                            }
                        }else{
                            $('#errMsgCode').html('验证码错误！').css({'display' : 'block'});
                        }
                    }else{
                        $('#errMsgCode').html('请输入验证码！').css({'display' : 'block'});
                    }
                });       
                
            }
        });
    });

    




});