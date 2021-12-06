
var myVar;

export function myFunction() {
  myVar = setTimeout(showPage, 2000);
  document.getElementById("public-gallery-container").style.display = "none";
}

export function showPage() {
  document.getElementById("preloader").style.display = "none";
  document.getElementById("public-gallery-container").style.display = "block";
  document.body.scrollTop = document.documentElement.scrollTop = 0;
}
