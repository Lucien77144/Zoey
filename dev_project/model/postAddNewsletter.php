<?php

require("model.php");

function isEmailOk($str)
{
    return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? false : true;
}

function postAddNewsletter()
{

    $prenom = safeEntry($_POST['prenom']);
    $mail = safeEntry($_POST['mail']);

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "INSERT INTO newsletter (prenom, mail) VALUES (:prenom, :mail)";
    $req = $db->prepare($sql);

    $valid = $req->execute(array(
        ':prenom' => $prenom,
        ':mail' => $mail
    ));

    if (!$valid)
        throw new Exception("Il y a eu une erreur, votre adresse n'a pas pu être ajoutée");

    return "valid";
}

try {
    if (
        isset($_POST['mail'])
        && isEmailOk($_POST['mail'])
    ) {
        $postAddNewsletter = postAddNewsletter();
        echo $postAddNewsletter;
    } else {
        throw new Exception("Cette adresse mail n'est pas valide");
    }
} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}
