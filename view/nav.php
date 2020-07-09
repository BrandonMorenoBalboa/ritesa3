<?php 
    session_start();
    error_reporting(0);
?>
<!--Nav-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="./index.php"><img src="./img/favicon.png" alt="" width="30px" height="30px"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.php">Inicio</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Categorias
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
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
                            $query="SELECT url, nombre FROM familia WHERE estado = 1";
                            // Ejecutamos la consulta
                            $resultado = $conn->query($query);
                            // Recorremos el resultado 
                            while($fila = $resultado->fetch_assoc())
                            {
                                echo '<a class="dropdown-item" href="'.$fila['url'].'">'. $fila['nombre'].'</a>';
                            }
                        }
                    ?>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Contacto.php">Contacto</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Catalogo 2020
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" target="_blank" href="./catalogo/Catalogo2020.pdf">Descargar</a>
                </div>
            </li>
        </ul>
        
        <div class="btn-group dropleft">
            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" id="mostrar-carrito" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent">
                <span class="sr-only">Toggle Dropdown</span>
            </button>
            <a href="./Carrito.php" class="btn btn-secondary text-white">Carrito</a>
            <div class="dropdown-menu" aria-labelledby="mostrar-carrito">
                <table class="table table-responsive" id="carrito-compras" style="font-size: 10px">
                    <tr>
                        <th>Imagen</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Total</th>
                    </tr>
                </table>
            </div>
        </div>
        <?php 
            if($_SESSION['id'] == "" && $_SESSION['nombre'] == "") {
        ?>
            <div class="form-inline my-2 my-lg-0">
                <a href="./loginCliente.php" class="btn btn-outline-success my-2 my-sm-0 ml-1 mr-1">Ingresar</a>
                <a href="./registroCliente.php" class="btn btn-outline-warning my-2 my-sm-0 ml-1 mr-1" >Registrarse</a>
            </div>            
        <?php 
            } else {
        ?>
            <div class="form-inline my-2 my-lg-0">
                <label class="pl-2 pr-2 text-white" for="">Bienvenido <?php echo $_SESSION['nombre']; ?></label>
                <a href="" class="btn btn-outline-warning my-2 my-sm-0 ml-1 mr-1">Opciones</a>
                <a href="./CerrarSesion.php" class="btn btn-outline-danger my-2 my-sm-0 ml-1 mr-1">Cerrar</a>
            </div>
        <?php 
            }
        ?>
        
    </div>
</nav>
<!-- Mensaje de alerta -->
<?php include('alertas/alertas.php'); ?>