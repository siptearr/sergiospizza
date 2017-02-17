<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Banners</title>
</head>
<body>
<?php
$conn = mysql_connect('localhost', 'softjitc_premier', 'lapremier123');
mysql_select_db('softjitc_lapremier', $conn);
$ssql = "select * from nota where seccion_idseccion = (select idseccion from seccion where nombre = 'Clasificados') and estatus = 'activo' order by idnota desc limit 0,5";
$rs1 = mysql_query($ssql,$conn);

session_start();
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Seccion de Publicidad</span></b>
<hr>';
if(@$_SESSION["autentificado"] == "SI" && @$_SESSION["privilegios"] != "invitado")
{
	echo "<li class=\"top\" id=\"libanners\"><a href=\"javascript:insertabanner('14');\" class=\"top_link\">Inserta Banner</a></li>";
}
while($registro1=mysql_fetch_array($rs1))
{
	if($registro1["lugar"]=="banner")
	{
		echo '<div id="'.utf8_encode($registro1["idnota"]).'" align="center" style="border:#00CCFF; border:double;">
	<a href="#"><img src="seccion/banners/imagenes/'.utf8_encode($registro1["contenido"]).'" width="245" onclick="javascript:cargapic(\'seccion/banners/imagenes/'.utf8_encode($registro1["contenido"]).'\')"/></a></div><br /><hr />';
	}
	else
	{
		echo '<div id="'.$registro1["idnota"].'" align="center" style="border:#00CCFF; border:double;">';
		echo utf8_encode($registro1["contenido"]);
		echo '</div><hr>';
	}
}
?>
</body>
</html>