<?php include "plantilla/head.php";?>

  <body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
      <div style="margin-top:100px;"></div>
      <div class="contentDivPodcast" >
      
        <div class="col-md-12 row">
          <div class="nav flex-column nav-pills col-md-2" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-pills-capitulos-tab" data-toggle="pill" href="#v-pills-capitulos" role="tab" aria-controls="v-pills-capitulos" aria-selected="true">Capítulos</a>
            <a class="nav-link" id="v-pills-micro_podcast-tab" data-toggle="pill" href="#v-pills-micro_podcast" role="tab" aria-controls="v-pills-micro_podcast" aria-selected="false">Micro-Podcast</a>
            <a class="nav-link" id="v-pills-entrevistas-tab" data-toggle="pill" href="#v-pills-entrevistas" role="tab" aria-controls="v-pills-entrevistas" aria-selected="false">Entrevistas</a>
          </div>
          
          <div class="tab-content col-md-10" id="v-pills-tabContent" style="background-image: url(images/img-project/FondoAzul.png);max-height: 650px;overflow: auto;">
            <div class="tab-pane fade show active" id="v-pills-capitulos" role="tabpanel" aria-labelledby="v-pills-capitulos-tab"></div>
            <div class="tab-pane fade" id="v-pills-micro_podcast" role="tabpanel" aria-labelledby="v-pills-micro_podcast-tab"></div>
            <div class="tab-pane fade" id="v-pills-entrevistas" role="tabpanel" aria-labelledby="v-pills-entrevistas-tab"></div>
          </div>
        </div>
      </div>
      <div style="margin-top:100px;"></div>
      <div style="margin-top:100px;"></div>
      <div style="margin-top:100px;"></div>
      <div style="margin-top:100px;"></div>
    <?php require_once 'plantilla/footer.php'; ?>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/podcast.js"></script>
  </body>
</html>