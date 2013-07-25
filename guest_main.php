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
     Atlanta Pet Adoption Consortium<br>
     
     
<p1> Welcome Guest</p1>

<hr/>

<?php
echo "<table border='1'>
<tr>
<th><a href='pet_search.php'>Find a Pet						</a></th>
<th><a href='shelter_search.php'>Find a Shelter				</a></th>"

?>

<p> Not a Guest?  <button type="button" onclick="location.href='index.php'">Back</button> </p>