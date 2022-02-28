<?php
require_once(BASE_URL . "model/model.php");
require_once(BASE_URL . "model/verifyToken.php");
require_once(BASE_URL . "model/isFriend.php");
require_once(BASE_URL . "controller/isMemberOfTheConversation.php");

function printBlog()
{
    $blog = getBlog();
    require(BASE_URL . "view/blogView.php");
}

function printArticle()
{
    $article = getArticle();
    require(BASE_URL . "view/articleView.php");
}

function printPresentation()
{
    require(BASE_URL . "view/presentationView.php");
}

function printQuizz()
{
    $types_animaux = getAnimalTypes();
    require(BASE_URL . "view/quizzView.php");
}

function printLegal()
{
    require(BASE_URL . "view/legalView.php");
}

function printSubscribe()
{
    // postSubscribe en AJAX
    require(BASE_URL . "view/subscribeView.php");
}

function printConnect()
{
    // postConnect en AJAX 
    require(BASE_URL . "view/connectView.php");
}

function printForgotMyPw()
{
    require(BASE_URL . "view/forgotMyPwView.php");
}

function printDisconnect()
{

    $_SESSION = array();
    session_destroy();

    // setcookie('login', '');
    // setcookie('pass_hash', '');

    require(BASE_URL . "view/disconnectView.php");
}

// function printAnimal(){
//     $animal = getAnimal($_GET['id']);
//     $animalFeed = getAnimalFeed($_GET['id']);
//     require(BASE_URL . "view/animalView.php");
// }

function printAccount()
{
    $account = getAccount();
    $accountAnimals = getAccountAnimals();
    require(BASE_URL . "view/accountView.php");
}

function printModifyAccount()
{
    if (verifyToken()) {
        $google = isConnectedWithGoogle();
        require(BASE_URL . "view/modifyAccountView.php");
    } else {
        printConnect();
    }
}

function printFeed()
{
    $feed = getFeed();
    require(BASE_URL . "view/feedView.php");
}

function printPost()
{
    $post = getPost();
    require(BASE_URL . "view/postView.php");
}

// function printAdoptionWithMatch(){
//     if (verifyToken()){
//         $feedAdoption = getFeedAdoptionByMatch($_SESSION['idUser']);
//     } else {
//         $feedAdoption = getFeedAdoption();
//     }
//     require(BASE_URL . "view/adoptionViewWithMatch.php");
// }

function printAdoption()
{
    $types_animaux = getAnimalTypes();
    if (verifyToken()) {
        if (checkQuizz($_SESSION['idUser'])) {
            $feedAdoption = getFeedAdoptionByMatch($_SESSION['idUser']);
            require(BASE_URL . "view/adoptionViewWithMatch.php");
        } else {
            $feedAdoption = getFeedAdoption();
            require(BASE_URL . "view/adoptionView.php");
        }
    } else {
        $feedAdoption = getFeedAdoption();
        require(BASE_URL . "view/adoptionView.php");
    }
}

function printAdoptionAnimal()
{
    $adoptionAnimal = getAdoptionAnimal();
    // $adoptionAnimalBadges = getAdoptionAnimalBadges($idaa);
    require(BASE_URL . "view/adoptionAnimalView.php");
}

function printAddPost()
{
    if (verifyToken()) {
        $accountAnimals = getAccountAnimals();
        require(BASE_URL . "view/addPostView.php");
    } else {
        printConnect();
    }
}

function printAddAnimal()
{
    if (verifyToken()) {
        $types_animaux = getAnimalTypes();
        require(BASE_URL . "view/addAnimalView.php");
    } else {
        printConnect();
    }
}

function printModifyAnimal()
{
    if (verifyToken()) {
        $animal = getAnimal();
        $types_animaux = getAnimalTypes();
        require(BASE_URL . "view/modifyAnimalView.php");
    } else {
        printConnect();
    }
}

function printMessages()
{
    if (verifyToken()) {
        $messages = getMessages();
        require(BASE_URL . "view/messagesView.php");
    } else {
        printConnect();
    }
}

function printChat()
{
    if (verifyToken()) {
        if (isMemberOfTheConversation()) {
            $chat = getChat(0);
            $convUsers = getConversationUsers($_GET['id']);
            if ($convUsers) {
                $convUsers = $convUsers->fetchAll();
                foreach ($convUsers as $index => $user) {
                    if ($user["user"] == $_SESSION["idUser"]) {
                        unset($convUsers[$index]);
                    }
                }
                sort($convUsers);
            } else {
                throw new Exception("La conversation n'a pas été trouvée");
            }
            require(BASE_URL . "view/chatView.php");
        } else {
            throw new Exception("La conversation n'a pas été trouvée");
        }
    } else {
        printConnect();
    }
}

// PAGES ADMIN

function printAdmin()
{
    if (
        verifyToken()
        && $_SESSION['statut'] == 1
    ) {
        $liste_refuges = getRefugesList();
        $liste_aa = getAAList();
        require(BASE_URL . "view/adminView.php");
    } else {
        printConnect();
    }
}

function printAdminAjouterRefuge()
{
    if (
        verifyToken()
        && $_SESSION['statut'] == 1
    ) {
        require(BASE_URL . "view/adminAjouterRefugeView.php");
    } else {
        printConnect();
    }
}

function printAdminAjouterAnimalAdopter()
{
    if (
        verifyToken()
        && $_SESSION['statut'] == 1
    ) {
        $types_animaux = getAnimalTypes();
        $liste_refuges = getRefugesList();
        $badges_list = getBadgesList();
        require(BASE_URL . "view/adminAjouterAnimalAdopterView.php");
    } else {
        printConnect();
    }
}
