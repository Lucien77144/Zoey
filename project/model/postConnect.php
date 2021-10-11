<?php

function safeEntry($validate){
    $validate = trim($validate);
    $validate = stripslashes($validate);
    $validate = htmlspecialchars($validate);
    return $validate;
}

function postConnect(){
    $pseudo = safeEntry($_POST['pseudo']);
        
    require_once("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = 'SELECT pseudo, mot_de_passe FROM utilisateur WHERE pseudo = ?';
    $req = $db -> prepare($sql);
    
    $req -> execute(array($pseudo));
    
    $user = $req->fetch();

    if ($req->rowCount() == 1){
        if(password_verify($_POST['password'], $user['mot_de_passe'])) {
            return "valid";
        } else {
            return "invalid";
        }
    } else {
        return "unknown user";
    }
}

try {
    if (isset($_POST['pseudo'])
    &&isset($_POST['password']))
    {
        $postConnect = postConnect();
        echo $postConnect;
    } else {        
        throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");
    }

} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}