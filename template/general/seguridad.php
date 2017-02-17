<?php
//si es necesario cambiar la config. del php.ini desde tu script
ini_set("session.use_only_cookies","1");
ini_set("session.use_trans_sid","0");
//Inicio la sesión
session_start();
//COMPRUEBA QUE EL USUARIO ESTA AUTENTIFICADO
//cambiamos la duración a la cookie de la sesión
@session_set_cookie_params(0, "/", $HTTP_SERVER_VARS["HTTP_HOST"], 0);
if ($_SESSION["autentificado"] != "SI") {
//si no existe, envio a la página de autentificacion
header("Location: index.php");
//ademas salgo de este script
exit();
}
?>