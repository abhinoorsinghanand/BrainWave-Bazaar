  // DOMContentLoaded event listener
  document.addEventListener("DOMContentLoaded", function () {
    // Get the user's name from wherever you store it (e.g., from a login form)
    var userName = "Abhinoor";

    // Update the content of the span element with the user's name
    document.getElementById("user-name").innerText = userName;
});