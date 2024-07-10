<?php

if (!isset($_SESSION["reabastecer_bolsas"])) {

    $bolsa = array(
        "bolsa_id" => $_POST["bolsa_id"],
        "q" => $_POST["q"],
        "precio_compra_unidad" => $_POST["precio_compra_unidad"]
    );
    $_SESSION["reabastecer_bolsas"] = array($bolsa);

    $cart = $_SESSION["reabastecer_bolsas"];
    $process = true;

} else {

    $found = false;
    $cart = $_SESSION["reabastecer_bolsas"];
    $index = 0;

    $can = true;

    if ($can == true) {
        foreach ($cart as $c) {
            if ($c["bolsa_id"] == $_POST["bolsa_id"]) {
                echo "found";
                $found = true;
                break;
            }
            $index++;
        }

        if ($found == true) {
            $q1 = $cart[$index]["q"];
            $q2 = $_POST["q"];
            $cart[$index]["q"] = $q1 + $q2;
            $_SESSION["reabastecer_bolsas"] = $cart;
        }

        if ($found == false) {
            $nc = count($cart);
            $bolsa = array(
                "bolsa_id" => $_POST["bolsa_id"],
                "q" => $_POST["q"],
                "precio_compra_unidad" => $_POST["precio_compra_unidad"]
            );
            $cart[$nc] = $bolsa;
            $_SESSION["reabastecer_bolsas"] = $cart;
        }
    }
}

print "<script>window.location='index.php?view=rem';</script>";

?>
