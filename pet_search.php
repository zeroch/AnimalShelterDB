<?php

$mysql_serv_name='localhost';
$mysql_username='cs4400_Team_7';
$mysql_pw='NJkRsVM_';
$mysql_database='animal';

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
$result=mysql_query("select * from dog_breed");
$i=0;
while($row=mysql_fetch_array($result)){
    $dog[$i]=$row[0];
    $i++;
}
$result=mysql_query("select * from cat_breed");
$i=0;
while($row=mysql_fetch_array($result)){
    $cat[$i]=$row[0];
    $i++;
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

   

    <title></title>
</head>

<body>
    Atlanta Pet Adoption Consortium<br>
    Pet Search<br>
    <hr>

    <form method="get" action="pet_search_result.php" id="s_form">
    
        <input type="text" name="zip"> 
        <select id="t" name="type" onchange="get_breed(t_id,b_id)"></select>
        <select id="breed" name="breed">
        <option value="">breed</option>
        </select>
        <select id="age" name="age"></select>
        <select id="gender" name="gender"></select>
        <input  type="submit" value="submit" >
    </form>
    
</body>

 <script language="JavaScript" type="text/javascript">

     var breed=new Array();
     breed[1]= new Array();
     breed[2]=new Array();
     
     <?php 
     
     for ($i=0;$i<count($dog);$i++){
         
         echo "breed[1][" . $i . "]="."\"".$dog[$i]."\"". ";" ;
     }
     
     for ($i=0;$i<count($cat);$i++){
         
         echo "breed[2][".$i."]="."\"".$cat[$i]."\"".";";
     }
     ?>
       
     
     var t_id=document.getElementById("t");
     var b_id=document.getElementById("breed");
     var a_id=document.getElementById("age");
    
     var g_id=document.getElementById("gender");
     
     var t_list={1:'dog',2:'cat'};
     var a_list={1:'small',2:'young',3:'old',4:'dying'};
     var g_list={1:'male',2:'female'};
     
     function init(t_id,a_id,g_id) { 
     
     t_id.options[0]=new Option('type','');      
      for(var key in t_list){
          t_id.options[key]=new Option(t_list[key],key);
          }
      
     
      a_id.options[0]=new Option('age','');
      for(var key in a_list){
          a_id.options[key]=new Option(a_list[key],key);
          }
          
          
      g_id.options[0]=new Option('gender','');
      for(var key in g_list){
          g_id.options[key]=new Option(g_list[key],key);
          }
          
      }
       
     function get_breed(t_id,b_id) {
        for(var key in breed[t_id.value]){
            b_id.options[key]=new Option(breed[t_id.value][key],key);
        
        }
      }       
       init(t_id,a_id,g_id);
       get_breed(t_id,b_id);
     
    </script>
</html>
