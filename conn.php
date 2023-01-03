<?php
  $sName = "localhost";
  $uName = "root";
  $pWord = "Nelldestroyer25";
  $db = "saloon";
  $pt = 81;

  $timeout = 5;  
  $conn = mysqli_init( );
  $conn->options( MYSQLI_OPT_CONNECT_TIMEOUT, $timeout ) ||
       die( 'mysqli_options croaked: ' . $conn->error );
  $conn->real_connect($sName, $uName, $pWord, $db) ||
       die( 'mysqli_real_connect croaked: ' . $conn->error );
  
  // $conn = new mysqli($sName, $uName, $pWord, $db);


  if (!$conn) {
    echo "Connection failed: " . mysqli_connect_error();
    die("Connection failed: " . mysqli_connect_error());
}
?>