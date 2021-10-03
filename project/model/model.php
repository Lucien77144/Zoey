<?php

function getBlog(){
    try {
        require_once("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    
        $sql = "SELECT * FROM `blog`";
        $req = $db -> prepare($sql);
        
        $req -> execute();

        return $req;

        $req = null;
    
    } catch (Exception $e) {
        die('Erreur : '.$e->getMessage());
    }
}