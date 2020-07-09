<!DOCTYPE html>
<html lang="es">
<head>
    <?php include('./view/header.php'); ?>
    <title>Carrito</title>
</head>
<body>
    <?php
        // Nav 
        include('./view/nav.php'); 
    ?>
    <div class="alertas"></div>
    <!-- Main -->
    <div class="container">
        <div id="carrito-productos">
            <h1>Lista de productos</h1>

        </div>
        <div>
            <form action="Carrito.php" method="post">
                <input type="text" class="form-control" name="carrito-php" id="carrito-php">
                <input type="submit" name="Enviar" value="Enviar">
            </form>
        </div>
    </div>
    <?php 
        if(isset($_POST['Enviar'])) {
            // Obtener JSON con datos del carrito de compras
            $pedido = json_decode($_POST['carrito-php'], true);
            include('./conexion/conexion.php');
            $conn = new mysqli($servername, $username, $password, $dbname);
            if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
            } else {
                foreach ($pedido as $value) {
                    $sql = "INSERT INTO detalle_pedido (id_producto, producto, precio, cantidad, total, pedido)
                    VALUES('".$value['id']."', '".$value['nombre']."', '".$value['precio']."', '".$value['cantidad']."', '".$value['cantidad'] * $value['precio']."', 1)
                    ";
                    $result = $conn->query($sql);
                    echo $sql;
                }
                $conn->close();
            }

        }
    ?>

    <?php include('./view/footer.php'); ?>
</body>
</html>
