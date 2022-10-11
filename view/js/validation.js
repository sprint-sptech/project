function mostrar_requisitos() {
    requisitos.style.display = 'flex'
    requisitos.style.flexDirection = 'column'

}

function ocultar_requisitos() {
    div_requisitos.style.display = 'none'
}

function requisitos_senha() {
    var senha = input_senha.value;
    if (senha.length >= 8) {
        min_char.style.color = 'green'
        min_char.style.fontWeight = 'bold'
    } else {
        min_char.style.color = 'gray'
        min_char.style.fontWeight = '400'
    }
}