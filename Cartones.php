<!DOCTYPE html>
<html lang="es">
<head>
    <?php include('./view/header.php'); ?>
    <title>Cartones</title>
</head>
<body>
    <?php
        // Nav 
        include('./view/nav.php'); 
    ?>
    <div class="alertas"></div>
    <!-- Main -->
    <div class="container" id="container">
        <h1 class="text-center">Cartones</h1>
        <div class="row row-cols-1 row-cols-md-4">
            <?php 
                include("./conexion/conexion.php");
                $conn = new mysqli($servername, $username, $password, $dbname);
                // Charset
                $conn->set_charset("utf8");
                // Verificamos la conexion
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                } 
                else
                {
                    // Realizamos la consulta sql
                    $query="SELECT pro.imagen as imagen, 
                    pro.ruta_imagen as ruta,
                    pro.id as dataid, 
                    pro.precio as precio, 
                    pro.cantidad_paquete as cantidad,
                    pro.nombre as nombre
                    FROM familia as fa, producto as pro
                    WHERE (fa.id = pro.familia) and (pro.estado = 1) and (fa.id = 3)";
                    // Ejecutamos la consulta
                    $resultado = $conn->query($query);
                    // Recorremos el resultado 
                    while($fila = $resultado->fetch_assoc())
                    {
                        echo '
                        <div class="col mb-4">
                            <div class="card h-100 shadow-sm">
                                <form method="post" action="PlatoVandeja.php">
                                    <img src="'. $fila['ruta'] . $fila['imagen'] . '" class="card-img-top" alt="">
                                    <div class="card-body">
                                        <h5 class="card-title">' . $fila['nombre'] . '</h5>
                                        <input type="hidden" name="id" data-id="' . $fila['dataid'] . '">
                                        <p class="card-text">Precio: $<span>' . $fila['precio'] . '</span></p>
                                        <div class="form-group">
                                            <label for="cantidad">Cantidad:</label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <input type="hidden" class="factor" value="' . $fila['cantidad'] . '">
                                                    <div class="input-group-prepend">
                                                        <button id="" class="btn btn-cantidad btn-outline-warning disminuir" type="button">-</button>
                                                    </div>
                                                    <input type="number" disabled="true" name="cantidad" class="form-control cantidad text-right" id="cantidad" value="0" min="0">
                                                    <div class="input-group-append">
                                                        <button id="" class="btn btn-cantidad btn-outline-primary aumentar" type="button">+</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" name="btnAgregar" class="btn btn-success agregar-carrito" value="Agregar">
                                    </div>
                                </form>
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
    <?php include('./view/footer.php'); ?>
</body>
</html>

