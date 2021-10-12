<?php
session_start();
if ($_SESSION['pseudo'] != $_POST['checkPseudo']){
    require('model.php');

    $apianswer = isPseudoFree($_POST['checkPseudo']);

    echo $apianswer;
} else {
    echo "2";
}