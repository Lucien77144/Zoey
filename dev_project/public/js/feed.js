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
                    document.querySelector("main").innerHTML+=ReturnedMessage;
                },
                'text'
            );
        }
    });
});