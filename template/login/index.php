<?php
if(!@session_start()){
    session_start();
}
header("Cache-Control: no-store, no-cache, must-revalidate");

@$user = $_POST["user"];
@$pwd = $_POST["pwd"];
@$accion = $_POST["accion"];

if($accion != "login"){
    header("Location: ../../");
    exit;
}
mysql_connect($localhost,$userdb,$pwddb);
mysql_select_db($namedb);

$ultimoacceso =  @$_SESSION["ultimoacceso"];
$ahora = date("Y-n-j H:i:s");
$tiempo_transcurrido = (strtotime($ahora)-strtotime($ultimoacceso));

if($tiempo_transcurrido >= 10){
    $_SESSION['login'] = false;
}else{
    $_SESSION["ultimoacceso"] = $ahora;
}

/*if($_SESSION['login']){
    echo "true";
}else{
    echo "false";
}*/

if(!$_SESSION['login']){
    $longusuario = count($user);
    $longpwd = count($pwd);
    if($longusuario>0 && $longpwd>0){
        $result1 = mysql_query("select u.estatus,u.idusuario,u.nombre,u.email,p.descripcion,u.fotoavatar,suc.nombre as 'sede' 
                                from usuario u inner join privilegios p on (u.privilegios_idprivilegios=p.idprivilegios) 
                                inner join sucursal suc on(u.sucursal_idsucursal=suc.idsucursal) where u.usr = '".$user."' and u.pwd = '".$pwd."'");
        if(!$result1){
            echo "<div align=\"center\">Error de acceso a la Base de Datos<br />Favor de contactar al administrador de Sistema";
            //echo "<br />select u.estatus,u.nombre,u.email,p.descripcion,u.fotoavatar from usuario u inner join privilegios p on (u.privilegios_idprivilegios=p.idprivilegios) where u.usr = '".$user."' and u.pwd = '".$pwd;
            echo "<br /><input type=\"button\" value=\"Regresar\" onclick=\"javascript:history.back(1);\"></div>";
            exit;
        }

        $row1=mysql_fetch_array($result1);
        $estatus = $row1["estatus"];
        $nombreusuario = $row1["nombre"];
        $idusr = $row1["idusuario"];
        $email = $row1["email"];
        $privilegios = $row1["descripcion"];
        $fotoavatar = $row1["fotoavatar"];
        $sede = $row1["sede"];
    }else{
        $mensajelogin = "";
        $estatus = "";
    }

if($estatus == "activo"){
    $_SESSION['login'] = true;
    $_SESSION['bloqueoactivo'] = "false";
    $_SESSION["nombreusuario"] = $nombreusuario;
    $_SESSION["idusr"] = $idusr;
    $_SESSION["email"] = $email;
    $_SESSION["privilegios"] = $privilegios;
    $_SESSION["fotoavatar"] = $fotoavatar;
    $_SESSION["sede"] = $sede;
    
    $_SESSION["localhost"] = $localhost;
    $_SESSION["userdb"] = $userdb;
    $_SESSION["pwddb"] = $pwddb;
    $_SESSION["namedb"] = $namedb;
    
    
    $mensajelogin = "Inicio de sesion correcto";
    $ahora = date("Y-n-j H:i:s");
    $_SESSION["ultimoacceso"] = $ahora;
}else{
    $_SESSION['login'] = false;
    if($user!="" || $pwd!=""){
        $result2 = mysql_query("select nombre from usuario where nombre = '".$user."' and pwd = '".$pwd."'");
        if (mysql_num_rows($result2) == 0) {
            $mensajelogin = "Usuario y/o password incorrectos";
        }else{
            $mensajelogin = "Usuario Desactivado";
        }
    }
}
}
$_SESSION["mensajelogin"] = @$mensajelogin;

/*if($_SESSION['login']){
    echo "true";
}else{
    echo "false";
}
echo "select u.estatus,u.nombre,u.email,p.descripcion,u.fotoavatar from usuario u inner join privilegios p on (u.privilegios_idprivilegios=p.idprivilegios) where u.usr = '".$user."' and u.pwd = '".$pwd."'";
exit;*/

if($_SESSION['login']){
    $_SESSION["ultimoacceso"] = date("Y-n-j H:i:s");
}else{
    $_SESSION["mensajelogin"] = @$mensajelogin;
}
    $template = "main";
    $rutatemplate = "template/".$template."/";
    include($rutatemplate."index.php");
    exit;
?>
<!DOCTYPE html>
<html>
<head>
<title>Login Sergio's Pizza</title>
<!--Custom Theme files-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link rel="icon" type="image/gif" href="<?php echo $rutatemplate ?>images/iconsp.jpg?<?php echo time(); ?>" >

<link href="<?php echo $rutatemplate ?>css/style.css?<?php echo time(); ?>" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo $rutatemplate ?>css/style2.css?<?php echo time(); ?>" rel="stylesheet" type="text/css" media="all" />
<!--web-fonts-->
<link href='//fonts.googleapis.com/css?family=Signika:400,300,600,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
<!--//web-fonts-->
<!--js-->
<script src="<?php echo $rutatemplate ?>js/jquery.min.js?<?php echo time(); ?>"></script>

<script type="text/javascript" src="<?php echo $rutatemplate ?>js/modulo_main.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="<?php echo $rutatemplate ?>ajax/ajax_lib.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="<?php echo $rutatemplate ?>js/jquery-1.9.0.min.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="<?php echo $rutatemplate ?>js/jquery-ui.min.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="<?php echo $rutatemplate ?>js/jquery.blockUI.js?<?php echo time(); ?>"></script>

<script src="<?php echo $rutatemplate ?>js/easyResponsiveTabs.js?<?php echo time(); ?>" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
				type: 'default', //Types: default, vertical, accordion           
				width: 'auto', //auto or any width like 600px
				fit: true   // 100% fit in a container
			});
		});
                
        function cancel(){
            document.forms["cancel_form"].submit();
        }
	</script>
<!--//js-->
</head>
<body>
	<!-- main -->
	<div class="main">
		<h1>Inicio de Sesion - Sergio's pizza</h1>
		<div class="login-form">
			<div class="login-left">
				<div class="logo">
                                    <img src="<?php echo $rutatemplate ?>images/loginusr.jpg?<?php echo time(); ?>" alt="" height="50"/>
					<h2>Bienvenido</h2>
					<p>Usuario del Sistema Sergio's Pizza</p>
				</div>
				<div class="social-icons">
                                    <?php echo $mensajelogin; ?>
				</div>
			</div>
			<div class="login-right">
				<div class="sap_tabs">
					<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
						<ul class="resp-tabs-list">
							<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Inicia Sesion</span></li>
							<div class="clear"> </div>
						</ul>				  	 
						<div class="resp-tabs-container">
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
								<div class="login-top">
                                                                    <form name="login_form" method="POST" action="">
                                                                        <input type="text" name="user" id="user" class="usuario" placeholder="Usuario" required=""/>
                                                                        <input type="password" name="pwd" id="pwd" class="password" placeholder="Password" required=""/>		
									<div class="login-bottom login-bottom1">
										<div class="submit" align="center">
                                                                                    <input type="submit" value="Inicia"/>
                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
                                                                            <input type="hidden" name="accion" id="accion" value="login">
                                                                                <a href="javascript:cancel();"><img src="<?php echo $rutatemplate ?>images/home.png?<?php echo time(); ?>" width="32" height="32"></a>
										<div class="clear"></div>
									</div>
                                                                        <div class="login-text">
										<a href="#" onclick="javascript:muestra_recpwdForm();">Recuperar password</a>
									</div>
                                                                    </form>
                                                                    <form name="cancel_form" method="POST" action="">
                                                                        <input type="hidden" name="accion" id="accion" value="main">
                                                                    </form>
								</div>
							</div>
						</div>							
					</div>	
				</div>
			</div>
			<div class="clear"> </div>
		</div>
	</div>
	<!--//main -->	
	<div class="copyright">
		<p> &copy; 2016. Diseñado para Sergio's Pïzza | Visita: <a href="http://sergiospizza.softjit.com" class="external" target="_blank">Sergio's Pizza</a></p>
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