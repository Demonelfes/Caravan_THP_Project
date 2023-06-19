document.addEventListener("DOMContentLoaded", function() {
  var checkButton = document.querySelector(".check-btn input[type='submit']");

  function checkAvailability() {
    console.log("Hello");
  }

  if (checkButton) {
    checkButton.addEventListener("submit", checkAvailability);
  }
});
