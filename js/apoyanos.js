var _Apoyanos = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(7);
        $('#Apoyanos').addClass('active'); // activa el botón del navegador
    }

    var traerData = () => {
        var ruta = 'Controller/Apoyanos.controller.php';
        var data = {"metodo":"listar"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $("#tittleApoyanos").html(data[0].titulo);
            document.getElementById("imgApoyanos").src = "images/img-project/"+data[0].imagen;
            $("#descApoyanos").html(data[0].descripcion);
            $('#videoApoyanos').html(data[0].video);
        });
    }

    var listarOpiniones = () => {
        $("#divOpinionesApoyanos").html('');
        var ruta = 'Controller/Apoyanos.controller.php';
        var data = {"metodo":"listarOpiniones"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                var article = '<article>'+
                                    '<b>Anónimo</b>'+
                                    '<footer>'+val.texto_opinion+'</footer>'+
                                    '<b>'+val.fecha_opinion_text+'</b>'+
                                '</article><br>';
                $("#divOpinionesApoyanos").append(article);            
            });
        });
    }

    var ingresarComent = () =>{
        var coment = $("#comentarioApoyanos").val();
        if(coment == ''){
            swal("Advertencia!", "El comentario no debe ir vacío!",_warning);
        }

        var ruta = 'Controller/Apoyanos.controller.php';
        var data = {"metodo":"uploadComment","parametros":{'coment':coment}};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            if(data == "groseria"){
                swal("Advertencia!", "No se permite lenguaje ofensivo!",_warning);
            }else if (data == 'insert'){
                swal("Exito", "Comentario agregado!",_success);
                $("#comentarioApoyanos").val('');
                listarOpiniones();
            }else{
                swal("Error", "Ha habido un problema!",_error);
            }
        });

    }

    return {
        iniciar:iniciar,
        traerData:traerData,
        ingresarComent:ingresarComent,
        listarOpiniones:listarOpiniones
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Apoyanos');
    _Apoyanos.iniciar();
    _Apoyanos.traerData();
    _Apoyanos.listarOpiniones();
});