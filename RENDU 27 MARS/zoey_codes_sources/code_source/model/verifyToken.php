<?php
// this API checks if the user is connected and that his token is still valid

function connectFromCookie()
{
    if (isset($_COOKIE['zoeyaccount'])) {
        $zoeyaccount = json_decode($_COOKIE['zoeyaccount'], true);
        if (
            is_array($zoeyaccount)
            && isset($zoeyaccount['idUser'])
            && isset($zoeyaccount['time'])
            && isset($zoeyaccount['token'])
        ) {
            // ok
        } else {
            return false;
        }

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = 'SELECT token FROM `utilisateur` WHERE idutilisateur = :id';
        $req = $db->prepare($sql);

        $req->execute(array(':id' => $zoeyaccount['idUser']));

        $storedToken = $req->fetchAll(PDO::FETCH_ASSOC);

        if (isset($storedToken[0]['token'])) {
            $authorizedTokens = json_decode($storedToken[0]['token'], true);

            $currentTime = time();

            if ($authorizedTokens) {
                foreach ($authorizedTokens as $token) {
                    if (
                        isset($token['token']) && isset($token['time']) && isset($token['idUser'])
                        && $zoeyaccount['token'] == $token['token'] // ($token['time'] + 86400) < $currentTime && ($token['time'] + 15552000) > $currentTime
                    ) {
                        if ($token['time'] + 1296000 > $currentTime) { // valid for 15 days
                            $_SESSION['idUser'] = $token['idUser'];
                            require('generateToken.php');
                            return true;
                        } else {
                            return false;
                        }
                    }
                }
            }
        }
    }
}

function verifyToken()
{
    try {
        if (
            isset($_SESSION['idUser'])
        ) {
            return true;
        } else {
            if (connectFromCookie()) {
                return true;
            } else {
                return false;
            }
        }
    } catch (Exception $e) {
        $errorMsg = $e->getMessage();
    }
}
