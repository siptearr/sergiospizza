<?php
session_start();
include "conectar/conecta.php";

//-------- Conexion a la DB -----------
$varasignabd = new conectabd ();
$varasignabd->asignabd ();

$db_conexion = mysql_connect ( $varasignabd->db_host, $varasignabd->db_user, $varasignabd->db_pass )
		 or die ( "No se pudo conectar a la Base de datos" ) or die ( mysql_error () );
mysql_select_db ( $varasignabd->db_name ) or die ( mysql_error () );



$sql = "SELECT  mwu_login
		FROM db_acceso.mwebusuarios
		WHERE mwu_ID =".$_POST['mwu_id'];
		
		
$qry = mysql_query($sql) or die('error'.mysql_error());
$row = mysql_fetch_array($qry);
//$var= $_POST['listperm'];

//session_register("lista");
$_SESSION["k_username"] = $row['mwu_login'];
//$var= $row['mwu_login'];

//echo "Mysql = ".$var; die;
header("location:inicio.php");
?>