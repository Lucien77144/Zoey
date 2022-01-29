document.addEventListener("DOMContentLoaded", function(){
    document.querySelectorAll(".blockIllus").forEach(e => {
        let format = e.naturalWidth/e.naturalHeight;
        if(format>1){
            e.style.objectFit="contain";
        }else{
            e.style.objectFit="cover";
        }
    });

    let numPosts=1;
    document.querySelector("main").addEventListener("scroll", function(){

        if(this.scrollTop>window.innerHeight*(numPosts*5)){
            numPosts++;
            $.post(
                'model/loadFeed.php',
                {
                    posts : numPosts
                },
    
                function(ReturnedMessage){
                    addContent(ReturnedMessage);
                },
                'text'
            );
        }
    });

    function scrollEnd(element, content){
        let scrollPos = element.scrollTop;
        setTimeout(() => {
            if(scrollPos != element.scrollTop){
                addContent(content);
            }else{
                document.querySelector("main").innerHTML+=content;
            }
        }, 150);
    }

    function addContent(content){
        scrollEnd(document.querySelector("main"), content);
    }

});