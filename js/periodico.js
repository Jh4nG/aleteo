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
                        text = '<img src="images/img-project/'+e.per_link_img+'" class="divImg">'+
                                    '<div class="centrado">'+
                                        '<a href="#" onclick="_Periodico.viewPer('+e.id_periodico+')">'+
                                            '<h4>'+e.per_titulo+'</h4>'+
                                        '</a>'+
                                        e.per_contratitulo+
                                    '<div style="float:right;margin: 13px 0px 0px 0px;">'+
                                        '<time >'+e.fecha_publico+'</time>'+
                                    '</div>'+
                                '</div>';
                        $('#principalNoticia').append(text);
                        // textContent = ' <h5>'+e.per_contratitulo+'</h5><br>'+
                        //                     e.per_texto.substr(0,300)+' ...',
                        //                 '<br>';
                        // $('#principalContent').append(textContent);
                        
                    }else{
                        text = '<div class="col-md-4 col-sm-12">'+
                                    '<div class="col-md-12 divCentrado">'+
                                        '<img src="images/img-project/'+e.per_link_img+'" class="divImg2">'+
                                        '<div class="centrado2">'+
                                            '<a href="#" onclick="_Periodico.viewPer('+e.id_periodico+')">'+
                                                '<h4>'+e.per_titulo+'</h4>'+
                                            '</a>'+
                                            '<div style="float:right;margin: 13px 0px 0px 0px;">'+
                                                '<time >'+e.fecha_publico+'</time>'+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</div>';
                        $('#divSubNoticias').append(text);
                    }
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
            $('#modal-body-lg-periodico').append('<div class="divImgPeriodico">'+
                                                    '<img src="images/img-project/'+data[0].per_link_img+'" >'+
                                                    '<div class="centradoDivPer">'+
                                                        '<p>'+data[0].	per_link_pie_img+'</p>'+
                                                    '</div>'+
                                                 '</div>');
            $('#modal-body-lg-periodico').append(data[0].per_texto);            
            $('#modal-view-periodico').modal('show');
        });
    }

    return {
        iniciar:iniciar,
        viewPer:viewPer
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Periodico Digital');
    _Periodico.iniciar();
});