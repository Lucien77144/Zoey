<?php
session_start();

// this script handles quizz answers and is called with ajax

function postQuizz(){

    function executeAddBadge($idBadge){
        global $insertReq, $verifyReq; // use $req in this context
        $verify = $verifyReq -> execute(array(
            ':idUser' => $_SESSION['idUser'],
            ':idBadge' => $idBadge));

        if ($verifyReq->rowCount() == 0){ // doesn't have this badge yet
            $valid = $insertReq -> execute(array(
                ':idUser' => $_SESSION['idUser'],
                ':idBadge' => $idBadge));
            if (!$valid)
                throw new Exception("Nous n'avons pas réussi à envoyer vos réponses, il y a eu une erreur :/2");
        }
    }

    function executeAddAnimal($idAnimal){
        global $insertAnimalReq, $verifyAnimalReq; // use $req in this context

        $verify = $verifyAnimalReq -> execute(array(
            ':idUser' => $_SESSION['idUser'],
            ':idAnimal' => $idAnimal));

        if ($verifyAnimalReq->rowCount() == 0){ // doesn't have this animal yet
            $valid = $insertAnimalReq -> execute(array(
                ':idUser' => $_SESSION['idUser'],
                ':idAnimal' => $idAnimal));
            if (!$valid)
                throw new Exception("Nous n'avons pas réussi à envoyer vos réponses, il y a eu une erreur :/3");
        }
    }

    // badges
    $spacePost = safeEntry($_POST['space']);
    $securePost = safeEntry($_POST['secure']);
    $childrenPost = safeEntry($_POST['children']);
    $travelPost = safeEntry($_POST['travel']);
    $personnalityPost = safeEntry($_POST['personnality']);
    $animalsPost = safeEntry($_POST['animals']);
    $walkPost = safeEntry($_POST['walk']);

    // animals
    // $idAnimal1 = safeEntry($_POST['animal1']);
    // $idAnimal2 = safeEntry($_POST['animal2']);
    // $idAnimal3 = safeEntry($_POST['animal3']);

    executeAddAnimal(safeEntry($_POST['animal1']));
    executeAddAnimal(safeEntry($_POST['animal2']));
    executeAddAnimal(safeEntry($_POST['animal3']));

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
    && isset($_POST['animal2'])
    && isset($_POST['animal3'])
    )
    {
        // connect to db and prepare request
        require("PDO.php");
        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
        $sql = "INSERT INTO `utilisateur_has_badges` (`id_user`, `id_badge`) VALUES (:idUser, :idBadge);";
        $insertReq = $db -> prepare($sql);

        $sql = "SELECT id_badge
        FROM utilisateur_has_badges 
        WHERE utilisateur_has_badges.id_user = :idUser
        AND utilisateur_has_badges.id_badge = :idBadge";
        $verifyReq = $db -> prepare($sql);

        $sql = "INSERT INTO `utilisateur_has_favorite_animals` (`id_user`, `id_favoriteAnimal`) VALUES (:idUser, :idAnimal);";
        $insertAnimalReq = $db -> prepare($sql);

        $sql = "SELECT id_favoriteAnimal
        FROM utilisateur_has_favorite_animals 
        WHERE id_user = :idUser
        AND id_favoriteAnimal = :idAnimal";
        $verifyAnimalReq = $db -> prepare($sql);

        require("model.php");

        // execute script
        $postQuizz = postQuizz();
        echo $postQuizz;
    } else {        
        throw new Exception("Nous n'avons pas réussi à envoyer vos réponses, il y a eu une erreur :/1");
    }

} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}