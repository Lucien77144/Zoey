<?php

function printNewpass()
{
?>
    <form>
        <label for="password">Nouveau mot de passe :</label>
        <input type="password" name="password" id="password" placeholder="mot de passe">
        <input class="submitButton" type="submit" value="Enregistrer" id="submitModifyAccountPassword">
    </form>
<?php
}

function testToken(int $id, $token)
{
    require("../model/PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

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

try {
    if (
        isset($_GET['id'])
        && isset($_GET['token'])
    ) {
        if (testToken(intval($_GET['id']), $_GET['token'])) {
            printNewpass();
        } else {
            echo 'false';
        }
    } else {
        throw new Exception("La tentative a échoué, il y a une erreur dans les champs remplis.");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    // echo $errorMsg;
}
