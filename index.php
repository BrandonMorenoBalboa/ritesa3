<!DOCTYPE html>
<html lang="es">
<head>
    <title>RITESA</title>
    <!--Header-->
    <?php include('./view/header.php'); ?>
</head>
<body>
    <!--Navbar-->
    <?php include('./view/nav.php'); ?>
    <?php include('Carrusel.php'); ?>
    <div class="container">
        <div class="row row-cols-1 row-cols-md-5 mt-3">
                <?php 
                include("./conexion/conexion.php");
                $conn = new mysqli($servername, $username, $password, $dbname);
                // Verificamos la conexion
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                } 
                else
                {
                    // Realizamos la consulta sql
                    $query="SELECT id, nombre, ruta_imagen, imagen, url 
                    FROM familia 
                    WHERE estado = 1";
                    // Ejecutamos la consulta
                    $resultado = $conn->query($query);
                    // Recorremos el resultado 
                    while($fila = $resultado->fetch_assoc())
                    {
                        echo '
                        <div class="col mb-4">
                        <div class="card h-100">
                          <img src="' . $fila['ruta_imagen'] . $fila['imagen'] .'" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">' . $fila['nombre'] . '</h5>
                            <a class="btn btn-success" href="' . $fila['url'] . '">Ver mas</a>
                          </div>
                        </div>
                      </div>
                        ';
                    }
                }
                // Cerramos la conexion
                $conn->close();
            ?>  
        </div>
    </div>

    <!--Footer-->
    <?php include('./view/footer.php'); ?>
</body>
</html>