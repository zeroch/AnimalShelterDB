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

mysql_select_db($mysql_database,$con);
$shelter=$_COOKIE['shelter'];
$result=mysql_query("select name,phone from fosterer");
$i=0;
while($row=mysql_fetch_array($result)){
    $f_id[$i]=$row["name"]."-".$row["phone"];
    
    $i++;
}

$result=mysql_query("select pet_id from pet where pet.shelter_name='$shelter'");
$i=0;
while($row=mysql_fetch_array($result)){
	
    $p_id[$i]=$row["pet_id"];
    
    $i++;
}

?>


<html>
<head>

   

    <title></title>
</head>

<body>
    Atlanta Pet Adoption Consortium<br>
    Add new pet for shelter ARC <br>
    <?php if(isset($_COOKIE['shelter'])){
    echo "Welcome to the ".$_COOKIE['shelter'];
    }
     
    ?>
    <hr>
    
    <form method="get" action="foster_result.php" id="s_form">
    	
        Pet_ID<select id="pet" name="pet">
         <?php 
	     for ($i=0;$i<count($p_id);$i++){
         
         echo "<option value=".$p_id[$i]. ">".$p_id[$i]."</option>;" ;
        
     }
     	?>
        </select>
        Name-Phone<select id="fst" name="fst">
	    <?php 
	     for ($i=0;$i<count($f_id);$i++){
         
         echo "<option value=".$f_id[$i]. ">".$f_id[$i]."</option>;" ;
        
     }
     	?>	        
        </select>
        <br/>
        <input  type="submit" value="submit" >
    </form>
    
    <button type="button" onclick="location.href='main.php'">Back</button>
</body>

