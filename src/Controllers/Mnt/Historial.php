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
        $user = $_SESSION['login']['userId'];

        $tmp = \Dao\Mnt\Historial::obtenerHistorialCliente($user);
        //dd($tmp);
        $viewData["ListaProductosCliente"] = \Dao\Mnt\Historial::obtenerHistorialCliente($user);

        \Views\Renderer::render("mnt/historial", $viewData);
    }
}