<?php
    if (isset($_POST['style_fk']) && isset($_POST['gender']) && isset($_POST['length'])){
        require_once 'conn.php';

        $style_fk = $_POST['style_fk'];
        $gender = $_POST['gender'];
        $length = $_POST['length'];
    
        $sql = "INSERT INTO filters (style_fk, gender, length) VALUES (?,?,?)" ;

        $stmt= $conn->prepare($sql);
        $stmt->bind_param("sss", $style_fk,$gender,$length);
        $stmt->execute();

        // 0 = MALE, 1 = FEMALE, 2 = UNISEX
        // 0 = LONG, 1 = MEDIUM, 2 = SHORT, 3 = ALL

    }else{echo "failed";}
?>