<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
class Accept extends PublicController{
    public function run():void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        if ($token !== "" && $token == $session_token) {
            $result = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
            $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
            
            $uid = $_SESSION['login']['userId'];

            \Dao\Mnt\Factura::insertFactura($uid);

            $facturaInfo = \Dao\Mnt\Factura::getLastFactura($uid);

            \Dao\Mnt\Factura::insertDetalleFactura($uid, $facturaInfo['id']);

            $cartPrds = \Dao\Mnt\Product::getCart('cart', $uid);

            foreach($cartPrds as $prd){
                \Dao\Mnt\Factura::changeStock($prd['prdId'], $prd['cant']);
            }

            \Dao\Mnt\Factura::deleteCart($uid);

        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }
        \Views\Renderer::render("paypal/accept", $dataview);
    }
}

?>
