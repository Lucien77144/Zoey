<?php
// this script handles quizz answers and is called with ajax

session_start();

function postQuizz(){

    function executeAddBadge($idBadge){
        global $insertReq, $verifyReq; // use $req in this context
        $verifyReq -> execute(array(
            ':idUser' => $_SESSION['idUser'],
            ':idBadge' => $idBadge));

        if (!$verifyReq->fetchAll()){ // doesn't have this badge yet
            $valid = $insertReq -> execute(array(
                ':idUser' => $_SESSION['idUser'],
                ':idBadge' => $idBadge));
            if (!$valid)
                throw new Exception("Nous n'avons pas réussi à envoyer vos réponses, il y a eu une erreur :/2");
        }
    }

    // security
    $spacePost = safeEntry($_POST['space']);
    $securePost = safeEntry($_POST['secure']);
    $childrenPost = safeEntry($_POST['children']);
    $travelPost = safeEntry($_POST['travel']);
    $personnalityPost = safeEntry($_POST['personnality']);
    $animalsPost = safeEntry($_POST['animals']);
    $walkPost = safeEntry($_POST['walk']);

    // init badges
    // $space = 0;
    // $security = 0;
    // $children = 0;
    // $autonomy = 0;
    // $play = 0;
    // $caress = 0;
    // $hibernate = 0;
    // $others = 0;
    // $walk = 0;

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
    )
    {
        // connect to db and prepare request
        require("PDO.php");
        $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
        (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
        $insertSql = "INSERT INTO `utilisateur_has_badge` (`utilisateur_idutilisateur`, `badge_idbadge`) VALUES (:idUser, :idBadge);";
        $insertReq = $db -> prepare($insertSql);
        $verifySql = "SELECT badge_idbadge 
        FROM `utilisateur_has_badge` 
        WHERE utilisateur_idutilisateur = :idUser
        AND badge_idbadge = :idBadge;";
        $verifyReq = $db -> prepare($verifySql);
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