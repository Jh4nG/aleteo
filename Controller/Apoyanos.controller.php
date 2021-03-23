<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Apoyanos extends Conexion{
    public function __construct(){
        parent::__construct();
        $this->meses = array("","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
        $this->groserias = array("puta", "hijueputa", "gonorrea", "malparido", "hijo de perra", "pirobo");
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

    public function listarOpiniones()
    {
        $sql ="SELECT * FROM opiniones
                WHERE modulo = 'apoyanos'
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
        $modulo = 'apoyanos';

        $sql = "INSERT INTO opiniones(texto_opinion, fecha_opinion_text, modulo) VALUES(?,?,?)";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute([$coment['coment'], $fecha, $modulo])){
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
    $Apoyanos = new Apoyanos();
    $Apoyanos->$metodo($parametros);
}
?>