<?php include "plantilla/head.php";?>

  <body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
    <div style="margin-top:100px;"></div>
    
  <div class="col-md-12 marginFuturoTop">
    <img src="images/img-project/Nuestrofuturopresente-02-02.jpg">
  </div>
  <br>
    <div class="col-md-12">
      <div class="col-md-12 divFuturoCss">
      </div>
      
      
      <div class="col-sm-12">
        <br>
        <h3 style="color:white">Comentarios</h3>
        <div class="col-md-12" style="background-color:white;border-radius: 15px; overflow: scroll; max-height: 470px;">
          <br>
          <textarea class="form-control" placeholder="Realizar Comentario " id="comentarioFuturo"></textarea>
          <br>
          <button class="btn btn-primary pull-right" id="btnComentarioFuturo" onclick="_Futuro.ingresarComent()">Comentar</button>
          <br><br>
          <div id="divOpinionesFuturo"></div>
        </div>
        <br>
      </div>
    </div>

    <div style="margin-top:100px;"></div>
    <div style="margin-top:100px;"></div>
    <div style="margin-top:100px;"></div>
    <?php require_once 'plantilla/footer.php'; ?>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/haciaelfuturo.js?v=<?php echo TIME?>"></script>
  </body>
</html>