<?php
if(isset($_GET["bolsa_id"])){
	$cart = $_SESSION["reabastecer_bolsas"];
	if(count($cart) == 1){
		unset($_SESSION["reabastecer_bolsas"]);
	} else {
		$ncart = [];
		foreach($cart as $c){
			if($c["bolsa_id"] != $_GET["bolsa_id"]){
				$ncart[] = $c;
			}
		}
		$_SESSION["reabastecer_bolsas"] = $ncart;
	}
} else {
	unset($_SESSION["reabastecer_bolsas"]);
}

print "<script>window.location='index.php?view=rebolsas';</script>";

?>
