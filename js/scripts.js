// Borrar mensaje de alerta
const alert = document.querySelector('.alert');

if(alert) {
    setTimeout(() => {
        alert.remove()
    }, 3000);
}

// Mostrar o ocultar contraseña
const inputClave = document.getElementById('clave');
const btnMostrar = document.getElementById('btnMostrar')

if(btnMostrar){
    btnMostrar.addEventListener('click', mostrarOcultarClave);
    function mostrarOcultarClave() {
        let tipoInput = inputClave.getAttribute('type');
        if(tipoInput === 'password') {
            inputClave.setAttribute('type', 'text');
        } else {
            inputClave.setAttribute('type', 'password');       
        }
    }
    
}
const container = document.getElementById('container')
const carrito = document.getElementById('carrito-compras')

// Tabla carrito productos
const tabla = document.getElementById('carrito-productos')

function cargarEventListener() {
    // Verificamos que exista container 
    if(container){
        // Ejecutamos funcion click
        container.addEventListener('click', modificarCantidades)
        // Ejecutamos funcion agregar carrito
        container.addEventListener('click', ValidacionesAntesDeAgregar)
    }
    if(carrito){
        carrito.addEventListener('click', eliminaProductoCarrito)
        document.addEventListener('DOMContentLoaded', cargarProductosLocalStorage)
    }
    if(tabla) {
        tabla.addEventListener('click', eliminaProductoCarrito)
        tabla.addEventListener('click', obtenerInformacionTabla)
    }
}
cargarEventListener()

// Determinamos el boton presionado
function modificarCantidades(e) {
    if(e.target.classList.contains('btn-cantidad')){
        // Unidades por bolsa o paquete
        let factor = e.target.parentElement.parentElement.firstElementChild.value
        // Cantidad de unidades llevadas
        let cantidad = e.target.parentElement.parentElement.firstElementChild.nextElementSibling.nextElementSibling
        if(e.target.classList.contains('aumentar')) {
            aumentarCantidad(cantidad, factor)
        } else if(e.target.classList.contains('disminuir')) {
            disminuirCantidad(cantidad, factor)
        }
    }
}
// Aumentamos la cantidad
function aumentarCantidad(cantidad, factor) {
    let resultado = parseInt(cantidad.value) + parseInt(factor) 
    cantidad.value = resultado
}
// Disminuimos la cantidad
function disminuirCantidad(cantidad, factor) {
    let resultado = parseInt(cantidad.value) - parseInt(factor) 
    if(resultado >= 0) {
        cantidad.value = resultado
    }
}

// Validaciones antes de agregar el producto
function ValidacionesAntesDeAgregar(e) {
    // Verificamos que la cantidad del producto no sea 0
    if(e.target.classList.contains('agregar-carrito')) {
        e.preventDefault()
        // Mensaje de alerta para producto con cantidad 0
        // Cantidad minima a agregar
        let cantidadMinima = e.target.previousElementSibling.lastElementChild.lastElementChild.firstElementChild.value
        // Cantidad agregada
        let cantidadAgregada = e.target.previousElementSibling.lastElementChild.lastElementChild.lastElementChild.previousElementSibling
        if(cantidadAgregada.value <= 0) {
            mensajeAlerta(`No es posible agregar un producto con cantidad 0, por favor vuelva a intentarlo.`)
            $('#mensaje').modal('show')
        } else {
            obtenerInformacion(e)
            // Reiniciamos el valor de la tajeta
            cantidadAgregada.value = 0
        }

    }
}

// Obtener informacion del producto
function obtenerInformacion(e) {
    // Cada dato almacenado en una variable
    const infoProducto = {
        id: e.target.parentElement.firstElementChild.nextElementSibling.getAttribute('data-id'),
        imagen: e.target.parentElement.parentElement.firstElementChild.getAttribute('src'),
        nombre: e.target.parentElement.firstElementChild.textContent,
        precio: parseInt(e.target.parentElement.firstElementChild.nextElementSibling.nextElementSibling.lastElementChild.textContent),
        cantidad: parseInt(e.target.previousElementSibling.lastElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.value),
        factor: e.target.previousElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.value
    }
    // Agregar productos almacenados en local storage
    agregarProductosAlCarrito(infoProducto)

}
// Agregar productos al carrito
function agregarProductosAlCarrito(producto) {
    // Guardamos producto en LocalStorage
    guardarProductosLocalStorage(producto)
    // Obtenemos la tabla con los datos del carrito
    let datosAnteriores = Array.from( document.querySelectorAll('#carrito-compras tr'))
    // Borramos todas las filas de la tabla existen
    if(datosAnteriores) {
        datosAnteriores.forEach((el) => {
            el.remove()
        })
    }
    // Obtenemos todos los datos de los productos, incluyendo el ultimo producto agregado (LINE: 119)
    let productosLS = obtenerProductosLocalStorage()
    // Crear estructura de la tabla
    const carrito = document.createElement('tbody')
    let td = ''
    td += `
    <thead>
        <tr>
            <th>Imagen</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Cantidad</th>
            <th>Total</th>
        </tr>
    </thead>
    `
    // Recorrer el objeto y crear las filas con los datos
    productosLS.forEach(producto => {
        td += `
        <tr>
            <td>
                <img src="${producto.imagen}" width="15">
            </td>
            <td style="font-size: 10px">
                ${producto.nombre}
            </td>

            <td style="font-size: 10px">
                ${producto.precio}
            </td>
            <td>
                ${producto.cantidad}
            </td style="font-size: 10px">
            
            <td style="font-size: 10px">
                ${producto.precio * producto.cantidad}
            </td>
            <td>
                <a href="#" class="borrar-producto" data-id="${producto.id}">X</a>
            </td>
        </tr>
        
        `
    })
    carrito.innerHTML = td
    // Agregar plantilla al html
    document.getElementById('carrito-compras').appendChild(carrito)

}

// Guardamos los productos en LocalStorage
function guardarProductosLocalStorage(producto) {
    let productos,
    productoExistente = false 
    productos = obtenerProductosLocalStorage()
    // Verificar si se esta agregando el mismo producto
    productos.forEach((el) => {
        if(el.id === producto.id) {
            el.cantidad = parseInt(el.cantidad) + parseInt(producto.cantidad)
            productoExistente = true
        } 
    })
    // Si el producto no existe en el carrito
    if (productoExistente === false) {
        productos.push(producto)
    }
    localStorage.setItem('productos', JSON.stringify(productos))
}
// Obtenemos productos del local storage
function obtenerProductosLocalStorage() {
    // Variable que almacenara los productos existentes en local storage
    let productos 
    if(localStorage.getItem('productos') === null) {
        productos = []
    } else {
        productos = JSON.parse(localStorage.getItem('productos'))
    }
    return productos
}

// Cargamos productos localStorage 
function cargarProductosLocalStorage() {
    let productosLocalStorage 

    productosLocalStorage = obtenerProductosLocalStorage()
    productosLocalStorage.forEach(producto => {
        const carrito = document.createElement('tr')
        carrito.innerHTML = `
        <td>
            <img src="${producto.imagen}" width="15">
        </td>
        <td style="font-size: 10px">
            ${producto.nombre}
        </td>
        <td style="font-size: 10px">
            ${producto.precio}
        </td>
        <td style="font-size: 10px">
            ${producto.cantidad}
        </td>
        <td style="font-size: 10px">
            ${producto.cantidad * producto.precio}
        </td>       
        <td>
            <a href="#" class="borrar-producto" data-id="${producto.id}">X</a>
        </td>
        `
        // Agregar boton para quitar los productos
        document.getElementById('carrito-compras').appendChild(carrito)
    })
}

// Borrar producto
function eliminaProductoCarrito(e) {
    e.preventDefault()
    let producto
    let productoId
    if(e.target.classList.contains('borrar-producto')) {
        // Obtenemos la fila a eliminar del DOM
        producto = e.target.parentElement.parentElement
        // Obtenemos id del producto a eliminar del LocalStorage
        productoId = e.target.getAttribute('data-id')
        eliminarProductoLocalStorage(productoId)
        producto.remove()
        // Cargamos la tabla si los productos existen
        if (tablaProductos) {
            cargarProductos()
        }
    }
}

// Eliminar producto local storage 
function eliminarProductoLocalStorage(productoId) {
    let productos
    // Obtenemos informacion de la base de datos 
    productos = obtenerProductosLocalStorage()
    // Recorremos el arreglo hasta encontrar una coincidencia
    productos.forEach(function(producto, index) {
        if(producto.id === productoId) {
            productos.splice(index, 1)
        }
    })
    // Escribimos el valor de localStorage
    localStorage.setItem('productos', JSON.stringify(productos))
}

// Mensajes de alerta 
function mensajeAlerta(mensaje) {
    let plantilla = ''
    // Crear plantilla
    plantilla += `
    <div class="modal fade" id="mensaje" tabindex="-1" role="dialog" aria-labelledby="mensajeModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="mensajeModal">Alerta</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ${mensaje}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    `
    document.querySelector('.alertas').innerHTML = plantilla
}

// Obtener contenedor del producto
const tablaProductos = document.getElementById('carrito-productos')
// Verificamos que el elemento exista
if(tablaProductos) {
    document.addEventListener("DOMContentLoaded", cargarProductos )
}

// Cargar tabla de productos en Carrito.php
function cargarProductos() {
    // Reiniciamos la tabla
    tablaProductos.innerHTML = ''
    let carrito, 
    plantilla, 
    iva = 0,
    suma = 0, 
    total = 0

    carrito = obtenerProductosLocalStorage()
    let tabla = document.createElement('table')
    tabla.classList.add('table', 'table-bordered', 'mt-5', 'mb-5')
    plantilla = `
        <tr>
            <th>Imagen</th>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Cantidad</th>
            <th>Total</th>
            <th>Quitar</th>
        </tr>`
    carrito.forEach(producto => {
        plantilla += `<tr>
           <td><img src="${producto.imagen}" width="50px"></td>
            <td>${producto.id}</td>
            <td>${producto.nombre}</td>
            <td><span class="precio-producto">${producto.precio}</span></td>
            <td>
                <input type="hidden" class="factor-producto" data-id="${producto.factor}" value="${producto.factor}">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <button id="" class="btn btn-cantidad btn-outline-warning disminuir" type="button">-</button>
                    </div>
                    <input type="number" disabled="true" name="cantidad" class="form-control cantidad text-right" id="cantidad" value="${producto.cantidad}" min="0">
                    <div class="input-group-append">
                        <button id="" class="btn btn-cantidad btn-outline-primary aumentar" type="button">+</button>
                    </div>
                </div>
            <td><span class="total-producto">${producto.precio * producto.cantidad}</span></td>
            <td><a class="btn btn-danger borrar-producto" data-id="${producto.id}">X</a></td>
        </tr>`
        suma = suma + (producto.precio * producto.cantidad)
    })
    // Calcular total con IVA
    total = suma * 1.19
    // IVA
    iva = total - suma
    plantilla += `<tr><td colspan="5">IVA</td><td>${Math.ceil(iva)}</td><td></td></tr>`
    plantilla += `<tr><td colspan="5">Total</td><td>${Math.ceil(total)}</td><td></td></tr>`
    tabla.innerHTML = plantilla
    tablaProductos.appendChild(tabla)
    let inputCarrito = document.getElementById('carrito-php').value = JSON.stringify( carrito )

}

/**
 * Funcion para modificar cantidades de los productos
 * 
 */

function obtenerInformacionTabla(e) {
    if(e.target.classList.contains('btn-cantidad')) {
        let id = e.target.parentElement.parentElement.parentElement.parentElement.firstElementChild.nextElementSibling.textContent
        let factor = e.target.parentElement.parentElement.parentElement.firstElementChild.getAttribute('data-id')
        let cantidad = e.target.parentElement.parentElement.firstElementChild.nextElementSibling
        let total = e.target.parentElement.parentElement.parentElement.nextElementSibling.firstElementChild
        let precio = e.target.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild
        let totalPago = e.target.parentElement.parentElement.parentElement.parentElement.parentElement.lastElementChild.firstElementChild.nextElementSibling
        let pago = 0
        let iva = e.target.parentElement.parentElement.parentElement.parentElement.parentElement.lastElementChild.previousElementSibling.firstElementChild.nextElementSibling
        if(e.target.classList.contains('aumentar')) {
            aumentarCantidad(cantidad, factor)
            total.textContent = total.textContent = parseInt(cantidad.value) * parseInt(precio.textContent)
        } else if(e.target.classList.contains('disminuir')) {
            disminuirCantidad(cantidad, factor)
            total.textContent = parseInt(cantidad.value) * parseInt(precio.textContent)
        }
        /**
         * Actualizar LocalStorage
         */
        productos = obtenerProductosLocalStorage()
        productos.forEach((el) => {
            if(el.id === id) {
                el.cantidad = cantidad.value
            }
            pago = parseInt(pago) + (parseInt(el.precio) * parseInt(el.cantidad))
        })
        // Calcular pago
        totalPago.textContent = Math.ceil( pago * 1.19 ) 
        // Calcular iva
        iva.textContent = Math.ceil( totalPago.textContent - pago )
        localStorage.setItem('productos', JSON.stringify(productos))
        document.getElementById('carrito-php').value = JSON.stringify( productos )
    }
}

