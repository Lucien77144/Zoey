<?php
session_start();

// var_dump($_SESSION);

header('Access-Control-Allow-Origin: *');
define("BASE_URL", "../dev_project/"); //getcwd();
$pageTitle = "Zoey";
$viewContent = "";
$printNewsletter = true;
$printLegal = false;
$showModifyLink = false;
// $requestedFromAPI = false;
require_once("controller/controller.php");
verifyToken(); //refresh token
try {

    // ROUTER

    if (isset($_GET['action'])) {
        if ($_GET['action'] == 'blog') {
            if (isset($_GET['id'])) {
                printArticle();
            } else {
                printBlog();
            }
        } else if ($_GET['action'] == 'presentation') {
            printPresentation();
        } else if ($_GET['action'] == 'quizz') {
            printQuizz();
        } else if ($_GET['action'] == 'legal') {
            printLegal();
        } else if ($_GET['action'] == 'subscribe') {
            printSubscribe();
        } else if ($_GET['action'] == 'connect') {
            printConnect();
        } else if ($_GET['action'] == 'forgotmypw') {
            printForgotMyPw();
        } else if ($_GET['action'] == 'disconnect') {
            printDisconnect();
        } else if ($_GET['action'] == 'account') {
            if (!isset($_GET['id']) && isset($_SESSION['idUser'])) {
                $_GET['id'] = $_SESSION['idUser'];
            }
            if (isset($_GET['id'])) {
                printAccount();
            } else {
                printConnect();
            }
        } else if ($_GET['action'] == 'modifyAccount') {
            printModifyAccount();
        } else if ($_GET['action'] == 'messages') {
            if (isset($_GET['id'])) {
                printChat();
            } else {
                printMessages();
            }
        } else if ($_GET['action'] == 'feed') {
            if (isset($_GET['id'])) {
                printPost();
            } else {
                printFeed();
            }
        } else if ($_GET['action'] == 'addpost') {
            printAddPost();
        }
        // else if ($_GET['action'] == 'animal'){
        //     printAnimal();
        // } 
        else if ($_GET['action'] == 'addAnimal') {
            printAddAnimal();
        } else if ($_GET['action'] == 'modifyAnimal') {
            printModifyAnimal();
        } else if ($_GET['action'] == 'forum') {


            echo 'page en construction';
        } else if ($_GET['action'] == 'adoption') {
            if (isset($_GET['id'])) {
                printAdoptionAnimal();
            } else {
                printAdoption();
            }
        } else if ($_GET['action'] == 'admin') {
            printAdmin();
        } else if ($_GET['action'] == 'adminAjouterRefuge') {
            printAdminAjouterRefuge();
        } else if ($_GET['action'] == 'adminAjouterAnimalAdopter') {
            printAdminAjouterAnimalAdopter();
        }
    } else {
        printFeed();
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    require(BASE_URL . "view/errorView.php");
}
