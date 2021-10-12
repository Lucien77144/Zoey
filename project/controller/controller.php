<?php
    require_once(BASE_URL . "model/model.php");
    require_once(BASE_URL . "model/verifyToken.php");

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

        // setcookie('login', '');
        // setcookie('pass_hash', '');

        require(BASE_URL . "view/disconnectView.php");
    }

    function printAccount(){
        if (verifyToken()){
            require(BASE_URL . "view/accountView.php");
        } else {
            printConnect();
        }
    }