<?php
if(!@session_start()){
    session_start();
}

$localhost = $_SESSION["localhost"];
$userdb = $_SESSION["userdb"];
$pwddb = $_SESSION["pwddb"];
$namedb = $_SESSION["namedb"];

@$catalogo = $_POST["catalogo"];

$conn = mysql_connect($localhost, $userdb, $pwddb);
mysql_select_db($namedb, $conn);
date_default_timezone_set('America/Mexico_City');
// activar el id del formulario multiple
$ssql = "insert into ".$catalogo."(estatus) values('inactivo')";
$rs1 = mysql_query($ssql,$conn);

if($idinsercion=mysql_insert_id()){
    echo $idinsercion;
}else{
    echo $catalogo;
}
    
mysql_free_result($rs1);
mysql_close($conn);
?>