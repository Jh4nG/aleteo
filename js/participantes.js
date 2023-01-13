var _Participantes = (function (){

    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(3);
        $('#Participantes').addClass('active'); // activa el botón del navegador
    }

    return {
        iniciar:iniciar
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Participantes');
    _Participantes.iniciar();
});