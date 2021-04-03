<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Index extends Conexion{

    public function __construct(){
        parent::__construct();
    }

     /**
     * Trae la informacuón de los logos para el footer
     */
    public function logoFooter(){
        $sqlFrases ="SELECT sec_link_redirect,sec_titulo,sec_desc,sec_img,cant_reg 
            FROM categoria c,secciones s 
            WHERE c.id = s.id_categoria
            AND c.id = 4
            AND s.sec_estado = 1"; // -> Logos Footer
        $rdb = $this->con_aleteo->prepare($sqlFrases);
        if($rdb->execute()){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    /**
     * Trae la información de redes sociales
     */
    public function redesSociales(){
        $sqlFrases ="SELECT sec_link_redirect,sec_titulo,sec_icon,cant_reg 
            FROM categoria c,secciones s 
            WHERE c.id = s.id_categoria
            AND c.id = 5
            AND s.sec_estado = 1"; // -> Redes Sociales íconos
        $rdb = $this->con_aleteo->prepare($sqlFrases);
        if($rdb->execute()){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    /**
     * Ingresar ip de visitador
     */
    public function visitaPagina($parametros){
        $server = "";
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $server = $_SERVER['HTTP_CLIENT_IP'];
        } else {
            if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                $server = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } else {
                $server = $_SERVER['REMOTE_ADDR'];
            }
        }
        $sql = "SELECT * FROM visitador WHERE id_visitador = '$server'";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute()){
            $obj = $rdb -> fetchAll(PDO::FETCH_OBJ);
            if(count($obj)>0){
                if($this->ingresarVisita($server,$parametros)){
                    echo json_encode(true);
                }
            }else{
                $sql = "INSERT INTO visitador(id_visitador) VALUES(?)";
                $rdb = $this->con_aleteo->prepare($sql);
                if($rdb->execute([$server])){
                    if($this->ingresarVisita($server,$parametros)){
                        echo json_encode(true);
                    }
                }else{
                    echo json_encode(false);
                }
            }
        }
    }

    /**
     * Inserción de visitas
     */
    public function ingresarVisita($server,$parametros){
        $sql = "INSERT INTO visitas(id_visitador,pagina,dispositivo) VALUES(?,?,?)";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute([$server,$parametros['pagina'],$parametros['dispositivo']])){
            return true;
        }
    }

    public function getConstruc($parametro){
        $sqlFrases ="SELECT * FROM construccion WHERE id_constr = ".base64_decode($parametro['id']); // -> Logos Footer
        $rdb = $this->con_aleteo->prepare($sqlFrases);
        if($rdb->execute()){
            echo json_encode($rdb -> fetchAll(PDO::FETCH_OBJ));
        }else{
            echo json_encode(false);
        }
    }

    public function addSuscripccion(){
        $nombre = $_POST['nmbSuscriptor'];
        $email = $_POST['emailSuscriptor'];
        $sql = "INSERT INTO suscripciones(nombres,email) VALUES(?,?)";
        $rdb = $this->con_aleteo->prepare($sql);
        if($rdb->execute([$nombre,$email])){
            echo json_encode(true);
        }else{
            echo json_encode(false);
        }
    }

    public function datosContacto(){
        $sql ="SELECT * FROM secciones 
                WHERE id_categoria = 9
                AND sec_estado = 1
                ORDER BY sec_posicion ASC"; // -> Datos Contacto
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
    $parametros = '';
    if(isset($_POST['parametros'])){
        $parametros = $_POST['parametros'];
    }
    $aleteo = new Index();
    $aleteo->$metodo($parametros);
}
?>