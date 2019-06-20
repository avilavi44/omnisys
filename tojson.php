<?php
// read file
$data = file_get_contents('data/entityGroupsDb2.json');

// decode json to array
$json_arr = json_decode($data, true);

foreach ($json_arr as $key => $value) {
    if ($value['_name'] == $_POST['group']) {
    	// echo $value['EntityTypes'];
        foreach ($value['EntityTypes'] as $key => $value) {
        	// echo $value['_groupId'];
        	if($value['_entityTypeId'] == $_POST['id']){
        		// echo $value['_name'];
        		$json_arr[$key]['_name'] = $_POST['name'];
        		echo json_encode($json_arr);
        	}
        }
    }
}
// die();

// encode array to json and save to file
// file_put_contents('data/entityGroupsDb2.json', json_encode($json_arr));
?>