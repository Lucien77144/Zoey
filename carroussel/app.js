$(document).ready(function(){

    let categorie=[];
    var max;

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

    function initCrsl(actual){ // Initialisation du carrousel et de son contenu
        for(let i=0; i<7; i++){
            let img = [`https://picsum.photos/1900/1000`, `https://picsum.photos/1900/1001`, `https://picsum.photos/1900/1002`, `https://picsum.photos/1900/1003`, `https://picsum.photos/1900/1004`, `https://picsum.photos/1900/1005`, `https://picsum.photos/1900/1006`, `https://picsum.photos/1900/1007`, `https://picsum.photos/1910/1008`, `https://picsum.photos/1920/1009`, `https://picsum.photos/1920/1010`, `https://picsum.photos/1920/1011`, `https://picsum.photos/1920/1012`, `https://picsum.photos/1920/1013`, `https://picsum.photos/1920/1014`, `https://picsum.photos/1920/1015`, `https://picsum.photos/1920/1016`];

            let link = img;

            let titre = [`Titre   n°1`, `Titre   n°2`, `Titre   n°3`, `Titre   n°4`, `Titre n°5`, `Titre n°6`, `Titre n°7`, `Titre n°8`, `Titre n°9`, `Titre n°10`, `Titre n°11`, `Titre n°12`, `Titre n°13`, `Titre n°14`, `Titre n°15`, `Titre n°16`, `Titre n°17`]
        
            let desc = [`1 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `2 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `3 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `4 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `5 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `6 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `7 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `8 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `9 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `10 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `11 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `12 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `13 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `14 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `15 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `16 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`, `17 - Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum voluptatibus numquam sed, eos doloremque natus earum soluta voluptate nisi nulla excepturi totam inventore, cupiditate velit illum minima ea laudantium!`];
        
            let item1 = [titre, desc, img, link];

            categorie[i] = [item1];
            console.log(categorie[i])
            max = categorie[0][0][3].length;

            if(i<3){
                actual.find(`.crslWrap>a:nth-child(${i+1})`).attr("href",`${categorie[0][0][3][(max-3)+i]}`);
                actual.find(`.crslWrap>a:nth-child(${i+1})>.crslImg`).css("background-image",`url(${categorie[0][0][2][(max-3)+i]})`);
            }else{
                actual.find(`.crslWrap>a:nth-child(${i+1})`).attr("href",`${categorie[0][0][3][i-3]}`);
                actual.find(`.crslWrap>a:nth-child(${i+1})>.crslImg`).css("background-image",`url(${categorie[0][0][2][i-3]})`);
            }
        }
        actual.attr("data-num", 1);
        txtCrsl(actual, 1);
    }

    function rotateCrslLeft(actual){ // Rotation à gauche du carrousel
        let num  = actual.attr("data-num");
        num++;
        txtCrsl(actual, num);

        actual.find("#I0").remove();
        for(let i = 1; i < 7; i++){
            actual.find(`#I${i}`).attr("id",`I${i-1}`);
        }

        if(num+2 < max){
            var result = categorie[0][0][3][(2+num)];
        }else{
            var result = categorie[0][0][3][(num-(max-2))];
        }
        actual.find(".crslWrap").append(`<a id="I6" href="${result}"><div class="crslImg" style="background-image: url(${result})"></div></a>`);
    }

    function rotateCrslRight(actual){ // Rotation à droite du carrousel
        let num  = actual.attr("data-num");
        num--;
        txtCrsl(actual, num);

        actual.find("#I6").remove();
        for(let i = 5; i > -1; i--){
            actual.find(`#I${i}`).attr("id",`I${i+1}`);
        }

        if(num-2 > 1){
            var result = categorie[0][0][3][num-4];
        }else{
            var result = categorie[0][0][3][(num+(max-4))];
        }
        actual.find(".crslWrap").prepend(`<a id="I0" href="${result}"><div class="crslImg" style="background-image: url(${result}"></div></a>`);
    }

    function txtCrsl(actual, num){ // Changement des textes du carrousel
        actual.find(".crslTitre, .crslDesc").remove();

        if(num > max){
            num = 1;
        }else if(num < 1){
            num = max;
        }
        actual.attr("data-num", num);

        actual.append(`<h3 class="crslTitre">${data[0][0][0][num-1]}</h3>`);
        actual.append(`<p class="crslDesc">${data[0][0][1][num-1]}</p>`);
    }

});