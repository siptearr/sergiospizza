<?php
//si es necesario cambiar la config. del php.ini desde tu script
ini_set("session.use_only_cookies","1");
ini_set("session.use_trans_sid","0");
//Inicio la sesión
session_start();

//include("seguridad.php");
//include("inactividad.php");

@$idprivilegios = $_SESSION["idprivilegios"];
@$idseccion = $_GET["idseccion"];
@$toplimit = $_GET["toplimit"];

//hacemos una conexion a la bd
$conn = mysql_connect('localhost', 'softjitc_root', 'admin123');
//seleccionamos la Bd
mysql_select_db('softjitc_cronicas', $conn);
//Sentencia SQL para buscar un usuario con esos datos
$ssql = "select idnota,contenido from nota where seccion_idseccion = ".$idseccion." order by idnota desc limit ".$toplimit;
$rs1 = mysql_query($ssql,$conn);

while ($row1=mysql_fetch_array($rs1))
{
	echo '<div id="'.$row1["idnota"].'" align="center" style="border:#00CCFF; border:double;">';
	echo utf8_encode($row1["contenido"]);
	echo '</div>';
	if($idprivilegios == "1")
	{
		echo "<input id=\"editaid".$row1["idnota"]."\" type='button' value='Editar' onClick=\"javascript:cargaeditor('".$row1["idnota"]."');\" />";
		echo "<button id=\"guardaid".$row1["idnota"]."\" onClick=\"javascript:guarda('".$row1["idnota"]."');\" style=\"visibility:hidden\">Guardar Nota</button>";
	}
}

mysql_free_result($rs1);
mysql_close($conn);

?>