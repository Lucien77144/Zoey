<?php
session_start();

// add an animal in the adoption part (for admins only)

require("model.php");
require("verifyToken.php");

function postAjouterAA()
{
    $nom = safeEntry($_POST['nom']);
    $description = safeEntry($_POST['description']);
    $date_anniversaire = safeEntry($_POST['date_anniversaire']);
    $sexe = safeEntry($_POST['sexe']);
    $photo = safeEntry($_POST['photo']);
    $idrefuge = safeEntry($_POST['idrefuge']);
    $badge1 = safeEntry($_POST['badge1']);
    $badge2 = safeEntry($_POST['badge2']);
    $badge3 = safeEntry($_POST['badge3']);

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

    $sql = "INSERT INTO `animal_a_adopter` (`nom`, `sexe`, `photo`, `description`, `date_anniversaire`, `refuge_idrefuge`, `idtype`) VALUES (:nom, :sexe, :photo, :description, :date_anniversaire, :idrefuge, :idtype)";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':nom' => $nom,
        ':sexe' => $sexe,
        ':photo' => $photo,
        ':description' => $description,
        ':date_anniversaire' => $date_anniversaire,
        ':idtype' => $idType,
        ':idrefuge' => $idrefuge
    ));


    $createdAnimalId = $db->lastInsertId();

    if (!$req)
        throw new Exception("L'animal à adopter n'a pas pu être ajouté");

    // préparation ajout badges
    $sql = "INSERT INTO `animal_a_adopter_has_badge` (`animal_a_adopter_idanimal_a_adopter`, `badge_idbadge`) VALUES (:animalId, :badgeId);";
    $req = $db->prepare($sql);

    // ajout badge 1 (obligatoire)
    $req->execute(array(
        ':animalId' => $createdAnimalId,
        ':badgeId' => $badge1
    ));

    if (!$req)
        throw new Exception("Le badge n'a pas pu être ajouté");

    // ajout badge 2
    if (isset($badge2) && is_numeric($badge2)) {
        $req->execute(array(
            ':animalId' => $createdAnimalId,
            ':badgeId' => $badge2
        ));

        if (!$req)
            throw new Exception("Le badge n'a pas pu être ajouté");
    }

    // ajout badge 3
    if (isset($badge3) && is_numeric($badge3)) {
        $req->execute(array(
            ':animalId' => $createdAnimalId,
            ':badgeId' => $badge3
        ));

        if (!$req)
            throw new Exception("Le badge n'a pas pu être ajouté");
    }

    return "valid";
}

try {
    if (
        verifyToken()
        && $_SESSION['statut'] == 1 // checks for admins account rights
        && isset($_POST['nom'])
        && isset($_POST['sexe'])
        && isset($_POST['photo'])
        && isset($_POST['description'])
        && isset($_POST['idtype'])
        && is_numeric($_POST['idtype'])
        && isset($_POST['idrefuge'])
        && is_numeric($_POST['idrefuge'])
        && (isset($_POST['date_anniversaire']) || isset($_POST['unknownAge']))
        && isset($_POST['badge1'])
        && is_numeric($_POST['badge1'])
    ) {
        $postAjouterAA = postAjouterAA();
        echo $postAjouterAA;
    } else {
        throw new Exception("L'animal à adopter n'a pas pu être ajouté");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}
