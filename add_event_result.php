<?php

$mysql_serv_name='localhost';
$mysql_username='cs4400_Team_7';
$mysql_pw='NJkRsVM_';
$mysql_database='cs4400_Team_7';

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


$shelter=$_COOKIE['shelter'];
$count=0;
	
$t1=$_GET['e_type1'];
$l1=$_GET['l1'];
$d1=$_GET['d1'];
$ds1=$_GET['ds1'];

if(preg_match("^\d{4}\-\d{2}-\d{2}$^",$d1) && !empty($l1))

{
	$query="insert into event values('$shelter','$d1','$l1','$ds1','$t1')";

if(!mysql_query($query,$con)){
	 die('Error: '.mysql_error());
}
	$count++;
	
}
$t1=$_GET['e_type2'];
$l1=$_GET['l2'];
$d1=$_GET['d2'];
$ds1=$_GET['ds2'];

if(preg_match("^\d{4}\-\d{2}-\d{2}$^",$d1) && !empty($l1))

{
	$query="insert into event values('$shelter','$d1','$l1','$ds1','$t1')";

if(!mysql_query($query,$con)){
	 die('Error: '.mysql_error());
}
	$count++;
	
}
$t1=$_GET['e_type3'];
$l1=$_GET['l3'];
$d1=$_GET['d3'];
$ds1=$_GET['ds3'];

if(preg_match("^\d{4}\-\d{2}-\d{2}$^",$d1) && !empty($l1))

{
	$query="insert into event values('$shelter','$d1','$l1','$ds1','$t1')";

if(!mysql_query($query,$con)){
	 die('Error: '.mysql_error());
}
	$count++;
	
}

$t1=$_GET['e_type4'];
$l1=$_GET['l4'];
$d1=$_GET['d4'];
$ds1=$_GET['ds4'];

if(preg_match("^\d{4}\-\d{2}-\d{2}$^",$d1) && !empty($l1))

{
	$query="insert into event values('$shelter','$d1','$l1','$ds1','$t1')";

if(!mysql_query($query,$con)){
	 die('Error: '.mysql_error());
}
	$count++;
	
}



if($count>0){

echo "<script> alert('event add!');
		location.href='add_new_event.php';</script> </script>";
	
}
mysql_close();

?>
