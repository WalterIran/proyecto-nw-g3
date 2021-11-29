<?php
namespace Controllers\Mnt;

use Controllers\PublicController;

class Cliente extends PublicController
{
    private function nope()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_clientes",
            "Ocurrió algo inesperado. Intente Nuevamente."
        );
    }
    private function yeah()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_clientes",
            "Operación ejecutada Satisfactoriamente!"
        );
    }
    public function run():void
    {
        \Utilities\Site::addLink("public/css/cliente.css");
        
        $viewData = array(
            "mode_dsc"=>"",
            "mode" => "",
            "clientid" => "",
            "clientIdnumber" => "",
            "clientdatecrt" => "",
            "clientname" => "",
            "clientstatus" => "",
            "clientgender" => "",
            "clientphone1" => "",
            "clientphone2" => "",
            "clientemail" => "",
            "clientbio" => "",
            "hasErrors" => false,
            "Errors" => array(),
            "showaction"=>true,
            "readonly" => false
        );
        $modeDscArr = array(
            "INS" => "Nuevo Cliente (%s)",
            "UPD" => "Editando Cliente  %s",
            "DEL" => "Eliminando Cliente  %s",
            "DSP" => "Detalle de Cliente  %s"
        );

        if ($this->isPostBack()) {
            // se ejecuta al dar click sobre guardar
            $viewData["mode"] = $_POST["mode"];
            $viewData["clientid"] = $_POST["clientid"] ;
            $viewData["clientIdnumber"] = $_POST["clientIdnumber"];
            $viewData["clientdatecrt"] = $_POST["clientdatecrt"];
            $viewData["clientname"] = $_POST["clientname"] ;
            $viewData["clientstatus"] = $_POST["clientstatus"];
            $viewData["clientgender"] = $_POST["clientgender"];
            $viewData["clientphone1"] = $_POST["clientphone1"] ;
            $viewData["clientphone2"] = $_POST["clientphone2"];
            $viewData["clientemail"] = $_POST["clientemail"];
            $viewData["clientbio"] = $_POST["clientbio"];

            $viewData["xsrftoken"] = $_POST["xsrftoken"];
            // Validate XSRF Token
            if (!isset($_SESSION["xsrftoken"]) || $viewData["xsrftoken"] != $_SESSION["xsrftoken"]) {
                $this->nope();
            }
            // Validaciones de Errores
            if (\Utilities\Validators::IsEmpty($viewData["clientname"])) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "El nombre no Puede Ir Vacio!";
            }
            if (($viewData["clientstatus"] == "INA"
                || $viewData["clientstatus"] == "ACT"
                
                ) == false
            ) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "Estado de Cliente Incorrecto!";
            }

            
            if (!$viewData["hasErrors"]) {
                switch($viewData["mode"]) {
                case "INS":
                    if (\Dao\Mnt\Clientes::crearCliente(
                        $viewData["clientname"],
                        $viewData["clientgender"],
                        $viewData["clientphone1"],
                        $viewData["clientphone2"],
                        $viewData["clientemail"],
                        $viewData["clientIdnumber"],
                        $viewData["clientbio"],
                        $viewData["clientstatus"],
                        $viewData["clientdatecrt"]
        
                    )
                    ) {
                        $this->yeah();
                    }
                    break;
                case "UPD":
                    if (\Dao\Mnt\Clientes::editarCliente(
                        $viewData["clientname"],
                        $viewData["clientgender"],
                        $viewData["clientphone1"],
                        $viewData["clientphone2"],
                        $viewData["clientemail"],
                        $viewData["clientIdnumber"],
                        $viewData["clientbio"],
                        $viewData["clientstatus"],
                        $viewData["clientdatecrt"],
                        $viewData["clientid"]
                    )
                    ) {
                        $this->yeah();
                    }
                    break;
                case "DEL":
                    if (\Dao\Mnt\Categorias::eliminarCategoria(
                        $viewData["catid"]
                    )
                    ) {
                        $this->yeah();
                    }
                    break;
                }
            }
        } 
        else
        {
            // se ejecuta si se refresca o viene la peticion
            // desde la lista
            if (isset($_GET["mode"])) {
                if (!isset($modeDscArr[$_GET["mode"]]))
                {
                    $this->nope();
                }
                $viewData["mode"] = $_GET["mode"];
            } 
            else {
                $this->nope();
            }
            
            if (isset($_GET["clientid"])) {
                $viewData["clientid"] = $_GET["clientid"];
            } 
            else {
                if ($viewData["mode"] !=="INS") {
                    $this->nope();
                }
            }
        }

        // Hacer elementos en comun
       
        if ($viewData["mode"] == "INS") {
            $viewData["mode_dsc"]  = $modeDscArr["INS"];
        } else {
            
            $tmpCliente = \Dao\Mnt\Clientes::obtenerCliente($viewData["clientid"]);
            
            //dd($tmpCliente);
            $viewData["clientname"] = $tmpCliente["clientname"];
            $viewData["clientIdnumber"] = $tmpCliente["clientIdnumber"];
            $viewData["clientdatecrt"] = $tmpCliente["clientdatecrt"];
            $viewData["clientname"] = $tmpCliente["clientname"];
            $viewData["clientphone1"] = $tmpCliente["clientphone1"];
            $viewData["clientphone2"] = $tmpCliente["clientphone2"];
            $viewData["clientemail"] = $tmpCliente["clientemail"];
            $viewData["clientbio"] = $tmpCliente["clientbio"];
            
            
            $viewData["cliest_ACT"] = $tmpCliente["clientstatus"] == "ACT" ? "selected": "";
            $viewData["cliest_INA"] = $tmpCliente["clientstatus"] == "INA" ? "selected" : "";
            $viewData["cligen_MAS"] = $tmpCliente["clientgender"] == "MAS" ? "selected" : "";
            $viewData["cligen_FEM"] = $tmpCliente["clientgender"] == "FEM" ? "selected" : "";

            $viewData["mode_dsc"]  = sprintf(
                $modeDscArr[$viewData["mode"]],
                $viewData["clientname"]
            );
            if ($viewData["mode"] == "DSP") {
                $viewData["showaction"]= false ;
                $viewData["readonly"] = "readonly";
            }
            if ($viewData["mode"] == "DEL") {
                $viewData["readonly"] = "readonly";
            }

        }
        // Generar un token XSRF para evitar esos ataques
        $viewData["xsrftoken"] = md5($this->name . random_int(10000, 99999));
        $_SESSION["xsrftoken"] = $viewData["xsrftoken"];

        \Views\Renderer::render("mnt/cliente", $viewData);
    }
}


?>
