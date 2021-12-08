<?php

namespace Controllers;

use Controllers\PublicController;

class Products extends PublicController
{
    public function run():void{

        $viewData = array();

        /* $products = array(
            array(
                "id" => 1,
                "name" => "Mentolina Lata 12g, 1 de 12",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "description" => "Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto",
                "price" => 22.53
            ),
            array(
                "id" => 2,
                "name" => "Mentolina Sport, tarro 60g",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/18968/imagen",
                "description" => "Eucalipto, Mentol, alicilato de metilo, Alcanfor",
                "price" => 110.75
            ),
            array(
                "id" => 3,
                "name" => "Mentolina Lata 12g, 1 de 12",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "description" => "Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto",
                "price" => 22.53
            ),
            array(
                "id" => 4,
                "name" => "Mentolina Lata 12g, 1 de 12",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "description" => "Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto",
                "price" => 22.53
            ),
            array(
                "id" => 5,
                "name" => "Mentolina Lata 12g, 1 de 12",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "description" => "Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto",
                "price" => 22.53
            ),
            array(
                "id" => 6,
                "name" => "Mentolina Lata 12g, 1 de 12",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "description" => "Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto",
                "price" => 22.53
            ),
            array(
                "id" => 7,
                "name" => "Mentolina Lata 12g, 1 de 12",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "description" => "Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto",
                "price" => 22.53
            ),
            array(
                "id" => 8,
                "name" => "Mentolina Lata 12g, 1 de 12",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "description" => "Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto",
                "price" => 22.53
            ),
            array(
                "id" => 9,
                "name" => "Mentolina Lata 12g, 1 de 12",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "description" => "Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto",
                "price" => 22.53
            ),
            array(
                "id" => 10,
                "name" => "Mentolina Lata 12g, 1 de 12",
                "provider" => "Infarma",
                "img" => "https://apis.ccc-it.net/api/v1/producto/16945/imagen",
                "description" => "Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto",
                "price" => 22.53
            ),
        ); */
        if(isset($_GET["search"]))
        {
            $search = $_GET["search"];
            $products = \Dao\Mnt\Products::searchProducts($search);

            $viewData["products"] = $products;
            $viewData["search"] = $search;
        }

        \Views\Renderer::render("products/search",$viewData);
    }
}

?>