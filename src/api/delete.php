<?php

    include 'conn.php';

    $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
    $goodsid = isset($_POST['goodsid']) ? $_POST['goodsid'] : '';

    // 点击删除该用户的该商品 -- 删除  /   删除所有
    if($phone && $goodsid){
        $sql = "DELETE FROM cart WHERE phoneNum='$phone' AND goodsid='$goodsid'";
        $res = $conn->query($sql);
        //修改数据库内容，不设返回值
    }

?>