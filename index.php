
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
	
	echo 'connection established';
	
}

?>
<h1 style="margin-left: 100px"> Atlanta  Pet Adoption Consortium </h1>
<hr/>

<p1 style="margin-left: 50px ">Guest <a href="./guest_login.php"><button type="button"> Guest Login</button>  </a> <br/> </p1>

<p1 style="margin-left: 50px">Employee </p1>

<p2 style="margin-left: 80px">

<form action="e_login.php" method="get">

<p style="margin-left: 80px"> Shlter Name:
<select name=s_name>
<option value=shelter name>Shelter name </option>
<?php
mysql_select_db($mysql_database,$con);
$result=mysql_query("SELECT * FROM shelter");

while($row=mysql_fetch_array($result)){

     echo "<option value=" .$row[name]. ">" .$row[name]."</option>";
	}	
?>
</select>
</p>
<p style="margin-left: 80px">Enum: <input type="text" name="Enum" /></p>
<p style="margin-left: 80px">Password: <input type="text" name="pd" /></p>
<input type="submit" value ="Login" style="margin-left: 80px"/>
</form>


</p2>
<?php

mysql_close($con);
?>
