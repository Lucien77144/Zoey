<?php
session_start();

require("model.php");

function postAddAnimal(){
    $nom = safeEntry($_POST['nom']);
    $description = safeEntry($_POST['description']);
    $date_naissance = safeEntry($_POST['date_naissance']);
    $iduser = $_SESSION['idUser'];
    $idtype = intval(safeEntry($_POST['idtype']));
    
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "INSERT INTO profil_animal_de_compagnie (nom, `description`, date_naissance, utilisateur_idutilisateur1, types_animaux_idtypes_animaux) VALUES (:nom, :description, :date_naissance, :iduser, :idtype);";
    $req = $db -> prepare($sql);
    
    $req -> execute(array(
        ':nom' => $nom,
        ':description' => $description,
        ':date_naissance' => $date_naissance,
        ':iduser' => $iduser,
        ':idtype' => $idtype));

    if (!$req)
        throw new Exception("Le profil de " . $nom . " n'a pas pu être ajouté");

    return "valid";
}

try {
    if (isset($_POST['nom'])
    &&isset($_POST['description'])
    &&isset($_POST['date_naissance'])
    &&isset($_POST['idtype'])
    &&is_numeric($_POST['idtype']))
    {
        $postAddAnimal = postAddAnimal();
        echo $postAddAnimal;
    } else {        
        throw new Exception("Le profil de n'a pas pu être ajouté");
    }

} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}