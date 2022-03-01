<?php

$to = "marin.bouanchaud@gmail.com";

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
    <p>À bientôt sur Zoey !</p>
</body>

</html>
<?php
$message = ob_get_clean();

$headers = "MIME-Version: 1.0" . "\r\n";
$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
$headers .= 'From: contact@zoey-app.fr' . "\r\n";

mail($to, $subject, $message, $headers);

echo 'mail envoyé';
