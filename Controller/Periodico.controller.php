<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Index extends Conexion{

    public $order;
    public function __construct(){
        parent::__construct();
    }


    public function listarPeriodico(){
        $sql ="SELECT *
                    FROM periodico
                    ORDER BY fecha_publicacion DESC";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }
    
}

if(isset($_POST) && count($_POST)>0){
    $metodo = $_POST['metodo'];
    $index = new Index();
    $index->$metodo();
}
?>
