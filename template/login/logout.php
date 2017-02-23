<?php
if(!@session_start()){
    session_start();
}
$_SESSION['login'] = false;

$accion = $_POST["accion"];

header("Location: ../../");

?>