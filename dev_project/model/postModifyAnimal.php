<?php
session_start();

require("model.php");

function postModifyAnimal()
{
    $nom = safeEntry($_POST['nom']);
    // $fileName = safeEntry($_POST['media']);
    $description = safeEntry($_POST['description']);
    // $date_naissance = safeEntry($_POST['date_naissance']);
    $idUser = $_SESSION['idUser'];
    // $postedIdType = intval(safeEntry($_POST['idtype']));
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

    // $types_animaux = getAnimalTypes();

    // if (!$types_animaux) { // renvoie false si aucune catégorie n'a été trouvée
    //     throw new Exception("Nous n'avons pas trouvé cette catégorie !");
    // } else {
    //     $categorie = $types_animaux->fetchAll();

    //     if ($postedIdType <= $types_animaux->rowCount()) {
    //         $idType = $categorie[$postedIdType]['id'];
    //     } else {
    //         throw new Exception("Nous n'avons pas trouvé cette catégorie !");
    //     }
    // }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    // $sql = "UPDATE profil_animal_de_compagnie 
    // SET nom = :nom, url_photo = :url_photo, description = :description, date_naissance = :date_naissance, types_animaux_idtypes_animaux = :idtype 
    // WHERE idprofil_animal_de_compagnie = :idanimal";
    $sql = "UPDATE profil_animal_de_compagnie 
    SET nom = :nom, description = :description 
    WHERE idprofil_animal_de_compagnie = :idanimal";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':nom' => $nom,
        // ':url_photo' => $fileName,
        ':description' => $description,
        // ':date_naissance' => $date_naissance,
        // ':idtype' => $idType,
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
        // && isset($_POST['date_naissance'])
        // && isset($_POST['idtype'])
        // && is_numeric($_POST['idtype'])
    ) {
        $postModifyAnimal = postModifyAnimal();
        echo $postModifyAnimal;
    } else {
        throw new Exception("Le profil n'a pas pu être modifié");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}
