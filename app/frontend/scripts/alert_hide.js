function hideNotice() {
  setInterval(function() {
    document.getElementById('alert').style.display = "none";
  }, 5000);
}

hideNotice();
