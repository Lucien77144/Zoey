// Cette fonction marche comme un $_GET en php, elle renvoie les éléments dans l'URL
function getParameterByName(name, url = window.location.href) {
  name = name.replace(/[\[\]]/g, '\\$&')
  var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
    results = regex.exec(url)
  if (!results) return null
  if (!results[2]) return ''
  return decodeURIComponent(results[2].replace(/\+/g, ' '))
}

// Fonction d'affichage du loader
function showLoader(callback) {
  document.getElementById('loaderContainer').style.display = 'flex'
  // console.log('loader loaded')
  setTimeout(() => {
    callback()
  }, 10)
}

// Cacher le loader
function hideLoader() {
  document.getElementById('loaderContainer').style.display = 'none'
}

// Connecter l'utilisateur (et enregistrer ses résultats au quiz si ce dernier a été effectué)
function postConnect(infos) {
  // console.log('postConnect')

  $.post(
    'model/postConnect.php',
    {
      mail: infos['mail'],
      google_sub: infos['google_sub'],
    },

    function (ReturnedMessage) {
      // console.log('function Received')
      // console.log(ReturnedMessage)

      if (ReturnedMessage == 'valid') {
        if (getCookie('quizz')) {
          let quizz = JSON.parse(getCookie('quizz'))
          // console.log(quizz)
          // console.log(quizz.space)
          $.post(
            'model/postQuizz.php',
            {
              space: quizz.space,
              secure: quizz.secure,
              children: quizz.children,
              travel: quizz.travel,
              personality: quizz.personality,
              animals: quizz.animals,
              walk: quizz.walk,
              animal1: quizz.animal1,
              animal2: quizz.animal2,
              animal3: quizz.animal3,
            },

            function (ReturnedMessage) {
              // console.log(ReturnedMessage)
            },
            'text'
          )
        }
        // recharger la page pour retourner à la page demandée avant redirection vers connexion, sauf si page demandée = connexion, et aller vers profil
        if (
          getParameterByName('action') == 'connect' ||
          getParameterByName('action') == 'subscribe'
        ) {
          window.location.href = 'index.php?action=account'
        } else {
          location.reload() // renvoie vers la page initialement demandée
        }
        // console.log('valid !!')
        return true
      } else {
        googleError()
        return false
      }
    },
    'text'
  )
}

function googleError() {
  hideLoader()
  $('#ConfirmationMessage').html('')
  $('#ConfirmationMessage').html(
    `La connexion avec Google n'a pas fonctionné. Vous pouvez nous signaler cette erreur par mail : <a href="mailto:contact@zoey-app.fr">contact@zoey-app.fr</a>.`
  )
}

async function handleCredentialResponse(response) {
  // console.log('Encoded JWT ID token: ' + response.credential)

  showLoader(() => {
    fetch('model/googleAuth.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      body: JSON.stringify(response.credential),
    }).then((response) => {
      response.json().then(function (data) {
        if (data[0] == 'connect') {
          $connectStatus = postConnect(data[1]) // ce script envoie à postConnect en AJAX et gère la réponse (recharge la page)
        } else {
          googleError()
        }
        return response
      })
    })
  })
}

function start() {
  // console.log('init google button')
  google.accounts.id.initialize({
    client_id:
      '866214768583-13jeokh10iam9q1chmeiphgok3gbkr1i.apps.googleusercontent.com',
    callback: handleCredentialResponse,
    auto_select: true,
  })
  if (document.getElementById('googleAuthButton')) {
    google.accounts.id.renderButton(
      document.getElementById('googleAuthButton'),
      {
        theme: 'outline',
        size: 'large',
      } // customization attributes
    )
  }
  
  if (!document.getElementById('googleAuth')) {
    google.accounts.id.prompt((notification) => {
      if (notification.isNotDisplayed() || notification.isSkippedMoment()) {
        // console.log('skipped google')
      }
    })
  }
}

window.onload = start()
