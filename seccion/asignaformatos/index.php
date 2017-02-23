<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>La Premier De Leon - Asigna Formatos</title>
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
$conn = mysql_connect('localhost', 'softjit1_userest', 'userest123');
mysql_select_db('softjit1_restaurant', $conn);

if(@$_SESSION["autentificado"] == "SI" && @$_SESSION["privilegios"] == "superusuario")
{
    echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Seccion de Configuracion de Catalogos, Usuario: '.@$_SESSION["usuario"].'</span></b>
<hr>';
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
            $serializa .= "\'".$_POST[$arreglovalores[$i]]."\',";
        break;
        case \'dat\':
            $serializa .= "\'".$_POST[$arreglovalores[$i]]."\',";
        break;
        }
        $nombresvalores .= $arreglovalores[$i].\',\';
        $i++;
    } 
    $nombresvalores = substr($nombresvalores,0,strlen($nombresvalores)-1);
    $serializa = substr($serializa,0,strlen($serializa)-1);
    
    $sql1 = $arreglotransaccion[0].$nombresvalores.$arreglotransaccion[1].$serializa.$arreglotransaccion[2];
    $conn = mysql_connect(\'localhost\', \'softjit1_userest\', \'userest123\');
    mysql_select_db(\'softjit1_restaurante\', $conn);
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo \'catalogos*correcto*\'.mysql_insert_id();
    }else{
        echo \'catalogos*incorrecto\';
    }
?>';    
//****************************************************************************
// Seccion de carga de asignacion de formatos para la sesion SuperUsuario            
//****************************************************************************
        $catalogo = "formato_has_privilegios";       
        $sql1 = "describe ".$catalogo;
        $sql2 = "show tables where Tables_in_softjitc_lapremier not in (select tabla from ".$catalogo.")";
        $rs1 = mysql_query($sql1,$conn);
        $rs2 = mysql_query($sql2,$conn);

        echo '<div id="catalogo_'.$catalogo.'"><a href="javascript:muestrareporte(\'\',\''.$catalogo.'\');">Muestra Informacion de la Configuracion de Formatos</a></div>
              <form id="guarda_'.$catalogo.'" method="POST" action="javascript:procesa_formulario_insert(\'resultado_'.$catalogo.'\',\'autoscripts/'.$idtransaccion.'guarda_'.$catalogo.'.php\',\'guarda_'.$catalogo.'\');" >
                <table width="100%" border="1">';
        $nomvalores='';
        $tipovalores='';
        $transaccion1 = 'insert into '.$catalogo.'(';
        $transaccion2 = ') values (';
        $transaccion3= ')';
        $transaccion = $transaccion1.'*'.$transaccion2.'*'.$transaccion3;
        $iteracion=1;
        while($registro1=mysql_fetch_array($rs1))
        {
            echo '<tr>';
            if(($registro1["Key"]!='PRI') && ($registro1["Extra"]!='auto_increment')){
                if($iteracion==1){
                    $nomtablahas = explode("has",$catalogo);
                    if(count($nomtablahas)>0){
                        echo '<td colspan="2">Asigna '.$nomtablahas[0].' a '.$nomtablahas[1].'</td></tr><tr>';
                    }else{
                        echo '<td colspan="2">Registra informacion a '.$catalgo.'</td></tr><tr>';
                    }
                    $nomvalores .= $registro1["Field"].'*';
                    $tipovalores .= $registro1["Type"].'*';
                    echo '<td align="right">'.$registro1["Field"].':&nbsp;</td>';
                    if($registro1["Field"]=="tabla"){
                        echo '<td><select id="'.$registro1["Field"].'" name="'.$registro1["Field"].'">';
                        while($registro2=mysql_fetch_array($rs2))
                        {
                            echo '<option value="'.$registro2["Tables_in_softjitc_lapremier"].'">
                                        '.$registro2["Tables_in_softjitc_lapremier"].'
                                    </option>';
                        }
                        echo '</select></td>';
                    }else{
                        if($registro1["Default"] != NULL){
                            $valordefault = $registro1["Default"];
                        }else{
                            $valordefault = '';
                        }
                        echo '<td>
                        <input type="text" id="'.$registro1["Field"].'" name="'.$registro1["Field"].'" value="'.$valordefault.'" />
                        </td>
                        ';
                    }    
                }
            }else{
                if(($registro1["Key"]=='PRI') && ($registro1["Extra"]!='auto_increment')){
                    $nomvalores .= $registro1["Field"].'*';
                    $tipovalores .= $registro1["Type"].'*';
                    $tablas = explode("_",$registro1["Field"]);
                    $sqlcompuesto = "select * from ".$tablas[0];
                    $rscompuesto = mysql_query($sqlcompuesto,$conn);
                    $nomcampoid = explode("_",$registro1["Field"]);
                    echo '<td align="right">
                        '.substr($nomcampoid[1],2).'
                        :&nbsp;</td>';
                    echo '<td><select id="'.$registro1["Field"].'" name="'.$registro1["Field"].'">';
                    while($registrocompuesto=mysql_fetch_array($rscompuesto)){
                        echo '
                            <option value="'.$registrocompuesto[0].'">
                                '.$registrocompuesto[1].'
                            </option>';
                    }
                    echo '</select></td>';
                }else{
                    echo '<td colspan="2">Agrega infromacion a '.substr($registro1["Field"],2).'</td>';
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
                <br><div id="resultado_'.$catalogo.'"></div>';
        
        echo '<input type="button" onclick="javascript:depuraautoscripts();"  value="Depura AutoScripts"/>';
        
        //****************************************************************************        
        //Genera autoscripts
        if($idarchivo=@fopen("../../autoscripts/".$idtransaccion."guarda_".$catalogo.".php","w")){
            @fwrite($idarchivo, $contenido);
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
        //**************************************************************************** 
}else{
    echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">No tienes privilegios de abrir esta pagina usuario: '.@$_SESSION["usuario"].'</span></b>
        <hr>';    
}

?>

</body>
</html>
