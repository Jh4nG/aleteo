<?php include "plantilla/head.php";?>

<body id="top" class="bgded imgFirts">
  <!-- Incluyendo navegador -->
  <?php include "plantilla/navbar.php"; ?>

  <div style="margin-top:100px;"></div>

  <div class="divContainerSerie">
    <div class="col-md-12 row" style="background-color: rgb(0 0 0 / 80%);">
		<div class="col-md-12 col-sm-12 col-lg-8">
			<div style="background-color:transparent;color:white;border-radius:5px;">
				<div id="vidPrincipal"></div>
				<div class="col-md-12">
					<h4 id="titleVidPrincipal"></h4>
					<p id="descVidPrincipal"></p>
				</div>
			</div>
		</div>
		
		<div class="col-md-12 col-sm-12 col-lg-4 cssDivsEntrevistas" id="divContentContenidoSerie">
		</div>
		
		<br><br>
		<!-- Carusel -->
		<div class="container-fluid" style="margin-top:20px;background-color:black;">
			<div id="carouselExample" class="carousel slide" data-ride="carousel" data-interval="900000">
				<h3 class="titleDivCapitulosSerie"><b>Contenidos Adicionales</b></h3>
				<div id="divContentContenidoAdicional" class="carousel-inner row w-100 mx-auto" role="listbox">
				</div>
				<a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
					<i class="fa fa-chevron-left fa-lg"></i>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next text-faded" href="#carouselExample" role="button" data-slide="next">
					<i class="fa fa-chevron-right fa-lg"></i>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>


		<div class="col-sm-12">
			<br>
			<h3 style="color:white;"><b style="background-color:black;">Comentarios</b></h3>
			<div class="col-md-12" style="background-color:white;border-radius: 15px; overflow: scroll; max-height: 470px;">
				<br>
				<textarea class="form-control" placeholder="Realizar Comentario " id="comentarioSerieWeb"></textarea>
				<br>
				<button class="btn btn-primary pull-right" id="btnComentarioSerieWeb" onclick="_SerieWeb.ingresarComent()">Comentar</button>
				<br><br>
				<div id="divOpinionesSerieWeb"></div>
			</div>
			<br>
		</div>
		
    </div>
	

  </div>

 
  <?php require_once 'plantilla/footer.php'; ?>
  <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
  <?php include 'plantilla/script.php' ?>
  <script type="text/javascript" src="js/serieweb.js"></script>
</body>
</html>