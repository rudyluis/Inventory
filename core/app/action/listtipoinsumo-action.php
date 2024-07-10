<?php

// Obtener todos los tipos de insumo
$tipoInsumos = TipoInsumoData::getAll();

// Generar las opciones del combo
$options = "";
if (count($tipoInsumos) > 0) {
    foreach ($tipoInsumos as $tipoInsumo) {
        if($tipoInsumo->id_tipo_insumo==1){
            $options .= "<option value='{$tipoInsumo->id_tipo_insumo}' selected>{$tipoInsumo->nombre_tipo_insumo}</option>";

        }
        else{
            $options .= "<option value='{$tipoInsumo->id_tipo_insumo}'>{$tipoInsumo->nombre_tipo_insumo}</option>";

        }
    }
} else {
    $options = "<option value=''>No hay tipos de insumo</option>";
}

// Devolver las opciones
echo $options;
?>
