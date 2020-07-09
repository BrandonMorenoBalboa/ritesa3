<!DOCTYPE html>
<html lang="es">
<head>
    <?php include('./view/header.php'); ?>
    <title>Contacto</title>
</head>
<body>
    <?php
        // Nav 
        include('./view/nav.php'); 
    ?>
    <div class="alertas"></div>
    <!-- Main -->
    <div class="container" id="container">
        <div class="row">
            <div class="col-md-6">
                <form method="post" class="border p-3 m-3 shadow-sm rounded" action="EnviarContacto.php"> 
                    <h1>Formulario de contacto</h1>
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" name="nombre" class="form-control form-control-sm" id="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="asunto">Asunto:</label>
                        <input type="text" name="asunto" class="form-control form-control-sm" id="asunto" required>
                    </div>
                    <div class="form-group">
                        <label for="asunto">Fono:</label>
                        <input type="text" name="fono" class="form-control form-control-sm" id="asunto" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Correo Electronico:</label>
                        <input type="email" name="email" class="form-control form-control-sm" id="email" required>
                    </div>
                    <div class="form-group">
                        <label for="mensaje">Mensaje:</label>
                        <textarea class="form-control form-control-sm" name="mensaje" id="mensaje" rows="3" required></textarea>
                    </div>
                    <input type="hidden" name="verificacion">
                    <input type="submit" class="btn btn-primary" value="Enviar">
                </form>
            </div>
        </div>
    </div>
    <?php include('./view/footer.php'); ?>
</body>
</html>