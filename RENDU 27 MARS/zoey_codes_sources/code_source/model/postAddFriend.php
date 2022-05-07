<?php
session_start();

// handles ajax calls to send a friend request

require("model.php");

function sendMail($to, $pseudo, $friend, $friendId)
{
    $subject = "$friend vous demande en ami sur Zoey";

    ob_start();
?>
    <html>

    <body>
        <h2>Zoey</h2>
        <h3>Acceptez <?= $friend ?> en Ami !</h3>
        <p>Bonjour <?= $pseudo ?>, <br>
            <?= $friend ?> vous demande en Ami sur Zoey, allez <a href="https://zoey-app.fr/index.php?action=account&id=<?= $friendId ?>">sur son profil</a> pour l'accepter.
        </p>
        <p>Pour nous contacter ou si vous avez besoin d'aide sur Zoey, vous pouvez écrire à <a href="mailto:contact@zoey-app.fr">contact@zoey-app.fr</a> ou répondre directement à ce mail.</p>
        <p>Retrouvez-nous également sur vos réseaux sociaux préférés : <a href="https://www.instagram.com/zoey.app/">Instagram</a>, <a href="https://www.tiktok.com/@zoey.app">Tiktok</a>, <a href="https://www.facebook.com/appli.zoey">Facebook</a> et <a href="https://www.linkedin.com/company/zoeyapp">LinkedIn</a>.</p>
        <p>À bientôt sur Zoey !</p>
    </body>

    </html>
<?php
    $message = ob_get_clean();

    $headers = "MIME-Version: 1.0" . "\r\n";
    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
    $headers .= 'From: contact@zoey-app.fr' . "\r\n";

    mail($to, $subject, $message, $headers);
}

function postAddFriend()
{
    $addFriendId = safeEntry($_POST['addFriendId']);
    $idUser = $_SESSION['idUser'];

    if (isFriend($addFriendId)) {
        return false;
    }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "INSERT INTO liste_amis (id_demandeur, id_receveur) VALUES (:idUser, :addFriendId)";
    $req = $db->prepare($sql);

    $valid = $req->execute(array(
        ':addFriendId' => $addFriendId,
        ':idUser' => $idUser
    ));


    if (!$valid) {
        return false;
    } else { // Si l'ajout d'un nouvel ami a fonctionné :

        // envoyer mail de notification
        $sql = "SELECT idutilisateur, pseudo, adresse_mail mail FROM `utilisateur` WHERE idutilisateur = :id";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':id' => $idUser
        ));
        $user = $req->fetchAll();

        $req->execute(array(
            ':id' => $addFriendId
        ));
        $friend = $req->fetchAll();

        sendMail($friend[0]['mail'], $friend[0]['pseudo'], $user[0]['pseudo'], $idUser);
    }

    return true;
}

try {
    if (
        isset($_POST['addFriendId'])
        && isset($_SESSION['idUser'])
    ) {
        $postAddFriend = postAddFriend();
        echo $postAddFriend;
    } else {
        return false;
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    return false;
}
