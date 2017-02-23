<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<meta name="Author" content="Softjit SA de CV" lang="es">
<meta name="robots" content="ALL">
<title>La Premier de Leon en general</title>

<link rel="stylesheet" type="text/css" href="css/menu.css?<?php echo time(); ?>" />
<link rel="stylesheet" type="text/css" href="css/xc2_default.css?<?php echo time(); ?>" />
<link rel="stylesheet" type="text/css" href="css/paginacion.css?<?php echo time(); ?>" />
<link rel="icon" type="image/gif" href="imagenes/iconlapremier.png" >
    
<script type="text/javascript" src="js/menu.js?<?php echo time(); ?>" ></script>
<script type="text/javascript" src="js/jquery.js?<?php echo time(); ?>" ></script>
<script type="text/javascript" src="js/general.js?<?php echo time(); ?>" ></script>
<script type="text/javascript" src="ajax/ajax_lib_general.js?<?php echo time(); ?>" ></script>
<script type="text/javascript" src="js/xc2_default.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="js/xc2_inpage.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="js/calendario.js?<?php echo time(); ?>"></script>
<script>
$(function() {
	// grab the initial top offset of the navigation 
	var barrasecciones_offset_top = $('#menu').offset().top;
	//var div_publicidad_offset_top = $('#div_publicidad').offset().top;
	
	// our function that decides weather the navigation bar should have "fixed" css position or not.
	var sticky_navigation = function(){
		var scroll_top = $(window).scrollTop(); // our current vertical position from the top
		
		// if we've scrolled more than the navigation, change its position to fixed to stick to top, otherwise change it back to relative
		if (scroll_top > barrasecciones_offset_top) { 
			$('#menu').css({ 'position': 'fixed', 'top':0 });
		} else {
			$('#menu').css({ 'position': 'relative' }); 
		}  
		
		/*if (scroll_top > div_publicidad_offset_top) {
			$('#div_publicidad').css({ 'position': 'fixed', 'top':0 });
		} else {
			$('#div_publicidad').css({ 'position': 'relative' }); 
		}*/  
	};
	
	// run our function on load
	sticky_navigation();
	
	// and run it again every time you scroll
	$(window).scroll(function() {
		 sticky_navigation();
	});
});
</script>

</head>

<body onLoad="javascript:cargamenu();cargaseccion('div_main','seccion/portada/');cargaseccion('div_publicidad','seccion/banners');cargaseccion('div_videos','seccion/multimedia');" >
<div id="allbody" align="center" >

<div id="div_top"  style="width:1100px" >
  <img src="imagenes/head1.jpg" width="1100" height="100" /><br />
  <div id="menu">
  </div>
</div>

<div id="div_contenedorprincipal" style="width:1100px" >
<div id="div_videos" align="center" style="background:#EBEBEB; width:250px; float:left; overflow:hidden;"></div>
<div id="div_main" align="center" style="background:#DCE8FC; width:600px; float:left; overflow:hidden;"></div>
<div id="div_publicidad" align="center" style="background:#EBEBEB; width:250px; float:left; overflow:hidden;"></div>
</div>

<div id="div_bottomprincipal" style="width:1100px" align="center" >
<div id="div_bottomvideos" align="center" style="width:250px; ">Eres el visitante No. </div>
<div id="div_bottommain" align="center" style="background:none; width:600px; ">.</div>
<div id="div_bottompublicidad" align="center" style="width:250px; ">Desarrollado por: SoftJit S.A. de C.V <?php echo time("Y-m-d:H:m:s");?></div>
</div>

</div>

</body>
</html>
