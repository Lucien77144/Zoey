function popUp() {
  document.getElementById('popUpLauncher').onclick = () => {
    document.getElementById('popUpContainer').style.display = 'flex'
    document.getElementById('popUpClose').onclick = () => {
      document.getElementById('popUpContainer').style.display = 'none'
    }
  }
}

window.onload = popUp()
