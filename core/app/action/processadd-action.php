<?php
if ($_POST["q"] != "" && $_POST["q"] != "0") {
    if (isset($_POST["product_id"])) {
        $product = ProductData::getById($_POST["product_id"]);
        $op = new OperationData();
        $op->price_in = $product->price_in;
        $op->price_out = $product->price_out;
        $op->stock_id = $_POST["stock"];
        $op->product_id = $_POST["product_id"];
        $op->operation_type_id = 1; // 1 - entrada
        $op->sell_id = "NULL";
        $op->q = $_POST["q"];
        $add = $op->add();
    } elseif (isset($_POST["bag_id"])) {
        $bag = BolsasData::getById($_POST["bag_id"]);
        $op = new OperationData();
        $op->price_in = $bag->precio_compra_unidad;
        $op->price_out = 0; // Assuming there is no price_out for bags
        $op->stock_id = $_POST["stock"];
        $op->id_bolsa = $_POST["bag_id"];
        $op->operation_type_id = 1; // 1 - entrada
        $op->sell_id = "NULL";
        $op->q = $_POST["q"];
        $add = $op->addBolsa();
    }

    Core::redir("./?view=inventary&stock=" . $_POST["stock"]);
}
?>
