<?php
session_start();

require("model.php");
require("verifyToken.php");

// this script handles quizz answers and is called with ajax

function postQuizz(){

    function executeAddBadge($idBadge){
        global $insertReq; // use $req in this context

        $valid = $insertReq -> execute(array(
            ':idUser' => $_SESSION['idUser'],
            ':idBadge' => $idBadge));
        if (!$valid)
            throw new Exception("Nous n'avons pas réussi à envoyer vos réponses, il y a eu une erreur :/2");
    }

    function executeAddAnimal($idAnimal){
        global $insertAnimalReq; // use $req in this context

        $valid = $insertAnimalReq -> execute(array(
            ':idUser' => $_SESSION['idUser'],
            ':idAnimal' => $idAnimal));
        if (!$valid)
            throw new Exception("Nous n'avons pas réussi à envoyer vos réponses, il y a eu une erreur :/3");
    }

    // badges
    $spacePost = safeEntry($_POST['space']);
    $securePost = safeEntry($_POST['secure']);
    $childrenPost = safeEntry($_POST['children']);
    $travelPost = safeEntry($_POST['travel']);
    $personnalityPost = safeEntry($_POST['personnality']);
    $animalsPost = safeEntry($_POST['animals']);
    $walkPost = safeEntry($_POST['walk']);

    executeAddAnimal(safeEntry($_POST['animal1']));
    if (!empty($_POST['animal2'])){
        executeAddAnimal(safeEntry($_POST['animal2']));
    }
    if (!empty($_POST['animal2'])){
        executeAddAnimal(safeEntry($_POST['animal3']));
    }

    // test badges obtained
    if ($spacePost == 1){
        // $space = 1;
        
        executeAddBadge(1);
    }
    if ($securePost == 1){
        // $security = 1;

        executeAddBadge(2);
    }
    if ($childrenPost == 1){
        // $children = 1;

        executeAddBadge(3);
    }
    if ($travelPost == 1){
        // $autonomy = 1;

        executeAddBadge(4);
    } else if ($personnalityPost == 3){
        // $autonomy = 1;

        executeAddBadge(4);
    }
    if ($personnalityPost == 1){
        // $play = 1;

        executeAddBadge(5);
    }
    if ($personnalityPost == 2){
        // $caress = 1;

        executeAddBadge(6);
    }
    if ($personnalityPost == 4){
        // $hibernate = 1;

        executeAddBadge(7);
    }
    if ($animalsPost == 1){
        // $others = 1;

        executeAddBadge(8);
    }
    if ($walkPost == 1){
        // $walk = 1;

        executeAddBadge(9);
    }

    return "valid";
}

try {
    if (isset($_POST['space'])
    && isset($_POST['secure'])
    && isset($_POST['children'])
    && isset($_POST['travel'])
    && isset($_POST['personality'])
    && isset($_POST['animals'])
    && isset($_POST['walk'])
    && isset($_POST['animal1'])
    )
    {
        if (verifyToken()){
            // connect to db and prepare request
            require("PDO.php");
            $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
            (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
            $sql = "INSERT INTO `utilisateur_has_badges` (`id_user`, `id_badge`) VALUES (:idUser, :idBadge);";
            $insertReq = $db -> prepare($sql);

            $sql = "DELETE FROM utilisateur_has_badges WHERE id_user = :idUser";
            $emptyBadges = $db -> prepare($sql);
            $emptyBadges -> execute(array(':idUser' => $_SESSION['idUser']));

            $sql = "DELETE FROM utilisateur_has_favorite_animals WHERE id_user = :idUser";
            $emptyFav = $db -> prepare($sql);
            $emptyFav -> execute(array(':idUser' => $_SESSION['idUser']));

            $sql = "INSERT INTO `utilisateur_has_favorite_animals` (`id_user`, `id_favoriteAnimal`) VALUES (:idUser, :idAnimal);";
            $insertAnimalReq = $db -> prepare($sql);

            // execute script
            $postQuizz = postQuizz();
            echo $postQuizz;

            setcookie("quizz","", time()-3600, "/"); // unset the cookie
        } else {
            setcookie("quizz",json_encode($_POST), time()+86400, "/");
            echo "connect";
        }
    } else {        
        throw new Exception("Nous n'avons pas réussi à envoyer vos réponses, il y a eu une erreur :/1");
    }

} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}