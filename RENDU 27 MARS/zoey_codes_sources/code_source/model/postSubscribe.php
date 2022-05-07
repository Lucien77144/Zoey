<?php

require("model.php");

// handles informations given by user (or by google) to create an account

function sendMail($pseudo, $to)
{
    $subject = 'Bienvenue ' . $pseudo . ' !';

    ob_start();
?>
    <html>

    <body>
        <h2>Zoey</h2>
        <h3>Bienvenue sur Zoey !</h3>
        <p><?= $pseudo ?>, vous êtes bien inscrit sur Zoey. Retrouvez <a href="https://zoey-app.fr/index.php?action=account">votre profil sur Zoey</a> 😻.</p>
        <p>Pour commencer, ajoutez sur votre profil vos animaux de compagnie : chiens, chats, lapins, poissons, tortues ou autres reptiles... Zoey est le premier réseau social dédié à tous vos fidèles compagnons ! Vous pouvez ensuite poster des images de chacun de vos animaux pour partager leur vie et votre expérience avec la communauté.</p>
        <p>En vous inscrivant, vous acceptez et vous vous engagez à respecter les <a href="zoey-app.fr/index.php?action=legal">conditions d'utilisation de Zoey</a>.</p>
        <p>Pour rappel, cela signifie notamment que <strong>vous avez plus de 18 ans</strong> (ou que vous utilisez la plateforme sous la supervision d'un responsable légal), et que vous vous engagez à <strong>ne poster que du contenu approprié</strong> sur la plateforme.</p>
        <p>Retrouvez-nous également sur vos réseaux sociaux préférés : <a href="https://www.instagram.com/zoey.app/">Instagram</a>, <a href="https://www.tiktok.com/@zoey.app">Tiktok</a>, <a href="https://www.facebook.com/appli.zoey">Facebook</a> et <a href="https://www.linkedin.com/company/zoeyapp">LinkedIn</a>.</p>
        <p>Pour nous contacter ou si vous avez besoin d'aide sur Zoey, vous pouvez écrire à <a href="mailto:contact@zoey-app.fr">contact@zoey-app.fr</a> ou répondre directement à ce mail.</p>
        <p>À tout de suite sur Zoey !</p>
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
    if (preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) {
        $path = "disposable_mail.json";
        $ressource = fopen($path, 'r');
        $list_json = fread($ressource, filesize($path));
        $list_array = json_decode($list_json, true);
        $exploded_mail = explode('@', $str);
        $mail_domaine = $exploded_mail[1];
        foreach ($list_array as $disposable_mail) {
            if ($mail_domaine == $disposable_mail['mail'])
                return false;
        }
        return true;
    } else {
        return false;
    }
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
    $adresse_mail = safeEntry($_POST['mail']);

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

        if (!empty($_POST['recaptcha_response'])) {
            // handle reCaptcha
            // Build POST request:
            $recaptcha_url = 'https://www.google.com/recaptcha/api/siteverify';
            $recaptcha_secret = '6Ld4D9oeAAAAAFTmDjSDluQsDJdUd-VAdIAo6iVx';
            $recaptcha_response = $_POST['recaptcha_response'];

            // Make and decode POST request:
            $recaptcha = file_get_contents($recaptcha_url . '?secret=' . $recaptcha_secret . '&response=' . $recaptcha_response);
            $recaptcha = json_decode($recaptcha);

            // Take action based on the score returned:
            if ($recaptcha->success == true && $recaptcha->score >= 0.5) {
                // Verified - send email
                // register
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
                    throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.3");


                sendMail($pseudo, $adresse_mail);
                return "valid";
            } else {
                throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.2");
            }
        } else {
            throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.1");
        }
    } else {
        throw new Exception("Votre mail est invalide ou est peut-être déjà utilisé avec un compte Zoey.4");
    }
}

try {
    if (
        isset($_POST['pseudo'])
        && isset($_POST['mail'])
    ) {

        $postSubscribe = postSubscribe();
        echo $postSubscribe;
    } else {
        throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
}
