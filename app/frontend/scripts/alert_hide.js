const hideAlert = () => {
  setInterval(() => {
    const flashAlert = document.querySelector('.alert')

    if (flashAlert) {
      flashAlert.addEventListener('transitionend', () => flashAlert.remove())

      flashAlert.style.transition = '0.8s'
      flashAlert.style.opacity = 0
    }
  }, 8000)
}

document.addEventListener('DOMContentLoaded', hideAlert)
