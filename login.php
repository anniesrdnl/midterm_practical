<?php
$conn = mysqli_connect("localhost", "root","","storee");

if (!$conn){
    die("Connection Failed");
}

$mobile = $_POST['mobile'];
$password = $_POST['password'];
$sql = "SELECT * FROM customerss WHERE mobile='$mobile' AND password='$password'";

$result = mysqli_query($conn,$sql);
if (mysqli_num_rows($result) >0){
    echo "Log In Success";
    exit();
}else{
    echo "Log In Failed";
}
mysqli_close($conn);
?>