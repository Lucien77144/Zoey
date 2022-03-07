<?php
session_start();

require("model.php");
require_once("verifyToken.php");

function sendMail($pseudo, $to)
{
    $subject = 'Vous avez des messages non lus sur Zoey !';

    ob_start();
?>
    <html>

    <body>
        <h2>Zoey</h2>
        <h3><?= $pseudo ?>, vous avez des messages non lus.</h3>
        <p><a href="zoey-app.fr/index.php?action=messages">Voir votre messagerie Zoey</a></p>
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

function postAddMessage()
{

    function isUserIdInArray()
    {
        $idUser = $_SESSION['idUser'];
        $postedIdConv = intval(safeEntry($_POST['idconversation']));
        $usersInConv = array();
        $getConversationUsers = getConversationUsers($postedIdConv);
        while ($convUser = $getConversationUsers->fetch(PDO::FETCH_NUM)) {
            array_push($usersInConv, $convUser['0']);
        }
        $getConversationUsers->closeCursor();
        if (in_array($idUser, $usersInConv)) {
            return true;
        } else {
            return false;
        }
    }

    $isUserIdInArray = isUserIdInArray();

    if (!$isUserIdInArray) {
        throw new Exception("Nous n'avons pas trouvé cette conversation !");
    } else {
        if (!empty($_POST['media']) && !empty($_POST['msg'])) {
            $msg = safeEntry($_POST['msg']);
            $fileName = safeEntry($_POST['media']);
        } else if (!empty($_POST['msg'])) {
            $msg = safeEntry($_POST['msg']);
            $fileName = NULL;
        } else if (!empty($_POST['media'])) {
            $msg = NULL;
            $fileName = safeEntry($_POST['media']);
        }

        $postedIdConv = intval(safeEntry($_POST['idconversation']));
        $idUser = $_SESSION['idUser'];
    }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "INSERT INTO `message` (`texte_message`, `url_media`, `utilisateur_idutilisateur`, `conversation_idconversation`) VALUES (:msg, :media, :idUser, :idConv)";
    $req = $db->prepare($sql);

    $valid = $req->execute(array(
        ':msg' => $msg,
        ':media' => $fileName,
        ':idUser' => $idUser,
        ':idConv' => $postedIdConv
    ));

    if (!$valid)
        throw new Exception("Nous n'avons pas pu envoyer ce message.");

    var_dump($usersInConv);
    foreach ($usersInConv as $id) {
        if (
            getConvReadState($postedIdConv, $id) == 1
            // || !isUserConnected($id)
        ) { // if is read OR connected
            echo "$id user set unread";
            setConvReadState($postedIdConv, $id, 2); //set unread and send mail
            $pseudo = getPseudoFromId($id);
            $mail = getMailFromId($id);
            sendMail($pseudo, $mail);
        }
    }

    return "valid";
}

try {
    if (
        isset($_POST['idconversation'])
        && is_numeric($_POST['idconversation'])
        && (!empty($_POST['msg']) || !empty($_POST['media']))
        && verifyToken()
    ) {
        $postAddMessage = postAddMessage();
        echo $postAddMessage;
    } else {
        throw new Exception("Nous n'avons pas pu envoyer ce message.");
    }
} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}
