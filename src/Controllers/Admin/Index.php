<?php
namespace Controllers\Admin;
use Controllers\PublicController;

class Index extends PublicController
{
    /**
     * Index run method
     *
     * @return void
     */
    public function run() :void
    {
        $_SESSION['login']['private'] = false;
        $basedir = \Utilities\Context::getContextByKey("BASE_DIR");
        header("Location: /$basedir/index.php");
        exit;
    }
}
?>