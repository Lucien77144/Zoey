document.addEventListener("DOMContentLoaded", function(){
    document.querySelectorAll(".blockIllus").forEach(e => {
        let format = e.naturalWidth/e.naturalHeight;
        if(format>1){
            e.style.objectFit="contain";
        }else{
            e.style.objectFit="cover";
        }
    });
});