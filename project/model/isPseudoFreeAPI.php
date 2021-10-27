<?php
session_start();

function sendRequest(){
    require('model.php');

    $apianswer = isPseudoFree($_POST['checkPseudo']);

    echo $apianswer;
}

if (!isset($_SESSION['pseudo'])){
    sendRequest();    
} else if ($_SESSION['pseudo'] != $_POST['checkPseudo']) {
    sendRequest();
} else {
    echo "2";
}