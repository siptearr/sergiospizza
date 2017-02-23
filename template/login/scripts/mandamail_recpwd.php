<?php
@$usuario=$_GET["usuario"];
@$email=$_GET["email"];
$mainmensaje = "";
$idusuario=0;
date_default_timezone_set('America/Mexico_City');
$fecha_actual = date("Y")."-".date("m")."-".date("d")."/".date("H:i:s");
$hora_actual = date("H:i:s");
$caducidad = strtotime('+30 minute',strtotime($hora_actual));
$fecha_caducidad = date("Y")."-".date("m")."-".date("d")."/".date('H:i:s',$caducidad);
$host  = $_SERVER['HTTP_HOST'];

/*echo "fecha actual: ".$fecha_actual;
echo "<br />fecha Caducidad: ".$fecha_caducidad;
echo "<br />control: ".md5($idusuario.$fecha_caducidad);
echo '<br /><br />Ruta base de la aplicacion recpwd: '.$rutabase;
exit;*/

mysql_connect("localhost","dags","dags123");
mysql_select_db("dags");
$result1 = mysql_query("select idusuario from usuario where nombre = '".$usuario."' and email = '".$email."'");
if(mysql_num_rows($result1)==0){
    echo "usuario no existente, control de error: 2da.Funcion AJXAX.-contacte al administrador del sistema";
    exit;
}else{
    $row1=mysql_fetch_array($result1);
    $idusuario = $row1["idusuario"];
}
$result2 = mysql_query("select rutabase from confgeneral where idconfgeneral = 1");
if(mysql_num_rows($result2)==0){
    echo "error de extraccion de rutabase, control de error: Acceso a base de datos.-contacte al administrador del sistema";
    exit;
}else{
    $row2=mysql_fetch_array($result2);
    $rutabasesist = $row2["rutabase"];
}
$llavetemporal = md5($idusuario.$fecha_caducidad);
$llavetemporalaenviar = md5($idusuario.$fecha_actual);
$mysqli = new mysqli("localhost", "dags", "dags123", "dags");
$mysqli->query("insert into recpwd(usuario_idusuario,llavetemp,caducidad) values(".$idusuario.",'".$llavetemporal."','".$fecha_caducidad."')");
$mysqli->close();

$enlacederecuperacion = "http://".$host."/".$rutabasesist."/apps/restaurapwd/rec.php?userid=".$idusuario."&fechasolicitud=".$fecha_actual."&key=".$llavetemporalaenviar;
    $nombreemisor = 'Alertas SICRIEG';
    $encabezado = 'Hemos recibido una solicitud para restablecer el password del usuario '.$usuario.', ';
    $encabezado .= 'por lo que hemos generado el enlace mostrado a continuacion, donde podra configurar un nuevo password:';
    $piedepagina = '<p style="font-size: small">Este mensaje es generado automáticamente por la plataforma <a href="http://187.237.128.183/dags">SICRIEG</a>';
    $piedepagina .= '<br />Favor de <label style="color: #CC3333"><strong>NO responder al remitente de este mail.</strong></label>';
    $piedepagina .= '<br /><label style="color: #CC3333"><strong>Si Usted no hizo dicha solicitud, favor de hacer caso omiso al presente e-mail.</strong></label>';
    $piedepagina .= '<br /><br />Nota: la llave generada para restablecer el password del usuario '.$usuario.', ';
    $piedepagina .= 'tiene una vigencia de 30 min. a partir de la solicitud de restablecimiento: '.$fecha_actual.'</p>';

    $estilo="color: #660000; font-size: 15px; font-style: italic; font-family: Arial, Helvetica, sans-serif;";
    $mainmensaje .= '<table border="1" bordercolor="#000099" width="100%">
		<tr style="background:#0E4981">
                    <td>
			<span style="color: #FFFFFF">Usuario:</span>
                    </td>
                    <td>
                        <span style="color: #FFFFFF">Enlace de recuperacion:</span>
                    </td>
                </tr>
                <tr style="background:#B4C6DB">
                    <td>
                        <span style="'.$estilo.'">'.$usuario.'</span>
                    </td>
                    <td>
                        <span style="'.$estilo.'"><a href="'.$enlacederecuperacion.'">'.$enlacederecuperacion.'</a></span>
                    </td>
		</tr>';
    $mainmensaje .= '</table>';

    $cuerpodelmensaje = '<p style="font-size: large">'.$encabezado.'</p>'.$mainmensaje.'<br />'.$piedepagina;

require_once('../class/class.phpmailer.php');

$mail = new PHPMailer();
$mail->IsSMTP();
$mail->CharSet="UTF-8";
$mail->SMTPSecure = 'tls';
$mail->Host = 'smtp.gmail.com';
$mail->Port = 587;
$mail->Username = 'sicrieg@gmail.com';
$mail->Password = 'portasicrieg';
$mail->SMTPAuth = true;

$mail->From = 'sicrieg@gmail.com';
$mail->FromName = $nombreemisor;
$mail->AddAddress($email);

$mail->IsHTML(true);
$mail->Subject    = "Reestablecimiento de Password";
$mail->AltBody    = "Para ver este mensaje, por favor activa o usa un visor de correo compatible con HTML !";

$mail->Body       = $cuerpodelmensaje;

if(!$mail->Send())
{
  //echo "noenviado: " . $mail->ErrorInfo;
  echo "noenviado";
}else{
  echo "sienviado";
}
?>