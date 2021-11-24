// this page is made for all ajax calls (forms and more)

$(document).ready(function(){

    function postAddNewsletter(){
        // console.log("postAddNewsletter")
        
        $.post(
            'model/postAddNewsletter.php',
            {
                prenom : $("#newsletterName").val(),
                mail : $("#newsletterMail").val()
            },

            function(ReturnedMessage){
                // console.log("function Received")
                // console.log(ReturnedMessage);

                if (ReturnedMessage == "valid"){
                    $('#newsletterForm').trigger('reset');
                    $('#confirmationMessage').html('');
                    $('#confirmationMessage').text(
                        `Vous êtes bien inscrit !`
                    );
                    // console.log('valid 1 !!')
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
    
    $("#submitNewsletter").click(function(e){
        e.preventDefault();

        // console.log("click");

        postAddNewsletter();
    });
});