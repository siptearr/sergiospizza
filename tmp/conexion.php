<?php
define(BASE_DE_DATOS, 'rh');

//Función de conexión al gestor de la base de datos y a la base de datos
function fnc_conectar_bd()
{
	if (!($rsc_conexion = mysql_connect("localhost:3306", "rh", "rh666")))
	{
		
		die(mysql_error() . "Error de sistema al conectar al servidor");
	}
	if (!mysql_select_db(BASE_DE_DATOS))
	{
		die(mysql_error() . "Error de sistema al seleccionar la base de datos");
	}
	mysql_set_charset('utf8');
   	return $rsc_conexion;
}
?>
