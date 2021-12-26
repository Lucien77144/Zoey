let animload = false;
let animplyd = false;
let delay = 400;

$(document).ready(function(){
    for(let i = 0; i<5; i++){
        delay += 400;
        animals(i+1, delay)
    }
});

function animals(select, delay){
    setTimeout(function(){
        if(select != 5){
            $(".animals:nth-child("+select+")").css("opacity","1");
            $(".animals:nth-child("+select+")").css("transform","rotate("+((Math.floor(Math.random()*45))-15)+"deg) scale("+(1+Math.random()*0.25)+")");
        }else{
            $(".animals:nth-child(5)").css("animation","loading 1.75s infinite ease-in-out");
            animplyd = true;
            if(animload && animplyd){
                $(".loader").fadeOut(1000);
                $("html, body").css("overflow", "auto");
            }
        }
    },delay);
}

$(window).load(function(){
    animload = true;
    if(animload && animplyd){
        $(".loader").fadeOut(1000);
        $("html, body").css("overflow", "auto");
    }
});