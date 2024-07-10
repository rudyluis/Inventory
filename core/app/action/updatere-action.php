<?php

$sell = SellData::getById($_POST["id"]);
//$sell->invoice_code  =$_POST["invoice_code"];
$sell->person_id=$_POST["client_id"]!=""?$_POST["client_id"]:"NULL";
$sell->f_id = $_POST["f_id"];

$sell->comment  =$_POST["comment"];
///
$fecha=$_POST['fecha'];
if($sell->p_id==4){
	$total_pagado=$_POST['total_pagado']+$_POST['pagar'];
	$saldo=$sell->total-$total_pagado;
	$sell->comment  =$_POST["comment"].chr(13)."[Pago Bs.".$_POST['pagar']."--->Saldo Bs.".$saldo." en Fecha:".$fecha." Recibo:".$_POST["invoice_code"]."]" ;

	$sell->cash=$sell->cash+$_POST['pagar'];

}
else{
	$sell->invoice_code  =$_POST["invoice_code"];
}

//var_dump($sell);exit;
///
$sell->invoice_file = "";
  if(isset($_FILES["invoice_file"])){
    $image = new Upload($_FILES["invoice_file"]);
    if($image->uploaded){
      $image->Process("storage/invoice_files/");
      if($image->processed){
        $sell->invoice_file = $image->file_dst_name;
      }
    }
  }

$sell->update();

Core::redir("./?view=onere&id=".$_POST["id"]);
?>