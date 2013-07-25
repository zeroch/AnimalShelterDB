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
    Monthly Donation Summary<br>
</head>


<body>

<?php
echo "<table border='1'>
<tr>
<th>Month</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>City</th>
<th>Amount</th>
</tr>";
 
mysql_select_db($mysql_database,$con);

  if(isset($_COOKIE['shelter'])){
    echo "Welcome to the ".$_COOKIE['shelter'];
    }
$shelter=$_COOKIE['shelter'];
 $cur_year=substr(date('Y-m-d'),0,4);
 $cur_month=substr(date('Y-m-d'),5,2);
 $query="SELECT EXTRACT( 
MONTH FROM D.d_date ) AS d_Month, D.name, D.phone, o.email, o.city, MAX(D.amount) as Amount
FROM Donates AS D
INNER JOIN donor AS o ON D.name = o.name
AND D.phone = o.phone
AND D.s_name='$shelter'
AND EXTRACT( YEAR
FROM D.d_date ) =$cur_year
GROUP BY d_Month";

echo "<br/><br/><br/>This is A donation Summary for ".$cur_year."-".$cur_month."<br/>";
$result=mysql_query($query,$con);

if($result){
while($row=mysql_fetch_array($result)){

echo "<tr>";
echo "<td>". $row['d_Month']. "</td>";
echo "<td>". $row['name']. "</td>";
echo "<td>". $row['email']. "</td>";
echo "<td>". $row['phone']. "</td>";
echo "<td>". $row['city']. "</td>";
echo "<td>". $row['Amount']. "</td>";
echo "</tr>";
}

        echo "</table>";
        echo "<hr/>";
        echo "<button type=\"button\" onclick=\"location.href='main.php'\">Back</button>";
}

?>




