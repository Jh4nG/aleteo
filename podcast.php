<?php include "plantilla/head.php";?>
  <link href="layout/styles/podcast.css?v=2" rel="stylesheet" type="text/css" media="all">
  <body id="top" class="particle-slider bgded imgFirts">
    
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
      <div style="margin-top: 5%;"></div>
      <!-- <div class="contentDivPodcast row" >
      
        <div class="col-md-9 row">
          <div class="nav flex-column nav-pills col-md-2" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-pills-capitulos-tab" data-toggle="pill" href="#v-pills-capitulos" role="tab" aria-controls="v-pills-capitulos" aria-selected="true">Capítulos</a>
            <a class="nav-link" id="v-pills-micro_podcast-tab" data-toggle="pill" href="#v-pills-micro_podcast" role="tab" aria-controls="v-pills-micro_podcast" aria-selected="false">Micro-Podcast</a>
            <a class="nav-link" id="v-pills-entrevistas-tab" data-toggle="pill" href="#v-pills-entrevistas" role="tab" aria-controls="v-pills-entrevistas" aria-selected="false">Entrevistas</a>
          </div>
          
          <div class="tab-content col-md-10" id="v-pills-tabContent" style="max-height: 650px;overflow: auto;background-size: cover;">
            <div class="tab-pane fade show active" id="v-pills-capitulos" role="tabpanel" aria-labelledby="v-pills-capitulos-tab"></div>
            <div class="tab-pane fade" id="v-pills-micro_podcast" role="tabpanel" aria-labelledby="v-pills-micro_podcast-tab"></div>
            <div class="tab-pane fade" id="v-pills-entrevistas" role="tabpanel" aria-labelledby="v-pills-entrevistas-tab"></div>
          </div>
        </div>
        
        <div class="col-md-3 col-sm-12">
            <br>
            <div class="col-md-12" style="background-color:white;border-radius: 15px; overflow: scroll; max-height: 470px;">
              <br>
              <textarea class="form-control" placeholder="Realizar Comentario " id="comentarioPodcast"></textarea>
              <br>
              <button class="btn btn-primary pull-right" id="btnComentarioPodcast" onclick="_PodcastWeb.ingresarComent()">Comentar</button>
              <br><br>
              <div id="divOpiniones"></div>
            </div>
            <br>
        </div>
      </div> -->

      <?php include 'componentes/componentePodcastImg.php'; ?>
      

      <div class="col-md-12 col-sm-12" align="center">
          <br>
          <h3 style="color:white">Comentarios</h3>
          <div class="col-md-6 cssComentarios" style="max-height: 470px;" align="left">
            <br>
            <textarea class="form-control" placeholder="Realizar Comentario " id="comentarioPodcast"></textarea>
            <br>
            <button class="btn btn-primary pull-right" id="btnComentarioPodcast" onclick="_PodcastWeb.ingresarComent()">Comentar</button>
            <br><br>
            <div id="divOpiniones" class="divOpiniones"></div>
          </div>
          <br>
      </div>

      <div class="modal fade " id="modal-view-podcast" role="dialog">
        <div class="modal-dialog modal-lg" id="modal-large-dialog">
        
          <!-- Modal content-->
          <div class="modal-content bgDarkModal ModalBlue">
            <div class="modal-header">
              <h4 id="modal-title-lg" class="modal-title"></h4>
              <button type="button" class="closeBg" data-dismiss="modal">&times;</button>
            </div>
            <div id="modal-body-lg-podcast" class="modal-body">
              <div id="contentPodcast" style="padding-right: 50px;padding-left: 50px;"></div>
            </div>
          </div>
          
        </div>
      </div>
    <?php require_once 'plantilla/footer.php'; ?>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/podcastComponent.js"></script>
    <script type="text/javascript" src="js/podcast.js?v=3"></script>
  </body>
</html>