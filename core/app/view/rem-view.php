<section class="content">
<div class="row">
    <div class="col-md-12">
        <h1>Reabastecer Inventario Materia Prima</h1>
        <p><b>Buscar producto por nombre o por codigo:</b></p>
        <form id="searchp">
            <div class="row">
                <div class="col-md-6">
                    <input type="hidden" name="view" value="re">
                    <input type="text" name="product" id="product_name" class="form-control">
                </div>
            </div> 
            <div class="row">   
                <div class="col-md-6">
                    <label for="tipo_insumo">Tipo de Insumo:</label>
                    <select id="tipo_insumo" name="tipo_insumo" class="form-control">
                        <!-- Opciones cargadas dinámicamente -->
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-search"></i> Buscar</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-12">
        <div id="show_search_results"></div>
        <script>
        $(document).ready(function(){
            $.get("./?action=searchproductre", { product: '', tipo_insumo: 1 }, function(data){
                $("#show_search_results").html(data);
            });
            /*$("#searchp").on("submit",function(e){
                e.preventDefault();
                name = $("#product_name").val();
                if(name != ""){
                    $.get("./?action=searchproductre",$("#searchp").serialize(),function(data){
                        $("#show_search_results").html(data);
                    });
                    $("#product_name").val("");
                }else{
                    $("#show_search_results").html("");
                }
            });*/
            $("#searchp").on("submit", function(e){
                e.preventDefault();
                
                // Obtener el valor del campo de entrada
                var product_name = $("#product_name").val();
                var tipo_insumo = $("#tipo_insumo").val(); // Obtener el valor del combo tipo_insumo
                // Verificar si el nombre del producto no está vacío
                //if(product_name != ""){
                    // Enviar la solicitud con el nombre del producto y tipo_insumo como parámetros
                   
                    if(tipo_insumo==1){
                        $.get("./?action=searchproductre", { product: product_name, tipo_insumo: tipo_insumo }, function(data){
                        $("#show_search_results").html(data);
                        });
                    }
                    
                    if(tipo_insumo==2)
                    {
                        $.get("./?action=searchbolsasre", { bolsa: product_name, tipo_insumo: tipo_insumo }, function(data){
                        $("#show_search_results").html(data);
                        });
                    }
                    // Limpiar el campo de entrada después de la búsqueda
                    $("#product_name").val("");
                //} else {
                 //   $("#show_search_results").html("");
               // }
            });
            // Cargar las opciones del combo al cargar la página
            $.get("./?action=listtipoinsumo", function(data){
                $("#tipo_insumo").html(data);
            });
        });
        </script>
    </div>
    <div class="col-md-12">
        <div id="cartofre"></div>
        <script>
        $(document).ready(function(){
            $.get("./?action=cartofre",null,function(data){
                $("#cartofre").html(data);
            });
        });
        </script>
    </div>
</div>
</section>
