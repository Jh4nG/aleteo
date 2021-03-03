var _OrgWeb = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        $('#Organizaciones').addClass('active'); // activa el botón del navegador
    }

    var traerOrganizaciones = () =>{

        var ruta = 'Controller/Organizaciones.controller.php';
        var data = {"metodo":"listarOrg"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                var card = '<div class="col-md-4">'+
                                    '<div class="card" style="height: auto !important;">'+
                                        '<img class="card-img-top" style="max-width: 280px !important;margin: 5px;" alt="Card image cap" src="'+val.imagen+'" >'+
                                        '<div class="card-body">'+
                                            '<h5 class="card-title">'+val.titulo+'</h5>'+
                                            '<p class="card-text">'+val.descripcion+'</p>'+
                                        '</div>'+
                                    '</div>'+
                                '</div>';
                
                if(val.tipo == 'organizaciones'){
                    
                    $("#divOrg").append(card);
                }
                else if (val.tipo == 'aliados'){
                    
                    $("#divAliados").append(card);
                }
            });
        });
    }

    return {
        iniciar:iniciar,
        traerOrganizaciones:traerOrganizaciones
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Podcast');
    _OrgWeb.iniciar();
    _OrgWeb.traerOrganizaciones();
});