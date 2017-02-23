<?php
require_once ('paginacion.lib.php');

$catalogo = $_GET["catalogo"];

$conn = mysql_connect("localhost","softjitc_premier","lapremier123");
mysql_select_db("softjitc_lapremier", $conn);
date_default_timezone_set('America/Mexico_City');

$paginado = new PHPPaging();

$identificador = array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","aa","ab","ac","ad","ae","af","ag","ah","ai","aj","ak","al","am","an","ao","ap","aq","ar","as","at","au","av","aw","ax","ay","az");
$querycontruido = "select ";
$constructrs1 = mysql_query("describe ".$catalogo);
$numcamps = 0;
while($constructrow1=mysql_fetch_array($constructrs1)){
    $constructcampo[$numcamps] = $constructrow1["Field"];
    $numcamps++;
}
mysql_free_result($constructrs1);
$j=0;
for($i=0;$i<$numcamps;$i++){
    $extraecolumna = explode("_",$constructcampo[$i]);
    if(count($extraecolumna)>1){
        $j++;
        $columnas[$j] = $extraecolumna[0];
        $nomcolumnas[$j] = $extraecolumna[1];
        $constructrs2 = mysql_query("describe ".$extraecolumna[0]);
        $contacampo2 = 0;
        while($constructrow2=mysql_fetch_array($constructrs2)){
            if($contacampo2==1){
                $nomcampo2 = $constructrow2["Field"];
                $nomcolumna[$i] = $identificador[$j].'.'.$nomcampo2.' as '.substr($extraecolumna[1],2);
                $encabezados[$i]=substr($extraecolumna[1],2);
            }
            $contacampo2++;
        }
        mysql_free_result($constructrs2);
    }else{
        $nomcolumna[$i] = $identificador[$j].'.'.$extraecolumna[0];
        $encabezados[$i]=$extraecolumna[0];
    }
}
$numcampsminusuno = $numcamps-1;
for($i=0;$i<$numcampsminusuno;$i++){
    $querycontruido .= $nomcolumna[$i].',';
    $ultimacolumna = $nomcolumna[$i+1];
}
$querycontruido .= $ultimacolumna;
$k=0;
$identificador1 = $identificador[$k];

$querycontruido .= ' from '.$catalogo.' '.$identificador1;

for($i=1;$i<=$j;$i++){
    $k++;
    $querycontruido .= ' inner join '.$columnas[$i].' '.$identificador[$k].' on('.$identificador1.'.'.$columnas[$i].'_'.$nomcolumnas[$i].'='.$identificador[$k].'.id'.$columnas[$i].') ';
}

$querypaginado=$querycontruido;
$noregppagina = 5;

  // Asigna el Catalogo a mostrar
  $paginado->asignacatalogo($catalogo);
  // Se agrega la consulta a la variable $paginado
  $paginado->agregarConsulta($querypaginado);
  // Numero de registros por pagina
  $paginado->porPagina($noregppagina);
  // Estableciendo las páginas adyacentes 
  $paginado->paginasAntes(4, 10, 30); 
  $paginado->paginasDespues(4, 10, 30);    
  // Estableciando el estilo de la clase
  $paginado->linkClase('nav');  
  // Estableciendo el separador general
  $paginado->linkSeparador(false); //Significa que no habrá separacion 
  // Separador especial
  $paginado->linkSeparadorEspecial('...');
  // Ingresando un ancla
  //$paginado->linkAgregar('#ancla'); 
  // Personalizando el título de los links
  $paginado->linkTitulo('Página %1$s: Registros del %2$s al %3$s (Total: %4$s)');
  // Cambiando el texto hacia la primera y última páginas 
  $paginado->mostrarPrimera("|<", true); 
  $paginado->mostrarUltima(">|", true); 
  // Quitando el link hacia las páginas anterior y siguiente
  $paginado->mostrarAnterior(true);
  $paginado->mostrarSiguiente(true); 
  // Cambiando el texto de la referencia a la página actual
  $paginado->mostrarActual("<span class=\"navthis\">{n}</span>");
  // Cambiando el nombre de la variable 
  $paginado->nombreVariable("Pagina"); 
         
  $paginado->ejecutar(); 

$tabla='
<table cellspacing="0" class="ewGrid"><tbody><tr><td class="ewGridContent">
<div class="ewGridUpperPanel">
<table cellspacing="0" cellpadding="0" border="0" class="ewPager">
	<tbody><tr>
		<td nowrap="">
	<table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td><span class="phpmaker">Página&nbsp;</span></td>
	<!--current page number-->
	<td>'.$paginado->numEstaPagina().'</td>
		<td><span class="phpmaker">&nbsp;de '.$paginado->numTotalPaginas	().'</span></td>
	</tr></tbody></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="phpmaker">Resultados '.$paginado->numPrimerRegistro().' a '.$paginado->numUltimoRegistro().' de '.$paginado->numTotalRegistros().'</span>
		</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td>Resultados por Página:&nbsp;</td><td>
'.$paginado->numRegistrosMostrados().'</td></tr></tbody></table>
		</td>
	</tr>
</tbody></table>
</div>
<div class="ewGridMiddlePanel">
<table cellspacing="0" class="ewTable ewTableSeparate" id="Tcolor">
	<thead>
		<tr>';
for($i=0;$i<$numcamps;$i++){
    $tabla.='<td class="ewTableHeader" >'.$encabezados[$i].'</td>';
}
$tabla.='</tr>
	</thead>
	<tbody>
';
$base=0;
while($Renglon=$paginado->fetchResultado()){
    for($a=0;$a<$numcamps;$a++){
        $arregloresultado[$base][$a] = $Renglon[$encabezados[$a]];
    }
$tabla.=<<<_HTML_
        <tr class="ewTableRow" >
_HTML_;
    for($a=0;$a<$numcamps;$a++){
        $tabla.=<<<_HTML_
        <td style="border-bottom: 0pt none;"><div>
_HTML_;
        $tabla.= $arregloresultado[$base][$a];
        $tabla.=<<<_HTML_
        </div></td>
_HTML_;
    }
$tabla.=<<<_HTML_
        </tr>
_HTML_;

$base++;
}
    
$tabla .="
	</tbody>
</table>
</div>
<p>
<div style='font-weight:bold;'>".$paginado->fetchNavegacion()."</div>
</p>
</td></tr></tbody></table>";

/*echo "select co.tipo,co.fecha,co.total,u.nombre as usuario,cc.naturaleza,cc.nombre as ctacontable from cortecaja co inner join usuarios u on(co.usuarios_idusuarios=u.idusuarios)
inner join ctascontables cc on(co.ctascontables_idctascontables=cc.idctascontables)
where fecha between '".$diaactual." 00:00:00' and '".$diaactual." 23:59:59' order by fecha asc";*/
echo $tabla;
?>
