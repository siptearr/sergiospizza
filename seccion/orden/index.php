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


$idtransaccion=date('Ymd');
@$localhost = $_SESSION["localhost"];
@$userdb = $_SESSION["userdb"];
@$pwddb = $_SESSION["pwddb"];
@$namedb = $_SESSION["namedb"];
@$privilegios = $_SESSION["privilegios"];
@$idusr = $_SESSION["idusr"];

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
//echo "Privilegios: ".$_SESSION["privilegios"];
//Inicio de la generacion de catalogos
//echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Registrar '.  ucfirst($seccionactual).'</span></b><hr>';
if((@$_SESSION["login"] == true) && ((@$_SESSION["privilegios"] == "orden") || (@$_SESSION["privilegios"] == "venta"))){
    $rs1 = mysql_query($sql1,$conn);
    while($registro1=mysql_fetch_array($rs1)){
        $catalogo = $registro1["tabla"];
        $sql2 = "describe ".$catalogo;
        $rs2 = mysql_query($sql2,$conn);
      switch($catalogo){
      case $seccionactual:
//echo '<a name="'.$catalogo.'"></a>';
echo '<div id="catalogo_'.$catalogo.'"><a href="javascript:muestrareporte(\'\',\''.$catalogo.'\');">Muestra Informacion de '.ucfirst($catalogo).'</a></div>';
echo '<hr>';
          
        echo '<form id="guarda_'.$catalogo.'" method="POST" action="javascript:procesa_formulario_insert(\'resultado_'.$catalogo.'\',\'autoscripts/'.$idtransaccion.'guarda_'.$catalogo.'.php\',\'guarda_'.$catalogo.'\');" >';
  /* Codigo para insertar formato a los controles
        if($privilegios != "Administrador"){
            echo '<div id="prueba" style="visibility: hidden">';
        }else{
            echo '<div id="prueba" style="visibility: visible">';
        }
  */
        echo '<table id="autotabla_'.$catalogo.'" border="1" >';
        $nomvalores='';
        $tipovalores='';
        $imprimecredenciales='false';
        $transaccion1 = 'insert into '.$catalogo.'(';
        $transaccion2 = ') values (';
        $transaccion3= ')';
        $transaccion = $transaccion1.'*'.$transaccion2.'*'.$transaccion3;
        while($registro2=mysql_fetch_array($rs2))
        {
            echo '<tr>';
            if(($registro2["Key"]!='PRI') && ($registro2["Extra"]!='auto_increment')){
                $nomvalores .= $registro2["Field"].'*';
                $tipovalores .= $registro2["Type"].'*';
/*
*  Seccion para definir el nombre de los controles a capturar en el catalogo seleccionado
*/
                switch($registro2["Field"]){
                    case "appat":
                        echo '<td align="right">Apellido Paterno:&nbsp;</td>';
                        echo '<td>';
                    break;
                    case "apmat":
                        echo '<td align="right">Apellido Materno:&nbsp;</td>';
                        echo '<td>';
                    break;
                    case "fecnac":
                        echo '<td align="right">Fecha de Nacimiento:&nbsp;</td>';
                        echo '<td>';
                    break;
                    case "numexp":
                        echo '<td align="right">Expediente:&nbsp;</td>';
                        echo '<td>';
                    break;
                    case "estatus":
                        echo '<td align="right"></td>';
                        echo '<td>';
                    break;
                    default:
                        echo '<td align="right">'.ucfirst($registro2["Field"]).':&nbsp;</td>';
                        echo '<td>';
                }
                if($registro2["Default"] != NULL){
                    $valordefault = $registro2["Default"];
                }else{
                    $valordefault = '';
                }
                switch($registro2["Type"]){
                    case 'date':
                        if($registro2["Field"] == "fecnac"){
                            echo '<input type="text" class="form-control" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" readonly="readonly" size="15" />';
                        }else{
                            echo '<input type="text" class="form-control" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" readonly="readonly" onclick="javascript:showCalendar(\'\',this,this,\'\',\''.$registro2["Field"].'\',0,0,1);" />';
                        }
                    break;
                    default:
/*
 * Seccion de personalizacion de tipo de controles para el catalogo en turno
 */ 
                        switch($catalogo){                       
                        case $seccionactual:
                            switch($registro2["Field"]){
                            case "numero":
                                echo '<input type="text" class="form-control" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="'.$valordefault.'" onkeyup="javascript:solonumeros(\''.$registro2["Field"].'\')" />';
                            break;
                            case "numafiliacion":
                                echo '<input type="text" class="form-control" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="'.$valordefault.'" onkeyup="javascript:solonumeros(\''.$registro2["Field"].'\')" />';
                            break;
                            case "estatus":
                                echo '<input type="hidden" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="activo" />';
                            break;
                            default:
                                echo '<input type="text" class="form-control" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="'.$valordefault.'" />';
                            }
                        break;
                        default:
                            echo '<input type="text" class="form-control" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="'.$valordefault.'" />';
                        }
                }
                echo '</td>';    
            }else{
                if(($registro2["Key"]=='PRI') && ($registro2["Extra"]!='auto_increment')){
                    $nomvalores .= $registro2["Field"].'*';
                    $tipovalores .= $registro2["Type"].'*';
                    $tablas = explode("_",$registro2["Field"]);
                    $banderamodal=0;
                    $sqlcompuesto = "select * from ".$tablas[0];
                    $rscompuesto = mysql_query($sqlcompuesto,$conn);
                    $nomcampoid = explode("_",$registro2["Field"]);
                    echo '<td align="right">
                        '.ucfirst(substr($nomcampoid[1],2)).'
                        :&nbsp;</td>';
                    echo '<td>';
/*
 * Seccion de personalizacion de los valores en los Select's
 */
                    switch($catalogo){
                        case $seccionactual:
                            switch($registro2["Field"]){
                            case "genero_idgenero":
                                //echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" onchange="javascript:alert(\'funcion para campo_idcampo\');" >';
                                echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" class="form-control" >';
                                while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                                    $banderamodal=1;
                                    echo '<option value="'.$registrocompuesto[0].'">';
                                            if(utf8_encode($registrocompuesto[1])=="Masculino"){
                                                echo 'Hombre';
                                            }else{
                                                echo 'Mujer';
                                            }
                                    echo '</option>';
                                }
                                echo '</select>';
                            break;
                            case "usuario_idusuario":
                                //echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" onchange="javascript:alert(\'funcion para campo_idcampo\');" >';
                                echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" class="form-control" >';
                                while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                                    $banderamodal=1;
                                    echo '<option value="'.$registrocompuesto[0].'">'.$registrocompuesto[3].'</option>';
                                }
                                echo '</select>';
                            break;
                            case "mesa_idmesa":
                                //echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" onchange="javascript:alert(\'funcion para campo_idcampo\');" >';
                                echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" class="form-control" onclick="javascript:guardamesa();">';
                                while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                                    $banderamodal=1;
                                    echo '<option value="'.$registrocompuesto[0].'">'.$registrocompuesto[1].'</option>';
                                }
                                echo '</select>';
                            break;
                            case "cliente_idcliente":
                                //echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" onchange="javascript:alert(\'funcion para campo_idcampo\');" >';
                                echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" class="form-control" onclick="javascript:guardacliente();">';
                                while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                                    $banderamodal=1;
                                    echo '<option value="'.$registrocompuesto[0].'">'.$registrocompuesto[3].'</option>';
                                }
                                echo '</select>';
                            break;
                            case "producto_idproducto":
                                //echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" onchange="javascript:alert(\'funcion para campo_idcampo\');" >';
                                echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" class="form-control" >';
                                while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                                    $banderamodal=1;
                                    if($registrocompuesto[2] != ""){
                                        echo '<option value="'.$registrocompuesto[0].'">Pizza '.utf8_encode($registrocompuesto[1]).'-'.$registrocompuesto[2].'</option>';
                                    }else{
                                        echo '<option value="'.$registrocompuesto[0].'">'.utf8_encode($registrocompuesto[1]).'</option>';
                                    }
                                }
                                echo '</select>';
                            break;
                            default:
                                echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" class="form-control" >';
                                while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                                    $banderamodal=1;
                                    echo '
                                        <option value="'.$registrocompuesto[0].'">'.utf8_encode($registrocompuesto[1]).'</option>';
                                }
                                echo '</select>';
                            }
                        break;
                        default:
                            echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" class="form-control" >';
                            while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                                $banderamodal=1;
                                echo '
                                    <option value="'.$registrocompuesto[0].'">
                                        '.utf8_encode($registrocompuesto[1]).'
                                    </option>';
                            }
                            echo '</select>';
                        }
                    
                    if($banderamodal==0){
                        echo '<a href="#'.$tablas[0].'" >Agrega '.$tablas[0].'</a>';
                    }
                    echo '</td>';
                }else{
                    echo '<td colspan="2">Captura Informacion del '.ucfirst(substr($registro2["Field"],2)).'</td>';
                }
            }
            echo '</tr>';
        }
        $tamnomvalores = strlen($nomvalores)-1;
        $tamtipovalores = strlen($tipovalores)-1;
        $nombrevalores = substr($nomvalores,0,$tamnomvalores);
        $tipodevalores = substr($tipovalores,0,$tamtipovalores);
        echo '</table>';
/* Codigo para insertar formato a los controles        
        echo '</table></div>';
/*
 * Zona de codigo para 
 * cargar el diseño del formulario
 * a mostrar al usuario final
 */
        
        
echo '
        
';        
        
        
/*
 * Zona de codigo para 
 * cargar el diseño del formulario
 * a mostrar al usuario final
 */        
        echo '<input type="hidden" id="idtransaccion" name="idtransaccion" value="'.$idtransaccion.'" />
              <input type="hidden" id="transaccion" name="transaccion" value="'.$transaccion.'" />
              <input type="hidden" id="nombrevalores" name="nombrevalores" value="'.$nombrevalores.'" />
              <input type="hidden" id="tipovalores" name="tipovalores" value="'.$tipodevalores.'" />';
/*
 * Seccion para crear controles hidden para control de captura en formularios anidados
 */
        echo '<input type="hidden" id="idafiliadoselect" name="idafiliadoselect" value="0" />';
        echo '<input type="hidden" id="idusuarioselect" name="idusuarioselect" value="'.$idusr.'" />';
/*
 * Seccion para crear controles hidden para control de captura en formularios anidados
 */
        echo '<div id="autobotones_'.$catalogo.'" >';
        echo '<input type="submit" id="botonguardar" name="botonguardar" value="Guardar"/>
              <input type="button" id="botonlimpiar" name="botonlimpiar" value="Limpiar" onclick="javascript:limpia_formulario_insert(\'guarda_'.$catalogo.'\')"/></div>';
//echo '<a href="javascript:redibuja_form(\''.$catalogo.'\')"/>Redibuja</a>';
        echo '</form>
                <br><div id="resultado_'.$catalogo.'"></div><hr>';
//echo '<div id="catalogo_'.$catalogo.'"><a href="javascript:muestrareporte(\'\',\''.$catalogo.'\');">Muestra Informacion de '.ucfirst($catalogo).'</a></div>';
//echo "<hr>";
//        echo '<div id="catalogo_'.$catalogo.'"></div>';
        
        $root = '../../autoscripts/';
        if( file_exists($root)) {
            $files = scandir($root);
            natcasesort($files);
            if( count($files) > 2 ) { /* The 2 accounts for . and .. */
		// All files
		foreach( $files as $file ) {
                    if( file_exists($root . $file) && $file != '.' && $file != '..' && !is_dir($root . $file) ){
			if(substr($file,0,8) != $idtransaccion){
                                    unlink($root.$file);
			}
                    }
                }
            }
        }
        
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