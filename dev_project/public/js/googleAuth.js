function getParameterByName(name, url = window.location.href) {
  name = name.replace(/[\[\]]/g, '\\$&')
  var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
    results = regex.exec(url)
  if (!results) return null
  if (!results[2]) return ''
  return decodeURIComponent(results[2].replace(/\+/g, ' '))
}

async function handleConnect(infos) {
  //   fetch('model/postConnect.php', {
  //     method: 'POST',
  //     headers: {
  //       'Content-Type': 'application/json',
  //       Accept: 'application/json',
  //     },
  //     body: JSON.stringify(infos),
  //   }).then((response) => {
  //     response.json().then(function (data) {
  //       return response
  //     })
  //   })
}

function postConnect(infos) {
  console.log('postConnect')

  $.post(
    'model/postConnect.php',
    {
      mail: infos['mail'],
      google_sub: infos['google_sub'],
    },

    function (ReturnedMessage) {
      console.log('function Received')
      console.log(ReturnedMessage)

      if (ReturnedMessage == 'valid') {
        if (getCookie('quizz')) {
          let quizz = JSON.parse(getCookie('quizz'))
          console.log(quizz)
          console.log(quizz.space)
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
              console.log(ReturnedMessage)
            },
            'text'
          )
        }
        // recharger la page pour retourner à la page demandée avant redirection vers connexion, sauf si page demandée = connexion, et aller vers profil
        if (getParameterByName('action') == 'connect') {
          window.location.href = 'index.php?action=account'
        } else {
          location.reload() // renvoie vers la page initialement demandée
        }
        console.log('valid !!')
      } else {
        $('#ConfirmationMessage').html('')
        $('#ConfirmationMessage').text(
          `Il y a une erreur dans un des champs remplis.`
        )
      }
    },
    'text'
  )
}

async function handleCredentialResponse(response) {
  // console.log('Encoded JWT ID token: ' + response.credential)

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
        // $connectStatus = handleConnect(data[1])
        $connectStatus = postConnect(data[1])
        if ($connectStatus == 'valid') {
          // recharger la page pour retourner à la page demandée avant redirection vers connexion, sauf si page demandée = connexion, et aller vers profil
          //   if (getParameterByName('action') == 'connect') {
          //     window.location.href = 'index.php?action=account'
          //   } else {
          //     location.reload() // renvoie vers la page initialement demandée
          //   }
          console.log('connected')
        } else {
          console.log("can't connect")
          console.log('d1 ', data)
        }
      } else {
        console.log('d2 ', data)
      }
      return response
    })
  })
}

window.onload = function () {
  google.accounts.id.initialize({
    client_id:
      '866214768583-13jeokh10iam9q1chmeiphgok3gbkr1i.apps.googleusercontent.com',
    callback: handleCredentialResponse,
  })
  google.accounts.id.renderButton(
    document.getElementById('googleAuthButton'),
    {
      theme: 'outline',
      size: 'large',
    } // customization attributes
  )
  google.accounts.id.prompt() // also display the One Tap dialog
}
