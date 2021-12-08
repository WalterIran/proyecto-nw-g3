<?php

namespace Controllers;

use Controllers\PublicController;

class Cart extends PublicController
{
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
                \Dao\Mnt\Product::updatePrdCart($table, $user, $_POST['id'], 'SUM');
            }else if(isset($_POST['btnSubtract'])){
                \Dao\Mnt\Product::updatePrdCart($table, $user, $_POST['id'], 'SUB');
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
        }

        $viewData["items"] = $items;
        $viewData["itemCount"] = count($items);
        $viewData["total"] = $total;

        \Views\Renderer::render("products/cart",$viewData);
    }

}
?>