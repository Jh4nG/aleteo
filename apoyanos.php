<?php include "plantilla/head.php";?>

  <style>
    .overlay::after{
      height: 230vh;
    }
  </style>
  <body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
    <div style="margin-top:100px;"></div>
    
  <div class="col-md-12 marginApoyanosTop">
    <h1 id="tittleApoyanos" style="color:white;"></h1>
  </div>
  
  
  <div class="col-md-12 row" style="text-align:justify;">
    <div class="col-md-8">
      <div id="descApoyanos" style="color:white;text-transform: none !important;"></div>
    </div>
    <div class="col-md-4">
      <div class="">
        <img id="imgApoyanos"> 
      </div>
    </div>
    <div class="col-md-12">
      <div class="col-md-12" align="center">
        <h3 style="color:white;background: rgba(0,0,0,0.7);">VAKI</h3>
        <div class="col-md-12" align="center" id="videoApoyanos">
          <!-- <iframe id="videoApoyanos" width="650" height="400" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
        </div>
      </div>
    </div>
    <div class="col-sm-12">
      <br>
      <h3 style="color:white">Comentarios</h3>
      <div class="col-md-12" style="background-color:white;border-radius: 15px; overflow: scroll; max-height: 470px;">
        <br>
        <textarea class="form-control" placeholder="Realizar Comentario " id="comentarioApoyanos"></textarea>
        <br>
        <button class="btn btn-primary pull-right" id="btnComentarioApoyanos" onclick="_Apoyanos.ingresarComent()">Comentar</button>
        <br><br>
        <div id="divOpinionesApoyanos"></div>
      </div>
      <br>
    </div>
  </div>
  
    <?php require_once 'plantilla/footer.php'; ?>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/apoyanos.js?v=<?php echo TIME?>"></script>
  </body>
</html>