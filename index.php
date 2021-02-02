
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
      <div class="hoc container clear"> 
        <!-- ################################################################################################ -->
        <div class="group">
          <section class="one_half first">
            <h6 class="heading btmspace-50">From The Blog</h6>
            <ul class="nospace">
              <li class="btmspace-30">
                <article>
                  <h4 class="nospace"><a href="#">Facilisis mauris tellus gravida elit ac eleifend nunc lorem</a></h4>
                  <time class="font-xs" datetime="2045-04-06">Friday, 6<sup>th</sup> April 2045</time>
                </article>
              </li>
              <li class="btmspace-30">
                <article>
                  <h4 class="nospace"><a href="#">Felis turpis semper at velit non porttitor semper libero</a></h4>
                  <time class="font-xs" datetime="2045-04-05">Thursday, 5<sup>th</sup> April 2045</time>
                </article>
              </li>
              <li>
                <article>
                  <h4 class="nospace"><a href="#">Dignissim arcu nec vulputate purus semper aliquam rhoncus</a></h4>
                  <time class="font-xs" datetime="2045-04-04">Wednesday, 4<sup>th</sup> April 2045</time>
                </article>
              </li>
            </ul>
          </section>
          <section class="one_half">
            <h6 class="heading btmspace-50">Suscribete</h6>
            <p>Sed a eros ornare pulvinar lorem eget volutpat ex fusce sollicitudin porta erat ac dictum sed nec augue augue praesent congue.</p>
            <p class="btmspace-30">Ullamcorper neque a bibendum dolor placerat non nulla facilisi nullam ac velit.</p>
            <form id="newsletter" method="post" action="#">
              <fieldset>
                <legend>Newsletter:</legend>
                <input class="btmspace-15" type="text" value="" placeholder="Name">
                <input class="btmspace-15" type="text" value="" placeholder="Email">
                <button type="submit" value="submit">Submit</button>
              </fieldset>
            </form>
          </section>
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