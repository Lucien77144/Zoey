$(document).ready(function(){
    console.log("ready")
    
    function postSubscribe(){
        console.log("postSubscribe")
        
        $.post(
            'model/postSubscribe.php',
            {
                pseudo : $("#pseudo").val(),
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
    
});