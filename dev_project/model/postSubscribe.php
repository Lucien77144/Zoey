<?php

require("model.php");

function sendMail($pseudo, $to)
{
    $subject = 'Bienvenue ' . $pseudo . ' !';

    ob_start();
?>
    <html>

    <body>
        <h2>Zoey</h2>
        <h3>Bienvenue sur Zoey !</h3>
        <p><?= $pseudo ?>, vous êtes bien inscrit sur Zoey. Retrouvez <a href="zoey-app.fr/index.php?action=account">votre profil sur Zoey</a> et ajoutez vos animaux de compagnie !</p>
        <p>Retrouvez-nous également sur vos réseaux sociaux préférés : <a href="https://www.instagram.com/zoey.app/">Instagram</a>, <a href="https://www.tiktok.com/@zoey.app">Tiktok</a>, <a href="https://www.facebook.com/appli.zoey">Facebook</a> et <a href="https://www.linkedin.com/company/zoeyapp">LinkedIn</a>.</p>
        <p>Pour nous contacter ou si vous avez besoin d'aide sur Zoey, vous pouvez écrire à <a href="mailto:contact@zoey-app.fr">contact@zoey-app.fr</a> ou répondre directement à ce mail.</p>
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

function isEmailOk($str)
{
    return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? false : true;
}

function testSub()
{
    $google_sub = safeEntry($_POST['google_sub']);
    require("PDO.php");
    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT idutilisateur FROM `utilisateur` WHERE google_sub = :google_sub";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':google_sub' => $google_sub
    ));

    if ($req->rowCount() <= 0) {
        // echo 'sub';
        return true;
    } else {
        return false;
    }
}

function testMail()
{
    $adresse_mail = safeEntry($_POST['mail']);
    if (isEmailOk($adresse_mail)) {

        require("PDO.php");
        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idutilisateur FROM `utilisateur` WHERE adresse_mail = :adresse_mail";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':adresse_mail' => $adresse_mail
        ));

        if ($req->rowCount() <= 0) {
            // echo 'mail';
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

function postSubscribe()
{
    $pseudo = safeEntry($_POST['pseudo']);
    // $nom = safeEntry($_POST['nom']);
    // $prenom = safeEntry($_POST['prenom']);
    $adresse_mail = safeEntry($_POST['mail']);
    // $date_naissance = safeEntry($_POST['date_naissance']);
    // $new_password_hash = password_hash($_POST['password'], PASSWORD_ARGON2I, ['memory_cost' => 2048, 'time_cost' => 4, 'threads' => 3]);

    if (isset($_POST["media"])) {
        $fileName = safeEntry($_POST['media']);
    } else {
        $fileName = "defaultProfile.png";
    }

    require("PDO.php");
    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    if (isset($_POST["google_sub"]) && testSub()) {
        // google subscribe
        // if pseudo is already taken :
        while (!isPseudoFree($pseudo)) {
            $random = random_int(1000, 9999);
            $pseudo = $pseudo . '_' . $random;
        }
        // if google pseudo is free
        $sql = "INSERT INTO utilisateur (pseudo, url_photo, adresse_mail, google_sub) VALUES (:pseudo, :url_photo, :adresse_mail, :google_sub)";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':pseudo' => $pseudo,
            ':url_photo' => $fileName,
            ':adresse_mail' => $adresse_mail,
            ':google_sub' => safeEntry($_POST['google_sub'])
        ));

        if ($req->rowCount() <= 0)
            throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");

        sendMail($pseudo, $adresse_mail);
        return "valid";
    } else if (isPseudoFree($_POST['pseudo']) && testMail() && isset($_POST['password'])) {
        // regular subscribe
        $new_password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

        $sql = "INSERT INTO utilisateur (pseudo, url_photo, adresse_mail, mot_de_passe) VALUES (:pseudo, :url_photo, :adresse_mail, :mot_de_passe)";
        $req = $db->prepare($sql);

        $req->execute(array(
            ':pseudo' => $pseudo,
            ':url_photo' => $fileName,
            ':adresse_mail' => $adresse_mail,
            ':mot_de_passe' => $new_password_hash
        ));

        if ($req->rowCount() <= 0)
            throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");


        sendMail($pseudo, $adresse_mail);
        return "valid";
    } else {
        throw new Exception("Votre mail est invalide ou est peut-être déjà utilisé avec un compte Zoey.");
    }
}

try {
    if (
        isset($_POST['pseudo'])
        // && isPseudoFree($_POST['pseudo'])
        // &&isset($_POST['nom'])
        // &&isset($_POST['prenom'])
        && isset($_POST['mail'])
        // &&isset($_POST['date_naissance'])
        // && isset($_POST['password'])
    ) {

        $postSubscribe = postSubscribe();
        echo $postSubscribe;
    } else {
        throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}
