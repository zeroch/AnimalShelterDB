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
?>


<html>
<head>
    <title></title>
     Atlanta Pet Adoption Consortium<img src="./pic/logo.png" width="80" height="80" /><br>
   <?php  if(isset($_COOKIE['shelter'])){
    echo "Welcome to the ".$_COOKIE['shelter']." shelter";
    }else {
	    echo "<script> alert('you are not employee, please login in');
		location.href='index.php';</script> </script>";
    }
    
    ?><br>
</head>
<p1> You Are in the Employee page</p1>
<hr/>

<?php
echo "<table border='1'>
<tr>
<th><a href='add_pet.php'>Add new pet						</a></th>
<th><a href='add_new_event.php'>add new event				</a></th>
<th><a href='donation_summary.php'>Donation Detail			</a></th>
<th><a href='M_ad.php'>Adoption Detail		</a></th>
<th><a href='foster_pet.php'>Foster Assignment				</a></th>
<th><a href='year_report.php'>Year Adoption Summary	</a></th>
<th><a href='quarter_report.php'>Quarterly Report		</a></th>
</tr></table>";
 echo "<hr/><button type=\"button\" onclick=\"location.href='index.php'\">Back</button>";

?>


 
