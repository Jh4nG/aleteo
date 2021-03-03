var _error, _success, _warning;

_error = {
	icon: "error",
	buttons: {
		confirm: {
			text: "Salir",
			icon: "<i style='color:#DF584C' class='fas fa-exclamation-circle'></i>",
			visible: true,
			className: 'btn btn-danger'
		}
	}
};

_success = {
	icon: "success",
	buttons: {
		confirm: {
			text: "Continuar",
			icon: "<i style='color:#29A76A' class='fas fa-check-circle'></i>",
			visible: true,
			className: 'btn btn-success'
		}
	}
};

_warning = {
	icon: "warning",
	buttons: {
		confirm: {
			text: "Continuar",
			icon: "<i style='color:#6677BC' class='fas fa-exclamation-circle'></i>",
			visible: true,
			className: 'btn btn-warning'
		}
	}
};

function ajaxJson(ruta,data,type = 'post'){
    return $.ajax({
        url: ruta,
        type: type,
        dataType: 'json',
        data: data,
    });
}

function ajaxJsonForm(ruta,data,type = 'post'){
    return $.ajax({
        url: ruta,
        type: type,
        dataType: 'json',
        data: data,
		contentType: false,
		cache: false,
		processData: false,
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
            var text = '';
            $.each(data,(i,e)=>{
                text += '<li>';
                if(i<=e.cant_reg){ 
                    a = false;
                    if(e.sec_link_redirect != ''){
                        text += '<a href="'+e.sec_link_redirect+'" target="_blank">';    
                        a = true;
                    }
                    text += '<img src="images/img-project/'+e.sec_img+'" style="max-width:50%;">';
                }
                if(a){
                    text += '</a>';
                }
                text += '</li>';
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

    var verificarConstr = (id)=>{
        var ruta = 'Controller/Aleteo.controller.php';
        var data = {"metodo":"getConstruc","parametros":{'id':btoa(id)}};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            if(data[0].estado == 0){
                // Redirect
                window.location.href = "construccion.php?p="+btoa(id);
            }
        });
    }

    var addSuscricpcion = ()=>{
        var data = new FormData($('#newsletter')[0]);
        var ruta = 'Controller/Aleteo.controller.php';
        var type = 'post';
        $.when(ajaxJsonForm(ruta,data,type)).done((resp)=>{
            if(resp){
                swal('Éxito!','Gracias por suscribirse al contenido de Aleteo Transmedia',_success);
            }else{
                swal('Advertencia!','Usuario ya suscrito.',_warning);
            }
        });
    }

    return {
        iniciar:iniciar,
        verificarConstr:verificarConstr,
        addSuscricpcion:addSuscricpcion
    }
})(jQuery);
$(document).ready(function(){
   _Aleteo.iniciar();
   $("#newsletter").submit(function(event){
        event.preventDefault();
        _Aleteo.addSuscricpcion();
    });
});