document.addEventListener("DOMContentLoaded", function(){
    document.querySelectorAll(".BagdeDesc").forEach(e =>{
            e.addEventListener("click", function(){
            if(this.classList.contains("close")){
                this.classList.remove("close");
            }else{
                this.classList.add("close");
            }
        });
    });
});