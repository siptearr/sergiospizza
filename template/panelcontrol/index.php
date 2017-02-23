<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>PanelControl Sergio's Pizza</title>

    <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/demo.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/menu-side-advanced.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/font-awesome.min.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/styles.css?<?php echo time(); ?>"> 
    
    <!--    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Cookie' type='text/css'> -->
    <link rel="stylesheet" type="text/css" href="css/AdminLTE.min.css?<?php echo time(); ?>" />
    <link rel="stylesheet" type="text/css" href="css/menu.css?<?php echo time(); ?>" />
<link rel="stylesheet" type="text/css" href="css/xc2_default.css?<?php echo time(); ?>" />
<link rel="stylesheet" type="text/css" href="css/paginacion.css?<?php echo time(); ?>" />
<!-- Css para el calendario de Fecha de Nacimiento-->
<link rel="stylesheet" type="text/css" href="css/jscal2.css?<?php echo time(); ?>" />
<link rel="stylesheet" type="text/css" href="css/border-radius.css?<?php echo time(); ?>" />
<link rel="stylesheet" type="text/css" href="css/steel.css?<?php echo time(); ?>" />
<!-- Css para el calendario de Fecha de Nacimiento-->
<script type="text/javascript" src="js/jquery.js?<?php echo time(); ?>" ></script>
<script type="text/javascript" src="js/general.js?<?php echo time(); ?>" ></script>
<script type="text/javascript" src="ajax/ajax_lib_general.js?<?php echo time(); ?>" ></script>
<script type="text/javascript" src="js/xc2_default.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="js/xc2_inpage.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="js/calendario.js?<?php echo time(); ?>"></script>
<!-- Js para el calendario de Fecha de Nacimiento-->
<script type="text/javascript" src="js/jscal2.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="js/es.js?<?php echo time(); ?>"></script>

<script type="text/javascript" src="js/loader.js?<?php echo time(); ?>"></script>
<!-- Js para el calendario de Fecha de Nacimiento-->
<!--<script src="js/jquery.min.js?<?php //echo time(); ?>"></script>-->

<script>

    // Making the side menu work

    $(document).ready(function() {

        $('.menu-toggle').click(function(e){

            var menu = $(this).data('show-dialog');

            $('.' + menu).toggleClass('side-menu-shown');

        });

        $('.side-menu-close').on('click', function () {
            $('.side-menu-advanced').removeClass('side-menu-shown');
        });

        $('.side-menu-option').on('click', function (e) {
            e.preventDefault();

            var option = $(this).data('id');

            alert('You chose option ' + option);
        });

        $('.side-menu-button').on('click', function (e) {
            e.preventDefault();

            var buttonFunction = $(this).data('function');

            alert('You clicked the ' + buttonFunction + ' button.');
        });
    });
    
</script>

<!--
Script para la grafica
-->
    <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Pendientes", { role: "style" } ],
        ["Pizzeria", 5, "#b87333"],
        ["Cocina", 7, "silver"],
        ["Pizzeria Foraneas", 9, "gold"],
        ["Cocina Foraneas", 2, "color: #e5e4e2"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "Ordenes pendientes al momento",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
    }
    </script>
    
<!--
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
-->

</head>
<body onload="javascript:abremenu();">
    <form id="frm_inicio" action="" method="post">
          <input type="hidden" name="accion" id="accion" value="main" >
    </form>
<header>
    <h1>Panel Administrativo del Sistema Sergio's Pizza</h1>
    <a href="javascript:cierrasesion();">Salir</a>
    <a href="javascript:abremenu();">Menu</a>
    <a href="javascript:frm_inicio.submit();">Inicio</a>
</header>
<ul class="main">
    <div id="div_main" style="position: relative;top: 0px;left: 0px;width: auto;" >

        <ul class="navigation" align="center">
            <!--
            <li><a href="index.php?accion=asignaciones" class="active">Catalogos</a></li>
            <li><a href="index.php?chart=main">Todas las Graficas</a></li>
            <li><a href="index.php?chart=orden">Grafica de Ordenes</a></li>
            <li><a href="index.php?chart=ventas">Grafica de Ventas</a></li>
            <li><a href="index.php?chart=compras">Grafica de Compras</a></li>
            <li><a href="index.php?chart=cliente">Grafica de clientes</a></li>
            <li><a href="index.php?chart=caja">Grafica de cierre de caja</a></li>
            -->
<div id='divmenu' style="visibility: hidden; float: left;">
<div id="div_orden" align="center" style="width: auto; float:left" ></div>
<!--
Capa de la grafica principal
-->
<!-- <div id="columnchart_values" style="width: 900px; height: 300px;" align="center"></div> -->
<!--
Capa de la grafica principal
-->
    <div id="add_reg"></div>
</ul>

<aside class="side-menu-advanced">

    <div class="side-menu-content">

        <div class="side-menu-user-profile-section">
            <img src="<?php echo "imgusuarios/".$fotoavatar."?".time(); ?>" width="45" alt="User profile">
            <a href="#"><?php echo $nombreusuario ?></a>
            <span><?php echo $privilegios ?><br />
            Sede: <?php echo $sede ?></span>
        </div>

<!--
        <div class="side-menu-account-limits-section">

            <p class="side-menu-section-title"> Account limits</p>

            <p class="side-menu-account-limits">
                surveys
                <span>10/15</span>
            </p>

            <div class="side-menu-progress-bar">
                <span style="width: 66.6%"></span>
            </div>

            <p class="side-menu-account-limits">
                respondents
                <span>214/1000</span>
            </p>

            <div class="side-menu-progress-bar">
                <span style="width: 15.3%"></span>
            </div>

            <p class="side-menu-account-limits">
                answers
                <span>74/150</span>
            </p>

            <div class="side-menu-progress-bar">
                <span style="width: 50%"></span>
            </div>

            <a href="#" class="side-menu-button" data-function="Upgrade">Upgrade to PRO</a>

        </div>
-->

        <div class="side-menu-actions-section">

            <p class="side-menu-section-title"> Acciones </p>

            <p class="side-menu-row">
                <?php
                    switch($privilegios){
                        case  "superusuario":
                            echo '<a href="javascript:cargaseccionsubmenu(\'div_main\',\'asignaciones\');" >Asigancion de catalogos</a>';
                        break;
                        case "administrador":
                            echo '<a href="javascript:cargaseccionsubmenu(\'div_main\',\'catalogos\');" >Administracion de catalogos</a>
            <i class="side-menu-row"></i>
            </p>
            
            <p class="side-menu-row">
                <a href="javascript:cargaseccionsubmenu(\'div_main\',\'tipoorden\');" >Tipo de Ordenes</a>
                <i class="side-menu-row"></i>
            </p>

            <p class="side-menu-row">
                <a href="javascript:cargaseccionsubmenu(\'div_main\',\'familia\');" >Familias</a>
                <i class="fa fa-group"></i>
            </p>
            
            <p class="side-menu-row">
                <a href="javascript:cargaseccionsubmenu(\'div_main\',\'grupo\');" >Grupos</a>
                <i class="fa fa-group"></i>
            </p>

            <p class="side-menu-row">
                <a href="javascript:cargaseccionsubmenu(\'div_main\',\'producto\');">Productos</a>
                <i class="fa fa-list"></i>
            </p>
            
            <p class="side-menu-row">
                <a href="javascript:cargaseccionsubmenu(\'div_main\',\'mesa\');" >Mesas</a>
                <i class="fa fa-group"></i>
            </p>
            
            <p class="side-menu-row">
                <a href="javascript:cargaseccionsubmenu(\'div_main\',\'sucursal\');">Sucursales</a>
                <i class="fa fa-list"></i>
            </p>

            <p class="side-menu-row">
                <a href="javascript:cargaseccionsubmenu(\'div_main\',\'cliente\');">Clientes</a>
            <i class="fa fa-list"></i>
            </p>
            <p class="side-menu-row">
';
                        break;
                        case "restaurante":
                            echo '<a href="javascript:cargaseccionsubmenu(\'div_main\',\'ordenrestaurante\');" >Visualiza ordenes Restaurante</a>';
                        break;
                        case "pizzeria":
                            echo '<a href="javascript:cargaseccionsubmenu(\'div_main\',\'ordenpizzeria\');" >Visualiza Ordenes Pizzeria</a>';
                        break;
                    
                    }
                ?>
                <i class="fa fa-cog"></i>
            </p>
            
            <p class="side-menu-row">
                <!--
                <a href="javascript:cierrasesion();" class="side-menu-option" data-id="4">Salir</a>
                -->
                <a href="javascript:cierrasesion();">Salir</a>
                <i class="fa fa-comments"></i>
            </p>

        </div>

        <a href="#" class="side-menu-logo">Logo</a>

    </div>

    <span class="side-menu-close"><i class="fa fa-close"></i></span>

</aside>
<span class="menu-toggle" data-show-dialog="side-menu-advanced" style="visibility:hidden"></span>

<form name="form_cierrasesion" action="<?php echo $rutatemplate ?>../login/logout.php?<?php echo time(); ?>" method="POST">
    <input type="hidden" id="accion" name="accion" value="inicio">
</form>

</body>

</html>