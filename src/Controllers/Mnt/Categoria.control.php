<?php 
namespace Controllers\Mnt;

class Categoria extends \Controllers\PublicController
{
    private $catid = 0;
    private $catnom = "";
    private $catest = "";
    private $catest_ACT = "";
    private $catest_INA = "";
    private $catest_PLN = "";

    private $mode_dsc = "";
    private $mode_adsc = array(
        "INS" => "Nueva Categoría",
        "UPD" => "Editar %s %s",
        "DEL" => "Eliminar %s %s",
        "DSP" => "%s %s"
    );

    public function run() :void
    {
        /*
        1) Verificamos si es un postback o un get
        2) si es un get simplemente obtenemos datos y mostramos datos
        3) si es un post
          3.1) validamos datos del post
          3.2) realizamos la acción segun el modo del post
          3.3) verificamos el resultado de la acción
            3.3.1) si hay errores mostramos los errores en pantalla
            3.3.2) si no hay errores, mostramos mensaje de exito
                    y redirigimos a la lista
         */
        $this->mode = isset($_GET["mode"])?$_GET["mode"]:"";
        $this->catid = isset($_GET["catid"])?$_GET["catid"]:0;
        if (!$this->isPostBack()) {
            if ($this->mode !== "INS") {
                $this->_load();
            } else {
                $this->mode_dsc = $this->mode_adsc[$this->mode];
            }
        } else {
            
        }

        $dataview = get_object_vars($this);
        \Views\Renderer::render("mnt/categoria", $dataview);
    }

    private function _load()
    {
        $_data = \Dao\Mnt\Categorias::getOne($this->catid);
        if ($_data) {
            $this->catid = $_data["catid"];
            $this->catnom = $_data["catnom"];
            $this->catest = $_data["catest"];
            $this->catest_ACT = ($this->catest === "ACT") ? "selected":"";
            $this->catest_INA = ($this->catest === "INA") ? "selected" : "";
            $this->catest_PLN = ($this->catest === "PLN") ? "selected" : "";
            $this->mode_dsc = sprintf(
                $this->mode_adsc[$this->mode],
                $this->catid,
                $this->catnom
            );
        }
    }
}

?>
