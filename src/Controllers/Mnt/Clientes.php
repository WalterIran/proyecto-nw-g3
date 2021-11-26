<?php

namespace Controllers\Mnt;
use Views\Renderer;


use Controllers\PrivateController;
//use Controllers\PublicController;

class Clientes extends PrivateController{
    public function run():void
    {
        \Utilities\Site::addLink("public/css/clientes.css");
        $viewData = array();
        $viewData["ListaClientes"] = \Dao\Mnt\Clientes::obtenerClientes();
/*
        $viewData["CanInsert"] = true;
        $viewData["CanUpdate"] = true;
        $viewData["CanDelete"] = true;
        $viewData["CanView"] = true;
*/
      
        $viewData["CanInsert"] = self::isFeatureAutorized("Controllers\Mnt\Feature\New");
        $viewData["CanUpdate"] = self::isFeatureAutorized("Controllers\Mnt\Feature\Upd");
        $viewData["CanDelete"] = self::isFeatureAutorized("Controllers\Mnt\Feature\Del");
        $viewData["CanView"] = self::isFeatureAutorized("Controllers\Mnt\Feature\Dsp");

        \Views\Renderer::render("mnt/clientes", $viewData);
    }
}