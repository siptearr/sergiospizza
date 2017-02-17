<?php
session_start();
header("Cache-Control: no-store, no-cache, must-revalidate");
@$seccion = $_POST["seccion"];
@$nombreseccion = $_POST["nombreseccion"];
@$user = $_POST["user"];
@$pwd = $_POST["pwd"];

@$seccionauto = $_GET["seccionauto"];
@$nombreseccionauto = $_GET["nombreseccionauto"];
//Comprobacion de la ruta correcta
if(@$seccion == ""){
    $seccion = $seccionauto;
}

if(@$nombreseccion == ""){
    $nombreseccion = $nombreseccionauto;
}

mysql_connect("localhost","dags","dags123");
mysql_select_db("dags");

/*if($_SESSION['login']){
    echo "true";
}else{
    echo "false";
}*/

if(!$_SESSION['login']){

$result1 = mysql_query("select pa.estatus,pa.seccion,pa.nombreseccion,pa.tipousuario,u.nombre,u.email from permisosadminfiles pa inner join personal p on (pa.personal_idpersonal=p.idpersonal)
inner join usuario u on (p.usuario_idusuario=u.idusuario)
where u.nombre = '".$user."' and u.pwd = '".$pwd."' and pa.seccion = '".$seccion."'");
if(!$result1){
    echo "<div align=\"center\">Error de acceso a la Base de Datos<br />Favor de contactar al administrador de Sistema";
    echo "<br /><input type=\"button\" value=\"Regresar\" onclick=\"javascript:history.back(1);\"> ";
    exit;
}

while ($row1=mysql_fetch_array($result1))
{
	$estatus = $row1["estatus"];
        $seccion = $row1["seccion"];
        $nombreseccion = $row1["nombreseccion"];
        $tipousuario = $row1["tipousuario"];
        $nombreusuario = $row1["nombre"];
        $email = $row1["email"];
}

if($estatus == "activo"){
    $_SESSION['login'] = true;
    $_SESSION['tipousuario'] = $tipousuario;
    $_SESSION['bloqueoactivo'] = "false";
    $_SESSION["nombreusuario"] = $nombreusuario;
    $_SESSION["email"] = $email;
    $_SESSION["seccion"] = $seccion;
    $mensajelogin = "Inicio de sesion correcto";
}else{
    $_SESSION['login'] = false;
    if($user!="" || $pwd!=""){
        if(@$seccion == ""){
            $mensajelogin = "No haz iniciado desde la interfaz correcta";
        }else{
            $result2 = mysql_query("select nombre from usuario where nombre = '".$user."' and pwd = '".$pwd."'");
            if (mysql_num_rows($result2) == 0) {
                $mensajelogin = "Usuario y/o password incorrectos";
            }else{
                $mensajelogin = "No cuentas con los permisos necesarios para acceder a esta seccion \"".$seccion."\"";
            }
        }
    }
}
}else{
    $ultimoacceso =  $_SESSION["ultimoacceso"];
    $ahora = date("Y-n-j H:i:s");
    $tiempo_transcurrido = (strtotime($ahora)-strtotime($ultimoacceso));

    if($tiempo_transcurrido >= 28800){
        $_SESSION['login'] = false;
    }else{
        $_SESSION["ultimoacceso"] = $ahora;
    }
}

if($nombreseccion == ""){
    $result2 = mysql_query("select nombreseccion from permisosadminfiles where seccion = '".$seccion."' limit 1");
    if (!$result2){
        echo "<div align=\"center\">Error de acceso a la base de datos<br />Favor de contactar al administrador de Sistema";
        echo "<br /><input type=\"button\" value=\"Regresar\" onclick=\"javascript:history.back(1);\"> ";
        exit;
    }
    while($row2=mysql_fetch_array($result2))
    {
        $nombreseccion = $row2["nombreseccion"];
    }
}

if($_SESSION['login']){
$host  = $_SERVER['HTTP_HOST'];
$uri  = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
//$rutabase = "http://" . $host . $uri . "/";

$rutadigital='';
$rutadigital2='';
$aumento = 0;
$arreglohost = explode("/",$uri);
$longarrhost = count($arreglohost);
$longarrhost--;
for($x=0;$x<$longarrhost;$x++){
    $rutadigital .= $arreglohost[$x].'/';
    if($aumento>1){
        $rutadigital2 .= $arreglohost[$x].'/';
    }
    $aumento++;
}

$result3 = mysql_query("select rutabase from confgeneral where idconfgeneral = 1");
if(mysql_num_rows($result3)==0){
    echo "error de extraccion de rutabase, control de error: Acceso a base de datos.-contacte al administrador del sistema";
    exit;
}else{
    $row3=mysql_fetch_array($result3);
    $rutabasesist = $row3["rutabase"];
}

$rutareturn = "http://" . $host . $rutadigital;
$rutaupload = $rutadigital2;

    $_SESSION["ultimoacceso"] = date("Y-n-j H:i:s");

    header("Location: /".$rutabasesist."/apps/uploadasync/index.php?seccionauto=".$seccion."&nombreseccionauto=".$nombreseccion."&rutareturnauto=".$rutareturn."&rutauploadauto=".$rutaupload);
    exit;
}

?>
<!DOCTYPE HTML>
<html>
<head>
<title>Inicio de Sesion AdminFiles (<?php echo $nombreseccion ?>)</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="icon" type="image/gif" href="images/sp.jpg" />

<script type="text/javascript" src="js/modulo_main.js"></script>
<script type="text/javascript" src="ajax/ajax_lib.js"></script>
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- -->

</head>
<body>
<!-- contact-form -->	
<div class="message warning"><?php echo $mensajelogin; ?>
<div class="inset">
    <div class="login-head">
	<h1>Sesion en <?php echo $nombreseccion ?></h1>
        <div class="alert-close" onclick="javascript:window.open('../','_self');"> </div> 			
    </div>
    <form method="POST" action="">
        <li>
            <input type="text" class="text" name="user" value="Usuario" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Usuario';}"><a href="#" class=" icon user"></a>
        </li>
        <div class="clear"> </div>
        <li>
            <input type="password" name="pwd" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"> <a href="#" class="icon lock"></a>
        </li>
        <div class="submit">
            <input type="submit" value="Login">
            <h4><a href="#" onclick="javascript:muestra_recpwdForm();">Solicitar password.</a></h4>
            <div class="clear">  </div>	
        </div>
        <input type="hidden" name="seccion" value="<?php echo $seccion ?>"></input>
        <input type="hidden" name="nombreseccion" value="<?php echo $nombreseccion ?>"></input>
    </form>
</div>
    </div>

<!--Inicio de los forms ocultos-->
<div style="position: fixed">
    <!--Inicio de los forms ocultos-->
<form id="recpwdForm" action="javascript:pwdrecuperacion();" style="visibility:hidden">
<div><label id="mensajerecpwd"></label>
    <div class="inset">
        <div class="loginhead">
            <h2>Recuperacion de password.</h2>
            <div class="alertclose" onclick="javascript:cierrarecpwdForm();"></div>
        </div>
            <li>
                <label>usuario:</label>
                <input type="text" class="text" id="usuario" name="usuario" value=""><a href="#" class=" icon user"></a>
            </li>
            <li>
        <div class="submit">
            <input id="aceptarecpwd" type="submit" value="Restablecer">	
            <div class="clear"></div>
        </div>
            </li>
    </div>
</div>
</form>
    <!--Término de los forms ocultos-->
</div>
    <!--Término de los forms ocultos-->
    
</body>
</html>