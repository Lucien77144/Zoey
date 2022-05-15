// the main script is used for the progressive web app : register a service worker, show the "install the app" button...

/* Only register a service worker if it's supported */
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('service-worker.js')
}

// Initialize deferredPrompt for use later to show browser install prompt.
let deferredPrompt

// when the navigator is ready to install the PWA
window.addEventListener('beforeinstallprompt', (e) => {
  function popUp() {
    function getCookie(cname) {
      let name = cname + '='
      let ca = document.cookie.split(';')
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

    let pwa = getCookie('pwa')
    const now = new Date()

    // the 'pwa' cookie helps us know if the user has previously refused to install the app or if it is shown for the first time. For the first time, wait before showing the pop up again
    if (!pwa && pwa != 'd' && !Date.parse(pwa)) {
      const dw = new Date()
      dw.setTime(dw.getTime())
      let time = dw.toUTCString()
      dw.setTime(dw.getTime() + 1000 * 1000) // expires in 1000 milliseconds
      let expires = dw.toUTCString()
      document.cookie = `pwa=${time}; expires=${expires}; path=/`
    } else {
      function showInstallPromotion(e) {
        // Prevent the mini-infobar from appearing on mobile
        e.preventDefault()

        // show modal
        document.getElementById('promptPWA').style.display = 'flex'
        document.getElementById('promptPWAclose').onclick = () => {
          document.getElementById('promptPWA').style.display = 'none'
          saveUserChoice()
        }

        document
          .getElementById('promptPWAinstall')
          .addEventListener('click', async (e) => {
            e.preventDefault()
            // Hide the app provided install promotion
            document.getElementById('promptPWA').style.display = 'none' // hide modal
            // Show the install prompt
            deferredPrompt.prompt()
            // Wait for the user to respond to the prompt
            const { outcome } = await deferredPrompt.userChoice
            if (outcome == 'dismissed') {
              saveUserChoice()
            }
            deferredPrompt = null
          })
      }

      function saveUserChoice() {
        const d = new Date()
        d.setTime(d.getTime() + 4 * 24 * 60 * 60 * 1000) // expires in 4 days
        let expires = d.toUTCString()
        document.cookie = `pwa=d; expires=${expires}; path=/`
      }

      // Stash the event so it can be triggered later.
      deferredPrompt = e
      pwa = getCookie('pwa')

      if (pwa != 'd' && Date.parse(now) >= Date.parse(pwa) + 15 * 60) {
        // Update UI notify the user they can install the PWA
        showInstallPromotion(e)
        // Optionally, send analytics event that PWA install promo was shown.
      } else if (pwa != 'd' && Date.parse(now) && Date.parse(pwa)) {
        const remaining = Date.parse(pwa) + 15 * 1000 - Date.parse(now)
        setTimeout(() => {
          showInstallPromotion(e)
        }, remaining)
      }
      if (document.getElementById('installPWAbtn')) {
        document
          .getElementById('installPWAbtn')
          .addEventListener('click', async (e) => {
            e.preventDefault()
            // Show the install prompt
            deferredPrompt.prompt()
            // Wait for the user to respond to the prompt
            const { outcome } = await deferredPrompt.userChoice
            if (outcome == 'dismissed') {
              saveUserChoice()
            }
            deferredPrompt = null
          })
      }
    }
  }

  window.onload = popUp()
})
