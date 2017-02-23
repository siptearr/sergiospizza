<?php
ini_set("memory_limit","72M");
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING );
ini_set("display_errors", 0);
require_once "conectar/conecta.php";
require_once ('xajax5/xajax_core/xajax.inc.php');
$varasignabd = new conectabd;
$varasignabd->asignabd();

//Ruta en Pruebas
//define(ruta_fotos,"fotos/");

//Ruta en productivo
//define(ruta_fotos,"../reg/archivos/Foto_temporal/");

function fecha(){
	$mes = date("n");
	$mesArray = array(
		1 => "Enero", 
		2 => "Febrero", 
		3 => "Marzo", 
		4 => "Abril", 
		5 => "Mayo", 
		6 => "Junio", 
		7 => "Julio", 
		8 => "Agosto", 
		9 => "Septiembre", 
		10 => "Octubre", 
		11 => "Noviembre", 
		12 => "Diciembre"
	);

	$semana = date("D");
	$semanaArray = array(
		"Mon" => "Lunes", 
		"Tue" => "Martes", 
		"Wed" => "Miercoles", 
		"Thu" => "Jueves", 
		"Fri" => "Viernes", 
		"Sat" => "S�bado", 
		"Sun" => "Domingo", 
	);
	
	$mesReturn = $mesArray[$mes];
	$semanaReturn = $semanaArray[$semana];
	$dia = date("d");
	$anio = date ("Y");
	
return $semanaReturn." ".$dia." de ".$mesReturn." de ".$anio;
}

$link= mysql_connect($varasignabd->db_host, $varasignabd->db_user, $varasignabd->db_pass) 
          or die("No se pudo conectar a la Base de datos".mysql_error());
mysql_select_db($varasignabd->db_name) or die("Otro error ".mysql_error());


$xajax = new xajax(); 
$xajax->setCharEncoding("iso-8859-1"); // La codificacion a utilizar
$xajax->setFlag("decodeUTF8Input",true);
$xajax->configure('javascript URI','xajax5');
$xajax->setFlag('debug', false);
//----------------------------------------------
$xajax->register(XAJAX_FUNCTION,"procLlenaAsesores");
$xajax->register(XAJAX_FUNCTION,"procGenerar");
$xajax->register(XAJAX_FUNCTION,"procLimpiar");
$xajax->register ( XAJAX_FUNCTION, "equipos" );
$xajax->register ( XAJAX_FUNCTION, "buscar" );

//----------------------------------------------
$xajax->processRequest();

function buscar($dato)
{
	$respuesta = new xajaxResponse ();
	global $link;
	
	if(trim($dato)=="")
	{
		$respuesta->alert("Debes escribir, dato del jugador a buscar");
		return $respuesta;
	}
	
 $SQLEmp_1 = "
 				SELECT
 					jugador.idjugador as id,
					jugador.nombre AS Jugador,
					equipo.nombre AS Equipo
					FROM softjitc_lapremier.jugador,softjitc_lapremier.equipo
					Inner Join equipo_has_jugador ON '' = ''
					WHERE
					equipo_has_jugador.jugador_idjugador =  jugador.idjugador AND
					equipo_has_jugador.equipo_idequipo =  equipo.idequipo AND
					jugador.estatus =  'Activo'	
					and jugador.nombre like('%$dato%')
 ";
		
	
	$rst_1 = mysql_query($SQLEmp_1,$link);
	if(!$rst_1)
	{
		$respuesta->alert("Error: ".mysql_error()); return $respuesta;
	}
	
	$num_reg=mysql_num_rows($rst_1);
	if($num_reg<=0)
	{
		$respuesta->alert("No se encontraron registros coinsidentes con esta busqueda.$num_reg");
		$respuesta->assign("txt_Buscar","value","");
		$respuesta->script("form1.txt_Buscar.focus()");
	}

	$comp = "<select name=\"list1[]\" id=\"list1\" multiple size=\"10\"
   onDblClick = \"Selectbox.moveSelectedOptions(this.form.list1,this.form.list2,1,this.form.movepattern1.value)\">";
		
	while ( $renglon = mysql_fetch_array ( $rst_1 ) )
	{	

		$valor = $renglon['id'];
		$txt =  $renglon['Jugador'];
		$comp .= "<option value=\"$valor\">$txt</option>";
	}//fin del While
	
	$comp .= "</select>";
	
		$HTML = obtListas();
		$respuesta->assign ( "divListados", "innerHTML", $HTML );
		$respuesta->assign ( "divLista1", "innerHTML", $comp );
	return $respuesta;
}

function equipos()
{
	$respuesta = new xajaxResponse ();

	$sqlEquipo="SELECT idequipo, nombre FROM equipo WHERE estatus = 'Activo'";
	$rst_direcciones=mysql_query($sqlEquipo)or die("Error en la..".mysql_error());
	$combo_direcciones="<select id='cmbdirecciones' name='cmbdirecciones' onchange='xajax_procLlenaAsesores(this.value)'>";
	$combo_direcciones.="<option value=''>Todos los Equipos</option>";
	while ($renglon_direcciones=mysql_fetch_array($rst_direcciones))
	{
		$id_direccion=$renglon_direcciones['idequipo'];
		$descripcion_direccion=$renglon_direcciones['nombre'];
		$combo_direcciones.="<option value='$id_direccion'>$descripcion_direccion</option>";
	}
	$combo_direcciones.="</select>";
	
	return $combo_direcciones;
}




function procGenerar($entrada){
	$respuesta = new xajaxResponse();
	extract($entrada);
	
	if(count($list2) == 0){
		$respuesta->alert("Debe seleccionar al menos un Jugador para generar Credenciales.");
		return $respuesta;
	}
	
	$txt = "?";
	foreach($list2 as $valor){
		$txt .= "ID[]=$valor&";
	}
	
   $GeneracionPDF ="generacredencial.php".$txt;	
   $respuesta->assign("valormiventana", "value", $GeneracionPDF);
	return $respuesta;
}
//----------------------------------------------
function procLimpiar(){
  $respuesta = new xajaxResponse();
  $respuesta->script("xajax_procLlenaAsesores()");
  $respuesta->clear("miVentana","innerHTML");
  return $respuesta;
}



function procLlenaAsesores($equipo = ""){
  $respuesta = new xajaxResponse();
	global $link;
	
//Filtramos por equipo
if($equipo!="")
{
	$sql=" and equipo_has_jugador.equipo_idequipo =  $equipo";	
}else{
	$sql="";
}
	
	//Se genera la consulta princiapl	
	$SQLEmp = "SELECT
					jugador.idjugador as id,
					jugador.nombre AS Jugador,
					equipo.nombre AS Equipo
					FROM softjitc_lapremier.jugador,softjitc_lapremier.equipo
					Inner Join equipo_has_jugador ON '' = ''
					WHERE
					equipo_has_jugador.jugador_idjugador =  jugador.idjugador AND
					equipo_has_jugador.equipo_idequipo =  equipo.idequipo AND
					jugador.estatus =  'Activo'	$sql";

	$rst = mysql_query($SQLEmp,$link);
	if(!$rst)
	{
		$respuesta->alert("Error: $SQLEmp ".mysql_error()); return $respuesta;
	}
									
	$rst = mysql_query ( $SQLEmp, $link );
	$comp = "<select name=\"list1[]\" id=\"list1\" multiple size=\"10\"
   onDblClick = \"Selectbox.moveSelectedOptions(this.form.list1,this.form.list2,1,this.form.movepattern1.value)\">";

	while ( $renglon = mysql_fetch_array ( $rst ) )
	{	
	    	$valor = $renglon['id'];
			$txt =  $renglon['Jugador'];
			$comp .= "<option value=\"$valor\">$txt</option>";
	}
	$comp .= "</select>";
	
		$HTML1 = obtListas1();
		$respuesta->assign ( "divListados", "innerHTML", $HTML1 );
                $HTML2 = obtListas2();
		$respuesta->assign ( "accionesdeseleccion", "innerHTML", $HTML2 );
                $HTML3 = obtListas3();
		$respuesta->assign ( "jugadoresseleccionados", "innerHTML", $HTML3 );
		$respuesta->assign ( "divLista1", "innerHTML", $comp );
	return $respuesta;
}

function obtListas1(){
$FormDetalle =<<<_HTML
 <div id="divLista1">
  <select name="list1" id="list1" multiple size="10"
   onDblClick="Selectbox.moveSelectedOptions(this.form.list1,this.form.list2,1,this.form.movepattern1.value)">
  </select>
	</div>   
_HTML;

  return $FormDetalle;
}

function obtListas2(){
$FormDetalle =<<<_HTML
  <input type="button" name="right" value="&gt;&gt;"
   onClick="Selectbox.moveSelectedOptions(this.form.list1,this.form.list2,1,this.form.movepattern1.value)"><br><br>
  <input type="button" name="right" value="Todo &gt;&gt;"
   onClick="Selectbox.moveAllOptions(this.form.list1,this.form.list2,1,this.form.movepattern1.value)"><br>
  <input type="hidden" name="movepattern1" id="movepattern1" />
  <br>
  <input type="button" name="left" value="&lt;&lt;"
   onClick="Selectbox.moveSelectedOptions(this.form.list2,this.form.list1,1,this.form.movepattern1.value)"><br><br>
  <input type="button" name="left" value="Todo &lt;&lt;"
   onClick="Selectbox.moveAllOptions(this.form.list2,this.form.list1,1,this.form.movepattern1.value)"> </td>
_HTML;

  return $FormDetalle;
}

function obtListas3(){
$FormDetalle =<<<_HTML
 <div id="divLista2">
  <select name="list2[]" id="list2" multiple size="10"
   onDblClick="Selectbox.moveSelectedOptions(this.form.list2,this.form.list1,1,this.form.movepattern1.value)">
  </select>
	</div>
_HTML;

  return $FormDetalle;
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Credenciales de jugadores de Lapremierdeleon</title>
<script language="JavaScript" src="selectbox.js"></script>
<?php  $xajax->printJavaScript(); ?>

<script type="text/javascript">
  function selectAllOptions(id) {
    var ref = document.getElementById(id);
    
    for(i=0; i<ref.options.length; i++)
      ref.options[i].selected = true;
  }
  
</script>	
<script type="text/javascript">
function Enviodatos(){
	selectAllOptions('list2');
	document.form1.submit();
}
</script>

<script type="text/javascript">
function Generar(){
  selectAllOptions('list2');
  xajax_procGenerar(xajax.getFormValues('form1'));
  document.getElementById("estatus").innerHTML = "Cargando datos de impresion...";
  setTimeout("inicializa();",1000);
  setTimeout("limpia();",1001);
}

function inicializa(){
    window.open(document.getElementById("valormiventana").value,'_blank');
}

function limpia(){
    document.getElementById("estatus").innerHTML = "";
}
</script>


<style type="text/css">
<!--
.Estilo1 {
	font-size: 18px;
	font-weight: bold;
}			 

.oculto{ display:none; }
			 .visible{ display:block; }
			 ul{background-color: white;	
			 list-style-type: none;
			 	margin-left: 0px;
				padding-top: 2px;
				padding-bottom: 5px;
				padding-left: 25px;
				margin-top: 0px;
				margin-bottom: 0px;
				}
				a { text-decoration:none; color:#006699; font-size:15px; border:0}
				a:hover { text-decoration:none; color:#778899; border:0}
				li { font-size:12px; }
-->
</style>
</head>

<body onload="xajax_procLlenaAsesores();">
	<form id="form1" name="form1" method="post" action="">
		<h2 align="center">Impresion de Credenciales de La premier de Leon </h2>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="271">
                                </td>
				<td width="194"><div align="center"><strong>Jugadores Disponibles</strong></div></td>
                                <td width="254"><div align="center"><strong>Acciones de seleccion</strong></div></td>
			  	<td width="254"><div align="center"><strong>Jugadores a Imprimir Credencial</strong></div></td>
			</tr>
			<tr>
			  <td valign="top">
                              <div><strong>Filtra por Nombre:</strong></div>
                              <br />
			  <label>
			    <input type="text" name="txt_Buscar" id="txt_Buscar"/>
			    <img src="lupa2.jpg" width="25" height="15" onclick="xajax_buscar(document.form1.txt_Buscar.value)" />
			    </label>
                          </td>
			  <td rowspan="2" valign="top"><div id="divListados"></div></td>
                          <td rowspan="2" ><div id="accionesdeseleccion"></div></td>
                          <td rowspan="2" ><div id="jugadoresseleccionados"></div></td>
		    </tr>
			<tr>
				<td valign="top">
                                    <div><strong>Filtra por equipo:</strong></div>
                                    <br />
					<?php echo equipos();?>
		        </td>
			</tr>
	<tr>
		<td colspan="4"> <div align="right">&nbsp;&nbsp; 
        <input type="button" name="btnGenerar" id="btnGenerar" value="Generar" onclick="Generar()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="button" name="btnLimpiar" id="btnLimpiar" value="Limpiar" onclick="xajax_procLimpiar()" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        </td>
	</tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
                <div id="estatus" align="center"></div>
                <div id="miVentana"><input type="hidden" id="valormiventana" value="" ></input></div>
</form>

</body>
</html>