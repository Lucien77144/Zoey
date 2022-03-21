<?php

// this API generates a personnal token (when connection or verifyToken) to identify a user session

// sql send token
function sendToken()
{
    $newToken = bin2hex(random_bytes(35)); // new token
    $newzoeyaccount = array(
        'idUser' => $_SESSION['idUser'],
        'time' => time(),
        'token' => $newToken
    );

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = 'SELECT token FROM utilisateur WHERE idutilisateur = :id';
    $req = $db->prepare($sql);

    $req->execute(array(
        ':id' => $_SESSION['idUser']
    ));

    $data = $req->fetch(PDO::FETCH_ASSOC);
    if (isset($data['token']) && is_string($data['token'])) {
        $tokens = json_decode($data['token'], true); // tokens stored in DB

        if (isset($_COOKIE['zoeyaccount']) && is_string($_COOKIE['zoeyaccount'])) {
            $currentToken = json_decode($_COOKIE['zoeyaccount'], true); // local token
            if (isset($currentToken['token'])) {
                // do
                $known = false;
                foreach ($tokens as $token) {
                    if ($token['token'] == $currentToken['token']) {
                        $known = true;
                        $token['token'] = $newzoeyaccount['token'];
                        $token['time'] = $newzoeyaccount['time'];
                        break;
                    }
                }
                if (!$known) {
                    array_push($tokens, $newzoeyaccount);
                }
            } else {
                // no cookie
                $tokens = array($newzoeyaccount);
            }
        } else {
            // no cookie
            $tokens = array($newzoeyaccount);
        }
    } else {
        $tokens = array($newzoeyaccount);
    }

    setcookie("zoeyaccount", json_encode($newzoeyaccount), time() + 34559999, "/");

    $sql = 'UPDATE utilisateur SET token = :token WHERE idutilisateur = :id;';
    $req = $db->prepare($sql);

    $req->execute(array(
        ':token' => json_encode($tokens),
        ':id' => $_SESSION['idUser']
    ));

    return true;
}

// try {
//     if (isset($_SESSION['idUser'])) {
//         sendToken();
//     } else {
//         return false;
//     }
// } catch (Exception $e) {
//     $errorMsg = $e->getMessage();
//     echo $errorMsg;
// }
