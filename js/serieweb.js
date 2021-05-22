var _SerieWeb = (function (){

    var current = 0;
    var dataGlobal = new Array();
    var idVideoActual = 0;
    var ruta = 'Controller/Serie.controller.php';
    
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(5);
        $('#Serie').addClass('active'); // activa el botón del navegador
        listarOpiniones();
        listarContenido();
    }

    var listarContenido = ()=>{
        var data = {"metodo":"listarContenido"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            dataGlobal = data;
            $('#divContentContenidoSerie').html('<br><h4><b>Capítulos - Serie Web</b></h4>');
            if(data){

                // Setear id actual seleccioando
                idVideoActual = (data.serie.length>0)?data.serie[0].id:data.adicional[0].id;
                $.each(data.serie, function(i, e){
                    $('#divContentContenidoSerie').append(
                        '<div class="row cssDivEntrevisContent" id="section_div_'+e.id+'">'+
                            '<div class="col-md-5 col-sm-5 col-6" style="margin-top:5px;">'+
                                '<div class="col-md-12">'+
                                    '<img src="images/img-project/'+e.serie_img+'">'+
                                '</div>'+
                            '</div>'+
                            '<div class="col-md-7 col-sm-7 col-6" style="margin-top:5px;">'+
                                '<h5><b>'+e.serie_titulo+'</b></h5>'+
                                '<p>'+e.serie_descipcion.substr(0,100)+'...'+'</p>'+
                            '</div>'+
                        '</div>');
                });

                $.each(data.adicional, function(i, e){
                    active = '';
                    if(i == 0){
                        active = 'active';
                    }
                    $('#divContentContenidoAdicional').append(
                        '<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3 cssProduct '+active+' " id="section_div_'+e.id+'">'+
                            '<div class="col-md-12" align="center">'+
                                '<img src="images/img-project/'+e.serie_img+'" class="imgDivSlider" alt="slide 1">'+
                            '</div>'+
                            '<h5>'+e.serie_titulo+'</h5>'+
                            '<p>'+e.serie_descipcion.substr(0,100)+'...'+'</p>'+
                        '</div>');
                });
                $('#divContentContenidoAdicional').addClass('carousel-inner row w-100 mx-auto');

                iniciarCarrusel();
                $('#section_div_'+idVideoActual).addClass('selectorVideo');
                // Identificar que sección es el que está seleccionado
                var dataSelect = ($('#section_div_'+idVideoActual).prop('class').indexOf('cssDivEntrevisContent') >=0)? dataGlobal.serie: dataGlobal.adicional;
                $.each(dataSelect,(i,e)=>{
                    if(idVideoActual == e.id){
                        $('#vidPrincipal').html(e.serie_video.replace('<iframe','<iframe class="cssDivVideoPrincipal"'));
                        $('#titleVidPrincipal').html(e.serie_titulo);
                        $('#descVidPrincipal').html(e.serie_descipcion);
                        return;
                    }
                });

                $('[id^="section_div_"]').on('click',(e)=>{
                    _SerieWeb.selectorDataVideo(e.currentTarget.id);
                    $('html,body').animate({scrollTop:0},{duration:"slow"})
                });
            }
        });
    }

    var iniciarCarrusel  = () => {
        $('#carouselExample').on('slide.bs.carousel', function (e) {
            var $e = $(e.relatedTarget);
            var idx = $e.index();
            var totalItems = $('.carousel-item').length;            
            var itemsPerSlide = totalItems-1;
            if (idx >= totalItems-(itemsPerSlide-1)) {
                var it = itemsPerSlide - (totalItems - idx);
                for (var i=0; i<it; i++) {
                    // append slides to end
                    if (e.direction=="left") {
                        $('.carousel-item').eq(i).appendTo('.carousel-inner');
                    }
                    else {
                        $('.carousel-item').eq(0).appendTo('.carousel-inner');
                    }
                }
            }
        });
    }

    var selectorDataVideo = (selector)=>{
        $('[id^="section_div_"]').removeClass('selectorVideo');
        $('#'+selector).addClass('selectorVideo');
        var idSelector = selector.replace('section_div_','');
        var dataSelect = ($('#'+selector).prop('class').indexOf('cssDivEntrevisContent') >=0)? dataGlobal.serie: dataGlobal.adicional;
        $.each(dataSelect,(i,e)=>{
            if(e.id == idSelector && idVideoActual != e.id){
                $('#vidPrincipal').html(e.serie_video.replace('<iframe','<iframe class="cssDivVideoPrincipal"'));
                $('#titleVidPrincipal').html(e.serie_titulo);
                $('#descVidPrincipal').html(e.serie_descipcion);
                idVideoActual = e.id;
                return;
            }
        });
    }


    var listarOpiniones = () => {
        $("#divOpinionesSerieWeb").html('');
        var data = {"metodo":"listarOpiniones"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                var article = '<article>'+
                                    '<b>Anónimo</b>'+
                                    '<footer>'+val.texto_opinion+'</footer>'+
                                    '<b>'+val.fecha_opinion_text+'</b>'+
                                '</article><br>';
                $("#divOpinionesSerieWeb").append(article);            
            });
        });
    }

    var ingresarComent = () =>{
        var coment = $("#comentarioSerieWeb").val();
        if(coment == ''){
            swal("Advertencia!", "El comentario no debe ir vacío!",_warning);
        }

        var data = {"metodo":"uploadComment","parametros":{'coment':coment}};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            if(data == "groseria"){
                swal("Advertencia!", "No se permite lenguaje ofensivo!",_warning);
            }else if (data == 'insert'){
                swal("Exito", "Comentario agregado!",_success);
                $("#comentarioSerieWeb").val('');
                listarOpiniones();
            }else{
                swal("Error", "Ha habido un problema!",_error);
            }
        });

    }

    return {
        iniciar:iniciar,
        selectorDataVideo:selectorDataVideo,
        ingresarComent:ingresarComent
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Serie Web');
    _SerieWeb.iniciar();
});