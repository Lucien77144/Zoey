<?php
session_start();

// this script handles ajax calls to modify one's pseudo and description on profile

require("model.php");
require("verifyToken.php");

function postModifyAccount()
{
    $pseudo = safeEntry($_POST['pseudo']);
    $desc = safeEntry($_POST['desc']);

    if ($_SESSION['pseudo'] != $pseudo && !isPseudoFree($pseudo)) {
        throw new Exception("Ce pseudo n'est pas disponible");
    }

    require("PDO.php");
    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "UPDATE utilisateur SET pseudo = :pseudo, description = :desc WHERE idutilisateur = :id";

    $req = $db->prepare($sql);

    $req->execute(array(
        ':pseudo' => $pseudo,
        ':desc' => $desc,
        ':id' => $_SESSION['idUser']
    ));

    $_SESSION['pseudo'] = $pseudo;

    return "valid";
}

try {
    if (
        verifyToken()
        && isset($_POST['pseudo'])
        && isset($_POST['desc'])
    ) {
        $postModifyAccount = postModifyAccount();
        echo $postModifyAccount;
    } else {
        throw new Exception("Votre compte n'a pas pu être modifié, il y a une erreur dans les champs remplis.");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}
