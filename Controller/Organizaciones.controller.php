<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Organizaciones extends Conexion{
    public function __construct(){
        parent::__construct();
    }

    public function listarOrg()
    {
        $sql = "SELECT id,titulo,descripcion,imagen_link,fecha_creacion,activo,tipo,url
        FROM organizaciones WHERE activo = 1 ORDER BY fecha_creacion DESC";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            $obj = $rdb -> fetchAll(PDO::FETCH_OBJ);
            echo json_encode($obj);
        }else{
            echo json_encode(false);
        }
    }
}


if(isset($_POST) && count($_POST)>0){
    $metodo = $_POST['metodo'];
    $Organizaciones = new Organizaciones();
    $Organizaciones->$metodo();
}
?>