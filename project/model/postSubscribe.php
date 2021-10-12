<?php

require("model.php");

// function safeEntry($validate){
//     $validate = trim($validate);
//     $validate = stripslashes($validate);
//     $validate = htmlspecialchars($validate);
//     return $validate;
// }

function postSubscibe(){
    $pseudo = safeEntry($_POST['pseudo']);
    $nom = safeEntry($_POST['nom']);
    $prenom = safeEntry($_POST['prenom']);
    $adresse_mail = safeEntry($_POST['mail']);
    $date_naissance = safeEntry($_POST['date_naissance']);
    $new_password_hash = password_hash($_POST['password'], PASSWORD_ARGON2I, ['memory_cost' => 2048, 'time_cost' => 4, 'threads' => 3]);
    
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "INSERT INTO utilisateur (pseudo, nom, prenom, adresse_mail, date_naissance, mot_de_passe) VALUES (:pseudo, :nom, :prenom, :adresse_mail, :date_naissance, :mot_de_passe)";
    $req = $db -> prepare($sql);
    
    $req -> execute(array(
        ':pseudo' => $pseudo,
        ':nom' => $nom,
        ':prenom' => $prenom,
        ':adresse_mail' => $adresse_mail,
        ':date_naissance' => $date_naissance,
        ':mot_de_passe' => $new_password_hash));

    if ($req->rowCount() <= 0)
        throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");

    return "valid";
}

try {
    if (isset($_POST['pseudo'])
    &&isPseudoFree($_POST['pseudo'])
    &&isset($_POST['nom'])
    &&isset($_POST['prenom'])
    &&isset($_POST['mail'])
    &&isset($_POST['date_naissance'])
    &&isset($_POST['password']))
    {
        $postSubscibe = postSubscibe();
        echo $postSubscibe;
    } else {        
        throw new Exception("Votre compte n'a pas pu être ajouté, il y a une erreur dans les champs remplis.");
    }

} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}