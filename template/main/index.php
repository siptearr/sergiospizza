<?php
if(!@session_start()){
    session_start();
}
$sesionlogin = $_SESSION['login'];

if($sesionlogin){
    $bloqueoactivo = $_SESSION['bloqueoactivo'];
    $nombreusuario = $_SESSION["nombreusuario"];
    $email = $_SESSION["email"];
    $privilegios = $_SESSION["privilegios"];
    $fotoavatar = $_SESSION["fotoavatar"];
    $sede = $_SESSION["sede"];
    $_SESSION["ultimoacceso"] = date("Y-n-j H:i:s");
}else{
    $bloqueoactivo = "";
    $nombreusuario = "Invitado";
    $email = "contacto@segiospizza.com";
    $privilegios = "invitado";
    $fotoavatar = "avatar.png";
    $sede = "Local";
    $_SESSION["ultimoacceso"] = date("Y-n-j H:i:s");
}
?>
<!DOCTYPE HTML>
<html>
<head>
  <title>Sergios Pizza <?php echo date("Y") ?></title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <link rel="icon" type="image/gif" href="<?php echo $rutatemplate ?>images/iconsp.jpg?<?php echo time(); ?>" >

  
  <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/menu-horizontal.css?<?php echo time(); ?>">
  <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/font-awesome.min.css?<?php echo time(); ?>">
    
  
  <link href="<?php echo $rutatemplate ?>css/style.css?<?php echo time(); ?>" rel="stylesheet" type="text/css"  media="all" />
  <link href="<?php echo $rutatemplate ?>css/slider.css?<?php echo time(); ?>" rel="stylesheet" type="text/css"  media="all" />
  <link href="<?php echo $rutatemplate ?>css/lightbox.css?<?php echo time(); ?>" rel="stylesheet" type="text/css" media="screen" />

  <script type="text/javascript" src="<?php echo $rutatemplate ?>js/jquery.min.js?<?php echo time(); ?>"></script> 
  <script type="text/javascript" src="<?php echo $rutatemplate ?>js/jquery.easing.1.3.js?<?php echo time(); ?>"></script> 
  <script type="text/javascript" src="<?php echo $rutatemplate ?>js/camera.min.js?<?php echo time(); ?>"></script>
  <script type="text/javascript" src="<?php echo $rutatemplate ?>js/jquery.lightbox.js?<?php echo time(); ?>"></script>
  
  <script type="text/javascript" src="js/general.js?<?php echo time(); ?>" ></script>
  <script type="text/javascript" src="<?php echo $rutatemplate ?>js/animatedcollapse.js?<?php echo time(); ?>"></script>
    
	  <script type="text/javascript">
		  $(function() {
			$('.gallery a').lightBox();
		  });
	  </script>
	 <script type="text/javascript">
			   jQuery(function(){
				jQuery('#camera_wrap_1').camera({
					pagination: false,
				});
			});
	 </script>
 </head>
  <body>
      <form id="frm_panelcontrol" action="" method="post">
          <input type="hidden" name="accion" id="accion" value="panelcontrol" >
      </form>
      <form id="frm_orden" action="" method="post">
          <input type="hidden" name="accion" id="accion" value="orden" >
      </form>
      <form name="form_cierrasesion" action="<?php echo $rutatemplate ?>../login/logout.php?<?php echo time(); ?>" method="POST">
          <input type="hidden" id="accion" name="accion" value="main">
      </form>
	<!----start-header----->
	 <div class="header" id="inicio">
	     <div class="wrap">
			<div class="top-header">
				<div class="logo">
					<a href="#"><img src="<?php echo $rutatemplate ?>images/logo.png?<?php echo time(); ?>" title="logo" /></a>
				</div>
				<div class="social-icons">
					<ul>
                                            <li><a href="#" id="ini_sesion" <?php if($fotoavatar == "avatar.png"){ echo 'class="menu-toggle" data-show-dialog="options-menu-horizontal"';} ?>><img src="imgusuarios/<?php echo $fotoavatar."?".time(); ?>" title="<?php echo $nombreusuario."?".time(); ?>" width="40" /></a></li>
                                                <li>
                                                    <a><?php echo "Usuario: ".$nombreusuario; ?></a>
                                                    <br />
                                                    <a><?php echo "Sede: ".$sede; ?></a>
                                                </li>
						<li><a href="javascript:frm_panelcontrol.submit();"><img src="<?php echo $rutatemplate ?>images/admin.png?<?php echo time(); ?>" title="sistema" /></a></li>
                                                <?php
                                                if($privilegios != "invitado"){
                                                    echo '<li><a href="javascript:cierrasesion();"><img src="'.$rutatemplate.'images/logout.png?'.time().'" title="logout" width="30" /></a></li>';
                                                }
                                                ?>
					</ul>
				</div>
				<div class="clear"> </div>
			</div>
			<!---start-top-nav---->
			<div class="top-nav">
				<div class="top-nav-left">
					<ul>
                                            <li><a href="javascript:frm_orden.submit();">Ordenes</a></li>
					    <li><a href="javascript:frm_panelcontrol.submit();">Pizzeria</a></li>
                                            <li><a href="javascript:frm_panelcontrol.submit();">Cocina</a></li>
                                            <li><a href="javascript:alert('seccion en desarrollo');">Reportes</a></li>
                                            <li><a href="javascript:alert('seccion en desarrollo');">Caja</a></li>
                                                <!--
                                                <li><a href="<?php //echo $rutatemplate ?>sistema.php?usr=1<?php //echo time(); ?>">Clientes</a></li>
                                                -->
						<div class="clear"> </div>
					</ul>
				</div>
                            <!--
				<div class="top-nav-right">
					<form>
						<input type="text"><input type="submit" value="" />
					</form>
				</div>
                            -->
				<div class="clear"> </div>
			</div>
			<!---End-top-nav---->
		</div>
	</div>
   <!----End-header----->
	       <!--start-image-slider---->
			    <div class="slider">					     
					<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">									           
						<div data-src="<?php echo $rutatemplate ?>images/slider1.jpg?<?php echo time(); ?>">  </div> 
						<div data-src="<?php echo $rutatemplate ?>images/slider2.jpg?<?php echo time(); ?>">  </div>
						<div data-src="<?php echo $rutatemplate ?>images/slider3.jpg?<?php echo time(); ?>">  </div>
						<div data-src="<?php echo $rutatemplate ?>images/slider4.jpg?<?php echo time(); ?>">  </div>
					</div>
					<div class="clear"> </div>					       
			</div>					
         <!--End-image-slider---->
		 <!---start-content---->
		 <div class="content">
                         
		</div>
	<div class="copy-right">
		<div class="top-to-page">
						<a href="#top" class="scroll"> </a>
						<div class="clear"> </div>
					</div>
		<p>Diseño por <a href="http://softjit.com/"> Softjit S.A. de C.V.</a></p>
	</div>
<!--
      Menu Login - Inicio
      -->
      <form id="frm_login" action="" method="post">
        <div class="options-menu-horizontal">

        <ul>
            <?php 
                if(@$mensajelogin != ""){
                    echo '<li><a><i class="fa fa-comments-o"></i><span id="mensaje_login">'.@$mensajelogin.'</span></a></li><br />';
                }else{
                    echo '<span id="mensaje_login"></span>';
                }
            ?>
            <li><a><i class="fa fa-users"></i><span>Usuario: </span></a></li>
            <li><a><input type="text" id="user" name="user" value=""></a></li>
            <li><a><i class="fa fa-list-alt"></i><span>Contraseña: </span></a></li>
            <li><a><input type="password" id="pwd" name="pwd" value=""></a></li>
            <li data-option="login"><a href="#"><i class="fa fa-cog"></i><span>Aceptar</span></a></li>
        </ul>

        <span class="close-menu">×</span>

        </div>

        <input type="hidden" name="accion" id="accion" value="login" >
      </form>
    <!--
    Menu Login - Fin - 
    -->
<script>

        // Here is how to show the horizontal menu

        $(document).ready(function() {

            $('.menu-toggle').click(function(e){

                var menu = $(this).data('show-dialog');
                $('.' + menu).slideToggle('fast');

            });

            $('.options-menu-horizontal span.close-menu').click(function(){

                $(this).closest('.options-menu-horizontal').slideUp('fast');

            });

            // Here is how to listen for clicks on the menu items

            $('.options-menu-horizontal ul li a').click(function(e){

                if(($(this).parent().data('option')) == "login"){
                    javascript:frm_login.submit();
                }
                e.stopPropagation();

            });

        });
        
        if(document.getElementById("mensaje_login").innerHTML != ""){
            var menu = $(document.getElementById("ini_sesion")).data('show-dialog');
            $('.' + menu).slideToggle('fast');
        }
    </script>
</body>
</html>

