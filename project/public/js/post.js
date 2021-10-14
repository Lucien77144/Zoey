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
            'model/postModifyAccount().php',
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

    function postAddPost(){
        console.log("addpost")

        let fd = new FormData();
        let files = $("#media")[0].files[0];
        fd.append( 'media',  files);
        // fd.append( 'description',  $("#description").val());
        
        $.ajax({
            url: 'model/postAddPost.php',
            data: fd,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
              alert(data);
            }
          });

        // $.post(
        //     'model/postAddPost.php',
        //     {
        //         description : $("#description").val(),
        //         media : fd
        //     },

        //     function(ReturnedMessage){
        //         console.log("function Received")
        //         console.log(ReturnedMessage);

        //         if (ReturnedMessage == "valid"){
        //             window.location.href = "index.php?action=connect";
        //             console.log('valid !!')
        //         } else {
        //             $('#ConfirmationMessage').html('');
        //             $('#ConfirmationMessage').text(
        //                 `L'importation a échoué.`
        //             );
        //         }
        //     },
        //     'text'
        // );
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

        postAddPost();
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