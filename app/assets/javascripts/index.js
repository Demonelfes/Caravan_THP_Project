var logos = document.getElementsByClassName("logo-card");
var texts = [
  "C'est super Flexible",
  "C'est super Fiable",
  "C'est super Fun",
  "C'est super Fonctionnel",
  "Et c'est fait en France !"
];

var words = [
  "Flexible",
  "Fiable",
  "Fun",
  "Fonctionnel",
  "Français"
];

function replaceWithText() {
  var index = Array.prototype.indexOf.call(logos, this);

  if (index >= 0 && index < texts.length) {
    this.querySelector(".logo-image").style.display = "none";
    this.querySelector(".logo-text").textContent = texts[index];
  }
}

function restoreLogo() {
  var index = Array.prototype.indexOf.call(logos, this);

  if (index >= 0 && index < words.length) {
    this.querySelector(".logo-image").style.display = "block";
    this.querySelector(".logo-text").textContent = words[index];
  }
}

for (var i = 0; i < logos.length; i++) {
  logos[i].addEventListener('mouseover', replaceWithText);
  logos[i].addEventListener('mouseout', restoreLogo);
}
