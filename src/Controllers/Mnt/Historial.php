<?php

namespace Controllers\Mnt;
use Views\Renderer;


use Controllers\PrivateController;
//use Controllers\PublicController;

class Historial extends PrivateController{
    public function run():void
    {
        \Utilities\Site::addLink("public/css/clientes.css");
        $viewData = array("userid" => "");

        if (isset($_GET["userid"])) {
            $viewData["userid"] = $_GET["userid"];
            
        } 
        
        $tmp = \Dao\Mnt\Historial::obtenerHistorialCliente($viewData["userid"]);
        //dd($tmp);
        $viewData["ListaProductosCliente"] = \Dao\Mnt\Historial::obtenerHistorialCliente($viewData["userid"]);

        \Views\Renderer::render("mnt/historial", $viewData);
    }
}