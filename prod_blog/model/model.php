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
    
        $sql = "SELECT id, titre, resume, url_image FROM `blog` ORDER BY id DESC";
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
    
        $sql = "SELECT *, DATE_FORMAT(date_publication, '%e/%c/%Y') date FROM blog WHERE id = ?";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($articleId));

        if ($req->rowCount() != 1)
            throw new Exception("Cet article n'existe pas !");

        return $req;
    } else {
        throw new Exception("Cet article n'existe pas !");
    }
}


function getFeedAdoption(){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.sexe, aa.photo, aa.description, aa.date_anniversaire anniversaire,
    types_animaux.nom type_nom
    FROM animal_a_adopter aa
    INNER JOIN types_animaux ON types_animaux.idtypes_animaux = aa.idtype";
    $req = $db -> prepare($sql);
    
    $req -> execute();

    if ($req->rowCount() <= 0)
        throw new Exception("Aucun animal n'a été trouvé");

    return $req;
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