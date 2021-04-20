var _SerieWeb = (function (){

    var current = 0;
    var imagenes = new Array();
    
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(5);
        $('#Serie').addClass('active'); // activa el botón del navegador
        iniciarCarrusel();
    }

    var iniciarCarrusel  = () => {
        var numImages = 5;
        if (numImages <= 3) {
            $('.right-arrow').css('display', 'none');
            $('.left-arrow').css('display', 'none');
        }
    
        $('.left-arrow').on('click',function() {
            if (current > 0) {
                current = current - 1;
            } else {
                current = numImages - 3;
            }
    
            $(".carrusel").animate({"left": -($('.product_'+current).position().left)}, 300);
    
            return false;
        });
    
        $('.left-arrow').on('hover', function() {
            $(this).css('opacity','0.5');
        }, function() {
            $(this).css('opacity','1');
        });
    
        $('.right-arrow').on('hover', function() {
            $(this).css('opacity','0.5');
        }, function() {
            $(this).css('opacity','1');
        });
    
        $('.right-arrow').on('click', function() {
            if (numImages > current + 3) {
                current = current+1;
            } else {
                current = 0;
            }
    
            $(".carrusel").animate({"left": -($('.product_'+current).position().left)}, 300);
    
            return false;
        });
    }

    var selectorDataVideo = (selector)=>{
        $('[id^="section_div_"]').removeClass('selectorVideo');
        $('#'+selector).addClass('selectorVideo');
    }

    return {
        iniciar:iniciar,
        selectorDataVideo:selectorDataVideo
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Serie Web');
    _SerieWeb.iniciar();

    $('[id^="section_div_"]').on('click',(e)=>{
        _SerieWeb.selectorDataVideo(e.currentTarget.id);
    });
});