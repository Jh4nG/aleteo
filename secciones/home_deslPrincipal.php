<?php 
    require_once dirname(__FILE__).'/../Controller/Index.controller.php';
    $index = new Index();
    $rdb = $index->cargarDeslizador(2);
    $a = 0;
    ?>
<!-- ################### Deslizador Principal ####################### -->
<div id="pageintro" class="hoc clear"> 
    <div class="flexslider basicslider">
        <ul class="slides">
            <?php while ($r=$rdb->fetch()){ 
                $limit = $r['cant_reg'];
                if($a<$limit){ ?>
                    <li>
                        <article>
                            <fieldset style="color:white;margin-bottom: 10px;">
                                <legend><?=$r['sec_titulo'];?></legend>
                            </fieldset>
                            <?=($r['sec_iframe'] != '')?
                                $r['sec_iframe']:
                                '<div class="col-md-12" align="center">
                                    <img class="imgDes" src="images/img-project/'.$r['sec_img'].'" style="max-width:450px;">
                                </div>';?>
                            <p style="margin-top:10px;color:white;"><?=$r['sec_desc'];?></p>
                        </article>
                    </li>
            <?php }
                $a++;
            } ?>
    </div>
</div>
<!-- ################### Fin Deslizador Principal ####################### -->
