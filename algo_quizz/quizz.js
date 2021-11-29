// this page handles ajax call for the quizz

$(document).ready(function(){

    function postQuizz(){
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
    
    $("#submitQuizz").click(function(e){
        e.preventDefault();

        // console.log("click");

        postQuizz();
    });
});