<?php
$conn = mysql_connect('localhost', 'softjitc_premier', 'lapremier123');
mysql_select_db('softjitc_lapremier', $conn);
$ssql = "select * from nota where seccion_idseccion = (select idseccion from seccion where nombre = 'Portada') and estatus = 'activo' order by idnota desc limit 0,5";
$rs = mysql_query($ssql,$conn);

session_start();
if(@$_SESSION["autentificado"] == "SI" && (@$_SESSION["privilegios"] == "superusuario" || @$_SESSION["privilegios"] == "administrador"))
{
	echo "<li class=\"top\" id=\"liportada\"><a href=\"javascript:insertanota('1');\" class=\"top_link\">Ingresa Publicacion de Portada</a></li>";
}
while($registro=mysql_fetch_array($rs))
{
echo '<div id="'.$registro["idnota"].'" align="center">';
echo utf8_encode($registro["contenido"]);
echo '</div>';
echo $registro["lugar"].' - '.$registro["fecha"].'<br /><hr>';
}
?>