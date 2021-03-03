var _Periodico = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(3);
        $('#Periodico').addClass('active'); // activa el botón del navegador
    }

    return {
        iniciar:iniciar,
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Periodico Digital');
    _Periodico.iniciar();
});