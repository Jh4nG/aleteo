var _Apoyanos = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(7);
        $('#Apoyanos').addClass('active'); // activa el botón del navegador
    }

    return {
        iniciar:iniciar,
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Apoyanos');
    _Apoyanos.iniciar();
});