<?php

    include 'conn.php';

    // 添加购物车
    // 传电话号码、goodsid、数量
    $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
    $goodsid = isset($_POST['goodsid']) ? $_POST['goodsid'] : '';
    $num = isset($_POST['num']) ? $_POST['num'] : '';
    $allprice = isset($_POST['allprice']) ? $_POST['allprice'] : '';
    $kucun = isset($_POST['kucun']) ? $_POST['kucun'] : '';

    // echo $phone;
    

    // 查询cart订单表原本有没有该商品存在
    $sql = "SELECT * FROM cart WHERE phoneNum = '$phone' 
    AND goodsid = '$goodsid'";
    $res = $conn->query($sql);
    $content = $res->fetch_all(MYSQLI_ASSOC);


    // var_dump($res);

    if($content){//如果有

        $sql3 ="SELECT * FROM cart WHERE goodsid='$goodsid' AND num BETWEEN 1 AND $kucun";
        $res3 = $conn->query($sql3);
        // 设库存限制
        if($res3){
            $sql2 = "UPDATE cart SET num=$kucun,allprice=allprice+$allprice*1 WHERE goodsid='$goodsid' AND phoneNum='$phone'";
            $res2 = $conn->query($sql2);
        }else{
            $sql2 = "UPDATE cart SET num=num+$num*1,allprice=allprice+$allprice*1 WHERE goodsid='$goodsid' AND phoneNum='$phone'";
            $res2 = $conn->query($sql2);
        }
    }else{//如果没有
        $sql2 = "INSERT INTO cart(goodsid,phoneNum,num,allprice) VALUES($goodsid,$phone,$num,$allprice);";
        $res2 = $conn->query($sql2);
    }

    if($res2){
        echo 'yes';
    }else{
        echo 'no';
    }   



?>