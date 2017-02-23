<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cronicas de Guanajuato</title>
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
$ssq2 = "select * from nota where seccion_idseccion = (select idseccion from seccion where nombre = 'Noticias') and estatus = 'activo' order by idnota desc limit 0,2";
$rs2 = mysql_query($ssq2,$conn);
session_start();
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Seccion de Noticias sobre la Liga La Premier de Leon</span></b>
<hr>';
if(@$_SESSION["autentificado"] == "SI" && (@$_SESSION["privilegios"] == "superusuario" || @$_SESSION["privilegios"] == "administrador"))
{
	echo "<li class=\"top\" id=\"linoticias\"><a href=\"javascript:insertanota('7');\" class=\"top_link\">Ingresa Noticia</a></li>";
}
while($registro2=mysql_fetch_array($rs2))
{
echo '<div id="'.$registro2["idnota"].'" align="center" style="border:#00CCFF; border:double;">';
echo utf8_encode($registro2["contenido"]);
echo '</div><hr>';
}
?>
</body>
</html>
