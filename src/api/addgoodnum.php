<?php

    include 'conn.php';

    $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
    $goodsid = isset($_POST['goodsid']) ? $_POST['goodsid'] : '';
    // $sonid = isset($_POST['sonid']) ? $_POST['sonid'] : '';
    $num = isset($_POST['num']) ? $_POST['num'] : '';
    $price = isset($_POST['price']) ? $_POST['price'] : '';


    // 点击cart商品数量加减，改变数据库的值 -- 数量 总价
    if($phone && $goodsid && $num && $price){
        $sql = "UPDATE cart SET num=$num,allprice=$num*$price WHERE goodsid='$goodsid' AND phoneNum='$phone'";
        $res = $conn->query($sql);
        //修改数据库内容，不设返回值
    }   


    // 选中该号码下的所有商品 -- 购物车渲染
    if($phone){
        $sql = "SELECT * FROM cart WHERE phoneNum='$phone'";
        $res = $conn->query($sql);
        $content = $res->fetch_all(MYSQLI_ASSOC);
        echo json_encode($content,JSON_UNESCAPED_UNICODE);
    }

?>