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

                if (ReturnedMessage){
                    $('#ConfirmationMessage').html('');
                    $('#ConfirmationMessage').text(
                        `Ce pseudo n'existe pas encore !`
                    );
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

    $("#submitSubscribe").click(function(e){
        e.preventDefault();

        console.log("click")

        postSubscribe();
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