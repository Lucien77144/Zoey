function postPrintAnimal(animalId){
    console.log("postPrintAnimal")
    
    $.post(
        'model/printAnimal.php',
        {
            animalId : animalId
        },

        function(ReturnedMessage){
            console.log("function Received")
            console.log(ReturnedMessage);

            if (ReturnedMessage){
                // window.location.href = "index.php?action=account";
                // location.reload();
                $('#animalViewContainer').html('');
                $('#animalViewContainer').html(ReturnedMessage);
                console.log('valid !!')
            } else {
                $('#animalViewContainer').html('');
                $('#animalViewContainer').text(
                    `Nous n'avons pas trouvé cet animal :/`
                );
            }
        },
        'text'
    );
};

$("#nav_animal a").click(function(e){
    e.preventDefault();

    $animalId = $(this).attr('data-animalId')

    console.log($animalId)

    postPrintAnimal($animalId);
});