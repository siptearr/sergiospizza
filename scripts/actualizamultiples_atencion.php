<?php
if(!@session_start()){
    session_start();
}

$localhost = $_SESSION["localhost"];
$userdb = $_SESSION["userdb"];
$pwddb = $_SESSION["pwddb"];
$namedb = $_SESSION["namedb"];

@$idmultipleservicios = $_GET["idmultipleservicios"];
@$idmultiplecauses = $_GET["idmultiplecauses"];
$idupdateservicios = 0;
$idupdatecauses = 0;

$conn1 = mysql_connect($localhost, $userdb, $pwddb);
$conn2 = mysql_connect($localhost, $userdb, $pwddb);
mysql_select_db($namedb, $conn1);
mysql_select_db($namedb, $conn2);
date_default_timezone_set('America/Mexico_City');
// activar el id del formulario multiple
$ssql1 = "update multipleservicios set estatus = 'activo' where idmultipleservicios = ".$idmultipleservicios;
$ssql2 = "update multiplecauses set estatus = 'activo' where idmultiplecauses = ".$idmultiplecauses;

/*echo $ssql1;
echo "<br />";
echo $ssql2;
echo "<br />";*/

$rs1 = mysql_query($ssql1,$conn1);
$rs2 = mysql_query($ssql2,$conn2);

$idupdateservicios=mysql_affected_rows($conn1);
$idupdatecauses=mysql_affected_rows($conn2);

if($idupdateservicios > 0 && $idupdatecauses > 0){
    echo "siactualizado";
}else{
    //echo "noactualizado<br />".$ssql1."<br />".$ssql2;
    echo "noactualizado";
}

$_SESSION["idmultipleservicios"] = $idmultipleservicios;
$_SESSION["idmultiplecauses"] = $idmultiplecauses;

mysql_free_result($rs1);
mysql_free_result($rs2);
mysql_close($conn1);
mysql_close($conn2);
?>