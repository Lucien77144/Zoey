document.addEventListener('DOMContentLoaded', function () {

  // Animation du menu des animaux pour montrer qu'il est scrollable (si ce menu existe uniquement)
  if(document.querySelector('.menuAnimauxInner') != null){
    if (getParameterByName('slider') != 'prevent') {
      document.querySelector('.menuAnimauxInner').scrollTo(document.querySelector(".menuAnimauxInner").offsetWidth, 0)
      $('.menuAnimauxInner').animate(
        {
          scrollLeft: 0,
        },
        750
      )
    }
  }

  // Cette fonction marche comme un $_GET en php, elle renvoie les éléments dans l'URL
  function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&')
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
      results = regex.exec(url)
    if (!results) return null
    if (!results[2]) return ''
    return decodeURIComponent(results[2].replace(/\+/g, ' '))
  }

  // Cette fonction marche comme un $_GET en php, elle renvoie les éléments dans l'URL
  function $_GET(param) {
    // Source : creativejuiz.fr
    var vars = {}
    window.location.href.replace(location.hash, '').replace(
      /[?&]+([^=&]+)=?([^&]*)?/gi, // regexp
      function (m, key, value) {
        // callback
        vars[key] = value !== undefined ? value : ''
      }
    )

    if (param) {
      return vars[param] ? vars[param] : null
    }
    return vars
  }

  // Selectionner l'animal par défaut sur le profil :
  // Si l'utilisateur possèdes des animaux :
  if (document.querySelector('.menuAnimauxWrapper li') != null) {
    // Si l'URL n'indique pas d'animal par défaut (en GET):
    if ($_GET('animal') == null) {
      document
        .querySelector('.menuAnimauxWrapper li:first-child')
        .classList.add('active')
        // Selectionner le premier animal par défaut
    } else { // Sinon :
      // Selectionner l'animal indiqué dans l'URL
      document
        .querySelector(
          `.menuAnimauxWrapper li[data-animalid="${$_GET('animal')}"]`
        )
        .classList.add('active');
    }
  }

  // Pour chaque animal présent sur le profil de l'utilisateur :
  document.querySelectorAll('.menuAnimauxWrapper li').forEach((e) => {
    // Lors du click :
    e.addEventListener('click', function () {
      // Si il n'est pas déjà selectionné :
      if (!this.classList.contains('active')) {
        // Le selectionner (via la class active) et déselectionner le précédent
        document
          .querySelector('.menuAnimauxWrapper .active')
          .classList.remove('active')
        this.classList.add('active')

        // récuperer l'id du nouvel animal à afficher :
        let animalId = this.getAttribute('data-animalId')

        // Commencer l'animation du changement (transition via le CSS) : cacher l'ancien profil
        document.querySelector('.profilAnimal').style.opacity = 0
        document.querySelector('.profilAnimal').style.transform = 'translateY(5%)';

        // Après un délais de 200 ms (soit le temps de l'animation CSS) :
        setTimeout(() => {
          // récupérer les posts et informations de l'animal en BDD :
          $.post(
            'model/printAnimal.php',

            {
              animalId: animalId,
            },

            function (ReturnedMessage) {
              if (ReturnedMessage) {
                // Changer le contenu du profil de l'animal :
                document.querySelector('.profilAnimal').innerHTML = ReturnedMessage;

                // ré-afficher le profil animal :
                document.querySelector('.profilAnimal').style.opacity = 1
                document.querySelector('.profilAnimal').style.transform = 'translateY(0%)';

                // ré-attribuer l'événement de modification / suppression du profil au nouveau profil :
                document.querySelector('.profilAnimal .iconModif').addEventListener('click', function () {
                    openModif(
                      document.querySelector('.profilAnimal'),
                      'model/modifAnimal.php'
                    );
                    $("#deleteProfilAnimal").click(function(e){
                      e.preventDefault();
                        // console.log('click');
                        
                        let idanimal = $('li.active').attr('data-animalid')
                        postDeleteAnimal(idanimal);
                      });
                  });
                  
              } else {
                // Si il n'y a pas d'animal retourné :
                document.querySelector(
                  '.profilAnimal'
                ).innerHTML = `Nous n'avons pas trouvé cet animal :/`;
              }
            },
            'text'
          )
        }, 200)
      }
    })
  });

  // Fonction de suppression d'un animal :
  function postDeleteAnimal(idanimal) {
    // console.log('postDeleteAnimal')

    $.post(
      'model/postDeleteAnimal.php',
      {
        idanimal: idanimal,
      },

      function (ReturnedMessage) {
        // console.log('function Received')
        // console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(`L'animal a bien été supprimé.`)
          document.querySelector(`li[data-animalid="${idanimal}"]`).remove();

          let animalId;
          if(document.querySelector(".menuAnimaux li:first-of-type") != null){
            document.querySelector(".menuAnimaux li:first-of-type").classList.add('active');
            animalId = document.querySelector(".menuAnimaux li:first-of-type").getAttribute('data-animalId')
          }
        
          document.querySelector('.profilAnimal').style.opacity = 0;
          document.querySelector('.profilAnimal').style.transform = 'translateY(5%)';
        
          setTimeout(() => {
            document.querySelector('.profilAnimal').style.opacity = 1
            document.querySelector('.profilAnimal').style.transform = 'translateY(0%)';
            $.post(
              'model/printAnimal.php',
              {
                animalId: animalId,
              },
        
              function (ReturnedMessage) {
                if (ReturnedMessage) {
                  document.querySelector('.profilAnimal').innerHTML = ReturnedMessage;
                  document.querySelector('.profilAnimal .iconModif').addEventListener('click', function () {
                    openModif(document.querySelector('.profilAnimal'), 'model/modifAnimal.php');
                    $("#deleteProfilAnimal").click(function(e){
                      e.preventDefault();
                      // console.log('click');
                      
                      let idanimal = $('li.active').attr('data-animalid');
                      postDeleteAnimal(idanimal);
                    });
                  });
                } else {
                  document.querySelector('.profilAnimal').innerHTML = `Nous n'avons pas trouvé cet animal :/`;
                }   
                if(document.querySelector(".menuAnimauxWrapper li") == null){
                  location.reload();
                }
              },
              'text'
            );
          }, 200);

        } else {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(`L'animal n'a pas pu être supprimé.`)
        }
      },
      'text'
    )
  }

  // Ajouter les événements pour modifier les profil des animaux de l'utilisateur
  document.querySelectorAll('.profilAnimal .iconModif').forEach((e) => {
    e.addEventListener('click', function () {
      openModif(document.querySelector('.profilAnimal'), 'model/modifAnimal.php');
      $("#deleteProfilAnimal").click(function(e){
        e.preventDefault();
        // console.log('click');

        let idanimal = $('li.active').attr('data-animalid');
        postDeleteAnimal(idanimal);
      });
    });
  });
  // console.log('modif : add listener')

  // Ajouter l'événement pour modifier son profil
  if(document.querySelector('.profil .iconModif') != null){
    document.querySelector('.profil .iconModif').addEventListener('click', function () {
      // console.log('before openModif');
      openModif(document.querySelector('.profil'), 'model/modifProfil.php');
    });
  }

  // Modifier un profil (animal ou utilisateur)
  function openModif(current, action) {
    // console.log('inside openModif')

    // Récupération des informations de l'utilisateur :
    let pseudoId = 'pseudoSubscribe';
    let modifId = 'submitModifyAccountPublic';
    let content = [
      current.innerHTML,
      current.querySelector('.innerUsername h1').innerHTML,
      current.querySelector('.desc p').innerText,
      current.querySelector('.avatar').innerHTML
    ];

    // Ajout du formulaire et remplissage des champs avec les anciennes valeurs
    current.innerHTML = `<form method="POST">${content[0]}</form>`
    let moreMdf = `<a class="moreModifs" href="index.php?action=modifyAccount"><svg viewBox="0 0 20 20"><rect x="8.5" width="3" height="20" rx="1.5" fill="white"></rect><rect y="8.5" width="20" height="3" rx="1.5" fill="white"></rect></svg></a>`;

    // Si il s'agit d'un profil animal, alors ajouter "supression de l'animal" et "modifier le profil de l'animal"
    if (action == 'model/modifAnimal.php') {
      moreMdf = '<a class="removeAnimal" id="deleteProfilAnimal"><svg viewBox="0 0 24 31" fill="none"><path d="M15.9913 0C16.1118 0.0401701 16.2338 0.0773655 16.3543 0.120511C16.7458 0.256557 17.0865 0.509004 17.3306 0.844039C17.5747 1.17907 17.7106 1.5807 17.7201 1.99512C17.732 2.65718 17.7201 3.32073 17.7201 4.03189H22.4616C23.4406 4.03189 23.994 4.5794 24 5.55687C24 6.31068 24 7.06449 24 7.8183C24 8.81065 23.4436 9.35369 22.4438 9.35816H21.8204C21.813 9.50694 21.8011 9.64827 21.8011 9.78217C21.8011 15.9396 21.8011 22.098 21.8011 28.2575C21.8082 28.5071 21.7862 28.7568 21.7356 29.0014C21.6375 29.4208 21.4003 29.7947 21.0626 30.0621C20.7249 30.3296 20.3066 30.4748 19.8759 30.4743C14.6289 30.4802 9.38203 30.4802 4.13512 30.4743C3.65311 30.4736 3.18902 30.2915 2.83508 29.9643C2.48115 29.6371 2.26329 29.1887 2.2248 28.7083C2.20844 28.5416 2.20695 28.372 2.20695 28.2039C2.20695 22.0762 2.20695 15.9475 2.20695 9.81788V9.35816C1.94361 9.35816 1.70854 9.35816 1.47347 9.35816C0.580803 9.34328 0.0228829 8.7928 0.00949281 7.90757C-0.00240946 7.09524 -0.00389724 6.28142 0.00949281 5.4676C0.0243706 4.58535 0.597167 4.03487 1.48537 4.03338C2.96423 4.03338 4.4421 4.03338 5.91897 4.03338H6.28347V3.18683C6.28347 2.80001 6.28347 2.41318 6.28347 2.02636C6.28932 1.57642 6.44293 1.14088 6.72064 0.786817C6.99835 0.432757 7.38476 0.179816 7.82035 0.0669509C7.88582 0.0490975 7.94979 0.0223171 8.01377 0.0014881L15.9913 0ZM20.1303 9.35964H19.7509C14.5833 9.35964 9.41625 9.35667 4.24967 9.35072C3.94022 9.35072 3.87327 9.43701 3.87476 9.73159C3.88269 15.9099 3.88269 22.0876 3.87476 28.2649C3.87476 28.7648 3.91641 28.805 4.4178 28.805H19.5649C20.0916 28.805 20.1273 28.7707 20.1273 28.2545V9.35964H20.1303ZM1.69218 7.66506H22.3039V5.72202H1.69218V7.66506ZM7.95277 4.00958H16.0552V2.26441C16.0552 1.7779 15.9466 1.66929 15.4601 1.66929H8.53598C8.46662 1.66482 8.39705 1.66482 8.32769 1.66929C8.27768 1.66987 8.22828 1.68037 8.18236 1.70018C8.13644 1.71999 8.09491 1.74872 8.06017 1.7847C8.02543 1.82068 7.99819 1.8632 7.98 1.90979C7.96182 1.95638 7.95307 2.00612 7.95426 2.05612C7.94682 2.7033 7.95277 3.34602 7.95277 4.00958V4.00958Z" fill="#FF9900"/><path d="M6.28036 19.2223C6.28036 17.12 6.28036 15.0193 6.28036 12.9185C6.28036 12.2743 6.83679 11.8681 7.40215 12.0854C7.54783 12.1376 7.67559 12.2303 7.77045 12.3525C7.86532 12.4748 7.92335 12.6216 7.93776 12.7757C7.94744 12.8746 7.95042 12.974 7.94668 13.0732V25.3847C7.95271 25.4837 7.95271 25.5831 7.94668 25.6822C7.92734 25.8972 7.82471 26.0961 7.6607 26.2365C7.4967 26.3769 7.28431 26.4476 7.06889 26.4335C6.85827 26.4254 6.65909 26.3356 6.51356 26.1831C6.36803 26.0307 6.28759 25.8275 6.28929 25.6167C6.27888 24.983 6.28929 24.3477 6.28929 23.7139L6.28036 19.2223Z" fill="#FF9900"/><path d="M17.7244 19.22C17.7244 21.282 17.7244 23.3441 17.7244 25.4062C17.7307 25.5442 17.7212 25.6824 17.6961 25.8183C17.648 26.0076 17.5335 26.1735 17.3736 26.2856C17.2136 26.3978 17.0187 26.449 16.8243 26.4298C16.6351 26.4147 16.4568 26.3351 16.3192 26.2043C16.1816 26.0735 16.0931 25.8994 16.0685 25.7112C16.0563 25.5926 16.0524 25.4733 16.0566 25.3541V13.1037C16.0566 13.0144 16.0566 12.9237 16.0566 12.8359C16.0655 12.6153 16.1606 12.407 16.3213 12.2557C16.4821 12.1043 16.6958 12.0221 16.9165 12.0265C17.1317 12.0346 17.3354 12.1255 17.4851 12.2802C17.6348 12.4349 17.7189 12.6414 17.7199 12.8567C17.7199 12.9549 17.7199 13.0546 17.7199 13.1543L17.7244 19.22Z" fill="#FF9900"/><path d="M11.1677 19.2211C11.1677 17.1293 11.1677 15.0375 11.1677 12.9457C11.1677 12.2806 11.7197 11.8626 12.294 12.0843C12.4396 12.1364 12.5672 12.2291 12.6619 12.3514C12.7565 12.4737 12.8142 12.6206 12.8281 12.7746C12.8326 12.834 12.8326 12.8937 12.8281 12.9531C12.8281 17.1368 12.8281 21.3199 12.8281 25.5026C12.8281 26.0099 12.5514 26.367 12.1244 26.425C11.5903 26.4994 11.1662 26.1274 11.1633 25.5546C11.1633 24.3748 11.1633 23.195 11.1633 22.0152L11.1677 19.2211Z" fill="#FF9900"/></svg></a>';
      modifId = 'submitModifyAnimalPublic';
      pseudoId = 'nomAnimal';
    }

    // Ajout de l'input pour le pseudo :
    current.querySelector('.innerUsername').innerHTML =
    `<input type="text" name="pseudo" value="${content[1]}" id="${pseudoId}">
    <label>
      <input type="submit" style="display:none" id="${modifId}">
      <svg class="iconSubmit" viewBox="0 0 32 32">
        <path d="M4.74219 31.9776C4.52142 31.9301 4.29968 31.8885 4.08085 31.8323C1.6214 31.2107 0.0140402 29.1792 0.00726216 26.6423C-0.00242072 22.041 -0.00242072 17.44 0.00726216 12.8394C0.0130719 10.2744 1.65335 8.21387 4.15444 7.63192C4.56594 7.54191 4.98619 7.49806 5.40741 7.5012C8.69958 7.49023 15.9918 7.48829 19.2839 7.4954C20.1167 7.4954 20.6463 8.01246 20.596 8.76095C20.5749 9.02544 20.462 9.27424 20.2769 9.46432C20.0918 9.6544 19.846 9.77379 19.5822 9.80185C19.4515 9.81347 19.3188 9.81444 19.1881 9.81444C15.9295 9.81444 8.67183 9.81444 5.41515 9.81444C4.02566 9.81444 2.90535 10.5687 2.49576 11.8072C2.38477 12.149 2.32856 12.5062 2.32922 12.8655C2.3176 17.4487 2.31566 22.032 2.32341 26.6152C2.32341 28.3746 3.60832 29.6547 5.36867 29.6566C9.98611 29.6566 14.6042 29.6566 19.2229 29.6566C20.9997 29.6566 22.2789 28.3775 22.2798 26.6007C22.2837 23.3957 22.2837 23.1909 22.2798 19.9866C22.2798 19.5324 22.4183 19.1577 22.8008 18.9001C22.966 18.7899 23.1569 18.7241 23.3549 18.7093C23.553 18.6944 23.7515 18.7309 23.9314 18.8152C24.1112 18.8995 24.2663 19.0288 24.3815 19.1906C24.4967 19.3524 24.5683 19.5411 24.5892 19.7387C24.5994 19.8351 24.6033 19.9322 24.6008 20.0292C24.6008 23.2168 24.6192 23.4044 24.595 26.591C24.5776 28.8539 23.5299 30.5145 21.4878 31.4973C21.0452 31.7094 20.5369 31.7878 20.0586 31.9224L19.8649 31.9776H4.74219Z"/>
        <path d="M11.7928 20.7928L8.00026 17.0001L8.00016 17C7.99799 16.9978 6.99856 16.0011 5.99988 16.9999C5.00023 17.9997 5.99993 18.9998 6.00016 19L6.00018 19L11 24L11 24C11.0001 24.0001 11.5001 24.5 12.4999 24.4998C13.4976 24.4996 13.9977 24.002 13.9999 23.9998L14 23.9997L25.9999 12C25.9999 12 27.0001 10.9998 25.9999 9.99982C25.0004 9.00055 24.0014 9.99852 23.9999 10L23.9998 10.0001L13.207 20.7928C12.8165 21.1833 12.1833 21.1833 11.7928 20.7928Z"/>
      </svg>
    </label> ${moreMdf}`;
    current.querySelector('.innerUsername').style.width = '100%';

    // Ajout du textarea pour la description
    current.querySelector('.desc').innerHTML = `<textarea name="desc" id="desc">${content[2]}</textarea>`;

    // Dimentionner le textarea
    sizeTextarea(current.querySelector('textarea'))
    current.querySelector('textarea').addEventListener('input', function () {
      sizeTextarea(this)
    })
    window.addEventListener('resize', function () {
      sizeTextarea(current.querySelector('textarea'))
    })

    // Modifier l'image de profil :
    current.querySelector('.avatar').innerHTML = `
        <label>
            <input type="file" accept="image/*" name="avatar" id="media" style="display:none">
            ${content[3]}
            <svg viewBox="0 0 20 22" class="modifAvatar">
                <path d="M16.3056 0C17.6196 0.0648753 18.6828 0.6962 19.2822 1.96466C19.8815 3.23311 19.7392 4.47543 18.8251 5.53473C17.5664 6.98717 16.2475 8.38731 14.952 9.80682C12.2659 12.7498 9.57668 15.6905 6.88419 18.6289C6.66973 18.8575 6.4129 19.0424 6.12796 19.1731C4.87597 19.7434 3.61041 20.2866 2.35164 20.8337C1.58572 21.1648 0.87597 21.0206 0.374396 20.426C-0.0226016 19.9554 -0.0855429 19.4084 0.0994 18.8409C0.551268 17.4582 1.01314 16.0787 1.48502 14.7025C1.55779 14.5056 1.66868 14.3249 1.81134 14.1709C5.76776 9.83103 9.72741 5.49439 13.6903 1.16098C14.3671 0.416366 15.2095 0.0290486 16.3056 0ZM6.81642 15.2728C6.92584 15.1556 7.02072 15.0549 7.11465 14.9523C9.33396 12.5232 11.5536 10.0934 13.7736 7.66303C14.8387 6.49592 15.9038 5.32914 16.9689 4.16267C17.423 3.66304 17.4105 3.0443 16.9486 2.61341C16.4867 2.18252 15.8718 2.23094 15.4061 2.71798C15.3335 2.79448 15.2638 2.87291 15.1921 2.95134L5.4124 13.6625C5.36205 13.7177 5.31557 13.7778 5.25941 13.8455L6.81642 15.2728ZM3.65012 15.5246C3.35963 16.4057 3.08173 17.2297 2.78544 18.1157L5.28459 17.0186L3.65012 15.5246Z" fill="white"/>
            </svg>
        </label>`

    current.querySelector('input[type=file]').addEventListener('input', function () {
      // launch loader
      $('body').append("<div class='loader'><img src='public/images/icons/loader.svg'></div>")

      // Mettre à jour l'image de profil
        setTimeout(() => {
          changeAvatar(this, action)
        }, 50)
      })

    $('#pseudoSubscribe').keyup(function () {
      // vérifier que le pseudo soit libre
      isPseudoFreeAPI()
    })

    $('#submitModifyAccountPublic').click(function (e) {
      e.preventDefault()

      // console.log('click')

      if (document.querySelector('.profil #pseudoSubscribe').value == '') {
        // console.log('pseudo vide')
      } else if (document.querySelector('.profil #desc').value == '') {
        // console.log('description vide')
      } else {
        postModifyAccount();
      }
    })

    $('#submitModifyAnimalPublic').click(function (e) {
      e.preventDefault();

      // console.log('click')
      if (document.querySelector('.profilAnimal #nomAnimal').value == '') {
        // console.log('nom vide')
      } else if (document.querySelector('.profilAnimal #desc').value == '') {
        // console.log('description vide')
      } else {
        postModifyAnimal()
      }

      if (document.querySelector('.profilAnimal #nomAnimal').value == '') {
        // console.log('nom vide')
      } else if (document.querySelector('.profilAnimal #desc').value == '') {
        // console.log('description vide')
      } else {
        postModifyAnimal()
      }
    })

    // Vérifier que le pseudo est disponible
    function isPseudoFreeAPI() {
      // console.log('isPseudoFreeAPI')

      $.post(
        'model/isPseudoFreeAPI.php',
        {
          checkPseudo: $('#pseudoSubscribe').val(),
        },

        function (ReturnedMessage) {
          // console.log('function Received')
          // console.log(ReturnedMessage)

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

    // Modifier la description et le pseudo de l'utilisateur
    function postModifyAccount() {
      // console.log('postModifyAccount')

      $.post(
        'model/modifyProfil.php',
        {
          pseudo: $('#pseudoSubscribe').val(),
          desc: $('#desc').val(),
        },

        function (ReturnedMessage) {
          // console.log(ReturnedMessage)
          // console.log('function Received1')

          if (ReturnedMessage == 'valid') {
            // window.location.href = 'index.php?action=connect'
            location.reload();
            // console.log('valid !!')
          } else {
            $('#confirmationMessage').html('');
            $('#confirmationMessage').text(
              `Il y a une erreur dans un des champs remplis.`
            );
          }
        },
        'text'
      )
    }
  }

    // Modifier la description et le pseudo de l'un des animaux de l'utilisateur
  function postModifyAnimal() {
    // console.log('postModifyAnimal')

    $.post(
      'model/postModifyAnimal.php',
      {
        nom: $('#nomAnimal').val(),
        // media: postedMedia,
        description: $('#desc').val(),
        // date_naissance: $('#date_naissance').val(),
        // idtype: $('#idtype').val(),
        idAnimal: $('ul.menuAnimauxWrapper > li.active').attr('data-animalid'),
      },

      function (ReturnedMessage) {
        // console.log('function Received')
        // console.log(ReturnedMessage)

        if (ReturnedMessage == 'valid') {
          // console.log('valid')
          location.reload()
        } else {
          $('#confirmationMessageAnimal').html('')
          $('#confirmationMessageAnimal').text(
            `Il y a une erreur dans un des champs remplis.`
          )
        }
      },
      'text'
    )
  }

  // dimentionner le textarea
  function sizeTextarea(current) {
    current.style.height = 'auto'
    current.style.height = `${current.scrollHeight + 5}px`
  }

  // Enregistrer une image (et renvoyer le nom du fichier uploadé)
  function postPhoto() {
    // renvoie basename fichier uploadé
    // console.log('postPhoto')

    let fd = new FormData()
    let files = $('#media')[0].files[0]
    if (files === null) {
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

    // console.log(returnedFromAjax)

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

  function postModifyAccountSendPicture(setparam, setvalue) {
    // send new photo
    // console.log('postModifyAccount')

    $.post(
      'model/postModifyAccount.php',
      {
        setparam: setparam,
        setvalue: setvalue,
      },

      function (ReturnedMessage) {
        // console.log(ReturnedMessage)
        // console.log('function Received1')

        if (ReturnedMessage == 'valid') {
          //   window.location.href = 'index.php?action=connect'
          location.reload()
          // console.log('valid !!')
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `Votre nouvelle photo de profil a bien été sauvegardée.`
          )
        } else {
          $('#confirmationMessage').html('')
          $('#confirmationMessage').text(
            `Cette nouvelle photo de profil n'a pas pu être sauvegardée.`
          )
        }
      },
      'text'
    )
  }

  function postModifyAnimalSendPicture(pic) {
    //send new photo
    // console.log('postModifyAnimalPic')

    $.post(
      'model/postModifyAnimalPic.php',
      {
        pic: pic,
        idAnimal: $('ul.menuAnimauxWrapper > li.active').attr('data-animalid'),
      },

      function (ReturnedMessage) {
        // console.log(ReturnedMessage)
        // console.log('function Received1')

        if (ReturnedMessage == 'valid') {
          //   window.location.href = 'index.php?action=connect'
          location.reload()
          // console.log('valid !!')
          $('#confirmationMessageAnimal').html('')
          $('#confirmationMessageAnimal').text(
            `Votre nouvelle photo de profil a bien été sauvegardée.`
          )
        } else {
          $('#confirmationMessageAnimal').html('')
          $('#confirmationMessageAnimal').text(
            `Cette nouvelle photo de profil n'a pas pu être sauvegardée.`
          )
        }
      },
      'text'
    )
  }

  function changeAvatar(current, action) {
    let file = current.files[0]
    let reader = new FileReader()

    reader.onload = function (e) {
      current.nextElementSibling.src = e.target.result
    }
    reader.readAsDataURL(file)

    // console.log('postPhoto change avatar 1')

    let postedMedia = postPhoto()
    if (postedMedia == 'déconnecté') {
      // console.log('erreur photo déconnecté')
      return
    }
    if (action == 'model/modifAnimal.php') {
      postModifyAnimalSendPicture(postedMedia)
    } else {
      postModifyAccountSendPicture('media', postedMedia)
    }

    // remove loader
    $('.loader').remove()
  }
})
