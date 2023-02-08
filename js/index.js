var _Index = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        $('#Inicio').addClass('active'); // activa el botón del navegador
        traerInfoClt();
        threeCard();
        frasesInicio();
        contenidoDescipcion();
        contenidoSuscripcion();
    }

    /** Traer info Cliente */
    var traerInfoClt = ()=>{
        var ruta = 'Controller/Index.controller.php';
        var data = {"metodo":"traerInfoClt"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $('#nomClt').html(data[0].nombre);
        });
    }

    /** Traer información tres Cartas */
    var threeCard = ()=>{
        var ruta = 'Controller/Index.controller.php';
        var data = {"metodo":"threeCard"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            var text = '<ul class="nospace group">';
            $.each(data,(i,e)=>{
                if(i<=e.cant_reg){ 
                    addClass = "";
                    if(i==0){
                        addClass = "first";
                    }
                    pix = (e.sec_titulo.length>25) ? "155px":"160px";
                    
                    text += '<li class="one_third one_third_card '+addClass+'">'+
                            '<article>'+
                                '<div style="min-height: '+pix+';">'+
                                    '<h6 class="heading">'+e.sec_titulo+'</h6>'+
                                    '<p style="text-align:justify;">'+e.sec_desc.substr(0,110)+'[&hellip;]</p>'+
                                '</div>'+
                                '<img src="images/img-project/'+e.sec_img+'" alt="">'+
                                '<footer><a href="'+e.sec_link_redirect+'">Más Detalles</a></footer>'+
                            '</article>'+
                        '</li>';
                }
            });
            text += "</ul>";
            $('#introblocks').html(text);
        });
    }

    /** Traer frases Index */
    var frasesInicio = ()=>{
        var ruta = 'Controller/Index.controller.php';
        var data = {"metodo":"frasesInicio"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
        text = '<img src="images/img-project/'+data[0]['sec_img']+'">';
            $('#contectFrases').html(text);
        });
    }

    /** Trae contenido de Descipción */
    var contenidoDescipcion = () =>{
        var ruta = 'Controller/Index.controller.php';
        var data = {"metodo":"contenidoDescipcion"};
        var type = 'post';
        var text;
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $('#titleSobreContenido').html(data[0].sec_titulo);
            text = data[0].sec_desc.split('\n');
            $.each(text,(i,e)=>{
                $('#textSobreContenido').append('<p align="justify">'+e+'</p>');
            });
        });
    }

    /** Trae contenido de suscricpción */
    var contenidoSuscripcion = () =>{
        var ruta = 'Controller/Index.controller.php';
        var data = {"metodo":"contenidoSuscripcion"};
        var type = 'post';
        var text;
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            text = data[0].sec_desc.split('\n');
            $.each(text,(i,e)=>{
                $('#textSuscribete').append('<p align="justify">'+e+'</p>');
            });
        });
    }

    return {
        iniciar:iniciar
    }
})(jQuery);
$(document).ready(function(){
    _Index.iniciar();
    ingresoPagina('Inicio');
});