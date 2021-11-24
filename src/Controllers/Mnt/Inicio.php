<?php
namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Inicio extends PublicController{
    public function run(): void
    {
        $viewData=array();
        Renderer::render("mnt/inicio", $viewData);
    }
}
?>