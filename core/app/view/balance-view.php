<?php
$clients = PersonData::getClients();
?>
<section class="content">
<div class="row">
	<div class="col-md-12">
	<h1>Balance (Ingresos - Egresos = Utilidad)</h1>

	<form>
		<input type="hidden" name="view" value="balance">
		<div class="row">
			<div class="col-md-4">
				<!-- Aquí se agrega el combo de selección de tipo de insumo -->
				<select name="insumo_type" id="insumo_type" class="form-control">
					<option value="">-- Tipo de Insumo --</option>
					
				</select>
			</div>
			<Script>
				$.get("./?action=listtipoinsumo", function(data){
						$("#insumo_type").html(data);
					});
			</Script>
			<div class="col-md-3">
				<input type="date" name="sd" value="<?php if(isset($_GET["sd"])){ echo $_GET["sd"]; }?>" class="form-control">
			</div>
			<div class="col-md-3">
				<input type="date" name="ed" value="<?php if(isset($_GET["ed"])){ echo $_GET["ed"]; }?>" class="form-control">
			</div>
			<div class="col-md-2">
				<input type="submit" class="btn btn-success btn-block" value="Procesar">
			</div>
		</div>
	</form>
	</div>
</div>
<br><!--- -->
<div class="row">
	<div class="col-md-12">
		<?php if(isset($_GET["sd"]) && isset($_GET["ed"]) ):?>

			<?php if($_GET["sd"]!="" && $_GET["ed"]!=""):
				$sd = strtotime($_GET["sd"]);
				$ed = strtotime($_GET["ed"]);
				$sel = isset($_GET["insumo_type"]) ? intval($_GET["insumo_type"]) : 1; // Captura el valor del insumo_type
			?>
				<div class="box box-primary">
					<div id="graph" class="animate" data-animate="fadeInUp"></div>
				</div>
				<script>
					
					
					<?php 
						echo "var c=0;";
						echo "var dates=Array();";
						echo "var data=Array();";
						echo "var total=Array();";
						echo "var sel=".isset($_GET["insumo_type"]) .";alert(sel);";
						for($i=$sd;$i<=$ed;$i+=(60*60*24)){
							$operations = SellData::getGroupByDateOp(date("Y-m-d",$i),date("Y-m-d",$i),2,$sel);
							$res = SellData::getGroupByDateOp(date("Y-m-d",$i),date("Y-m-d",$i),1,$sel);
							$spends = SpendData::getGroupByDateOp(date("Y-m-d",$i),date("Y-m-d",$i));
							$sr = $res[0]->tot != null ? $res[0]->tot : 0;
							$sl = $operations[0]->t != null ? $operations[0]->t : 0;
							$sp = $spends[0]->t != null ? $spends[0]->t : 0;
							echo "dates[c]=\"" . date("Y-m-d", $i) . "\";";
							echo "data[c]=" . ($sl - ($sp + $sr)) . ";";
							echo "total[c]={x: dates[c],y: data[c]};";
							echo "c++;";
						}
					?>
					Morris.Area({
						element: 'graph',
						data: total,
						xkey: 'x',
						ykeys: ['y'],
						labels: ['Y']
					}).on('click', function(i, row){
						console.log(i, row);
					});
				</script>

				<div class="box box-primary">
					<table class="table table-bordered">
						<thead>
							<th>Fecha</th>
							<th>Ingresos / Ventas</th>
							<th>Compras / Abastecimientos</th>
							<th>Gastos Extras</th>
							<th>Utilidad</th>
						</thead>
						<?php 
						$restotal = 0;
						$selltotal = 0;
						$spendtotal = 0;
						for($i=$sd; $i<=$ed; $i+=(60*60*24)):
							$operations = SellData::getGroupByDateOp(date("Y-m-d", $i), date("Y-m-d", $i), 2,$sel);
							$res = SellData::getGroupByDateOp(date("Y-m-d", $i), date("Y-m-d", $i), 1,$sel);
							$spends = SpendData::getGroupByDateOp(date("Y-m-d", $i), date("Y-m-d", $i));
						?>
						<?php if(count($operations) > 0): ?>
							<tr>
								<td><?php echo date("Y-m-d", $i); ?></td>
								<td><?php echo Core::$symbol; ?> <?php echo number_format($operations[0]->t, 2, '.', ','); ?></td>
								<td><?php echo Core::$symbol; ?> <?php echo number_format($res[0]->tot, 2, '.', ','); ?></td>
								<td><?php echo Core::$symbol; ?> <?php echo number_format($spends[0]->t, 2, '.', ','); ?></td>
								<td><?php echo Core::$symbol; ?> <?php echo number_format($operations[0]->t - ($spends[0]->t + $res[0]->tot), 2, '.', ','); ?></td>
							</tr>
							<?php 
							$restotal += $res[0]->tot;
							$selltotal += $operations[0]->t;
							$spendtotal += $spends[0]->t;
							else:
							?>
								<div class="jumbotron">
									<h2>No hay operaciones</h2>
									<p>El rango de fechas seleccionado no proporcionó ningún resultado de operaciones.</p>
								</div>
							<?php endif; ?>
						<?php endfor; ?>
						<tr style="color:blue;">
							<td><b>TOTAL</b></td>
							<td><b><?php echo Core::$symbol; ?> <?php echo number_format($selltotal, 2, '.', ','); ?></b></td>
							<td><b><?php echo Core::$symbol; ?> <?php echo number_format($restotal, 2, '.', ','); ?></b></td>
							<td><b><?php echo Core::$symbol; ?> <?php echo number_format($spendtotal, 2, '.', ','); ?></b></td>
							<td><b><?php echo Core::$symbol; ?> <?php echo number_format($selltotal - ($spendtotal + $restotal), 2, '.', ','); ?></b></td>
						</tr>
					</table>
				</div>
			<?php else: ?>
				<div class="jumbotron">
					<h2>Fechas Incorrectas</h2>
					<p>Puede ser que no seleccionó un rango de fechas, o el rango seleccionado es incorrecto.</p>
				</div>
			<?php endif; ?>
		<?php endif; ?>
	</div>
</div>
<br><br><br><br>
</section>
