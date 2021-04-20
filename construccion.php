<?php include "plantilla/head.php";?>

  <body id="top" class="bgded imgFirts">
    <?php include "plantilla/navbar.php"; ?>
    <br>
    <div id="" align="center"> 
      <div class="" style="margin-top: 55px;">
        <?php if($_GET['p'] == 'Ng=='){?>
          <img id="imgConstruc"><br><br>
          <h4 style="color:white;font-family: cursive;">Andamos hacia el futuro...</h4>
          <h4 style="color:white;font-family: cursive;">¡Muy pronto...!</h4><br>
        <?php }else{ ?>
          <img id="imgConstruc">
        <?php } ?>
      </div>

    </div>
    <!-- ################################################################################################ -->
    <!-- Incluyendo Footer -->
    <?php require_once 'plantilla/footer.php'; ?>
    <!-- ################################################################################################ -->
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/construccion.js?v=<?php echo TIME?>"></script>
    <script type="text/javascript">
      $(document).ready(function(){
          _Construccion.iniciar(<?php echo "'".$_GET['p']."'"; ?>);
      });
    </script>
  </body>
</html>