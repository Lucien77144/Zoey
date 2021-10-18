<?php

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
    
        $sql = "SELECT id, titre, resume FROM `blog`";
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
    
        $sql = "SELECT id, titre, resume, url_contenu_article FROM `blog` WHERE id = ?";
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

function getFeed(){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT idpost, post.description, media, date_publication, profil_animal_de_compagnie_idprofil_animal_de_compagnie idanimal, profil_animal_de_compagnie.nom
    FROM post
    INNER JOIN profil_animal_de_compagnie ON post.profil_animal_de_compagnie_idprofil_animal_de_compagnie = profil_animal_de_compagnie.idprofil_animal_de_compagnie
    ORDER BY date_publication DESC;";
    $req = $db -> prepare($sql);
    
    $req -> execute();

    if ($req->rowCount() <= 0)
        throw new Exception("Aucun post n'a été trouvé");

    return $req;
}

function getAnimalFeed(){
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0){
        $animalId = intval($_GET['id']);

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

    $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.photo, aa.description, aa.date_anniversaire anniversaire, refuge_idrefuge, refuge.nom refuge_nom, refuge.lien refuge_lien
    FROM animal_a_adopter aa
    INNER JOIN refuge ON refuge.idrefuge = aa.refuge_idrefuge;";
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

        $sql = "SELECT idanimal_a_adopter idaa, aa.nom, aa.photo, aa.description, aa.date_anniversaire anniversaire, refuge_idrefuge, refuge.nom refuge_nom, refuge.lien refuge_lien
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

function getAnimal(){
    if (isset($_GET['id']) && is_numeric($_GET['id']) && intval($_GET['id']) > 0){
        $animalId = intval($_GET['id']);

        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = "SELECT animal.nom nom_animal, animal.url_photo photo_animal, animal.description description_animal, animal.date_naissance, utilisateur_idutilisateur1 iduser, types_animaux_idtypes_animaux, utilisateur.pseudo pseudo_user, utilisateur.url_photo photo_user
        FROM profil_animal_de_compagnie animal
        INNER JOIN utilisateur ON animal.utilisateur_idutilisateur1 = utilisateur.idutilisateur
        WHERE idprofil_animal_de_compagnie = ?;";
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

        $sql = "SELECT idprofil_animal_de_compagnie idanimal, nom  nom_animal, url_photo photo_animal FROM profil_animal_de_compagnie WHERE utilisateur_idutilisateur1 = ?;";
        $req = $db -> prepare($sql);
        
        $req -> execute(array($userId));

        if ($req->rowCount() <= 0)
            return false;

        return $req;
    } else {
        throw new Exception("Nous n'avons pas trouvé ce compte");
    }
}