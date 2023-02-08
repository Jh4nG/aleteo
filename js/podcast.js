var _PodcastWeb = (function (){
    /** Inicia el proceso para el cargue del contenido */
    var iniciar = () =>{
        _Aleteo.verificarConstr(2);
        $('#Podcast').addClass('active'); // activa el botón del navegador
        listarOpiniones();
    }

    var traerPodcast = () =>{
        // swal("", "Cargando!",_warning);

        var ruta = 'Controller/Podcast.controller.php';
        var data = {"metodo":"listarPodcast"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                descripcion = val.descripcion.split('\n');
                desc = "";
                $.each(descripcion,(i,e)=>{
                    desc += '<p class="card-text">'+e+'</p>';
                });
                if (val.categoria == 1){
                    var card1 = '<div class="row">'+
                                    '<div class="col-md-12">'+
                                        '<div class="card" style="width:100%">'+
                                            '<h5 class="card-header"><b>Capítulos</b></h5>'+
                                            '<div class="card-body">'+
                                                '<h5 class="card-title"><b>'+val.nombre+'</b></h5>'+
                                                desc+
                                                `
                                                <div class="music-player-container reprod${key}">
                                                    <div class="controls-music-container">
                                                        <div class="progress-song-container">
                                                            <div class="progress-bar">
                                                                <span class="progress"></span>
                                                            </div>
                                                        </div>
                                                        <div class="time-container">
                                                            <span class="time-left CurrentSongTime"></span>
                                                            <span class="time-left SongLength"></span>
                                                        </div>
                                                    </div>
                                                    <audio controls preload="metadata" src="audios/${val.link}"></audio>
                                                    <div class="main-song-controls">
                                                        <img src="images/img-project/Backward.svg" alt="" class="icon Back10">
                                                        <img src="images/img-project/Play.svg" alt="" class="icon PlayPause">
                                                        <img src="images/img-project/Forward.svg" alt="" class="icon Plus10">
                                                    </div>
                                                </div>
                                                `+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</div><br>';
                    $("#v-pills-capitulos").append(card1);
                }else if (val.categoria == 2){
                    var card2 = '<div class="row">'+
                                    '<div class="col-md-12">'+
                                        '<div class="card" style="width:100%">'+
                                            '<h5 class="card-header"><b>Micro-Podcast</b></h5>'+
                                            '<div class="card-body">'+
                                                '<h5 class="card-title"><b>'+val.nombre+'</b></h5>'+
                                                desc+
                                                `
                                                <div class="music-player-container reprod${key}">
                                                    <div class="controls-music-container">
                                                        <div class="progress-song-container">
                                                            <div class="progress-bar">
                                                                <span class="progress"></span>
                                                            </div>
                                                        </div>
                                                        <div class="time-container">
                                                            <span class="time-left CurrentSongTime"></span>
                                                            <span class="time-left SongLength"></span>
                                                        </div>
                                                    </div>
                                                    <audio controls preload="metadata" src="audios/${val.link}"></audio>
                                                    <div class="main-song-controls">
                                                        <img src="images/img-project/Backward.svg" alt="" class="icon Back10">
                                                        <img src="images/img-project/Play.svg" alt="" class="icon PlayPause">
                                                        <img src="images/img-project/Forward.svg" alt="" class="icon Plus10">
                                                    </div>
                                                </div>
                                                `+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</div><br>';
                    $("#v-pills-micro_podcast").append(card2);
                }
                else if (val.categoria == 3){
                    var card3 = '<div class="row">'+
                                    '<div class="col-md-12">'+
                                        '<div class="card" style="width:100%">'+
                                            '<h5 class="card-header"><b>Entrevistas</b></h5>'+
                                            '<div class="card-body">'+
                                                '<h5 class="card-title"><b>'+val.nombre+'</b></h5>'+
                                                desc+
                                                `
                                                <div class="music-player-container reprod${key}">
                                                    <div class="controls-music-container">
                                                        <div class="progress-song-container">
                                                            <div class="progress-bar">
                                                                <span class="progress"></span>
                                                            </div>
                                                        </div>
                                                        <div class="time-container">
                                                            <span class="time-left CurrentSongTime"></span>
                                                            <span class="time-left SongLength"></span>
                                                        </div>
                                                    </div>
                                                    <audio controls preload="metadata" src="audios/${val.link}"></audio>
                                                    <div class="main-song-controls">
                                                        <img src="images/img-project/Backward.svg" alt="" class="icon Back10">
                                                        <img src="images/img-project/Play.svg" alt="" class="icon PlayPause">
                                                        <img src="images/img-project/Forward.svg" alt="" class="icon Plus10">
                                                    </div>
                                                </div>
                                                `+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</div><br>';


                    $("#v-pills-entrevistas").append(card3);
                }
            });
            $('.PlayPause').on('click',(i)=>{ playpause($(i.target)); });
            $('.Back10').on('click',(i)=>{ audioBarra($(i.target),-10) });
            $('.Plus10').on('click',(i)=>{ audioBarra($(i.target),+10) });
        });
    }

    var listarOpiniones = () => {
        $("#divOpiniones").html('');
        var ruta = 'Controller/Podcast.controller.php';
        var data = {"metodo":"listarOpiniones"};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            $.each(data, function(key, val){
                var article = '<article>'+
                                    '<b>Anónimo</b>'+
                                    '<footer>'+val.texto_opinion+'</footer>'+
                                    '<b>'+val.fecha_opinion_text+'</b>'+
                                '</article><br>';
                $("#divOpiniones").append(article);
            });
        });
    }

    var ingresarComent = () =>{
        var coment = $("#comentarioPodcast").val();
        if(coment == ''){
            swal("Advertencia!", "El comentario no debe ir vacío!",_warning);
        }

        var ruta = 'Controller/Podcast.controller.php';
        var data = {"metodo":"uploadComment","parametros":{'coment':coment}};
        var type = 'post';
        $.when(ajaxJson(ruta,data,type)).done((data)=>{
            if(data == "groseria"){
                swal("Advertencia!", "No se permite lenguaje ofensivo!",_warning);
            }else if (data == 'insert'){
                swal("Exito", "Comentario agregado!",_success);
                $("#comentarioPodcast").val('');
                listarOpiniones();
            }else{
                swal("Error", "Ha habido un problema!",_error);
            }
        });

    }

    const calculateTime = (secs) =>{
        const minutes = Math.floor(secs / 60),
        seconds = Math.floor(secs % 60),
        returnedSeconds = seconds < 10 ? `0${seconds}` : `${seconds}`;
        return `${minutes}:${returnedSeconds}`;
    }

    const playpause = (element)=>{
        let currentTime = element.parent().parent().children('.controls-music-container').children('.time-container').children('.CurrentSongTime');
        let songLength = element.parent().parent().children('.controls-music-container').children('.time-container').children('.SongLength');
        let progress = element.parent().parent().children('.controls-music-container').children('.progress-song-container').children('.progress-bar').children('.progress');
        let audio = element.parent().parent().children('audio')[0];
        songLength.html(calculateTime(audio.duration));
        if(audio.paused){
            element.attr('src',`images/img-project/pause.svg`);
            audio.play();
        }else{
            element.attr('src',`images/img-project/Play.svg`);
            audio.pause();
        }
        if(audio.readyState > 0){
            currentTime.html(calculateTime(audio.currentTime));
        }
        audio.ontimeupdate = function(){
            currentTime.html(calculateTime(audio.currentTime));
            setProgress(audio,progress);
        }
    }

    const setProgress = (audio,progress)=>{
        let percentage = (audio.currentTime / audio.duration) * 100;
        progress.attr('style',`width:${percentage}%`);
    }

    const audioBarra = (element,time)=>{
        let audio = element.parent().parent().children('audio')[0];
        audio.currentTime = audio.currentTime + time;
    }

    return {
        iniciar:iniciar,
        traerPodcast:traerPodcast,
        ingresarComent:ingresarComent
    }
})(jQuery);
$(document).ready(function(){
    ingresoPagina('Podcast');
    _PodcastWeb.iniciar();
    _PodcastWeb.traerPodcast();
});