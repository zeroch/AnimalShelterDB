<?php

$mysql_serv_name='localhost';
$mysql_username='cs4400_Team_7';
$mysql_pw='NJkRsVM_';
$mysql_database='test';

$con=mysql_connect($mysql_serv_name,
    $mysql_username,
    $mysql_pw,
    $mysql_database );
if(!$con){
    die('could not connect:'.mysql_error());
}else {

    echo 'connection established <br/>';
}

mysql_select_db($mysql_database,$con);

$name=$_GET["p_name"];
$type=$_GET["type"];
$breed=$_GET["breed"];
$gender=$_GET["gender"];
$age=$_GET["age"];
$s_name="aa";
$cur_date=date("Y-m-d");

if($type=="cat"){
	$q1="insert into pet (shelter_name,pet_name,gender,age,assign_date,pet_type,cat_breed) values('$s_name','$name','$gender','$age','$cur_date','$type','$breed');";
}else{
	$q1="insert into pet (shelter_name,pet_name,gender,age,assign_date,pet_type,dog_breed) values('$s_name','$name','$gender','$age','$cur_date','$type','$breed');";		
}
echo "<br/>".$q1."<br/>";

if(!mysql_query($q1,$con)){
	die('Error: '.mysql_error());
}
echo "add pet successful";

mysql_close();
?>



