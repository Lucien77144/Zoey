document.addEventListener("DOMContentLoaded", function () {

    function changeAvatar(current) {
        // console.log(current)
        let file = current.files[0];
        let reader = new FileReader();

        // Changer la preview de l'image
        reader.onload = function (e) {
            document.querySelector('.currentPicture').src = e.target.result;
        }
        reader.readAsDataURL(file);
    }

    document.querySelector("#media").addEventListener("input", function () {
        changeAvatar(this);
    });

})