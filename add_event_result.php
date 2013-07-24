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


$s_name="ze";

$t1=$_GET["e_type1"];
$l1=$_GET["l1"];
$d1=$_GET["d1"];
$ds1=$_GET["ds1"];
$t1=$_GET["e_type1"];


$query="insert into event values('$s_name','$d1','$l1','$ds1','$t1')";

if(!mysql_query($query,$con)){
	 die('Error: '.mysql_error());
}

echo "<script> alert('event add!'); </script>";

mysql_close();

?>
