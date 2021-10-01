<?php  
    $conn = mysqli_connect("localhost", "root","", "reservations");
    if(!$conn){
        echo "Database non connecté". mysqli_connect_error();
    }

?>