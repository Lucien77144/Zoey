<?php
session_start();

// modify a user's account

require("model.php");
require("verifyToken.php");

function postModifyAccount()
{
    require("PDO.php");
    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    if ($_POST['setparam'] == "media") {

        // get and delete image
        $sql = "SELECT url_photo FROM utilisateur where idutilisateur = :idanimal";
        $req = $db->prepare($sql);
        $req->execute(array(
            ':idanimal' => 80
        ));
        $photo = $req->fetch();
        $deletePhoto = $photo["url_photo"];
        unlink('../public/images/upload/' . $deletePhoto);

        $sql = "UPDATE utilisateur SET url_photo = :setvalue WHERE idutilisateur = :id";
        $setvalue = safeEntry($_POST['setvalue']);
    } else if ($_POST['setparam'] == "nom") {
        $sql = "UPDATE utilisateur SET nom = :setvalue WHERE idutilisateur = :id";
        $setvalue = safeEntry($_POST['setvalue']);
    } else if ($_POST['setparam'] == "prenom") {
        $sql = "UPDATE utilisateur SET prenom = :setvalue WHERE idutilisateur = :id";
        $setvalue = safeEntry($_POST['setvalue']);
    } else if ($_POST['setparam'] == "mail") {
        $sql = "UPDATE utilisateur SET adresse_mail = :setvalue WHERE idutilisateur = :id";
        $setvalue = safeEntry($_POST['setvalue']);
    } else if ($_POST['setparam'] == "date_naissance") {
        $sql = "UPDATE utilisateur SET date_naissance = :setvalue WHERE idutilisateur = :id";
        $setvalue = safeEntry($_POST['setvalue']);
    } else if ($_POST['setparam'] == "password") {
        $sql = "UPDATE utilisateur SET mot_de_passe = :setvalue WHERE idutilisateur = :id";
        $setvalue = password_hash($_POST['setvalue'], PASSWORD_DEFAULT); // new hash
    } else if ($_POST['setparam'] == "pseudo") {
        if ((isset($_POST['setvalue']) && ($_POST['setvalue'] == $_SESSION['pseudo'])) || ($_POST['setvalue'] && isPseudoFree($_POST['setvalue']))) {
            $sql = "UPDATE utilisateur SET pseudo = :setvalue WHERE idutilisateur = :id";
            $setvalue = safeEntry($_POST['setvalue']);
        } else {
            throw new Exception("Ce pseudo existe déjà !");
        }
    } else {
        throw new Exception("Votre compte n'a pas pu être modifié.");
    }

    // $pseudo = safeEntry($_POST['pseudo']);
    // $fileName = safeEntry($_POST['media']);
    // $nom = safeEntry($_POST['nom']);
    // $prenom = safeEntry($_POST['prenom']);
    // $adresse_mail = safeEntry($_POST['mail']);
    // $date_naissance = safeEntry($_POST['date_naissance']);
    // $new_password_hash = password_hash($_POST['password'], PASSWORD_ARGON2I, ['memory_cost' => 2048, 'time_cost' => 4, 'threads' => 3]);

    $req = $db->prepare($sql);

    $req->execute(array(
        ':setvalue' => $setvalue,
        ':id' => $_SESSION['idUser']
    ));

    // if ($req->rowCount() <= 0)
    //     throw new Exception("Votre compte n'a pas pu être modifié, il y a une erreur dans les champs remplis.1");

    return "valid";
}

try {
    if (
        isset($_POST['setparam'])
        && isset($_POST['setvalue'])
        && verifyToken()
    ) {
        $postModifyAccount = postModifyAccount();
        echo $postModifyAccount;
    } else {
        throw new Exception("Votre compte n'a pas pu être modifié, il y a une erreur dans les champs remplis.");
    }
} catch (Exception $e) {
    // echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}
