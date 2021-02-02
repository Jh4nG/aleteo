<?php include "plantilla/head.php";?>
<body id="top" class="bgded imgFirts">
    <!-- Incluyendo navegador -->
    <?php include "plantilla/navbar.php"; ?>
    <!-- ################################################################################################ -->

    <div style="margin-top:100px;"></div>

    <div class="col-md-12 row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <nav style="text-align:center">
                <div class="nav nav-tabs" id="nav-tab" role="tablist" style="display: inline-flex;">
                    <a class="nav-item nav-link active" id="nav-usuario-tab" data-toggle="tab" href="#nav-usuario" role="tab" aria-controls="nav-usuario" aria-selected="false" style="width: 400px;">Capítulos</a>
                    <a class="nav-item nav-link" id="nav-permisos-procesos-tab" data-toggle="tab" href="#nav-permisos-procesos" role="tab" aria-controls="nav-permisos-procesos" aria-selected="false" style="width: 400px;">Micro-Podcast</a>
                    <a class="nav-item nav-link" id="nav-perfiles-permisos-tab" data-toggle="tab" href="#nav-perfiles-permisos" role="tab" aria-controls="nav-perfiles-permisos" aria-selected="false" style="width: 400px;">Entrevistas</a>
                </div>
            </nav>
            <!-- ---------------Fin nav--------------------------- -->
            <!-------Inicio tab content----------------->
            <div class="tab-content col-md-12" id="nav-tabContent">
                <!-------Inicio panel usuario----------------->
                <div class="tab-pane show active" id="nav-usuario" role="tabpanel" aria-labelledby="nav-usuario-tab">
                    <div class="col-md-12 row">
                        Contenido 1
                    </div>
                </div>
        
                <div class="tab-pane fade" id="nav-permisos-procesos" role="tabpanel" aria-labelledby="nav-permisos-procesos-tab">
                    <div class="col-md-12 row">
                        Contenido 2
                    </div>
                </div>

                <div class="tab-pane fade" id="nav-permisos-procesos" role="tabpanel" aria-labelledby="nav-permisos-procesos-tab">
                    <div class="col-md-12 row">
                        Contenido 3
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>


    <!-- ################################################################################################ -->
    <!-- Incluyendo Footer -->
    <?php require_once 'plantilla/footer.php'; ?>
    <!-- ################################################################################################ -->
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <?php include 'plantilla/script.php' ?>
    <script type="text/javascript" src="js/podcast.js"></script>
</body>
</html>