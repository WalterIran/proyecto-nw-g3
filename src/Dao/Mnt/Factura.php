<?php
namespace Dao\Mnt;

use Dao\Table;

class Factura extends Table{ 

    public static function insertFactura($uid){

        $sqlStr = "INSERT INTO factura (userid, date, isv) 
        VALUES (:uid, NOW(), 0.15);";

        $parametros = array(
            "uid" => $uid
        );

        return self::executeNonQuery($sqlStr, $parametros);
    }

    public static function getLastFactura($uid){
        $sqlStr = "SELECT * FROM factura 
        WHERE userid = :uid 
        order by date desc
        LIMIT 1;";

        $parametros = array(
            "uid" => $uid
        );

        return self::obtenerUnRegistro($sqlStr, $parametros);
    }

    public static function insertDetalleFactura($uid, $facturaId){
        $sqlStr = "INSERT INTO detalle_factura (facturaId, prdId, price, cant)
        SELECT :facturaId as facturaId, prdId, price, cant FROM cart WHERE userid = :uid;";

        $parametros = array(
            "facturaId" => $facturaId,
            "uid" => $uid
        );

        return self::executeNonQuery($sqlStr, $parametros);
    }

    public static function changeStock($prdId, $cant){
        $sqlStr = "UPDATE products
        SET prdStock = prdStock - :cant
        WHERE id = :prdId;";

        $parametros = array(
            "cant" => $cant,
            "prdId" => $prdId
        );

        return self::executeNonQuery($sqlStr, $parametros);
    }

    public static function deleteCart($uid){
        $sqlStr = "DELETE FROM cart WHERE userid = :uid;";

        $parametros = array(
            "uid" => $uid
        );

        return self::executeNonQuery($sqlStr, $parametros);
    }

}
?>