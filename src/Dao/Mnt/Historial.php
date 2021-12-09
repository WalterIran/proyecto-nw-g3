<?php
namespace Dao\Mnt;

use Dao\Table;

class Historial extends Table
{
  

    public static function obtenerHistorialCliente($userid)
    {
        
        $sqlStr = "SELECT DATE(f.date) as date, p.name, df.cant, df.price, ROUND(df.cant * df.price *1.15,2) as total 
            from factura as f 
            inner join detalle_factura as df on f.id = df.facturaId  
            inner join products as p on p.id = df.prdId 
            where userid = :userid;";

        $parametros = array(
            "userid" => intval($userid)
        );
        
        $resultado = self::obtenerRegistros($sqlStr, $parametros);
        
        //dd($resultado);
        
        return $resultado;
    }
    
    
}

?>
