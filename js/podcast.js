var _Index = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        $('#Podcast').addClass('active'); // activa el botón del navegador
    }

    return {
        iniciar:iniciar
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Podcast');
    _Index.iniciar();
});