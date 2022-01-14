<?php
    session_start();
    // define("BASE_URL","../prod_blog/"); //getcwd();
    define("BASE_URL",""); //getcwd();
    $pageTitle = "Zoey";
    $viewContent = "";
    $printNewsletter = true;
    $showModifyLink = false;
    require("controller/controller.php");

try{

    // ROUTER
    
    if (isset($_GET['action'])) {
        if ($_GET['action'] == 'blog') {
            if (isset($_GET['id'])) {
                printArticle();
            }
            else{
                printBlog();
            }
        } else if ($_GET['action'] == 'legal'){
            printLegal();
        } else if ($_GET['action'] == 'adoption'){
            if (isset($_GET['id'])) {
                printAdoptionAnimal();
            }
            else{
                printAdoption();
            }
        } else if ($_GET['action'] == 'newsletter'){
            printNewsletter();
        } else if ($_GET['action'] == 'connect'){
            printConnect();
        } else if ($_GET['action'] == 'disconnect'){
            printDisconnect();
        } else if ($_GET['action'] == 'admin'){
            printAdmin();
        } else if ($_GET['action'] == 'adminAjouterRefuge'){
            printAdminAjouterRefuge();
        } else if ($_GET['action'] == 'adminAjouterAnimalAdopter'){
            printAdminAjouterAnimalAdopter();
        } else {
            printPresentation();
        } 
    } else {
        printPresentation();
    }

} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    require(BASE_URL . "view/errorView.php");
}