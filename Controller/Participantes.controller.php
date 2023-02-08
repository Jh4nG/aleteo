<?php 
require_once dirname(__FILE__).'/Conexion.php';

class Participantes extends Conexion{
    public function __construct(){
        parent::__construct();
    }

    /**
     * Obtiene el equipo aleteo
     */
    public function getParticipantes(){
        try{
            $sql = "SELECT * FROM datauser du 
                    INNER JOIN rolesuser ru WHERE du.id_rol = ru.rol_id
                    ORDER BY du.du_id ASC";
            $rdb = $this->con_aleteo->prepare($sql);
            if($rdb->execute()){
                $obj = $rdb -> fetchAll(PDO::FETCH_OBJ);
                echo json_encode(array('status' => 200, 'data' => $obj));
            }else{
                echo json_encode(array('status' => 201, 'data' => array()));
            }
        }catch(Throwable $t){
            echo json_encode(array('status' => 500, 'msg' => 'Error en obtener datos '. $t->getMessage()));
        }
    }

}
if(isset($_POST) && count($_POST)>0){
    $metodo = $_POST['metodo'];
    $Participantes = new Participantes();
    $Participantes->$metodo();
}
?>