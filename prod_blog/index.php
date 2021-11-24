<?php
    session_start();
    // define("BASE_URL","../prod_blog/"); //getcwd();
    define("BASE_URL","../"); //getcwd();
    $pageTitle = "Zoey";
    $viewContent = "";
    $printNewsletter = true;
    $showModifyLink = false;
    require_once("controller/controller.php");

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