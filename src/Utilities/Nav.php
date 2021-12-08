<?php

namespace Utilities;

class Nav {

    public static function setNavContext(){
        $tmpNAVIGATION = array();
        $userID = \Utilities\Security::getUserId();
        if (\Utilities\Security::isAuthorized($userID, "WW_Clientes")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_clientes",
                "nav_label" => "Clientes"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "WW_Products")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_products",
                "nav_label" => "Productos"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "WW_Roles")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_roles",
                "nav_label" => "Roles"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "WW_Features")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_features",
                "nav_label" => "Funciones"
            );
        }
       
        \Utilities\Context::setContext("NAVIGATION", $tmpNAVIGATION);
    }


    private function __construct()
    {
        
    }
    private function __clone()
    {
        
    }
}
?>
