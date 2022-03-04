<?php
session_start();

require("model.php");
require("verifyToken.php");

function postDeleteAA()
{
    $idanimal = safeEntry($_POST['idanimal']);

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    // get and delete its image
    $sql = "SELECT photo FROM `animal_a_adopter` where idanimal_a_adopter = :idanimal";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':idanimal' => $idanimal
    ));

    $photo = $req->fetch();
    $deletePhoto = $photo["photo"];
    unlink('../public/images/upload/' . $deletePhoto);

    // delete animal_has_badges (foreign keys)
    $sql = "DELETE FROM `animal_a_adopter_has_badge` WHERE `animal_a_adopter_has_badge`.`animal_a_adopter_idanimal_a_adopter` = :idanimal";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':idanimal' => $idanimal
    ));

    if (!$req)
        throw new Exception("Les badges n'ont pas pu être supprimés");

    // delete animal
    $sql = "DELETE FROM `animal_a_adopter` WHERE `animal_a_adopter`.`idanimal_a_adopter` = :idanimal";
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
        && $_SESSION['statut'] == 1
        && isset($_POST['idanimal'])
    ) {
        $postDeleteAA = postDeleteAA();
        echo $postDeleteAA;
    } else {
        throw new Exception("L'animal n'a pas pu être supprimé");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}
