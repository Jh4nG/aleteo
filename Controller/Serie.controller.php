<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Serie extends Conexion{
    public function __construct(){
        parent::__construct();
        $this->meses = array("","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
        $this->groserias = array("puta", "hijueputa", "gonorrea", "malparido", "hijo de perra", "pirobo");
    }

    public function listarContenido(){
        $objSerieWeb = $this->getSerie();
        $objContenidoAd = $this->getContenidoAd();

        echo json_encode(array(
            'serie' => $objSerieWeb,
            'adicional' => $objContenidoAd
        ));
    }

    public function getSerie(){
        // Clasificacion 0 para contenidos serie web
        $sql ="SELECT * FROM serieweb
                WHERE serie_clasificacion = 0
                ORDER BY serie_fecha_creacion ASC";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            return $rdb -> fetchAll(PDO::FETCH_OBJ);
        }else{
            return false;
        }
    }

    public function getContenidoAd(){
        // Clasificacion 1 para contenidos adicionales
        $sql ="SELECT * FROM serieweb
                WHERE serie_clasificacion = 1
                ORDER BY serie_fecha_creacion ASC";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            return $rdb -> fetchAll(PDO::FETCH_OBJ);
        }else{
            return false;
        }
    }

    public function listarOpiniones()
    {
        $sql ="SELECT * FROM opiniones
                WHERE modulo = 'SerieWeb'
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
        $modulo = 'SerieWeb';

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
    $Apoyanos = new Serie();
    $Apoyanos->$metodo($parametros);
}
?>