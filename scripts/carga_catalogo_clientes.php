<?php
if(!@session_start()){
    session_start();
}
$sesionlogin = $_SESSION['login'];

if($sesionlogin){
    $bloqueoactivo = $_SESSION['bloqueoactivo'];
    $nombreusuario = $_SESSION["nombreusuario"];
    $email = $_SESSION["email"];
    $privilegios = $_SESSION["privilegios"];
    $fotoavatar = $_SESSION["fotoavatar"];
    $sede = $_SESSION["sede"];
    $_SESSION["ultimoacceso"] = date("Y-n-j H:i:s");
    
    $localhost = $_SESSION["localhost"];
    $userdb = $_SESSION["userdb"];
    $pwddb = $_SESSION["pwddb"];
    $namedb = $_SESSION["namedb"];
}else{
    $bloqueoactivo = "";
    $nombreusuario = "Invitado";
    $email = "contacto@segiospizza.com";
    $privilegios = "invitado";
    $fotoavatar = "avatar.png";
    $sede = "Local";
    $_SESSION["ultimoacceso"] = date("Y-n-j H:i:s");
    
    $localhost = "";
    $userdb = "";
    $pwddb = "";
    $namedb = "";
}

//echo "localhost:-".$localhost."-";
if($localhost == ""){
    echo '<li><a href="javascript:cierramenu_overlay();" class="close-overlay">Sin acceso a Base de datos</a></li>';
    echo '<li><a href="javascript:cierramenu_overlay();" class="close-overlay">Inicie Sesion Por favor</a></li>';
    exit;
}

@$sucursal = $_POST["sucursal"];
//echo $sucursal;
$conn = mysqli_connect($localhost, $userdb, $pwddb, $namedb);
date_default_timezone_set('America/Mexico_City');
// activar el id del formulario multiple
$ssql = "select * from cliente where estatus = 'activo'";
$rs1 = mysqli_query($conn, $ssql);

if(@mysqli_num_rows($rs1)==0){
    echo '<li><a href="javascript:cierramenu_overlay();" class="close-overlay">Sin clientes registrados</a></li>';
    echo '<li><a href="javascript:cierramenu_overlay();" class="close-overlay">Favor de registrar un cliente</a></li>';
    
    @mysqli_free_result($rs1);
    mysqli_close($conn);
    exit;
}


$contenidoinserta = '<?php
    $inicio_array = 0;
    $aUsers = array(';
$elementoant_array = "";
while($row1=mysqli_fetch_array($rs1)){
    if($elementoant_array != ""){
        $contenidoinserta .= '"'.$elementoant_array.'",';
        array_push($elementoinfo,$row1["rfc"]);
    }else{
        $elementoinfo[] = $row1["rfc"];
    }
    $elementoant_array = $row1["nombre"];
}
$contenidoinserta .= '"'.$elementoant_array.'"
	);
        $aInfo = array(';
$x = count($elementoinfo)-1;
for($i=0;$i<$x;$i++){
    $contenidoinserta .= '"'.$elementoinfo[$i].'",';
}
$contenidoinserta .= '"'.$elementoinfo[$i].'"
        );';


	
$contenidoinserta .= '	
        $input = strtolower( $_GET[\'input\'] );
	$len = strlen($input);
	$limit = isset($_GET[\'limit\']) ? (int) $_GET[\'limit\'] : 0;
	
	
	$aResults = array();
	$count = 0;
	$j = 0;
        
	if ($len)
	{
		for ($i=0;$i<count($aUsers);$i++)
		{
			// had to use utf_decode, here
			// not necessary if the results are coming from mysql
			//
                    for($j=0;$j<=(strlen($aUsers[$i]));$j++){
			if (strtolower(substr(utf8_decode($aUsers[$i]),$j,$len)) == $input)
			{
				$count++;
				$aResults[] = array( "id"=>($i+1) ,"value"=>htmlspecialchars($aUsers[$i]), "info"=>htmlspecialchars($aInfo[$i]) );
                                break;
			}
                    }
                        if ($limit && $count==$limit)
				break;
		}
	}
	

	header ("Expires: Mon, 26 Jul 1997 05:00:00 GMT"); // Date in the past
	header ("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // always modified
	header ("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
	header ("Pragma: no-cache"); // HTTP/1.0
	
	
	
	if (isset($_REQUEST[\'json\']))
	{
		header("Content-Type: application/json");
	
		echo "{\"results\": [";
		$arr = array();
		for ($i=0;$i<count($aResults);$i++)
		{
			$arr[] = "{\"id\": \"".$aResults[$i][\'id\']."\", \"value\": \"".$aResults[$i][\'value\']."\", \"info\": \"\"}";
		}
		echo implode(", ", $arr);
		echo "]}";
	}
	else
	{
		header("Content-Type: text/xml");

		echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?><results>";
		for ($i=0;$i<count($aResults);$i++)
		{
			echo "<rs id=\"".$aResults[$i][\'id\']."\" info=\"".$aResults[$i][\'info\']."\">".$aResults[$i][\'value\']."</rs>";
		}
		echo "</results>";
	}
?>';

mysqli_free_result($rs1);
mysqli_close($conn);

if($idarchivo=@fopen("obten_clientes.php","w")){
            @fwrite($idarchivo, $contenidoinserta);
            @fclose($idarchivo);
}
echo 'Venta de Mostrador';
?>
