<?php
namespace Dao\Mnt;

use Dao\Table;
use Dao\Security;
use Exception;

//Se pone esto, porque el Dao/Security ya lo tiene definido y está la funcion private por lo que no se tiene acceso fuera de 
if (version_compare(phpversion(), '7.4.0', '<')) {
    define('PASSWORD_ALGORITHMv2', 1);  //BCRYPT
} else {
define('PASSWORD_ALGORITHMv2', '2y');  //BCRYPT
}

class Clientes extends Table
{
    public static function obtenerClientes()
    {
        $sqlStr = "SELECT * from usuario;";
        return self::obtenerRegistros($sqlStr, array());
    }

    public static function obtenerCliente($usercod)
    {
        $sqlStr = "SELECT * from usuario where usercod = :usercod;";
        return self::obtenerUnRegistro($sqlStr, array("usercod"=>intval($usercod)));
    }
    


    public static function editarCliente($username, $usergender, $userphone, $userphone2, $useremail, $useraddress, $userbio, $userest, $userrole, $userpswd, $usercod)
    {
       //Actualizando Tabla de Rol_Usuario 
       $sqlstr = "UPDATE roles_usuarios set rolescod=:userrole where usercod = :usercod;";
       $parametros = array(
           "userrole" => $userrole,
           "usercod" => intval($usercod)
        );

        
       self::executeNonQuery($sqlstr, $parametros);

        $hashedPassword = self::_hashPassword($userpswd);
        $sqlstr = "UPDATE usuario set username=:username, usergender=:usergender, 
        userphone=:userphone, userphone2=:userphone2,
        useremail=:useremail, useraddress=:useraddress,
        userbio=:userbio, userest=:userest,
        userrole=:userrole, userpswd=:userpswd 
        where usercod = :usercod;";
        
        $parametros = array(
            "username" => $username,
            "usergender" => $usergender,
            "userphone" => $userphone,
            "userphone2" => $userphone2,
            "useremail" => $useremail,
            "useraddress" => $useraddress,
            "userbio" => $userbio,
            "userest" => $userest,
            "userrole" => $userrole,
            "userpswd" => $hashedPassword,
            "usercod" => intval($usercod)
        );

        //dd($parametros);
        return self::executeNonQuery($sqlstr, $parametros);
        // sqlstr = "UPDATE X SET Y = '".$Y."' where Z='".$Z."';";
        // $Y = "'; DROP DATABASE mysql; SELECT * FROM (SELECT DATE)
    }

    public static function eliminarCliente($usercod)
    {
        try{

        
        $sqlstr = "DELETE FROM roles_usuarios where usercod=:usercod;";
        $parametros = array(
            "usercod" => intval($usercod)
        );

        self::executeNonQuery($sqlstr, $parametros);
        }
        catch(Exception $ex)
        {

        }
        
        $sqlstr = "DELETE FROM usuario where usercod=:usercod;";
        $parametros = array(
            "usercod" => intval($usercod)
        );
        return self::executeNonQuery($sqlstr, $parametros);
    }

    static private function _saltPassword($password)
    {
        return hash_hmac(
            "sha256",
            $password,
            \Utilities\Context::getContextByKey("PWD_HASH")
        );
    }

    static private function _hashPassword($password)
    {
        
        return password_hash(self::_saltPassword($password), PASSWORD_ALGORITHMv2);
    }
}

?>
