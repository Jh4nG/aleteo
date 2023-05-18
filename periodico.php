<?php include "plantilla/head.php";?>
<link href="layout/styles/periodico.css" rel="stylesheet" type="text/css" media="all">

  <body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
   
    <div class="marginPeriodicoTop"></div>
    <div class="col-md-12 div-sec-periodico" align="center">
      <img src="images/img-project/LogoPeriodicoPrincipal.jpg" class="divImgPeriodicoTop" alt="">
    </div>
      <div class="contentDivPeriodico" >

        <div class="col-md-12 row">
          <div class="col-md-9 col-sm-12">
            <div class="col-md-12" style="border-radius: 15px;">
              <br>
              <div class="row ">
                  <div class="col-md-12">
                      <div class="col-md-12 divCentrado" id="principalNoticia">
                        
                      </div>
                  </div>
                  <div class="col-md-4" id="principalContent">
                  </div>
              </div>
            </div>
          </div>
          <div class="col-md-3 col-sm-12">
            <br>
            <h3 style="color:white">Comentarios</h3>
            <div class="col-md-12 cssComentarios" style="max-height: 470px;">
              <br>
              <textarea class="form-control" placeholder="Realizar Comentario " id="comentarioPeriodico"></textarea>
              <br>
              <button class="btn btn-primary pull-right" id="btnComentarioPeriodico" onclick="_Periodico.ingresarComent()">Comentar</button>
              <br><br>
              <div id="divOpiniones" class="divOpiniones"></div>
            </div>
            <br>
          </div>
          
          <div class="col-md-12" style="margin-top:20px;max-height: 700px;overflow: auto;">
            <div class="col-md-12 row" id="divSubNoticias"></div>
          </div>
        </div>
        
      </div>

    <div class="modal fade " id="modal-view-periodico" role="dialog">
      <div class="modal-dialog modal-lg" id="modal-large-dialog" style="max-width: 1200px;">
      
        <!-- Modal content-->
        <div class="modal-content bgDarkModal ModalRed">
          <div class="modal-header">
            <h4 id="modal-title-lg" class="modal-title"></h4>
            <button type="button" class="closeBg" data-dismiss="modal">&times;</button>
          </div>
          <div id="modal-body-lg-periodico" class="modal-body" style="background-image:url('images/img-project/Fondo 2.png');text-align: justify;">
          </div>
        </div>
        
      </div>
    </div>

    <?php require_once 'plantilla/footer.php'; ?>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/periodico.js?v=3"></script>
  </body>
</html>