document.addEventListener("DOMContentLoaded", function(){
    document.querySelectorAll(".cardSelector").forEach(e =>{
        e.addEventListener("click", function(){
            if(document.querySelector(".cardActive") != undefined){
                document.querySelector(".cardActive").classList.remove("cardActive");
            }
            e.classList.add("cardActive");
        });
    });

    document.querySelector("#media").addEventListener("input", function(){
        
        let file = document.querySelector("#media").files[0];
        let reader = new FileReader();
        
        reader.onload = function(e)  {
            document.querySelector(".imgLoader").innerHTML = `<img src='${e.target.result}' alt=''>`;
            document.querySelector("h5.btn").innerHTML = "Changer d'image";
        }
        reader.readAsDataURL(file);

    });

    // Selectionner le premier animal par défaut
    document.querySelector(".cardSelector:first-of-type").classList.add("cardActive");
    document.querySelector("input[name='idAnimal']:first-of-type").checked = true;

});