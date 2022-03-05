// this page is made for all ajax calls (forms and more)

function getCookie(cname) {
  let name = cname + '='
  let decodedCookie = decodeURIComponent(document.cookie)
  let ca = decodedCookie.split(';')
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i]
    while (c.charAt(0) == ' ') {
      c = c.substring(1)
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length)
    }
  }
  return ''
}

$(document).ready(function () {
  console.log('ready')

  function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&')
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
      results = regex.exec(url)
    if (!results) return null
    if (!results[2]) return ''
    return decodeURIComponent(results[2].replace(/\+/g, ' '))
  }

  function postPhoto() {
    // renvoie basename fichier uploadé
    console.log('postPhoto')

    let fd = new FormData()
    let files = $('#media')[0].files[0]
    if (files == null) {
      return null
    }

    fd.append('media', files)

    let returnedFromAjax

    $.ajax({
      url: 'model/postPhoto.php',
      data: fd,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function (data) {
        returnedFromAjax = data
      },
      dataType: 'text',
      async: false,
    })

    console.log(returnedFromAjax)

    if (returnedFromAjax == 'déconnecté') {
      $('#confirmationMessage').html('')
      $('#confirmationMessage').html(
        `Votre session a expirée, veuillez <a href="index.php?action=connect" target="_blanck">vous reconnecter</a> puis retenter d'envoyer le formulaire.`
      )
      $('#ConfirmationMessage').html('')
      $('#ConfirmationMessage').html(
        `Votre session a expirée, veuillez <a href="index.php?action=connect" target="_blanck">vous reconnecter</a> puis retenter d'envoyer le formulaire.`
      )
      return returnedFromAjax
    } else {
      return returnedFromAjax
    }
  }

  function postSubscribe() {
    console.log('postSubscribe')

    $.post(
      'model/postSubscribe.php',
      {
        pseudo: $('#pseudoSubscribe').val(),
        nom: $('#nom').val(),
        prenom: $('#prenom').val(),
        mail: $('#mail').val(),
        date_naissance: $('#date_naissance').val(),
        password: $('#password').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          window.location.href = 'index.php?action=connect'
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

  function postForgotPassword() {
    console.log('postForgotPassword')

    $.post(
      'model/postForgotPassword.php',
      {
        mail: $('#forgotMail').val(),
      },

      function (ReturnedMessage) {
        console.log(ReturnedMessage)
        console.log('function Received1')

        if (ReturnedMessage == 'valid') {
          // window.location.href = 'index.php?action=connect'
          console.log('valid forgot password')
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `Vérifiez bien vos spams ! Vous allez recevoir un email pour vous aider à retrouver l'accès à votre compte.`
          )
        } else {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `Il y a une erreur dans un des champs remplis.`
          )
        }
      },
      'text'
    )
  }

  function postModifyAccount(setparam, setvalue) {
    console.log('postModifyAccount')

    $.post(
      'model/postModifyAccount.php',
      {
        setparam: setparam,
        setvalue: setvalue,

        // pseudo : $("#pseudoSubscribe").val(),
        // media : postedMedia,
        // nom : $("#nom").val(),
        // prenom : $("#prenom").val(),
        // mail : $("#mail").val(),
        // date_naissance : $("#date_naissance").val(),
        // password : $("#password").val()
      },

      function (ReturnedMessage) {
        console.log(ReturnedMessage)
        console.log('function Received1')

        if (ReturnedMessage == 'valid') {
          window.location.href = 'index.php?action=connect'
          console.log('valid !!')
        } else {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `Il y a une erreur dans un des champs remplis.`
          )
        }
      },
      'text'
    )
  }

  function postConnect() {
    console.log('postConnect')

    $.post(
      'model/postConnect.php',
      {
        pseudo: $('#pseudo').val(),
        password: $('#password').val(),
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

                // if (ReturnedMessage == "valid"){
                //     window.location.href = "index.php?action=adoption";
                // } else if (ReturnedMessage == "connect"){
                //     window.location.href = "index.php?action=connect&src=quizz";
                // } else {
                //     $('#confirmationMessage').html('');
                //     $('#confirmationMessage').text(
                //         `Nous n'avons pas réussi à envoyer vos réponses, il y a eu une erreur :/`
                //     );
                // }
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

  function isPseudoFreeAPI() {
    console.log('isPseudoFreeAPI')

    $.post(
      'model/isPseudoFreeAPI.php',
      {
        checkPseudo: $('#pseudoSubscribe').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == true) {
          $('#pseudoConfirmationMessage').html('')
          $('#pseudoConfirmationMessage').text(`Ce pseudo est disponible !`)
        } else if (ReturnedMessage == '2') {
          $('#ConfirmationMessage').html('') // empty message when pseudo is already the user's one
        } else {
          $('#pseudoConfirmationMessage').html('')
          $('#pseudoConfirmationMessage').text(`Ce pseudo existe déjà !`)
        }
      },
      'text'
    )
  }

  function postAddPost(postedMedia) {
    console.log(postedMedia)
    console.log('addpost')

    $.post(
      'model/postAddPost.php',
      {
        description: $('#description').val(),
        media: postedMedia,
        idAnimal: $('#idAnimal').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          window.location.href = 'index.php?action=account'
          // location.reload()
          console.log('valid 1 !!')
        } else {
          $('#ConfirmationMessage').html('')
          $('#ConfirmationMessage').text(`L'ajout a échoué`)
        }
      },
      'text'
    )
  }

  function postAddNewsletter() {
    console.log('postAddNewsletter')

    $.post(
      'model/postAddNewsletter.php',
      {
        prenom: $('#newsletterName').val(),
        mail: $('#newsletterMail').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          $('#newsletterForm').trigger('reset')
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(`Vous êtes bien inscrit !`)
          console.log('valid 1 !!')
        } else {
          $('#confirmationMessageNewsletter').html('')
          $('#confirmationMessageNewsletter').text(
            `Cette adresse mail n'est pas valide`
          )
        }
      },
      'text'
    )
  }

  function postAddMessage(postedMedia) {
    console.log(postedMedia)
    console.log('addMessage')

    $.post(
      'model/postAddMessage.php',
      {
        msg: $('#msg').val(),
        media: postedMedia,
        idconversation: getParameterByName('id'),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          // window.location.href = "index.php?action=connect";
          console.log('valid 1')
          $('#addMessageForm').trigger('reset')
          $('#ConfirmationMessage').html('')
        } else {
          $('#ConfirmationMessage').html('')
          $('#ConfirmationMessage').text(`L'envoi a échoué`)
        }
      },
      'text'
    )
  }

  function postAddAnimal(postedMedia) {
    console.log('postAddAnimal')

    $.post(
      'model/postAddAnimal.php',
      {
        nom: $('#nom').val(),
        media: postedMedia,
        description: $('#description').val(),
        date_naissance: $('#date_naissance').val(),
        idtype: $('#idtype').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          window.location.href = 'index.php?action=account'
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

  function postModifyAnimal(postedMedia, id) {
    console.log('postModifyAnimal')

    $.post(
      'model/postModifyAnimal.php',
      {
        nom: $('#nom').val(),
        media: postedMedia,
        description: $('#description').val(),
        date_naissance: $('#date_naissance').val(),
        idtype: $('#idtype').val(),
        idAnimal: id,
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
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

  function postAddFriend() {
    console.log('postAddFriend')

    $.post(
      'model/postAddFriend.php',
      {
        addFriendId: $('#addFriend').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == true) {
          // window.location.href = "index.php?action=account";
          location.reload()
          console.log('valid !!')
        } else {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `La demande d'ami n'a pas pu être envoyée.`
          )
        }
      },
      'text'
    )
  }

  function postRemoveFriend() {
    console.log('postRemoveFriend')

    $.post(
      'model/postRemoveFriend.php',
      {
        removeFriendId: $('#removeFriend').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == true) {
          // window.location.href = "index.php?action=account";
          location.reload()
          console.log('valid !!')
        } else {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(`La demande n'a pas pu être envoyée.`)
        }
      },
      'text'
    )
  }

  function postAcceptFriend() {
    console.log('postAcceptFriend')

    $.post(
      'model/postAcceptFriend.php',
      {
        acceptFriendId: $('#acceptFriend').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == true) {
          // window.location.href = "index.php?action=account";
          location.reload()
          console.log('valid !!')
        } else {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(`La demande n'a pas pu être envoyée.`)
        }
      },
      'text'
    )
  }

  function postAjouterRefuge(postedMedia) {
    console.log('postAjouterRefuge')

    $.post(
      'model/postAjouterRefuge.php',
      {
        nom: $('#nom').val(),
        description: $('#description').val(),
        lien: $('#lien').val(),
        mail: $('#mail').val(),
        tel: $('#tel').val(),
        maps: $('#maps').val(),
        adresse: $('#adresse').val(),
        logo: postedMedia,
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(`Le refuge a bien été ajouté.`)
        } else {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `Il y a une erreur dans un des champs remplis.`
          )
        }
      },
      'text'
    )
  }

  function postAjouterAA(postedMedia) {
    console.log('postAjouterAA')

    $.post(
      'model/postAjouterAA.php',
      {
        nom: $('#nom').val(),
        sexe: $('#sexe').val(),
        description: $('#description').val(),
        idtype: $('#idtype').val(),
        idrefuge: $('#idrefuge').val(),
        date_anniversaire: $('#date_anniversaire').val(),
        unknownAge: $('#unknownAge').val(),
        photo: postedMedia,
        badge1: $('#badge1').val(),
        badge2: $('#badge2').val(),
        badge3: $('#badge3').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `L'animal à adopter a bien été ajouté.`
          )
        } else {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `Il y a une erreur dans un des champs remplis.`
          )
        }
      },
      'text'
    )
  }
  function postDeleteAA() {
    console.log('postDeleteAA')

    $.post(
      'model/postDeleteAA.php',
      {
        idanimal: $('#idanimal').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          $('#confirmationMessageAA').html('')
          $('#confirmationMessageAA').text(
            `L'animal à adopter a bien été supprimé.`
          )
        } else {
          $('#confirmationMessageAA').html('')
          $('#confirmationMessageAA').text(
            `L'animal à adopter n'a pas pu être supprimé.`
          )
        }
      },
      'text'
    )
  }

  function postDeletePost() {
    console.log('postDeletePost')

    $.post(
      'model/postDeletePost.php',
      {
        idpost: getParameterByName('id'),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          $('#confirmationMessageAA').html('')
          $('#confirmationMessageAA').text(
            `L'animal à adopter a bien été supprimé.`
          )
        } else {
          $('#confirmationMessageAA').html('')
          $('#confirmationMessageAA').text(
            `L'animal à adopter n'a pas pu être supprimé.`
          )
        }
      },
      'text'
    )
  }

  function postDeleteRefuge() {
    console.log('postDeleteRefuge')

    $.post(
      'model/postDeleteRefuge.php',
      {
        idrefuge: $('#idrefuge').val(),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          $('#confirmationMessageRefuge').html('')
          $('#confirmationMessageRefuge').text(`Le refuge a bien été supprimé.`)
        } else {
          $('#confirmationMessageRefuge').html('')
          $('#confirmationMessageRefuge').text(
            `Le refuge n'a pas pu être supprimé.`
          )
        }
      },
      'text'
    )
  }

  function postConvSearch(search) {
    console.log('postConvSearch')

    $.post(
      'model/postConvSearch.php',
      {
        convSearch: search,
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage) {
          // window.location.href = "index.php?action=account";
          // location.reload();
          $('#confirmationMessage').html('')
          $('#messagesContainer').html('')
          $('#messagesContainer').html(ReturnedMessage)
          console.log('valid !!')
        } else {
          $('#messagesContainer').html('')
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `Nous n'avons trouvé aucune conversation :/`
          )
        }
      },
      'text'
    )
  }

  $('#submitSubscribe').click(function (e) {
    e.preventDefault()

    console.log('click')

    postSubscribe()
  })

  $('#submitAddPost').click(function (e) {
    e.preventDefault()

    console.log('click')

    let files = $('#media')[0].files[0]
    if (files == null) {
      $('#ConfirmationMessage').html('')
      $('#ConfirmationMessage').text(`Vous n'avez pas ajouté d'image !`)
      return
    }

    let postedMedia = postPhoto()
    if (postedMedia == 'déconnecté') {
      return
    }

    postAddPost(postedMedia)
  })

  $('#submitNewsletter').click(function (e) {
    e.preventDefault()

    console.log('click')

    postAddNewsletter()
  })

  $('#submitAddMessage').click(function (e) {
    e.preventDefault()

    if (
      document.querySelector('#msg').value != '' ||
      document.querySelector('#media').value != ''
    ) {
      $('body').append(
        "<div class='loader'><img src='public/images/icons/loader.svg'></div>"
      )
    }

    setTimeout(() => {
      console.log('click')

      let postedMedia = postPhoto()
      // if (postedMedia == "déconnecté"){
      // return;
      // }

      postAddMessage(postedMedia)
      $('main').animate(
        { scrollTop: document.querySelector('main').scrollHeight },
        750
      )
    }, 50)
  })

  $('#submitAddAnimal').click(function (e) {
    e.preventDefault()

    console.log('click')

    let postedMedia = postPhoto()
    if (postedMedia == 'déconnecté') {
      return
    }

    postAddAnimal(postedMedia)
  })

  // modify account
  // $("#submitModifyAccount").click(function(e){
  //     e.preventDefault();

  //     console.log("click")

  //     let postedMedia = postPhoto();

  //     postModifyAccount(postedMedia);
  // });
  $('#submitModifyAccountPseudo').click(function (e) {
    e.preventDefault()

    console.log('click')

    postModifyAccount('pseudo', $('#pseudoSubscribe').val())
  })
  $('#submitModifyAccountMedia').click(function (e) {
    e.preventDefault()

    console.log('click')

    let postedMedia = postPhoto()
    if (postedMedia == 'déconnecté') {
      return
    }

    console.log(postedMedia)

    // postModifyAccount("media",postedMedia);
  })
  $('#submitModifyAccountNom').click(function (e) {
    e.preventDefault()

    console.log('click')

    postModifyAccount('nom', $('#nom').val())
  })
  $('#submitModifyAccountPrenom').click(function (e) {
    e.preventDefault()

    console.log('click')

    postModifyAccount('prenom', $('#prenom').val())
  })
  $('#submitModifyAccountMail').click(function (e) {
    e.preventDefault()

    console.log('click')

    postModifyAccount('mail', $('#mail').val())
  })
  $('#submitModifyAccountDate').click(function (e) {
    e.preventDefault()

    console.log('click')

    postModifyAccount('date_naissance', $('#date_naissance').val())
  })
  $('#submitModifyAccountPassword').click(function (e) {
    e.preventDefault()

    console.log('click')

    postModifyAccount('password', $('#password').val())
  })
  // END modify account

  $('#submitModifyAnimal').click(function (e) {
    e.preventDefault()

    console.log('click')

    const pageUrl = window.location.search
    const urlGetParameters = new URLSearchParams(pageUrl)
    const id = urlGetParameters.get('id')

    let postedMedia = postPhoto()
    if (postedMedia == 'déconnecté') {
      return
    }

    postModifyAnimal(postedMedia, id)
  })

  $('#submitConnect').click(function (e) {
    e.preventDefault()

    console.log('click')

    postConnect()
  })

  $('#addFriend').click(function (e) {
    e.preventDefault()

    console.log('addFriend')

    postAddFriend()
  })

  $('#removeFriend').click(function (e) {
    e.preventDefault()

    console.log('removeFriend')

    postRemoveFriend()
  })

  $('#acceptFriend').click(function (e) {
    e.preventDefault()

    console.log('acceptFriend')

    postAcceptFriend()
  })

  $('#submitAjouterRefuge').click(function (e) {
    e.preventDefault()

    console.log('click')

    let postedMedia = postPhoto()
    if (postedMedia == 'déconnecté') {
      return
    }

    postAjouterRefuge(postedMedia)
  })
  $('#submitAjouterAnimalAdopter').click(function (e) {
    e.preventDefault()

    console.log('click')

    let postedMedia = postPhoto()
    if (postedMedia == 'déconnecté') {
      return
    }

    postAjouterAA(postedMedia)
  })
  $('#submitDeletePost').click(function (e) {
    e.preventDefault()

    console.log('click delete')

    postDeletePost()
  })
  $('#deleteRefuge').click(function (e) {
    e.preventDefault()

    console.log('click')

    postDeleteRefuge()
  })
  $('#deleteAA').click(function (e) {
    e.preventDefault()

    console.log('click')

    postDeleteAA()
  })

  $('#submitForgotMail').click(function (e) {
    e.preventDefault()

    console.log('click')

    postForgotPassword()
  })

  // rechercher une conversation (page messages)
  let searchFlag = false
  let convSearch
  $('#convSearch').keyup(function (e) {
    e.preventDefault()
    console.log('convSearch')

    if (!searchFlag) {
      // si pas de recherche en cours
      searchFlag = true
      let search = setInterval(() => {
        if (convSearch != $('#convSearch').val()) {
          // si la recherche a changé
          convSearch = $('#convSearch').val() // j'actualise la recherche dans la variable
          console.log(convSearch)
          if (convSearch) {
            postConvSearch(convSearch) // je recherche en db
          }
        }
      }, 1000) // je teste toutes les secondes l'entrée input search
      setTimeout(() => {
        clearInterval(search)
        searchFlag = false
      }, 5000) // je réinitialise la recherche au bout de 5 sec
    }
  })

  // loadMoreMessages on the chat :
  offsetCoef = 1
  $('#loadMoreMessages').click(function (e) {
    console.log('loadMoreMessages')

    $.post(
      'model/postLoadMoreMessages.php',
      {
        offsetCoef: offsetCoef,
        id: getParameterByName('id'),
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

        if (ReturnedMessage) {
          console.log('valid !!')
          $('#chatContainer').prepend(ReturnedMessage)
          offsetCoef += 1
        } else {
          $('#loadMoreMessages').remove()
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `Tous les messages ont déjà été chargés.`
          )
        }
      },
      'text'
    )
  })

  // let flagPseudoCheck = false;
  $('#pseudoSubscribe').keyup(function () {
    isPseudoFreeAPI()
  })
  // A OPTIMISER !!! -> limiter les requetes

  // console.log("keyup")

  // if(!flagPseudoCheck){
  //     let regularCheck = setInterval(() => {
  //                             console.log("check")

  //                             isPseudoFreeAPI();
  //                         }, 1000);

  //     setTimeout(() => {
  //     clearInterval(regularCheck);
  //     }, 5000);
  // }

  // flagPseudoCheck = true;
  // setTimeout(() => {
  //     flagPseudoCheck = false;
  //     console.log("timeout -> false again")
  //     // isPseudoFreeAPI();
  // }, 1000);
})
