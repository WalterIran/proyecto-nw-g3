<?php
namespace Dao\Mnt;

use Dao\Table;

class Product extends Table{ 
    
    public static function getProduct($id){
        $sqlStr = "SELECT * FROM products WHERE id =:id;";
        return self::obtenerUnRegistro($sqlStr,array("id"=>$id));
    }

    private static function getUserIdLabel($table){
        if($table == 'tmp_cart')
        {
            return 'tmpuserid';
        }else{
            return 'userid';
        }
    }
    
    public static function transferCartLogin($tmpId, $userId){
        $sqlStr = "INSERT IGNORE INTO cart (userid, prdId, date, price, cant)
        SELECT 
        (:userid) as userid,
        prdId, 
        date, 
        price, 
        cant FROM tmp_cart WHERE tmpuserid = :tmpId;
        DELETE FROM tmp_cart WHERE tmpuserid = :tmpId;";

        $parametros = array(
            "userid" => $userId,
             "tmpId" => $tmpId
        );

        return self::executeNonQuery($sqlStr, $parametros);
    }

    public static function getCart($table, $uid){
        $identifier = self::getUserIdLabel($table);
        $sqlStr = "SELECT * FROM $table WHERE $identifier = :uid";
        $parametros = array(
            "uid" => $uid
        );

        return self::obtenerRegistros($sqlStr, $parametros);
    }

    //Inserta en el carrito
    public static function addToCart($table, $uid, $prdId, $price){

        $identifier = self::getUserIdLabel($table);

        $sqlStr = "INSERT IGNORE INTO $table (
            $identifier, prdId, date, price, cant
        )
        VALUES (
            :uid, :prdId, NOW(), :price, 1
        );";
        $parametros = array(
            "uid" => $uid,
            "prdId" => $prdId,
            "price" => doubleval($price)
        );
        
        return self::executeNonQuery($sqlStr, $parametros);
    }

    public static function getAvailableStock($prdId){
        $sqlStr = "SELECT ((SELECT prdStock FROM products WHERE id = :prdId) - ((SELECT IFNULL((SELECT SUM(cant) FROM cart WHERE prdId = :prdId),0)) + (SELECT IFNULL((SELECT SUM(cant) FROM tmp_cart WHERE prdId = :prdId),0)))) as available; ";
        
        $parametros = array(
            'prdId' => $prdId
        );

        return self::obtenerUnRegistro($sqlStr, $parametros);
    }

    public static function updatePrdCart($table, $uid, $prdId, $operation){

        $identifier = self::getUserIdLabel($table);

        if($table == 'cart'){
            $otherTable = 'tmp_cart';
        }else{
            $otherTable = 'cart';
        }

        $validationQuery = "IF(((SELECT prdStock FROM products WHERE id = :prdId) - (cant + (SELECT IFNULL((SELECT SUM(cant) FROM $otherTable WHERE prdId = :prdId), 0))) > 0), true, false)";

        if($operation == 'SUM'){
            $sqlStr = "UPDATE $table
            SET 
            cant = cant + 1
            WHERE $identifier = :uid AND prdId = :prdId AND $validationQuery;";
        }else if($operation == 'SUB'){
            $sqlStr = "UPDATE $table 
            SET 
            cant = cant - 1
            WHERE $identifier = :uid AND prdId = :prdId AND cant > 1";
        }

        $parametros = array(
            "uid" => $uid,
            "prdId" => $prdId
        );
        
        return self::executeNonQuery($sqlStr, $parametros);
    }

    public static function deletePrdCart($table, $uid, $prdId){
        $identifier = self::getUserIdLabel($table);
        $sqlStr = "DELETE FROM $table WHERE $identifier = :uid AND prdId = :prdId;";

        $parametros = array(
            "uid" => $uid,
            "prdId" => $prdId
        );

        return self::executeNonQuery($sqlStr, $parametros);
    }
}
?>