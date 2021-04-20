<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Serie extends Conexion{
    public function __construct(){
        parent::__construct();
        $this->meses = array("","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
        $this->groserias = array("puta", "hijueputa", "gonorrea", "malparido", "hijo de perra", "pirobo");
    }

}

if(isset($_POST) && count($_POST)>0){
    $metodo = $_POST['metodo'];
    $parametros = "";
    if(isset($_POST['parametros'])){
        $parametros = $_POST['parametros'];
    }
    $Apoyanos = new Serie();
    $Apoyanos->$metodo($parametros);
}
?>