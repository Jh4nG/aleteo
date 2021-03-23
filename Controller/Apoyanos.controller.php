<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Apoyanos extends Conexion{
    public function __construct(){
        parent::__construct();
    }

    public function listar()
    {
        $sql = "SELECT * FROM apoyanos";
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
    $Apoyanos = new Apoyanos();
    $Apoyanos->$metodo();
}
?>