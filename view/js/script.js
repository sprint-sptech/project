window.addEventListener("scroll", function(){
    var header = document.querySelector("header");
    header.classList.toggle("sticky", window.scrollY > 0);
});

function login(){
    window.location="./view/pages/public/login/login.html"

  }
function criar_conta(){
    window.location="../register/company/register.company.html"
}
function voltar_login(){
    window.location="../../login/login.html"
}
function cadastrar_empresa(){
    window.location="../user/register.user.html"
}
function cadastrar_usuario(){
    window.location="../../login/login.html"
}
function entrar(){
    window.location="../../private/dashboard/dashboard.html"
}
function sair(){
    window.location="../../../../index.html"
}