// this page is made to refresh the messages page (with ajax calls)

function hideLoader() {
  document.getElementById('loaderContainer').style.display = 'none'
}

$(document).ready(function () {
  $('main').animate(
    { scrollTop: document.querySelector('main').scrollHeight },
    750
  )

  function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&')
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
      results = regex.exec(url)
    if (!results) return null
    if (!results[2]) return ''
    return decodeURIComponent(results[2].replace(/\+/g, ' '))
  }

  if (document.querySelector('.moreMsg')) {
    document.querySelector('.moreMsg').addEventListener('click', function () {
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

  document.querySelectorAll('.imgChat').forEach((e) => {
    e.removeEventListener('click', updatePopup, false)
    e.addEventListener('click', updatePopup, false)
  })

  lookForNewMessages = setInterval(() => {
    let idConv = null
    idConv = getParameterByName('id')
    if (idConv) {
      $.post(
        'model/getNewMessages.php',
        {
          id: idConv,
        },

        function (ReturnedMessage) {
          console.log('function Received : ' + ReturnedMessage)
          hideLoader()
          if (ReturnedMessage) {
            document.querySelector("#submitAddMessage").style.animation="flySend 0.75s ease-in-out";
            setTimeout(() => {
              document.querySelector("#submitAddMessage").style.animation="";
            }, 750);
            console.log('new messages found !!')
            $('#noMessagesYet').remove()
            $('#chatContainer').append(ReturnedMessage)

            document.querySelectorAll('.imgChat').forEach((e) => {
              e.removeEventListener('click', updatePopup, false)
              e.addEventListener('click', updatePopup, false)
            })

            document
              .querySelector('.currentPicture')
              .setAttribute('src', 'public/images/icons/addPost.svg')
          }
        },
        'text'
      )
    } else {
      console.log('id')
    }
  }, 1000)

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
