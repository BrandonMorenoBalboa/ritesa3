<!DOCTYPE html>
<html lang="es">
<head>
    <?php include('./view/header.php'); ?>
    <title>Iniciar Sesion</title>
</head>
<body>
    <!-- Nav -->
    <?php include('./view/nav.php'); ?>
    <?php 
        // Detectar boton







    ?>
    <div class="container">
        <div class="row">
            <form class="border p-5 rounded shadow-sm mx-auto mt-5 mb-5" method="post" action="loginCliente.php"> 
                <h1>Registro</h1>
                <div class="form-group">
                    <label for="nombre">RUT</label>
                    <input type="text" name="rut" class="form-control" id="rut" placeholder="Perez">
                </div>
                <div class="form-group">
                    <label for="nombre">Nombres</label>
                    <input type="text" name="nombre" class="form-control" placeholder="Carlos">
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido</label>
                    <input type="text" name="apellido" class="form-control" placeholder="Perez">
                </div>
                <div class="form-group">
                    <label for="fono">Fono</label>
                    <input type="text" name="fono" class="form-control" placeholder="Perez">
                </div>
                <div class="form-group">
                    <label for="email">Correo Electronico</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="carlos.perez@mail.com">
                </div>                
                <div class="form-group">
                    <label for="region">Region</label>
                    <select class="form-control" id="region" name="region">
                        <option value="" disabled="disabled">Seleccione</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="region">Comuna</label>
                    <select class="form-control" id="comuna" name="comuna">
                        <option value="" disabled="disabled">Seleccione</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="clave">Contraseña</label>
                    <div class="input-group">
                        <input type="password" name="clave" class="form-control ocultar" id="clave" >
                        <div class="input-group-append">
                            <button id="btnMostrar" class="btn btn-outline-secondary" type="button">Mostrar</button>
                        </div>
                    </div>
                </div>
                <input type="submit" name="btnRegistro" class="btn btn-primary" value="Registrarse">
                <a href="./index.php" id="btnVolver" class="btn btn-danger">Volver</a>
            </form>
        </div>
    </div>

    <?php include('./view/footer.php'); ?>
</body>
</html>