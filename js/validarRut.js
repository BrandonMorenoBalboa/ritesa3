//let rut = prompt('Ingrese su rut')

let input = document.getElementById("rut")
if(input) {

    input.addEventListener('blur', rut)
    function rut(e) {
        let valor,
        cuerpo,
        dv,
        suma = 0,
        multiplicacion = 2,
        contadorSimilares = 0,
        contadorErrores = 0,
        rut = e.target.value,
        bt_registrar = document.getElementById("registrar")

        valor = rut.trim().toUpperCase().replace(/[.-]/g, '')
        cuerpo = valor.slice(0, -1).split('').reverse()
        dv = valor.slice(-1)
        if (cuerpo.length < 7) contadorErrores++
        for (let j = 0; j < cuerpo.length; j++) {
            if (cuerpo[0] === cuerpo[j]) contadorSimilares++
        }
        if (cuerpo.length === contadorSimilares) contadorErrores++
        for (let i = 0; i < cuerpo.length; i++) {
            if (multiplicacion === 8) multiplicacion = 2
            suma += cuerpo[i] * multiplicacion
            multiplicacion++
        } 
        let digito = 11 - (suma % 11)
        if (digito === 10) digito = 'K'
        if (digito == 11) digito = 0
        if (dv != digito) contadorErrores++
        if(contadorErrores != 0) {
            bt_registrar.disabled = true
            mensaje = document.createElement('p')
            mensaje.classList.add('text-danger', 'block')
            mensaje.innerHTML = 'Rut incorrecto.'
            input.parentElement.insertAdjacentElement("afterend", mensaje)
        } else {
            bt_registrar.disabled = false
            mensaje.remove()
        }
    }
}