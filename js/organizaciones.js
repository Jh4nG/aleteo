var _OrgWeb = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(4);
        $('#Organizaciones').addClass('active'); // activa el botón del navegador
    }

    var traerOrganizaciones = () =>{

        var ruta = 'Controller/Organizaciones.controller.php';
        var data = {"metodo":"listarOrg"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                var card = '<div class="col-md-4">'+
                                    '<div class="card" style="height: auto !important;max-width: 90%;">'+
                                        '<img class="card-img-top" style="max-w-idth: 97% !important;margin: 5px;" alt="Card image cap" src="images/img-project/'+val.imagen_link+'" >'+
                                        '<div class="card-body">'+
                                            '<h5 class="card-title">'+val.titulo+'</h5>'+
                                            '<p class="card-text">'+val.descripcion+'</p>'+
                                            '<a href="'+val.url+'" class="btn btn-info" target="blank">Enlace</a>'
                                        '</div>'+
                                    '</div>'+
                                '</div>';
                var d = val.descripcion.substr(0, 50);
                var card = `
                    <div class="col-md-4">
                        <div class="card">
                            <div class="header">
                                <div class="img-box">
                                    <img class="card-img-top" style="max-w-idth: 97% !important;margin: 5px;" alt="Card image cap" src="images/img-project/${val.imagen_link}" >
                                </div>
                                <h1 class="title">${val.titulo}</h1>
                            </div>
                
                            <div class="content">
                                <p>
                                    ${d}...
                                </p>
                                <div class="row">
                                    <div class="col-md-2">
                                        <a href="${val.url}" target="_blank"><i class="fa fa-paper-plane"></i></a>
                                    </div>
                                    <div class="col-md-10" align="right">
                                        <a class="btn-link" onclick="_OrgWeb.getOrganizacion({titulo:'${val.titulo}',desc:\`${val.descripcion}\`,img:'images/img-project/${val.imagen_link}'})">Leer más...</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                if(val.tipo == 'organizaciones'){
                    $("#divOrg").append(card);
                }
                else if (val.tipo == 'aliados'){
                    
                    $("#divAliados").append(card);
                }
            });
        });
    }

    var getOrganizacion = (data)=>{
        $('#modal-title-organizacion').html(data.titulo);
        $('#img-proyect-org').attr('src',data.img);
        $('#desc-org').html(data.desc);
        $('#modal-organizaciones').modal('show');
    }

    return {
        iniciar:iniciar,
        traerOrganizaciones:traerOrganizaciones,
        getOrganizacion:getOrganizacion
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Organizaciones');
    _OrgWeb.iniciar();
    _OrgWeb.traerOrganizaciones();
});