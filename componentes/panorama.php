<?php 
  $parametros = $_GET['id'];
  if($parametros == 0){
    $img = "panorama.jpg";
  }else{ // Verifica en la BD para saber cual es la imagen
    include './../Controller/SubaFuturo.controller.php';
    $panorama = new SubaFuturo();
    $data = $panorama->get360($parametros);
    $img = $data[0]->img;
  }
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width, shrink-to-fit=no">
    <title>Panoramas</title>
    <style>
      html, body {
        margin: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background-color: #000;
      }

      a:link, a:visited{
        color: #bdc3c7;
      }

      .credit{
        position: absolute;
        text-align: center;
        width: 100%;
        padding: 20px 0;
        color: #fff;
      }
    </style>
  </head>

  <body>
    <script type="text/javascript" src="../layout/scripts/three.min.js"></script>
    <script type="text/javascript" src="../layout/scripts/panolens.min.js"></script>

    <script>
        const img = "<?=$img?>";
        const id = <?=$parametros?>;
        const panorama = new PANOLENS.ImagePanorama( `../images/img-project/futureSuba/${img}`);
        config = {  
          controlButtons: [],
          autoRotate : true
        };
        const viewer = new PANOLENS.Viewer(config);
        viewer.add( panorama );
    </script>
  </body>
</html>