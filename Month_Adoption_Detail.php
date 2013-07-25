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
?>



<html>
<head>
    <title></title>
     Atlanta Pet Adoption Consortium<br>
    Monthly Adoption Summary<br>
</head>


<body>

<?php
echo "<table border='1'>
<tr>
<th>Name</th>
<th>Date of Birth</th>
<th>Phone</th>
<th>Address</th>
<th>Pet ID</th>
<th>Type</th>
</tr>";

mysql_select_db($mysql_database,$con);

  if(isset($_COOKIE['shelter'])){
    echo "Welcome to the ".$_COOKIE['shelter'];
    }
$shelter=$_COOKIE['shelter'];
$test_s="ABC";
$cur_date=$_GET['dd'];

 $query="select a.name, a.phone,a.address, a.DoB, p.pet_id, p.pet_type
from adoptee as a
inner join pet as p
on a.name=p.a_name
where Date(p.a_date)='$cur_date'
AND p.shelter_name='$shelter'";


$result=mysql_query($query,$con);


if($result){
while($row=mysql_fetch_array($result)){

echo "<tr>";
echo "<td>". $row['name']. "</td>";
echo "<td>". $row['DoB']. "</td>";
echo "<td>". $row['phone']. "</td>";
echo "<td>". $row['address']. "</td>";
echo "<td>". $row['pet_id']. "</td>";
echo "<td>". $row['pet_type']. "</td>";
echo "</tr>";
}
echo "</table>";


        echo "<hr/>";
       echo "<button type=\"button\" onclick=\"location.href='main.php'\">Back</button>";
}


?>




