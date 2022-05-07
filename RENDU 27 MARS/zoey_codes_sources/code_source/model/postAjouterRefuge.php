<?php
session_start();

// add a partnership with a shelter (admins only)

require("model.php");
require("verifyToken.php");

function postAjouterRefuge()
{
    $nom = safeEntry($_POST['nom']);
    $maps = safeEntry($_POST['maps']);
    $lien = safeEntry($_POST['lien']);

    isset($_POST['description']) ? $description = safeEntry($_POST['description']) : $description = NULL;
    isset($_POST['logo']) ? $logo = safeEntry($_POST['logo']) : $logo = NULL;
    isset($_POST['adresse']) ? $adresse = safeEntry($_POST['adresse']) : $adresse = NULL;
    isset($_POST['tel']) ? $tel = safeEntry($_POST['tel']) : $tel = NULL;
    isset($_POST['mail']) ? $mail = safeEntry($_POST['mail']) : $mail = NULL;

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "INSERT INTO `refuge` (`nom`, `description`, `lien`, `adresse_mail`, `telephone`, `lien_maps`, `adresse`, `url_logo`) VALUES (:nom, :description, :lien, :adresse_mail, :telephone, :lien_maps, :adresse, :url_logo)";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':nom' => $nom,
        ':description' => $description,
        ':lien' => $lien,
        ':adresse_mail' => $mail,
        ':telephone' => $tel,
        ':lien_maps' => $maps,
        ':adresse' => $adresse,
        ':url_logo' => $logo
    ));

    if (!$req)
        throw new Exception("Le refuge n'a pas pu être ajouté");

    return "valid";
}

try {
    if (
        verifyToken()
        && $_SESSION['statut'] == 1
        && isset($_POST['nom'])
        && isset($_POST['maps'])
        && isset($_POST['mail'])
        && isset($_POST['lien'])
    ) {
        $postAjouterRefuge = postAjouterRefuge();
        echo $postAjouterRefuge;
    } else {
        throw new Exception("Le refuge n'a pas pu être ajouté");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
}
