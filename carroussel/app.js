$(document).ready(function(){

    for(let i = 0; i<$(".crsl").length; i++){   // Initialiser tout les carroussels de la page
        let crsl = $(`.crsl:nth-of-type(${i+1})`);
        initCrsl(crsl, crsl.attr("data-table"));
    }

    $(".arrow1").on("click", function(){
        let parent = $(this).parent().parent();
        rotateCrslLeft(parent, parent.attr("data-table"));
    });
    
    $(".arrow2").on("click", function(){
        let parent = $(this).parent().parent();
        rotateCrslRight(parent, parent.attr("data-table"));
    });

    $(".crsl").on("swipeleft", function(){
        rotateCrslLeft($(this), $(this).attr("data-table"));
    });

    $(".crsl").on("swiperight", function(){
        rotateCrslRight($(this), $(this).attr("data-table"));
    });

    function rotateCrslLeft(actual, idBDD){ // Rotation à gauche du carroussel
        let num  = actual.attr("data-num");
        num++;
        actual.attr("data-num", num);
        txtCrsl(actual, num);

        actual.find("#I0").remove();
        for(let i = 1; i < 7; i++){
            actual.find(`#I${i}`).attr("id",`I${i-1}`);
        }
        // actual.find(".crslWrap").append(`<a href=" " id="I6"><div class="crslImg" style="background-image: url(https://picsum.photos/${Math.floor(Math.random()*1900)}/1000)"></div></a>`);
        actual.find(".crslWrap").append(`<a href=" " id="I6"><div class="crslImg" style="background-image: url(https://picsum.photos/${Math.floor(Math.random()*1900)}/1000)"></div></a>`);
    }

    function rotateCrslRight(actual, idBDD){ // Rotation à droite du carroussel
        let num  = actual.attr("data-num");
        num--;
        actual.attr("data-num", num);
        txtCrsl(actual, num);

        actual.find("#I6").remove();
        for(let i = 5; i > -1; i--){
            actual.find(`#I${i}`).attr("id",`I${i+1}`);
        }
        // actual.find(".crslWrap").prepend(`<a href=" " id="I0"><div class="crslImg" style="background-image: url(https://picsum.photos/${Math.floor(Math.random()*1900)}/1000)"></div></a>`);
        actual.find(".crslWrap").prepend(`<a href=" " id="I0"><div class="crslImg" style="background-image: url(https://picsum.photos/${Math.floor(Math.random()*1900)}/1000)"></div></a>`);
    }

    function initCrsl(actual, idBDD){ // Initialisation du carroussel
        for(let i=0; i<7; i++){
            // actual.find(`.crslWrap>a:nth-child(${i+1})>.crslImg`).css("background-image",`url(https://picsum.photos/${Math.floor(Math.random()*1900)}/1000)`);
            // actual.find(`.crslWrap>#I${i+1}`).attr("href",`https://picsum.photos/${Math.floor(Math.random()*1900)}/1000`);
            actual.find(`.crslWrap>a:nth-child(${i+1})>.crslImg`).css("background-image",`url(https://picsum.photos/${Math.floor(Math.random()*1900)}/1000)`);
            actual.find(`.crslWrap>#I${i+1}`).attr("href",`https://picsum.photos/${Math.floor(Math.random()*1900)}/1000`);
        }
        actual.attr("data-num", 1);
        txtCrsl(actual, 1);
    }

    function txtCrsl(actual, num){
        actual.find(".crslTitre, .crslDesc").remove();
        // actual.append(`<h3 class="crslTitre">Titre n°${num}</h3>`);
        // actual.append(`<p class="crslDesc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!</p>`);
        actual.append(`<h3 class="crslTitre">Titre n°${num}</h3>`);
        actual.append(`<p class="crslDesc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!</p>`);
    }

    
});