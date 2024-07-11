<?php
if(isset($_SESSION["reabastecer_bolsas"])){
	$cart = $_SESSION["reabastecer_bolsas"];
	if(count($cart) > 0){

		$process = true;

		if($process == true){
			$y = new YYData();
			$yy = $y->add();
			$sell = new SellData();
			$sell->ref_id = $yy[1];
			$sell->user_id = $_SESSION["user_id"];
			$sell->invoice_code = $_POST["invoice_code"];
			$sell->p_id = $_POST["p_id"];
			$sell->d_id = $_POST["d_id"];
			$sell->f_id = $_POST["f_id"];
			$sell->total = $_POST["total"];
			$sell->stock_to_id = $_POST["stock_id"];
			$sell->person_id = $_POST["client_id"] != "" ? $_POST["client_id"] : "NULL";
			$sell->cash = $_POST["money"];
			$sell->fecha = $_POST["fecha"];
			
			if($_POST["p_id"] == 4){
				$saldo = $_POST["total"] - $_POST["money"];
				$sell->comment = "[Pago Bs." . $_POST["money"] . "--->Saldo Bs." . $saldo . " en Fecha:" . $_POST["fecha"] . " Recibo:" . $_POST["invoice_code"] . "]";
				$s = $sell->add_recredit();
			} else {
				$s = $sell->add_rea2();
			}

			foreach($cart as $c){
				$operation_type = 1;
				if($_POST["d_id"] == 2) {
					$operation_type = 3; // 3.- entrada-pendiente 
				}

				$bolsa = BolsasData::getById($c["bolsa_id"]);
				if($bolsa->precio_compra_unidad != $c["precio_compra_unidad"]) {
					$bolsa->precio_compra_unidad = $c["precio_compra_unidad"];
					$bolsa->update_prices();
				}

				$op = new OperationData();
				$op->price_in = $bolsa->precio_compra_unidad;
				$op->price_out = $bolsa->precio_compra_unidad;
				$op->stock_id = $_POST["stock_id"];
				$op->id_bolsa = $c["bolsa_id"];
				$op->operation_type_id = $operation_type; // 1 - entrada
				$op->sell_id = $s[1];
				$op->q = $c["q"];
				$add = $op->addBolsa();
			}

			// Generando el mensaje
			$subject = "[" . $s[1] . "] Nuevo reabastecimiento de bolsas en el inventario";
			$message = "<p>Se ha realizado un reabastecimiento de bolsas en el inventario con Id = " . $s[1] . "</p>";
			$person_th = "";
			$person_td = "";
			if($_POST["client_id"] != ""){
				$person = PersonData::getById($_POST["client_id"]);
				$person_th = "<td>Proveedor</td>";
				$person_td = "<td>" . $person->name . " " . $person->lastname . "</td>";
			}

			$message .= "<table border='1'><tr>
				<td>Id</td>
				$person_th
				<td>Almacen</td>
				<td>Estado de pago</td>
				<td>Estado de entrega</td>
				<td>Total</td>
				</tr>
				<tr>
				<td>" . $s[1] . "</td>
				$person_td
				<td>" . StockData::getById($sell->stock_to_id)->name . "</td>
				<td>" . PData::getById($sell->p_id)->name . "</td>
				<td>" . DData::getById($sell->d_id)->name . "</td>
				<td> $" . number_format($sell->total,2,".",",") . "</td>
				</tr>
				</table>";
			$message .= "<h3 style='color:#333;'>Resumen</h3>";
			$message .= "<table border='1'><thead><th>Id</th><th>Nombre</th><th>Cantidad</th><th>Precio de Compra Unidad</th><th>Precio Total</th></thead>";
			foreach($cart as $c){
				$message .= "<tr>";
				$bolsa = BolsasData::getById($c["bolsa_id"]);
				$message .= "<td>" . $bolsa->id_bolsas . "</td>";
				$message .= "<td>" . $bolsa->nombre_bolsas . "</td>";
				$message .= "<td>" . $c["q"] . "</td>";
				$message .= "<td>$ " . number_format($bolsa->precio_compra_unidad,2,".",",") . "</td>";
				$message .= "<td>$ " . number_format($c["q"] * $bolsa->precio_compra_unidad,2,".",",") . "</td>";
				$message .= "</tr>";
			}
			$message .= "</table>";

			if($subject != "" && $message != ""){
				$m = new MailData();
				$m->open();
				$m->mail->Subject = $subject;
				$m->message = "<p>$message</p>";
				$m->mail->IsHTML(true);
				$m->send();
			}

			unset($_SESSION["reabastecer_bolsas"]);
			setcookie("selled","selled");

			print "<br><p class='alert alert-success'>Abastecimiento de bolsas procesado exitosamente. <a class='btn btn-primary btn-xs' href='index.php?view=onere&id=$s[1]'> Ver resumen</a></p>";
		}
	}
}
?>
