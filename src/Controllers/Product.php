<?php

namespace Controllers;

use Controllers\PublicController;
use Utilities\Site;
use Views\Renderer;

class Product extends PublicController
{
    private function nopeWithMsg($message, $prdId)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=product&id=$prdId&mode=DSP",
            $message
        );
    }

    private function nope(){
        \Utilities\Site::redirectTo("index.php");
    }

    private function yeah($message)
    {
        Site::redirectToWithMsg("index.php?page=cart", $message);
    }

    public function run(): void
    {
        $viewData = array(
            "mode" => "",
            "id" => "",
            "name" => "",
            "provider" => "",
            "img" => "",
            "description" => "",
            "price" => "",
            "showaction" => true,
        );

        $modeDscArr = array(
            "INS" => "",
            "DSP" => ""
        );

        if ($this->isPostBack()) {

            if(isset($_SESSION['login']) && $_SESSION['login']['isLogged'] == true){
                $table = "cart";
                $user = $_SESSION['login']['userId'];
            }else{
                $table = "tmp_cart";
                $user = $_SESSION['tmpuserid'];
            }
            $available = \Dao\Mnt\Product::getAvailableStock($_POST['prdId']);
            if($available['available'] > 0){
                if (\Dao\Mnt\Product::addToCart($table, $user, $_POST['prdId'], $_POST['price'])) {
                    $this->yeah("Producto agregado éxitosamente.");
                }
            }else{
                $this->nopeWithMsg("Producto agotado", $_POST['prdId']);
            }
        } else {
            if (isset($_GET["mode"])) {
                if (!isset($modeDscArr[$_GET["mode"]])) {
                    $this->nope();
                }
                $viewData["mode"] = $_GET["mode"];
            } else {
                $this->nope();
            }

            if (isset($_GET["id"])) {
                $viewData["id"] = $_GET["id"];
            } else {
                if ($viewData["mode"] !== "INS") {
                    $this->nope();
                }
            }
        }
        
        if ($viewData["mode"] == "INS") {
            $viewData["mode_dsc"] = $modeDscArr["INS"];
            $viewData["isINS"] = true;
            
        } else {
            $tmpProduct = \Dao\Mnt\Product::getProduct($viewData["id"]);

            $viewData["id"] = $tmpProduct["id"];
            $viewData["name"] = $tmpProduct["name"];
            $viewData["provider"] = $tmpProduct["provider"];
            $viewData["description"] = $tmpProduct["description"];
            $viewData["img"] = $tmpProduct["img"];
            $viewData["price"] = $tmpProduct["price"];
        }

        Renderer::render("products/product", $viewData);
    }
}
