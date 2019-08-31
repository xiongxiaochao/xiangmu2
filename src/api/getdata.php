<?php
    include 'conn.php';

    // 接口功能：帮前端查询第几页的数据
    $page = isset($_GET['page']) ? $_GET['page'] : '1';//页码
    $num = isset($_GET['num']) ? $_GET['num'] : '20';//商品条数
    $promax = isset($_GET['promax']) ? $_GET['promax'] : '';//销量排序
    $newest = isset($_GET['newest']) ? $_GET['newest'] : '';//最新排序
    $findit = isset($_GET['findit']) ? $_GET['findit'] : '';//查询
    $goodsid = isset($_GET['goodsid']) ? $_GET['goodsid'] : '';//查询

    // echo $page,$num;//测试

    // 1.根据页面和记录要求查询并返回商品数据
    $index = ($page - 1) * $num;//每一页第一条的下标
    $sql = "SELECT * FROM goodsinf LIMIT $index,$num";
    $res = $conn->query($sql);
    $content = $res->fetch_all(MYSQLI_ASSOC);//读取结构集内容返回给前端

    // 2.查询商品总条数
    $sql2 = "SELECT * FROM goodsinf";
    $res2 = $conn->query($sql2);

    // 3.按销量排序
    if($promax){
        $sql3 = "SELECT * FROM goodsinf ORDER BY sale DESC LIMIT $index,$num";
        $res3 = $conn->query($sql3);
        $content = $res3->fetch_all(MYSQLI_ASSOC);
    }
    // 4.按最新排序
    if($newest){
        $sql4 = "SELECT * FROM goodsinf ORDER BY goodsid DESC LIMIT $index,$num";
        $res4 = $conn->query($sql4);
        $content = $res4->fetch_all(MYSQLI_ASSOC);
    }

    $data = array(
        'data' => $content,//想要拿到的20条数据
        'allpage' => $res2->num_rows,//总条数
        'page' => $page,//第几页
        'num' => $num
    );

    // 5.商品模糊查询
    if($findit){
        $sql4 = "SELECT * FROM goodsinf WHERE goodname LIKE '%$findit%'";
        $res4 = $conn->query($sql4);
        $content = $res4->fetch_all(MYSQLI_ASSOC);
        $data = array(
            'data' => $content,
            'allpage' => $res4->num_rows,//总条数
            'page' => $page,//第几页
            'num' => $num
        );
    }

    // 6.通过goodsid查找某件商品 -> 详情页 / 购物车
    if($goodsid){
        $sql5 = "SELECT * FROM goodsinf WHERE goodsid = '$goodsid'";
        $res5 = $conn->query($sql5);
        $data = $res5->fetch_all(MYSQLI_ASSOC);//返回结果集
    }

    // 传给前端：先转成字符串
    echo json_encode($data,JSON_UNESCAPED_UNICODE);
?>