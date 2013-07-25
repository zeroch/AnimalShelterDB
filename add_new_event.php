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
</head>

<body>
    Atlanta Pet Adoption Consortium<br>
    Add new event for  shelter ARC <br>
    <?php if(isset($_COOKIE['shelter'])){
    echo "Welcome to the ".$_COOKIE['shelter'];
    }?>
    <hr>
    
    <form method="get" action="add_event_result.php" id="s_form">
    	
    	<select name="e_type1">
    	<option value="0">Fundraising</option>
    	<option value="1">adoption</option>
    	</select>
        <input type="text" name="l1">
        <input type="date" name="d1">
        <input type="text" name="ds1"> 
        <br/>
        <select name="e_type2">
    	<option value="0">Fundraising</option>
    	<option value="1">adoption</option>
    	</select>
        <input type="text" name="l2">
        <input type="date" name="d2">
        <input type="text" name="ds2"> 
        <br/>
        <select name="e_type3">
    	<option value="0">Fundraising</option>
    	<option value="1">adoption</option>
    	</select>
        <input type="text" name="l3">
        <input type="date" name="d3">
        <input type="text" name="ds3"> 
        <br/>
        <select name="e_type4">
    	<option value="0">Fundraising</option>
    	<option value="1">adoption</option>
    	</select>
        <input type="text" name="l4">
        <input type="date" name="d4">
        <input type="text" name="ds4"> 
        <br/>
        <input  type="submit" value="submit" >
    </form>
     <button type="button" onclick="location.href='main.php'">Back</button>
    
</body>

</html>
