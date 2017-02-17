<?php
//iniciamos la sesión
@session_start();
//antes de hacer los cálculos, compruebo que el usuario está logueado
$_SESSION["autentificado"] = "NO";
$_SESSION["usuario"] = "";
$_SESSION["nombre"] = 'Invitado';
$_SESSION["email"] = '';
$_SESSION["privilegios"] = 'invitado';
//header("Location: index.php"); //envío al usuario a la pagina de autenticación
echo "<a href=\"javascript:cargaseccion('div_main','sesion');\" class=\"top_link\">Inicia Sesion</a>";
?>