<?php

function verifyToken(){
        
    function checkFromDb(){
        require("PDO.php");

        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        $sql = 'SELECT token FROM `utilisateur` WHERE idutilisateur = :id';
        $req = $db -> prepare($sql);
        
        $req -> execute(array(':id' => $_SESSION['idUser']));

        $storedToken = $req->fetch();

        $explodedToken = explode("-", $storedToken['token']);
        $currentTime = time();    

        if (($explodedToken[2] + 900) < $currentTime){
            return false;
        } else {
            if($_SESSION['token'] == $storedToken['token']){
                return true;
            }
        }
    }

    try {
        if (isset($_SESSION['idUser'])
        &&isset($_SESSION['token'])){
            $verifyToken = checkFromDb();
            return $verifyToken;
        } else {
            return false;
        }        
    } catch (Exception $e) {
        $errorMsg = $e->getMessage();
        echo $errorMsg;
        // require(BASE_URL . "view/errorView.php");
    }
}
