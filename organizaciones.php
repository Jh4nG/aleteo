<?php include "plantilla/head.php";?>

  <body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
    <div style="margin-top:100px;"></div>
    <div class="contentDivOrg" style="">
        <h2 style="color:white;">Organizaciones</h2>
        <div class="col-md-12">
            <div class="row" id="divOrg"></div>
        </div><hr>
        <h2 style="color:white;">Aliados</h2>
        <div class="col-md-12">
            <div class="row" id="divAliados"></div>
        </div>
    </div>
    <?php require_once 'plantilla/footer.php'; ?>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/organizaciones.js"></script>
  </body>
</html>