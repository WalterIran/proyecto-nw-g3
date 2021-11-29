<?php

namespace Controllers;

use Controllers\PublicController;

class Cart extends PublicController
{
    public function run():void{
        $viewData = array();

        $items = array(
            array(
                "id" => 1,
                "name" => "Mentolina Sport, tarro 60g",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "price" => 22.53,
                "cant" => 2,
                "subtot" => 45.06
            ),
            
        );

        $total = 0;

        foreach ($items as $item){
            $total += $item["subtot"];
        }

        $viewData["items"] = $items;
        $viewData["itemCount"] = count($items);
        $viewData["total"] = $total;

        \Views\Renderer::render("products/cart",$viewData);
    }

}
?>