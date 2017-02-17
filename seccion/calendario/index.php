<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Calendario</title>
<style type="text/css">
<!--
.Estilo1 {font-size: 36px}
div.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
li.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
-->
</style>
</head>
<body>
<?php
$conn = mysql_connect('localhost', 'softjitc_premier', 'lapremier123');
mysql_select_db('softjitc_lapremier', $conn);
$ssql = "select * from nota where seccion_idseccion = (select idseccion from seccion where nombre = 'Calendario') and estatus = 'activo' order by idnota desc limit 0,5";
$rs = mysql_query($ssql,$conn);

session_start();
if(@$_SESSION["autentificado"] == "SI" && (@$_SESSION["privilegios"] == "superusuario" || @$_SESSION["privilegios"] == "administrador" || @$_SESSION["privilegios"] == "multimedios" || @$_SESSION["privilegios"] == "tesoreria"))
{
	echo "<li class=\"top\" id=\"liportada\"><a href=\"javascript:insertanota('1');\" class=\"top_link\">Ingresa Publicacion de Calendario</a></li>";
}
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Calendario de encuentros</span></b>
<hr>';
while($registro=mysql_fetch_array($rs))
{
echo '<div id="'.$registro["idnota"].'" align="center">';
echo utf8_encode($registro["contenido"]);
echo '</div>';
echo $registro["lugar"].' - '.$registro["fecha"].'<br /><hr>';
}
?>
    <p>Date: <input type="text" id="datepicker"></p>

<script>$(function() { $( "#datepicker" ).datepicker(); });</script>-.-
</body>
</html>
