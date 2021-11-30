<?php

namespace Utilities;

class Nav {

    public static function setNavContext(){
        $tmpNAVIGATION = array();
        $userID = \Utilities\Security::getUserId();
        if (\Utilities\Security::isAuthorized($userID, "MntUsuarios")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_usuarios",
                "nav_label" => "Usuarios"
            );
        }
        if (\Utilities\Security::isAuthorized($userID, "WW_Scores")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=scores_scores",
                "nav_label" => "Partituras"
            );
        }

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
