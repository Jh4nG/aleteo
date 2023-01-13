<?php include "plantilla/head.php";?>

  <body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
    
    <div class="container">
      <div class="row">
        <div class="col-md-12 row background: #000;" id="contentDiv">
          <div class="col-md-1"></div>
          <div class="col-md-9">
            <iframe src="https://aleteo-9021d.web.app" width="1000" height="600" scrolling="no" style="overflow:hidden; margin-top:-4px; margin-left:-4px; border:none;"></iframe>
            <div class="col-md-12" style="color:white">
                <p></p>
            </div>
          <div class="col-md-2"></div>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade " id="modal-view-VideoJuego" role="dialog">
      <div class="modal-dialog modal-md" id="modal-large-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 id="modal-title-lg" class="modal-title">¡Aleteo Informa!</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div id="modal-body-lg-VideoJuego" class="modal-body" style="background-image:url('images/img-project/Fondo 2.png');background-position: top center;
                  background-repeat: no-repeat;
                  background-size: cover;
                  background-attachment: fix;">
              <h3>Bienvenido a La Caída</h3>
              <p style="font-size: 17px;">El tiempo de carga es relativo, por favor espere...</p>
              <p style="font-size: 17px;">
                Para disfrutar de una mejor jugabilidad póngase cómodo y utilice audífonos. 
              </p>
              <p style="font-size: 17px;">
                Recomendamos utilizar navegadores como 
                <span class="fa fa-chrome"></span> Chrome o <span class="fa fa-edge"></span> Edge para un mejor rendimiento.
              </p>
              <p style="font-size: 17px;"><b>Sólo funciona en ordenadores y portátiles.</b></p>
          </div>
        </div>
      </div>
    </div>
    
    <?php require_once 'plantilla/footer.php'; ?>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/videojuego.js?v=2"></script>
  </body>
</html>