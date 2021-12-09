<?php

namespace Controllers;

use Controllers\PublicController;

class Cart extends PublicController
{
    private function nope($message)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=cart",
            $message
        );
    }

    public function run():void{
        $viewData = array();
        
        if(isset($_SESSION['login']) && $_SESSION['login']['isLogged'] == true){
            $table = 'cart';
            $user = $_SESSION['login']['userId'];
        }else{
            $table = 'tmp_cart';
            $user = $_SESSION['tmpuserid'];
        }

        if($this->isPostBack()){
            
            if(isset($_POST['btnAdd'])){
                $available = \Dao\Mnt\Product::getAvailableStock($_POST['id']);
                if($available['available'] > 0){
                    \Dao\Mnt\Product::updatePrdCart($table, $user, $_POST['id'], 'SUM');
                }else{
                    $this->nope("No hay más de este producto, producto agotado");
                }
            }else if(isset($_POST['btnSubtract'])){
                if($_POST['cant'] > 1){
                    \Dao\Mnt\Product::updatePrdCart($table, $user, $_POST['id'], 'SUB');
                }else{
                    $this->nope("No se puede dejar la cantidad en 0, prueba a eliminar el producto de tu carrito");
                }
            }else if(isset($_POST['btnDelete'])){
                \Dao\Mnt\Product::deletePrdCart($table, $user, $_POST['id']);
            }
        }

        $items = \Dao\Mnt\Product::getCart($table, $user);

        $total = 0;

        foreach ($items as &$item){
            $prdInfo = \Dao\Mnt\Product::getProduct($item['prdId']);
            $item += ['img' => $prdInfo['img'], 'provider' => $prdInfo['provider'], 'name' => $prdInfo['name'], 'id' => $prdInfo['id']];
            $item['subtot'] = $item['price'] * $item['cant'];
            $total += $item["subtot"];
            unset($item);
        }

        $viewData["items"] = $items;
        $viewData["itemCount"] = count($items);
        $viewData["total"] = $total;

        \Views\Renderer::render("products/cart",$viewData);
    }

}
?>