<?php

class Executor {

	public static function doit($sql){
		$con = Database::getCon();
		if(Core::$debug_sql){
			print "<pre>".$sql."</pre>";
		}
		return array($con->query($sql),$con->insert_id);
	}
	
	public static function select_count($sql){
		$con = Database::getCon();
		$result = mysqli_query($con, $sql);
        if($result->num_rows>0){
            
           while($fila=$result->fetch_assoc()){
               $item_1 = $fila["encontrado"];
           }
           return $item_1;
        }
        else{
            return 0;
        }
	}
}
?>