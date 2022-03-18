<?php
session_start();

require('model.php');

function postConnect()
{
    $pseudo = safeEntry($_POST['pseudo']);

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = 'SELECT idutilisateur, pseudo, mot_de_passe, statut FROM utilisateur WHERE pseudo = :loginin OR adresse_mail = :loginin';
    $req = $db->prepare($sql);
    $req->bindValue(':loginin', $pseudo, PDO::PARAM_STR);

    $req->execute();

    $user = $req->fetch();

    if ($req->rowCount() == 1) {
        if (password_verify($_POST['password'], $user['mot_de_passe'])) {

            $_SESSION['idUser'] = $user['idutilisateur'];
            $_SESSION['pseudo'] = $user['pseudo'];
            $_SESSION['statut'] = $user['statut'];
            require('generateToken.php');

            return "valid";
        } else {
            return "invalid";
        }
    } else {
        return "unknown user";
    }
}

function postConnectWithGoogle()
{
    $mail = safeEntry($_POST['mail']);
    $sub = safeEntry($_POST['google_sub']);

    require("PDO.php");
    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = 'SELECT idutilisateur, pseudo, statut, google_sub FROM utilisateur WHERE adresse_mail = ?';
    $req = $db->prepare($sql);

    $req->execute(array($mail));

    $user = $req->fetch();

    if ($req->rowCount() == 1) {
        if ($sub == $user['google_sub']) {

            $_SESSION['idUser'] = $user['idutilisateur'];
            $_SESSION['pseudo'] = $user['pseudo'];
            $_SESSION['statut'] = $user['statut'];
            require('generateToken.php');

            return "valid";
        } else {
            return "invalid";
        }
    } else {
        return "unknown user";
    }
}

try {
    if (
        isset($_POST['pseudo'])
        && isset($_POST['password'])
    ) {
        $postConnect = postConnect();
        echo $postConnect;
    } else if (
        isset($_POST['mail'])
        && isset($_POST['google_sub'])
    ) {
        $postConnectWithGoogle = postConnectWithGoogle();
        echo $postConnectWithGoogle;
    } else {
        throw new Exception("La connexion a échouée, il y a une erreur dans les champs remplis.");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}
