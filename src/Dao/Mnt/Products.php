<?php
namespace Dao\Mnt;

use Dao\Table;

class Products extends Table{
    public static function getProducts(){
        $sqlStr = "SELECT * FROM products;";
        return self::obtenerRegistros($sqlStr, array());
    }

    public static function searchProducts($text ){
        $text = substr_replace($text, '%', 0,0);
        $text = substr_replace($text, '%', strlen($text), 0);

        $sqlStr = "SELECT * FROM products WHERE name LIKE :text OR description LIKE :text;";
        $parametros = array(
            "text" => $text
        );
        
        return self::obtenerRegistros($sqlStr, $parametros);
    }

    //C - Create
    public static function createProduct($name, $provider, $img, $description, $price, $prdStock){
        $sqlStr = "INSERT INTO products (
            name, provider, img, description, price, prdStock
        )
        VALUES (
            :name, :provider, :img, :description, :price, :prdStock
        );";
        $parametros = array(
            "name" => $name, 
            "provider" => $provider, 
            "img" => $img, 
            "description" => $description, 
            "price" => doubleval($price),
            "prdStock" => intval($prdStock)
        );
        return self::executeNonQuery($sqlStr, $parametros);
    }

    //R - Read
    public static function getProduct($id){
        $sqlStr = "SELECT * FROM products WHERE id =:id;";
        return self::obtenerUnRegistro($sqlStr,array("id"=>$id));
    }

    //U - Update
    public static function updateProduct($name, $provider, $img, $description, $price, $prdStock, $id){
        $sqlStr = "UPDATE products 
        SET name = :name, provider = :provider, img = :img, description = :description, price = :price, prdStock = :prdStock
        WHERE id = :id;";
        $parametros = array(
            "name" => $name, 
            "provider" => $provider, 
            "img" => $img, 
            "description" => $description, 
            "price" => doubleval($price),
            "prdStock" => intval($prdStock),
            "id" => intval($id)
        );
        return self::executeNonQuery($sqlStr, $parametros);
    }

    //D - Delete
    public static function deleteProduct($id){
        $sqlStr = "DELETE FROM products WHERE id =:id;";
        $parametros = array(
            "id" => intval($id)
        );
        return self::executeNonQuery($sqlStr, $parametros);
    }
}
?>