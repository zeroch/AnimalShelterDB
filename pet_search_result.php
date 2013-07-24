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
$gender=$_GET["gender"];
$age=$_GET["age"];
echo "<table border='1'>
	<tr>
	<th>zip</th>
	<th>type</th>
	<th>breed</th>
	<th>gender</th>
	<th>age</th>
	</tr>";
	
echo "<table border='1'>
	<tr>
	<th>".$zip."</th>
	<th>".$type."</th>
	<th>".$breed."</th>
	<th>".$gender."</th>
	<th>".$age."</th>
	</tr>";
		



		
		

?>



</body>
</html>
