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
   Current Quarterly  summary for shelter  <?php if(isset($_COOKIE['shelter'])){
    echo $_COOKIE['shelter'];
    }?>
<br>
</head>


<body>

<?php

mysql_select_db($mysql_database,$con);


$cur_date=date('Y-m-d');
$year=substr($cur_date,0,4);

$query="select quarter('$cur_date')";
$result=mysql_query($query);
$quarter=mysql_fetch_array($result);
$quarter=$quarter[0];

$month=3*$quarter-2;

$mon_name=array("Juanary","Febeuray","March","April","May","June","July","August","September","October","November","December");

$cc=0;
	
while($cc<3){

echo "

<hr/>

<h1>".$mon_name[$month]."    ".$year."

<table border='1'>
<tr>
<th>Shelter</th>
<th>No.of Sponsored Events</th>
<th>Totoal Donations</th>
<th>Total pet Adoptions</th>
<th>Total Pets  Received</th>
</tr>";

$query1="create or replace view s_name".$cc." as select name from shelter";

$query2="create or replace view s_e".$cc." as 
		select e.s_name as sname, count(e.location) as No_E
		from event as e
		where month(e.e_date)='$month'
		and extract(year from e.e_date)='$year'";

$query3="create or replace view t_d".$cc." as SELECT D.s_name as ssname, SUM( D.amount) as T_Do from Donates as D WHERE month(D.d_date) = '$month' AND EXTRACT( YEAR FROM D.d_date ) ='$year'";

$query4="create or replace view t_ad".$cc." as select p.shelter_name as sssname,count(p.pet_id) as T_ad from pet as p WHERE month( p.a_date) = '$month' AND EXTRACT( YEAR FROM p.a_date ) ='$year'";

$query5="create or replace view t_re".$cc." as  select p.shelter_name as ssssname, count(p.pet_id) as T_red from pet as p where quarter(p.assign_date)='$month' and extract( year from p.assign_date)='$year'";

$query6="create or replace view v1".$cc." as select name, No_E from s_name".$cc." left join s_e".$cc." on s_name".$cc.".name=s_e".$cc.".sname";

$query7="create or replace view v2".$cc." as select name ,No_E,T_ad  from v1".$cc." left join t_ad".$cc." on v1".$cc.".name=t_ad".$cc.".sssname";

$query8="create or replace view v3".$cc." as select name,No_E,T_ad,T_Do from v2".$cc." left join t_d".$cc." on v2".$cc.".name=t_d".$cc.".ssname";

$query9="create or replace view v4".$cc." as  select name,No_E,T_ad,T_Do,T_red from v3".$cc." left join t_re".$cc." on v3".$cc.".name=t_re".$cc.".ssssname";

mysql_query($query1);
mysql_query($query2);
mysql_query($query3);
mysql_query($query4);
mysql_query($query5);
$test=mysql_query($query6) or die(mysql_error());
mysql_query($query7)	or die(mysql_error());
mysql_query($query8)	 or die(mysql_error());
mysql_query($query9) 	or die(mysql_error());
$query="select * from v4$cc";
$result=mysql_query($query) or die(mysql_error());


while($row=mysql_fetch_array($result)){

	foreach($row as &$value){
		if($value==null){
			$value=0;
		}
	}

echo "<tr>";
echo "<td>". $row['name']. "</td>";
echo "<td>". $row['No_E']. "</td>";
echo "<td>". $row['T_ad']. "</td>";
echo "<td>". $row['T_Do']. "</td>";
echo "<td>". $row['T_red']. "</td>";
echo "</tr>";
}

echo "</table>";
$cc++;
$month++;
}





        echo "<hr/>";
       echo "<button type=\"button\" onclick=\"location.href='main.php'\">Back</button>";



?>
