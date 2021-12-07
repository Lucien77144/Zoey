document.addEventListener("DOMContentLoaded", function(){
    document.querySelectorAll(".badgeDesc").forEach(e =>{
        e.addEventListener("click", function(){
            if(document.querySelector("body").clientWidth>800){
                if(this.classList.contains("close")){
                    document.querySelectorAll(".badgeDesc").forEach(e =>{
                        e.classList.add("close");
                    })
                    setTimeout(()=>{
                        this.classList.remove("close");
                    }, 500);
                }else{
                    this.classList.add("close");
                }
                
            }else{
                if(this.classList.contains("close")){
                    this.classList.remove("close");
                }else{
                    this.classList.add("close");
                }
            }
        });
    });
});