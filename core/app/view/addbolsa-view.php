<?php
if(count($_POST)>0){
  $bolsa = new BolsasData();
  $bolsa->nombre_bolsas 			 = $_POST["nombre_bolsas"];
  $bolsa->cantidad_bolsas_adquiridas = $_POST["cantidad_bolsas"];
  $bolsa->numero_sachets 			 = $_POST["numero_sachets"];
  $bolsa->cantidad_minima 			 = $_POST["cantidad_minima"];
  $bolsa->precio_compra_unidad 		 = $_POST["precio_compra"];
  $bolsa->id_usuario 				 = $_SESSION["user_id"];
  $bolsa->estado 					 = 1;


  $prod= $bolsa->add();

print "<script>window.location='index.php?view=bolsas';</script>";


}


?>