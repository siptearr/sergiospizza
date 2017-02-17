<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Catalogo Afiliado</title>
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

$conn = mysql_connect($localhost, $userdb, $pwddb);
mysql_select_db($namedb, $conn);
$sql1 = "select tabla from asignaciones where privilegios_idprivilegios = (select idprivilegios from privilegios where descripcion = '".@$_SESSION["privilegios"]."')";

$arreglohorarios = "";
$meridiano = 'a.m.';
$hora = '';
for($a=1;$a<=10;$a++){
    $horainicial=7+$a;
    
    if($horainicial>=12){
        $meridiano = 'p.m.';
    }
    if($horainicial>12){
        $hora = $horainicial - 12; 
    }
    if(strlen($horainicial)<2 && $meridiano == 'a.m.'){
        $hora = '0'.$horainicial;
    }else if($horainicial==10 || $horainicial==11 || $horainicial==12){
        $hora = $horainicial;
    }
    
    $arreglohorarios .= '<option value="'.$horainicial.':00:00">'.$hora.':00 '.$meridiano.'</option>';
    $arreglohorarios .= '<option value="'.$horainicial.':30:00">'.$hora.':30 '.$meridiano.'</option>';
}

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
    $conn = mysql_connect(\''.$loclahost.'\', \''.$userdb.'\', \''.$pwddb.'\');
    mysql_select_db(\''.$namedb.'\', $conn);
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo \'catalogos*correcto*\'.mysql_insert_id();
    }else{
        echo \'catalogos*incorrecto\';
    }
    mysql_close($conn);
?>';
//Script para eliminar
$contenidoelimina = '<?php
    $idregistro = $_GET["idregistro"];
    $catalogo = $_GET["catalogo"];
    
    $sql1 = "delete from ".$catalogo." where id".$catalogo."=".$idregistro;
    $conn = mysql_connect(\''.$loclahost.'\', \''.$userdb.'\', \''.$pwddb.'\');
    mysql_select_db(\''.$namedb.'\', $conn);
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo \'catalogos*correcto*\'.$idregistro;
    }else{
        echo \'catalogos*incorrecto\';
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
    $conn = mysql_connect(\''.$loclahost.'\', \''.$userdb.'\', \''.$pwddb.'\');
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
        echo "catalogos*correcto*".$idregistro1."-".$idregistro2;
    }else{
        echo "catalogos*incorrecto";
    }
    mysql_close($conn);
?>';
//Inicio de la generacion de catalogos
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Captura de Atenciones</span></b>
<hr>';

if(@$_SESSION["login"] == true && ((@$_SESSION["privilegios"] == "Administrador") || (@$_SESSION["privilegios"] == "Gestor")))
{
/*echo $_SESSION["privilegios"];
echo "<br />";
if($_SESSION["login"]){
    echo "true";
}else{
    echo "false";
}*/
//echo "userdb: ".$userdb;
    $rs1 = mysql_query($sql1,$conn);
    while($registro1=mysql_fetch_array($rs1)){
        $catalogo = $registro1["tabla"];
        $sql2 = "describe ".$catalogo;
        $rs2 = mysql_query($sql2,$conn);
        echo '<div id=divcontenedor_"'.$catalogo.'">
              <div id="catalogo_'.$catalogo.'"><a href="javascript:muestrareporte(\'\',\''.$catalogo.'\');">Muestra Informacion del Catalogo '.$catalogo.'</a></div>
              <form id="guarda_'.$catalogo.'" method="POST" action="javascript:procesa_formulario_insert(\'resultado_'.$catalogo.'\',\'autoscripts/'.$idtransaccion.'guarda_'.$catalogo.'.php\',\'guarda_'.$catalogo.'\');" >
                <table width="100%" border="1">';
        $nomvalores='';
        $tipovalores='';
        $transaccion1 = 'insert into '.$catalogo.'(';
        $transaccion2 = ') values (';
        $transaccion3= ')';
        $transaccion = $transaccion1.'*'.$transaccion2.'*'.$transaccion3;
        $iteracion=1;
        $bandera_iteracion='false';
        $bandera_llenado='false';
        $genera_eliminacompuesta='false';
        while($registro2=mysql_fetch_array($rs2))
        {
            echo '<tr>';
            if(($registro2["Key"]!='PRI') && ($registro2["Extra"]!='auto_increment')){
                if($iteracion==1){
                    $nomtablahas = explode("_has_",$catalogo);
                    if(count($nomtablahas)>0){
                        echo '<td colspan="2">Asigna '.$nomtablahas[0].' a '.$nomtablahas[1].'</td></tr><tr>';
                    }else{
                        echo '<td colspan="2">Registra informacion a '.$catalgo.'</td></tr><tr>';
                    }
                    $bandera_iteracion = 'true';
                    $nomvalores .= $registro2["Field"].'*';
                    $tipovalores .= $registro2["Type"].'*';
                    echo '<td align="right">'.$registro2["Field"].':&nbsp;</td>';
                    echo '<td>';
                    if($registro2["Default"] != NULL){
                        $valordefault = $registro2["Default"];
                    }else{
                        $valordefault = '';
                    }
                    switch($registro2["Type"]){
                        case 'date':
                            echo '<input type="text" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" readonly="readonly" onclick="javascript:showCalendar(\'\',this,this,\'\',\''.$registro2["Field"].'\',0,0,1);" />';
                        break;
                        case 'time':
                            echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" readonly="readonly">
                                    '.$arreglohorarios.'
                                  </select>';
                        break;
                        default:
                            echo '<input type="text" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="'.$valordefault.'" />';
                    }
                    echo '</td>';
                }else{ 
                    $nomvalores .= $registro2["Field"].'*';
                    $tipovalores .= $registro2["Type"].'*';
                    echo '<td align="right">'.$registro2["Field"].':&nbsp;</td>';
                    echo '<td>';
                    if($registro2["Default"] != NULL){
                        $valordefault = $registro2["Default"];
                    }else{
                        $valordefault = '';
                    }
                    switch($registro2["Type"]){
                        case 'date':
                            echo '<input type="text" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" readonly="readonly" onclick="javascript:showCalendar(\'\',this,this,\'\',\''.$registro2["Field"].'\',0,0,1);" />';
                        break;
                        case 'time':
                            echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" readonly="readonly">
                                    '.$arreglohorarios.'
                                  </select>';
                        break;
                        default:
                            echo '<input type="text" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="'.$valordefault.'" />';
                    }
                    echo '</td>';
                }
            }else{
                if(($registro2["Key"]=='PRI') && ($registro2["Extra"]!='auto_increment')){
                    $nomvalores .= $registro2["Field"].'*';
                    $tipovalores .= $registro2["Type"].'*';
                    $tablas = explode("_",$registro2["Field"]);
                    $banderamodal=0;
                    if($bandera_llenado=='true'){
                        $sqlcompuesto = "select * from ".$tablas[0]." where id".$tablas[0]." not in (select ".$tablas[0]."_id".$tablas[0]." from ".$catalogo.")";
                        $genera_eliminacompuesta='true';
                    }else{
                        $sqlcompuesto = "select * from ".$tablas[0];
                    }
                    if($bandera_iteracion=='true'){
                        $bandera_llenado = 'true';
                    }
                    $rscompuesto = mysql_query($sqlcompuesto,$conn);
                    $nomcampoid = explode("_",$registro2["Field"]);
                    echo '<td align="right">
                        '.substr($nomcampoid[1],2).'
                        :&nbsp;</td>';
                    echo '<td><select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'">';
                    while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                        $banderamodal=1;
                        echo '
                            <option value="'.$registrocompuesto[0].'">
                                '.utf8_encode($registrocompuesto[1]).' '.utf8_encode($registrocompuesto[2]).'
                            </option>';
                    }
                    echo '</select>';
                    if($banderamodal==0){
                        echo '<a href="#'.$tablas[0].'" >Agrega '.$tablas[0].'</a>';
                    }
                    echo '</td>';
                }else{
                    echo '<td colspan="2">Registra un nuevo '.substr($registro2["Field"],2).'</td>';
                }
            }
            echo '</tr>';
        $iteracion++;
        }
        $tamnomvalores = strlen($nomvalores)-1;
        $tamtipovalores = strlen($tipovalores)-1;
        $nombrevalores = substr($nomvalores,0,$tamnomvalores);
        $tipodevalores = substr($tipovalores,0,$tamtipovalores);
        echo '</table>
              <input type="hidden" id="idtransaccion" name="idtransaccion" value="'.$idtransaccion.'" />
              <input type="hidden" id="transaccion" name="transaccion" value="'.$transaccion.'" />
              <input type="hidden" id="nombrevalores" name="nombrevalores" value="'.$nombrevalores.'" />
              <input type="hidden" id="tipovalores" name="tipovalores" value="'.$tipodevalores.'" />
              <input type="submit" id="botonguardar" name="botonguardar" value="Guardar"/></form>
                <br><div id="resultado_'.$catalogo.'"></div><hr>';
        echo '</div>';
        if($idarchivo=@fopen("../../autoscripts/".$idtransaccion."guarda_".$catalogo.".php","w")){
            @fwrite($idarchivo, $contenidoinserta);
            @fclose($idarchivo);
        }
        if($idarchivo=@fopen("../../autoscripts/elimina_".$catalogo.".php","w")){
            @fwrite($idarchivo, $contenidoelimina);
            @fclose($idarchivo);
        }
        if($genera_eliminacompuesta=='true'){
            if($idarchivo=@fopen("../../autoscripts/eliminacompuesta_".$catalogo.".php","w")){
                @fwrite($idarchivo, $contenidoeliminacompuesta);
                @fclose($idarchivo);
            }
        }
        $reportecatalogo = 'reportecatalogos.php';
        $nuevoreportecatalogo = '../../autoscripts/reporte_'.$catalogo.'.php';

        if (!copy($reportecatalogo, $nuevoreportecatalogo)){
            echo "error al crear el script: ". $nuevoreportecatalogo;
        }
    }
}
    $paginacionlib = 'paginacion.php';
    $nuevopaginacionlib = '../../autoscripts/paginacion.lib.php';

    if (!copy($paginacionlib, $nuevopaginacionlib)){
        echo "error al crear el script: ". $nuevopaginacionlib;
    }
?>
<script>
        inicializa_selects();
</script>
</body>
</html>
