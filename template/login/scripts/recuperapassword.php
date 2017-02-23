<?php
@$usuario=$_GET["usuario"];

mysql_connect("localhost","dags","dags123");
mysql_select_db("dags");

$result1 = mysql_query("select email from usuario where nombre = '".$usuario."'");

/*echo "select pa.estatus,pa.seccion,pa.nombreseccion,pa.tipousuario,u.nombre,u.email,u.pwd from permisosadminfiles pa inner join personal p on (pa.personal_idpersonal=p.idpersonal)
inner join usuario u on (p.usuario_idusuario=u.idusuario)
where u.nombre = '".$usuario."' and u.pwd = '".$pwdactual."' and pa.seccion = '".$seccion."'";
exit;*/

if(mysql_num_rows($result1)==0){
    echo "norecuperado";
    exit;
}else{
    $row1=mysql_fetch_array($result1);
    $emailactual = $row1["email"];
    echo "sirecuperado".$emailactual;
}
?>
