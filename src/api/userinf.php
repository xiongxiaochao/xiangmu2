<?php

    include 'conn.php';

    // 验证用户信息接口
    $telphone = isset($_GET['telphone']) ? $_GET['telphone'] : '';
    $telNum = isset($_POST['telNum']) ? $_POST['telNum'] : '';
    $userpwd = isset($_POST['userpwd']) ? $_POST['userpwd'] : '';

    // echo $telphone;
    
    // 1.查询数据库是否存在该手机号码
    if($telphone){
        $sql = "SELECT * FROM userinf WHERE phoneNum = '$telphone'";
        $res = $conn->query($sql);
        if($res->num_rows){
            // 存在，不可以注册
            echo 'no';
        }else{
            // 不存在，可以注册
            echo 'yes';
        }
    }

    // 2.注册新用户
    if($telNum && $userpwd){
        $sql = "INSERT INTO userinf(phoneNum,pwd) VALUES('$telNum','$userpwd');";
        $res = $conn->query($sql);
        if($res) {
            echo 'yes';//插入成功
        }else{
            echo 'no';//插入失败
        }
    }

    

    // $res->close();
    // $conn->close();

?>