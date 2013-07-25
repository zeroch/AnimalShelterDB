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
   Current year pet adoptions summary for shelter  <?php if(isset($_COOKIE['shelter'])){
    echo $_COOKIE['shelter'];
    }?>
<br>
</head>


<body>

<?php
echo "
<hr/><table border='1'>
<tr>
<th>Month</th>
<th>Dogs Adopted</th>
<th>New Dogs</th>
<th>Dogs in shelter</th>
<th>Dogs in Foster Home</th>
<th>Cats Adopted</th>
<th>New Cats</th>
<th>Cats in shelter</th>
<th>Cats in Foster Homes</th>
</tr>";

mysql_select_db($mysql_database,$con);

$shelter=$_COOKIE['shelter'];
$test_s="ABC";
$cur_date=date('Y-m-d');
$year=substr($cur_date,0,4);
$mm=substr($cur_date,5,2);

for($i=1;$i<=$mm;$i++){


switch($i){
	case '01': $rt_array[$i]['Month']="January";
	break;
	case '02': $rt_array[$i]['Month']="February";
	break;
	case '03': $rt_array[$i]['Month']="March";
	break;
	case '04': $rt_array[$i]['Month']="April";
	break;
	case '05': $rt_array[$i]['Month']="May";
	break;
	case '06': $rt_array[$i]['Month']="June";
	break;
	case '07': $rt_array[$i]['Month']="July";
	break;
	case '08': $rt_array[$i]['Month']="August";
	break;
	case '09': $rt_array[$i]['Month']="September";
	break;
	case '10': $rt_array[$i]['Month']="October";
	break;
	case '11': $rt_array[$i]['Month']="November";
	break;
	case '12': $rt_array[$i]['Month']="December";
	break;
}


//adopted_dog	
$query="select count(p.a_name) 
from pet as p 
where p.pet_type='dog' and p.a_name is not null 
and p.shelter_name='$shelter'
and extract(year from p.a_date)='$year'
and extract(month from p.a_date)='$i'";
$return=mysql_fetch_array(mysql_query($query));

$rt_array[$i]['D_a']=$return[0];

//new dog
$query="select count(p.pet_id) 
from pet as p 
where p.pet_type='dog'
and p.shelter_name='$shelter'
and extract(year from p.assign_date)='$year'
and extract(month from p.assign_date)='$i'";
$return=mysql_fetch_array(mysql_query($query));

$rt_array[$i]['D_assign']=$return[0];

//dog at foster

$query="select count(p.f_name) 
from pet as p 
where p.pet_type='dog' and p.f_name is not null 
and p.shelter_name='$shelter'
and extract(year from p.f_date)<='$year'
and extract(month from p.f_date)<='$i'";
$return=mysql_fetch_array(mysql_query($query));

$rt_array[$i]['D_f']=$return[0];

//dog in shelter

$query="select count(p.pet_id) 
from pet as p 
where p.pet_type='dog' and p.a_name is null
and p.f_name is null 
and p.shelter_name='$shelter'
and extract(year from p.assign_date)<='$year'
and extract(month from p.assign_date)<='$i'";
$return=mysql_fetch_array(mysql_query($query));

$rt_array[$i]['D_in']=$return[0];
		
/*cat section same code */

//adopted_cat	
$query="select count(p.a_name) 
from pet as p 
where p.pet_type='cat' and p.a_name is not null 
and p.shelter_name='$shelter'
and extract(year from p.a_date)='$year'
and extract(month from p.a_date)='$i'";
$return=mysql_fetch_array(mysql_query($query));

$rt_array[$i]['C_a']=$return[0];

//new cat
$query="select count(p.pet_id) 
from pet as p 
where p.pet_type='cat'
and p.shelter_name='$shelter'
and extract(year from p.assign_date)='$year'
and extract(month from p.assign_date)='$i'";
$return=mysql_fetch_array(mysql_query($query));

$rt_array[$i]['C_assign']=$return[0];

//cat at foster

$query="select count(p.f_name) 
from pet as p 
where p.pet_type='cat' and p.f_name is not null 
and p.shelter_name='$shelter'
and extract(year from p.f_date)<='$year'
and extract(month from p.f_date)<='$i'";
$return=mysql_fetch_array(mysql_query($query));

$rt_array[$i]['C_f']=$return[0];

//cat in shelter

$query="select count(p.pet_id) 
from pet as p 
where p.pet_type='cat' and p.a_name is null
and p.f_name is null 
and p.shelter_name='$shelter'
and extract(year from p.assign_date)<='$year'
and extract(month from p.assign_date)<='$i'";
$return=mysql_fetch_array(mysql_query($query));

$rt_array[$i]['C_in']=$return[0];

}


$sum=0;
$total=count($rt_array);
for($i=0;$i<=$total;$i++){
	$sum+=$rt_array[$i]['D_a'];	
}
$rt_array[$total+1]['D_a']=$sum;

$sum=0;
for($i=0;$i<=$total;$i++){
	$sum+=$rt_array[$i]['D_assign'];	
}
$rt_array[$total+1]['D_assign']=$sum;
$sum=0;
for($i=0;$i<=$total;$i++){
	$sum+=$rt_array[$i]['D_in'];	
}
$rt_array[$total+1]['D_in']=$sum;

$sum=0;
for($i=0;$i<=$total;$i++){

	$sum+=$rt_array[$i]['D_f'];	
}

$rt_array[$total+1]['D_f']=$sum;

$sum=0;
for($i=0;$i<=$total;$i++){
	$sum+=$rt_array[$i]['C_a'];	
}
$rt_array[$total+1]['C_a']=$sum;
$sum=0;
for($i=0;$i<=$total;$i++){
	$sum+=$rt_array[$i]['C_assign'];	
}
$rt_array[$total+1]['C_assign']=$sum;
$sum=0;
for($i=0;$i<=$total;$i++){
	$sum+=$rt_array[$i]['C_in'];	
}
$rt_array[$total+1]['C_in']=$sum;

$sum=0;
for($i=0;$i<=$total;$i++){
	$sum+=$rt_array[$i]['C_f'];	
}
$rt_array[$total+1]['C_f']=$sum;

$rt_array[$total+1]['Month']="Year to Date";



for($i=0;$i<=count($rt_array);$i++){
echo "<tr>";
echo "<td>". $rt_array[$i]['Month']. "</td>";
echo "<td>". $rt_array[$i]['D_a']. "</td>";
echo "<td>". $rt_array[$i]['D_assign']. "</td>";
echo "<td>". $rt_array[$i]['D_in']. "</td>";
echo "<td>". $rt_array[$i]['D_f']. "</td>";

echo "<td>". $rt_array[$i]['C_a']. "</td>";
echo "<td>". $rt_array[$i]['C_assign']. "</td>";
echo "<td>". $rt_array[$i]['C_in']. "</td>";
echo "<td>". $rt_array[$i]['C_f']. "</td>";
echo "</tr>";
}



echo "</table>";


        echo "<hr/>";
       echo "<button type=\"button\" onclick=\"location.href='main.php'\">Back</button>";



?>
