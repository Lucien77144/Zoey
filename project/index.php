<?php
session_start();
$pageTitle = "Zoey";
$targetPage = NULL;
$viewContent = "";

if (isset($targetPage)){
    
} else {
    $viewContent = getBlogArticles();
}

require("controller/blogController.php");