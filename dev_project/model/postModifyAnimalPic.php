<?php
session_start();

require("model.php");

function sendPic()
{
    $fileName = safeEntry($_POST['pic']);
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
    SET url_photo = :pic
    WHERE idprofil_animal_de_compagnie = :idanimal";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':pic' => $fileName,
        'idanimal' => $idanimal
    ));

    if (!$req)
        throw new Exception("Le profil de " . $nom . " n'a pas pu être modifié");

    return "valid";
}

try {
    if (
        isset($_POST['pic'])
        && isset($_POST['idAnimal'])
    ) {
        $sendPic = sendPic();
        echo $sendPic;
    } else {
        throw new Exception("Le profil n'a pas pu être modifié");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}
