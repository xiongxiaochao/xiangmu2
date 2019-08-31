<?php

    header('Content-type:text/html;charset=utf-8');//防止中文乱码

    // 连接数据库
    $severname = 'localhost';
    $username = 'root';
    $pwd = '';
    $dbname = 'baiji';

    // 通过构造函数 mysqli() 建立连接
    $conn = new mysqli($severname,$username,$pwd,$dbname);

    // 检测连接
    if($conn->connect_error) {
        die('连接错误：'.$conn->connect_error);
    }

    // echo '连接成功';

?>