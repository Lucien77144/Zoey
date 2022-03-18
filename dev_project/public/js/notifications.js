document.addEventListener("DOMContentLoaded", function(){
  
    loadNewNotifs();
    let getNotfiInterval = setInterval(loadNewNotifs, 60000); 

    function loadNewNotifs(){
        $.post(
            'model/getNotifications.php',
      
            function (ReturnedMessage) {
              console.log('function Received');
              console.log(ReturnedMessage);

              if(ReturnedMessage.includes("New notification")){
                clearInterval(getNotfiInterval);
                if(document.querySelector("#NewMessage") == null){
                    document.querySelector("#iconMessage").innerHTML = '<svg width="33" height="34" viewBox="0 0 33 34" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M28.1091 1.18607C28.7912 0.941883 29.5333 0.941884 30.2155 1.18607C31.8899 1.78536 32.7756 3.66967 32.1939 5.39478L23.3592 31.575C23.1991 32.0478 22.9374 32.4773 22.5937 32.8314C22.3083 33.1227 21.9725 33.3565 21.6037 33.5204C19.9724 34.2455 18.0794 33.4708 17.3757 31.7901L12.9103 21.0541L10.5 19.99C11.3273 19.4993 11.7727 19.1875 12.5 18.4747L13.4806 18.9077L28.5803 3.35045L13.5 9C13.1158 8.24816 12.8434 7.81895 12.195 7.13246L28.1091 1.18607ZM19.9747 31.5279C20.5328 31.7277 21.1424 31.4236 21.3365 30.8487L30.0932 4.9092L14.9935 20.4665L19.3424 30.9203C19.4608 31.2055 19.6904 31.4261 19.9747 31.5279Z" fill="#FFA319"/><circle cx="7" cy="13" r="6" fill="#FFC800"/></svg>';

                    var link = document.querySelector("link[rel~='icon']");
                    if (!link) {
                        link = document.createElement('link');
                        link.rel = 'icon';
                        document.getElementsByTagName('head')[0].appendChild(link);
                    }
                    link.href = 'public/images/icons/faviconNotif.svg';
                }
              }

            },
            'text'
          )
    }

});