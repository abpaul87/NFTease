
var myVar;

export function myFunction() {
  myVar = setTimeout(showPage, 2000);
}

export function showPage() {
  document.getElementById("preloader").style.display = "none";
  document.getElementById("public-gallery-container").style.display = "block";
}
