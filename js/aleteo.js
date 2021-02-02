function ajaxJson(ruta,data,type = 'post'){
    return $.ajax({
        url: ruta,
        type: type,
        dataType: 'json',
        data: data,
    });
}

/** Ingresar ip Visitador */
function ingresoPagina(pagina){
    var ruta = 'Controller/Aleteo.controller.php';
    var data = {"metodo":"visitaPagina",
                "parametros":{
                    "pagina":pagina
                }};
    var type = 'post';
    $.when(ajaxJson(ruta,data,type)).done((data)=>{
        if(data){
            console.log('Ingreso ok');
        }else{
            console.log('Error ingreso');
        }
    });
}


var _Aleteo = (function (){
    var iniciar = ()=>{
        logoFooter();
        redesSociales();
        // Inicializa el tooltip
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        });
    }
    /** Trae los logos del Footer */
    var logoFooter = () =>{
        var ruta = 'Controller/Aleteo.controller.php';
        var data = {"metodo":"logoFooter"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            var text = '<li><a href="index.php"><i class="fa fa-lg fa-home"></i></a></li>';
            $.each(data,(i,e)=>{
                if(i<=e.cant_reg){ 
                    text += '<li><a href="'+e.sec_link_redirect+'" target="_blank"><img src="images/img-project/'+e.sec_img+'" style="max-width:100px;"></a></li>';
                }
            });
            $('#contentFooter').html(text);
        });
    }

    /** Trae la información de las redes sociales */
    var redesSociales = ()=>{
        var ruta = 'Controller/Aleteo.controller.php';
        var data = {"metodo":"redesSociales"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            var text = "";
            $.each(data,(i,e)=>{
                if(i<=e.cant_reg){
                    text += '<li style="margin-right: 10px;"><a class="faicon-'+e.sec_titulo.toLowerCase()+'" href="'+e.sec_link_redirect+'" target="_blank"><i class="'+e.sec_icon+'"></i></a></li>';
                }
            });
            $('#contentSocial').html(text);
        });
    }

    return {
        iniciar:iniciar
    }
})(jQuery);
$(document).ready(function(){
   _Aleteo.iniciar();
});