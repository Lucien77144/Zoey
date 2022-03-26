document.addEventListener("DOMContentLoaded", function(){
    // Animer les badges sur la pages des animaux à adopter.
    document.querySelectorAll(".badgeDesc").forEach(e =>{
        e.addEventListener("click", function(){
            if(document.querySelector("body").clientWidth>800){
                // Si la taille de l'écran est supérieure à 800px, un seul badge peut être ouvert au maximum
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
                // Sinon, on peut ouvrir tout les badges en meme temps
                if(this.classList.contains("close")){
                    this.classList.remove("close");
                }else{
                    this.classList.add("close");
                }
            }
        });
    });
});