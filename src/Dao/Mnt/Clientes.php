<?php
namespace Dao\Mnt;

use Dao\Table;
use Dao\Security;
use Exception;

class Clientes extends Table
{
    public static function obtenerClientes()
    {
        $sqlStr = "SELECT * from usuarios;";
        return self::obtenerRegistros($sqlStr, array());
    }

    public static function obtenerCliente($usercod)
    {
        $sqlStr = "SELECT * from usuarios where usercod = :usercod;";
        return self::obtenerUnRegistro($sqlStr, array("usercod"=>intval($usercod)));
    }
    


    public static function editarCliente($username, $usergender, $userphone, $userphone2, $useremail, $useraddress, $userbio, $userest, $userrole, $userpswd, $usercod)
    {

        $hashedPassword = self::_hashPassword($userpswd);

        $sqlstr = "UPDATE usuarios set username=:username, usergender=:usergender, 
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
        
        $sqlstr = "DELETE FROM usuarios where usercod=:usercod;";
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
        return password_hash(self::_saltPassword($password), PASSWORD_ALGORITHM);
    }
}

?>
