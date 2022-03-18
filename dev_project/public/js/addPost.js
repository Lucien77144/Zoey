function getParameterByName(name, url = window.location.href) {
  name = name.replace(/[\[\]]/g, '\\$&')
  var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
    results = regex.exec(url)
  if (!results) return null
  if (!results[2]) return ''
  return decodeURIComponent(results[2].replace(/\+/g, ' '))
}

document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.cardSelector').forEach((e) => {
    e.addEventListener('click', function () {
      if (document.querySelector('.cardActive') != undefined) {
        document.querySelector('.cardActive').classList.remove('cardActive')
      }
      e.classList.add('cardActive')
    })
  })

  if(document.querySelector('#media') != null){
    document.querySelector('#media').addEventListener('input', function () {
      let file = document.querySelector('#media').files[0]
      if(file == undefined){
        console.log("nul");
        document.querySelector(
          '.imgLoader'
        ).innerHTML = "";
        document.querySelector('h5.btn').innerHTML = "+ Choisir une image"
        return;
      }

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
