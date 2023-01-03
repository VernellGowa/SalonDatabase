<?php
    if (isset($_POST['name']) && isset($_POST['account_id'])){
        require_once 'conn.php';

        $name = $_POST['name'];
        $account_id = $_POST['account_id'];
        $result = 1;

        $sql = "SELECT style_id FROM style WHERE name = ? and account_id = ?";

        $stmt= $conn->prepare($sql);
        $stmt->bind_param("ss", $name,$account_id);
        $stmt->execute();
        $stmt->store_result();
        $num = $stmt->num_rows(); 

        if ($num == 0){$result = 0;}

        echo $result;
    }else{echo "failed";}
?>