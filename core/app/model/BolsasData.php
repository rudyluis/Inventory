<?php
class BolsasData {
    public static $tablename = "bolsas";

    public function BolsasData() {
        $this->nombre_bolsas = "";
        $this->cantidad_bolsas_adquiridas = 0;
        $this->numero_sachets = 0;
        $this->cantidad_minima = 0;
        $this->precio_compra_unidad = 0.0;
        $this->id_usuario = "";
        $this->id_usuario_modificado = "";
        $this->fecha_creado = "current_timestamp()";
        $this->estado = 1;
    }

    public function add() {
        $sql = "insert into ".self::$tablename." (nombre_bolsas, cantidad_bolsas_adquiridas, numero_sachets, cantidad_minima, precio_compra_unidad, id_usuario, id_usuario_modificado, fecha_creado, estado) ";
        $sql .= "value (\"$this->nombre_bolsas\", $this->cantidad_bolsas_adquiridas, $this->numero_sachets, $this->cantidad_minima, $this->precio_compra_unidad, $this->id_usuario, $this->id_usuario_modificado, NOW(), $this->estado)";
        return Executor::doit($sql);
    }

    public static function getLike($q) {
        $sql = "select * from ".self::$tablename." where nombre_bolsas like '%$q%' and estado=1";
        $query = Executor::doit($sql);
        return Model::many($query[0], new BolsasData());
    }

    public static function getAll() {
        $sql = "select * from ".self::$tablename." order by id_bolsas desc";
        $query = Executor::doit($sql);
        return Model::many($query[0], new BolsasData());
    }

    public static function getById($id) {
        $sql = "select * from ".self::$tablename." where id_bolsas=$id";
        $query = Executor::doit($sql);
        return Model::one($query[0], new BolsasData());
    }
	public function getStockBolsas($id_bolsa){
		$sql = "select sum(pb.numero_sachets_utilizado*ope.q)  as sachets_vendidos
				from product pro
				inner join operation ope on pro.id = ope.product_id
				inner join producto_bolsas pb on ope.product_id = pb.id_producto 
				where ope.operation_type_id = 2
				and pb.id_bolsa = $id_bolsa";
		$query = Executor::doit($sql);
		return Model::many($query[0],new BolsasData());
	}
}
?>
