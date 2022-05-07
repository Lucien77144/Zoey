<?php

// this page is called to verify the users "forgot my password" token (sent by mail only to verify email adress ownership), then prompts for a new password, then saves it.

$pageTitle = "Retrouver mon mot de passe";

ob_start();

function sendNewAndPrintOk(int $id, string $pass)
{
    $hash = password_hash(trim($pass), PASSWORD_DEFAULT);
    require(BASE_URL . "model/PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = 'UPDATE utilisateur SET mot_de_passe = :hash WHERE idutilisateur = :id';
    $req = $db->prepare($sql);

    $req->execute(array(
        ':hash' => $hash,
        ':id' => $id
    ));

?>
    <main class="error">
        <section>
            <h1>Votre nouveau mot de passe a bien été enregistré</h1>
            <h2>Vous pouvez l'utiliser pour vous reconnecter avec votre pseudo.</h2>

            <a class="btn" href="index.php?action=connect">Se connecter</a> <br><br>

        </section>
        <div class="helpContainer">
            <p>En cas de problème :</p>
            <a class="btn" href="mailto:contact@zoey-app.fr">Nous contacter</a>
        </div>
    </main>
<?php
}

function printNewpass()
{
?>
    <div class="registerNewPasswordContainer">
        <div class="registerNewPassword">
            <h1>Enregistrer un nouveau mot de passe</h1>
            <form method="POST">
                <label for="password">Nouveau mot de passe :</label>
                <input type="password" name="newpassword" id="password" placeholder="mot de passe">
                <input class="submitButton" type="submit" value="Enregistrer" id="recoveryPassword">
            </form>
        </div>
    </div>

<?php
}

function testToken(int $id, $token)
{
    require(BASE_URL . "model/PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = 'SELECT token_reinitialisation hash, date_demande_reinitialisation date FROM `reinitialisation_mot_de_passe` WHERE id_demandeur = ?
    order by date_demande_reinitialisation desc
    LIMIT 1';
    $req = $db->prepare($sql);

    $req->execute(array($id));

    if ($req->rowCount() == 1) {
        $hash = $req->fetch();
        if (password_verify($token, $hash['hash'])) {
            if (time() < strtotime($hash['date']) + 900) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    } else {
        return false;
    }
}

// test the needed informations
if (
    isset($_POST['newpassword'])
    && isset($_GET['id'])
    && isset($_GET['token'])
) {
    if (testToken(intval($_GET['id']), $_GET['token'])) {
        sendNewAndPrintOk(intval($_GET['id']), $_POST['newpassword']);
    } else {
        throw new Exception("Ce lien est expiré ! Il n'est valable que 15 minutes après la demande de réinitialisation de mot de passe.");
    }
} else if (
    isset($_GET['id'])
    && isset($_GET['token'])
) {
    if (testToken(intval($_GET['id']), $_GET['token'])) {
        printNewpass();
    } else {
        throw new Exception("Ce lien est expiré ! Il n'est valable que 15 minutes après la demande de réinitialisation de mot de passe.");
    }
} else {
    throw new Exception("La tentative a échoué, il y a une erreur dans les champs remplis.");
}

$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_error.css">
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');
