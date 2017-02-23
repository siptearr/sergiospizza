<?php
header("Cache-Control: no-store, no-cache, must-revalidate");
$idregistro = $_GET["idregistro"];

require('mysql_formato.php');
//Obtener el departamento y el area de la base de datos y guardarlas en variables de sesion
if(!@session_start()){
    session_start();
}

$localhost = $_SESSION["localhost"];
$userdb = $_SESSION["userdb"];
$pwddb = $_SESSION["pwddb"];
$namedb = $_SESSION["namedb"];

$conn = mysql_connect($localhost, $userdb, $pwddb);
mysql_select_db($namedb, $conn);
date_default_timezone_set('America/Mexico_City');

$result1=mysql_query("select a.idafiliado,a.numafiliacion,a.nombres,a.appat,a.apmat,a.fecnac,a.numexp,a.estatus,b.descripcion as genero,
                        c.nombre as estado,d.nombre as municipio,e.nombre as localidad
             from afiliado a inner join genero b on(a.genero_idgenero=b.idgenero)
             inner join estado c on(a.estado_idestado=c.idestado)
             inner join municipio d on(a.municipio_idmunicipio=d.idmunicipio)
             inner join localidad e on(a.localidad_idlocalidad=e.idlocalidad)
where a.idafiliado = ".$idregistro);

if(@!mysql_num_rows($result1))
{
echo "No se han encontrado filas, nada a imprimir ";
exit;
}

while($row1=mysql_fetch_array($result1))
{
	$_SESSION["idafiliado"] = $row1["idafiliado"];
	$_SESSION["numafiliacion"] = $row1["numafiliacion"];
        $_SESSION["nombres"] = $row1["nombres"];
        $_SESSION["appat"] = $row1["appat"];
        $_SESSION["apmat"] = $row1["apmat"];
        $_SESSION["fecnac"] = $row1["fecnac"];
        $_SESSION["numexp"] = $row1["numexp"];
        $_SESSION["estatus"] = $row1["estatus"];
        $_SESSION["genero"] = $row1["genero"];
        $_SESSION["estado"] = $row1["estado"];
        $_SESSION["municipio"] = $row1["municipio"];
        $_SESSION["localidad"] = $row1["localidad"];
}
mysql_free_result($result1);

// ***********************************************************************************************
// ***********************************************************************************************
// ************************** Configuraciones de la clase PDF ************************************
// ***********************************************************************************************
// ***********************************************************************************************

class PDF extends PDF_MySQL_Table
{
function Header()
{

//obtener de las variables de session
        $idafiliado = $_SESSION["idafiliado"];
	$numafiliacion = $_SESSION["numafiliacion"];
        $nombres = $_SESSION["nombres"];
        $appat = $_SESSION["appat"];
        $apmat = $_SESSION["apmat"];
        $fecnac = $_SESSION["fecnac"];
        $numexp = $_SESSION["numexp"];
        $estatus = $_SESSION["estatus"];
        $genero = $_SESSION["genero"];
        $estado = $_SESSION["estado"];
        $municipio = $_SESSION["municipio"];
        $localidad = $_SESSION["localidad"];

//Definir la ubicacion del encabezado segun la orientacion
		$x1 = 132;
		$x2 = 175;
		$y1 = 10;
                $y2 = 145;
                $y1tabla = $y1;
                $_SESSION["y2tabla"] = $y2;
    //Titulo
	$this->Image('imagenes/logoafiliado.jpg',$x2,$y1,35,25,'jpg');
        $this->Image('imagenes/logoafiliado.jpg',$x2,$y2,35,25,'jpg');
	//$this->Image('imagenes/segpop.jpg',$x2,10,45,20,'jpg');
        $this->SetFont('Arial','B',14);
        $y1 = $y1+2;
	$this->SetXY(0,$y1);
	$this->Cell(0,6,'SERVICIOS ESENCIALES, GESTION DE SERVICIOS EN SALUD',0,1,'C');
        $y2 = $y2+2;
        $this->SetXY(0,$y2);
	$this->Cell(0,6,'SERVICIOS ESENCIALES, GESTION DE SERVICIOS EN SALUD',0,1,'C');
	
        $y1=$y1+5;
	$this->SetFont('Arial','',8);
	$this->SetXY(10,$y1);
	$this->Cell(0,6,  utf8_decode('Camino antiguo #12 Col. Marfil, Guanajuato Gto. Tel: 473 733 30 34 y 473 733 29 59 
- http://seguropopular.guanajauto.gob.mx'),0,1,'L');
        
        $y2=$y2+5;
	$this->SetXY(10,$y2);
	$this->Cell(0,6,  utf8_decode('Camino antiguo #12 Col. Marfil, Guanajuato Gto. Tel: 473 733 30 34 y 473 733 29 59 
- http://seguropopular.guanajauto.gob.mx'),0,1,'L');
        
        $this->SetFont('Arial','',10);
        $y1=$y1+18;
	$this->SetXY($x1,$y1);
        $this->SetFillColor(218,218,218);
	$this->Cell(75,8,$grupo,1,1,'R',TRUE);
        
        $y2=$y2+18;
	$this->SetXY($x1,$y2);
	$this->Cell(75,8,$grupo,1,1,'R',TRUE);
        
        $this->SetFont('Arial','I',12);
        $y1=$y1+6;
	$this->SetXY($x1,$y1);
	$this->Cell(75,8,'Numero Afiliado: '.$numafiliacion,1,1,'L',TRUE);
        
        $y2=$y2+6;
	$this->SetXY($x1,$y2);
	$this->Cell(75,8,'Nombre: '.$nombres." ".$appat." ".$apmat,1,1,'L',TRUE);
        
        $y1=$y1+6;
	$this->SetXY($x1,$y1);
	$this->Cell(75,8,'Fecha Nac.: '.$fecnac,1,1,'L',TRUE);
        
        $y2=$y2+6;
	$this->SetXY($x1,$y2);
	$this->Cell(75,8,'Expediente: '.$numexp,1,1,'L',TRUE);
        
        $y1=$y1+6;
	$this->SetXY($x1,$y1);
	$this->Cell(75,8,'Genero: '.$genero.'      Estado: '.$estado,1,1,'L',TRUE);
        
        $y2=$y2+6;
	$this->SetXY($x1,$y2);
	$this->Cell(75,8,'Municipio: '.$municipio.'      Localidad: '.$localidad,1,1,'L',TRUE);
        
        $y1=$y1+6;
	$this->SetXY($x1,$y1);
	$this->Cell(75,8,'Nombre del Manager: _____________',1,1,'L',TRUE);
        
        $y2=$y2+6;
	$this->SetXY($x1,$y2);
	$this->Cell(75,8,'Nombre del Manager: _____________',1,1,'L',TRUE);
        
        $y1=$y1+53;
	$this->SetXY($x1,$y1);
	$this->Cell(75,8,'Pitcher ganador: _________________',0,1,'L',TRUE);
        
        $y2=$y2+53;
	$this->SetXY($x1,$y2);
	$this->Cell(75,8,'Pitcher ganador: _________________',0,1,'L',TRUE);
        
        $y1=$y1+6;
	$this->SetXY($x1,$y1);
	$this->Cell(75,8,'_________________________',0,1,'C',TRUE);
        
        $y2=$y2+6;
	$this->SetXY($x1,$y2);
	$this->Cell(75,8,'_________________________',0,1,'C',TRUE);
        
        $y1=$y1+6;
	$this->SetXY($x1,$y1);
	$this->Cell(75,4,'Nombre y firma del Umpire',0,1,'C',TRUE);
        
        $y2=$y2+6;
	$this->SetXY($x1,$y2);
	$this->Cell(75,4,'Nombre y firma del Umpire',0,1,'C',TRUE);
        
        $this->SetFont('Arial','I',16);
        $y1tabla = $y1tabla + 13;
        $this->SetXY(0,$y1tabla);
        $_SESSION["y1tabla"] = $y1tabla;
    //heredar el encabezado
    parent::Header();
}
/*function Footer()
{
    //Posiciona Y a 1.5 cm del fondo
    $this->SetY(-10);
    //Configurar para poner fuente Arial italic 8
    $this->SetFont('Arial','I',8);
    //Imprimir numero de pagina centrado
    $this->Cell(0,5,'Pagina '.$this->PageNo(),0,0,'C');
}*/
}

// ***********************************************************************************************
// ***********************************************************************************************
// ********************** Termino de configuraciones de la clase PDF *****************************
// ***********************************************************************************************
// ***********************************************************************************************

// Definicion del tamaño de las columnas y alineaciones
		$colidjugador = 9;
		$colnombrejugador = 67;
                $colnumero = 8;
		$colalineacion = 19;
		$colposicion = 16;

//Definicion y extraccion de los jugadores de la base de datos.
$query1 = "select numero,nombre from (select nombre,numero from jugador j inner join equipo_has_jugador ehj on(j.idjugador=ehj.jugador_idjugador)
where ehj.equipo_idequipo=(select equipo_idequipo1 from ronda where idronda = ".$idregistro.")) as jugadores";
$query2 = "select numero,nombre from (select nombre,numero from jugador j inner join equipo_has_jugador ehj on(j.idjugador=ehj.jugador_idjugador)
where ehj.equipo_idequipo=(select equipo_idequipo2 from ronda where idronda = ".$idregistro.")) as jugadores";
$query3 = "select @rownum := @rownum + 1 as numeroconsec,' ' as alineacion,' ' as posicion from jugador, (select @rownum := 0) r limit 10";
$query4 = "select @rownum := @rownum + 1 as numeroconsec,' ' as alineacion,' ' as posicion from jugador, (select @rownum := 0) r limit 10";
$pdf=new PDF();
$pdf->AddPage('P','Letter');
//Definimos los margenes del PDF a imprimir
//Definimos los margenes izquierdo, superior, derecho, respectivamente
$pdf->SetMargins(10, 25 , 20); 
//Establecemos el margen inferior: 
$pdf->SetAutoPageBreak(true,5);

//Definir el titulo del documento
$pdf->SetSubject('Line Up');
//Establecer el encabezado
$pdf->AddCol('numero',$colidjugador,'Num.','C');
$pdf->AddCol('nombre',$colnombrejugador,'Nombre del jugador','L');

//Definir el color del encabezado y de las tuplas
$prop=array('HeaderColor'=>array(232,232,232),
            'color1'=>array(255,255,255),
            'color2'=>array(255,255,255),
            'padding'=>2,
            'align'=>"L");
//Mostrar la tabla de acuerdo al query
$pdf->Table($query1,$prop);
//Parametros para el agregado de la primera tabla
$prop=array('HeaderColor'=>array(232,232,232),
            'color1'=>array(255,255,255),
            'color2'=>array(255,255,255),
            'padding'=>2);

$y1 = $_SESSION["y1tabla"];
$pdf->SetY($y1);
$pdf->AddCol('numeroconsec',$colnumero,'#','C');
$pdf->AddCol('alineacion',$colalineacion,'Alineacion','C');
$pdf->AddCol('posicion',$colposicion,'Posicion','L');
$pdf->Table($query3,$prop);

//Parametros para la segunda Tabla
$prop=array('HeaderColor'=>array(232,232,232),
            'color1'=>array(255,255,255),
            'color2'=>array(255,255,255),
            'padding'=>2,
            'align'=>"L");

$pdf->AddCol('numero',$colidjugador,'Num.','C');
$pdf->AddCol('nombre',$colnombrejugador,'Nombre del jugador','L');

//$pdf->Ln(35);
$y2 = $_SESSION["y2tabla"]+13;
//$y2 = 153;
$pdf->SetXY(0,$y2);
$pdf->Table($query2,$prop);

//Parametros para el agregado de la segunda tabla
$prop=array('HeaderColor'=>array(232,232,232),
            'color1'=>array(255,255,255),
            'color2'=>array(255,255,255),
            'padding'=>2);

$pdf->SetY($y2);
$pdf->AddCol('numeroconsec',$colnumero,'#','C');
$pdf->AddCol('alineacion',$colalineacion,'Alineacion','C');
$pdf->AddCol('posicion',$colposicion,'Posicion','L');
$pdf->Table($query4,$prop);

//Salida del pdf en formato incrustado en pagina.
$pdf->Output();

//Limpia variables de session
$_SESSION["numero"] = "";
$_SESSION["fecha"] = "";
$_SESSION["horario"] = "";
$_SESSION["campo"] = "";
$_SESSION["grupo"] = "";
$_SESSION["equipo1"] = "";
$_SESSION["equipo2"] = "";
$_SESSION["umpire"] = "";
$_SESSION["y1tabla"] = "";
$_SESSION["y2tabla"] = "";
?>