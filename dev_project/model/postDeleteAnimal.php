<?php
session_start();

require("model.php");
require("verifyToken.php");

function postDeleteAnimal()
{
    $idanimal = safeEntry($_POST['idanimal']);

    // vérifier propriété de l'animal
    $accountAnimals = getAccountAnimals()->fetchAll();

    $animals = array();
    foreach ($accountAnimals as $animal) {
        array_push($animals, $animal['idanimal']);
    }
    if (!in_array($idanimal, $animals)) {
        return false;
    }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    // get and delete its image
    $sql = "SELECT url_photo photo FROM `profil_animal_de_compagnie` where idprofil_animal_de_compagnie = :idanimal";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':idanimal' => $idanimal
    ));

    $photo = $req->fetch();
    if (!empty($photo["photo"])) {
        unlink('../public/images/upload/' . $photo["photo"]);
    }

    // delete animal
    $sql = "DELETE FROM `profil_animal_de_compagnie` WHERE `idprofil_animal_de_compagnie` = :idanimal";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':idanimal' => $idanimal
    ));

    if (!$req)
        throw new Exception("L'animal n'a pas pu être supprimé");

    return "valid";
}

try {
    if (
        verifyToken()
        && isset($_POST['idanimal'])
    ) {
        $postDeleteAnimal = postDeleteAnimal();
        echo $postDeleteAnimal;
    } else {
        throw new Exception("L'animal n'a pas pu être supprimé");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    // echo $errorMsg;
}
