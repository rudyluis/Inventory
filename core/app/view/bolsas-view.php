<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
    BOLSAS / PAQUETES
    </h1>
</section>

<!-- Main content -->
<section class="content">

    <div class="row">
            <div class="col-md-12">
                <div class="btn-group">
                    <a href="index.php?view=newbolsa" class="btn btn-default">Agregar Bolsa / Paquete</a>
                    <!--<div class="btn-group pull-right">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-download"></i> Descargar <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="report/products-word.php">Word 2007 (.docx)</a></li>
                            <li><a href="report/products-xlsx.php">Excel (.xlsx)</a></li>
                            <li><a onclick="thePDF()" id="makepdf" class="">PDF (.pdf)</a>

                        </ul>
                    </div>-->
            </div>
            <br><br>

            <?php
            $currency = ConfigurationData::getByPreffix("currency")->val;

            $bolsas = BolsasData::getAll();
            if(count($bolsas)>0){
            ?>
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title">Bolsas / Paquetes</h3>
            </div><!-- /.box-header -->
            <div class="box-body no-padding">
                <div class="box-body table-responsive">
                    <table class="table  table-bordered datatable table-hover">
                        <thead>
                            <th>Nombre Bolsa</th>
							<th>Cantidad Bolsas Adquiridas</th>
                            <th>Numero Sachets</th>
                            <th>Cantidad Mínima (sachets)</th>
                            <th>Precio Compra</th>
                            <th>Fecha Registro</th>
                            <th>Estado</th>
                            <!--<th>Minima</th>
                            <th>F. caducidad</th>
                            <th>Tipo</th>
                            <th>Activo</th>
                            <th></th>-->
                        </thead>
                        <?php foreach($bolsas as $bolsa):?>
                        <tr>
                            <td><?php echo $bolsa->nombre_bolsas; ?></td>
							<td><?php echo $bolsa->cantidad_bolsas_adquiridas; ?></td>
                           <!-- <td>
                                <?php if($bolsa->image!=""):?>
                                    <img src="storage/products/<?php echo $product->image;?>" style="width:64px;">
                                <?php endif;?>
                            </td>-->
                            <td><?php echo $bolsa->numero_sachets; ?></td>
                            <td><?php echo $bolsa->cantidad_minima; ?></td>
                            <!--<td><?php echo $currency; ?> <?php echo number_format($bolsa->cantidad_minima,2,'.',','); ?></td>-->
                            <td><?php echo $bolsa->precio_compra; ?></td>
                            <!--<td><?php echo $currency; ?> <?php echo number_format($bolsa->precio_compra,2,'.',','); ?></td>-->
                            <td><?php echo date("d-m-Y H:i:s", strtotime($bolsa->fecha_creado)); ?></td>
                            <td><?php if($bolsa->estado==1){echo "Activo"; } else { echo "Inactivo"; }?></td>
                            <!--<td><?php echo $product->expire_at; ?></td>
                            <td>
                                <?php
                                if($product->kind==1){
                                echo "<span class='label label-info'>Producto</span>";
                                }else if($product->kind==2){
                                echo "<span class='label label-success'>Servicio</span>";

                                }
                                ?>


                            </td>
                            <td><?php if($product->is_active): ?><i class="fa fa-check"></i><?php endif;?></td>
                            
							-->
                            <td style="width:90px;">
                            <!--<a target="_blank" href="index.php?action=productqr&id=<?php echo $product->id; ?>" class="btn btn-xs btn-default"><i class="fa fa-qrcode"></i></a>-->
                            <a href="index.php?view=editbolsa&id=<?php echo $bolsa->id_bolsas; ?>" class="btn btn-xs btn-warning"><i class="glyphicon glyphicon-pencil"></i></a>
                            <a href="index.php?view=delbolsa&id=<?php echo $bolsa->id_bolsas; ?>" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                        <?php endforeach;?>
                    </table>
                </div>
            </div><!-- /.box-body -->
        </div><!-- /.box -->


            <?php
        }else{
            ?>
            <div class="alert alert-info">
                <h2>No hay bolsas registradas</h2>
                <p>No se han agregado bolsas o paquetes a la base de datos, puedes agregar uno dando click en el boton <b>"Agregar Bolsa / Paquete"</b>.</p>
            </div>
            <?php
        }

        ?>
            </div>
    </div>
</section><!-- /.content -->



<script type="text/javascript">
        function thePDF() {
            var doc = new jsPDF('p', 'pt');
                    doc.setFontSize(26);
                    doc.text("<?php echo ConfigurationData::getByPreffix("company_name")->val;?>", 40, 65);
                    doc.setFontSize(18);
                    doc.text("LISTADO DE PRODUCTOS", 40, 80);
                    doc.setFontSize(12);
                    doc.text("Usuario: <?php echo Core::$user->name." ".Core::$user->lastname; ?>  -  Fecha: <?php echo date("d-m-Y h:i:s");?> ", 40, 90);
            var columns = [
                {title: "Id", dataKey: "id"}, 
                {title: "Codigo", dataKey: "code"}, 
                {title: "Nombre del Producto", dataKey: "name"}, 
                {title: "Precio de entrada", dataKey: "price_in"}, 
                {title: "Precio de Salida", dataKey: "price_out"}, 
            ];
            var rows = [
            <?php foreach($products as $product):
            ?>
                {
                "id": "<?php echo $product->id; ?>",
                "code": "<?php echo $product->code; ?>",
                "name": "<?php echo $product->name; ?>",
                "price_in": "$ <?php echo number_format($product->price_in,2,'.',',');?>",
                "price_out": "$ <?php echo number_format($product->price_out,2,'.',',');?>",
                },
            <?php endforeach; ?>
            ];
            doc.autoTable(columns, rows, {
                theme: 'grid',
                overflow:'linebreak',
                styles: { 
                    fillColor: <?php echo Core::$pdf_table_fillcolor;?>
                },
                columnStyles: {
                    id: {fillColor: <?php echo Core::$pdf_table_column_fillcolor;?>}
                },
                margin: {top: 100},
                afterPageContent: function(data) {
                }
            });
            doc.setFontSize(12);
            doc.text("<?php echo Core::$pdf_footer;?>", 40, doc.autoTableEndPosY()+25);
            <?php 
            $con = ConfigurationData::getByPreffix("report_image");
            if($con!=null && $con->val!=""):
            ?>
            var img = new Image();
            img.src= "storage/configuration/<?php echo $con->val;?>";
            img.onload = function(){
            doc.addImage(img, 'PNG', 495, 20, 60, 60,'mon');	
            doc.save('products-<?php echo date("d-m-Y h:i:s",time()); ?>.pdf');
            }
            <?php else:?>
            doc.save('products-<?php echo date("d-m-Y h:i:s",time()); ?>.pdf');
            <?php endif; ?>
}
</script>

