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

    function printAccount(){
        echo "account";
    }