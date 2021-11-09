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
        $.post("getContentCrsl.php?categorie="+actual.attr("data-table")+"",function(data){
            categorie = JSON.parse(data);
            max = categorie.length;

            for(let i=0; i<7; i++){
                if(i<3){
                    actual.find(`.crslWrap>a:nth-child(${i+1})`).attr("href",`${categorie[(max-3)+i].url_contenu_article}`);
                    actual.find(`.crslWrap>a:nth-child(${i+1})>.crslImg`).css("background-image",`url(${categorie[(max-3)+i].url_image_mise_en_avant})`);
                }else{
                    actual.find(`.crslWrap>a:nth-child(${i+1})`).attr("href",`${categorie[i-3].url_contenu_article}`);
                    actual.find(`.crslWrap>a:nth-child(${i+1})>.crslImg`).css("background-image",`url(${categorie[i-3].url_image_mise_en_avant})`);
                }
            }
            
            actual.attr("data-num", 1);
            txtCrsl(actual, 1);
        });
    }

    function rotateCrslLeft(actual){ // Rotation à gauche du carrousel
        $.post("getContentCrsl.php?categorie="+actual.attr("data-table")+"",function(data){
            categorie = JSON.parse(data);
            max = categorie.length;

            let num  = actual.attr("data-num");
            num++;
            txtCrsl(actual, num);

            actual.find("#I0").remove();
            for(let i = 1; i < 7; i++){
                actual.find(`#I${i}`).attr("id",`I${i-1}`);
            }

            if(num+2 < max){
                var result = categorie[(2+num)];
            }else{
                var result = categorie[(num-(max-2))];
            }
            actual.find(".crslWrap").append(`<a id="I6" href="${result.url_contenu_article}"><div class="crslImg" style="background-image: url(${result.url_image_mise_en_avant})"></div></a>`);
        });
    }

    function rotateCrslRight(actual){ // Rotation à droite du carrousel
        $.post("getContentCrsl.php?categorie="+actual.attr("data-table")+"",function(data){
            categorie = JSON.parse(data);
            max = categorie.length;

            let num  = actual.attr("data-num");
            num--;
            txtCrsl(actual, num);

            actual.find("#I6").remove();
            for(let i = 5; i > -1; i--){
                actual.find(`#I${i}`).attr("id",`I${i+1}`);
            }

            if(num-2 > 1){
                var result = categorie[num-4];
            }else{
                var result = categorie[(num+(max-4))];
            }
            actual.find(".crslWrap").prepend(`<a id="I0" href="${result.url_contenu_article}"><div class="crslImg" style="background-image: url(${result.url_image_mise_en_avant}"></div></a>`);
        });
    }

    function txtCrsl(actual, num){ // Changement des textes du carrousel
        actual.find(".crslTitre, .crslDesc").remove();

        if(num > max){
            num = 1;
        }else if(num < 1){
            num = max;
        }
        actual.attr("data-num", num);

        actual.append(`<h3 class="crslTitre">${categorie[num-1].titre}</h3>`);
        actual.append(`<p class="crslDesc">${categorie[num-1].resume}</p>`);
    }

});