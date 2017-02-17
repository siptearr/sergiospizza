<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
require_once "../lib/nusoap.php";
$serviceName = "Calculadora";
$serviceURL = "http://localhost:8585/webservices/wsPhpCalculadora/wsCalculadora.php";

$server = new nusoap_server();
$server->soap_defencoding= "UTF-8";
$server->configureWSDL($serviceName,$serviceURL);
		
$in = array("x"=>"xsd:decimal","y"=>"xsd:decimal");
$out = array("return"=>"xsd:decimal");
$server->register("suma",$in,$out);

function suma($N1,$N2)
{
	return $N1 + $N2;
}

$POST_DATA = isset($HTTP_RAW_POST_DATA) ? $HTTP_RAW_POST_DATA : "";
$server->service($POST_DATA);
exit();
?>
