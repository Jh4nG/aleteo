<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Podcast extends Conexion{
    public function __construct(){
        parent::__construct();
    }
}


if(isset($_POST) && count($_POST)>0){
    $metodo = $_POST['metodo'];
    $podcas = new Podcast();
    $podcas->$metodo();
}
?>