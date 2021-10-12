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

    $sql = "SELECT idpost, description, profil_animal_de_compagnie_idprofil_animal_de_compagnie animal FROM post";
    $req = $db -> prepare($sql);
    
    $req -> execute();

    if ($req->rowCount() <= 0)
        throw new Exception("Aucun post n'a été trouvé");

    return $req;
}