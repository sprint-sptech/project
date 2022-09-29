window.addEventListener("scroll", function(){
    var header = document.querySelector("header");
    header.classList.toggle("sticky", window.scrollY > 0);
});

function entrar(){
    window.location="../view/pages/public/login/login.html"

  }