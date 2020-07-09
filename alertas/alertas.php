<?php 

function mostrarAlerta($mensaje, $tipoAlerta) {
    $template = '
    <div class="m-2 alert alert-' . $tipoAlerta . '" role="alert">
        '. $mensaje . '
    </div>';
    return $template;
}



?>