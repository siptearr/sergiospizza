<?php
set_time_limit ( 2000 );//300
ini_set ( "memory_limit", "256M" );

//error_reporting ( E_ALL ^ E_NOTICE ^ E_WARNING );
error_reporting();
ini_set ( "display_errors", 0 );
require_once "conectar/conecta.php";
$enResto = 0;
$varasignabd = new conectabd ();
$varasignabd->asignabd ();


$db_conexion = mysql_connect ( $varasignabd->db_host, $varasignabd->db_user, $varasignabd->db_pass ) 
								or die ( "No se pudo conectar a la Base de datos" . mysql_error () );
mysql_select_db ( $varasignabd->db_name ) or die ( mysql_error () );

include ('PDF/class.ezpdf.php');
include ('PDF/class.backgroundpdf.php');

$arr = $_GET ['ID'];
$j = 0;
$Registros = count($arr);
$divisor = 6;

$Paginas = floor ( $Registros / $divisor );
$resto = $Registros % $divisor;

//echo ("$Registros / $divisor----paginas:$Paginas-Resto:$resto---- ");die;

if(($Paginas == 0) && ($resto == 1))
{
	 $fondo = '1_6_CREDENCIAL.jpg';
}elseif(($Paginas == 0) && ($resto == 2)) 
{
	 $fondo = '2_6_CREDENCIAL.jpg';
}elseif(($Paginas == 0) && ($resto == 3)) 
{
	 $fondo = '3_6_CREDENCIAL.jpg';
}elseif(($Paginas == 0) && ($resto == 4)) 
{
	 $fondo = '4_6_CREDENCIAL.jpg';
}elseif(($Paginas == 0) && ($resto == 5)) 
{
	 $fondo = '5_6_CREDENCIAL.jpg';
}else 
{
	 $fondo = '6_6_CREDENCIAL.jpg';
}

$pdf = & new Cezpdf ( 'L' ); // landscape, portrait -> normal
$pdf = new backgroundPDF ( 'L', 'portrait', 'image', array ('img' => $fondo ) );
$pdf->selectFont ( 'PDF/fonts/Helvetica.afm' );
$conteo = 0; 
$nPaginas = 0;

for($p=0; $p<$Paginas; $p++) {
	$nPaginas++;
	
	for($i = 0; $i < 6; $i ++) {
		$IDEmp = $arr[$conteo];
		$j = $i;

			$SQLEmp = "select e.nombre as equipo,j.nombre as jugador
from equipo e inner join equipo_has_jugador ehj on(e.idequipo=ehj.equipo_idequipo)
              inner join jugador j on (j.idjugador=ehj.jugador_idjugador)
where j.estatus = 'Activo' and ehj.jugador_idjugador = '$IDEmp'";
					
		$resultado = mysql_query ( $SQLEmp ) or die ( "Fallo la Consulta " . mysql_error () );
		while ( $rowCount = mysql_fetch_array ( $resultado ) ) {
			$jugador=		$rowCount['jugador'];
			$equipo = 		$rowCount ["equipo"];	
		}
		
		
		if ($j == 0) {
			$pdf->addText ( 156, 580, 9, $equipo );
			$pdf->addText ( 156, 545, 9, $jugador ); 
		}

		if ($j == 1) {
			$pdf->addText ( 397, 580, 9, $equipo );
			$pdf->addText ( 397, 545, 9, $jugador ); 
 		}
		if ($j == 2) {
			$pdf->addText ( 156, 397, 9, $equipo );
			$pdf->addText ( 156, 362, 9, $jugador ); 
 		}
		if ($j == 3) {
			$pdf->addText ( 397, 397, 9, $equipo );
			$pdf->addText ( 397, 362, 9, $jugador ); 
 		}
		if ($j == 4) {
			$pdf->addText ( 156, 212, 9, $equipo );
			$pdf->addText ( 156, 177, 9, $jugador ); 
 		}
		if ($j == 5) {
			$pdf->addText ( 397, 212, 9, $equipo );
			$pdf->addText ( 397, 177, 9, $jugador ); 
 		}
		
		$conteo ++;
	}
	if ($nPaginas < $Paginas)
		$pdf->ezNewPage ();
	
} 

// Paginas Completas

if (($resto > 0) && ($Paginas > 0))
	$pdf->ezNewPage ();
	//------------------------------- PROCESAR EL RESTO --------------------------
for($i = 0; $i < $resto; $i ++) {
	$IDEmp = $arr[$conteo];
	$j = $i;
	
				$SQLEmp = "select e.nombre as equipo,j.nombre as jugador
from equipo e inner join equipo_has_jugador ehj on(e.idequipo=ehj.equipo_idequipo)
              inner join jugador j on (j.idjugador=ehj.jugador_idjugador)
where j.estatus = 'Activo' and ehj.jugador_idjugador = '$IDEmp'";
					#  echo '||'.$SQLEmp;die;
		$resultado = mysql_query ( $SQLEmp ) or die ( "Fallo la Consulta " . mysql_error () );
		while ( $rowCount = mysql_fetch_array ( $resultado ) ) {
			$jugador=		$rowCount["jugador"];
			$equipo = 		$rowCount["equipo"];
		}
		
	if ($j == 0) {
			$pdf->addText ( 156, 580, 9, $equipo );
			$pdf->addText ( 156, 545, 9, $jugador ); 
		}

		if ($j == 1) {
			$pdf->addText ( 397, 580, 9, $equipo );
			$pdf->addText ( 397, 545, 9, $jugador ); 
 		}
		if ($j == 2) {
			$pdf->addText ( 156, 397, 9, $equipo );
			$pdf->addText ( 156, 362, 9, $jugador ); 
 		}
		if ($j == 3) {
			$pdf->addText ( 397, 397, 9, $equipo );
			$pdf->addText ( 397, 362, 9, $jugador ); 
 		}
		if ($j == 4) {
			$pdf->addText ( 156, 212, 9, $equipo );
			$pdf->addText ( 156, 177, 9, $jugador ); 
 		}
		if ($j == 5) {
			$pdf->addText ( 397, 212, 9, $equipo );
			$pdf->addText ( 397, 177, 9, $jugador ); 
 		}	

	
	$conteo++;
}
#ob_end_clean();
$pdf->ezStream ();
?>