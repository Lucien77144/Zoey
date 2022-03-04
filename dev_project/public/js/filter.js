function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

function listenToFilter(){
    document.querySelectorAll('.animalBreed').forEach( (filter) => {
        let id = filter.id.substring(filter.id.length - 2);
        if (getParameterByName('filter') == id){
            console.log('ID param !');
            filter.classList.add('activeFilter');
        }
        filter.onclick = () => {
            if (filter.classList.contains('activeFilter')){
                window.location.href = `index.php?action=adoption`;
                // filter.classList.remove('activeFilter');
            } else {
                // filter.classList.add('activeFilter');
                window.location.href = `index.php?action=adoption&filter=${id}`
            }
        }
    })    
}

document.onload = listenToFilter();