<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Index extends Conexion{

    public $order;
    public function __construct(){
        parent::__construct();
        $this->order = " ORDER BY sec_posicion ASC";
    }

    /**
     * Obtiene la información del cliente
     */
    public function traerInfoClt(){
        $sql ="SELECT *
            FROM cliente c 
            WHERE c.id = 1"; // Cliente Aleteo
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    /**
     * Trae Información de los deslizadores del Index
     */
    public function cargarDeslizador($typeReturn = 1){
        $sql ="SELECT sec_titulo,sec_iframe,sec_img,sec_desc,cant_reg, sec_link_redirect
            FROM categoria c,secciones s 
            WHERE c.id = s.id_categoria
            AND c.id = 1
            AND s.sec_estado = 1
            $this->order"; // Categoría Deslizador Inicio
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            if($typeReturn == 2){
                return $rdb;
            }
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    /**
     * Trae Información de las tres tarjetas del Index
     */
    public function threeCard()
    {
        $sqlThreeCard ="SELECT sec_titulo,sec_desc,sec_img,sec_link_redirect,cant_reg 
            FROM categoria c,secciones s 
            WHERE c.id = s.id_categoria
            AND c.id = 2
            AND s.sec_estado = 1
            $this->order"; // -> Categoría three card
        $rdb = $this->con_aleteo->prepare($sqlThreeCard);
        if($rdb->execute()){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    /**
     * Trae información de las frases de inicio
     */
    public function frasesInicio()
    {
        $sqlFrases ="SELECT sec_icon,sec_titulo,sec_desc,cant_reg,sec_img
            FROM categoria c,secciones s 
            WHERE c.id = s.id_categoria
            AND c.id = 3
            AND s.sec_estado = 1
            $this->order
            LIMIT 1"; // -> Frases Incio
        $rdb = $this->con_aleteo->prepare($sqlFrases);
        if($rdb->execute()){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    /**
     * Trae el contenido descriptivo del proyecto (Semi footer)
     */
    public function contenidoDescipcion()
    {
        $sqlFrases ="SELECT sec_titulo,sec_desc,cant_reg
            FROM categoria c,secciones s 
            WHERE c.id = s.id_categoria
            AND c.id = 7
            AND s.sec_estado = 1
            $this->order
            LIMIT 1"; // -> Frases Incio
        $rdb = $this->con_aleteo->prepare($sqlFrases);
        if($rdb->execute()){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    /**
     * Trae el contenido de suscripción
     */
    public function contenidoSuscripcion()
    {
        $sqlFrases ="SELECT sec_titulo,sec_desc,cant_reg
            FROM categoria c,secciones s 
            WHERE c.id = s.id_categoria
            AND c.id = 8
            AND s.sec_estado = 1
            $this->order
            LIMIT 1"; // -> Frases Incio
        $rdb = $this->con_aleteo->prepare($sqlFrases);
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