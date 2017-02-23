<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>La Premier De Leon - Formatos</title>
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
session_start();
$conn = mysql_connect('localhost', 'softjitc_premier', 'lapremier123');
mysql_select_db('softjitc_lapremier', $conn);
$sql1 = "select tabla from formato_has_privilegios where privilegios_idprivilegios = (select idprivilegios from privilegios where descripcion = '".@$_SESSION["privilegios"]."')";

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

$contenido = '<?php
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
    $conn = mysql_connect(\'localhost\', \'softjitc_premier\', \'lapremier123\');
    mysql_select_db(\'softjitc_lapremier\', $conn);
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo \'formatos*correcto*\'.mysql_insert_id();
    }else{
        echo \'formatos*incorrecto\';
    }
?>';
//Script para eliminar
$contenidoelimina = '<?php
    $idregistro = $_GET["idregistro"];
    $catalogo = $_GET["catalogo"];
    
    $sql1 = "delete from ".$catalogo." where id".$catalogo."=".$idregistro;
    $conn = mysql_connect(\'localhost\', \'softjitc_premier\', \'lapremier123\');
    mysql_select_db(\'softjitc_lapremier\', $conn);
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo \'catalogos*correcto*\'.$idregistro;
    }else{
        echo \'catalogos*incorrecto\';
    }
?>';
//Inicio de la generacion de catalogos
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Pagina de Formatos</span></b>
<hr>';

if(@$_SESSION["autentificado"] == "SI" && @$_SESSION["privilegios"] != "invitado")
{
    $rs1 = mysql_query($sql1,$conn);
    while($registro1=mysql_fetch_array($rs1)){
        $catalogo = $registro1["tabla"];
        $sql2 = "describe ".$catalogo;
        $rs2 = mysql_query($sql2,$conn);
      switch($catalogo){
       case 'ronda':
        echo '<a name="'.$catalogo.'"></a>
              <div id="catalogo_'.$catalogo.'"><a href="javascript:muestrareporte(\'\',\''.$catalogo.'\');">Muestra Informacion de Catalogo '.$catalogo.'</a></div>
              <form id="guarda_'.$catalogo.'" method="POST" action="javascript:procesa_formulario_insert(\'resultado_'.$catalogo.'\',\'autoscripts/'.$idtransaccion.'guarda_'.$catalogo.'.php\',\'guarda_'.$catalogo.'\');" >
                <table width="100%" border="1">';
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
                        switch($catalogo){
                        case 'ronda':
                            switch($registro2["Field"]){
                            case "numero":
                                echo '<input type="text" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="'.$valordefault.'" onkeyup="javascript:solonumeros(\''.$registro2["Field"].'\')" />';
                            break;
                            default:
                                echo '<input type="text" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="'.$valordefault.'" />';
                            }
                        break;
                        default:
                            echo '<input type="text" id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" value="'.$valordefault.'" />';
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
                        '.substr($nomcampoid[1],2).'
                        :&nbsp;</td>';
                    echo '<td>';
                    
                    switch($catalogo){
                        case 'ronda':
                            switch($registro2["Field"]){
                            case "grupo_idgrupo":
                                //echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" onchange="javascript:alert(\'funcion para campo_idcampo\');" >';
                                echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'" >';
                                while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                                    $banderamodal=1;
                                    echo '
                                        <option value="'.$registrocompuesto[0].'">
                                            '.utf8_encode($registrocompuesto[1]).'
                                        </option>';
                                }
                                echo '</select>';
                            break;
                            default:
                                echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'">';
                                while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                                    $banderamodal=1;
                                    echo '
                                        <option value="'.$registrocompuesto[0].'">
                                            '.utf8_encode($registrocompuesto[1]).'
                                        </option>';
                                }
                                echo '</select>';
                            }
                        break;
                        default:
                            echo '<select id="'.$registro2["Field"].'" name="'.$registro2["Field"].'">';
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
                    echo '<td colspan="2">Agrega Informacion a Catalogo '.substr($registro2["Field"],2).'</td>';
                }
            }
            echo '</tr>';
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
        
        if($idarchivo=@fopen("../../autoscripts/".$idtransaccion."guarda_".$catalogo.".php","w")){
            @fwrite($idarchivo, $contenido);
            @fclose($idarchivo);
        }
        if($idarchivo=@fopen("../../autoscripts/elimina_".$catalogo.".php","w")){
            @fwrite($idarchivo, $contenidoelimina);
            @fclose($idarchivo);
        }
        $reportecatalogo = 'reporteformatos.php';
        $nuevoreportecatalogo = '../../autoscripts/reporte_'.$catalogo.'.php';

        if (!copy($reportecatalogo, $nuevoreportecatalogo)){
            echo "error al crear el script: ". $nuevoreportecatalogo;
        }
    
        $paginacionlib = 'paginacion.php';
        $nuevopaginacionlib = '../../autoscripts/paginacion.lib.php';

        if (!copy($paginacionlib, $nuevopaginacionlib)){
            echo "error al crear el script: ". $nuevopaginacionlib;
        }
      }//Fin del switch para cada formulario de formato
    }//Fin del While para recorrer todos los fomatos registrados en formato_has_privilegios
}
?>
</body>
</html>
