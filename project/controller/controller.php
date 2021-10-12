<?php
    require_once(BASE_URL . "model/model.php");

    function printBlog(){
        $blog = getBlog();
        require(BASE_URL . "view/blogView.php");
    }
    
    function printArticle(){
        $article = getArticle();
        require(BASE_URL . "view/articleView.php");
    }

    function printSubscribe(){
        // $subscribe = 
        require(BASE_URL . "view/subscribeView.php");
    }

    function printConnect(){
        // $connect = 
        require(BASE_URL . "view/connectView.php");
    }

    function printDisconnect(){

        $_SESSION = array();
        session_destroy();

        setcookie('login', '');
        setcookie('pass_hache', '');

        require(BASE_URL . "view/disconnectView.php");
    }

    function printAccount(){
        echo "account page : work in progress";
    }