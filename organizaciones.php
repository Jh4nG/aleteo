<?php include "plantilla/head.php";?>
<link href="layout/styles/organizaciones.css" rel="stylesheet" type="text/css" media="all">

  <body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
    <div style="margin-top:100px;"></div>
    <div class="contentDivOrg" style="">
        <h2 style="color:white;">Organizaciones</h2>
        <br>
        <div class="col-md-12">
            <div class="row" id="divOrg"></div>
        </div><hr>
        <h2 style="color:white;">Aliados</h2>
        <br>
        <div class="col-md-12">
            <div class="row" id="divAliados"></div>
        </div>
    </div>
    
    <div class="modal fade modal-md" id="modal-organizaciones" role="dialog">
      <div class="modal-dialog" style="max-width: 680px !important;">
      
        <!-- Modal content-->
        <div class="modal-content bgDarkModal ModalBlue">
          <div class="modal-header">
            <h4 id="modal-title-organizacion" class="modal-title"></h4>
            <button type="button" class="closeBg" data-dismiss="modal">&times;</button>
          </div>
          <div id="modal-body-organizacion" class="modal-body">
            <div class="col-md-12 row">
              <div class="col-md-12" align="center">
                <img id="img-proyect-org" style="max-width: 40%;margin-bottom: 20px;">
              </div>
              <div class="col-md-12">
                <p id="desc-org"></p>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>

    <?php require_once 'plantilla/footer.php'; ?>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/organizaciones.js?v=3"></script>
  </body>
</html>