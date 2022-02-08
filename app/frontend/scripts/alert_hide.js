function hideNotice() {
  setInterval(function() {
    document.querySelector('.alert').style.display = "none";
  }, 5000);
}

hideNotice();
