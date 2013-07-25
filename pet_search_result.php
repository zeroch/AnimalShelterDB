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
$gender=$_GET["gender"];
$age=$_GET["age"];
echo "<table border='1'>
	<tr>
	<th>zip</th>
	<th>type</th>
	<th>breed</th>
	<th>gender</th>
	<th>age</th>
	</tr><hr/>";
	
echo "
	<tr>
	<th>".$zip."</th>
	<th>".$type."</th>
	<th>".$breed."</th>
	<th>".$gender."</th>
	<th>".$age."</th>
	</tr>";
	mysql_select_db($mysql_database,$con);
	$query="SELECT p.shelter_name, p.pet_name, p.pet_id, s.st_city_state, s.phone
			FROM pet as p
			inner join shelter as s
			on p.shelter_name=s.name
			WHERE p.pet_type = '$type' AND (p.cat_breed = '$breed' OR p.dog_breed = '$breed') 
			  AND p.gender = '$gender' AND p.age = '$age' and s.zipcode='$zip'";
			  
			  
			  
        if($result=mysql_query($query)){
        
        		echo "<table border='1'><tr>
        			<th>Shelter Name</th>
        			<th>Pet Name</th>
        			<th>Pet ID</th>
        			<th>Gender</th>
        			<th>Age</th>";
        while($row=mysql_fetch_array($result)){
                
                echo "<tr>";
                echo "<td>". $row['shelter_name']. "</td>";
                echo "<td>". $row['pet_name']. "</td>";
                echo "<td>". $row['pet_id']. "</td>";
                echo "<td>". $row['st_city_state']. "</td>";
                echo "<td>". $row['phone']. "</td>";
                echo "</tr>";
        }       
        echo "</table>";
        echo "<hr/>";
        echo "<button type=\"button\" onclick=\"location.href='pet_search.php'\">Back</button>";

}

		
		

?>



</body>
</html>



