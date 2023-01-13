var _VideoJuego = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(6);
        $('#videoJuego').addClass('active'); // activa el botón del navegador
        $('#modal-view-VideoJuego').modal('show');
    }

    return {
        iniciar:iniciar,
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Video juego');
    _VideoJuego.iniciar();
});