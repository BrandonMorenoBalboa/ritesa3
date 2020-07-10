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
        if(isset($_POST['btnIngresar'])) {
            // Validar campos formulario
            if($_POST['email'] != "" && $_POST['clave'] != "") {
                $email = $conn->real_escape_string($_POST['email']);
                $clave = md5($conn->real_escape_string($_POST['clave']));
                // Conexion a la base de datos
                include('./conexion/conexion.php');
                $conn = new mysqli($servername, $username, $password, $dbname);
                // Verificamos la conexion
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                } 
                else
                {

                    $sql = "SELECT id, nombre, apellido, rut, fono, email, clave, region, comuna, direccion
                    FROM cliente
                    WHERE (email = '" . $email . "') AND (clave = '" . $clave . "') AND (estado = 1)";
                    echo $sql;
                    $result = $conn->query($sql);
                    $row = $result->fetch_assoc();
                    if($row > 0) {
                        // Crear variables de sesion
                        $_SESSION['id'] =  $row['id'];
                        $_SESSION['nombre'] = $row['nombre'];
                        $_SESSION['apellido'] = $row['apellido'];
                        $_SESSION['rut'] = $row['rut'];
                        $_SESSION['fono'] = $row['fono'];
                        $_SESSION['email'] = $row['email'];
                        $_SESSION['clave'] = $row['clave'];
                        $_SESSION['region'] = $row['region'];
                        $_SESSION['comuna'] = $row['comuna'];
                        $_SESSION['direccion'] = $row['direccion'];
                        
                        echo "<script>window.location.href = 'index.php'</script>";
                    } else {
                        echo mostrarAlerta('El email o la contraseña son incorrectos', 'danger');
                    }

                }
            } else {
                // Alerta
                echo mostrarAlerta('Todos los campos son obligatorios', 'danger');
            }
        }
    ?>
    <div class="container">
        <div class="row">
            <form class="border p-5 rounded shadow-sm mx-auto mt-5 mb-5" method="post" action="loginCliente.php"> 
                <h1>Iniciar sesión</h1>
                <div class="form-group">
                    <label for="email">Correo Electronico</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="carlos.perez@mail.com">
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
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="olvidar" >
                    <label class="form-check-label" for="olvidar">Olvide mi contraseña</label>
                </div>
                <input type="submit" name="btnIngresar" class="btn btn-primary" value="Ingresar">
                <a href="./index.php" id="btnVolver" class="btn btn-danger">Volver</a>
            </form>
        </div>
    </div>

    <?php include('./view/footer.php'); ?>
</body>
</html>