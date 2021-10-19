$(document).ready(function(){
    console.log("ready")
    
    function postSubscribe(){
        console.log("postSubscribe")
        
        $.post(
            'model/postSubscribe.php',
            {
                pseudo : $("#pseudoSubscribe").val(),
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

    function postModifyAccount(){
        console.log("postModifyAccount")
        
        $.post(
            'model/postModifyAccount.php',
            {
                pseudo : $("#pseudoSubscribe").val(),
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

    function postPhoto(){ // renvoie basename fichier uploadé
        console.log("postPhoto");

        let fd = new FormData();
        let files = $("#media")[0].files[0];
        fd.append( 'media',  files);
        // fd.append( 'description',  $("#description").val());

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

    function postAddAnimal(){
        console.log("postAddAnimal")
        
        $.post(
            'model/postAddAnimal.php',
            {
                nom : $("#nom").val(),
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

    $("#submitSubscribe").click(function(e){
        e.preventDefault();

        console.log("click")

        postSubscribe();
    });

    $("#submitAddPost").click(function(e){
        e.preventDefault();

        console.log("click");

        let postedMedia = postPhoto();
        
        postAddPost(postedMedia);
    });

    $("#submitAddAnimal").click(function(e){
        e.preventDefault();

        console.log("click");

        postAddAnimal();
    });

    $("#submitModifyAccount").click(function(e){
        e.preventDefault();

        console.log("click")

        postModifyAccount();
    });

    $("#submitConnect").click(function(e){
        e.preventDefault();

        console.log("click")

        postConnect();
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