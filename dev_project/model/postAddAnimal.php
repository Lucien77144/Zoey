<?php
session_start();

require("model.php");

function postAddAnimal()
{
    $nom = safeEntry($_POST['nom']);
    $fileName = safeEntry($_POST['media']);
    $description = safeEntry($_POST['description']);
    $date_naissance = safeEntry($_POST['date_naissance']);
    $idUser = $_SESSION['idUser'];
    $postedIdType = intval(safeEntry($_POST['idtype']));

    $types_animaux = getAnimalTypes();

    if (!$types_animaux) { // renvoie false si aucune catégorie n'a été trouvée
        throw new Exception("Nous n'avons pas trouvé cette catégorie !");
    } else {
        $categorie = $types_animaux->fetchAll();

        if ($postedIdType <= $types_animaux->rowCount()) {
            $idType = $categorie[$postedIdType]['id'];
        } else {
            throw new Exception("Nous n'avons pas trouvé cette catégorie !");
        }
    }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "INSERT INTO profil_animal_de_compagnie (nom, url_photo, `description`, date_naissance, utilisateur_idutilisateur1, types_animaux_idtypes_animaux) VALUES (:nom, :url_photo, :description, :date_naissance, :iduser, :idtype);";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':nom' => $nom,
        ':url_photo' => $fileName,
        ':description' => $description,
        ':date_naissance' => $date_naissance,
        ':iduser' => $idUser,
        ':idtype' => $idType
    ));

    if (!$req)
        throw new Exception("Le profil de " . $nom . " n'a pas pu être ajouté");

    return "valid";
}

try {
    if (
        isset($_POST['nom'])
        && isset($_POST['description'])
        && isset($_POST['date_naissance'])
        && isset($_POST['idtype'])
        && is_numeric($_POST['idtype'])
    ) {
        $postAddAnimal = postAddAnimal();
        echo $postAddAnimal;
    } else {
        throw new Exception("Le profil de n'a pas pu être ajouté");
    }
} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}
