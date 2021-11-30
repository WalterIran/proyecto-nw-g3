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
            'user' => '',
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
            "Errors" => array(),
            "showaction" => true,
            "showactionins" => true,
            "readonly" => false,
            "readonlyuser" => false,
        );

        if ($this->isPostBack()) {
            $viewData["mode"] = $_POST["mode"]; //Form behavior mode
            $viewData['user'] = $_POST['user']; //User code
            $viewData['useremail'] = $_POST['useremail']; //User Email
            $viewData['userpswd'] = $_POST['userpswd']; //User password
            $viewData['username'] = $_POST['username']; //User Name
            $viewData['userphone'] = $_POST['userphone']; //User Phone
            $viewData['userphone2'] = $_POST['userphone2']; //User Phone
            $viewData['useraddress'] = $_POST['useraddress']; //User Address
            $viewData['userest'] = $_POST['userest']; //User Status (ACT, INA,...)
            $viewData['userrole'] = $_POST['userrole']; //User type (PBL, ADM, AUDS)
            $viewData['usergender'] = $_POST['usergender']; //User Gender
            $viewData["userpswdrpt"] = $_POST["userpswdrpt"]; //User password repeat

            if ($viewData["userpswdrpt"] != $viewData["userpswd"]) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "Contraseña y repetir contraseña deben ser iguales";
            }

            if (!$viewData["hasErrors"]) {

                switch ($viewData["mode"]) {
                    case "INS":
                        //echo $viewData["usergender"];
                        //dd($viewData["usergender"]);
                        if (\Dao\Security\Security::newUsuario($viewData['user'], $viewData['useremail'], $viewData['userpswd'], $viewData['username'], $viewData['userphone'], $viewData['userphone2'], $viewData['useraddress'], $viewData['usergender'])) {
                            $this->yeah();
                        }
                        break;
                    case "UPD":
                        if (
                            isset($_POST["chgPswd"]) && \Dao\Mnt\Usuarios::editUsuario(
                                $viewData['user'],
                                $viewData['useremail'],
                                $viewData['username'],
                                $viewData['userpswd'],
                                $viewData['userest'],
                                $viewData['userrole']
                            )

                            //&& \Dao\Mnt\Usuarios::editUserRoles($viewData['user'], $viewData["userroles"])
                        ) {
                            $this->yeah();
                        } else if (
                            \Dao\Mnt\Usuarios::editUsuarioNoPswd(
                                $viewData['user'],
                                $viewData['useremail'],
                                $viewData['username'],
                                $viewData['userest'],
                                $viewData['userrole']
                            )
                            //&& \Dao\Mnt\Usuarios::editUserRoles($viewData['user'], $viewData["userroles"])
                        ) {
                            $this->yeah();
                        }
                        break;
                    case "DEL":
                        if (\Dao\Mnt\Usuarios::deleteUsuario($viewData['user'])) {
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
            if (isset($_GET['user'])) {
                $viewData['user'] = $_GET['user'];
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
            $viewData["showactionins"] = false;
        } else {
            $tmpUsuario = \Dao\Mnt\Usuarios::getOneUsuario($viewData['user']);
            $tmpUserRoles = \Dao\Security\Security::getRolesByUsuario($viewData["user"]);

            $viewData['useremail'] = $tmpUsuario['useremail'];
            $viewData['username'] = $tmpUsuario['username'];
            $viewData['userpswd'] = $tmpUsuario['userpswd'];
            $viewData['userest'] = $tmpUsuario['userest'];
            $viewData['userrole'] = $tmpUsuario['userrole'];
            //$viewData["avaroles"] = $tmpAvailableRoles;
            $viewData["chgpswd"] = false;

            $viewData["userest_ACT"] = $tmpUsuario["userest"] == "ACT" ? "selected" : "";
            $viewData["userest_INA"] = $tmpUsuario["userest"] == "INA" ? "selected" : "";
            $viewData["userest_SUS"] = $tmpUsuario["userest"] == "SUS" ? "selected" : "";
            $viewData["userest_BLQ"] = $tmpUsuario["userest"] == "BLQ" ? "selected" : "";

            $viewData["userrole_PBL"] = $tmpUsuario["userrole"] == "PBL" ? "selected" : "";
            $viewData["userrole_ADM"] = $tmpUsuario["userrole"] == "ADM" ? "selected" : "";
            $viewData["userrole_AUD"] = $tmpUsuario["userrole"] == "AUD" ? "selected" : "";

            $viewData["mode_dsc"] = sprintf(
                $modeDscArr[$viewData["mode"]],
                $viewData['user']
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