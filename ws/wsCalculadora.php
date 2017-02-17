<?php
require_once "../lib/nusoap.php";
$serviceName = "Calculadora";
$serviceURL = "http://localhost:8585/webservices/wsPhpCalculadora/wsCalculadora.php";

$server = new nusoap_server();
$server->soap_defencoding= "UTF-8";
$server->configureWSDL($serviceName,$serviceURL);

$server->wsdl->addComplexType('resultado',"complexType","struct","all","",
        array(
            "codigo"=>array("name"=>"codigo","type"=>"xsd:int"),
            "mensaje"=>array("name"=>"mensaje","type"=>"xsd:string"),
        )
        );
		
$in = array("x"=>"xsd:decimal","y"=>"xsd:decimal");
$out = array("return"=>"tns:resultado");
$server->register("suma",$in,$out);

function suma($N1,$N2)
{
$return["codigo"] = $N1 + $N2;
$return["mensaje"] = "listo calixto";
return $return;
}

$POST_DATA = isset($HTTP_RAW_POST_DATA) ? $HTTP_RAW_POST_DATA : "";
$server->service($POST_DATA);
exit();
?>
