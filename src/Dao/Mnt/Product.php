<?php
namespace Dao\Mnt;

use Dao\Table;

class Product extends Table{ 
    
    public static function getProduct($id){
        $sqlStr = "SELECT * FROM products WHERE id =:id;";
        return self::obtenerUnRegistro($sqlStr,array("id"=>$id));
    }

    //Inserta en el carrito
    public static function addToCart($name, $price){
        $sqlStr = "INSERT INTO carrito (
            name, price
        )
        VALUES (
            :name, :price
        );";
        $parametros = array(
            "name" => $name,
            "price" => doubleval($price)
        );
        return self::executeNonQuery($sqlStr, $parametros);
    }
}
?>