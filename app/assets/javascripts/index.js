var logoCards = document.querySelectorAll(".logo-card");
var logoImages = document.querySelectorAll(".logo-image");
var logoTexts = document.querySelectorAll(".logo-text");
var hoverTexts = document.querySelectorAll(".hover-text");

function replaceLogoWithText(index) {
  logoImages[index].style.display = "none";
  logoTexts[index].style.display = "none";
  hoverTexts[index].style.display = "block";
}

function restoreLogo(index) {
  logoImages[index].style.display = "block";
  logoTexts[index].style.display = "block";
  hoverTexts[index].style.display = "none";
}

for (let index = 0; index < logoCards.length; index++) {
  logoCards[index].addEventListener("mouseover", function() {
    replaceLogoWithText(index);
  });

  logoCards[index].addEventListener("mouseout", function() {
    restoreLogo(index);
  });
}


