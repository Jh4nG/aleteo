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
                                    '<div style="float:right;">'+
                                        '<time >6 Nov 2029</time>'+
                                    '</div>'+
                                '</div>';
                        $('#principalNoticia').append(text);
                        textContent = ' <h5>'+e.per_contratitulo+'</h5><br>'+
                                            e.per_texto.substr(0,300)+' ...',
                                        '<br>';
                        $('#principalContent').append(textContent);
                        
                    }else{
                        text = '<div class="col-md-4">'+
                                    '<div class="col-md-12 divCentrado">'+
                                        '<img src="images/img-project/'+e.per_link_img+'" class="divImg2">'+
                                        '<div class="centrado2">'+
                                            '<a href="#" onclick="_Periodico.viewPer('+e.id_periodico+')">'+
                                                '<h4>'+e.per_titulo+'</h4>'+
                                                '<div style="float:right;">'+
                                                    '<time >6 Nov 2029</time>'+
                                                '</div>'+
                                            '</a>'+
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
        $('#modal-view-periodico').modal('show');
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