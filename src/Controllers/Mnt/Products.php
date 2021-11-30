<?php
namespace Controllers\Mnt;

use Controllers\PrivateController;
//use Controllers\PublicController;

class Products extends PrivateController {
    public function run(): void
    {
        $viewData = array();
        $viewData["product"] = \Dao\Mnt\Products::getProducts();
        $viewData["CanInsert"] = self::isFeatureAutorized("Controllers\Mnt\Product\New");
        $viewData["CanUpdate"] = self::isFeatureAutorized("Controllers\Mnt\Product\Upd");
        $viewData["CanDelete"] = self::isFeatureAutorized("Controllers\Mnt\Product\Del");
        $viewData["CanView"] = self::isFeatureAutorized("Controllers\Mnt\Product\Dsp");

        \Views\Renderer::render("mnt/products", $viewData);

        //PublicController
        /*
        $viewData = array();
        $viewData["product"] = \Dao\Mnt\Products::getProducts();
        $viewData["CanInsert"] = true;
        $viewData["CanUpdate"] = true;
        $viewData["CanDelete"] = true;

        \Views\Renderer::render("mnt/products", $viewData);*/
    }
}

?>