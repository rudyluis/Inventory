<?php
error_reporting(0);
if(count($_POST)>0){
  $product = new ProductData();
  $product->kind = $_POST["kind"];
  $product->code = $_POST["code"];
  $product->barcode = $_POST["barcode"];
  $product->name = $_POST["name"];
  $product->price_in = $_POST["price_in"];
  $product->price_out = $_POST["price_out"];
  $product->unit = $_POST["unit"];
  $product->description = $_POST["description"];
  $product->presentation = $_POST["presentation"];

  $product->width = $_POST["width"];
  $product->height = $_POST["height"];
  $product->weight = $_POST["weight"];

  $product->expire_at = $_POST["expire_at"];
  //$product->inventary_min = $_POST["inventary_min"];

  $product->brand_id=$_POST["brand_id"]!=""?$_POST["brand_id"]:"NULL";
  $product->category_id=$_POST["category_id"]!=""?$_POST["category_id"]:"NULL";
  $product->inventary_min=$_POST["inventary_min"]!=""?$_POST["inventary_min"]:"100000";

//  $product->category_id=$category_id;
//  $product->inventary_min=$inventary_min;
  $product->user_id = $_SESSION["user_id"];


  if(isset($_FILES["image"])){
    $image = new Upload($_FILES["image"]);
    if($image->uploaded){
      $image->Process("storage/products/");
      if($image->processed){
        $product->image = $image->file_dst_name;
      }
    }
  }

  $prod= $product->add();

//print_r($_POST);
//echo $_POST["q"];
if($_POST["kind"]=="1"){
if(isset($_POST["q"]) && ($_POST["q"]!="" || $_POST["q"]>"0")){

      $y = new YYData();
      $yy = $y->add();
      $sell = new SellData();
      $sell->ref_id= $yy[1];
      $sell->user_id = $_SESSION["user_id"];
      $sell->invoice_code = "";//$_POST["invoice_code"];
      $sell->p_id = 1;//$_POST["p_id"];
      $sell->d_id = 1;//$_POST["d_id"];
      $sell->f_id = 1;//$_POST["f_id"];
      $sell->total = $_POST["q"]*$_POST["price_in"];
      $sell->stock_to_id = StockData::getPrincipal()->id;//$_POST["stock_id"];
      $sell->person_id="NULL";

      $s = $sell->add_re();


 $op = new OperationData();
 $op->sell_id = $s[1] ;
 $op->product_id = $prod[1] ;
 $op->stock_id = StockData::getPrincipal()->id;
 $op->operation_type_id=OperationTypeData::getByName("entrada")->id;
 $op->price_in =$_POST["price_in"];
 $op->price_out= $_POST["price_out"];
 $op->q= $_POST["q"];
 //$op->sell_id="NULL";
$op->is_oficial=1;
$op->add();
}
}

 $prod_bolsa = new BolsasData();
 $tamanio_arreglo = count($_POST["producto_bolsa"]);
 if($tamanio_arreglo >= 1){
	 for($i=0; $i<=$tamanio_arreglo-1; $i++){
		 $prod_bolsa->id_producto = $prod[1];
		 $prod_bolsa->id_bolsa = $_POST["producto_bolsa"][$i];
		 $prod_bolsa->numero_sachets_utilizado = 1;
		 $prod_bolsa->id_usuario_registro = $_SESSION["user_id"];
		 $prod_bolsa->producto_bolsa_add();
	 }
	 
 }

print "<script>window.location='index.php?view=products';</script>";


}


?>