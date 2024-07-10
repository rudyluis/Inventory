<?php
class TipoInsumoData {
    public static $tablename = "tipo_insumo";

    public function TipoInsumoData(){
        $this->nombre_tipo_insumo = "";
    }

    public function add(){
        $sql = "insert into ".self::$tablename." (nombre_tipo_insumo) ";
        $sql .= "value (\"$this->nombre_tipo_insumo\")";
        return Executor::doit($sql);
    }

    public static function delById($id){
        $sql = "delete from ".self::$tablename." where id_tipo_insumo=$id";
        Executor::doit($sql);
    }

    public function del(){
        $sql = "delete from ".self::$tablename." where id_tipo_insumo=$this->id_tipo_insumo";
        Executor::doit($sql);
    }

    public function update(){
        $sql = "update ".self::$tablename." set nombre_tipo_insumo=\"$this->nombre_tipo_insumo\" where id_tipo_insumo=$this->id_tipo_insumo";
        Executor::doit($sql);
    }

    public static function getById($id){
        $sql = "select * from ".self::$tablename." where id_tipo_insumo=$id";
        $query = Executor::doit($sql);
        return Model::one($query[0],new TipoInsumoData());
    }

    public static function getAll(){
        $sql = "select * from ".self::$tablename." order by id_tipo_insumo desc";
        $query = Executor::doit($sql);
        return Model::many($query[0],new TipoInsumoData());
    }

    public static function getLike($p){
        $sql = "select * from ".self::$tablename." where nombre_tipo_insumo like '%$p%'";
        $query = Executor::doit($sql);
        return Model::many($query[0],new TipoInsumoData());
    }
}
?>
