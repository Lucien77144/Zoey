// this page is made to refresh the messages page (with ajax calls)

$(document).ready(function(){

    function getParameterByName(name, url = window.location.href) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }

    lookForNewMessages = setInterval(() => {
        let idConv = null;
        idConv = getParameterByName('id');
        if (idConv) {
            $.post(
                'model/getNewMessages.php',
                {
                    id : idConv
                },
    
                function(ReturnedMessage){
                    console.log("function Received : " + ReturnedMessage)
                    $(".loader").remove();
                    if (ReturnedMessage){
                        console.log('new messages found !!')
                        $('#noMessagesYet').remove();
                        $('#chatContainer').append(ReturnedMessage);
                        document.querySelector(".currentPicture").setAttribute("src","public/images/icons/addPost.svg");
                    }
                },
                'text'
            );
        } else {
            console.log('id')
        }        
    }, 1000);

    document.querySelector("#addMessageForm").addEventListener("click", e =>{
        if(document.querySelector("#msg").value != "" || document.querySelector("#media").value != ""){
            $("body").append("<div class='loader'><img src='public/images/icons/loader.svg'></div>");
        }
    });

});