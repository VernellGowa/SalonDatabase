<?php
        require_once 'conn.php';

        function object_to_array($data)
        {
            if (is_array($data) || is_object($data))
            {
                $result = [];
                foreach ($data as $key => $value)
                {
                    $result[$key] = (is_array($data) || is_object($data)) ? object_to_array($value) : $value;
                }
                return $result;
            }
            return $data;
        }

        $json = file_get_contents('php://input');

        $data = json_decode($json);
        $obj = $data[0];
        $obj = object_to_array($obj);

        $account_id = $obj["account_id"];
        $gender = $obj["gender"];
        $length = $obj["length"];
        $length = implode("','",$length);

        $sql = "SELECT st.style_id, st.name, st.price, st.time, st.max_time, st.info,im.image_id FROM styles_jnct AS jnct
        INNER JOIN style AS st ON st.style_id = jnct.style_fk
        INNER JOIN filters AS fil ON fil.style_fk = jnct.style_fk
        LEFT JOIN style_images AS im ON im.style_fk = jnct.style_fk
        WHERE jnct.account_fk = ? AND IF(? = 2, true, fil.gender = ? OR fil.gender=2) AND fil.length IN ('".$length."')
        GROUP BY st.style_id";

        $stmt= $conn->prepare($sql);
        $stmt->bind_param("iii", $account_id,$gender,$gender);
        $stmt->execute();
        $result = $stmt->get_result(); 
        $infos = array();

        while($row = mysqli_fetch_assoc($result)) {
            $info = array();
            $style_id = strval($row["style_id"]);
            $name = strval($row["name"]);
            $price = strval($row["price"]);
            $time = strval($row["time"]);
            $max_time = strval($row["max_time"]);
            $style_info = strval($row["info"]);
            $image_id = strval($row["image_id"]);

            $info += ["image_id" => $image_id];
            $info += ["name" => $name];
            $info += ["price" => $price];
            $info += ["time" => $time];
            $info += ["max_time" => $max_time];
            $info += ["info" => $style_info];
            $info += ["style_id" => $style_id];
            array_push($infos,$info);}

        echo json_encode($infos);
        
        // 0 = MALE, 1 = FEMALE, 2 = UNISEX
        // 0 = LONG, 1 = MEDIUM, 2 = SHORT, 3 = ALL
?>