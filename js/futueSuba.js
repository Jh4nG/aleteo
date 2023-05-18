var _SubaFuturo = (function (){
    const ruta = 'Controller/SubaFuturo.controller.php';

    const init = ()=>{
        listarOpiniones();
        // setTimeout(()=>{
        //     let divVideo = $('#modal-body-lg-future-video-principal');
        //     divVideo.html(`<div class="col-12">
        //                     <video controls autoplay id="videoPrincipal" src="./images/img-project/futureSuba/videoMuestra.mp4" width="100%"></video>
        //                     </div>`);
        //     $('#modal-view-future-video-principal').modal('show');
        // },2000);
    }

    const openModal = (view = '')=>{
        let title = "";
        $('.divArtistasModal,.div360Modal,.divPodcastModal,.divVocesModal').addClass('hidden');
        switch(view){
            case 'Artistas':
                title = 'Artistas';
                let divArtistas = $('.divArtistasModal');
                let divArtistasMapa = $('.divArtistasModal > .divArtistasModalMapa');
                let divArtistasIcono = $('.divArtistasModal > .divArtistasModalIcono');
                // if(divArtistas.html() == ''){
                    // divArtistasMapa.html('');
                    divArtistasIcono.html('');
                    let data = {'metodo' : 'getArtistas'};
                    $.when(ajaxJson(ruta,data,'post')).done((data)=>{
                        $('.divArtistasModal > .divArtistasModalMapa > div').remove(); // se remueven todos los div's
                        $.each(data, function(key, val){
                            var click = `onclick="_SubaFuturo.openViewArtistas(${val.id},'${val.title}','${val.name_artist}','${val.ficha_tecnica.split('\r\n').join('<br>')}','${val.description}','${val.src_resource}','${val.social_link}','${val.type}')"`;
                            divArtistasMapa.append(` <div class="pointer spinner" ${click} style="position: fixed;top:${val.top_position}%;left:${val.left_position}%;" data-toggle="tooltip" data-placement="top" title="${val.title}">
                                                        <img class="spinner1" src="./images/img-project/futureSuba/iconoPiezas/${val.src_icono}" />
                                                    </div>`);
                            divArtistasIcono.append(`<div class="col-12">
                                                        <div class="card spinnerIcono" style="width: 100%; margin-bottom:45px;">
                                                            <img class="card-img-top" src="./images/img-project/futureSuba/iconoPiezas/${val.src_icono}" alt="${val.title}">
                                                            <div class="card-footer" align="center">
                                                                <a href="#" class="btn btn-primary" ${click}><i class="fa fa-eye"></i> Ver</a>
                                                            </div>
                                                        </div>
                                                    </div>`);
                        });
                        $(function () {
                            $('[data-toggle="tooltip"]').tooltip()
                        });
                    });
                // }
                divArtistas.removeClass('hidden');
                break;
            case '360':
                title = 'Imágenes 360';
                let div360 = $('.div360Modal');
                div360.removeClass('hidden');
                if(div360.html() == ''){
                    let data = {'metodo' : 'get360'};
                    $.when(ajaxJson(ruta,data,'post')).done((data)=>{
                        div360.html('<div class="row col-12"></div><br><br><br>');
                        $.each(data, function(key, val){
                            var descripcion = (val.descripcion != null) ? val.descripcion.split('\n') : [];
                            desc = "";
                            $.each(descripcion,(i,e)=>{
                                desc += '<p class="card-text">'+e+'</p>';
                            });
                            div360.children().append(`
                                        <div class="col-md-4">
                                            <div class="card" style="width: 100%;">
                                                <img class="card-img-top" src="images/img-project/futureSuba/${val.img}" alt="${val.titulo}">
                                                <div class="card-body">
                                                    <h5 class="card-title">${(val.titulo != null) ? val.titulo : ''}</h5>
                                                    <p class="card-text">${desc}</p>
                                                </div>
                                                <div class="card-footer" align="center">
                                                    <a href="#" class="btn btn-primary" onclick="_SubaFuturo.openViewPanorama(${val.id},'${val.titulo}')"><i class="fa fa-eye"></i> Ver</a>
                                                </div>
                                            </div>
                                        </div>`);
                        });
                    });
                }
                break;
            case 'Podcast':
                title = 'Podcast';
                let divPodcast = $(".divPodcastModal");
                if(divPodcast.html() == ''){
                    let data = {'metodo' : 'getPodcast'};
                    $.when(ajaxJson(ruta,data,'post')).done((data)=>{
                        $.each(data, function(key, val){
                            var descripcion = (val.description != null) ? val.description.split('\n') : [];
                            desc = "";
                            $.each(descripcion,(i,e)=>{
                                desc += '<p class="card-text">'+e+'</p>';
                            });
                            divPodcast.append(`
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card" style="width:100%">
                                                <h5 class="card-header"><b>${(val.title != null) ? val.title : ''}</b></h5>
                                                <div class="card-body">
                                                    ${desc}
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
                                                        <audio controls preload="metadata" src="audios/futureSuba/${val.src_resource}"></audio>
                                                        <div class="main-song-controls">
                                                            <img src="images/img-project/Backward.svg" alt="" class="icon Back10">
                                                            <img src="images/img-project/Play.svg" alt="" class="icon PlayPause">
                                                            <img src="images/img-project/Forward.svg" alt="" class="icon Plus10">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div><br>`);
                        });
                        $('.PlayPause').on('click',(i)=>{ playpause($(i.target)); });
                        $('.Back10').on('click',(i)=>{ audioBarra($(i.target),-10) });
                        $('.Plus10').on('click',(i)=>{ audioBarra($(i.target),+10) });
                    });
                }
                $('.divPodcastModal').removeClass('hidden');
                break;
            case 'Voces':
                let orientacionPantalla = window.screen.orientation.type;
                if(isMobile.mobilecheck() == '0' || orientacionPantalla == 'landscape-primary'){
                    title = 'Voces del futuro';
                    $('.divVocesModal').html(`
                        <iframe class="iframe" width="100%" height="auto" allow="microphone" src="https://museointeractivoaleteo.com/#/future-voices" style="height: 80vh;"></iframe>
                    `)
                    $('.divVocesModal').removeClass('hidden');
                }else{
                    swal({
                        title: 'Informacion!',
                        text: 'Para cargar correctamente los contenidos de este espacio, por favor cambie la orientación del disposivo (módo horizontal).',
                        icon: './images/img-project/giphy_devide_left.gif',
                        type: 'info',
                        buttons:{
                            confirm: {
                                text : 'Aceptar',
                                className : 'btn',
                                value: true,
                            },
                            cancel: {
                                visible: true,
                                className: 'btn btn-cancel',
                                value: false,
                            }
                        }
                    })
                    .then(($response)=> {
                        if($response){
                            _SubaFuturo.openModal('Voces');
                        }else{
                            $('#modal-view-future').modal('hide');
                            return;
                        }
                    });
                }
                break;
            default:
                title = 'N/A';
                break;
        }
        $('#modal-title-lg').html(title);
        $('#modal-view-future').modal('show');
    }


    const calculateTime = (secs) =>{
        const minutes = Math.floor(secs / 60),
        seconds = Math.floor(secs % 60),
        returnedSeconds = seconds < 10 ? `0${seconds}` : `${seconds}`;
        return `${minutes}:${returnedSeconds}`;
    }

    const playpause = (element)=>{
        let parent = element.parent().parent().parent().parent().parent().parent().parent();
        let currentTime = element.parent().parent().children('.controls-music-container').children('.time-container').children('.CurrentSongTime');
        let songLength = element.parent().parent().children('.controls-music-container').children('.time-container').children('.SongLength');
        let progress = element.parent().parent().children('.controls-music-container').children('.progress-song-container').children('.progress-bar').children('.progress');

        let audio = element.parent().parent().children('audio')[0];
        songLength.html(calculateTime(audio.duration));
        if(audio.paused){
            let parentAudios = (parent[0].id != '') ? $(`#${parent[0].id} audio`) : $(`.${parent.attr('class')} audio`);
            parentAudios.each((i,e)=>{ 
                e.pause();
                $(e).parent().children('.main-song-controls').children('.PlayPause').attr('src',`images/img-project/Play.svg`);
            });
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

    const openViewPanorama = (id,title)=>{
        $('#modal-view-future').modal('hide');
        $('#modal-title-lg-360').html((title != null) ? title : '');
        $('#modal-body-lg-future-360').html(`
                <div class="col-12">
                    <iframe class="iframe" style="height: 80vh;" width="100%" src="componentes/panorama.php?id=${id}"></iframe>
                </div>
            `);
        $('#modal-view-future-360').modal('show');
        _SubaFuturo.setBodyOpenModal();
    }

    const openViewArtistas = (id, title = '', name_artist = '', ficha_tecnica = '', description = '', src_resource = '', social = '', type = '')=>{
        let titulo   = $('#modal-title-lg-Artistas');
        let divUrl   = $('#divUrlArtistas');
        let divTexto = $('#divTextoArtistas');
        titulo.html(title);
        let txtUrl;
        switch(type){
            case '1':
                txtUrl = `<div class="col-12">
                            <img width="100%" src="./images/img-project/futureSuba/piezas/${src_resource}" />
                            <div class="caption" align="center">
                                <p>${name_artist}</p>
                            </div>
                          </div>`;
                break;
            case '2':
                txtUrl = `<div class="col-12">
                            <video width="100%" src="./images/img-project/futureSuba/piezas/${src_resource}" controls></video>
                            <div class="caption" align="center">
                                <p>${name_artist}</p>
                            </div>
                          </div>`;
                break;
            case '3':
                txtUrl = `
                        <div class="col-md-12">
                            <div class="card" style="width:100%">
                                <h5 class="card-header"><b>${title}</b></h5>
                                <div class="card-body" align="center">
                                    <img width="100%" src="./images/img-project/futureSuba/piezas/3. Andrés Yepes (visual - diseño).jpg" />
                                    <div class="music-player-container reprod${id}">
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
                                        <audio id="audioPieza${id}" controls preload="metadata" src="./images/img-project/futureSuba/piezas/${src_resource}"></audio>
                                        <div class="main-song-controls">
                                            <img src="images/img-project/Backward.svg" alt="" class="icon Back10">
                                            <img src="images/img-project/Play.svg" alt="" class="icon PlayPause">
                                            <img src="images/img-project/Forward.svg" alt="" class="icon Plus10">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        `;
                break;
        }
        let link = (social != '' && social != null && social != "null") ? `<br><p align="center"><a class="btn btn-primary" type="button" href="${social}" target="_blank">¡Conoceme!</a></p>` : ``;
        divUrl.html(txtUrl);
        divTexto.html(`<div class="col-12">
                          <p>${ficha_tecnica}</p>
                          <br>
                          <p>${description}</p>
                          ${link}
                       </div>`);
        $('#modal-view-future-Artistas').modal('show');
        $('#modal-view-future').modal('hide');
        if(type == '3'){
            $('.PlayPause').on('click',(i)=>{ playpause($(i.target)); });
            $('.Back10').on('click',(i)=>{ audioBarra($(i.target),-10) });
            $('.Plus10').on('click',(i)=>{ audioBarra($(i.target),+10) });
            var vid = document.getElementById(`audioPieza${id}`);
            vid.volume = 0.1;
        }
        _SubaFuturo.setBodyOpenModal();
    }

    const setBodyOpenModal = ()=>{
        setTimeout(() => {
            $('body').addClass('modal-open');
        }, 500);
    }

    var listarOpiniones = () => {
        _Aleteo.listarOpiniones("divOpiniones",ruta,"listarOpiniones");
    }

    var ingresarComent = () =>{
        var coment = $("#comentarioPodcast").val();
        if(coment == ''){
            swal("Advertencia!", "El comentario no debe ir vacío!",_warning);
        }

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

    return {
        init,
        openModal,
        openViewPanorama,
        openViewArtistas,
        setBodyOpenModal,
        ingresarComent
    }
})(jQuery);
$(document).ready(()=>{
    ingresoPagina('Suba hacia el Futuro');
    _SubaFuturo.init();
    $('.pointer').on('click',(i,e)=>{
        _SubaFuturo.openModal(i.currentTarget.dataset.view);
    });

    $('#modal-view-future').on('hide.bs.modal', function(e) {
        $('audio').each((i,e)=>{
            e.pause();
            e.currentTime = 0;
        });
        $('.main-song-controls').children('.PlayPause').attr('src',`images/img-project/Play.svg`);
        $('.divVocesModal').html(``);
    });

    $('#modal-view-future-360').on('hide.bs.modal', function(e) {
        $('#modal-view-future').modal('show');
        $('#modal-body-lg-future-360').html(``);
        $('#modal-title-lg-360').html('');
        _SubaFuturo.setBodyOpenModal();
    });

    $('#modal-view-future-Artistas').on('hide.bs.modal', function(e) {
        $('#modal-title-lg-Artistas').html('');
        $('#divUrlArtistas').html('');
        $('#divTextoArtistas').html('');
        $('#modal-view-future').modal('show');
        $('audio').each((i,e)=>{
            e.pause();
            e.currentTime = 0;
        });
        $('.main-song-controls').children('.PlayPause').attr('src',`images/img-project/Play.svg`);
        _SubaFuturo.setBodyOpenModal();
    });
});
