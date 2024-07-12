<?php
if ($_POST["q"] != "" || $_POST["q"] != "0") {
    if (isset($_POST["product_id"])) {
        $q = OperationData::getQByStock($_POST["product_id"], $_POST["stock"]);
        if ($_POST["q"] <= $q) {
            $product = ProductData::getById($_POST["product_id"]);
            $op = new OperationData();
            $op->price_in = $product->price_in;
            $op->price_out = $product->price_out;
            $op->product_id = $_POST["product_id"];
            $op->operation_type_id = 2; // 2 - salida
            $op->stock_id = $_POST["stock"];
            $op->sell_id = "NULL";
            $op->q = $_POST["q"];

            $add = $op->add();
            Core::redir("./?view=inventary&stock=" . $_POST["stock"]);
        } else {
            Core::alert("Error!");
            Core::redir("./?view=inventarysub&product_id=" . $_POST["product_id"] . "&stock=" . $_POST["stock"]);
        }
    } elseif (isset($_POST["bag_id"])) {
        $q = OperationData::getQByBagStock($_POST["bag_id"], $_POST["stock"]);
		
        if ($_POST["q"] <= $q) {
            $bag = BolsasData::getById($_POST["bag_id"]);
            $op = new OperationData();
            $op->price_in = $bag->precio_compra_unidad;
            $op->price_out = 0; // Assuming there is no price_out for bags
            $op->id_bolsa = $_POST["bag_id"];
            $op->operation_type_id = 2; // 2 - salida
            $op->stock_id = $_POST["stock"];
            $op->sell_id = "NULL";
            $op->q = $_POST["q"];

            $add = $op->addBolsa();
            Core::redir("./?view=inventary&stock=" . $_POST["stock"]);
        } else {
            Core::alert("Error!");
            Core::redir("./?view=inventarysub&bag_id=" . $_POST["bag_id"] . "&stock=" . $_POST["stock"]);
        }
    }
}
?>
