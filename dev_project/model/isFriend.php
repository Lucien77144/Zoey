<?php

// this API checks the friendship status of a given user

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
            return $isFriend;
        } else {
            return false;
        }
    } catch (Exception $e) {
        $errorMsg = $e->getMessage();
        echo $errorMsg;
    }
}
