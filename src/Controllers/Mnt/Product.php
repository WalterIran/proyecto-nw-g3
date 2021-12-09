<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Utilities\Site;
use Views\Renderer;


class Product extends PublicController{

    private function nope(){
        Site::redirectToWithMsg("index.php?page=mnt_products","Ocurrio algo inesperado. Intente nuevamente");
    }

    private function yeah($message){
        Site::redirectToWithMsg("index.php?page=mnt_products",$message);
    }

    public function run(): void
    {
        $viewData = array(
            "mode_dsc"=>"",
            "mode"=>"",
            "id"=>"",
            "name"=>"",
            "provider" =>"",
            "img"=>"",
            "description"=>"",
            "price"=>"",
            "prdStock"=>"",
            "hasErrors"=>false,
            "Errors"=>array(),
            "showaction"=>true,
            "readonly"=>false,
            "isINS" => false,
            "isDEL" => false,
        );

        $modeDscArr = array(
            "INS" => "Nuevo Producto",
            "UPD" => "Editando Producto (%s) ",
            "DEL" => "Eliminando Producto (%s) ",
            "DSP" => "Detalle de  Producto (%s) ",
        );

        if($this->isPostBack()){
            $viewData["mode"]= $_POST["mode"];
            $viewData["id"]= $_POST["id"];
            $viewData["name"]= $_POST["name"];
            $viewData["provider"]= $_POST["provider"];
            $viewData["img"]= $_POST["img"];
            $viewData["description"]= $_POST["description"];
            $viewData["price"]= $_POST["price"];
            $viewData["prdStock"] = $_POST["prdStock"];
            //dd($_POST);

            //Pediente hacer validaciones
            //Validaciones aqui

            if(!$viewData["hasErrors"]){
                switch($viewData["mode"])
                {
                    case "INS":
                            if(\Dao\Mnt\Products::createProduct($viewData["name"], $viewData["provider"], $viewData["img"], $viewData["description"], $viewData["price"], $viewData["prdStock"]))
                            {
                                $this->yeah("Producto agregado éxitosamente.");
                            }
                    break;
                    case "UPD":
                        if(\Dao\Mnt\Products::updateProduct($viewData["name"], $viewData["provider"], $viewData["img"], $viewData["description"], $viewData["price"], $viewData["prdStock"], $viewData["id"]))
                            {
                                $this->yeah("Producto actualizado éxitosamente.");
                            }
                    break;
                    case "DEL":
                        if(\Dao\Mnt\Products::deleteProduct($viewData["id"]))
                            {
                                $this->yeah("Producto eliminado éxitosamente.");
                            }
                    break;  
                }
            }
        } else {
            if(isset($_GET["mode"])){
                if(!isset($modeDscArr[$_GET["mode"]]))
                {
                    $this->nope();
                }
                $viewData["mode"]=$_GET["mode"];

            }
            else{
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

        if($viewData["mode"]=="INS"){
            $viewData["mode_dsc"] = $modeDscArr["INS"];
            $viewData["isINS"] = true;
        }
        else
        {
            $tmpProduct = \Dao\Mnt\Products::getProduct($viewData["id"]);
            
            /*print_r($tmpProduct);
            die();*/
            
            $viewData["id"]= $tmpProduct["id"];
            $viewData["name"]= $tmpProduct["name"];
            $viewData["provider"]= $tmpProduct["provider"];
            $viewData["description"]= $tmpProduct["description"];
            $viewData["img"]= $tmpProduct["img"];
            $viewData["price"]= $tmpProduct["price"];
            $viewData["prdStock"] = $tmpProduct["prdStock"];

            $viewData["mode_dsc"] = sprintf($modeDscArr[$viewData["mode"]], $viewData["id"], $viewData["name"], $viewData["provider"], $viewData["description"], $viewData["img"], $viewData["price"], $viewData["prdStock"]);
            if($viewData["mode"]=="DSP"){
                $viewData["showaction"]=false;
                $viewData["readonly"]="readonly";
            }

            if($viewData["mode"]=="DEL"){
                $viewData["isDEL"] = true;
                $viewData["readonly"]="readonly";
            }
        }
        Renderer::render("mnt/product",$viewData);
    }
}
?>