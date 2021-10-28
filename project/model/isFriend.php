<?php

function isFriend_checkFromDb($idDest){
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = 'SELECT idliste_amis FROM `liste_amis` WHERE ((id_demandeur = :idDest AND id_receveur = :idUser) OR (id_demandeur = :idUser AND id_receveur = :idDest)) AND (id_bloqueur != :idDest AND id_bloqueur != :idUser)';
    $req = $db -> prepare($sql);
    
    $req -> execute(array(':idDest' => $idDest, ':idUser' => $_SESSION['idUser']));

    if ($req->rowCount() <= 0)
        return false;
    else
        return true;
}

function isFriend($idDest){
    try {
        if (isset($_SESSION['idUser'])
        &&isset($idDest)){
            $isFriend = isFriend_checkFromDb($idDest);
            return $isFriend;
        } else {
            return false;
        }        
    } catch (Exception $e) {
        $errorMsg = $e->getMessage();
        echo $errorMsg;
        // require(BASE_URL . "view/errorView.php");
    }
}