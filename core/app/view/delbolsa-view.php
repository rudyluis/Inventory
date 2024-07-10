<?php
$bolsa = BolsasData::getById($_GET["id"]);
$se_elimino = $bolsa->del();
if($se_elimino[0] == 1){
	print "<script>window.location='index.php?view=bolsas';</script>";
}
else{
	echo "No se pudo actualizar";
}
	

?>