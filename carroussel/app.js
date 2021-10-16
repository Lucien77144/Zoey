$(document).ready(function(){

    let BDD = [];  // Stockage des noms BDD (Utile pour charger les images)

    for(let i = 0; i<$(".crsl").length; i++){   // Initialiser tout les carroussels de la page
        BDD[i] = $(`.crsl:nth-of-type(${i+1})`).attr("id");
        initCrsl($(`.crsl:nth-of-type(${i+1})`), BDD[i]);
    }

    $(".arrow1").on("click", function(){
        rotateCrslLeft($(this).parent().parent());
    });
    
    $(".arrow2").on("click", function(){
        rotateCrslRight($(this).parent().parent());
    });

    function rotateCrslLeft(actual, idBDD){ // Rotation à gauche du carroussel
        actual.find(".crslTitre, .crslDesc").remove();
        // if(exist) (dans le BDD)
        actual.append(`<h3 class="crslTitre">Titre mec</h3>`);
        actual.append(`<p class="crslDesc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!</p>`);

        let num  = actual.attr("data-num");
        num++;
        actual.attr("data-num", num);

        actual.find("#I0").remove();
        for(let i = 1; i < 7; i++){
            actual.find(`#I${i}`).attr("id",`I${i-1}`);
        }
        actual.find(".crslWrap").append(`<div class="crslImg" style="background-image: url(https://picsum.photos/${Math.floor(Math.random()*1900)}/1000)" id="I6"></div>`);
    }

    function rotateCrslRight(actual, idBDD){ // Rotation à droite du carroussel
        actual.find(".crslTitre, .crslDesc").remove();
        // if(exist) (dans le BDD)
        actual.append(`<h3 class="crslTitre">Titre mec</h3>`);
        actual.append(`<p class="crslDesc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!</p>`);

        let num  = actual.attr("data-num");
        num--;
        actual.attr("data-num", num);

        actual.find("#I6").remove();
        for(let i = 5; i > -1; i--){
            actual.find(`#I${i}`).attr("id",`I${i+1}`);
        }
        actual.find(".crslWrap").prepend(`<div class="crslImg" style="background-image: url(https://picsum.photos/${Math.floor(Math.random()*1900)}/1000)" id="I0"></div>`);
    }

    function initCrsl(actual, idBDD){ // Initialisation du carroussel
        for(let i=0; i<7; i++){
            actual.find(`.crslWrap>.crslImg:nth-child(${i+1})`).css("background-image",`url(https://picsum.photos/${Math.floor(Math.random()*1900)}/1000)`);
        }
        actual.attr("data-num", 0);

        // if(exist) (dans le BDD)
        actual.append(`<h3 class="crslTitre">Titre mec</h3>`);
        actual.append(`<p class="crslDesc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!</p>`);
    }

});