<?php
session_start();

// delete a user's post

require("model.php");
require("verifyToken.php");

function postDeletePost()
{
    $idpost = safeEntry($_POST['idpost']);

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    // check if post belongs to user
    $sql = "SELECT profil_animal_de_compagnie_utilisateur_idutilisateur1 id FROM post where idpost = :idpost";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':idpost' => $idpost
    ));

    $user = $req->fetch();

    if ($user['id'] != $_SESSION['idUser']) {
        throw new Exception("Le post n'a pas pu être supprimé");
    }

    // get and delete its image
    $sql = "SELECT media FROM post where idpost = :idpost";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':idpost' => $idpost
    ));

    $photo = $req->fetch();
    if (!empty($photo["media"])) {
        unlink('../public/images/upload/' . $photo["media"]);
    }

    // delete post
    $sql = "DELETE FROM post WHERE idpost = :idpost";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':idpost' => $idpost
    ));

    if (!$req)
        throw new Exception("Le post n'a pas pu être supprimé");

    return "valid";
}

try {
    if (
        verifyToken()
        && isset($_POST['idpost'])
    ) {
        $postDeletePost = postDeletePost();
        echo $postDeletePost;
    } else {
        throw new Exception("Le post n'a pas pu être supprimé");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
}
