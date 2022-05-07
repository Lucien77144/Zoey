<?php
session_start();

// handles ajax calls to add an animal

require("model.php");

function postAddAnimal()
{
    $nom = safeEntry($_POST['nom']);
    $fileName = safeEntry($_POST['media']);
    $description = safeEntry($_POST['description']);
    $date_naissance = null;
    $idUser = $_SESSION['idUser'];

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "INSERT INTO profil_animal_de_compagnie (nom, url_photo, `description`, date_naissance, utilisateur_idutilisateur1, types_animaux_idtypes_animaux) VALUES (:nom, :url_photo, :description, :date_naissance, :iduser, 4);";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':nom' => $nom,
        ':url_photo' => $fileName,
        ':description' => $description,
        ':date_naissance' => $date_naissance,
        ':iduser' => $idUser,
    ));

    if (!$req)
        throw new Exception("Le profil de " . $nom . " n'a pas pu être ajouté");

    return "valid";
}

try {
    if (
        isset($_POST['nom'])
        && isset($_POST['media'])
        && isset($_POST['description'])
    ) {
        $postAddAnimal = postAddAnimal();
        echo $postAddAnimal;
    } else {
        throw new Exception("Le profil de n'a pas pu être ajouté");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
}
