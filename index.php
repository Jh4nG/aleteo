
<?php include "plantilla/head.php";?>
  <body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>

    <!-- Incluyendo Deslizador Inicio -->
      <!-- ################### Deslizador Principal ####################### -->
    <?php require_once 'secciones/home_deslPrincipal.php'; ?>
      <!-- ################### Fin Deslizador Principal ####################### -->
    
    <!-- Incluyendo Cartas Inicio -->
    <?php require_once 'secciones/home_threeCard.php'; ?>
    
    <!-- Incluyendo Sección de imágen azul -->
    <div class="wrapper bgded overlay imgSeconds">
      <section class="hoc container clear bgAleteoDiv"> 
        <!-- ################################################################################################ -->
        <div class="sectiontitle center">
          <h3 class="heading"></h3>
          <p></p>
        </div>
        <ul class="nospace group center">
          <li class="one_third first">
            <article><a href="#"></a>
              <h6 class="heading font-x1"></h6>
              <p></p>
              <footer></footer>
            </article>
          </li>
          <li class="one_third">
            <article><a href="#"></a>
              <h6 class="heading font-x1"></h6>
              <p></p>
              <footer></footer>
            </article>
          </li>
          <li class="one_third">
            <article><a href="#"></a>
              <h6 class="heading font-x1"></h6>
              <p></p>
              <footer></footer>
            </article>
          </li>
        </ul>
        <!-- ################################################################################################ -->
      </section>
    </div>

    <!-- Incluyendo Frases Inicio -->
    <?php require_once 'secciones/home_frasesInicio.php'; ?>
    <!-- ################################################################################################ -->

    <div class="wrapper row3">
      <div class="hoc container clear divDatosPagina"> 
        <!-- ################################################################################################ -->
        <div class="group">
          <?php include 'secciones/home_datosPagina.php' ?>
        </div>
        <!-- ################################################################################################ -->
      </div>
    </div>
    <!-- ################################################################################################ -->
    <!-- Incluyendo Footer -->
    <?php require_once 'plantilla/footer.php'; ?>
    <!-- ################################################################################################ -->
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/index.js"></script>
  </body>
</html>