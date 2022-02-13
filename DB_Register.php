<?php 
include "DB_Config.php";

$id = mysqli_real_escape_string($connect, $_POST['id']);
$username = mysqli_real_escape_string($connect, $_POST['username']);
$password = mysqli_real_escape_string($connect, $_POST['password']);
	  
	 
$query = "INSERT INTO registrationapp_flutter (id, username,password) VALUES('$id', '$username','$password')";
$results = mysqli_query($connect, $query);
if($results>0)
{
   echo "user added to DB successfully";
}
 
?>