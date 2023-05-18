var _error, _success, _warning;

var isMobile = {
    mobilecheck : function() {
        return (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino|android|ipad|playbook|silk/i.test(navigator.userAgent||navigator.vendor||window.opera)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test((navigator.userAgent||navigator.vendor||window.opera).substr(0,4)))
    }
}

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
                    "pagina":pagina,
                    "dispositivo":(isMobile.mobilecheck())?'1':'0'
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
        datosContacto();
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

    /** Trae la información de datos de Contacto */
    var datosContacto = ()=>{
        var ruta = 'Controller/Aleteo.controller.php';
        var data = {"metodo":"datosContacto"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $('#aWhatsTransmedia').html(data[0].sec_desc).attr('href',data[0].sec_link_redirect);
            $('#aMailTransmedia').html(data[1].sec_desc).attr('href','mailto:'+data[1].sec_link_redirect);
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

    var listarOpiniones = (div,ruta,metodo) => {
        $(`#${div}`).html('');
        var data = {metodo};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                var article = '<article>'+
                                    '<b>Anónimo</b>'+
                                    '&nbsp;&nbsp;<footer>'+val.texto_opinion+'</footer>'+
                                    '<i>&nbsp;&nbsp;'+val.fecha_opinion_text+'</i>'+
                                '</article>';
                ((key+1) != data.length) ? article += '<hr>' : article += '<br>';
                $(`#${div}`).append(article);
            });
        });
    }

    return {
        iniciar:iniciar,
        verificarConstr:verificarConstr,
        addSuscricpcion:addSuscricpcion,
        listarOpiniones
    }
})(jQuery);
$(document).ready(function(){
    _Aleteo.iniciar();
    $("#newsletter").submit(function(event){
        event.preventDefault();
        _Aleteo.addSuscricpcion();
    });
    $('#haciaFuturo').on('click',()=>{
        window.location.href = "haciaelfuturo.php";
    });
    $('#subaseAlFuturo').on('click',()=>{
        window.location.href = "futureSuba.php";
    });
});