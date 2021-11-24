<?php
    require_once(BASE_URL . "model/model.php");
    require_once(BASE_URL . "model/verifyToken.php");
    require_once(BASE_URL . "model/isFriend.php");
    require_once(BASE_URL . "controller/isMemberOfTheConversation.php");
    
    function printBlog(){
        $blog = getBlog();
        require(BASE_URL . "view/blogView.php");
    }
    
    function printArticle(){
        $article = getArticle();
        require(BASE_URL . "view/articleView.php");
    }

    function printPresentation(){
        require(BASE_URL . "view/presentationView.php");
    }

    function printLegal(){
        require(BASE_URL . "view/legalView.php");
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

    // function printAnimal($idAnimal){
    //     $animal = getAnimal($idAnimal);
    //     $animalFeed = getAnimalFeed($idAnimal);
    //     require(BASE_URL . "view/animalView.php");
    // }
    function printAccount(){
        $account = getAccount();
        $accountAnimals = getAccountAnimals();
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
            $accountAnimals = getAccountAnimals();
            require(BASE_URL . "view/addPostView.php");
        } else {
            printConnect();
        }
    }

    function printAddAnimal(){
        if (verifyToken()){
            $types_animaux = getAnimalTypes();
            require(BASE_URL . "view/addAnimalView.php");
        } else {
            printConnect();
        }
    }

    function printModifyAnimal(){
        if (verifyToken()){
            $animal = getAnimal();
            $types_animaux = getAnimalTypes();
            require(BASE_URL . "view/modifyAnimalView.php");
        } else {
            printConnect();
        }
    }

    function printMessages(){
        if (verifyToken()){
            $messages = getMessages();
            require(BASE_URL . "view/messagesView.php");
        } else {
            printConnect();
        }
    }

    function printChat(){
        if (verifyToken()){
            if (isMemberOfTheConversation()){
                $chat = getChat(0);
                require(BASE_URL . "view/chatView.php");
            } else {
                throw new Exception("La conversation n'a pas été trouvée");
            }            
        } else {
            printConnect();
        }
    }