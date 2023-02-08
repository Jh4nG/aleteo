var _Periodico = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(3);
        $('#Periodico').addClass('active'); // activa el botón del navegador
        listarPeriodico();
    }

    var listarPeriodico =() =>{
        var ruta = 'Controller/Periodico.controller.php';
        var data = {"metodo":"listarPeriodico"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            if(data){
                $.each(data,(i,e)=>{
                    if(i==0){
                        text = `
                        <div class="glitch">
                            <img src="images/img-project/${e.per_link_img}" class="divImg">
                            <div class="centrado">
                                <a href="#!" onclick="_Periodico.viewPer(${e.id_periodico})">
                                <h4>${e.per_titulo}</h4>
                                </a>
                                ${e.per_contratitulo}
                                <div style="float:right;margin: 13px 0px 0px 0px;">
                                    <time >${e.fecha_publico}</time>
                                </div>
                            </div>
                            <div class="glitch__layers" data-img="${e.per_link_img}">
                            </div>
                        </div>
                                `;
                        $('#principalNoticia').append(text);
                    }else{
                        text = '<div class="col-md-4 col-sm-12">'+
                                    '<div class="divCentrado glitch">'+
                                        '<img src="images/img-project/'+e.per_link_img+'" class="divImg2">'+
                                        '<div class="centrado2">'+
                                            '<a href="#!" onclick="_Periodico.viewPer('+e.id_periodico+')">'+
                                                '<h4>'+e.per_titulo+'</h4>'+
                                            '</a>'+
                                            '<div style="float:right;margin: 13px 0px 0px 0px;">'+
                                                '<time >'+e.fecha_publico+'</time>'+
                                            '</div>'+
                                        '</div>'+
                                        `<div class="glitch__layers" data-img="${e.per_link_img}"></div>`+
                                    '</div>'+
                                '</div>';
                        $('#divSubNoticias').append(text);
                    }
                });
                $(".glitch__layers").hover(function(){
                    $(this).html('<div class="glitch__layer"></div><div class="glitch__layer"></div><div class="glitch__layer"></div>');
                    $('.glitch__layer').css('background-image',`url(images/img-project/${$(this).data('img')})`);
                }, function(){
                    $('.glitch__layer').css('background-image','');
                    $(this).html('');
                });
                $(".centrado,.centrado2").hover(function(){
                    $(this).parent().children('div.glitch__layers').html('<div class="glitch__layer"></div><div class="glitch__layer"></div><div class="glitch__layer"></div>');
                    $('.glitch__layer').css('background-image',`url(images/img-project/${$(this).parent().children('div.glitch__layers').data('img')})`);
                }, function(){
                    $('.glitch__layer').css('background-image','');
                    $(this).parent().children('div.glitch__layers').html('');
                });
            }
        });
    }

    var viewPer = (id)=>{
        var ruta = 'Controller/Periodico.controller.php';
        var data = {"metodo":"getPeriodico","parametros":{'id':id}};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $('#modal-title-lg').html('<h1><b>'+data[0].per_titulo+'</b></h1>');
            $('#modal-body-lg-periodico').html('');
            $('#modal-body-lg-periodico').append('<div class="divImgPeriodico glitch">'+
                                                    '<img src="images/img-project/'+data[0].per_link_img+'" >'+
                                                    '<div class="centradoDivPer">'+
                                                        '<p>'+data[0].	per_link_pie_img+'</p>'+
                                                    '</div>'+
                                                    '<div class="glitch__layers"><div class="glitch__layer"></div><div class="glitch__layer"></div><div class="glitch__layer"></div></div>'+
                                                 '</div>');
            $('#modal-body-lg-periodico').append(data[0].per_texto);            
            $('#modal-view-periodico').modal('show');
            setTimeout(() => {
                $('.glitch__layer').css('background-image',`url(images/img-project/${data[0].per_link_img})`);
            }, 1000);
        });
    }

    var listarOpiniones = () => {
        $("#divOpiniones").html('');
        var ruta = 'Controller/Periodico.controller.php';
        var data = {"metodo":"listarOpiniones"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                var article = '<article>'+
                                    '<b>Anónimo</b>'+
                                    '<footer>'+val.texto_opinion+'</footer>'+
                                    '<b>'+val.fecha_opinion_text+'</b>'+
                                '</article><br>';
                $("#divOpiniones").append(article);            
            });
        });
    }

    var ingresarComent = () =>{
        var coment = $("#comentarioPeriodico").val();
        if(coment == ''){
            swal("Advertencia!", "El comentario no debe ir vacío!",_warning);
        }
        
        var ruta = 'Controller/Periodico.controller.php';
        var data = {"metodo":"uploadComment","parametros":{'coment':coment}};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            if(data == "groseria"){
                swal("Advertencia!", "No se permite lenguaje ofensivo!",_warning);
            }else if (data == 'insert'){
                swal("Exito", "Comentario agregado!",_success);
                $("#comentarioPeriodico").val('');
                listarOpiniones();
            }else{
                swal("Error", "Ha habido un problema!",_error);
            }
        });

    }

    return {
        iniciar:iniciar,
        viewPer:viewPer,
        ingresarComent:ingresarComent,
        listarOpiniones:listarOpiniones
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Periodico Digital');
    _Periodico.iniciar();
    _Periodico.listarOpiniones();
});