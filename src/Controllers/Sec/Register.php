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
            'userbio' => '',
            'userpswdrpt' => '',
            'userrole' => '',
            'userest' => '',
            'userfecharegistro' => '',
            'usergender' => '',
            "hasErrors" => false,
            "errorEmail" => '',
            "errorPswd" => '',
            "errorPass" => '',
            "errorName" => '',
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
            $viewData['usercod'] = $_POST['usercod']; //User code
            $viewData['useremail'] = $_POST['useremail']; //User Email
            $viewData['userpswd'] = $_POST['userpswd']; //User password
            $viewData['username'] = $_POST['username']; //User Name
            $viewData['userphone'] = $_POST['userphone']; //User Phone
            $viewData['userphone2'] = $_POST['userphone2']; //User Phone
            $viewData['useraddress'] = $_POST['useraddress']; //User Address
            $viewData['usergender'] = $_POST['usergender']; //User Gender
            $viewData["userpswdrpt"] = $_POST["userpswdrpt"]; //User password repeat

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
            } else if (strlen($viewData['userphone']) > 8) {
                $viewData["errorPhone"] = "El número contiene mas digitos del formato correcto.";
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = '¡Debe ingresar su numero!';
            }
            if (\Utilities\Validators::IsEmpty($viewData['useraddress'])) {
                $viewData["errorAddress"] = "¡Debe ingresar su dirección!";
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = '¡Debe ingresar su dirección!';
            }

            if (!\Utilities\Validators::IsValidPassword($viewData["userpswd"])) {
                $viewData["errorPswd"] = "Contraseña debe ser almenos 8 caracteres, 1 número, 1 mayúscula, 1 símbolo especial";
            }

            if ($viewData["userpswdrpt"] != $viewData["userpswd"]) {
                $viewData["hasErrors"] = true;
                $viewData["errorPass"] = 'Constraseña no coincide.';
                $viewData["Errors"][] = 'Constraseña no coincide.';
            }

            if (!$viewData["hasErrors"]) {

                switch ($viewData["mode"]) {
                    case "INS":
                        //echo $viewData["usergender"];
                        //dd($viewData["usergender"]);
                        //dd($verUsuario);

                            if ($dbUser = \Dao\Security\Security::getUsuarioByEmail($viewData["useremail"])) {
                                $viewData["errorEmail"] = "El correo ya esta vinculado a otra cuenta.";
                                $viewData["hasErrors"] = true;
                                $viewData["Errors"][] = 'Correo invalido';
                            }else{
                                if (\Dao\Security\Security::newUsuario($viewData['useremail'], $viewData['userpswd'], $viewData['username'], $viewData['userphone'], $viewData['userphone2'], $viewData['useraddress'], $viewData["userbio"], $viewData['usergender'])) {
                                    $this->yeah();
                                }
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
        if ($viewData["mode"] === "INS") {
            $viewData["mode_dsc"] = $modeDscArr["INS"];
            $viewData["chgpswd"] = true;
        } else {

            $viewData["showactionins"] = false;
            $tmpUsuario = \Dao\Mnt\Usuarios::getOneUsuario($viewData['usercod']);

            $viewData['useremail'] = $tmpUsuario['useremail'];
            $viewData['username'] = $tmpUsuario['username'];
            $viewData['userpswd'] = $tmpUsuario['userpswd'];
            $viewData['userphone'] = $tmpUsuario['userphone'];
            $viewData['userphone2'] = $tmpUsuario['userphone2'];
            $viewData['useraddress'] = $tmpUsuario['useraddress'];
            $viewData['userbio'] = $tmpUsuario['userbio'];
            $viewData['userest'] = $tmpUsuario['userest'];
            $viewData['userrole'] = $tmpUsuario['userrole'];
            $viewData["chgpswd"] = false;

            $viewData["mode_dsc"] = sprintf(
                $modeDscArr[$viewData["mode"]],
                $viewData['username']
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
