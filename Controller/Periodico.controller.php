<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Index extends Conexion{

    public $order;
    public function __construct(){
        parent::__construct();
        $this->meses = array("","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
        $this->groserias = array("puta", "hijueputa", "gonorrea", "malparido", "hijo de perra", "pirobo");
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

    public function getPeriodico($id){
        $sql ="SELECT * FROM periodico
                WHERE id_periodico = ?";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute([$id['id']])){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    public function listarOpiniones()
    {
        $sql ="SELECT * FROM opiniones
                ORDER BY fecha_opinion DESC";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    public function uploadComment($coment)
    {
        foreach ($this->groserias as $value) {
            if(stristr($coment['coment'], $value)){
                echo json_encode("groseria");
                exit;
            }
        }
        date_default_timezone_set('America/Bogota');

        $dia = date("d");
        $mes = date("m");
        $anio = date("Y");
        $fecha = $dia.' '.$this->meses[(int) $mes].' '.$anio;

        $sql = "INSERT INTO opiniones(texto_opinion, fecha_opinion_text) VALUES(?,?)";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute([$coment['coment'], $fecha])){
            echo json_encode('insert');
        }else{
            echo json_encode(false);
        }
    }
    
}

if(isset($_POST) && count($_POST)>0){
    $metodo = $_POST['metodo'];
    $parametros = "";
    if(isset($_POST['parametros'])){
        $parametros = $_POST['parametros'];
    }
    $index = new Index();
    $index->$metodo($parametros);
}
?>
