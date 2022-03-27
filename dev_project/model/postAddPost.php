<?php
session_start();

// publish a post on the social network part

if (!isset($_SESSION['idUser']) && is_numeric($_SESSION['idUser'])) {
    exit('déconnecté');
}

require("model.php");

function postAddPost()
{

    $description = safeEntry($_POST['description']);
    $fileName = safeEntry($_POST['media']);
    $postedIdAnimal = intval(safeEntry($_POST['idAnimal']));
    $idUser = $_SESSION['idUser'];

    $accountAnimals = getAccountAnimals();

    if (!$accountAnimals) { // renvoie false si aucun animal lié à ce compte n'a été trouvé en bdd
        throw new Exception("Nous n'avons pas trouvé cet animal !");
    } else {
        $animal = $accountAnimals->fetchAll();

        if ($postedIdAnimal <= $accountAnimals->rowCount()) {
            $idAnimal = $animal[$postedIdAnimal]['idanimal'];
        } else {
            throw new Exception("Nous n'avons pas trouvé cet animal !");
        }
    }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "INSERT INTO post (description, media, profil_animal_de_compagnie_idprofil_animal_de_compagnie, profil_animal_de_compagnie_utilisateur_idutilisateur1) VALUES (:description, :media, :idAnimal, :idUser)";
    $req = $db->prepare($sql);

    $valid = $req->execute(array(
        ':description' => $description,
        ':media' => $fileName,
        ':idAnimal' => $idAnimal,
        ':idUser' => $idUser
    ));

    if (!$valid)
        throw new Exception("L'importation a échoué.");

    $id = $db->lastInsertId();
    return json_encode(array("valid", $id));
}

try {
    if (
        is_numeric($_POST['idAnimal'])
        && isset($_POST['description'])
        && isset($_POST['media'])
    ) {
        $postAddPost = postAddPost();
        echo $postAddPost;
    } else {
        throw new Exception("L'importation a échoué.");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
}
