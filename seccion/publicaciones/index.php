<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Publicaciones</title>
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
@$pagina = $_GET["numpagina"];
if($pagina>0)
{
	$paginacion = $pagina * 5;
}
else
{
	$paginacion = 5;
}
$conn = mysql_connect('localhost', 'softjitc_exhda', 'exhda');
mysql_select_db('softjitc_exhda', $conn);
$ssq2 = "select * from nota where seccion_idseccion = (select idseccion from seccion where nombre = 'Portada') and estatus = 'activo' order by idnota desc limit ".$paginacion.",5";
$rs2 = mysql_query($ssq2,$conn);
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Publicaciones Anteriores</span></b>
<hr>';
while($registro2=mysql_fetch_array($rs2))
{
echo '<div id="'.$registro2["idnota"].'" align="center" style="border:#00CCFF; border:double;">';
echo utf8_encode($registro2["contenido"]);
echo '</div><hr>';
}

?>
</body>
</html>