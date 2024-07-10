<?php

if(count($_POST)>0){
	$bolsa = BolsasData::getById($_POST["id_bolsas"]);

	$bolsa->nombre_bolsas = $_POST["nombre_bolsas"];
	$bolsa->numero_sachets = $_POST["numero_sachets"];
	$bolsa->cantidad_minima = $_POST["cantidad_minima"];
	$bolsa->precio_compra = $_POST["precio_compra"];
	$bolsa->id_usuario_modificado = $_SESSION["user_id"];

	$se_actualizo = $bolsa->update();
	if($se_actualizo[0] == 1){
		print "<script>window.location='index.php?view=bolsas';</script>";
	}
	else{
		echo "No se pudo actualizar";
	}

}


?>