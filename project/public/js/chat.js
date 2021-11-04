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
    
                    if (ReturnedMessage){
                        console.log('new messages found !!')
                        $('#noMessagesYet').remove();
                        $('#chatContainer').append(ReturnedMessage);                        
                    }
                },
                'text'
            );
        } else {
            console.log('id')
        }        
    }, 1000);

});