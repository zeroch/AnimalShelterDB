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
?>



<html>
<head>
    <title></title>
     Atlanta Pet Adoption Consortium<br>
    Pet Search result for<br>
</head>

<body>

<?php
$zip=$_GET["zip"];
$type=$_GET["type"];
$breed=$_GET["breed"];


?>



</body>
</html>
