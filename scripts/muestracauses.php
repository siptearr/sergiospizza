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
$ssql = 'select c.cve as cvecauses,c.descripcion as causes,c10.cve as cvecie10, c10.descripcion as cie10,c9.cve as cvecie9, c9.descripcion as cie9, concat(c.cve,c10.cve,c9.cve) as filtro
        from causesregistrados cr inner join causes c on(cr.causes_idcauses=c.idcauses) 
	inner join cie10 c10 on(cr.cie10_idcie10=c10.idcie10) 
	inner join cie9 c9 on(cr.cie9_idcie9=c9.idcie9) 
	where cr.estatus = "activo" 
	and cr.multiplecauses_idmultiplecauses = (select a.multiplecauses_idmultiplecauses from atencion a inner join multiplecauses mc on(a.multiplecauses_idmultiplecauses=mc.idmultiplecauses)
	and a.idatencion = '.$idatencion.' and mc.estatus = "activo" and a.estatus = "activo") group by filtro';
$rs1 = mysql_query($ssql,$conn);

if(mysql_num_rows($rs1)==0){
    echo '<span class="izquierda">Sin Causes</span>';
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
    echo '<span class="izquierda">Causes: '.$row1["cvecauses"].'-'.utf8_encode($row1["causes"]);
    echo ', Cie10: '.$row1["cvecie10"].'-'.utf8_encode($row1["cie10"]);
    echo ', Cie9: '.$row1["cvecie9"].'-'.utf8_encode($row1["cie9"]);
    echo '</span>';
    $filasresultado++;
}

echo '<span class="derecha"><a href="javascript:cerrar_resultadomultiples();">Cerrar</a></span>';
    
mysql_free_result($rs1);
mysql_close($conn);
?>