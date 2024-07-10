<section class="content">
    <?php 
$currency = ConfigurationData::getByPreffix("currency")->val;
    ?>
<div class="row">
	<div class="col-md-12">
	<h1>Nueva Bolsa /Paquete</h1>
	<br>
  <div class="box box-primary">
  <table class="table">
  <tr>
  <td>
		<form class="form-horizontal" method="post" enctype="multipart/form-data" id="addbolsa" action="index.php?view=addbolsa" role="form">

  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Nombre Bolsa*</label>
    <div class="col-md-6">
      <input type="text" name="nombre_bolsas" required class="form-control" id="nombre_bolsas" placeholder="Nombre del Paquete">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Cantidad de Bolsas Compradas*</label>
    <div class="col-md-6">
      <input type="text" name="cantidad_bolsas" required class="form-control" id="cantidad_bolsas" placeholder="Cantidad de Bolsas Compradas">
    </div>
  </div>

  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Numero de Sachets*Bolsa</label>
    <div class="col-md-6">
      <input type="text" name="numero_sachets" required class="form-control" id="numero_sachets" placeholder="Numero de sachets">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Cantidad mínima (sachets)*Bolsa:</label>
    <div class="col-md-6">
      <input type="text" name="cantidad_minima" class="form-control" id="cantidad_minima" placeholder="Cantidad Minima">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Precio de Compra (<?php echo $currency; ?>)*Bolsa</label>
    <div class="col-md-6">
      <input type="text" name="precio_compra" required class="form-control" id="precio_compra" placeholder="Precio de Compra">
    </div>
  </div>

  <script type="text/javascript">
//  $(document).ready(function(){
  //  $("#price_in").keyup(function(){
    //  $("#price_out").val( $("#price_in").val()*1.25 );
    //});

  //});
  </script>


  <div class="form-group text-center">
    <div class="col-lg-offset-2 col-lg-10">
      <button type="submit" class="btn btn-primary">Agregar Bolsa/Paquete</button>
    </div>
  </div>
</form>
</td>
</tr>
</table>
</div>
	</div>
</div>

<script>
  $(document).ready(function(){
    $("#product_code").keydown(function(e){
        if(e.which==17 || e.which==74 ){
            e.preventDefault();
        }else{
            console.log(e.which);
        }
    })
});

</script>
</section>