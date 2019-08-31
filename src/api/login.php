<?php

    include 'conn.php';

    $telNum = isset($_POST['telNum']) ? $_POST['telNum'] : '';
    $userpwd = isset($_POST['userpwd']) ? $_POST['userpwd'] : '';

    if($telNum && $userpwd){
        $sql = "SELECT * FROM userinf WHERE `phoneNum` = '$telNum' AND `pwd` = '$userpwd'";
        $res = $conn->query($sql);//得到布尔值
    }
    

    if($res->num_rows) {
        echo 'yes';
    }else{
        echo 'no';
    }



?>