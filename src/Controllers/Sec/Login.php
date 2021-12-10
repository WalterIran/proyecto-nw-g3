<?php
namespace Controllers\Sec;
class Login extends \Controllers\PublicController
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

    private $txtEmail = "";
    private $txtPswd = "";
    private $mode_dsc = "";
    private $mode = "";
    private $errorEmail = "";
    private $errorPswd = "";
    private $generalError = "";
    private $hasError = false;

    public function run() :void
    {
        if ($this->isPostBack()) {

            $this->txtEmail = $_POST["txtEmail"];
            $this->txtPswd = $_POST["txtPswd"];

            if (!\Utilities\Validators::IsValidEmail($this->txtEmail)) {
                $this->errorEmail = "¡Correo no tiene el formato adecuado!";
                $this->hasError = true;
            }
            if (\Utilities\Validators::IsEmpty($this->txtPswd)) {
                $this->errorPswd = "¡Debe ingresar una contraseña!";
                $this->hasError = true;
            }
            if (! $this->hasError) {

                if ($dbUser = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail)) {
                    if ($dbUser["userest"] != \Dao\Security\Estados::ACTIVO) {
                        $this->generalError = "¡Usuario no esta activo!";
                        $this->hasError = true;
                        error_log(
                            sprintf(
                                "ERROR: %d %s tiene cuenta con estado %s",
                                $dbUser["usercod"],
                                $dbUser["useremail"],
                                $dbUser["userest"]
                            )
                        );
                    }
                    if (!\Dao\Security\Security::verifyPassword($this->txtPswd, $dbUser["userpswd"])) {
                        $this->generalError = "¡Credenciales son incorrectas!";
                        $this->hasError = true;
                        error_log(
                            sprintf(
                                "ERROR: %d %s contraseña incorrecta",
                                $dbUser["usercod"],
                                $dbUser["useremail"]
                            )
                        );
                        // Aqui se debe establecer acciones segun la politica de la institucion.
                    }
                    if (! $this->hasError) {
                        \Utilities\Security::login(
                            $dbUser["usercod"],
                            $dbUser["username"],
                            $dbUser["useremail"],
                            $dbUser["userrole"]
                        );
                        //dd(\Utilities\Context::getContextByKey("redirto")."&id=".$dbUser["usercod"]);
                        \Dao\Mnt\Product::transferCartLogin($_SESSION['tmpuserid'], $_SESSION['login']['userId']);
                        $basedir = \Utilities\Context::getContextByKey("BASE_DIR");
                        if (\Utilities\Context::getContextByKey("redirto") !== "") {
                            if(\Utilities\Context::getContextByKey("redirto") == "/$basedir/index.php?page=checkout_checkout"){
                                
                                \Utilities\Site::redirectTo("/$basedir/index.php?page=checkout_checkout&id=".$dbUser["usercod"]);
                            }else{
                                \Utilities\Site::redirectTo(\Utilities\Context::getContextByKey("redirto"));
                            }
                        } else {
                            \Utilities\Site::redirectTo("index.php");
                        }
                    }
                } else {
                    error_log(
                        sprintf(
                            "ERROR: %s trato de ingresar",
                            $this->txtEmail
                        )
                    );
                    $this->generalError = "¡Ocurruio un error al ingresar!";
                }
            }
        }

        $dataView = get_object_vars($this);
        //dd($dataView);
        \Views\Renderer::render("security/login", $dataView);
    }
}
?>
