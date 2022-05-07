<?php
session_start();

// this page handles AJAX calls for the isPseudoFreeAPI

function sendRequest()
{
    require('model.php');

    $apianswer = isPseudoFree($_POST['checkPseudo']);

    echo $apianswer;
}

if (!isset($_SESSION['pseudo'])) {
    sendRequest();
} else if ($_SESSION['pseudo'] != $_POST['checkPseudo']) {
    sendRequest();
} else {
    echo "2"; // default
}
