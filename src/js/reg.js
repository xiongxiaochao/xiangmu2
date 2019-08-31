$(function(){
    
    /*
        reg:1.输入手机号 -- 非空验证，正则验证，数据库查询手机号是否存在
              存在，提醒：该手机号码已注册！ 不存在，允许注册
            2.3个验证都通过则允许点击获取手机验证(none),出现短信验证
            3.点击 发送短信 特效：出现60s倒计时
            完成以上，点击下一步，出现下一页内容
            4.设置密码 -- 密码强度验证
            5.确认密码 -- 互相验证是否相同
            6.确认注册 -- 跳转注册成功页面
    
    */ 

    // 1.查询手机号能否注册
    $('.phone').blur(function(){
        let phoneval = $(this).val();
        let reg = /([1][358][0-9]{9})|([1][4][37][0-9]{8})|([1][7][01367])/;//手机号码正则

        if(phoneval){// 非空
            let regsure = reg.test(phoneval);
            if(regsure){//正则验证
                let checkphone = new Promise(function(resolved){
                    $.ajax({//数据库查询手机号是否存在
                        type : 'get',
                        url : '../api/userinf.php',
                        data : 'telphone=' + phoneval,
                        success : function(str) {
                            resolved(str);
                        }
                    });
                });
                checkphone.then(function(str){
                    // console.log(str);
                    if(str == 'yes'){
                        $('.message1').html('').css({'display' : 'none'});
                        $('.mem_tip1').css({'display' : 'block'});//验证通过提示
                        $('#ImgCaptcha').click(function(){
                            $('#qq_div').css({'display' : 'none'});
                            $('#yzm_div').css({'display' : 'block'});
                        });
                    }else{
                        $('.message1').html('手机号已存在，请直接登陆！').css({'display' : 'block'});
                        $('.mem_tipicon01').css({'display' : 'none'});
                    }
                });
            }else{
                $('.message1').html('手机号码格式错误！').css({'display' : 'block'});
            }
        }else{
            // 为空
            $('.message1').html('请输入手机号码！').css({'display' : 'block'});
        }
    });

    // 2.伪短信验证 ---->  随机验证码验证
    var timer = null;//准备一个定时器
    $('.sendmess').click(function(){//点击发送短信
        $('.sendmess').css({'display' : 'none'});
        $('.waitmess').css({'display' : 'block'});
        // (1)时间倒数
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
        
        // (2)获取6位随机验证码
        let randomNum = randomNumCode(6);
        console.log(randomNum);//后台可见
        
        $('#yanzhengma').focus();
        // (3)验证验证码，点击下一步
        $('#yanzhengma').blur(function(){
            let yanzheng = $('#yanzhengma').val();//输入的验证码
            if(yanzheng){//失去焦点非空判断
                // 4.点击下一步 
                $('.gonextstep').click(function(){
                    if(yanzheng == randomNum){//正确性验证
                        $('.message2').html('').css({'display' : 'none'});
                        $('#step1').css({'display' : 'none'});
                        $('#step2').css({'display' : 'block'});

                    }else{
                        $('.message2').html('短信验证码错误！').css({'display' : 'block'});
                    }
                });
            }else{
                $('.message2').html('请输入短信验证码！').css({'display' : 'block'});
            }
        });


    });


    // 3.设置密码 -- 正则、密码强度
    $('.setpwd').keyup(function(){
        let pwdlen = $(this).val().length;//密码长度
        let pwdval = $(this).val();//密码
        // 密码强度正则
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        if(pwdlen > 6 && pwdlen <= 20){//密码长度判断
            $('.mem_tip2').css({'display' :'block'});
            if(enoughRegex.test(pwdval)){
                $('.message3').html('密码强度：弱').css({'display' : 'block','color' : '#58bc58','background-position' : '-333px -50px'});
            }
            if(mediumRegex.test(pwdval)){
                $('.message3').html('密码强度：中等').css({'display' : 'block','color' : '#58bc58','background-position' : '-333px -50px'});
            }
            if(strongRegex.test(pwdval)){
                $('.message3').html('密码强度：强').css({'display' : 'block','color' : '#58bc58','background-position' : '-333px -50px'});
            }
        }else{
            $('.message3').html('请输入6-20位密码！').css({'display' : 'block','color' : '#ff5c4b','background-position' : '-486px -100px'});
            $('.mem_tip2').css({'display' :'none'});
        }

        // 5.反向确认密码
        let pwdval2 = $('#conf_password').val();
        if(pwdval2){
            if(pwdval == pwdval2){
                $('.message4').html('').css({'display' : 'none'});
                $('.gotoreg').click(null);
            }else{
                $('.message4').html('密码不一致！').css({'display' : 'block'});
            }
        }
    });

    // 4.确认密码 --> 注册：生成userid，将userphone pwd存进数据库
    $('.gotoreg').click(function(){
        let pwd1 = $('.setpwd').val();
        let pwd2 = $('#conf_password').val();
        if(pwd2){
            if(pwd1 == pwd2){
                $('.message4').html('').css({'display' : 'none'});

                // 注册用户
                let phoneNum = $('.phone').val();
                let userpwd = $('.setpwd').val();
                $.ajax({
                    type : 'post',
                    url : '../api/userinf.php',
                    data : 'telNum=' + phoneNum + '&userpwd=' + userpwd,
                    success : function(str){
                        // console.log(str);
                        if(str == 'yes'){
                            $('#step2').css({'display' : 'none'});
                            $('#step3').css({'display' : 'block'});

                            // 注册成功，保存用户手机号phoneNum到cookie
                            $.cookie('phoneNum',phoneNum,{expires : 1,path : '/'});

                            let url = $.cookie('url');
                            if(url){
                                // 拿到cookie存有的url，返回上一页
                                location.href = url;
                            }else{
                                // cookie没存有url就返回首页
                                location.href = '../index.html';
                            }

                        }else{
                            alert('注册失败！');
                        }
                    }
                });
                
            }else{
                $('.message4').html('密码不一致！').css({'display' : 'block'});
            }
        }else{
            $('.message4').html('请确认密码！').css({'display' : 'block'});
        }
    });

   

    








});