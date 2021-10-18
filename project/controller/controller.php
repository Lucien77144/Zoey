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
        // postSubscribe en AJAX
        require(BASE_URL . "view/subscribeView.php");
    }

    function printConnect(){
        // postConnect en AJAX 
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
        $account = getAccount();
        require(BASE_URL . "view/accountView.php");
    }

    function printModifyAccount(){
        if (verifyToken()){
            require(BASE_URL . "view/modifyAccountView.php");
        } else {
            printConnect();
        }
    }

    function printFeed(){
        $feed = getFeed();
        require(BASE_URL . "view/feedView.php");
    }

    function printPost(){
        $post = getPost();
        require(BASE_URL . "view/postView.php");
    }

    function printAnimal(){
        $animal = getAnimal();
        $animalFeed = getAnimalFeed();
        require(BASE_URL . "view/animalView.php");
    }

    function printAdoption(){
        $feedAdoption = getFeedAdoption();
        require(BASE_URL . "view/adoptionView.php");
    }

    function printAdoptionAnimal(){
        $adoptionAnimal = getAdoptionAnimal();
        require(BASE_URL . "view/adoptionAnimalView.php");
    }

    function printAddPost(){
        if (verifyToken()){
            require(BASE_URL . "view/addPostView.php");
        } else {
            printConnect();
        }
    }

    function printAddAnimal(){
        if (verifyToken()){
            require(BASE_URL . "view/addAnimalView.php");
        } else {
            printConnect();
        }
    }