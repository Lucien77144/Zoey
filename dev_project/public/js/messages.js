document.querySelectorAll('.profilePicture').forEach(element => {
    console.log(element.length)
});

document.getElementById('formSearch').onsubmit = (e) => {
    e.preventDefault();
}