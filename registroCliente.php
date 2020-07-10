<!DOCTYPE html>
<html lang="es">
<head>
    <?php include('./view/header.php'); ?>
    <title>Registro</title>
</head>
<body>
    <!-- Nav -->
    <?php include('./view/nav.php'); ?>
    <?php 
        // Detectar boton
        //$pass = 12;
        //echo md5($pass);
        // Validar boton
        if(isset($_POST['btnRegistro'])) {
            // Obtener variables
            $rut = $_POST['rut'];
            $nombre = $_POST['nombre'];
            $apellido = $_POST['apellido'];
            $fono = $_POST['fono'];
            $email = $_POST['email'];
            $region = $_POST['region'];
            $comuna = $_POST['comuna'];
            $direccion = $_POST['direccion'];
            $clave = md5($_POST['clave']);
            // Imprimir variables
            echo "<br>";
            echo $rut;
            echo "<br>";
            echo $nombre;
            echo "<br>";
            echo $apellido;
            echo "<br>";
            echo $fono;
            echo "<br>";
            echo $email;
            echo "<br>";
            echo $region;
            echo "<br>";
            echo $comuna;
            echo "<br>";
            echo $direccion;
            echo "<br>";
            echo $clave;
            // Validar campos 
            if($rut === "" || $nombre == "" || $apellido === "" || $fono === "" || $email === "" || $region === "" || $direccion === "" || $clave === "") {
                echo "<script>alert('Todos los campos son obligatorios')</script>";
            } else {
                // Conexion 
                include('conexion/conexion.php');
                $conn = new mysqli($servername, $username, $password, $dbname);
                if ($conn->connect_error) {
                        die("Connection failed: " . $conn->connect_error);
                } else {
                    $sql = "INSERT INTO cliente (nombre, apellido, rut, fono, email, clave, region, comuna, direccion, estado)
                    VALUES ('" . $nombre . "','" . $apellido . "','" . $rut . "'," . $fono . ",'" . $email . "','" . $clave . "','" . $region . "','" . $comuna . "','" . $direccion . "',1)";
                    $result = $conn->query($sql);
                    echo $sql;
                    if($result) {
                        echo "<script>alert('Usuario creado')</script>";
                    } else {
                        echo "<script>alert('Ocurrio un problema, intentelo nuevamente mas tarde')</script>";
                    }
                    
                    $conn->close();
                }
            }




        }


    ?>
    <div class="container">
        <div class="row">
            <form class="border p-5 rounded shadow-sm mx-auto mt-5 mb-5" method="post" action="registroCliente.php"> 
                <h1>Registro</h1>
                <div class="form-group">
                    <label for="nombre">RUT</label>
                    <input type="text" name="rut" class="form-control" id="rut" placeholder="11111111-1" required>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombres</label>
                    <input type="text" name="nombre" class="form-control" placeholder="Carlos" required>
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido</label>
                    <input type="text" name="apellido" class="form-control" placeholder="Perez" required>
                </div>
                <div class="form-group">
                    <label for="fono">Fono</label>
                    <input type="text" name="fono" class="form-control" placeholder="999 888 777" required>
                </div>
                <div class="form-group">
                    <label for="email">Correo Electronico</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="carlos.perez@mail.com">
                </div>                
                <div class="form-group">
                    <label for="region">Region</label>
                    <select class="form-control" id="regiones" name="region" required>
                        <option value="" disabled="disabled">Seleccione</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="region">Comuna</label>
                    <select class="form-control" id="comunas" name="comuna" required>
                        <option value="" disabled="disabled">Seleccione</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="direccion">Direccion</label>
                    <input type="text" name="direccion" class="form-control" placeholder="" required>
                </div>

                <div class="form-group">
                    <label for="clave">Contraseña</label>
                    <div class="input-group">
                        <input type="password" name="clave" class="form-control ocultar" id="clave" required>
                        <div class="input-group-append">
                            <button id="btnMostrar" class="btn btn-outline-secondary" type="button">Mostrar</button>
                        </div>
                    </div>
                </div>
                <input type="submit" name="btnRegistro" id="registrar" class="btn btn-primary" value="Registrarse">
                <a href="./index.php" id="btnVolver" class="btn btn-danger">Volver</a>
            </form>
        </div>
    </div>

    <?php include('./view/footer.php'); ?>
</body>
</html>