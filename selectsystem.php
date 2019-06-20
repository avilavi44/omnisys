<?php
$db_host = 'localhost'; // Server Name
$db_user = 'root'; // Username
$db_pass = ''; // Password
$db_name = 'omnisys'; // Database Name

$conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
if (!$conn) {
    die ('Failed to connect to MySQL: ' . mysqli_connect_error());  
}

$id = mysqli_real_escape_string($conn, htmlspecialchars($_GET['id']));

$sql = "SELECT MainTable.name,entityTypesTable.* FROM MainTable,entityTypesTable 
where entityTypesTable.groupId = MainTable.groupId
and MainTable.systemId = '$id'";

$result = $conn->query($sql);


if ($result->num_rows > 0) {
    $rows = array();
    while($r = mysqli_fetch_assoc($result)) {
        $rows[] = $r;
    }
    echo json_encode($rows);
} else {
    echo "0 results";
}
$conn->close();
?>
