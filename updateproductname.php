<?php
$db_host = 'localhost'; // Server Name
$db_user = 'root'; // Username
$db_pass = ''; // Password
$db_name = 'omnisys'; // Database Name

$conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
if (!$conn) {
    die ('Failed to connect to MySQL: ' . mysqli_connect_error());  
}

$systemId = mysqli_real_escape_string($conn, htmlspecialchars($_POST['systemId']));
$id = mysqli_real_escape_string($conn, htmlspecialchars($_POST['id']));
$name = mysqli_real_escape_string($conn, htmlspecialchars($_POST['name']));

// $sql = "UPDATE entityTypesTable SET entityName='$name' WHERE entityTypeId='$id' and systemId='$systemId'";
$sql = "UPDATE entityTypesTable SET entityName='$name' WHERE entityTypeId='$id'";
        
$conn->set_charset('utf8mb4');       // object oriented style
mysqli_set_charset($conn, 'utf8mb4');  // procedural style

$query = mysqli_query($conn, $sql);

$rows[] = array($id, $name);
echo json_encode($rows);

if (!$query) {
    die ('SQL Error: ' . mysqli_error($conn));
}
?>
