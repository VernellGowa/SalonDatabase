<?php
    require_once 'conn.php';

    $sql = "SELECT ac.account_id,ad.address_id,ac.name,ad.address,ad.postcode,DATE_FORMAT(ac.open,'%H:%i') as open,im.image_id,
        DATE_FORMAT(ac.close,'%H:%i') as close,ad.latitude,ad.longitude FROM address_jnct as jnct
        INNER JOIN address AS ad ON ad.address_id = jnct.address_fk
        INNER JOIN account AS ac ON ac.account_id = jnct.account_fk
        LEFT JOIN saloon_images as im ON im.saloon_fk = jnct.account_fk
        GROUP BY jnct.account_fk";

    $stmt= $conn->prepare($sql);
    $stmt->execute();
    $result = $stmt->get_result(); 
    $infos = array();

    while($row = mysqli_fetch_assoc($result)) {
        $info = array();
        $account_id = strval($row["account_id"]);
        $sql = "SELECT AVG(rating) as rating FROM saloon_reviews WHERE account_fk = ?" ;
        $stmt= $conn->prepare($sql);
        $stmt->bind_param("i", $account_id);
        $stmt->execute();
        $res = $stmt->get_result(); 
        $rating = "";
        while($row2 = mysqli_fetch_assoc($res)) { $rating = strval($row2["rating"]);}
        if (strlen($rating) == 0){$rating = "0.0";}

        $info += ["rating" => $rating];
        $name = strval($row["name"]);
        $address_id = strval($row["address_id"]);
        $address = strval($row["address"]);
        $postcode = strval($row["postcode"]);
        $longitude = strval($row["longitude"]);
        $latitude = strval($row["latitude"]);
        $close = strval($row["close"]);
        $open = strval($row["open"]);

        $info += ["image_id" => strval($row["image_id"])];
        $info += ["name" => $name];
        $info += ["address" => $address];
        $info += ["rating" => $rating];
        $info += ["postcode" => $postcode];
        $info += ["account_id" => $account_id];
        $info += ["address_id" => $address_id];
        $info += ["latitude" => $latitude];
        $info += ["longitude" => $longitude];
        $info += ["close" => $close];
        $info += ["open" => $open];
        array_push($infos,$info);
    }
    echo json_encode($infos);
?>