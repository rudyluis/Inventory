<?php if(isset($_SESSION["reabastecer_bolsas"])):
$total = 0;
$iva_name = ConfigurationData::getByPreffix("imp-name")->val;
$iva_val = ConfigurationData::getByPreffix("imp-val")->val;

?>

<h3>Lista de Reabastecimiento de Bolsas</h3>
<div class="box box-primary">
<table class="table table-bordered table-hover">
<thead>
	<th style="width:30px;">Nombre</th>
	<th style="width:30px;">Cantidad</th>
	<th style="width:50px;">Número de Sachets</th>
	<th>Precio de Compra Unidad</th>
	<th>Precio Total</th>
	<th></th>
</thead>
<?php foreach($_SESSION["reabastecer_bolsas"] as $b):
$bolsa = BolsasData::getById($b["bolsa_id"]);
?>
<tr>
	<td><?php echo $bolsa->nombre_bolsas; ?></td>
	<td><?php echo $b["q"]; ?></td>
	<td><?php echo $bolsa->numero_sachets; ?></td>
	<td><b><?php echo Core::$symbol; ?> <?php echo number_format($b["precio_compra_unidad"],2,".",","); ?></b></td>
	<td><b><?php echo Core::$symbol; ?> <?php $pt = $b["precio_compra_unidad"] * $b["q"]; $total += $pt; echo number_format($pt,2,".",","); ?></b></td>
	<td style="width:30px;"><a id="clearre-<?php echo $bolsa->id_bolsas; ?>" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i> Cancelar</a></td>
<script>
  $("#clearre-<?php echo $bolsa->id_bolsas; ?>").click(function(){
    $.get("index.php?view=clearrebolsas","bolsa_id=<?php echo $bolsa->id_bolsas; ?>",function(data){
        $.get("./?action=cartofrebolsas",null,function(data2){
          $("#cartofre").html(data2);
        });
    });
  });
</script>
</tr>
<?php endforeach; ?>
</table>
</div>

<h3>Resumen</h3>

<div class="row">
<div class="col-md-5">
<div class="box box-primary">
<table class="table table-bordered">
<tr>
	<td><p>Subtotal</p></td>
	<td><p><b><?php echo Core::$symbol; ?> <?php echo number_format($total/(1 + ($iva_val/100) ),2,'.',','); ?></b></p></td>
</tr>
<tr>
	<td><p><?php echo $iva_name." (".$iva_val."%) ";?></p></td>
	<td><p><b><?php echo Core::$symbol; ?> <?php echo number_format(($total/(1 + ($iva_val/100) ))*($iva_val/100),2,'.',','); ?></b></p></td>
</tr>
<tr>
	<td><p>Total</p></td>
	<td><p><b><?php echo Core::$symbol; ?> <?php echo number_format($total,2,'.',','); ?></b></p></td>
</tr>
</table>
</div>
</div>
<div class="col-md-7">
<form class="form-horizontal" id="processrebolsas" method="post" action="./?action=processrebolsas">
    <input type="hidden" name="total" value="<?php echo $total; ?>" class="form-control" placeholder="Total">
    <div class="col-md-12">
        <div class="form-group">
            <label for="inputEmail1" class="control-label">No. Factura/Recibo</label>
            <input type="text" name="invoice_code" value="" class="form-control" placeholder="No. Factura">
        </div>
        <div class="form-group">
            <label class="control-label">Fecha</label>
            <div class="col-lg-12">
                <input type="date" name="fecha" value="" id="fecha" class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="inputEmail1" class="control-label">Almacen</label>
                <?php if(Core::$user->kind==1):?>
                    <?php 
                    $stocks = StockData::getAll();
                    ?>
                    <select name="stock_id" class="form-control" required>
                        <option value="">-- NINGUNO --</option>
                        <?php foreach($stocks as $stock):?>
                            <option value="<?php echo $stock->id;?>"><?php echo $stock->name;?></option>
                        <?php endforeach;?>
                    </select>
                <?php else:?>
                    <input type="hidden" name="stock_id" value="<?php echo StockData::getPrincipal()->id; ?>">
                    <p class="form-control"><?php echo StockData::getPrincipal()->name; ?></p>
                <?php endif;?>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="inputEmail1" class="control-label">Proveedor</label>
                <?php 
                $providers = PersonData::getProviders();
                ?>
                <select name="client_id" class="form-control">
                    <option value="">-- NINGUNO --</option>
                    <?php foreach($providers as $provider):?>
                        <option value="<?php echo $provider->id;?>"><?php echo $provider->name." ".$provider->lastname;?></option>
                    <?php endforeach;?>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label for="inputEmail1" class="control-label">Pago</label>
                <?php 
                $payments = PData::getAll();
                ?>
                <select name="p_id" class="form-control">
                    <?php foreach($payments as $payment):?>
                        <option value="<?php echo $payment->id;?>"><?php echo $payment->name;?></option>
                    <?php endforeach;?>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="inputEmail1" class="control-label">Entrega</label>
                <?php 
                $deliveries = DData::getAll();
                ?>
                <select name="d_id" class="form-control">
                    <?php foreach($deliveries as $delivery):?>
                        <option value="<?php echo $delivery->id;?>"><?php echo $delivery->name;?></option>
                    <?php endforeach;?>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="inputEmail1" class="control-label">Forma de pago</label>
                <?php 
                $payments_methods = FData::getAll();
                ?>
                <select name="f_id" class="form-control">
                    <?php foreach($payments_methods as $method):?>
                        <option value="<?php echo $method->id;?>"><?php echo $method->name;?></option>
                    <?php endforeach;?>
                </select>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail1" class="control-label">Efectivo</label>
        <input type="text" name="money" required class="form-control" id="money" placeholder="Efectivo">
    </div>
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <div class="checkbox">
                <label>
                    <a href="index.php?view=clearre" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i> Cancelar</a>
                    <button class="btn btn-primary"><i class="fa fa-refresh"></i> Procesar Reabastecimiento</button>
                </label>
            </div>
        </div>
    </div>
</form>
</div>
</div>
<script>
  $("#processrebolsas").submit(function(e){
    money = $("#money").val();
    tipo_pago = $("select[name=p_id]").val();

    if (money < <?php echo $total;?> && tipo_pago != 4) {
      alert("No se puede efectuar la operacion");
      e.preventDefault();
    } else {
      go = confirm("Saldo: $" + (money - <?php echo $total;?>));
      if (go) {
        e.preventDefault();
        $.post("./index.php?action=processrebolsas", $("#processrebolsas").serialize(), function(data){
          $.get("./?action=cartofrebolsas", null, function(data2){
            $("#cartofre").html(data);
            $("#show_search_results").html("");
          });
        });
      } else {
        e.preventDefault();
      }
    }
  });
</script>

<?php endif; ?>
