

<head>
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
	
	echo 'connection established with '.$mysql_database;
	
}
?>
</head>

<body
    <h1>Atlanta Pet Adoption Consortium</h1>
<p1>Shelter Search Results for Zipcode: </p1>
<?php
	$zip=$_GET["zip"];
	echo $zip;
	mysql_select_db($mysql_database,$con);
	$result=mysql_query("SELECT * from shelter AS s inner join days_open as do ON s.name=do.shelter_name where s.zipcode=$zip ");
	
	echo "<table border='1'>
	<tr>
	<th>Shelter Name</th>
	<th>Phone</th>
	<th>Address</th>
	<th>Zipcode</th>
	</tr>";
		
	if($result){
	while($row=mysql_fetch_array($result)){
		
		echo "<tr>";
		echo "<td>". $row['name']. "</td>";
		echo "<td>". $row['phone']. "</td>";
		echo "<td>". $row['st_city_state']. "</td>";
		echo "<td>". $row['zipcode']. "</td>";
		echo "</tr>";
	}
	echo "</table>";
	
}
	echo "<br/>";
	echo " <button type=\"button\" onclick=\"location.href='guest_main.php'\">Back</button>";

?>
 </body>
