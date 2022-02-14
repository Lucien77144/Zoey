<?php

require("model.php");

function isEmailOk($str)
{
    return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? false : true;
}

function testSub()
{
    $google_sub = safeEntry($_POST['google_sub']);
    require("PDO.php");
    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT idutilisateur FROM `utilisateur` WHERE google_sub = :google_sub";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':google_sub' => $google_sub
    ));

    if ($req->rowCount() <= 0) {
        return "sub";
    } else {
        return true;
    }
}

function testMail()
{
    $adresse_mail = safeEntry($_POST['mail']);
    if (isEmailOk($adresse_mail)) {

        require("PDO.php");
        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT idutilisateur FROM `utilisateur` WHERE adresse_mail = :adresse_mail";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':adresse_mail' => $adresse_mail
        ));

        if ($req->rowCount() <= 0) {
            return "mail";
        } else {
            return true;
        }
    } else {
        return false;
    }
}

function postSubscribe()
{
    $pseudo = safeEntry($_POST['pseudo']);
    // $nom = safeEntry($_POST['nom']);
    // $prenom = safeEntry($_POST['prenom']);
    $adresse_mail = safeEntry($_POST['mail']);
    // $date_naissance = safeEntry($_POST['date_naissance']);
    // $new_password_hash = password_hash($_POST['password'], PASSWORD_ARGON2I, ['memory_cost' => 2048, 'time_cost' => 4, 'threads' => 3]);
    $new_password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

    if (isset($_POST["media"])) {
        $fileName = safeEntry($_POST['media']);
    } else {
        $fileName = "defaultProfile.jpg";
    }

    require("PDO.php");
    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    if (isset($_POST["google_sub"]) && testSub()) {
        $sql = "INSERT INTO utilisateur (pseudo, url_photo, adresse_mail, mot_de_passe, google_sub) VALUES (:pseudo, :url_photo, :adresse_mail, :mot_de_passe, :google_sub)";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':pseudo' => $pseudo,
            ':url_photo' => $fileName,
            ':adresse_mail' => $adresse_mail,
            ':google_sub' => safeEntry($_POST['google_sub'])
        ));

        if ($req->rowCount() <= 0)
            throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");

        return "valid";
    } else if (testMail()) {
        $sql = "INSERT INTO utilisateur (pseudo, url_photo, adresse_mail, mot_de_passe) VALUES (:pseudo, :url_photo, :adresse_mail, :mot_de_passe)";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':pseudo' => $pseudo,
            ':url_photo' => $fileName,
            ':adresse_mail' => $adresse_mail,
            ':mot_de_passe' => $new_password_hash
        ));

        if ($req->rowCount() <= 0)
            throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");

        return "valid";
    } else {
        throw new Exception("Votre mail est invalide ou est peut-être déjà utilisé avec un compte Zoey.");
    }
}

try {
    if (
        isset($_POST['pseudo'])
        && isPseudoFree($_POST['pseudo'])
        // &&isset($_POST['nom'])
        // &&isset($_POST['prenom'])
        // &&isset($_POST['mail'])
        // &&isset($_POST['date_naissance'])
        // && isset($_POST['password'])
    ) {

        $postSubscribe = postSubscribe();
        echo $postSubscribe;
    } else {
        throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");
    }
} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}
