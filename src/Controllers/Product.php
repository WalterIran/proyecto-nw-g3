<?php

namespace Controllers;

use Controllers\PublicController;
use Utilities\Site;
use Views\Renderer;

class Product extends PublicController
{
    private function nope()
    {
        Site::redirectToWithMsg("index.php?page=products", "Ocurrio algo inesperado. Intente nuevamente");
    }

    private function yeah($message)
    {
        Site::redirectToWithMsg("index.php?page=products", $message);
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
            $viewData["mode"] = $_POST["mode"];
            $viewData["id"] = $_POST["id"];
            $viewData["name"] = $_POST["name"];
            $viewData["provider"] = $_POST["provider"];
            $viewData["img"] = $_POST["img"];
            $viewData["description"] = $_POST["description"];
            $viewData["price"] = $_POST["price"];
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
            if (\Dao\Mnt\Product::addToCart($viewData["name"], $viewData["price"])) {
                $this->yeah("Producto agregado éxitosamente.");
            }
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
