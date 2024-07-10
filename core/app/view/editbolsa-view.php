<section class="content">
<?php
$bolsa = BolsasData::getById($_GET["id"]);

if($bolsa!=null):
?>
<div class="row">
	<div class="col-md-12">
	<h1><?php echo $bolsa->nombre_bolsas; ?> <small>Editar Bolsa / Paquete</small></h1>
  <?php if(isset($_COOKIE["bolsaupd"])):?>
    <p class="alert alert-info">La informacion del paquete se ha actualizado exitosamente.</p>
  <?php setcookie("prdupd","",time()-18600); endif; ?>
	<br>
<div class="box box-primary">
  <table class="table">
  <tr>
  <td>
		<form class="form-horizontal" method="post" id="updatebolsa" enctype="multipart/form-data" action="index.php?view=updatebolsa" role="form">

  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Nombre Bolsa*</label>
    <div class="col-md-6">
      <input type="text" name="nombre_bolsas" class="form-control" id="nombre_bolsas" value="<?php echo $bolsa->nombre_bolsas; ?>" placeholder="Nombre de Bolsas">
    </div>
  </div>


  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Numero de sachets*</label>
    <div class="col-md-6">
      <input type="text" name="numero_sachets" class="form-control" id="numero_sachets" value="<?php echo $bolsa->numero_sachets; ?>" placeholder="Numero de sachets">
    </div>
  </div>
    <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Cantidad Minima*</label>
    <div class="col-md-6">
      <input type="text" name="cantidad_minima" class="form-control" id="cantidad_minima" value="<?php echo $bolsa->cantidad_minima; ?>" placeholder="Cantidad Minima">
    </div>
  </div>


  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Precio de Compra*</label>
    <div class="col-md-6">
      <input type="text" name="precio_compra" class="form-control" value="<?php echo $bolsa->precio_compra; ?>" id="precio_compra" placeholder="Precio de compra">
    </div>
  </div>


  <div class="form-group">
    <div class="col-lg-offset-3 col-lg-8">
    <input type="hidden" name="id_bolsas" value="<?php echo $bolsa->id_bolsas; ?>">
      <button type="submit" class="btn btn-success">Actualizar Bolsa / Paquete</button>
    </div>
  </div>
</form>
</td>
</tr>
</table>
</div>
	</div>
</div>
<?php endif; ?>
</section>