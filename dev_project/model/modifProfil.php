<?php
session_start();

require("model.php");
require("verifyToken.php");

    $pseudo = htmlspecialchars($_POST["pseudo"]);
    $desc = htmlspecialchars($_POST["desc"]);
    $avatar = htmlspecialchars($_POST["avatar"]);

    echo $avatar;
    // echo $desc;

//     if(isset($pseudo) || isset($desc) || isset($avatar)){
//         if (isPseudoFree($pseudo)){
//              $sql = "UPDATE utilisateur SET pseudo = :pseudo, `description` = :`desc`, url_photo = :avatar WHERE idutilisateur = :id";
//              $setvalue = safeEntry($_POST['setvalue']);
//         } else {
//             throw new Exception("Ce pseudo existe déjà !");
//         }
//     }

//     require("PDO.php");

//     $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
//     (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    
//     $req = $db -> prepare($sql);
    
//     $req -> execute(array(
//         ':setvalue' => $setvalue,
//         ':id' => $_SESSION['idUser']
//     ));

//     // if ($req->rowCount() <= 0)
//     //     throw new Exception("Votre compte n'a pas pu être modifié, il y a une erreur dans les champs remplis.1");

//     return "valid";
// }

// try {
//     if (isset($_POST['setparam'])
//     && isset($_POST['setvalue'])
//     && verifyToken())
//     {
//         $postModifyAccount = postModifyAccount();
//         echo $postModifyAccount;
        
//     } else {
//         throw new Exception("Votre compte n'a pas pu être modifié, il y a une erreur dans les champs remplis.");
//     }

// } catch (Exception $e) {
//     // echo "catch";
//     $errorMsg = $e->getMessage();
//     echo $errorMsg;
//     // require(BASE_URL . "view/errorView.php");