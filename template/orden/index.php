<?php
if(!@session_start()){
    session_start();
}
$sesionlogin = $_SESSION['login'];

if($sesionlogin){
    $bloqueoactivo = $_SESSION['bloqueoactivo'];
    $nombreusuario = $_SESSION["nombreusuario"];
    $idusr = $_SESSION["idusr"];
    $email = $_SESSION["email"];
    $privilegios = $_SESSION["privilegios"];
    $fotoavatar = $_SESSION["fotoavatar"];
    $sede = $_SESSION["sede"];
    $_SESSION["ultimoacceso"] = date("Y-n-j H:i:s");
    
    $localhost = $_SESSION["localhost"];
    $userdb = $_SESSION["userdb"];
    $pwddb = $_SESSION["pwddb"];
    $namedb = $_SESSION["namedb"];
}else{
    $bloqueoactivo = "";
    $nombreusuario = "Invitado";
    $email = "contacto@segiospizza.com";
    $privilegios = "invitado";
    $fotoavatar = "avatar.png";
    $sede = "Local";
    $_SESSION["ultimoacceso"] = date("Y-n-j H:i:s");
    
    $localhost = "";
    $userdb = "";
    $pwddb = "";
    $namedb = "";
}
function obten_dominio($url){
    $protocolos = array('http://', 'https://', 'ftp://', 'www.');
    $url_array_send = explode('/', str_replace($protocolos, '', $url));
    return $url_array_send[0];
}

$url = @$_SERVER['HTTP_HOST'];
$dominio = obten_dominio($url);
?>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><?php echo ucfirst($dominio) ?> - Ordenes</title>

    <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/demo.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/menu-overlay.css?<?php echo time(); ?>">
    <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/font-awesome.min.css?<?php echo time(); ?>">

    <link rel="stylesheet" type="text/css" href="css/AdminLTE.min.css?<?php echo time(); ?>" />
    <link rel="stylesheet" type="text/css" href="css/menu.css?<?php echo time(); ?>" />
    <link rel="stylesheet" type="text/css" href="css/xc2_default.css?<?php echo time(); ?>" />
    <link rel="stylesheet" type="text/css" href="css/paginacion.css?<?php echo time(); ?>" />

    <script type="text/javascript" src="js/jquery.js?<?php echo time(); ?>" ></script>
    <script type="text/javascript" src="js/general.js?<?php echo time(); ?>" ></script>
    <script type="text/javascript" src="ajax/ajax_lib_general.js?<?php echo time(); ?>" ></script>
    
    <script type="text/javascript" src="<?php echo $rutatemplate ?>js/animatedcollapse.js?<?php echo time(); ?>"></script>
    
<!--
Zona para codigo de texto predictivo - Inicio
-->
<script type="text/javascript" src="js/AutoSuggest.js?<?php echo time(); ?>" charset="utf-8"></script>
<link rel="stylesheet" href="css/autosuggest.css?<?php echo time(); ?>" type="text/css" media="screen" charset="utf-8" />
<style type="text/css">

	body {
		font-family: Lucida Grande, Arial, sans-serif;
		font-size: 10px;
		text-align: center;
		margin: 0;
		padding: 0;
	}
	
	table
	{
		border: 1px;
		background-color: #999;
		font-size: 10px;
	}
	tr
	{
		vertical-align: top;
	}
	th
	{
		text-align: left;
		background-color: #ccc;
	}
	th,
	td
	{
		padding: 2px;
		font-family: Lucida Grande, Arial, sans-serif;
		font-size: 1.2em;
	}
	td
	{
		background-color: #fff;
	}
	
	a {
		font-weight: bold;
		text-decoration: none;
		color: #f30;
	}
	
	a:hover {
		color: #fff;
		background-color: #f30; 
	}
	
	#wrapper {
		width: 600px;
		margin: 10px auto;
		text-align: left;
	}
	
	#content {
		font-size: 1.2em;
		line-height: 1.8em;
	}
	
	#content h1 {
		font-size: 1.6em;
		border-bottom: 1px solid #ccc;
		padding: 5px 0 5px 0;
	}

	#content h2 {
		border-top: 1px solid #ddd;
		padding-top: 5px;
		font-size: 1.2em;
		margin-top: 3em;
	}
	
	#content h3 {
		font-size: 1.1em;
		margin-top: 3em;
	}

	small
	{
		color: #999;
	}

	label
	{
		font-weight: bold;
	}
	/*
	the parent element of an autosuggest input should have a relative position
	*/
	.asholder
	{
		position: relative;
	}

        .ini_transition_pizzas {
            width: 100px;
            height: 20px;
            background: #F0F0F0;
            transition: width 1s, height 1s, margin 1s;
            margin: 50px auto 0;
        }

        .hidde_transition_pizzas {
            width: 100px;
            height: 20px;
            background: #F0F0F0;
            transition: width 1s, height 1s, margin 1s;
            margin: 50px auto 0;
        }
        
	.show_transition_pizzas{
            width: 100%;
            height: 200px;
            background: #F0F0F0;
            transition: width 1s, height 1s, margin 1s;
            margin: 0 auto;
        }
</style>
<!--
Zona para codigo de texto predictivo - Fin
-->

</head>
<body>
    <form id="frm_inicio" action="" method="post">
          <input type="hidden" name="accion" id="accion" value="main" >
    </form>
<header>
    <h1>Menu Principal, Usuario <?php echo $nombreusuario; ?> - Sergio's Pizza</h1>
    <a href="javascript:frm_inicio.submit();">Inicio</a>
</header>

<ul class="navigation">
<?php
switch($privilegios){
    case "venta":
        echo '<li><a href="javascript:abremenu_mostrador(\''.$sede.'\');"><img src="imagenes/menuprincipal/mostrador.png" width="300"></a><br /><a href="javascript:carga_reporte_filtro(\'Mostrador\',\'orden\');">Ordenes de Mostrador</a></li>
            <li><a href="javascript:abremenu_local(\''.$sede.'\');"><img src="imagenes/menuprincipal/local.png" width="200"></a><br /><a href="javascript:carga_reporte_filtro(\'Local\',\'orden\');">Ordenes de Local</a></li>
            <li><a href="javascript:abremenu_domicilio(\''.$sede."','".$rutatemplate.'\');"><img src="imagenes/menuprincipal/domicilio.png" width="150"></a><br /><a href="javascript:carga_reporte_filtro(\'Foranea\',\'orden\');">Ordenes de Domicilio</a></li>';
    break;
    case "orden":
        echo '<li><a href="javascript:abremenu_clientes();">Cliente</a></li>
            <li><a href="javascript:abremenu_mesas('.$sede.');">Mesas</a></li>
            <li><a href="javascript:abremenu_restaurante('.$sede."','".$rutatemplate.');">Cocina</a></li>
            <li><a href="javascript:abremenu_pizzeria('.$sede."','".$rutatemplate.');">Pizzeria</a></li>';
    break;
}
?>
<div id="div_main"></div>
</ul>
<div class="options-menu-overlay">

    <ul>
        <div id="menu_overlay"></div>
        <!--<div id="capa_mostrador" style="visibility: hidden;">-->
        <div id="capa_mostrador" style="visibility: hidden">
            <input type="text" id="testid" value="" style="font-size: 10px; width: 20px; visibility: hidden;" disabled="disabled" />
            <label for="testinput">Cliente: </label>
            <input style="width: 300px" type="text" id="testinput" placeholder="Publico en General" value="" />
            <a href="javascript:iniciar_comanda();" ><img src="<?php echo $rutatemplate ?>images/iniciarcomanda.png?<?php echo time(); ?>"></a>
<!--
        <br /><br /><br />
	<label for="testinput_xml">Person 2 & Address</label>
	<input type="text" id="testinput_xml" value="" style="width:300px" /> 
-->
        </div>
        <div id="comandas_overlay" style="visibility: hidden;">
            <div id="capa_pizzeria">
<?php include_once "seccion/menu_pizzeria/menu_pizzeria.php"; ?>
            </div>
            <div id="capa_cocina">
<?php include_once "seccion/menu_cocina/menu_cocina.php"; ?>
            </div>
            <div id="capa_bebidas">
<?php include_once "seccion/menu_bebidas/menu_bebidas.php"; ?>
            </div>
            <div id="capa_postres">
<?php include_once "seccion/menu_postres/menu_postres.php"; ?>
            </div>
        </div>
    </ul>
    <ul>
        
    </ul>
    <span class="close-overlay"><i class="fa fa-close"></i></span>
</div>
<span class="menu-toggle" data-show-dialog="options-menu-overlay" style="visibility:hidden"></span>

<script>

    // Here is how to show the horizontal menu

    $(document).ready(function() {

        $('.menu-toggle').click(function(e){

            var menu = $(this).data('show-dialog');

            $('.' + menu).fadeIn(300);
        });

        $('.options-menu-overlay .close-overlay').click(function(e){

            $(this).closest('.options-menu-overlay').fadeOut();
            e.stopPropagation();

        });
        
        // Here is how to listen for clicks on the menu items

        $('.options-menu-overlay li a').click(function(e){

            //alert('You clicked option ' + $(this).parent().data('option'));
$('.options-menu-overlay').fadeOut('fast');
            e.stopPropagation();

            // Tip: If you want to hide the overlay when an option is
            // clicked option, uncomment the following line

            // $(this).closest('.menu-overlay').fadeOut(300);
        });

        $(document).on('keydown',function(e){

            // Hide the overlay when ESC is clicked

            if(e.keyCode === 27){
                $('.options-menu-overlay').fadeOut('fast');
            }
        });

    });
    
    cargaseccionsubmenu('div_main','orden');
</script>

<input type="hidden" id="folioordenhidden" value="">
<input type="hidden" id="iniciohidden" value="">
<input type="hidden" id="entregaaproximadahidden" value="">
<input type="hidden" id="horaentregahidden" value="">

<input type="hidden" id="mesahidden" value="">
<input type="hidden" id="clientehidden" value="">
<input type="hidden" id="usuariohidden" value="<?php echo @$idusr; ?>">
<input type="hidden" id="filtro_reporte" value="">



</body>
</html>