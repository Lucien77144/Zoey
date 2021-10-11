<?php
    session_start();
    header('Access-Control-Allow-Origin: *');
    define("BASE_URL","../project/");
    $pageTitle = "Zoey";
    $viewContent = "";
    // $requestedFromAPI = false;
    require_once("controller/controller.php");

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
        }
    }
    else {
        printBlog();
    }

} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    require(BASE_URL . "view/errorView.php");
}