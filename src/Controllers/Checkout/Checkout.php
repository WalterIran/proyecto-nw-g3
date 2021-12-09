<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController{
    public function run():void
    {
        $viewData = array();
        if(!$this->isPostBack()){
            $items = \Dao\Mnt\Product::getCart("cart", $_GET['id']);
            $viewData['id'] = $_GET['id'];
        }else{
            $items = \Dao\Mnt\Product::getCart("cart", $_POST['id']);
        }

        $total = 0;
        foreach ($items as &$item){
            $prdInfo = \Dao\Mnt\Product::getProduct($item['prdId']);
            $item += ['img' => $prdInfo['img'], 'dsc' => $prdInfo['description'], 'provider' => $prdInfo['provider'], 'name' => $prdInfo['name'], 'id' => $prdInfo['id']];
            $item['subtot'] = $item['price'] * $item['cant'];
            $total += $item["subtot"];
            unset($item);
        }

        $viewData["items"] = $items;
        $viewData["itemCount"] = count($items);
        $viewData['ISV'] = $total * 0.15;
        $viewData['total_bruto'] = $total;
        $viewData["total"] = $total + $viewData['ISV'];

        if ($this->isPostBack()) {
            
            $basedir = \Utilities\Context::getContextByKey("BASE_DIR");
            
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test".(time() - 10000000),
                "http://localhost/$basedir/index.php?page=checkout_error",
                "http://localhost/$basedir/index.php?page=checkout_accept"
            );
            
            foreach($items as $item){
                $PayPalOrder->addItem($item['name'], $item['dsc'], $item['prdId'], doubleval($item['price']), 15, intval($item['cant']), "DIGITAL_GOODS");
            }
            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die();
        }
        
        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>
