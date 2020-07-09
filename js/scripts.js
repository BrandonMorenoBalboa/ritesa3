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
    //console.log(infoProducto.factor)
    agregarProductosAlCarrito(infoProducto)

}
// Agregar productos al carrito
function agregarProductosAlCarrito(producto) {
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
    <td>
        ${producto.cantidad}
    </td style="font-size: 10px">
    
    <td style="font-size: 10px">
        ${producto.precio * producto.cantidad}
    </td>
    <td>
        <a href="#" class="borrar-producto" data-id="${producto.id}">X</a>
    </td>

    `
    // Agregar boton para quitar los productos
    document.getElementById('carrito-compras').appendChild(carrito)
    // Llamamos funcion para guardar productos
    guardarProductosLocalStorage(producto)
}

// Guardamos los productos en LocalStorage
function guardarProductosLocalStorage(producto) {
    let productos 
    productos = obtenerProductosLocalStorage()
    /**
     * Verificar si se esta agregando el mismo producto
     */

    productos.forEach((el) => {
        if(el.id === producto.id) {
            console.log('Agrego el mismo producto')
            // Determinar reemplazar el valor existente
            
        }
    })

    productos.push(producto)
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
    console.log('tabla productos existe')
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
            <td>${producto.precio}</td>
            <td>
                <input type="text" value="${producto.factor}">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <button id="" class="btn btn-cantidad btn-outline-warning disminuir" type="button">-</button>
                    </div>
                    <input type="number" disabled="true" name="cantidad" class="form-control cantidad text-right" id="cantidad" value="${producto.cantidad}" min="0">
                    <div class="input-group-append">
                        <button id="" class="btn btn-cantidad btn-outline-primary aumentar" type="button">+</button>
                    </div>
                </div>
            <td>${producto.precio * producto.cantidad}</td>
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

