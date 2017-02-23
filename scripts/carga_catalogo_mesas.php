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

@$sucursal = $_POST["sucursal"];
//echo $sucursal;
$conn = mysqli_connect($localhost, $userdb, $pwddb);
mysqli_select_db($conn,$namedb);
date_default_timezone_set('America/Mexico_City');
// activar el id del formulario multiple
$ssql = "select m.idmesa,m.numero,m.ubicacion,m.estatus from mesa m inner join sucursal s on(m.sucursal_idsucursal=s.idsucursal) where s.nombre = '".$sucursal."'";
$rs1 = mysqli_query($conn, $ssql);

if(mysqli_num_rows($rs1)==0){
    echo '<li><a href="#" class="close-overlay">Sin mesas registradas</a></li>';
    echo '<li><a href="#" class="close-overlay">O error de acceso a la BD</a></li>';
    
    mysqli_free_result($rs1);
    mysqli_close($conn);
    exit;
}
$ubicacion_ant = "";
while($row1=mysqli_fetch_array($rs1)){
    $ubicacion = $row1["ubicacion"];
    if($ubicacion_ant != $ubicacion){
        echo '<hr><span>'.$ubicacion.'</span><br />';
        $ubicacion_ant = $row1["ubicacion"];
    }

    if($row1["estatus"] == "ocupada"){
        echo '<a href="javascript:alert(\'Mesa ocupada\')" ><img src="imagenes/mesas/'.$row1["estatus"].$row1["numero"].'.png" height="100"></a>&nbsp;&nbsp;';
    }else{
        echo '<a href="javascript:asignamesa('.$row1["idmesa"].');"><img src="imagenes/mesas/'.$row1["estatus"].$row1["numero"].'.png" height="75"></a>&nbsp;&nbsp;';
    }
}
mysqli_free_result($rs1);
mysqli_close($conn);
?>
