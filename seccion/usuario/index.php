<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LapremierDeLeon</title>
<style type="text/css">
<!--
.Estilo1 {font-size: 36px}
div.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
li.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
-->
</style>
</head>

<body>
<?php
session_start();
$conn = mysql_connect('localhost', 'softjitc_premier', 'lapremier123');
mysql_select_db('softjitc_lapremier', $conn);
echo '<b><span class="Estilo2" style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Pagina de informacion de Usuario</span></b>
<hr>';

if(@$_SESSION["autentificado"] == "SI" && @$_SESSION["privilegios"] != "invitado")
{
    echo "<li class=\"top\" id=\"liuser\"><a href=\"javascript:editausuario(".$_SESSION["usuario"].");\" class=\"top_link\">Informacion de Usuario ".$_SESSION["usuario"]."</a></li>";
}
?>

</body>
</html>
