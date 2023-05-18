<?php 
require_once dirname(__FILE__).'/Conexion.php';

class SubaFuturo extends Conexion{
    private $meses = array();
    private $groserias = array();
    public function __construct(){
        parent::__construct();
        $this->meses = array("","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
        $this->groserias = array("puta", "hijueputa", "gonorrea", "malparido", "hijo de perra", "pirobo");
    }

    public function getArtistas()
    {
        $id = (isset($_POST['id'])) ? $_POST['id'] : 0;
        $addSql = "";
        $data = array();
        if($id != 0 && $id != '' && $id != null){
            $addSql = "WHERE id = ?";
            $data = array($id);
        }
        $sql ="SELECT * FROM sf_artistas $addSql ORDER BY id ASC"; // -> Información de los 360
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute($data)){
            return $rdb -> fetchAll(PDO::FETCH_OBJ);
        }else{
            return false;
        }
    }

    public function get360($id = 0)
    {
        $addSql = "";
        $data = array();
        if($id != 0 && $id != ''){
            $addSql = "WHERE id = ?";
            $data = array($id);
        }
        $sql ="SELECT * FROM sf_360 $addSql ORDER BY id ASC"; // -> Información de los 360
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute($data)){
            return $rdb -> fetchAll(PDO::FETCH_OBJ);
        }else{
            return false;
        }
    }

    public function getPodcast()
    {
        $sql ="SELECT * FROM sf_podcast ORDER BY id ASC"; // -> Información de los podcsat
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            return $rdb -> fetchAll(PDO::FETCH_OBJ);
        }else{
            return false;
        }
    }

    public function getPublicaciones(){
        $sqlFrases ="SELECT * FROM futuro ORDER BY fecha_creacion DESC"; // -> Logos Footer
        $rdb = $this->con_aleteo->prepare($sqlFrases);
        if($rdb->execute()){
            return $rdb -> fetchAll(PDO::FETCH_OBJ);
        }else{
            return false;
        }
    }

    public function listarOpiniones()
    {
        $sql ="SELECT * FROM opiniones
                WHERE modulo = 'SubaFuturo'
                ORDER BY fecha_opinion DESC";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            return $rdb -> fetchAll(PDO::FETCH_OBJ);
        }else{
            return false;
        }
    }

    public function uploadComment($coment)
    {   
        foreach ($this->groserias as $value) {
            if(stristr($coment['coment'], $value)){
                return "groseria";
                exit;
            }
        }
        date_default_timezone_set('America/Bogota');

        $dia = date("d");
        $mes = date("m");
        $anio = date("Y");
        $fecha = $dia.' '.$this->meses[(int) $mes].' '.$anio;
        $modulo = 'SubaFuturo';

        $sql = "INSERT INTO opiniones(texto_opinion, fecha_opinion_text, modulo) VALUES(?,?,?)";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute([$coment['coment'], $fecha, $modulo])){
            return 'insert';
        }else{
            return false;
        }
    }

}

if(isset($_POST) && count($_POST)>0){
    $metodo = $_POST['metodo'];
    $parametros = "";
    if(isset($_POST['parametros'])){
        $parametros = $_POST['parametros'];
    }
    $Apoyanos = new SubaFuturo();
    echo json_encode($Apoyanos->$metodo($parametros));
}
?>