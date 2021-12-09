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
            "usercod" => "",
            "userrole" =>"",
            "userfecharegistro" => "",
            "username" => "",
            "userpswd" => "",
            "userpswdrpt" => "",
            "userest" => "",
            "usergender" => "",
            "useraddress" => "",
            "userphone" => "",
            "userphone2" => "",
            "useremail" => "",
            "userbio" => "",
            "hasErrors" => false,
            "errorEmail" => "",
            "errorPswd" => "",
            "errorPass" =>  "",
            "errorName" => "",
            "errorPhone" => "",
            "errorAddress" => "",
            "Errors" => array(),
            "showaction"=>true,
            "readonly" => false
        );
        $modeDscArr = array(
            "INS" => "Nuevo Usuario",
            "UPD" => "Editando Usuario  %s",
            "DEL" => "Eliminando Usuario  %s",
            "DSP" => "Detalle de Usuario  %s"
        );

        if ($this->isPostBack()) {
            
            // se ejecuta al dar click sobre guardar
            $viewData["mode"] = $_POST["mode"];
            $viewData["usercod"] = $_POST["usercod"] ;
            $viewData["userrole"] = $_POST["userrole"];
            $viewData["username"] = $_POST["username"] ;
            $viewData["userpswd"] = $_POST["userpswd"];
            $viewData["userpswdrpt"] = $_POST["userpswdrpt"];
            $viewData["userest"] = $_POST["userest"];
            $viewData["usergender"] = $_POST["usergender"] ;
            $viewData["useraddress"] = $_POST["useraddress"];
            $viewData["userphone"] = $_POST["userphone"];
            $viewData["userphone2"] = $_POST["userphone2"];
            $viewData["useremail"] = $_POST["useremail"];
            $viewData["userbio"] = $_POST["userbio"];
            
            
            // Validaciones de Errores
            if (!\Utilities\Validators::IsValidEmail($viewData["useremail"])) {
                $viewData["errorEmail"] = "¡Debe ingresar un correo valido!";
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = '¡Debe ingresar su correo!';
            }
            if (\Utilities\Validators::IsEmpty($viewData['username'])) {
                $viewData["errorName"] = "¡Debe ingresar su nombre!";
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = '¡Debe ingresar su nombre!';
            }
            if (\Utilities\Validators::IsEmpty($viewData['userphone'])) {
                $viewData["errorPhone"] = "¡Debe ingresar su numero!";
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = '¡Debe ingresar su numero!';
            }
            if (\Utilities\Validators::IsEmpty($viewData['useraddress'])) {
                $viewData["errorAddress"] = "¡Debe ingresar su dirección!";
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = '¡Debe ingresar su dirección!';
            }

            if (!\Utilities\Validators::IsValidPassword($viewData["userpswd"]) && $viewData["mode"] != "DEL") {
                $viewData["errorPswd"] = "Contraseña debe ser almenos 8 caracteres, 1 número, 1 mayúscula, 1 símbolo especial";
            }
            //dd($viewData);
            if ($viewData["userpswdrpt"] != $viewData["userpswd"]) {
                $viewData["hasErrors"] = true;
                $viewData["errorPass"] = 'Constraseña no coincide.';
                $viewData["Errors"][] = 'Constraseña no coincide.';
            } 

            //dd("SIN ERRORES");
            if (!$viewData["hasErrors"]) {
                switch($viewData["mode"]) {
                case "INS":
                    $verUsuario = \Dao\Mnt\Usuarios::getOneUsuario($viewData['usercod']);
                        
                        if (!$verUsuario) {
                            if ($dbUser = \Dao\Security\Security::getUsuarioByEmail($viewData["useremail"])) {
                                $viewData["errorEmail"] = "El correo ya esta vinculado a otra cuenta.";
                                $viewData["hasErrors"] = true;
                                $viewData["Errors"][] = 'Correo invalido';
                            }
                            else
                            {
                                if (\Dao\Security\Security::newUsuario(
                                    $viewData['useremail'], 
                                    $viewData['userpswd'], 
                                    $viewData['username'], 
                                    $viewData['userphone'], 
                                    $viewData['userphone2'], 
                                    $viewData['useraddress'], 
                                    $viewData["userbio"], 
                                    $viewData['usergender'])) {
                                    $this->yeah();
                                }
                                else
                                {
                                    
                                }
                                
                            }
                        } 
                        else
                        {
                            $viewData["hasErrors"] = true;
                            $viewData["errorUser"] = "El usuario ya existe.";
                        }

                    
                    
                    break;
                case "UPD":

                    //dd($viewData);
                    if (\Dao\Mnt\Clientes::editarCliente(
                        $viewData["username"],
                        $viewData["usergender"],
                        $viewData["userphone"],
                        $viewData["userphone2"],
                        $viewData["useremail"],
                        $viewData["useraddress"],
                        $viewData["userbio"],
                        $viewData["userest"],
                        $viewData["userrole"],
                        $viewData['userpswd'],
                        $viewData["usercod"],
                        
                    )
                    ) {
                        //dd("AQUI BIEN");
                        $this->yeah();
                    }
                    else{
                        dd("ERROR ELSE");
                    } 
                    break;
                case "DEL":
                    if (\Dao\Mnt\Clientes::eliminarCliente(
                        $viewData["usercod"]
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
            
            if (isset($_GET["usercod"])) {
                $viewData["usercod"] = $_GET["usercod"];
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
            
            $tmpCliente = \Dao\Mnt\Clientes::obtenerCliente($viewData["usercod"]);
            
            //dd($tmpCliente);
            $viewData["username"] = $tmpCliente["username"];
            $viewData["useraddress"] = $tmpCliente["useraddress"];
            $viewData["userpswd"] = $tmpCliente["userpswd"];
            $viewData["userphone"] = $tmpCliente["userphone"];
            $viewData["userphone2"] = $tmpCliente["userphone2"];
            $viewData["useremail"] = $tmpCliente["useremail"];
            $viewData["userbio"] = $tmpCliente["userbio"];
            
            
            $viewData["userest_ACT"] = $tmpCliente["userest"] == "ACT" ? "selected": "";
            $viewData["userest_INA"] = $tmpCliente["userest"] == "INA" ? "selected" : "";
            $viewData["userest_BLQ"] = $tmpCliente["userest"] == "BLQ" ? "selected" : "";
            $viewData["userest_SUS"] = $tmpCliente["userest"] == "SUS" ? "selected" : "";

            $viewData["userrol_PBL"] = $tmpCliente["userrole"] == "PBL" ? "selected": "";
            $viewData["userrol_ADMIN"] = $tmpCliente["userrole"] == "ADM" ? "selected" : "";
            $viewData["userrol_AUD"] = $tmpCliente["userrole"] == "AUD" ? "selected" : "";

            $viewData["usergen_MAS"] = $tmpCliente["usergender"] == "M" ? "selected": "";
            $viewData["usergen_FEM"] = $tmpCliente["usergender"] == "F" ? "selected" : "";
            
            
            $viewData["mode_dsc"]  = sprintf(
                $modeDscArr[$viewData["mode"]],
                $viewData["username"]
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
