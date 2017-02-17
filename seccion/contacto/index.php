<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Seccion Contacto</title>
</head>

<body>
<?php
$conn = mysql_connect($localhost, $userdb, $pwddb);
mysql_select_db($namedb, $conn);
$ssq2 = "select * from contenido where seccion_idseccion = (select idseccion from seccion where nombre = 'Contacto') and estatus = 'activo' order by idcontenido desc limit 0,10";
$rs2 = mysql_query($ssq2,$conn);
if(!@session_start()){
    session_start();
}
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Dejanos tus Comentarios y/o Sugerencias</span></b>
<hr>';

if(@$_SESSION["autentificado"] == "SI" && @$_SESSION["privilegios"] != "invitado")
{
	echo "<li class=\"top\" id=\"licontacto\"><a href=\"javascript:enviamensaje();\" class=\"top_link\">Envia un Mail Masivo a todos los integrantes registrados en el portal</a></li>";
}
while($registro2=mysql_fetch_array($rs2))
{
echo '<div id="'.$registro2["idcontenido"].'" align="center" style="border:#00CCFF; border:double;">';
echo utf8_encode($registro2["contenido"]);
echo '</div><hr>';
}
?>
</body>
</html>
