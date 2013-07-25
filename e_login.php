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

  //  echo 'connection established <br/>';
}

mysql_select_db($mysql_database,$con);
$shelter=$_COOKIE['s_name'];
$s_name=$_GET["s_name"];
$enum=$_GET["Enum"];
$pd=$_GET["pd"];

$query="select Enum,shelter_name from employee where Enum='$enum' AND shelter_name='$s_name' AND password='$pd'";

$result=mysql_query($query,$con);

$num_rows=mysql_num_rows($result);
if($num_rows==0){
	 echo "<script>alert('sorry, you are not valid employee account')</script>
	 		<a href='index.php'>go back</a>";
	 		
	}else{
			
	 		setcookie('shelter',$s_name,time()+60*60*24*7);
	 	
	 		echo "<script>alert('you are good');
	 				location.href='main.php';</script>";
}


?>