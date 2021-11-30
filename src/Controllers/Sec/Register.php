<?php

namespace Controllers\Sec;

use Controllers\PublicController;
use Views\Renderer;

class Register extends PublicController
{

    private function nope()
    {
        \Utilities\Site::redirectToWithMsg(

            "index.php",
            "Ocurrió algo inesperado. Intente Nuevamente."
        );
    }

    private function yeah()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php",
            "Operación ejecutada Satisfactoriamente!"
        );
    }

    public function run(): void
    {
        $viewData = array(
            "mode_desc" => "",
            "mode" => "",
            'usercod' => '',
            'useremail' => '',
            'userpswd' => '',
            'username' => '',
            'userphone' => '',
            'userphone2' => '',
            'useraddress' => '',
            'userpswdrpt' => '',
            'userrole' => '',
            'userest' => '',
            'userfecharegistro' => '',
            'usergender' => '',
            "hasErrors" => false,
            "errorEmail" => '',
            "errorPswd" => '',
            "errorPass" => '',
            "errorUser" => '',
            "errorPhone" => '',
            "errorAddress" => '',
            "Errors" => array(),
            "showaction" => true,
            "showactionins" => true,
            "readonly" => false,
            "readonlyuser" => false,
        );

        if ($this->isPostBack()) {
            $viewData["mode"] = $_POST["mode"]; //Form behavior mode
            $viewData['usercod'] = $_POST['user']; //User code
            $viewData['useremail'] = $_POST['useremail']; //User Email
            $viewData['userpswd'] = $_POST['userpswd']; //User password
            $viewData['username'] = $_POST['username']; //User Name
            $viewData['userphone'] = $_POST['userphone']; //User Phone
            $viewData['userphone2'] = $_POST['userphone2']; //User Phone
            $viewData['useraddress'] = $_POST['useraddress']; //User Address
            $viewData['usergender'] = $_POST['usergender']; //User Gender
            $viewData["userpswdrpt"] = $_POST["userpswdrpt"]; //User password repeat

            if (\Utilities\Validators::IsEmpty($viewData['usercod'])) {
                $this->errorUser = "¡Debe ingresar un codigo de usuario!";
                $this->hasError = true;
            }
            if (\Utilities\Validators::IsEmpty($viewData['useremail'])) {
                $this->errorEmail = "¡Debe ingresar un correo!";
                $this->hasError = true;
            }
            if (\Utilities\Validators::IsEmpty($viewData['username'])) {
                $this->errorEmail = "¡Debe ingresar su nombre!";
                $this->hasError = true;
            }
            if (\Utilities\Validators::IsEmpty($viewData['userphone'])) {
                $this->errorEmail = "¡Debe ingresar su numero!";
                $this->hasError = true;
            }

            if ($viewData["userpswdrpt"] != $viewData["userpswd"]) {
                $viewData["hasErrors"] = true;
                $viewData["errorPass"] = 'Constraseña no coincide.';
            }

            if (!$viewData["hasErrors"]) {

                switch ($viewData["mode"]) {
                    case "INS":
                        //echo $viewData["usergender"];
                        //dd($viewData["usergender"]);
                        $verUsuario = \Dao\Mnt\Usuarios::getOneUsuario($viewData['usercod']);
                        //dd($verUsuario);
                        if(!$verUsuario){
                            if (!$dbUser = \Dao\Security\Security::getUsuarioByEmail($viewData['useremail'])) {
                                if($dbUser){
                                    if (\Dao\Security\Security::newUsuario($viewData['usercod'], $viewData['useremail'], $viewData['userpswd'], $viewData['username'], $viewData['userphone'], $viewData['userphone2'], $viewData['useraddress'], $viewData['usergender'])) {
                                        $this->yeah();
                                    }
                                }
                            }else{
                                $viewData["hasErrors"] = true;
                                $viewData["errorEmail"] = "Correo ya esta relacionado a una cuenta.";
                            }
                        }else{
                            $viewData["hasErrors"] = true;
                            $viewData["errorUser"] = "El usuario ya existe.";
                        }
                        break;
                    case "UPD":
                        if (
                            isset($_POST["chgPswd"]) && \Dao\Mnt\Usuarios::editUsuario(
                                $viewData['usercod'],
                                $viewData['useremail'],
                                $viewData['username'],
                                $viewData['userpswd'],
                                $viewData['userest'],
                                $viewData['userrole']
                            )

                            //&& \Dao\Mnt\Usuarios::editUserRoles($viewData['usercod'], $viewData["userroles"])
                        ) {
                            $this->yeah();
                        } else if (
                            \Dao\Mnt\Usuarios::editUsuarioNoPswd(
                                $viewData['usercod'],
                                $viewData['useremail'],
                                $viewData['username'],
                                $viewData['userest'],
                                $viewData['userrole']
                            )
                            //&& \Dao\Mnt\Usuarios::editUserRoles($viewData['usercod'], $viewData["userroles"])
                        ) {
                            $this->yeah();
                        }
                        break;
                    case "DEL":
                        if (\Dao\Mnt\Usuarios::deleteUsuario($viewData['usercod'])) {
                            $this->yeah();
                        }
                        break;
                }
            }
        } else {
            if (isset($_GET["mode"])) {
                $viewData["mode"] = $_GET["mode"];
            } else {
                $this->nope();
            }
            if (isset($_GET['usercod'])) {
                $viewData['usercod'] = $_GET['usercod'];
            } else {
                if ($viewData["mode"] !== "INS") {
                    dd("No bicho");
                    $this->nope();
                }
            }
        }
        
        $modeDscArr = array(
            "INS" => "Registro de Usuario",
            "UPD" => "Modificar datos del usuario (%s)",
            "DEL" => "Eliminar usuario (%s)",
            "DSP" => "Detalle del usuario (%s)",
        );
        //$tmpAvailableRoles = \Dao\Mnt\Usuarios::getUsuarios($viewData["user"]);
        if ($viewData["mode"] === "INS") {
            $viewData["mode_dsc"] = $modeDscArr["INS"];
            //$viewData["avaroles"] = $tmpAvailableRoles;
            $viewData["chgpswd"] = true;
        } else {
            
            $viewData["showactionins"] = false;
            $tmpUsuario = \Dao\Mnt\Usuarios::getOneUsuario($viewData['usercod']);
            //$tmpUserRoles = \Dao\Security\Security::getRolesByUsuario($viewData["user"]);

            $viewData['useremail'] = $tmpUsuario['useremail'];
            $viewData['username'] = $tmpUsuario['username'];
            $viewData['userpswd'] = $tmpUsuario['userpswd'];
            $viewData['userphone'] = $tmpUsuario['userphone'];
            $viewData['userphone2'] = $tmpUsuario['userphone2'];
            $viewData['useraddress'] = $tmpUsuario['useraddress'];
            $viewData['userest'] = $tmpUsuario['userest'];
            $viewData['userrole'] = $tmpUsuario['userrole'];
            //$viewData["avaroles"] = $tmpAvailableRoles;
            $viewData["chgpswd"] = false;

            $viewData["mode_dsc"] = sprintf(
                $modeDscArr[$viewData["mode"]],
                $viewData['usercod']
            );

            if ($viewData["mode"] == "DSP") {
                $viewData["readonly"] = "readonly";
                $viewData["showaction"] = false;
            }
            if ($viewData["mode"] == "DSP" || $viewData["mode"] == "DEL") {
                $viewData["readonly"] = "readonly";
            }
            if ($viewData["mode"] != "INS") {
                $viewData["readonlyuser"] = "readonly";
            }
        }
        Renderer::render("security/register", $viewData);
    }
}