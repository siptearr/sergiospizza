<?php
if(!@session_start()){
    session_start();
}
include("scripts/data.php");
include("conf/dataconf.php");

header("Cache-Control: no-store, no-cache, must-revalidate");
date_default_timezone_set("America/Mexico_City");

@$accion = $_POST["accion"];
//echo "accion: ".$accion;
/*********************************
//********************************/

$ultimoacceso =  @$_SESSION["ultimoacceso"];
$ahora = date("Y-n-j H:i:s");
$tiempo_transcurrido = (strtotime($ahora)-strtotime($ultimoacceso));

if($tiempo_transcurrido >= 10000){
    $_SESSION['login'] = false;
}else{
    $_SESSION["ultimoacceso"] = $ahora;
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
}else{
    $bloqueoactivo = "";
    $nombreusuario = "Invitado";
    $email = "contacto@segiospizza.com";
    $privilegios = "invitado";
    $fotoavatar = "avatar.png";
    $sede = "Local";
    $_SESSION["ultimoacceso"] = date("Y-n-j H:i:s");
}

if($accion != ""){
    $rutatemplate = "template/".$accion."/";
    include($rutatemplate."index.php");
}else{
    $fechaactual = date("Y")."-".date("m")."-".date("d");
    $con1 = mysqli_connect($localhost,$userdb,$pwddb,$namedb);
    
    // Check connection
    if (mysqli_connect_errno()){
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
  
    $result1 = mysqli_query($con1,"select fecha,template from configuracion order by fecha desc limit 2");
    if($row=mysqli_fetch_array($result1)){
        $fecha = $row["fecha"];
        if($fecha > $fechaactual){
            $row=mysqli_fetch_array($result1);
            $template = $row["template"];
        }else{
            $template = $row["template"];
        }
        $rutatemplate = "template/".$template."/";
        include($rutatemplate."index.php");
    }else{
        echo "error de conexion a la BD by default:";
        exit;
    }
}
?>