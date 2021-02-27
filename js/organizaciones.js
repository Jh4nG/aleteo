var _OrganizacionesWeb = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        $('#Organizaciones').addClass('active'); // activa el botón del navegador
    }

    return {
        iniciar:iniciar,
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Organizaciones');
    _OrganizacionesWeb.iniciar();
});