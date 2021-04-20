var _Construccion = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = (id) =>{
        traerData(id);
    }

    var traerData = (id)=>{
        var ruta = 'Controller/Aleteo.controller.php';
        var data = {"metodo":"getConstruc","parametros":{'id':id}};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            if(id == 'Ng=='){
                $('#imgConstruc').attr('src','images/img-project/'+data[0].img_constr).attr('style','min-width: 36%');
            }else{
                $('#imgConstruc').attr('src','images/img-project/'+data[0].img_constr).attr('style','max-width:45%;');
            }
            $('#'+data[0].identificador).addClass('active'); // activa el botón del navegador
        });
    }

    return {
        iniciar:iniciar,
    }
})(jQuery);
