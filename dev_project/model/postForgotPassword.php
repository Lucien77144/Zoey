<?php
require('model.php');

function sendMailGoogle($pseudo, $to)
{
    $subject = 'Réinitialisez votre mot de passe sur Zoey';

    ob_start();
?>
    <html>

    <body>
        <h2>Zoey</h2>
        <h3>Réinitialisation de votre mot de passe</h3>
        <p>Bonjour <?= $pseudo ?>, <br>
            Vous avez demandé à réinitialiser votre mot de passe sur Zoey. Si vous n'êtes pas à l'origine de cette demande, changez votre mot de passe et écrivez à <a href="mailto:contact@zoey-app.fr">contact@zoey-app.fr</a>.
        </p>
        <p>Vous vous êtes inscrit sur Zoey via la connexion avec Google, vous n'avez pas besoin de mot de passe pour accéder à votre compte. Allez sur <a href="zoey-app.fr/index.php?action=connect">la page de connexion</a> et cliquez sur "se connecter avec Google".</p>
        <p>Si vous ne parvenez pas à vous connecter avec votre compte Google, écrivez à <a href="mailto:contact@zoey-app.fr">contact@zoey-app.fr</a> ou répondez à ce mail pour expliquer votre problème au support de Zoey.</p>
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

function sendMail($pseudo, $link, $to)
{
    $subject = 'Réinitialisez votre mot de passe sur Zoey';

    ob_start();
?>
    <html>

    <body>
        <h2>Zoey</h2>
        <h3>Réinitialisation de votre mot de passe</h3>
        <p>Bonjour <?= $pseudo ?>, <br>
            Vous avez demandé à réinitialiser votre mot de passe sur Zoey. Si vous n'êtes pas à l'origine de cette demande, changez votre mot de passe et écrivez à <a href="mailto:contact@zoey-app.fr">contact@zoey-app.fr</a>.
        </p>
        <p>Pour réinitialisez votre mail, cliquez sur le lien suivant (ou copiez-le dans votre navigateur) :</p>
        <p><?= $link ?></p>
        <p>Ne partagez ce lien avec personne ! Il sera valable 15 minutes.</p>
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

function generateToken($id_demandeur)
{
    $token = bin2hex(random_bytes(5));
    $token_hash = password_hash($token, PASSWORD_DEFAULT);
    $link = "https://zoey-app.fr/services/forgotMyPassword.php?id=$id_demandeur&token=$token";

    return ['link' => $link, 'hash' => $token_hash];
}

function postForgot()
{
    $mail = safeEntry($_POST['mail']);

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = 'SELECT idutilisateur, pseudo, adresse_mail mail, google_sub FROM utilisateur WHERE adresse_mail = ?';
    $req = $db->prepare($sql);

    $req->execute(array($mail));

    $user = $req->fetch();

    if ($req->rowCount() == 1) {
        if (isset($user['google_sub'])) {
            sendMailGoogle($user['pseudo'], $user['mail']);
            return 'valid';
        } else {
            // generate token
            $token = generateToken($user['idutilisateur']);
            // send to db
            $sql = "INSERT INTO `reinitialisation_mot_de_passe` (`id_demandeur`, `token_reinitialisation`) VALUES (:id, :token)";
            $req = $db->prepare($sql);
            $req->execute(array(
                ':id' => $user['idutilisateur'],
                ':token' => $token['hash'],
            ));
            sendMail($user['pseudo'], $token['link'], $user['mail']);
            return 'valid';
        }
    } else {
        return "unknown";
    }
}

try {
    if (
        isset($_POST['mail'])
    ) {
        $postForgot = postForgot();
        echo $postForgot;
    } else {
        throw new Exception("La connexion a échouée, il y a une erreur dans les champs remplis.");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}
