document.getElementById('getStarted').addEventListener('click', function() {
    // Make an HTTP request to the /getStarted endpoint
    fetch('/login')
      .then(response => response.text())
      .then(data => {
        // Handle the response as needed
        document.body.innerHTML = data; // Replace the entire body content with the response
      })
  });
  