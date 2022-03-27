<?php
session_start();

// modify a user's animal's profile

require("model.php");

function postModifyAnimal()
{
    $nom = safeEntry($_POST['nom']);
    $description = safeEntry($_POST['description']);
    $idUser = $_SESSION['idUser'];
    $postedIdAnimal = intval(safeEntry($_POST['idAnimal']));

    $accountAnimals = getAccountAnimals();

    // Verify if the idAnimal posted matches one of the users pets
    $verifyIdAnimal = false;
    while ($animal = $accountAnimals->fetch()) {
        if ($postedIdAnimal == $animal['idanimal']) {
            $verifyIdAnimal = true;
        }
    }
    if (!$verifyIdAnimal) { // if not one of his pets
        throw new Exception("Nous n'avons pas pu ajouter un post pour cet animal.");
    } else {
        $idanimal = $postedIdAnimal;
    }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "UPDATE profil_animal_de_compagnie 
    SET nom = :nom, description = :description 
    WHERE idprofil_animal_de_compagnie = :idanimal";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':nom' => $nom,
        ':description' => $description,
        'idanimal' => $idanimal
    ));

    if (!$req)
        throw new Exception("Le profil de " . $nom . " n'a pas pu être modifié");

    return "valid";
}

try {
    if (
        isset($_POST['nom'])
        && isset($_POST['description'])
        && isset($_POST['idAnimal'])
    ) {
        $postModifyAnimal = postModifyAnimal();
        echo $postModifyAnimal;
    } else {
        throw new Exception("Le profil n'a pas pu être modifié");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
}
