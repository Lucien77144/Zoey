// this page handles ajax call for the quizz

$(document).ready(function(){

    function postQuizz(){
        console.log("quizz")
        
        $.post(
            'model/postQuizz.php',
            {
                space : $("input:radio[name=space]:checked").val(),
                secure : $("input:radio[name=secure]:checked").val(),
                children : $("input:radio[name=children]:checked").val(),
                travel : $("input:radio[name=travel]:checked").val(),
                personality : $("input:radio[name=personality]:checked").val(),
                animals : $("input:radio[name=animals]:checked").val(),
                walk : $("input:radio[name=walk]:checked").val()
            },

            function(ReturnedMessage){
                // console.log("function Received")
                console.log(ReturnedMessage);

                if (ReturnedMessage == "valid"){
                    window.location.href = "index.php?action=adoption";
                } else {
                    $('#confirmationMessage').html('');
                    $('#confirmationMessage').text(
                        `Nous n'avons pas réussi à envoyer vos réponses, il y a eu une erreur :/`
                    );
                }
            },
            'text'
        );
    };
    
    $("#submitQuizz").click(function(e){
        e.preventDefault();

        console.log("click");

        postQuizz();
    });
});