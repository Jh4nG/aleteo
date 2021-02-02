var _Index = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        $('#Inicio').addClass('active'); // activa el botón del navegador
        traerInfoClt();
        threeCard();
        frasesInicio();
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
                    text += '<li class="one_third '+addClass+'">'+
                            '<article>'+
                                '<div style="min-height: 155px;">'+
                                    '<h6 class="heading">'+e.sec_titulo+'</h6>'+
                                    '<p>'+e.sec_desc+'[&hellip;]</p>'+
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
            // $.each(data,(i,e)=>{
                // if(i<=e.cant_reg){ 
                //     text += '<li class="three_third first">'+
                //         '<article><a href="#"><i class="btmspace-30 icon '+e.sec_icon+'"></i></a>'+
                //         '<h6 class="heading font-x1">'+e.sec_titulo+'</h6>'+
                //         '<p>'+e.sec_desc+'</p>'+
                //         '</article>'+
                //     '</li>';
                // }
            // });
            $('#contectFrases').html(text);
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