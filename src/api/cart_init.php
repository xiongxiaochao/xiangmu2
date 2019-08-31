<?php
    
    include 'conn.php';

    $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
    $goodsid = isset($_POST['goodsid']) ? $_POST['goodsid'] : '';

    // echo $phone;

    // 找到该用户下所有的商品记录
    if($phone){
        $sql = "SELECT * FROM cart WHERE phoneNum='$phone'";
        $res = $conn->query($sql);
        $content = $res->fetch_all(MYSQLI_ASSOC);
        echo json_encode($content,JSON_UNESCAPED_UNICODE);
    }

    // 找到这些商品记录的详情信息
    if($goodsid){
        $sql = "SELECT * FROM goodsinf WHERE goodsid='$goodsid'";
        $res = $conn->query($sql);
        $content = $res->fetch_all(MYSQLI_ASSOC);
        echo json_encode($content[0],JSON_UNESCAPED_UNICODE);
    }
   

?>