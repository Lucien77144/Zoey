<?php
session_start();

// this page tells if the user has a new notification or not

require("model.php");
require_once("verifyToken.php");

if(verifyToken()){
    $_SESSION['readstate'] = getUserReadState($_SESSION['idUser']);
}

if (isset($_SESSION['readstate']) && $_SESSION['readstate'] == 2) {
    echo "New notification";
} else {
    echo "No notification";
}
