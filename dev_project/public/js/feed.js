document.addEventListener('DOMContentLoaded', function () {
  // document.querySelectorAll(".blockIllus").forEach(e => {
  //     let format = e.naturalWidth/e.naturalHeight;
  //     if(format>1){
  //         e.style.objectFit="contain";
  //     }else{
  //         e.style.objectFit="cover";
  //     }
  // });

  let numPosts = 1;
  let postToPass = 5;
  document.querySelector('main').addEventListener('scroll', function () {
    if (this.scrollTop > window.innerHeight * (numPosts * postToPass)) {
      numPosts++
      $.post(
        'model/loadFeed.php',
        {
          posts: numPosts,
        },

        function (ReturnedMessage) {
          addContent(ReturnedMessage);
        },
        'text'
      )
    }
  })

  function scrollEnd(element, content) {
    let scrollPos = element.scrollTop
    setTimeout(() => {
      if (scrollPos != element.scrollTop) {
        addContent(content)
      } else {
        document.querySelector('main').innerHTML += content;

        document.querySelectorAll('.descMore, .endDesc').forEach((e) => {
          e.parentNode.removeEventListener('click', moreDesc, false)
          e.parentNode.addEventListener('click', moreDesc, false)
        });

        document.querySelectorAll('#popUpLauncherRm').forEach((e) => {
          e.removeEventListener('click', initRemove, false)
          e.addEventListener('click', initRemove, false)
        });

        document.querySelectorAll('#popUpLauncherReport').forEach((e) => {
          e.removeEventListener('click', initReport, false)
          e.addEventListener('click', initReport, false)
        });

        if(content.includes("ended") || document.querySelector("article[data-end]") != null){
          document.querySelector('main').classList.add('hiddenAfter');
        }
      }
    }, 150)
  }

  function addContent(content) {
    scrollEnd(document.querySelector('main'), content)
  }

  document.querySelectorAll('.descMore, .endDesc').forEach((e) => {
    e.parentNode.addEventListener('click', moreDesc, false)
  })

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

  document.querySelectorAll('#popUpLauncherRm').forEach((e) => {
    e.addEventListener('click', initRemove, false)
  })
  document.querySelectorAll('#popUpLauncherReport').forEach((e) => {
    e.addEventListener('click', initReport, false)
  })

  function initRemove() {
    console.log('click')
    document.querySelector(
      'main'
    ).innerHTML += `<div class='popUpRm'><p>Voulez-vous vraiment supprimer ce post ?</p><div><a class='btn popUpFirstBtn' id='submitDeletePost' data-id='${this.getAttribute(
      'data-post'
    )}'>Supprimer ce post</a><a class='btn' id='cancelRemove'>Annuler</a></div></div>`

    document
      .querySelector('#submitDeletePost')
      .addEventListener('click', (j) => {
        j.preventDefault()
        postDeletePost(this.getAttribute('data-post'))
      })

    document.querySelector('#cancelRemove').addEventListener('click', (j) => {
      j.preventDefault()
      document.querySelector('.popUpRm').remove()

      document.querySelectorAll('#popUpLauncherRm').forEach((e) => {
        e.removeEventListener('click', initRemove, false)
        e.addEventListener('click', initRemove, false)
      })
    })
  }

  function initReport() {
    console.log('click')
    document.querySelector(
      'main'
    ).innerHTML += `<div class='popUpRm'><p>Voulez-vous vraiment signaler ce post ?</p><div><a class='btn popUpFirstBtn' id='submitReportPost' href="mailto:contact@zoey-app.fr?subject=signaler un post&body=je signale le post : zoey-app.fr/?action%3Dfeed%26id%3D${this.getAttribute(
      'data-post'
    )}">Signaler ce post</a><a class='btn' id='cancelReport'>Annuler</a></div></div>`

    // document
    //   .querySelector('#submitDeletePost')
    //   .addEventListener('click', (j) => {
    //     j.preventDefault()
    //     postDeletePost(this.getAttribute('data-post'))
    //   })

    document.querySelector('#cancelReport').addEventListener('click', (j) => {
      j.preventDefault()
      document.querySelector('.popUpRm').remove()

      document.querySelectorAll('#popUpLauncherReport').forEach((e) => {
        e.removeEventListener('click', initReport, false)
        e.addEventListener('click', initReport, false)
      })
    })
  }

  function postDeletePost(id) {
    console.log('postDeletePost')
    console.log(id)

    $.post(
      'model/postDeletePost.php',
      {
        idpost: id,
      },

      function (ReturnedMessage) {
        console.log('function Received')
        console.log(ReturnedMessage)

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
