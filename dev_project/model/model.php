<?php

// sécuriser les variables d'entrées de script (data utilisateur -> GET, POST...)
function safeEntry($validate)
{
    $validate = trim($validate);
    $validate = stripslashes($validate);
    // $validate = htmlspecialchars($validate);
    return $validate;
}

function getBlog()
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT id, titre, resume, url_image FROM `blog` ORDER BY date_publication DESC";
    $req = $db->prepare($sql);

    $req->execute();

    if ($req->rowCount() <= 0)
        throw new Exception("Aucun article n'a été trouvé");

    return $req;
}

function getArticle()
{
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0) {
        $articleId = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT * FROM `blog` WHERE id = ?";
        $req = $db->prepare($sql);

        $req->execute(array($articleId));

        if ($req->rowCount() != 1)
            throw new Exception("Cet article n'existe pas !");

        return $req;
    } else {
        throw new Exception("Cet article n'existe pas !");
    }
}

function isPseudoFree($entryPseudo)
{
    if (isset($entryPseudo)) {

        $entryPseudo = safeEntry($entryPseudo);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT pseudo FROM utilisateur WHERE pseudo = ?";
        $req = $db->prepare($sql);

        $req->execute(array($entryPseudo));

        if ($req->rowCount() >= 1) {
            return false;
        } else {
            return true;
        }
    } else {
        throw new Exception("Aucun pseudo renseigné");
    }
}

function isConnectedWithGoogle()
{
    if (isset($_SESSION['idUser'])) {

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT google_sub FROM utilisateur WHERE idutilisateur = ?";
        $req = $db->prepare($sql);

        $req->execute(array($_SESSION['idUser']));
        $fetch = $req->fetch(PDO::FETCH_ASSOC);
        if (isset($fetch['google_sub'])) {
            return true;
        } else {
            return false;
        }
    } else {
        throw new Exception("Déconnecté");
    }
}

function getPseudoFromId($idUser)
{
    if (isset($idUser) && is_numeric($idUser) && intval($idUser) > 0) {
        $idUser = intval($idUser);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT pseudo FROM utilisateur WHERE idutilisateur = ?";
        $req = $db->prepare($sql);

        $req->execute(array($idUser));

        if ($req->rowCount() > 1)
            throw new Exception("Nous n'avons pas trouvé ce pseudo");

        $pseudo = $req->fetch();

        return htmlspecialchars($pseudo["pseudo"]);
    } else {
        throw new Exception("Aucun pseudo renseigné");
    }
}

function getMailFromId($idUser)
{
    if (isset($idUser) && is_numeric($idUser) && intval($idUser) > 0) {
        $idUser = intval($idUser);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT adresse_mail mail FROM utilisateur WHERE idutilisateur = ?";
        $req = $db->prepare($sql);

        $req->execute(array($idUser));

        if ($req->rowCount() > 1)
            throw new Exception("Nous n'avons pas trouvé ce pseudo");

        $pseudo = $req->fetch();

        return htmlspecialchars($pseudo["mail"]);
    } else {
        throw new Exception("Aucun pseudo renseigné");
    }
}

function isUserConnected($idUser)
{
    if (isset($idUser) && is_numeric($idUser) && intval($idUser) > 0) {
        $idUser = intval($idUser);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT date_derniere_connexion lastDate FROM `utilisateur` WHERE idutilisateur = ?";
        $req = $db->prepare($sql);

        $req->execute(array($idUser));

        if ($req->rowCount() != 1)
            throw new Exception("Nous n'avons pas trouvé cet utilisateur");

        $user = $req->fetch();

        $currentTime = new DateTime();

        if (isset($user["lastDate"])) {
            $lastConnexion = new DateTime($user["lastDate"]);
            if (($lastConnexion->getTimestamp() - 3600 + 600) > $currentTime->getTimestamp()) { // 10 min
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    } else {
        throw new Exception("Aucun pseudo renseigné");
    }
}

function getConvReadState($idconv, $idUser)
{
    if (
        (isset($idconv) && is_numeric($idconv) && intval($idconv) > 0)
        && (isset($idUser) && is_numeric($idUser) && intval($idUser) > 0)
    ) {
        $idconv = intval($idconv);
        $idUser = intval($idUser);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT readstate FROM conversation_has_utilisateur WHERE conversation_idconversation = :idconv and utilisateur_idutilisateur = :iduser";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':idconv' => $idconv,
            ':iduser' => $idUser
        ));

        if ($req->rowCount() != 1)
            throw new Exception("Nous n'avons pas trouvé cette conversation");

        $pseudo = $req->fetch();

        return $pseudo["readstate"];
    } else {
        throw new Exception("Aucune conversation renseignée");
    }
}

function setConvReadState($idconv, $idUser, $newreadstate)
{
    if (
        (isset($idconv) && is_numeric($idconv) && intval($idconv) > 0)
        && (isset($idUser) && is_numeric($idUser) && intval($idUser) > 0)
        && (isset($newreadstate) && is_numeric($newreadstate) && (intval($newreadstate) == 1 || intval($newreadstate) == 2))
    ) {
        $idconv = intval($idconv);
        $idUser = intval($idUser);
        $newreadstate = intval($newreadstate);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "UPDATE conversation_has_utilisateur SET readstate = :readstate WHERE conversation_idconversation = :idconv and utilisateur_idutilisateur = :iduser";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':idconv' => $idconv,
            ':iduser' => $idUser,
            ':readstate' => $newreadstate
        ));

        return true;
    } else {
        throw new Exception("Aucune conversation renseignée");
    }
}

function getIdFromPseudoSearch($pseudo)
{
    if (isset($pseudo)) {

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idutilisateur id FROM utilisateur WHERE pseudo LIKE CONCAT('%', :search ,'%')";
        $req = $db->prepare($sql);

        $req->execute(array(':search' => $pseudo));

        $id = $req->fetchAll();

        return $id;
    } else {
        throw new Exception("Aucun pseudo renseigné");
    }
}

function getFeed($num = 1)
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $start = ($num - 1) * 10;

    $selected = "SELECT profil_animal_de_compagnie_utilisateur_idutilisateur1 idutilisateur, idpost, post.description, media, date_publication, profil_animal_de_compagnie_idprofil_animal_de_compagnie idanimal, profil_animal_de_compagnie.nom 
    FROM post 
    INNER JOIN profil_animal_de_compagnie ON post.profil_animal_de_compagnie_idprofil_animal_de_compagnie = profil_animal_de_compagnie.idprofil_animal_de_compagnie";

    if(isset($_GET['id'])){

        $id = htmlspecialchars($_GET['id']);
        $sql = "
        ($selected WHERE idpost = $id)
        UNION
        ($selected WHERE profil_animal_de_compagnie_idprofil_animal_de_compagnie =
        (SELECT profil_animal_de_compagnie_idprofil_animal_de_compagnie FROM post WHERE idpost = $id)
        ORDER BY date_publication DESC LIMIT 10 OFFSET $start)";

    }else{

        $sql = "
        $selected
        ORDER BY date_publication DESC LIMIT 10 OFFSET $start";
        
    }

    $req = $db->prepare($sql);

    $req->execute();

    return $req;
}

function getAnimalFeed($animalId)
{
    if (isset($animalId) && is_numeric($animalId) && intval($animalId) > 0) {
        $animalId = intval($animalId);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idpost, post.description, media, profil_animal_de_compagnie_idprofil_animal_de_compagnie idanimal, profil_animal_de_compagnie.nom
        FROM post
        INNER JOIN profil_animal_de_compagnie ON post.profil_animal_de_compagnie_idprofil_animal_de_compagnie = profil_animal_de_compagnie.idprofil_animal_de_compagnie
        WHERE profil_animal_de_compagnie_idprofil_animal_de_compagnie = ?;";
        $req = $db->prepare($sql);

        $req->execute(array($animalId));

        if ($req->rowCount() <= 0)
            return false;

        return $req;
    } else {
        throw new Exception("Aucun animal n'a été trouvé");
    }
}

function getFeedAdoption()
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    if (isset($_GET['filter']) && is_numeric($_GET['filter'])) {
        $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire,
        types_animaux.nom type_nom
        FROM animal_a_adopter aa
        INNER JOIN types_animaux ON types_animaux.idtypes_animaux = aa.idtype
        WHERE types_animaux.idtypes_animaux = ?
        ORDER BY idaa";
        $req = $db->prepare($sql);
        $req->execute(array(safeEntry($_GET['filter'])));
    } else {
        $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire, types_animaux.nom type_nom
            FROM animal_a_adopter aa
            INNER JOIN types_animaux ON types_animaux.idtypes_animaux = aa.idtype
            WHERE idanimal_a_adopter = 116
        UNION
        SELECT *
            FROM (
                SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire,
                    types_animaux.nom type_nom
                    FROM animal_a_adopter aa
                    INNER JOIN types_animaux ON types_animaux.idtypes_animaux = aa.idtype
                    ORDER BY idaa
            ) req1";
        $req = $db->prepare($sql);
        $req->execute();
    }

    // if ($req->rowCount() <= 0)
    //     throw new Exception("Aucun animal n'a été trouvé");

    return $req;
}

function checkQuizz($userId)
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT * FROM `utilisateur_has_badges` WHERE id_user = ?";
    $req = $db->prepare($sql);
    $req->execute(array($userId));

    if ($req->rowCount() <= 0) {
        return false;
    } else {
        return true;
    }
}

function getFeedAdoptionByMatch($userId)
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT idanimal_a_adopter idaa, idtype FROM `animal_a_adopter`";
    $req = $db->prepare($sql);
    $req->execute();
    $listeAA = $req->fetchAll();

    $sql = "SELECT id_badge FROM `utilisateur_has_badges` WHERE id_user = ?";
    $req = $db->prepare($sql);
    $req->execute(array($userId));
    $fetchListeBadgesUser = $req->fetchAll(PDO::FETCH_NUM);

    $listeBadgesUser = [];
    foreach ($fetchListeBadgesUser as $badge) {
        array_push($listeBadgesUser, $badge[0]);
    }

    $sql = "SELECT id_favoriteAnimal idfav FROM `utilisateur_has_favorite_animals` WHERE id_user = ?";
    $req = $db->prepare($sql);
    $req->execute(array($userId));
    $listeFavUser = $req->fetchAll(PDO::FETCH_ASSOC);

    $sql = "SELECT badge_idbadge idbadge FROM `animal_a_adopter_has_badge` WHERE animal_a_adopter_idanimal_a_adopter = ?";
    $badgeAA = $db->prepare($sql);

    $matchList = [];
    foreach ($listeAA as $AA) {
        $score = 0;
        $badgeAA->execute(array($AA['idaa']));
        $listeBadgesAA = $badgeAA->fetchAll();

        foreach ($listeBadgesAA as $badge) {
            if (in_array($badge['idbadge'], $listeBadgesUser)) {
                $score += 20;
            }
        }

        foreach ($listeFavUser as $fav) {
            if ($AA['idtype'] == $fav["idfav"]) {
                $score += 40;
                break;
            }
        }

        $matchList[$AA['idaa']] = $score;
    }

    arsort($matchList);
    $filter = 1;

    if (isset($_GET['filter']) && is_numeric($_GET['filter'])) {
        $filter = safeEntry($_GET['filter']);
        $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire,
        types_animaux.nom type_nom
        FROM animal_a_adopter aa
        INNER JOIN types_animaux ON types_animaux.idtypes_animaux = aa.idtype
        WHERE idanimal_a_adopter = :idMatch AND types_animaux.idtypes_animaux = :idFilter";
    } else {
        $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire,
        types_animaux.nom type_nom
        FROM animal_a_adopter aa
        INNER JOIN types_animaux ON types_animaux.idtypes_animaux = aa.idtype
        WHERE idanimal_a_adopter = :idMatch AND :idFilter=:idFilter";
    }

    $req = $db->prepare($sql);

    $listeAnimaux = [];
    foreach ($matchList as $id => $score) {
        $req->execute(array(
            ':idMatch' => $id,
            ':idFilter' => $filter
        ));

        if (!$req->rowCount() <= 0) {
            $animal = $req->fetch();
            array_push($listeAnimaux, $animal);
        }
    }
    return $listeAnimaux;
}

function getAdoptionAnimal()
{
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0) {
        $animalId = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire, 
        refuge_idrefuge, refuge.nom refuge_nom, refuge.lien refuge_lien, refuge.url_logo refuge_logo, refuge.adresse refuge_adresse, refuge.telephone refuge_telephone, refuge.adresse_mail refuge_mail, refuge.lien_maps maps
        FROM animal_a_adopter aa
        INNER JOIN refuge ON refuge.idrefuge = aa.refuge_idrefuge
        WHERE idanimal_a_adopter = ?";
        $req = $db->prepare($sql);

        $req->execute(array($animalId));

        if ($req->rowCount() <= 0)
            throw new Exception("Aucun animal n'a été trouvé");

        return $req;
    } else {
        throw new Exception("Aucun animal n'a été trouvé");
    }
}

function getAdoptionAnimalBadges($animalId)
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT idbadge, url_icone
    FROM animal_a_adopter_has_badge aahasbadge
    INNER JOIN badge ON badge.idbadge = aahasbadge.badge_idbadge
    INNER JOIN animal_a_adopter aa ON aa.idanimal_a_adopter = aahasbadge.animal_a_adopter_idanimal_a_adopter
    WHERE idanimal_a_adopter = ?;";
    $req = $db->prepare($sql);

    $req->execute(array($animalId));

    if ($req->rowCount() <= 0)
        throw new Exception("Aucun animal n'a été trouvé");

    return $req;
}

function getPost()
{
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0) {
        $idPost = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT profil_animal_de_compagnie_utilisateur_idutilisateur1 idutilisateur, idpost, post.description, media, profil_animal_de_compagnie_idprofil_animal_de_compagnie idanimal, profil_animal_de_compagnie.nom, profil_animal_de_compagnie.utilisateur_idutilisateur1 iduser, date_publication
        FROM post
        INNER JOIN profil_animal_de_compagnie ON post.profil_animal_de_compagnie_idprofil_animal_de_compagnie = profil_animal_de_compagnie.idprofil_animal_de_compagnie
        WHERE idpost = ?;";
        $req = $db->prepare($sql);

        $req->execute(array($idPost));

        if ($req->rowCount() <= 0)
            throw new Exception("Ce post n'existe pas !");

        return $req;
    } else {
        throw new Exception("Ce post n'existe pas !");
    }
}

//    OLD VERSION GET ANIMAL

// function getAnimal(){
//     if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0){
//         $animalId = intval($_GET['id']);

//         require("PDO.php");

//         $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
//         (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

//         $sql = "SELECT idprofil_animal_de_compagnie idanimal, animal.nom nom_animal, animal.url_photo photo_animal, animal.description description_animal, animal.date_naissance, utilisateur_idutilisateur1 iduser, types_animaux_idtypes_animaux, utilisateur.pseudo pseudo_user, utilisateur.url_photo photo_user
//         FROM profil_animal_de_compagnie animal
//         INNER JOIN utilisateur ON animal.utilisateur_idutilisateur1 = utilisateur.idutilisateur
//         WHERE idprofil_animal_de_compagnie = ?;";
//         $req = $db -> prepare($sql);

//         $req -> execute(array($animalId));

//         if ($req->rowCount() <= 0)
//             throw new Exception("Ce profil d'animal de compagnie n'existe pas");

//         return $req;
//     } else {
//         throw new Exception("Ce profil d'animal de compagnie n'existe pas");
//     }
// }

function getAnimal($animalId = null)
{
    if (isset($animalId) && is_numeric($animalId) && intval($animalId) > 0) {
        $animalId = intval($animalId);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idprofil_animal_de_compagnie idanimal, animal.nom nom_animal, animal.url_photo photo_animal, animal.description description_animal, animal.date_naissance, utilisateur_idutilisateur1 iduser, types_animaux_idtypes_animaux, utilisateur.pseudo pseudo_user, utilisateur.url_photo photo_user
        FROM profil_animal_de_compagnie animal
        INNER JOIN utilisateur ON animal.utilisateur_idutilisateur1 = utilisateur.idutilisateur
        WHERE idprofil_animal_de_compagnie = ?";
        $req = $db->prepare($sql);

        $req->execute(array($animalId));

        if ($req->rowCount() <= 0)
            throw new Exception("Ce profil d'animal de compagnie n'existe pas");

        return $req;
    } else {
        throw new Exception("Ce profil d'animal de compagnie n'existe pas");
    }
}

function getAccount(int $id = null)
{
    if (isset($id)) {
        $accountId = $id;
    } else if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0) {
        $accountId = intval($_GET['id']);
    } else {
        throw new Exception("Ce compte n'existe pas");
    }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT utilisateur.pseudo pseudo_user, utilisateur.url_photo photo_user, utilisateur.description, idutilisateur iduser
        FROM utilisateur
        WHERE idutilisateur = ?";
    $req = $db->prepare($sql);

    $req->execute(array($accountId));

    if ($req->rowCount() <= 0)
        throw new Exception("Ce compte n'existe pas");

    return $req;
}

function getAccountAnimals()
{
    if (!isset($_GET['id']) && isset($_SESSION['idUser'])) {
        $_GET['id'] = $_SESSION['idUser'];
    }
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0) {
        $userId = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idprofil_animal_de_compagnie idanimal, nom, url_photo FROM profil_animal_de_compagnie WHERE utilisateur_idutilisateur1 = ? ORDER BY `idanimal` ASC";
        $req = $db->prepare($sql);

        $req->execute(array($userId));

        if ($req->rowCount() <= 0)
            return false;

        return $req;
    } else {
        throw new Exception("Nous n'avons pas trouvé ce compte");
    }
}

function getAnimalTypes()
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT idtypes_animaux id, nom, url_icone FROM types_animaux ORDER BY typeOrder;";
    $req = $db->prepare($sql);

    $req->execute();

    if ($req->rowCount() <= 0)
        throw new Exception("Aucune catégorie n'a été trouvée");

    return $req;
}

function getRefugesList()
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT idrefuge id, nom FROM refuge";
    $req = $db->prepare($sql);

    $req->execute();

    // if ($req->rowCount() <= 0)
    //     throw new Exception("Aucun refuge n'a été trouvé");

    return $req;
}

function getAAList()
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT 	idanimal_a_adopter id, animal_a_adopter.nom nom, refuge.nom refuge FROM `animal_a_adopter` INNER JOIN refuge ON animal_a_adopter.refuge_idrefuge = refuge.idrefuge";
    $req = $db->prepare($sql);

    $req->execute();

    // if ($req->rowCount() <= 0)
    //     throw new Exception("Aucun animal à adopter n'a été trouvé");

    return $req;
}

function getBadgesList()
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT idbadge id, nom FROM `badge`";
    $req = $db->prepare($sql);

    $req->execute();

    if ($req->rowCount() <= 0)
        throw new Exception("Aucun animal à adopter n'a été trouvé");

    return $req;
}

function getDirectConversation($idToSearch)
{
    if (isset($_SESSION['idUser']) && isset($idToSearch)) {
        $idUser = $_SESSION['idUser'];

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idconversation
        FROM `conversation`
        INNER JOIN conversation_has_utilisateur ON conversation_has_utilisateur.conversation_idconversation = conversation.idconversation
         WHERE conversation_has_utilisateur.utilisateur_idutilisateur = :idToSearch AND conversation.idconversation IN (
                 SELECT idconversation
                FROM `conversation`
                INNER JOIN conversation_has_utilisateur ON conversation_has_utilisateur.conversation_idconversation = conversation.idconversation
                 WHERE conversation_has_utilisateur.utilisateur_idutilisateur = :idUser
         ) AND conversation.idconversation IN (
                 SELECT conversation_idconversation FROM `conversation_has_utilisateur` GROUP BY conversation_idconversation HAVING count(*) = 2
         )";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':idUser' => $idUser,
            ':idToSearch' => $idToSearch
        ));

        if ($req->rowCount() <= 0)
            return false;

        return $req;
    } else {
        throw new Exception("Vous êtes déconnecté.");
    }
}

function getConversationUsers($sentIdConv)
{ // renvoie les users d'une conversation
    if (isset($sentIdConv) && is_numeric($sentIdConv) && $sentIdConv != 0) {
        $idConv = intval($sentIdConv);
    } else if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0) {
        $idConv = intval($_GET['id']);
    } else {
        throw new Exception("La conversation n'a pas été trouvée");
    }

    if (!isset($flagConversationUsersPrepare)) { // check flag prepare PDO : don't prepare the request if already prepared
        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idutilisateur user, utilisateur.pseudo pseudo, utilisateur.url_photo url_photo, conversation.titre
        FROM `conversation_has_utilisateur` 
        INNER JOIN utilisateur ON utilisateur.idutilisateur = conversation_has_utilisateur.utilisateur_idutilisateur
        inner join conversation on conversation.idconversation = conversation_has_utilisateur.conversation_idconversation
        WHERE conversation_has_utilisateur.conversation_idconversation = ?";
        $conversationUsers = $db->prepare($sql);

        $flagConversationUsersPrepare = true; // flag prepare PDO
    }

    $conversationUsers->execute(array($idConv));

    if ($conversationUsers->rowCount() <= 0)
        return false;

    return $conversationUsers;
}

function getMessages()
{ // renvoie toutes les conversations d'un utilisateur
    if (isset($_SESSION['idUser'])) {
        $idUser = $_SESSION['idUser'];

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idconversation, titre
        FROM `conversation`
        INNER JOIN conversation_has_utilisateur ON conversation_has_utilisateur.conversation_idconversation = conversation.idconversation
        WHERE conversation_has_utilisateur.utilisateur_idutilisateur = ?;";
        $req = $db->prepare($sql);

        $req->execute(array($idUser));

        if ($req->rowCount() <= 0)
            return false;

        return $req;
    } else {
        throw new Exception("Vous êtes déconnecté.");
    }
}

function getFilteredMessages($idToSearch)
{
    if (isset($_SESSION['idUser']) && isset($idToSearch)) {
        $idUser = $_SESSION['idUser'];

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        // get user's conv
        // get these conv's users
        // keep only the convs where idToSearch is member of the conv

        $sql = "SELECT filter.idconversation id
        FROM (
            SELECT idconversation
                FROM `conversation`
                INNER JOIN conversation_has_utilisateur ON conversation_has_utilisateur.conversation_idconversation = conversation.idconversation
                WHERE conversation_has_utilisateur.utilisateur_idutilisateur = :idUser
            ) filter
        INNER JOIN conversation_has_utilisateur ON conversation_has_utilisateur.conversation_idconversation = filter.idconversation
        WHERE conversation_has_utilisateur.utilisateur_idutilisateur = :idToSearch";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':idUser' => $idUser,
            ':idToSearch' => $idToSearch
        ));

        if ($req->rowCount() <= 0)
            return false;

        return $req->fetch(PDO::FETCH_ASSOC);
    } else {
        throw new Exception("Vous êtes déconnecté.");
    }
}

function getChat($offsetCoef)
{ // renvoie une seule conversation
    if (isset($_GET['id'])) {
        $idConv = safeEntry($_GET['id']);
    } else if (isset($_POST['id'])) {
        $idConv = safeEntry($_POST['id']);
    } else {
        throw new Exception("Nous n'avons pas trouvé cette conversation.");
    }

    $numberOfMessages = 10; // CHANGE HERE the number of messages printed at each call
    $offset = $offsetCoef * $numberOfMessages;

    if (!isset($flagGetChatPrepare)) { // check flag prepare PDO : don't prepare the request if already prepared

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT msg.* 
        FROM ( 
            SELECT idmessage, texte_message msg, url_media media, utilisateur_idutilisateur iduser, utilisateur_idutilisateur authorId, utilisateur.pseudo authorPseudo, conversation_idconversation idConv, utilisateur.url_photo authorPic, date_envoi_msg, tag
            FROM `message` 
            INNER JOIN utilisateur ON message.utilisateur_idutilisateur = utilisateur.idutilisateur
            WHERE conversation_idconversation = :idConv
            ORDER BY date_envoi_msg DESC LIMIT :offset, :numberOfMessages
        ) msg
        ORDER BY idmessage ASC";

        $req = $db->prepare($sql);

        $flagGetChatPrepare = true; // flag prepare PDO
    }

    $req->bindValue(':numberOfMessages', $numberOfMessages, PDO::PARAM_INT); // only way to execute with parameters in LIMIT
    $req->bindValue(':idConv', $idConv, PDO::PARAM_INT);
    $req->bindValue(':offset', $offset, PDO::PARAM_INT);

    $req->execute(
        // array(
        // ':idConv' => $idConv
        // ':numberOfMessages' => (int)$numberOfMessages // can't bind parameters in LIMIT
        // ':offset' => "0"
        // )
    );

    if ($req->rowCount() <= 0)
        return false;

    return $req;
}

function decrypt($ciphertext, $tag, $path = null)
{
    // decrypt
    $path .= "private_crypt/key.json";
    $ressource = fopen($path, 'r');
    $stored = fread($ressource, filesize($path));
    $stored = json_decode($stored, true);
    $key = base64_decode($stored['key']);
    $iv = base64_decode($stored['iv']);
    // tag and ciphertext from db
    $original_plaintext = openssl_decrypt($ciphertext, "aes-128-gcm", $key, $options = 0, $iv, $tag);

    if ($original_plaintext) {
        return $original_plaintext;
    } else {
        return false;
    }
}

function getLastMessagePreview(int $idconv, $path = './')
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT idutilisateur, texte_message msg, url_media media, date_envoi_msg, tag
	FROM `message` 
	INNER JOIN utilisateur ON message.utilisateur_idutilisateur = utilisateur.idutilisateur
	WHERE conversation_idconversation = :idConv
	ORDER BY date_envoi_msg DESC
    LIMIT 1";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':idConv' => $idconv
    ));

    if ($req->rowCount() != 1)
        return "Envoyez le premier le message";

    $msg = $req->fetchAll();
    if (!empty($msg[0]['msg'])) {
        $sender = getPseudoFromId($msg[0]['idutilisateur']);
        $txt = substr(decrypt($msg[0]['msg'], $msg[0]['tag'], $path), 0, 40);
        return $sender . ' : ' . $txt . '...';
    } else if (!empty($msg[0]['media'])) {
        $sender = getPseudoFromId($msg[0]['idutilisateur']);
        return $sender . ' : voir la photo';
    } else {
        return "Envoyez le premier le message !";
    }
}

function isFriend_checkFromDb($idDest)
{
    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = 'SELECT id_demandeur, idliste_amis, statut, id_bloqueur FROM `liste_amis` 
            WHERE ((id_demandeur = :idDest AND id_receveur = :idUser) OR (id_demandeur = :idUser AND id_receveur = :idDest))'; // statut : 0 en attente, 1 amis, 2 bloqué

    $req = $db->prepare($sql);

    $req->execute(array(':idDest' => $idDest, ':idUser' => $_SESSION['idUser']));

    if ($req->rowCount() <= 0) {
        return false;
    } else {
        if ($req->rowCount() == 1) {
            $statut = $req->fetchAll(PDO::FETCH_ASSOC);

            if ($statut[0]['statut'] == 1) { // 1 : en attente

                if ($statut[0]['id_demandeur'] == $_SESSION['idUser']) {
                    return 11; // 11 : en attente, utilisateur demandeur
                } else if ($statut[0]['id_demandeur'] == $idDest) {
                    return 12; // 12 : en attente, utilisateur receveur
                } else {
                    throw new Exception("Nous n'avons pas trouvé cet utilisateur");
                }
            } else {
                return $statut[0]['statut']; // renvoie -> 2: ami, 3: bloqué
            }

            $statut[0]['statut'];
        } else {
            throw new Exception("Nous n'avons pas trouvé cet utilisateur");
        }
    }
}
function isFriend($idDest)
{
    try {
        if (
            isset($_SESSION['idUser'])
            && isset($idDest)
        ) {
            $isFriend = isFriend_checkFromDb($idDest);
            return $isFriend; //renvoie 1, 11, 12, 2 (ami), 3
        } else {
            return false;
        }
    } catch (Exception $e) {
        $errorMsg = $e->getMessage();
        echo $errorMsg;
    }
}
