<?php
namespace Dao\Mnt;

use Dao\Table;

class Historial extends Table
{
  

    public static function obtenerHistorialCliente($usercod)
    {
        
        $sqlStr = "SELECT * from clienteproducto where usercod = :usercod;";
        
        $resultado = self::obtenerRegistros($sqlStr, array("usercod"=>intval($usercod)));
        
        //dd($resultado);
        
        return $resultado;
    }
    
    
}

?>
