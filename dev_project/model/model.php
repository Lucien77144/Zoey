<?php

// sécuriser les variables d'entrées de script (data utilisateur -> GET, POST...)
function safeEntry($validate){
    $validate = trim($validate);
    $validate = stripslashes($validate);
    $validate = htmlspecialchars($validate);
    return $validate;
}

function getBlog(){
        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    
        $sql = "SELECT id, titre, resume, url_image FROM `blog` ORDER BY date_publication DESC";
        $req = $db -> prepare($sql);
        
        $req -> execute();

        if ($req->rowCount() <= 0)
            throw new Exception("Aucun article n'a été trouvé");

        return $req;
}

function getArticle(){
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0){
        $articleId = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    
        $sql = "SELECT * FROM `blog` WHERE id = ?";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($articleId));

        if ($req->rowCount() != 1)
            throw new Exception("Cet article n'existe pas !");

        return $req;
    } else {
        throw new Exception("Cet article n'existe pas !");
    }
}

function isPseudoFree($entryPseudo){
    if (isset($entryPseudo)){

        $entryPseudo = safeEntry($entryPseudo);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    
        $sql = "SELECT pseudo FROM utilisateur WHERE pseudo = ?";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($entryPseudo));

        if ($req->rowCount() >= 1){
            return false;
        } else{
            return true;
        }
    } else {
        throw new Exception("Aucun pseudo renseigné");
    }
}

function getPseudoFromId($idUser){
    if (isset($idUser) && is_numeric($idUser) && intval($idUser) > 0){
        $idUser = intval($idUser);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    
        $sql = "SELECT pseudo FROM utilisateur WHERE idutilisateur = ?";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($idUser));

        if ($req->rowCount() > 1)
            throw new Exception("Nous n'avons pas trouvé ce pseudo");

        $pseudo = $req -> fetch();
        
        return $pseudo["pseudo"];
    } else {
        throw new Exception("Aucun pseudo renseigné");
    }
}

function getIdFromPseudo($pseudo){
    if (isset($pseudo)){

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    
        $sql = "SELECT idutilisateur id FROM utilisateur WHERE pseudo = ?";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($pseudo));

        if ($req->rowCount() > 1){
            // throw new Exception("Nous n'avons pas trouvé ce pseudo");
            return false;
        } else if ($req->rowCount() <= 0){
            // throw new Exception("Nous n'avons pas trouvé ce pseudo");
            return false;
        }            

        $id = $req -> fetch();
        
        return $id['id'];
    } else {
        throw new Exception("Aucun pseudo renseigné");
    }
}

function getFeed($num=1){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $start = ($num-1)*10;
    
    $sql = "SELECT idpost, post.description, media, date_publication, profil_animal_de_compagnie_idprofil_animal_de_compagnie idanimal, profil_animal_de_compagnie.nom
    FROM post
    INNER JOIN profil_animal_de_compagnie ON post.profil_animal_de_compagnie_idprofil_animal_de_compagnie = profil_animal_de_compagnie.idprofil_animal_de_compagnie
    ORDER BY date_publication DESC LIMIT 10 OFFSET $start";
    $req = $db -> prepare($sql);
    
    $req -> execute();

    return $req;
}

function getAnimalFeed($animalId){
    if (isset($animalId) && is_numeric($animalId) && intval($animalId) > 0){
        $animalId = intval($animalId);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT idpost, post.description, media, profil_animal_de_compagnie_idprofil_animal_de_compagnie idanimal, profil_animal_de_compagnie.nom
        FROM post
        INNER JOIN profil_animal_de_compagnie ON post.profil_animal_de_compagnie_idprofil_animal_de_compagnie = profil_animal_de_compagnie.idprofil_animal_de_compagnie
        WHERE profil_animal_de_compagnie_idprofil_animal_de_compagnie = ?;";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($animalId));

        if ($req->rowCount() <= 0)
            return false;

        return $req;
    } else {
        throw new Exception("Aucun animal n'a été trouvé");
    }
}

function getFeedAdoption(){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    if (isset($_GET['filter']) && is_numeric($_GET['filter'])){
        $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire,
        types_animaux.nom type_nom
        FROM animal_a_adopter aa
        INNER JOIN types_animaux ON types_animaux.idtypes_animaux = aa.idtype
        WHERE types_animaux.idtypes_animaux = ?
        ORDER BY idaa";
        $req = $db -> prepare($sql);
        $req -> execute(array(safeEntry($_GET['filter'])));
    } else {
        $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire,
        types_animaux.nom type_nom
        FROM animal_a_adopter aa
        INNER JOIN types_animaux ON types_animaux.idtypes_animaux = aa.idtype
        ORDER BY idaa";
        $req = $db -> prepare($sql);
        $req -> execute();
    }

    // if ($req->rowCount() <= 0)
    //     throw new Exception("Aucun animal n'a été trouvé");

    return $req;
}

function checkQuizz($userId){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT * FROM `utilisateur_has_badges` WHERE id_user = ?";
    $req = $db -> prepare($sql);
    $req -> execute(array($userId));

    if ($req->rowCount() <= 0) {
        return false;
    } else {
        return true;
    }
}

function getFeedAdoptionByMatch($userId){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql="SELECT idanimal_a_adopter idaa, idtype FROM `animal_a_adopter`";
    $req = $db -> prepare($sql);
    $req -> execute();
    $listeAA = $req->fetchAll();

    $sql="SELECT id_badge FROM `utilisateur_has_badges` WHERE id_user = ?";
    $req = $db -> prepare($sql);
    $req -> execute(array($userId));
    $fetchListeBadgesUser = $req->fetchAll(PDO::FETCH_NUM);

    $listeBadgesUser = [];
    foreach ($fetchListeBadgesUser as $badge) {
       array_push($listeBadgesUser, $badge[0]);
    }

    $sql="SELECT id_favoriteAnimal idfav FROM `utilisateur_has_favorite_animals` WHERE id_user = ?";
    $req = $db -> prepare($sql);
    $req -> execute(array($userId));
    $listeFavUser = $req->fetchAll(PDO::FETCH_ASSOC);

    $sql = "SELECT badge_idbadge idbadge FROM `animal_a_adopter_has_badge` WHERE animal_a_adopter_idanimal_a_adopter = ?";
    $badgeAA = $db -> prepare($sql);

    $matchList = [];
    foreach ($listeAA as $AA) {
        $score = 0;
        $badgeAA -> execute(array($AA['idaa']));
        $listeBadgesAA = $badgeAA->fetchAll();

        foreach ($listeBadgesAA as $badge) {
            if (in_array($badge['idbadge'], $listeBadgesUser)){
                $score += 20;
            }
        }

        foreach ($listeFavUser as $fav) {
            if ($AA['idtype'] == $fav["idfav"]){
                $score += 40;
                break;
            }
        }

        $matchList[$AA['idaa']] = $score;
    }

    arsort($matchList);
    $filter = 1;

    if (isset($_GET['filter']) && is_numeric($_GET['filter'])){
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
    
    $req = $db -> prepare($sql);

    $listeAnimaux = [];
    foreach ($matchList as $id => $score) {
        $req -> execute(array(
            ':idMatch' => $id,
            ':idFilter' => $filter
        ));

        if (!$req->rowCount() <= 0) {
            $animal = $req -> fetch();
            array_push($listeAnimaux, $animal);
        }        
    }
    return $listeAnimaux;
}

function getAdoptionAnimal(){
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0){
        $animalId = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire, 
        refuge_idrefuge, refuge.nom refuge_nom, refuge.lien refuge_lien, refuge.url_logo refuge_logo, refuge.adresse refuge_adresse, refuge.telephone refuge_telephone, refuge.adresse_mail refuge_mail, refuge.lien_maps maps
        FROM animal_a_adopter aa
        INNER JOIN refuge ON refuge.idrefuge = aa.refuge_idrefuge
        WHERE idanimal_a_adopter = ?";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($animalId));

        if ($req->rowCount() <= 0)
            throw new Exception("Aucun animal n'a été trouvé");

        return $req;
    } else {
        throw new Exception("Aucun animal n'a été trouvé");
    }
}

function getAdoptionAnimalBadges($animalId){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT idbadge, url_icone
    FROM animal_a_adopter_has_badge aahasbadge
    INNER JOIN badge ON badge.idbadge = aahasbadge.badge_idbadge
    INNER JOIN animal_a_adopter aa ON aa.idanimal_a_adopter = aahasbadge.animal_a_adopter_idanimal_a_adopter
    WHERE idanimal_a_adopter = ?;";
    $req = $db -> prepare($sql);
    
    $req -> execute(array($animalId));

    if ($req->rowCount() <= 0)
        throw new Exception("Aucun animal n'a été trouvé");

    return $req;
}



function getPost(){
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0){
        $idPost = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT idpost, post.description, media, profil_animal_de_compagnie_idprofil_animal_de_compagnie idanimal, profil_animal_de_compagnie.nom, profil_animal_de_compagnie.utilisateur_idutilisateur1 iduser
        FROM post
        INNER JOIN profil_animal_de_compagnie ON post.profil_animal_de_compagnie_idprofil_animal_de_compagnie = profil_animal_de_compagnie.idprofil_animal_de_compagnie
        WHERE idpost = ?;";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($idPost));

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
//         (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

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

function getAnimal($animalId){
    if (isset($animalId) && is_numeric($animalId) && intval($animalId) > 0){
        $animalId = intval($animalId);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT idprofil_animal_de_compagnie idanimal, animal.nom nom_animal, animal.url_photo photo_animal, animal.description description_animal, animal.date_naissance, utilisateur_idutilisateur1 iduser, types_animaux_idtypes_animaux, utilisateur.pseudo pseudo_user, utilisateur.url_photo photo_user
        FROM profil_animal_de_compagnie animal
        INNER JOIN utilisateur ON animal.utilisateur_idutilisateur1 = utilisateur.idutilisateur
        WHERE idprofil_animal_de_compagnie = ?";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($animalId));

        if ($req->rowCount() <= 0)
            throw new Exception("Ce profil d'animal de compagnie n'existe pas");

        return $req;
    } else {
        throw new Exception("Ce profil d'animal de compagnie n'existe pas");
    }
}

function getAccount(){
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0){
        $accountId = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT utilisateur.pseudo pseudo_user, utilisateur.url_photo photo_user, utilisateur.description, idutilisateur iduser
        FROM utilisateur
        WHERE idutilisateur = ?;";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($accountId));

        if ($req->rowCount() <= 0)
            throw new Exception("Ce compte n'existe pas");

        return $req;
    } else {
        throw new Exception("Ce compte n'existe pas");
    }
}

function getAccountAnimals(){
    if (!isset($_GET['id']) && isset($_SESSION['idUser'])){
        $_GET['id'] = $_SESSION['idUser'];
    }
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0){
        $userId = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT idprofil_animal_de_compagnie idanimal, nom FROM profil_animal_de_compagnie WHERE utilisateur_idutilisateur1 = ? ORDER BY `idanimal` ASC";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($userId));

        if ($req->rowCount() <= 0)
            return false;

        return $req;
    } else {
        throw new Exception("Nous n'avons pas trouvé ce compte");
    }
}

function getAnimalTypes(){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT idtypes_animaux id, nom, url_icone FROM types_animaux";
    $req = $db -> prepare($sql);
    
    $req -> execute();
    
    if ($req->rowCount() <= 0)
        throw new Exception("Aucune catégorie n'a été trouvée");

    return $req;
}

function getRefugesList(){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT idrefuge id, nom FROM refuge";
    $req = $db -> prepare($sql);
    
    $req -> execute();
    
    // if ($req->rowCount() <= 0)
    //     throw new Exception("Aucun refuge n'a été trouvé");

    return $req;
}

function getAAList(){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT 	idanimal_a_adopter id, animal_a_adopter.nom nom, refuge.nom refuge FROM `animal_a_adopter` INNER JOIN refuge ON animal_a_adopter.refuge_idrefuge = refuge.idrefuge";
    $req = $db -> prepare($sql);
    
    $req -> execute();
    
    // if ($req->rowCount() <= 0)
    //     throw new Exception("Aucun animal à adopter n'a été trouvé");

    return $req;
}

function getBadgesList(){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT idbadge id, nom FROM `badge`";
    $req = $db -> prepare($sql);
    
    $req -> execute();
    
    if ($req->rowCount() <= 0)
        throw new Exception("Aucun animal à adopter n'a été trouvé");

    return $req;
}

function getDirectConversation($idToSearch){
    if (isset($_SESSION['idUser']) && isset($idToSearch)){
        $idUser = $_SESSION['idUser'];

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

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
         );";
        $req = $db -> prepare($sql);
        
        $req -> execute(array(
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

function getConversationUsers($sentIdConv){ // renvoie les users d'une conversation
    if (isset($sentIdConv) && is_numeric($sentIdConv) && $sentIdConv != 0){
        $idConv = intval($sentIdConv);
    } else if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0){
        $idConv = intval($_GET['id']);
    } else {
        throw new Exception("La conversation n'a pas été trouvée");
    }

    if (!isset($flagConversationUsersPrepare)){ // check flag prepare PDO : don't prepare the request if already prepared
        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT idutilisateur user, utilisateur.pseudo pseudo, utilisateur.url_photo, conversation.titre
        FROM `conversation_has_utilisateur` 
        INNER JOIN utilisateur ON utilisateur.idutilisateur = conversation_has_utilisateur.utilisateur_idutilisateur
        inner join conversation on conversation.idconversation = conversation_has_utilisateur.conversation_idconversation
        WHERE conversation_has_utilisateur.conversation_idconversation = ?";
        $conversationUsers = $db -> prepare($sql);

        $flagConversationUsersPrepare = true; // flag prepare PDO
    }

    $conversationUsers -> execute(array($idConv));

    if ($conversationUsers->rowCount() <= 0)
        return false;

    return $conversationUsers;
}

function getMessages(){ // renvoie toutes les conversations d'un utilisateur
    if (isset($_SESSION['idUser'])){
        $idUser = $_SESSION['idUser'];

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT idconversation, titre
        FROM `conversation`
        INNER JOIN conversation_has_utilisateur ON conversation_has_utilisateur.conversation_idconversation = conversation.idconversation
        WHERE conversation_has_utilisateur.utilisateur_idutilisateur = ?;";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($idUser));

        if ($req->rowCount() <= 0)
            return false;

        return $req;
    } else {
        throw new Exception("Vous êtes déconnecté.");
    }
}

function getFilteredMessages($idToSearch){
    if (isset($_SESSION['idUser']) && isset($idToSearch)){
        $idUser = $_SESSION['idUser'];

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT filter.idconversation, filter.titre
        FROM (SELECT idconversation, titre
                FROM `conversation`
                INNER JOIN conversation_has_utilisateur ON conversation_has_utilisateur.conversation_idconversation = conversation.idconversation
                WHERE conversation_has_utilisateur.utilisateur_idutilisateur = :idUser) filter
        INNER JOIN conversation_has_utilisateur ON conversation_has_utilisateur.conversation_idconversation = filter.idconversation
        WHERE conversation_has_utilisateur.utilisateur_idutilisateur = :idToSearch";
        $req = $db -> prepare($sql);
        
        $req -> execute(array(
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

function getChat($offsetCoef){ // renvoie une seule conversation
    if (isset($_GET['id'])){
        $idConv = safeEntry($_GET['id']);
    } else if (isset($_POST['id'])){
        $idConv = safeEntry($_POST['id']);
    } else {
        throw new Exception("Nous n'avons pas trouvé cette conversation.");
    }
    
    $numberOfMessages = 10; // CHANGE HERE the number of messages printed at each call
    $offset = $offsetCoef * $numberOfMessages;

    if (!isset($flagGetChatPrepare)){ // check flag prepare PDO : don't prepare the request if already prepared

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT msg.* 
        FROM ( 
            SELECT idmessage, texte_message msg, url_media media, utilisateur_idutilisateur iduser, utilisateur_idutilisateur authorId, utilisateur.pseudo authorPseudo, conversation_idconversation idConv, utilisateur.url_photo authorPic
            FROM `message` 
            INNER JOIN utilisateur ON message.utilisateur_idutilisateur = utilisateur.idutilisateur
            WHERE conversation_idconversation = :idConv
            ORDER BY date_envoi_msg DESC LIMIT :offset, :numberOfMessages
        ) msg
        ORDER BY idmessage ASC";

        $req = $db -> prepare($sql);

        $flagGetChatPrepare = true; // flag prepare PDO
    }

    $req->bindValue(':numberOfMessages', $numberOfMessages, PDO::PARAM_INT); // only way to execute with parameters in LIMIT
    $req->bindValue(':idConv', $idConv, PDO::PARAM_INT);
    $req->bindValue(':offset', $offset, PDO::PARAM_INT);
    
    $req -> execute(
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