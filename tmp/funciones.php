<?php 
function CalculaEdad( $fecha ) {
    list($Y,$m,$d) = explode("-",$fecha);
    return( date("md") < $m.$d ? date("Y")-$Y-1 : date("Y")-$Y );
}
function RestarHoras($horaini,$horafin)
{
	$horai=substr($horaini,0,2);
	$mini=substr($horaini,3,2);
	$segi=substr($horaini,6,2);

	$horaf=substr($horafin,0,2);
	$minf=substr($horafin,3,2);
	$segf=substr($horafin,6,2);

	$ini=((($horai*60)*60)+($mini*60)+$segi);
	$fin=((($horaf*60)*60)+($minf*60)+$segf);

	$dif=$fin-$ini;

	$difh=floor($dif/3600);
	$difm=floor(($dif-($difh*3600))/60);
	$difs=$dif-($difm*60)-($difh*3600);
	return date("H:i:s",mktime($difh,$difm,$difs));
}

function UltimoDia($anho,$mes)
{ 
	/*
	Descripción:	calcula el ultimo día del mes
	Recibe:			año y mes como enteros
	Devuelve:		un entero
	*/
   if (((fmod($anho,4)==0) and (fmod($anho,100)!=0)) or (fmod($anho,400)==0)) { 
       $dias_febrero = 29; 
   } else { 
       $dias_febrero = 28; 
   } 
   switch($mes) { 
       case 1: return 31; break; 
       case 2: return $dias_febrero; break; 
       case 3: return 31; break; 
       case 4: return 30; break; 
       case 5: return 31; break; 
       case 6: return 30; break; 
       case 7: return 31; break; 
       case 8: return 31; break; 
       case 9: return 30; break; 
       case 10: return 31; break; 
       case 11: return 30; break; 
       case 12: return 31; break; 
   } 
}

function DiaInicioMes($mes, $año)
{
	/*
	Descripión:	Función que dice que dia de la semana es de acuerdo a la fecha dada
	Recibe:		mes y año como entero
	Devuelve:	un entero
	*/
	$inicio_mes = date("l", mktime(0, 0, 0, $mes, 1, $año));
	
	switch($inicio_mes) 
	{
		case 'Sunday'	: return 0; break;
		case 'Monday'	: return 1; break;
		case 'Tuesday'	: return 2; break;
		case 'Wednesday': return 3; break;
		case 'Thursday'	: return 4; break;
		case 'Friday'	: return 5; break;
		case 'Saturday'	: return 6; break;
	}
	
}


function fnc_ClaveED($txt,$encrypt_key) { 
     $ctr=0; 
     $tmp = ""; 
     for ($i=0;$i<strlen($txt);$i++) { 
          if ($ctr==strlen($encrypt_key)) $ctr=0; 
          $tmp.= substr($txt,$i,1) ^ substr($encrypt_key,$ctr,1); 
          $ctr++; 
     } 
     return $tmp; 
} 

function fnc_encriptar($txt,$key) { 
     srand((double)microtime()*1000000); 
     $encrypt_key = md5(rand(0,32000)); 
     $ctr=0; 
     $tmp = ""; 
     for ($i=0;$i<strlen($txt);$i++) { 
          if ($ctr==strlen($encrypt_key)) $ctr=0; 
          $tmp.= substr($encrypt_key,$ctr,1) . 
(substr($txt,$i,1) ^ substr($encrypt_key,$ctr,1)); 
          $ctr++; 
     } 
     return fnc_ClaveED($tmp,$key); 
} 

function fnc_desencriptar($txt,$key) { 
     $txt = fnc_ClaveED($txt,$key); 
     $tmp = ""; 
     for ($i=0;$i<strlen($txt);$i++) { 
          $md5 = substr($txt,$i,1); 
          $i++; 
          $tmp.= (substr($txt,$i,1) ^ $md5); 
     } 
     return $tmp; 
} 

function fnc_encript($text_plain,$key1,$key2,$key3) {
     return base64_encode(fnc_ClaveED(fnc_encriptar(fnc_ClaveED($text_plain,$key1),$key2),$key3)); 
}

function fnc_decript($text_encrypted, $key1, $key2, $key3) {
     return fnc_ClaveED(fnc_desencriptar(fnc_ClaveED(base64_decode($text_encrypted),$key3),$key2),$key1);
}
//---------------------------- FUNCIONES DE FORMATO DEL TEXTO----------------------
//Formatea una fecha para la salida
function fsalida($cad2){
if($cad2 != '0000-00-00' or $cad != ''){
	$year = substr($cad2, 0, 4);
	$month = substr($cad2, 5, 2);
	$day = substr($cad2, 8, 2);
	$hr = substr($cad2, 11, 8);
	$cad = ($day."/".$month."/".$year." ".$hr);
	return $cad;}
else {
	return $cad;
	}
						}

//fomatea una fecha para la entrada
function fentrada($FESER){
   $dia =substr($FESER,0,2);
   $mes =substr($FESER,3,2);
   $ano =substr($FESER,6,4);
   
   return "$ano-$mes-$dia";
   }
?>