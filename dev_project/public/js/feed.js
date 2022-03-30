document.addEventListener('DOMContentLoaded', function () {

  // Cette fonction détermine si une image doit être en "cover" ou "contain" afin d'être plus immersive.
  isAbleSizePost();
  function isAbleSizePost(){
    document.querySelectorAll(".blockIllus").forEach(e => {
      // Si l'image est chargée, alors :
      if(e.complete && e.naturalHeight !== 0){
        // Verifier si elle doit être redimentionnée
        sizePost(e);
      } else {
        // Sinon, attendre qu'elle soit chargée pour verifier si elle doit être redimentionnée
        e.addEventListener("load", function(){
          sizePost(e);
        });
      }
    });
  }

  function sizePost(element){
    // Si la largeur originale de l'image moins sa hauteur est inférieure à (-250), alors :
    if(((element.naturalWidth - element.naturalHeight) < -250)){
      // Faire en sorte que l'image recouvre l'écran
      element.style.objectFit="cover";
    }else{
      // Faire en sorte que l'image soit contenue dans l'écran
      element.style.objectFit="contain";
    }
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

  let numPosts = 1;
  let postToPass = 5;
  let id;
  document.querySelector('main').addEventListener('scroll', function () {
    // Charger les 5 prochains posts tous les 5 posts scrollés :
    if (this.scrollTop > window.innerHeight * (numPosts * postToPass)) {
      numPosts++;

      let idPost = $_GET().id;
      if(idPost != null || idPost != undefined){
        id = "?idPost="+idPost;
      }else{
        id = "";
      }
      $.post(
        'model/loadFeed.php'+id,
        {
          posts: numPosts
        },

        function (ReturnedMessage) {
          // console.log(ReturnedMessage);
          // console.log('model/loadFeed.php'+id);
          addContent(ReturnedMessage);
        },
        'text'
      )
    }
  })

  // Cette fonction vérifie que l'utilisateur ne scroll plus (pour éviter des bugs lors de la modification du DOM)
  function scrollEnd(element, content) {

    // Si il n'y a plus aucun contenu (content contient "ended") ou qu'un article contient un attribut data-end (= qu'il n'y a plus d'articles après ceux-la)
    if(content.includes("ended") || document.querySelector("article[data-end]") != null){
      // Ajouter la classe "hiddenAfter" au main celle-ci change retire l'icon de chargement et indique que tout le contenu a été chargé.
      document.querySelector('main').classList.add('hiddenAfter');
      return;
    }
    
    // Stocker la position actuelle de l'utilisateur
    let scrollPos = element.scrollTop;
    setTimeout(() => {
      // Après 150 ms, vérifier que la position actuelle de l'utilisateur est différente de celle stockée
      if (scrollPos != element.scrollTop) {
        // relancer la fonction en attente de la fin du scroll
        addContent(content);
      } else {
        // Ajouter le contenu dans main
        document.querySelector('main').innerHTML += content;

        // ré-établir les événements :
        document.querySelectorAll('.descMore, .endDesc').forEach((e) => { // voir plus (description)
          e.parentNode.removeEventListener('click', moreDesc, false)
          e.parentNode.addEventListener('click', moreDesc, false)
        });
        document.querySelectorAll('#popUpLauncherRm').forEach((e) => { // Supprimer un post
          e.removeEventListener('click', initRemove, false)
          e.addEventListener('click', initRemove, false)
        });
        document.querySelectorAll('#popUpLauncherReport').forEach((e) => { // Signaler un contenu
          e.removeEventListener('click', initReport, false)
          e.addEventListener('click', initReport, false)
        });

        // Redimentionner les nouveaux posts si besoin
        isAbleSizePost();
      }
    }, 150)
  }

  // Ajouter le contenu (si l'utilisateur ne scroll plus)
  function addContent(content) {
    scrollEnd(document.querySelector('main'), content);
  }

  // Ajout de l'événement pour "voir plus" de la description
  document.querySelectorAll('.descMore, .endDesc').forEach((e) => {
    e.parentNode.addEventListener('click', moreDesc, false)
  });

  // Ajout de l'événement pour supprimer un post
  document.querySelectorAll('#popUpLauncherRm').forEach((e) => {
    e.addEventListener('click', initRemove, false)
  });

  // Ajout de l'événement pour signaler un post
  document.querySelectorAll('#popUpLauncherReport').forEach((e) => {
    e.addEventListener('click', initReport, false)
  });

  // Fonction de stylisation de la description, appellée lors du click sur "voir plus"
  function moreDesc() {
    if (
      this.querySelector('.endDesc').style.height == '0px' ||
      this.querySelector('.endDesc').style.height == ''
    ) {
      this.querySelector('.endDesc').style.height =
        this.querySelector('.endDesc span').offsetHeight + 5 + 'px'
      this.querySelector('.dot').style.opacity = 0
    } else {
      this.querySelector('.endDesc').style.height = '0px'
      this.querySelector('.dot').style.opacity = 1
    }
  }

  // Fonction appelée pour supprimer un post
  function initRemove() {
    // console.log('click')

    // Ajout d'une popup de confirmation :
    document.querySelector(
      'main'
    ).innerHTML += `<div class='popUpRm'><p>Voulez-vous vraiment supprimer ce post ?</p><div><a class='btn popUpFirstBtn' id='submitDeletePost' data-id='${this.getAttribute(
      'data-post'
    )}'>Supprimer ce post</a><a class='btn' id='cancelRemove'>Annuler</a></div></div>`

    // Ajout de l'événement de click sur la confirmation 
    document
      .querySelector('#submitDeletePost')
      .addEventListener('click', (j) => {
        j.preventDefault()
        postDeletePost(this.getAttribute('data-post'))
      })

    // Ajout de l'événement de click sur l'anulation de la suppression
    document.querySelector('#cancelRemove').addEventListener('click', (j) => {
      j.preventDefault()
      document.querySelector('.popUpRm').remove()
      
      // ré-attribution des événements
      document.querySelectorAll('#popUpLauncherRm').forEach((e) => {
        e.removeEventListener('click', initRemove, false)
        e.addEventListener('click', initRemove, false)
      })
    })
  }

  // Fonction appelée pour signaler un post
  function initReport() {
    // console.log('click')

    // Ajout d'une popup de confirmation :
    document.querySelector(
      'main'
    ).innerHTML += `<div class='popUpRm'><p>Voulez-vous vraiment signaler ce post ?</p><div><a class='btn popUpFirstBtn' id='submitReportPost' href="mailto:contact@zoey-app.fr?subject=signaler un post&body=je signale le post : zoey-app.fr/?action%3Dfeed%26id%3D${this.getAttribute(
      'data-post'
    )}">Signaler ce post</a><a class='btn' id='cancelReport'>Annuler</a></div></div>`;

    // Ajout de l'événement de click sur l'anulation du report
    document.querySelector('#cancelReport').addEventListener('click', (j) => {
      j.preventDefault()
      document.querySelector('.popUpRm').remove()
      
      // ré-attribution des événements
      document.querySelectorAll('#popUpLauncherReport').forEach((e) => {
        e.removeEventListener('click', initReport, false)
        e.addEventListener('click', initReport, false)
      })
    })
  }

  // Supprimer dans la base de donnée le post souhaité
  function postDeletePost(id) {
    // console.log('postDeletePost')
    // console.log(id)

    $.post(
      'model/postDeletePost.php',
      {
        idpost: id,
      },

      function (ReturnedMessage) {
        // console.log('function Received')
        // console.log(ReturnedMessage)

        // Confirmer ou non la suppression du post 
        if (ReturnedMessage == 'valid') {
          document.querySelector('.popUpRm').remove()
          document
            .querySelector(`svg[data-post='${id}']`)
            .parentElement.parentElement.parentElement.remove()

          document.querySelector('body').innerHTML +=
            "<div class='returnMessage'>Ce post a bien été supprimé !</div>"

          if (document.querySelectorAll('main article').length == 0) {
            document.location.href = 'index.php?action=account'
          }
        } else {
          document.querySelector('.popUpRm').remove()
          document.querySelector('body').innerHTML +=
            "<div class='returnMessage'>Ce post n'a pas pu être supprimé.</div>"
        }
      },
      'text'
    )
  }
})
