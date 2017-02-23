<?php
if(!@session_start()){
    session_start();
}

$localhost = $_SESSION["localhost"];
$userdb = $_SESSION["userdb"];
$pwddb = $_SESSION["pwddb"];
$namedb = $_SESSION["namedb"];

@$idatencion = $_GET["idatencion"];

$conn = mysql_connect($localhost, $userdb, $pwddb);
mysql_select_db($namedb, $conn);
date_default_timezone_set('America/Mexico_City');
// activar el id del formulario multiple
$ssql = 'select s.descripcion as servicio,ts.descripcion as tiposervicio from serviciosregistrados sr inner join servicios s on(sr.servicios_idservicios=s.idservicios) 
	inner join tiposervicio ts on(sr.tiposervicio_idtiposervicio=ts.idtiposervicio) 
	where sr.estatus = "activo" 
	and sr.multipleservicios_idmultipleservicios = (select a.multipleservicios_idmultipleservicios from atencion a inner join multipleservicios ms on(a.multipleservicios_idmultipleservicios=ms.idmultipleservicios)
	and a.idatencion = '.$idatencion.' and ms.estatus = "activo" and a.estatus = "activo")
        group by s.descripcion';
$rs1 = mysql_query($ssql,$conn);

if(mysql_num_rows($rs1)==0){
    echo '<span class="izquierda">Sin Servicios</span>';
    echo '<span class="derecha"><a href="javascript:cerrar_resultadomultiples();">Cerrar</a></span>';
    
    mysql_free_result($rs1);
    mysql_close($conn);
    exit;
}
$filasresultado = 0;
while($row1=mysql_fetch_array($rs1)){
    if($filasresultado>0){
        echo "<br /><hr>";
    }
    echo '<span class="izquierda">Servicio: '.$row1["servicio"];
    if($row1["tiposervicio"]!="sindefinir"){
        echo ', TipoServicio: '.$row1["tiposervicio"];
    }
    echo '</span>';
    $filasresultado++;
}

echo '<span class="derecha"><a href="javascript:cerrar_resultadomultiples();">Cerrar</a></span>';
    
mysql_free_result($rs1);
mysql_close($conn);
?>