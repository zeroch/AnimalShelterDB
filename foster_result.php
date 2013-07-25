<?php
date_default_timezone_set('America/New_York');
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

  if(isset($_COOKIE['shelter'])){
    echo "Welcome to the ".$_COOKIE['shelter'];
    }
$shelter=$_COOKIE['shelter'];    
$cur_date=date("Y-m-d");
$test_d="2014-01-01";

$fst=$_GET['fst'];
$pet=$_GET['pet'];


	$temp=explode('-',$fst);
	$f_name=$temp[0];
	$f_phone=$temp[1];

echo $f_name;
echo $f_phone;
echo "<br/>";

$query="update pet
		set f_name='$f_name',
			f_phone='$f_phone',
			f_date='$cur_date'
			where pet_id='$pet'
				AND shelter_name='$shelter'";


if(!mysql_query($query,$con)){
	die('Error: '.mysql_error());
}

echo "<script>alert('foster pet successful');
	 				location.href='foster_pet.php';</script>";

mysql_close();
?>


