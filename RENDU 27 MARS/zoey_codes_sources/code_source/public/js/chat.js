// this page is made to refresh the messages page (with ajax calls)

// Cacher l'écran de chargement
function hideLoader() {
  document.getElementById('loaderContainer').style.display = 'none'
}

$(document).ready(function () {
  // Animer la page à son charnement pour scroller en bas du tchat
  $('main').animate(
    { scrollTop: document.querySelector('main').scrollHeight },
    750
  );

  // Cette fonction marche comme un $_GET en php, elle renvoie les éléments dans l'URL
  function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&')
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
      results = regex.exec(url)
    if (!results) return null
    if (!results[2]) return ''
    return decodeURIComponent(results[2].replace(/\+/g, ' '))
  }

  // Si il y a plus de messages à charger, alors :
  if (document.querySelector('.moreMsg')) {
    document.querySelector('.moreMsg').addEventListener('click', function () {
      // animer l'icon "voir plus de messages" au click
      this.animate(
        [
          { transform: 'scale(1)' },
          { transform: 'scale(0.9)' },
          { transform: 'scale(1)' },
        ],
        {
          duration: 250,
        }
      )
    })
  }

  // Ré-atribuer les événements au clique au images du tchat
  document.querySelectorAll('.imgChat').forEach((e) => {
    e.removeEventListener('click', updatePopup, false)
    e.addEventListener('click', updatePopup, false)
  })

  // Toute les secondes, charger les potentiels nouveaux messages !
  lookForNewMessages = setInterval(() => {
    let idConv = null;
    idConv = getParameterByName('id');
    if (idConv) {
      $.post(
        'model/getNewMessages.php',
        {
          id: idConv,
        },

        function (ReturnedMessage) {
          // console.log('function Received : ' + ReturnedMessage)

          // Cacher l'écran de chargement
          hideLoader();

          // Si il y a un nouveau message :
          if (ReturnedMessage) {

            // console.log('new messages found !!')
            $('#noMessagesYet').remove()
            // Ajouter les nouveaux messages à la discussion
            $('#chatContainer').append(ReturnedMessage)

            // Scroller vers en bas du tchat
            $('main').animate(
              { scrollTop: document.querySelector('main').scrollHeight },
              750
            )

            // Ré-atribuer les événements au clique au images du tchat
            document.querySelectorAll('.imgChat').forEach((e) => {
              e.removeEventListener('click', updatePopup, false)
              e.addEventListener('click', updatePopup, false)
            })

            // Reinitialiser le bouton "ajouter une image"
            document
              .querySelector('.currentPicture')
              .setAttribute('src', 'public/images/icons/addPost.svg')
          }
        },
        'text'
      )
    } else {
      // console.log('id')
    }
  }, 1000)

  // Fonction de création de pupup pour les images du tchat (voir en plus grand)
  function updatePopup() {
    let img = this.getAttribute('style').slice(22, -1)

    $('body').append(
      `<div class="popupPic"><img class="closePop" src="./public/images/icons/close.svg"><img class="illusPop" src=${img}><div>`
    )
    $('.popupPic').fadeIn(250)

    document.querySelector('.closePop').addEventListener('click', function () {
      $('.popupPic').fadeOut(250)
      setTimeout(() => {
        $('.popupPic').remove()
      }, 250)
    })
  }
})
