document.addEventListener("DOMContentLoaded", function(){

    document.querySelector(".menuAnimauxWrapper li:first-child").classList.add("active");

    document.querySelectorAll(".menuAnimauxWrapper li").forEach(e =>{
        e.addEventListener("click", function(){
            if(!this.classList.contains("active")){
                document.querySelector(".menuAnimauxWrapper .active").classList.remove("active");
                this.classList.add("active");

                let animalId = this.getAttribute("data-animalId");

                document.querySelector(".profilAnimal").style.opacity=0;
                document.querySelector(".profilAnimal").style.transform="translateY(5%)";

                setTimeout(() => {
                    document.querySelector(".profilAnimal").style.opacity=1;
                    document.querySelector(".profilAnimal").style.transform="translateY(0%)";
                    $.post(
                        'model/printAnimal.php',
    
                        {
                            animalId : animalId
                        },
    
                        function(ReturnedMessage){
                            if (ReturnedMessage){
                                document.querySelector(".profilAnimal").innerHTML=ReturnedMessage;
                                document.querySelector(".profilAnimal .iconModif").addEventListener("click", function(){
                                    openModif(document.querySelector(".profilAnimal"),"../../model/modifAnimal.php");
                                });
                            } else {
                                document.querySelector(".profilAnimal").innerHTML=`Nous n'avons pas trouvé cet animal :/`;
                            }
                        },
    
                        'text'
                    );

                }, 200);
            }
        });
    });

    document.querySelectorAll(".profilAnimal .iconModif").forEach(e => {
        e.addEventListener("click", function(){        
            openModif(document.querySelector(".profilAnimal"),"../../model/modifAnimal.php");
        });
    });

    document.querySelector(".profil .iconModif").addEventListener("click", function(){        
        openModif(document.querySelector(".profil"),"../../model/modifProfil.php");
    });

    function openModif(current, action){
        let content = [current.innerHTML, current.querySelector(".innerUsername h1").innerHTML, current.querySelector(".desc p").innerText, current.querySelector(".avatar").innerHTML];

        current.innerHTML=`<form action="${action}">${content[0]}</form>`
        current.querySelector(".innerUsername").innerHTML=`<input type="text" value="${content[1]}">
        <label>
            <input type="submit" style="display:none">
            <svg class="iconSubmit" viewBox="0 0 32 32">
                <path d="M4.74219 31.9776C4.52142 31.9301 4.29968 31.8885 4.08085 31.8323C1.6214 31.2107 0.0140402 29.1792 0.00726216 26.6423C-0.00242072 22.041 -0.00242072 17.44 0.00726216 12.8394C0.0130719 10.2744 1.65335 8.21387 4.15444 7.63192C4.56594 7.54191 4.98619 7.49806 5.40741 7.5012C8.69958 7.49023 15.9918 7.48829 19.2839 7.4954C20.1167 7.4954 20.6463 8.01246 20.596 8.76095C20.5749 9.02544 20.462 9.27424 20.2769 9.46432C20.0918 9.6544 19.846 9.77379 19.5822 9.80185C19.4515 9.81347 19.3188 9.81444 19.1881 9.81444C15.9295 9.81444 8.67183 9.81444 5.41515 9.81444C4.02566 9.81444 2.90535 10.5687 2.49576 11.8072C2.38477 12.149 2.32856 12.5062 2.32922 12.8655C2.3176 17.4487 2.31566 22.032 2.32341 26.6152C2.32341 28.3746 3.60832 29.6547 5.36867 29.6566C9.98611 29.6566 14.6042 29.6566 19.2229 29.6566C20.9997 29.6566 22.2789 28.3775 22.2798 26.6007C22.2837 23.3957 22.2837 23.1909 22.2798 19.9866C22.2798 19.5324 22.4183 19.1577 22.8008 18.9001C22.966 18.7899 23.1569 18.7241 23.3549 18.7093C23.553 18.6944 23.7515 18.7309 23.9314 18.8152C24.1112 18.8995 24.2663 19.0288 24.3815 19.1906C24.4967 19.3524 24.5683 19.5411 24.5892 19.7387C24.5994 19.8351 24.6033 19.9322 24.6008 20.0292C24.6008 23.2168 24.6192 23.4044 24.595 26.591C24.5776 28.8539 23.5299 30.5145 21.4878 31.4973C21.0452 31.7094 20.5369 31.7878 20.0586 31.9224L19.8649 31.9776H4.74219Z"/>
                <path d="M11.7928 20.7928L8.00026 17.0001L8.00016 17C7.99799 16.9978 6.99856 16.0011 5.99988 16.9999C5.00023 17.9997 5.99993 18.9998 6.00016 19L6.00018 19L11 24L11 24C11.0001 24.0001 11.5001 24.5 12.4999 24.4998C13.4976 24.4996 13.9977 24.002 13.9999 23.9998L14 23.9997L25.9999 12C25.9999 12 27.0001 10.9998 25.9999 9.99982C25.0004 9.00055 24.0014 9.99852 23.9999 10L23.9998 10.0001L13.207 20.7928C12.8165 21.1833 12.1833 21.1833 11.7928 20.7928Z"/>
            </svg>
        </label>`;
        current.querySelector(".innerUsername").style.width="100%";

        current.querySelector(".desc").innerHTML=`<textarea>${content[2]}</textarea>`;
        sizeTextarea(current.querySelector("textarea"));
        current.querySelector("textarea").addEventListener("input", function(){
            sizeTextarea(this);
        });
        window.addEventListener("resize", function(){
            sizeTextarea(current.querySelector("textarea"));
        });

        current.querySelector(".avatar").innerHTML=`
        <label>
            <input type="file" accept="image/*" name="avatar" style="display:none">
            ${content[3]}
            <svg viewBox="0 0 20 22" class="modifAvatar">
                <path d="M16.3056 0C17.6196 0.0648753 18.6828 0.6962 19.2822 1.96466C19.8815 3.23311 19.7392 4.47543 18.8251 5.53473C17.5664 6.98717 16.2475 8.38731 14.952 9.80682C12.2659 12.7498 9.57668 15.6905 6.88419 18.6289C6.66973 18.8575 6.4129 19.0424 6.12796 19.1731C4.87597 19.7434 3.61041 20.2866 2.35164 20.8337C1.58572 21.1648 0.87597 21.0206 0.374396 20.426C-0.0226016 19.9554 -0.0855429 19.4084 0.0994 18.8409C0.551268 17.4582 1.01314 16.0787 1.48502 14.7025C1.55779 14.5056 1.66868 14.3249 1.81134 14.1709C5.76776 9.83103 9.72741 5.49439 13.6903 1.16098C14.3671 0.416366 15.2095 0.0290486 16.3056 0ZM6.81642 15.2728C6.92584 15.1556 7.02072 15.0549 7.11465 14.9523C9.33396 12.5232 11.5536 10.0934 13.7736 7.66303C14.8387 6.49592 15.9038 5.32914 16.9689 4.16267C17.423 3.66304 17.4105 3.0443 16.9486 2.61341C16.4867 2.18252 15.8718 2.23094 15.4061 2.71798C15.3335 2.79448 15.2638 2.87291 15.1921 2.95134L5.4124 13.6625C5.36205 13.7177 5.31557 13.7778 5.25941 13.8455L6.81642 15.2728ZM3.65012 15.5246C3.35963 16.4057 3.08173 17.2297 2.78544 18.1157L5.28459 17.0186L3.65012 15.5246Z" fill="white"/>
            </svg>
        </label>`;

        current.querySelector("input[type=file]").addEventListener("input", function(){
            changeAvatar(this);
        });
    }

    function sizeTextarea(current){
        current.style.height="auto";
        current.style.height=`${current.scrollHeight+5}px`;
    }

    function changeAvatar(current){
        let file = current.files[0];
        let reader = new FileReader();
        
        reader.onload = function(e)  {
            current.nextElementSibling.src = e.target.result;
        }
        reader.readAsDataURL(file);
    }
});