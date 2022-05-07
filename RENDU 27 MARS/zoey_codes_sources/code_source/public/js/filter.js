// Cette fonction marche comme un $_GET en php, elle renvoie les éléments dans l'URL
function getParameterByName(name, url = window.location.href) {
  name = name.replace(/[\[\]]/g, '\\$&')
  var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
    results = regex.exec(url)
  if (!results) return null
  if (!results[2]) return ''
  return decodeURIComponent(results[2].replace(/\+/g, ' '))
}

$(document).ready(function () {
  // console.log(document.querySelector(".filterWrapper").offsetWidth)

  // Si rien n'est indiqué dans l'URL pour l'annuler, animer le filtre.
  if (getParameterByName('slider') != 'prevent') {
    document.querySelector('.filterInner').scrollTo(document.querySelector(".filterWrapper").offsetWidth, 0)
    $('.filterInner').animate(
      {
        scrollLeft: 0,
      },
      750
    );
  }
})

// Vérifier si un filtre est spécifié dans l'URL pour le styliser
function listenToFilter() {
  document.querySelectorAll('.animalBreed').forEach((filter) => {
    let id = filter.id.substring(filter.id.length - 2)
    if (getParameterByName('filter') == id) {
      // console.log('ID param !')
      filter.classList.add('activeFilter');
    }
    filter.onclick = () => {
      if (filter.classList.contains('activeFilter')) {
        window.location.href = `index.php?action=adoption`;
      } else {
        window.location.href = `index.php?action=adoption&filter=${id}&slider=prevent`;
      }
    }
  })
}
document.onload = listenToFilter();
