/* Only register a service worker if it's supported */
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('service-worker.js')
}

// Initialize deferredPrompt for use later to show browser install prompt.
let deferredPrompt

window.addEventListener('beforeinstallprompt', (e) => {
  // Stash the event so it can be triggered later.
  deferredPrompt = e
  if (getCookie('pwa') != 'd') {
    // Prevent the mini-infobar from appearing on mobile
    e.preventDefault()
    // Update UI notify the user they can install the PWA
    showInstallPromotion()
    // Optionally, send analytics event that PWA install promo was shown.
    console.log(`'beforeinstallprompt' event was fired.`)
  } else {
    console.log('user already refused to install PWA')
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
        // Optionally, send analytics event with outcome of user choice
        console.log(`User response to the install prompt: ${outcome}`)
        // We've used the prompt, and can't use it again, throw it away
        deferredPrompt = null
      })
  }
})

function showInstallPromotion() {
  // show modal
  document.getElementById('promptPWA').style.display = 'flex'
  document.getElementById('promptPWAclose').onclick = () => {
    document.getElementById('promptPWA').style.display = 'none'
    saveUserChoice()
  }

  document
    .getElementById('promptPWAinstall')
    .addEventListener('click', async () => {
      // Hide the app provided install promotion
      document.getElementById('promptPWA').style.display = 'none' // hide modal
      // Show the install prompt
      deferredPrompt.prompt()
      // Wait for the user to respond to the prompt
      const { outcome } = await deferredPrompt.userChoice
      if (outcome == 'dismissed') {
        saveUserChoice()
      }
      // Optionally, send analytics event with outcome of user choice
      console.log(`User response to the install prompt: ${outcome}`)
      // We've used the prompt, and can't use it again, throw it away
      deferredPrompt = null
    })
}

function saveUserChoice() {
  const d = new Date()
  d.setTime(d.getTime() + 4 * 24 * 60 * 60 * 1000) // expires in 4 days
  let expires = d.toUTCString()
  document.cookie = `pwa=d; expires=${expires}; path=/`
}

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
