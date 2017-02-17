<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Multimedia</title>
</head>
<body>
<?php
$conn = mysql_connect('localhost', 'softjitc_premier', 'lapremier123');
mysql_select_db('softjitc_lapremier', $conn);
$ssql = "select * from nota where seccion_idseccion = (select idseccion from seccion where nombre = 'Multimedia') and estatus = 'activo' order by idnota desc limit 0,2";
$rs1 = mysql_query($ssql,$conn);
session_start();
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Seccion Multimedia</span></b>
<hr>';
if(@$_SESSION["autentificado"] == "SI" && (@$_SESSION["privilegios"] == "superusuario" || @$_SESSION["privilegios"] == "administrador" || @$_SESSION["privilegios"] == "multimedios"))
{
	echo "<li class=\"top\" id=\"limultimedia\"><a href=\"javascript:insertavideo('13');\" class=\"top_link\">Ingresa Video</a></li>";
}
while($registro1=mysql_fetch_array($rs1))
{
	if($registro1["lugar"]=="youtube")
	{
		echo '<iframe class="youtube-player" type="text/html" width="250" height="250" src="http://www.youtube.com/embed/'.utf8_encode($registro1["contenido"]).'" frameborder="0"></iframe><br /><hr>';
	}
	else
	{
		echo '<iframe class="youtube-player" type="text/html" width="250" height="250" src="'.utf8_encode($registro1["contenido"]).'" frameborder="0"></iframe><br /><hr>';
	}
}
?>
</body>
</html>