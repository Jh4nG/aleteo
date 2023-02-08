var _Participantes = (function (){

    var ruta = 'Controller/Participantes.controller.php';

    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(3);
        $('#Participantes').addClass('active'); // activa el botón del navegador
        getParticipantes();
    }

    const getParticipantes  = () =>{
        var data = {"metodo":"getParticipantes"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            let divContent = $('#divContentParticipantes');
            if(data.status == 200){ // Existe información
                divContent.html('');
                $.each(data.data, (i,e)=>{
                    divContent.append(`
                    <div class="col-md-3 col-12">
                        <div class="card">
                            <div class="imgbox">
                                <div class="img" style="background-image: url('./images/img-project/${e.du_img}');"></div>
                            </div>
                            <div class="details">
                                <h2 class="title">${e.du_nombres}</h2>
                                <span class="caption">${e.rol_nombre}</span>
                            </div>
                        </div> 
                    </div>
                    `);
                });
            }else if(data.status == 201){ // No existe información
                divContent.append(`
                <div class="col-md-12 col-12">
                    <div class="card constr">
                        <div class="imgbox">
                            <div class="img" style="background-image: url('./images/img-project/mariposa.gif');"></div>
                        </div>
                        <div class="details">
                            <h2 class="title">ALETEO TRANSMEDIA</h2>
                            <span class="caption">Construyendo</span>
                        </div>
                    </div> 
                </div>
                `);
                console.log('Sin información');
            }else{ // Error en traer información
                divContent.append(`
                <div class="col-md-12 col-12">
                    <div class="card">
                        <div class="imgbox">
                            <div class="img" style="background-image: url('./images/img-project/mariposa.gif');"></div>
                        </div>
                        <div class="details">
                            <h2 class="title">ALETEO TRANSMEDIA</h2>
                            <span class="caption">Construyendo</span>
                        </div>
                    </div> 
                </div>
                `);
                console.log('Error en obtener información');
            }
        });
    }

    return {
        iniciar:iniciar
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Participantes');
    _Participantes.iniciar();
});