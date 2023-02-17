
<div id="particle-slider"></div>

<style>
.imgPodcast{
  border:10px solid black;
  display:inline-block;
  position:relative;
  width:100%;
  height:100vh;
  overflow:hidden;
  box-sizing:border-box;
}


.tile{
  position:relative;
  vertical-align:top;
  display:inline-block;
  border-right:1px solid rgba(0, 0, 0, 0.5);
  border-bottom:1px solid rgba(0, 0, 0, 0.5);  
  box-sizing:border-box;
}

.tile:after{
  content:"";
  background-color:#cc1c32;
  width:6px;
  height:6px;
  position:absolute;
  top:100%;
  right:0px;
  transform:translate(50%, -50%);
  z-index:2;
  line-height:1;
}

/*-- no grid --*/

.noGrid .tile{
  border-right:0px solid rgba(0, 0, 0, 0.5);
  border-bottom:0px solid rgba(0, 0, 0, 0.5);
}

.noGrid .tile:after{
  content:none;
}
</style>

<div class="imgPodcast">
  <div class="getPodcast imgPuntos imgPuntoPodcast" data-category="1" data-toggle="tooltip" data-placement="top" title="Podcast"></div>
  <div class="getPodcast imgPuntos imgPuntoMicroPodcast" data-category="2" data-toggle="tooltip" data-placement="top" title="Micro - Podcast"></div>
  <div class="getPodcast imgPuntos imgPuntoEntrevistas" data-category="3" data-toggle="tooltip" data-placement="top" title="Entrevistas"></div>
  <div class="imgPuntos imgPuntoEstrella" data-category="" data-toggle="tooltip" data-placement="top" title="Próximamente"></div>
</div>