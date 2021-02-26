<?php

include 'db.php';

$conn = mysqli_connect($servername, $username, $password, $database);

if (!$conn) {
      die("Connection failed: " . mysqli_connect_error());
}

$data = json_decode(file_get_contents("php://input"), true); 
$sql = "INSERT INTO logs (logtype, logdate, llog, logdata, logger)
VALUES ($data['type'], $data['date'], $data['log'], $data['data'], $data['steamid'])";

if (mysqli_query($conn, $sql)) {
    //echo "Recorded log successfully.";
} else {
    //echo "Error recording log: " . mysqli_error($conn);
}
mysqli_close($conn);
?>