<?php include "plantilla/head.php";?>

  <body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
   
    <div style="margin-top:100px;"></div>
      <div class="contentDivPeriodico" >

        <div class="col-md-12 row">
          <div class="col-md-9 col-sm-12">
            <div class="col-md-12" style="border-radius: 15px;">
              <br>
              <div class="row ">
                  <div class="col-md-8">
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
            <div class="col-md-12" style="background-color:white;border-radius: 15px; overflow: scroll; max-height: 470px;">
              <br>
              <textarea class="form-control" placeholder="Realizar Comentario " id="comentarioPeriodico"></textarea>
              <br>
              <button class="btn btn-primary pull-right" id="btnComentarioPeriodico" onclick="_Periodico.ingresarComent()">Comentar</button>
              <br><br>
              <div id="divOpiniones"></div>
            </div>
            <br>
          </div>
          
          <div class="col-md-12" style="margin-top:20px;max-height: 700px;overflow: auto;">
            <div class="col-md-12 row" id="divSubNoticias" style="">
            </div>
          </div>
        </div>
        
      </div>

    <div class="modal fade " id="modal-view-periodico" role="dialog">
      <div class="modal-dialog modal-lg" id="modal-large-dialog" style="max-width: 1200px;">
      
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 id="modal-title-lg" class="modal-title"></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div id="modal-body-lg-periodico" class="modal-body" style="background-image:url('images/img-project/Fondo 2.png');text-align: justify;">
          </div>
        </div>
        
      </div>
    </div>

    <?php require_once 'plantilla/footer.php'; ?>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/periodico.js"></script>
  </body>
</html>