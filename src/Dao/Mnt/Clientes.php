<?php
namespace Dao\Mnt;

use Dao\Table;

class Clientes extends Table
{
    public static function obtenerClientes()
    {
        $sqlStr = "SELECT * from clientes;";
        return self::obtenerRegistros($sqlStr, array());
    }

    public static function obtenerCliente($clientid)
    {
        $sqlStr = "SELECT * from clientes where clientid = :clientid;";
        return self::obtenerUnRegistro($sqlStr, array("clientid"=>intval($clientid)));
    }
    
    public static function crearCliente($clientname, $clientgender, $clientphone1, $clientphone2, $clientemail, $clientIdnumber, $clientbio, $clientstatus, $clientdatecrt )
    {
        $sqlstr = "INSERT INTO clientes (clientname, clientgender, clientphone1, clientphone2,clientemail,clientIdnumber,clientbio,clientstatus, clientdatecrt) 
        values (:clientname, :clientgender, :clientphone1, :clientphone2, :clientemail, :clientIdnumber, :clientbio,:clientstatus, :clientdatecrt);";
        $parametros = array(
            "clientname" => $clientname,
            "clientgender" => $clientgender,
            "clientphone1" => $clientphone1,
            "clientphone2" => $clientphone2,
            "clientemail" => $clientemail,
            "clientIdnumber" => $clientIdnumber,
            "clientbio" => $clientbio,
            "clientstatus" => $clientstatus,
            "clientdatecrt" => $clientdatecrt
        );
        return self::executeNonQuery($sqlstr, $parametros);
    }

    public static function editarCliente($clientname, $clientgender, $clientphone1, $clientphone2, $clientemail, $clientIdnumber, $clientbio, $clientstatus, $clientdatecrt, $clientid)
    {
        $sqlstr = "UPDATE clientes set clientname=:clientname, clientgender=:clientgender, 
        clientphone1=:clientphone1, clientphone2=:clientphone2,
        clientemail=:clientemail, clientIdnumber=:clientIdnumber,
        clientbio=:clientbio, clientstatus=:clientstatus,
        clientdatecrt=:clientdatecrt where clientid = :clientid;";
        $parametros = array(
            "clientname" =>  $clientname,
            "clientgender" =>  $clientgender,
            "clientphone1" =>  $clientphone1,
            "clientphone2" =>  $clientphone2,
            "clientemail" =>  $clientemail,
            "clientIdnumber" =>  $clientIdnumber,
            "clientbio" =>  $clientbio,
            "clientstatus" =>  $clientstatus,
            "clientdatecrt" =>  $clientdatecrt,
            "clientid" => intval($clientid)
        );
        return self::executeNonQuery($sqlstr, $parametros);
        // sqlstr = "UPDATE X SET Y = '".$Y."' where Z='".$Z."';";
        // $Y = "'; DROP DATABASE mysql; SELECT * FROM (SELECT DATE)
    }

    public static function eliminarCategoria($catid)
    {
        $sqlstr = "DELETE FROM categorias where catid=:catid;";
        $parametros = array(
            "catid" => intval($catid)
        );
        return self::executeNonQuery($sqlstr, $parametros);
    }
}

?>
