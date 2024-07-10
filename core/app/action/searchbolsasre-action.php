<?php if(isset($_GET["bolsa"])): ?>
    <?php
    $bolsas = BolsasData::getLike($_GET["bolsa"]);
    if(count($bolsas) > 0){
    ?>
    <h3>Resultados de la Búsqueda</h3>
    <div class="box box-primary">
        <table class="table table-bordered table-hover">
            <thead>
                <th>Nombre</th>
                <th>Cantidad Adquirida</th>
                <th>Número de Sachets</th>
                <th>Cantidad Mínima</th>
                <th>Precio Compra Unidad</th>
                <th>Acciones</th>
            </thead>
            <?php
            foreach($bolsas as $bolsa):
            ?>
            <tr>
                <td><?php echo $bolsa->nombre_bolsas; ?></td>
                <td><?php echo $bolsa->cantidad_bolsas_adquiridas; ?></td>
                <td><?php echo $bolsa->numero_sachets; ?></td>
                <td><?php echo $bolsa->cantidad_minima; ?></td>
                <td><?php echo $bolsa->precio_compra_unidad; ?></td>
                <td>
                    <form method="post" id="addtore<?php echo $bolsa->id_bolsas; ?>">
                        <div class="row">
                            <div class="col-md-4">
                                <input type="hidden" name="bolsa_id" value="<?php echo $bolsa->id_bolsas; ?>">
                                <input type="text" class="form-control" required name="q" id="re_q<?php echo $bolsa->id_bolsas; ?>" placeholder="Cantidad ...">
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-ok"></i> Agregar</button>
                            </div>
                        </div>
                    </form>
                </td>
            </tr>
            <script>
                $("#addtore<?php echo $bolsa->id_bolsas; ?>").on("submit", function(e){
                    e.preventDefault();
                    $.post("./?view=addtorebolsas", $("#addtore<?php echo $bolsa->id_bolsas; ?>").serialize(), function(data){
                        $.get("./?action=cartofrebolsas", null, function(data2){
                            $("#cartofre").html(data2);
                        });
                    });
                    $("#re_q<?php echo $bolsa->id_bolsas; ?>").val("");
                });
            </script>
            <?php endforeach; ?>
        </table>
    </div>
    <?php
    }
    ?>
<?php else: ?>
<?php endif; ?>
