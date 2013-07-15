

<html>
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
	
	echo 'connection established';
	

?>
<script type="text/javascript">
function type2breed() { 

	var type = document.s_form.type_menu;
	var breed= document.s_form.breed_menu;
	//get object. 
	
	
    
    
   
    
   //access mysql condition with type.value
 /*  var i=0;
   <?php
   $type=type.value;
   mysql_select_db("animal",$con);
   if($type="dog"){
	   $result=mysql_query("SELECT * FROM dog_breed");
   }else {
	   $result=mysql_query("SELECT * FROM cat_breed");
   }
    while($result=mysql_fetch_array($result)){
	    ?> breed[i+1]=new option(<? $row[breed]?>, <? $row[breed] ?>);
	    	i++;
	    	
	    	    }
    
       
    */
    
    
   /*   var a_breed=<?php echo $result; ?>;
      for( var i=0; i<a_breed.length; i++){
	      breed[i+1]=new option(a_breed[i],a_breed[i]);
      }
*/
 }
</script>
<head>
    <title>Atlanta Pet Adoption Consortium</title>
</head>

<body>

   <p1>Pet Search </p1><br/>
   <?php echo $result; ?>
   <hr/>
   <form name ="s_form" method="get" action="pet_search_result.php">
   <input type="text" name="zip">
   
   <select id="type_menu" name="type" onchange="type2breed();">
   <option value="dog">dog</option>
   <option value="cat">cat</option>
   </select>
   
   <select id="breed_menu" name="breed" >
   <option value=""> choice breed </option>
   
   
   </form>
   
</body>

</html>




