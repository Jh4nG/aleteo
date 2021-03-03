var _SerieWeb = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(5);
        $('#Serie').addClass('active'); // activa el botón del navegador
    }

    return {
        iniciar:iniciar,
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Serie Web');
    _SerieWeb
.iniciar();
});