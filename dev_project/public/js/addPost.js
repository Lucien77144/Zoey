// Cette fonction marche comme un $_GET en php, elle renvoie les éléments dans l'URL
function getParameterByName(name, url = window.location.href) {
  name = name.replace(/[\[\]]/g, '\\$&')
  var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
    results = regex.exec(url)
  if (!results) return null
  if (!results[2]) return ''
  return decodeURIComponent(results[2].replace(/\+/g, ' '))
}

document.addEventListener('DOMContentLoaded', function () {

  // Menu de selection de l'animal auxquel ajouter le post (cartes),
  // Styliser la carte cliquée
  document.querySelectorAll('.cardSelector').forEach((e) => {
    e.addEventListener('click', function () {
      if (document.querySelector('.cardActive') != undefined) {
        document.querySelector('.cardActive').classList.remove('cardActive')
      }
      e.classList.add('cardActive')
    })
  })

  // Ce if permet de vérifier que l'input de media existe (et donc que l'utilisateur a des animaux)
  if(document.querySelector('#media') != null){
    // En cas de changement de l'image chargée :
    document.querySelector('#media').addEventListener('input', function () {
      let file = document.querySelector('#media').files[0]
      // Si il n'y a pas de fichier dans l'input, alors réinitialiser la préview et changer l'intitulé du bouton d'ajout
      if(file == undefined){
        // console.log("nul");
        document.querySelector(
          '.imgLoader'
        ).innerHTML = "";
        document.querySelector('h5.btn').innerHTML = "+ Choisir une image"
        return;
      }

      // Charger l'image et sa preview :
      let reader = new FileReader()
      reader.onload = function (e) {
        document.querySelector(
          '.imgLoader'
        ).innerHTML = `<img src='${e.target.result}' alt=''>`
        document.querySelector('h5.btn').innerHTML = "Changer d'image"
      }
      reader.readAsDataURL(file)
    })
  }

  // Selectionner le premier animal par défaut OU checked
  if (!getParameterByName("checked") && document.querySelector('.cardSelector:first-of-type') != null) {
    document
      .querySelector('.cardSelector:first-of-type')
      .classList.add('cardActive')
    document.querySelector(
      "input[name='idAnimal']:first-of-type"
    ).checked = true
  }
})
