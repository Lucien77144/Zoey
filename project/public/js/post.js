// this page is made for all ajax calls (forms and more)

$(document).ready(function(){
    console.log("ready")

    function getParameterByName(name, url = window.location.href) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }
    
    function postPhoto(){ // renvoie basename fichier uploadé
        console.log("postPhoto");

        let fd = new FormData();
        let files = $("#media")[0].files[0];
        if (files === null){
            return null;
        }
            
        fd.append( 'media',  files);

        let returnedFromAjax;

        $.ajax({
            url: 'model/postPhoto.php',
            data: fd,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
                returnedFromAjax = data;
            },
            dataType: 'text',
            async: false
        });

        return returnedFromAjax;
    };

    function postSubscribe(postedMedia){
        console.log("postSubscribe")
        
        $.post(
            'model/postSubscribe.php',
            {
                pseudo : $("#pseudoSubscribe").val(),
                media : postedMedia,
                nom : $("#nom").val(),
                prenom : $("#prenom").val(),
                mail : $("#mail").val(),
                date_naissance : $("#date_naissance").val(),
                password : $("#password").val()
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == "valid"){
                    window.location.href = "index.php?action=connect";
                    console.log('valid !!')
                } else {
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `Il y a une erreur dans un des champs remplis.`
                    );
                }
            },
            'text'
        );
    };

    function postModifyAccount(postedMedia){
        console.log("postModifyAccount")
        
        $.post(
            'model/postModifyAccount.php',
            {
                pseudo : $("#pseudoSubscribe").val(),
                media : postedMedia,
                nom : $("#nom").val(),
                prenom : $("#prenom").val(),
                mail : $("#mail").val(),
                date_naissance : $("#date_naissance").val(),
                password : $("#password").val()
            },

            function(ReturnedMessage){
                
                console.log(ReturnedMessage);
                console.log("function Received1");

                if (ReturnedMessage == "valid"){
                    window.location.href = "index.php?action=connect";
                    console.log('valid !!')
                } else {
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `Il y a une erreur dans un des champs remplis.`
                    );
                }
            },
            'text'
        );
    };

    function postConnect(){
        console.log("postConnect")
        
        $.post(
            'model/postConnect.php',
            {
                pseudo : $("#pseudo").val(),
                password : $("#password").val()
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == "valid"){
                    // window.location.href = "index.php?action=account";
                    location.reload();
                    console.log('valid !!')
                } else {
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `Il y a une erreur dans un des champs remplis.`
                    );
                }
            },
            'text'
        );
    };
    
    function isPseudoFreeAPI(){
        console.log("isPseudoFreeAPI")
        
        $.post(
            'model/isPseudoFreeAPI.php',
            {
                checkPseudo: $("#pseudoSubscribe").val()
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == true){
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `Ce pseudo n'existe pas encore !`
                    );
                } else if (ReturnedMessage == "2") {
                    $('#ConfirmationMessage').html(''); // empty message when pseudo is already the user's one
                } else {
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `Ce pseudo existe déjà !`
                    );
                }
            },
            'text'
        );
    };

    function postAddPost(postedMedia){
        console.log(postedMedia)
        console.log("addpost")
        
        $.post(
            'model/postAddPost.php',
            {
                description : $("#description").val(),
                media : postedMedia,
                idAnimal : $("#idAnimal").val()
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == "valid"){
                    // window.location.href = "index.php?action=connect";
                    console.log('valid 1 !!')
                } else {
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `L'ajout a échoué`
                    );
                }
            },
            'text'
        );
    };

    function postAddNewsletter(){
        console.log("postAddNewsletter")
        
        $.post(
            'model/postAddNewsletter.php',
            {
                prenom : $("#newsletterName").val(),
                mail : $("#newsletterMail").val()
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == "valid"){
                    $('#newsletterForm').trigger('reset');
                    $('#confirmationMessage').html('');
                    $('#confirmationMessage').text(
                        `Vous êtes bien inscrit !`
                    );
                    console.log('valid 1 !!')
                } else {
                    $('#confirmationMessage').html('');
                    $('#confirmationMessage').text(
                        `Cette adresse mail n'est pas valide`
                    );
                }
            },
            'text'
        );
    };

    function postAddMessage(postedMedia){
        console.log(postedMedia)
        console.log("addMessage")
        
        $.post(
            'model/postAddMessage.php',
            {
                msg : $("#msg").val(),
                media : postedMedia,
                idconversation : getParameterByName('id')
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == "valid"){
                    // window.location.href = "index.php?action=connect";
                    console.log('valid 1')
                    $('#addMessageForm').trigger('reset');
                } else {
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `L'envoi a échoué`
                    );
                }
            },
            'text'
        );
    };

    function postAddAnimal(postedMedia){
        console.log("postAddAnimal")
        
        $.post(
            'model/postAddAnimal.php',
            {
                nom : $("#nom").val(),
                media : postedMedia,
                description : $("#description").val(),
                date_naissance : $("#date_naissance").val(),
                idtype : $("#idtype").val()
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == "valid"){
                    window.location.href = "index.php?action=account";
                    console.log('valid !!')
                } else {
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `Il y a une erreur dans un des champs remplis.`
                    );
                }
            },
            'text'
        );
    };

    function postModifyAnimal(postedMedia, id){
        console.log("postModifyAnimal")
        
        $.post(
            'model/postModifyAnimal.php',
            {
                nom : $("#nom").val(),
                media : postedMedia,
                description : $("#description").val(),
                date_naissance : $("#date_naissance").val(),
                idtype : $("#idtype").val(),
                idAnimal : id
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == "valid"){
                    console.log('valid !!')
                } else {
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `Il y a une erreur dans un des champs remplis.`
                    );
                }
            },
            'text'
        );
    };

    function postAddFriend(){
        console.log("postAddFriend")
        
        $.post(
            'model/postAddFriend.php',
            {
                addFriendId : $("#addFriend").val()
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == true){
                    // window.location.href = "index.php?action=account";
                    location.reload();
                    console.log('valid !!')
                } else {
                    $('#confirmationMessage').html('');
                    $('#confirmationMessage').text(
                        `La demande d'ami n'a pas pu être envoyée.`
                    );
                }
            },
            'text'
        );
    };

    function postRemoveFriend(){
        console.log("postRemoveFriend")
        
        $.post(
            'model/postRemoveFriend.php',
            {
                removeFriendId : $("#removeFriend").val()
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == true){
                    // window.location.href = "index.php?action=account";
                    location.reload();
                    console.log('valid !!')
                } else {
                    $('#confirmationMessage').html('');
                    $('#confirmationMessage').text(
                        `La demande n'a pas pu être envoyée.`
                    );
                }
            },
            'text'
        );
    };

    function postAcceptFriend(){
        console.log("postAcceptFriend")
        
        $.post(
            'model/postAcceptFriend.php',
            {
                acceptFriendId : $("#acceptFriend").val()
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == true){
                    // window.location.href = "index.php?action=account";
                    location.reload();
                    console.log('valid !!')
                } else {
                    $('#confirmationMessage').html('');
                    $('#confirmationMessage').text(
                        `La demande n'a pas pu être envoyée.`
                    );
                }
            },
            'text'
        );
    };

    function postConvSearch(search){
        console.log("postConvSearch")
        
        $.post(
            'model/postConvSearch.php',
            {
                convSearch : search
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage){
                    // window.location.href = "index.php?action=account";
                    // location.reload();
                    $('#convContainer').html('');
                    $('#convContainer').html(ReturnedMessage);
                    console.log('valid !!')
                } else {
                    $('#confirmationMessage').html('');
                    $('#confirmationMessage').text(
                        `Nous n'avons trouvé aucune conversation :/`
                    );
                }
            },
            'text'
        );
    };

    $("#submitSubscribe").click(function(e){
        e.preventDefault();

        console.log("click")

        let postedMedia = postPhoto();
        postSubscribe(postedMedia);
    });

    $("#submitAddPost").click(function(e){
        e.preventDefault();

        console.log("click");

        let postedMedia = postPhoto();

        postAddPost(postedMedia);
    });

    $("#submitNewsletter").click(function(e){
        e.preventDefault();

        console.log("click");

        postAddNewsletter();
    });

    $("#submitAddMessage").click(function(e){
        e.preventDefault();

        console.log("click");

        let postedMedia = postPhoto();

        postAddMessage(postedMedia);
    });

    $("#submitAddAnimal").click(function(e){
        e.preventDefault();

        console.log("click");

        let postedMedia = postPhoto();

        postAddAnimal(postedMedia);
    });

    $("#submitModifyAccount").click(function(e){
        e.preventDefault();

        console.log("click")

        let postedMedia = postPhoto();

        postModifyAccount(postedMedia);
    });

    $("#submitModifyAnimal").click(function(e){
        e.preventDefault();

        console.log("click")

        const pageUrl = window.location.search;
        const urlGetParameters = new URLSearchParams(pageUrl);
        const id = urlGetParameters.get('id');

        let postedMedia = postPhoto();

        postModifyAnimal(postedMedia, id);
    });

    $("#submitConnect").click(function(e){
        e.preventDefault();

        console.log("click")

        postConnect();
    });

    $("#addFriend").click(function(e){
        e.preventDefault();

        console.log("addFriend")

        postAddFriend();
    });

    $("#removeFriend").click(function(e){
        e.preventDefault();

        console.log("removeFriend")

        postRemoveFriend();
    });

    $("#acceptFriend").click(function(e){
        e.preventDefault();

        console.log("acceptFriend")

        postAcceptFriend();
    });

    // rechercher une conversation (page messages)
    let searchFlag = false;
    let convSearch;
    $("#convSearch").keyup(function(e){
        // e.preventDefault();
        console.log("convSearch")

        if (!searchFlag){ // si pas de recherche en cours
            searchFlag = true;
            let search = setInterval(() => {
                            if (convSearch != $("#convSearch").val()){ // si la recherche a changé
                                convSearch = $("#convSearch").val(); // j'actualise la recherche dans la variable
                                console.log(convSearch)
                                if (convSearch) {
                                    postConvSearch(convSearch); // je recherche en db
                                }
                            }
                        }, 1000); // je teste toutes les secondes l'entrée input search
            setTimeout(() => {
                clearInterval(search);
                searchFlag = false;
            }, 5000); // je réinitialise la recherche au bout de 5 sec
        }
    });

    // loadMoreMessages on the chat :
    offsetCoef = 1;
    $("#loadMoreMessages").click(function(e){
        console.log("loadMoreMessages");
        
        $.post(
            'model/postLoadMoreMessages.php',
            {
                offsetCoef : offsetCoef,
                id : getParameterByName('id')
            },

            function(ReturnedMessage){
                console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage){
                    console.log('valid !!')
                    $('#chatContainer').prepend(ReturnedMessage);
                    offsetCoef += 1;
                } else {
                    $('#loadMoreMessages').remove();
                    $('#confirmationMessage').html('');
                    $('#confirmationMessage').text(
                        `Tous les messages ont déjà été chargés.`
                    );
                }
            },
            'text'
        );
    });

    // let flagPseudoCheck = false;
    $("#pseudoSubscribe").keyup(function(){
        isPseudoFreeAPI();


        // A OPTIMISER !!! -> limiter les requetes
        

        // console.log("keyup")

        // if(!flagPseudoCheck){
        //     let regularCheck = setInterval(() => {
        //                             console.log("check")

        //                             isPseudoFreeAPI();
        //                         }, 1000);

        //     setTimeout(() => {
        //     clearInterval(regularCheck);
        //     }, 5000);
        // }

        // flagPseudoCheck = true;
        // setTimeout(() => {
        //     flagPseudoCheck = false;
        //     console.log("timeout -> false again")
        //     // isPseudoFreeAPI();
        // }, 1000);
    });
});