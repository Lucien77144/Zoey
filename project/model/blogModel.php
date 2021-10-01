<?php

require_once("PDO.php");

try {
    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "SELECT * FROM `blog`";
    $req = $db -> prepare($sql);
    
    $req -> execute();
    while ($data = $req -> fetch()){        

        $blogArticle[] = array(
            "title" => $data['titre'],
            "url" => $data['url_contenu_article']);
    }
    $req = null;

} catch (Exception $e) {
    die('Erreur : '.$e->getMessage());
};