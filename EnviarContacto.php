<?php
    $nombre = $_POST['nombre'];
    $email = $_POST['email'];
    $telefono = $_POST['fono'];
    $asunto = $_POST['asunto'];
    $mensaje = $_POST['mensaje'];
    $verificacion = $_POST['verificacion'];
    if ($verificacion == '') 
    {

        if($nombre == '' || $email == '' || $telefono == '' || $mensaje == '' || $asunto == '') 
        {
            echo "<script>
                alert('Todos los campos son obligatorios');
                location.href ='javascript:history.back()';
            </script>";
        }
        else
        {
            require 'PHPMailer/PHPMailerAutoload.php';
            
            $mail = new PHPMailer;
            
            //$mail->SMTPDebug = 3;                               // Enable verbose debug output

            $mail->isSMTP();                                      // Set mailer to use SMTP
            $mail->Host = '';                       // Servidor
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            $mail->Username = '';           // SMTP username
            $mail->Password = '';                       // SMTP password
            $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
            $mail->Port = 465;                                    // TCP port to connect to
            $mail->setFrom('', $nombre);
            $mail->addAddress('', '');
            $mail->Subject = $asunto;
            $mail->Body    = "Nombre: $nombre \n". // Nombre del usuario
                            "Telefono: $telefono \n".
                            "Email: $email \n".    // Email del usuario
                            "Mensaje: $mensaje \n"; // Mensaje del usuario
            if(!$mail->send()) {
                echo "<script>alert('Error al enviar el formulario');location.href ='javascript:history.back()';</script>";
                echo "error";
            } else {
                echo "<script>
                        alert('Mensaje enviado, nos pondremos en contacto a la brevedad.');
                        window.location.href = './Contacto.php';
                    </script>";
            }
        }
    }else {
        echo "<script>alert('Error al enviar el formulario');location.href ='javascript:history.back()';</script>";

    }
?>
