<?php
@$usu = $_GET["usuario"];
@$pass = $_GET["contrasena"];
@$intento = $_GET["intento"];
session_start();
$veces = (int)$intento;
$veces++;
$restantes = 4-$veces;
//hacemos una conexion a la bd
$conn = mysql_connect('localhost', 'softjitc_premier', 'lapremier123');
//seleccionamos la Bd
mysql_select_db('softjitc_lapremier', $conn);
//Sentencia SQL para buscar un usuario con esos datos
$ssql = "SELECT u.nombre,u.email,p.descripcion as privilegios FROM usuario u inner join privilegios p on (u.privilegios_idprivilegios=p.idprivilegios) WHERE u.usr = '".$usu."' AND u.pwd = '".$pass."'";
//ejecucion de la sentencia
$rs = mysql_query($ssql,$conn);
//se comprueba si el usuario y contraseña son correctos 
if (mysql_num_rows($rs)!= 0)
{
	$registro = mysql_fetch_array($rs);
	if($registro["nombre"] != "" && $registro["privilegios"] != "invitado")
	{
		//echo "<span style='color:red;'>Usuario Correcto, Redireccionando...</span>";
		$_SESSION["autentificado"] = "SI";
		$_SESSION["usuario"] = $usu;
		$_SESSION["nombre"] = $registro["nombre"];
		$_SESSION["email"] = $registro["email"];
		$_SESSION["privilegios"] = $registro["privilegios"];
		echo 'sesioncorrecta'.$registro["nombre"];
		exit;
	}
	else
	{
		echo "<span style='color:red;'>Usuario Invitado</span>";
		if($restantes<3)
		{
			if($restantes<=1)
			{
				echo "<br /><span style='color:red;'>Numero maximo de inicio de sesion fallidas 3, restantes 1</span>";
			}
			else
			{
				echo "<br /><span style='color:red;'>Numero maximo de inicio de sesion fallidas 3, restantes ".$restantes."</span>";
			}
		}
		$_SESSION["autentificado"] = "NO";
		$_SESSION["nombre"] = $registro["nombre"];
		$_SESSION["email"] = $registro["email"];
		$_SESSION["privilegios"] = $registro["privilegios"];
		//sleep(1);
		//header('Location: ../../');
	}
}
else
{
	if($veces>3)
	{
		header('Location: ../../seccion/portada/');
	}
	// se envia el mensaje donde el usuario y contraseña no son correctos
	echo "<span style='color:red;'>Usuario y/o contrase&ntilde;a no son correctos</span><br />";
	echo "<span style='color:red;'>Numero maximo de inicio de sesion fallidas 3, restantes ".$restantes."</span>";
}

mysql_free_result($rs);
mysql_close($conn);
?>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Administracion de La Premier de Leon</title>
</head>
<body>

<div id="autentificacion" align="center">
<h1 align="center">Autentificación de Usuarios</h1>
<form id="inicio" action="javascript:iniciasesion(document.getElementById('usuario').value,document.getElementById('contrasena').value,document.getElementById('intento').value);">
  <table border="0" cellpadding="2" width="441" align="center" height="104">
    <tbody>
      <tr>
        <td width="210" height="26" align="right">USUARIO:</td>
        <td width="100"><input id="usuario" name="usuario" maxlength="50" size="10" type="text" /></td>
        <td rowspan="2" width="111"><div align="center"><img alt="Inicio de Sesion" src="seccion/sesion/imagenes/llaves.gif" width="50" height="50" /> </div></td>
      </tr>
      <tr>
        <td height="26" align="right">CONTRASEÑA:</td>
        <td><input id="contrasena" name="contrasena" maxlength="50" size="10" type="password" /></td>
      </tr>
      <tr>
      	<input id="intento" type="hidden" value="<?php echo @$veces; ?>" />
        <td colspan="3" align="center"><input type="submit" value="Inicia Sesion" /></td>
      </tr>
    </tbody>
  </table>
</form>
</div>

</div>
</body>
</html>
