var _PodcastWeb = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(2);
        $('#Podcast').addClass('active'); // activa el botón del navegador
    }

    var traerPodcast = () =>{
        // swal("", "Cargando!",_warning);

        var ruta = 'Controller/Podcast.controller.php';
        var data = {"metodo":"listarPodcast"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                descripcion = val.descripcion.split('\n');
                desc = "";
                $.each(descripcion,(i,e)=>{
                    desc += '<p class="card-text">'+e+'</p>';
                });
                if (val.categoria == 1){
                    var card1 = '<div class="row">'+
                                    '<div class="col-md-12">'+
                                        '<div class="card">'+
                                            '<h5 class="card-header"><b>Capítulos</b></h5>'+
                                            '<div class="card-body">'+
                                                '<h5 class="card-title"><b>'+val.nombre+'</b></h5>'+
                                                desc+
                                                '<audio src="audios/'+val.link+'" controls loop style="width:100%">'+
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
                                            '<h5 class="card-header"><b>Micro-Podcast</b></h5>'+
                                            '<div class="card-body">'+
                                                '<h5 class="card-title"><b>'+val.nombre+'</b></h5>'+
                                                desc+
                                                '<audio src="audios/'+val.link+'" controls loop style="width:100%">'+
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
                                            '<h5 class="card-header"><b>Entrevistas</b></h5>'+
                                            '<div class="card-body">'+
                                                '<h5 class="card-title"><b>'+val.nombre+'</b></h5>'+
                                                desc+
                                                '<audio src="audios/'+val.link+'" controls loop style="width:100%">'+
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