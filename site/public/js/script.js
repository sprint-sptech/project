window.addEventListener("scroll", function(){
    var header = document.querySelector("header");
    header.classList.toggle("sticky", window.scrollY > 0);
});

// CAMINHOS (LINK) BOTÕES

function login(){
    window.location="./login.html"
  }
function criar_conta(){
    window.location="./register.company.html"
}
function landing(){
    window.location="./index.html"
}
function voltar_login(){
    window.location="./login.html"
}
function cadastrar_empresa(){
    window.location="./register.user.html"
}
function entrar(){
    window.location="./dashboard/dashboard.html"
}
function sair(){
    window.location="../index.html"
}
function cards(){
    window.location="./dashboard.html"
}
function graficos(){
    window.location="./graficos.html"
}
function contatrarServico(){
    window.location="https://contate.me/glacies"
    
}

