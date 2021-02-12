var _PodcastWeb = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        $('#Podcast').addClass('active'); // activa el botón del navegador
    }

    var traerPodcast = () =>{
        // swal("", "Cargando!",_warning);

        var ruta = 'Controller/Podcast.controller.php';
        var data = {"metodo":"listarPodcast"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                if (val.categoria == 1){
                    var card1 = '<div class="row">'+
                                    '<div class="col-md-12">'+
                                        '<div class="card">'+
                                            '<h5 class="card-header">Capítulos</h5>'+
                                            '<div class="card-body">'+
                                                '<h5 class="card-title">'+val.nombre+'</h5>'+
                                                '<p class="card-text">'+val.descripcion+'</p>'+
                                                '<audio src="" controls autoplay loop style="width:100%">'+
                                                '<p>Tu navegador no implementa el elemento audio</p>'+
                                                '</audio>'+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</div><br>';

                    
                    $("#v-pills-capitulos").append(card1);
                }else if (val.categoria == 2){
                    var card2 = '<div class="row">'+
                                    '<div class="col-md-12">'+
                                        '<div class="card">'+
                                            '<h5 class="card-header">Micro-Podcast</h5>'+
                                            '<div class="card-body">'+
                                                '<h5 class="card-title">'+val.nombre+'</h5>'+
                                                '<p class="card-text">'+val.descripcion+'</p>'+
                                                '<audio src="" controls autoplay loop style="width:100%">'+
                                                '<p>Tu navegador no implementa el elemento audio</p>'+
                                                '</audio>'+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</div><br>';

                    
                    $("#v-pills-micro_podcast").append(card2);
                }
                else if (val.categoria == 3){
                    var card3 = '<div class="row">'+
                                    '<div class="col-md-12">'+
                                        '<div class="card">'+
                                            '<h5 class="card-header">Entrevistas</h5>'+
                                            '<div class="card-body">'+
                                                '<h5 class="card-title">'+val.nombre+'</h5>'+
                                                '<p class="card-text">'+val.descripcion+'</p>'+
                                                '<audio src="" controls autoplay loop style="width:100%">'+
                                                '<p>Tu navegador no implementa el elemento audio</p>'+
                                                '</audio>'+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</div><br>';

                    
                    $("#v-pills-entrevistas").append(card3);
                }
            });
        });
    }

    return {
        iniciar:iniciar,
        traerPodcast:traerPodcast
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Podcast');
    _PodcastWeb.iniciar();
    _PodcastWeb.traerPodcast();
});