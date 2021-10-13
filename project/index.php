<?php
    session_start();

    // header('Access-Control-Allow-Origin: *');
    define("BASE_URL","../project/");
    $pageTitle = "Zoey";
    $viewContent = "";
    $showModifyLink = false;
    // $requestedFromAPI = false;
    require_once("controller/controller.php");
    verifyToken();

try{

    if (isset($_GET['action'])) {
        if ($_GET['action'] == 'blog') {
            if (isset($_GET['id'])) {
                printArticle();
            }
            else{
                printBlog();
            }
        } else if ($_GET['action'] == 'subscribe'){
            printSubscribe();
        } else if ($_GET['action'] == 'connect'){
            printConnect();
        } else if ($_GET['action'] == 'disconnect'){
            printDisconnect();
        } else if ($_GET['action'] == 'account'){
            if (!isset($_GET['id']) && isset($_SESSION['idUser'])){
                $_GET['id'] = $_SESSION['idUser'];
            }
            if (isset($_GET['id'])) {
                printAccount();
            }
            else{
                printConnect();
            }
            
        } else if ($_GET['action'] == 'modifyAccount'){
            printModifyAccount();
        } else if ($_GET['action'] == 'messages'){
            if (isset($_GET['id'])) {
                // printChat();
                echo 'page en construction';
            }
            else{
                // printMessages();
                echo 'page en construction';
            }
        } else if ($_GET['action'] == 'feed'){
            if (isset($_GET['id'])) {
                printPost();
            }
            else{
                printFeed();
            }
        } else if ($_GET['action'] == 'addpost'){
            echo 'page en construction';
        } else if ($_GET['action'] == 'animal'){
            printAnimal();
        } else if ($_GET['action'] == 'modifyAnimal'){
            echo 'page en construction';
        } else if ($_GET['action'] == 'forum'){
            echo 'page en construction';
        } else if ($_GET['action'] == 'adoption'){            
            if (isset($_GET['id'])) {
                printAdoptionAnimal();
            }
            else{
                printAdoption();
            }
        }
    }
    else {
        printBlog();
    }

} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    require(BASE_URL . "view/errorView.php");
}