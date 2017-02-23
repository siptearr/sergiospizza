<?php
if(!@session_start()){
    @session_start();
}
function obten_dominio($url){
    $protocolos = array('http://', 'https://', 'ftp://', 'www.');
    $url = explode('/', str_replace($protocolos, '', $url));
    return $url[0];
}
$seccion_actual = @$_SERVER['PHP_SELF'];
$array_dir = explode("index.php",$seccion_actual);
$array_seccionactual = explode("/",$array_dir[0]);
$longitud_arrayseccion = count($array_seccionactual);
$posicion_carpetaactual = $longitud_arrayseccion-2;
$seccionactual = $array_seccionactual[$posicion_carpetaactual];
$url = @$_SERVER['HTTP_HOST'];
$dominio = obten_dominio($url);

$localhost = $_SESSION["localhost"];
$userdb = $_SESSION["userdb"];
$pwddb = $_SESSION["pwddb"];
$namedb = $_SESSION["namedb"];

switch($seccionactual){
    case "ordenrestaurante":
        $catalogo = 'orden';
    break;
    case "ordenpizzeria":
        $catalogo = 'orden';
    break;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Catalogo <?php echo ucfirst($seccionactual); ?></title>
<style type="text/css">
<!--
.Estilo1 {font-size: 36px}
div.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
li.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
-->
</style>
</head>

<body>
<?php
$idtransaccion=time();
if(!@session_start()){
    session_start();
}

$localhost = $_SESSION["localhost"];
$userdb = $_SESSION["userdb"];
$pwddb = $_SESSION["pwddb"];
$namedb = $_SESSION["namedb"];
$privilegios = $_SESSION["privilegios"];
$idusr = $_SESSION["idusr"];

$conn = mysql_connect($localhost, $userdb, $pwddb);
mysql_select_db($namedb, $conn);
$sql1 = "select tabla from asignaciones where privilegios_idprivilegios = (select idprivilegios from privilegios where descripcion = '".@$_SESSION["privilegios"]."')";

$contenidoinserta = '<?php
    $idtransaccion = $_POST["idtransaccion"];
    $transaccion = $_POST["transaccion"];
    $tipovalores = $_POST["tipovalores"];
    $valores = $_POST["nombrevalores"];
    $serializa = "";
    $nombresvalores = "";
    $i=0;
    $arreglotipovalores = explode("*",$tipovalores);
    $arreglovalores = explode("*",$valores);
    $arreglotransaccion = explode("*",$transaccion);
    $tamanoarreglovalores = count($arreglovalores);
    
    while($i<$tamanoarreglovalores){
        switch(substr($arreglotipovalores[$i],0,3)){
        case \'int\':
            $serializa .= $_POST[$arreglovalores[$i]].\',\';
        break;
        case \'var\':
            $serializa .= "\'".utf8_encode($_POST[$arreglovalores[$i]])."\',";
        break;
        case \'dat\':
            $serializa .= "\'".$_POST[$arreglovalores[$i]]."\',";
        break;
        case \'tim\':
            $serializa .= "\'".$_POST[$arreglovalores[$i]]."\',";
        break;
        default:
            $serializa .= "\'".utf8_encode($_POST[$arreglovalores[$i]])."\',";
        }
        $nombresvalores .= $arreglovalores[$i].\',\';
        $i++;
    } 
    $nombresvalores = substr($nombresvalores,0,strlen($nombresvalores)-1);
    $serializa = substr($serializa,0,strlen($serializa)-1);
    
    $sql1 = $arreglotransaccion[0].$nombresvalores.$arreglotransaccion[1].$serializa.$arreglotransaccion[2];
    $conn = mysql_connect(\''.$localhost.'\', \''.$userdb.'\', \''.$pwddb.'\');
    mysql_select_db(\''.$namedb.'\', $conn);
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo \''.$seccionactual.'*correcto*\'.mysql_insert_id();
    }else{
        echo \''.$seccionactual.'*incorrecto\';
    }
    mysql_close($conn);
?>';
//Script para eliminar
$contenidoelimina = '<?php
    $idregistro = $_GET["idregistro"];
    $catalogo = $_GET["catalogo"];
    
    $sql1 = "update ".$catalogo." set estatus=\'inactivo\' where id".$catalogo."=".$idregistro;
    $conn = mysql_connect(\''.$localhost.'\', \''.$userdb.'\', \''.$pwddb.'\');
    mysql_select_db(\''.$namedb.'\', $conn);
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo \''.$seccionactual.'*correcto*\'.$idregistro;
    }else{
        echo \''.$seccionactual.'*incorrecto\';
    }
    mysql_close($conn);
?>';
//Script para eliminar
$contenidoeliminacompuesta = '<?php
    $idregistro1 = $_GET["idregistro1"];
    $idregistro2 = $_GET["idregistro2"];
    $catalogo = $_GET["catalogo"];
    $arreglocatalogo = explode("_has_",$catalogo);
    $sqlcampotabla1 = "describe ".$arreglocatalogo[0];
    $sqlcampotabla2 = "describe ".$arreglocatalogo[1];
    $m=0;
    $n=0;
    $conn = mysql_connect(\''.$localhost.'\', \''.$userdb.'\', \''.$pwddb.'\');
    mysql_select_db(\''.$namedb.'\', $conn);
    
    $rscampotabla1 = mysql_query($sqlcampotabla1,$conn);
    while($rowcampotabla1=mysql_fetch_array($rscampotabla1)){
        $nombrecampotabla1[$m] = $rowcampotabla1["Field"];
        $m++;
    }
    
    $rscampotabla2 = mysql_query($sqlcampotabla2,$conn);
    while($rowcampotabla2=mysql_fetch_array($rscampotabla2)){
        $nombrecampotabla2[$n] = $rowcampotabla2["Field"];
        $n++;
    }
    
    //$sql1 = "delete from ".$catalogo." where ".$arreglocatalogo[0]."_id".$arreglocatalogo[0]."=(select id".$arreglocatalogo[0]." from ".$arreglocatalogo[0]." where nombre = \'".utf8_decode($idregistro1)."\' limit 1) and ".$arreglocatalogo[1]."_id".$arreglocatalogo[1]."=(select id".$arreglocatalogo[1]." from ".$arreglocatalogo[1]." where nombre = \'".utf8_decode($idregistro2)."\' limit 1)";
    $sql1 = "delete from ".$catalogo." where ".$arreglocatalogo[0]."_id".$arreglocatalogo[0]."=(select id".$arreglocatalogo[0]." from ".$arreglocatalogo[0]." where ".$nombrecampotabla1[1]." = \'".utf8_decode($idregistro1)."\' limit 1) and ".$arreglocatalogo[1]."_id".$arreglocatalogo[1]."=(select id".$arreglocatalogo[1]." from ".$arreglocatalogo[1]." where ".$nombrecampotabla2[1]." = \'".utf8_decode($idregistro2)."\' limit 1)";
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo "'.$seccionactual.'*correcto*".$idregistro1."-".$idregistro2;
    }else{
        echo "'.$seccionactual.'*incorrecto";
    }
    mysql_close($conn);
?>';
//Inicio de la generacion de catalogos
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Visualizar '.  ucfirst($seccionactual).'</span></b><hr>';

if((@$_SESSION["login"] == true) && ((@$_SESSION["privilegios"] == "restaurante") || (@$_SESSION["privilegios"] == "venta"))){
    $rs1 = mysql_query($sql1,$conn);
    while($registro1=mysql_fetch_array($rs1)){
        $catalogo = $registro1["tabla"];
        $sql2 = "describe ".$catalogo;
        $rs2 = mysql_query($sql2,$conn);
      switch($catalogo){
      case 'orden':
        echo '<a name="'.$catalogo.'"></a>
                <br><div id="resultado_'.$catalogo.'"></div><hr>';
echo '<div id="catalogo_'.$catalogo.'"><a href="javascript:muestrareporte(\'\',\''.$catalogo.'\');">Muestra Informacion de '.ucfirst($catalogo).'</a></div>';
//        echo '<div id="catalogo_'.$catalogo.'"></div>';
        
        if($idarchivo=@fopen("../../autoscripts/".$idtransaccion."guarda_".$catalogo.".php","w")){
            @fwrite($idarchivo, $contenidoinserta);
            @fclose($idarchivo);
        }
        if($idarchivo=@fopen("../../autoscripts/elimina_".$catalogo.".php","w")){
            @fwrite($idarchivo, $contenidoelimina);
            @fclose($idarchivo);
        }
        $reportecatalogo = 'reporte'.$catalogo.'.php';
        $nuevoreportecatalogo = '../../autoscripts/reporte_'.$catalogo.'.php';

        if (!copy($reportecatalogo, $nuevoreportecatalogo)){
            echo "error al crear el script: ". $nuevoreportecatalogo;
        }
    
        $paginacionlib = 'paginacion.php';
        $nuevopaginacionlib = '../../autoscripts/paginacion.lib.php';

        if (!copy($paginacionlib, $nuevopaginacionlib)){
            echo "error al crear el script: ". $nuevopaginacionlib;
        }
      break;
      }//Fin del switch para cada formulario de formato
    }//Fin del While para recorrer todos los fomatos registrados en formato_has_privilegios
}
?>
</body>
</html>
