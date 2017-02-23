<?php
$conn = mysql_connect('localhost', 'softjitc_premier', 'lapremier123');
mysql_select_db('softjitc_lapremier', $conn);
session_start();
$controlsesion = 'false';
$sql1 = "select tabla from asignaciones where privilegios_idprivilegios = (select idprivilegios from privilegios where descripcion = '".@$_SESSION["privilegios"]."')";
$rs1 = mysql_query($sql1,$conn);
$i=0;
if(!$rs1){
    $catalogo[0] = '';
}else{
    while($registro1=mysql_fetch_array($rs1)){
        $catalogo[$i] = $registro1["tabla"];
        $i++;
    }
}
$sql2 = "select fhp.tabla,f.nombre from formato_has_privilegios fhp inner join formato f on(fhp.formato_idformato=f.idformato)
where fhp.privilegios_idprivilegios = (select idprivilegios from privilegios where descripcion = '".@$_SESSION["privilegios"]."')";
$rs2 = mysql_query($sql2,$conn);
$k=0;
if(!$rs2){
    $formato[0] = '';
}else{
    while($registro2=mysql_fetch_array($rs2)){
        $formato[$k] = $registro2["tabla"];
        $formatonombre[$k] = $registro2["nombre"];
        $k++;
    }
}

if(@$_SESSION["autentificado"] == "SI" && @$_SESSION["nombre"] != "Invitado"){
    $controlsesion = 'true';
    switch(@$_SESSION["nombre"]){
        case "Super Usuario":
            $sql3 = "select s.nombre,s.ruta from seccion s right join usuario u on(s.usuario_idusuario=u.idusuario)
where s.tipo = 'menu' and u.nombre = 'Invitado' or u.nombre = 'Super Usuario' order by s.idseccion";
        break;
        case "Administrador":
            $sql3 = "select s.nombre,s.ruta from seccion s right join usuario u on(s.usuario_idusuario=u.idusuario)
where s.tipo = 'menu' and u.nombre = 'Invitado' or u.nombre = 'Administrador' order by s.idseccion";
        break;
	default:
            $sql3 = "select s.nombre,s.ruta from seccion s right join usuario u on(s.usuario_idusuario=u.idusuario)
where s.tipo = 'menu' and u.nombre = '".@$_SESSION["nombre"]."'";
    }
}else{
    $sql3 = "select s.nombre,s.ruta from seccion s right join usuario u on(s.usuario_idusuario=u.idusuario)
where s.tipo = 'menu' and u.nombre = 'Invitado'";
}
$j=0;
$l=0;
$rs3 = mysql_query($sql3,$conn);
echo '<ul class="menu">';
while($registro3=mysql_fetch_array($rs3))
{
    switch($registro3["nombre"]){
        case 'Catalogos':
            echo   '<li><a href="#" class="parent"><span>'.$registro3["nombre"].'</span></a>
                    <ul>';
            for($j=0;$j<$i;$j++){
                echo '<li><a href="javascript:cargaseccionsubmenu(\'div_main\',\''.$catalogo[$j].'\');"><span>'.$catalogo[$j].'</span></a></li>';
            }
            echo   '</ul>
                    </li>';
        break;
        case 'Formatos':
            echo   '<li><a href="#" class="parent"><span>'.$registro3["nombre"].'</span></a>
                    <ul>';
            for($l=0;$l<$k;$l++){
                echo '<li><a href="javascript:cargaseccionsubmenu(\'div_main\',\''.$formato[$l].'\');"><span>'.$formatonombre[$l].'</span></a></li>';
            }
            echo   '</ul>
                    </li>';
        break;
        case 'Inicia Sesion':
            if($controlsesion=='true'){
                echo   '<li id="lisesion"><a href="javascript:cierrasesion();" class="parent"><span>Cierra Sesion</span></a>
                    </li>';
            }else{
                echo   '<li><a href="javascript:cargaseccion(\'div_main\',\''.$registro3["ruta"].'\');" class="parent"><span>'.$registro3["nombre"].'</span></a>
                    </li>';
            }
        break;
        default:
            echo   '<li><a href="javascript:cargaseccion(\'div_main\',\''.$registro3["ruta"].'\');" class="parent"><span>'.$registro3["nombre"].'</span></a>
                    </li>';
    }
}
echo '</ul>';

?>