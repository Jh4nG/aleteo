var _Futuro = (function (){

    var ruta = 'Controller/Futuro.controller.php';

    var iniciar = () =>{
        listarPublicaciones();
        listarOpiniones();
    }

    var listarPublicaciones = ()=>{
        var data = {"metodo":"getPublicaciones"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            if(data){
                $('.divFuturoCss').html('');
                $.each(data,(i,e)=>{
                    $('.divFuturoCss').append('<div class="row">'+
                                                    '<div class="col-md-12">'+
                                                        '<div class="card" style="width:100%;">'+
                                                            '<h5 class="card-header"><b>'+e.fut_titulo+'</b></h5>'+
                                                            '<div class="card-body">'+
                                                                '<div class="col-md-12 row">'+
                                                                    '<div class="col-md-2"><img src="images/img-project/'+e.fut_imagen+'" style="width="100%;"></div>'+
                                                                    '<div class="col-md-10 divFuturo" align="justify">'+e.fut_descripcion+'</div>'+
                                                                    '<div class="col-md-12"><b style="float: right;">'+e.fecha_creacion_text+'</b></div>'+
                                                                '</div>'+
                                                            '</div>'+
                                                        '</div>'+
                                                    '</div>'+
                                                '</div><br>');
                });
            }else{
                console.log('Error ingreso');
            }
        });
    }

    var listarOpiniones = () => {
        $("#divOpinionesFuturo").html('');
        var data = {"metodo":"listarOpiniones"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                var article = '<article>'+
                                    '<b>Anónimo</b>'+
                                    '<footer>'+val.texto_opinion+'</footer>'+
                                    '<b>'+val.fecha_opinion_text+'</b>'+
                                '</article><br>';
                $("#divOpinionesFuturo").append(article);            
            });
        });
    }

    var ingresarComent = () =>{
        var coment = $("#comentarioFuturo").val();
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
                $("#comentarioFuturo").val('');
                listarOpiniones();
            }else{
                swal("Error", "Ha habido un problema!",_error);
            }
        });

    }

    return {
        iniciar:iniciar,
        ingresarComent:ingresarComent
    }

})(jQuery);
$(document).ready(function(){
    ingresoPagina('Hacia el Futuro');
    _Futuro.iniciar();
});