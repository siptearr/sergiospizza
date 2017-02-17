// Funcion para obtener el objeto XmlHTTP el cual va a hacer 
// las consultas de forma asincrona con el servidor
function GetXmlHttpObject()
{
if (window.XMLHttpRequest)
  {
  // codigo para IE7+, Firefox, Chrome, Opera, Safari
  return new XMLHttpRequest();
  }
else if (window.ActiveXObject)
  {
  // codigo para IE6, IE5
  return new ActiveXObject("Microsoft.XMLHTTP");
  }
return null;
}

function rec_pwd(nodo,script,usuario)
{
    var request;
	request = GetXmlHttpObject();
    var respuesta,resultado;
    var email;
    var timedelay = 3000;
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);

    function procesarRespuesta()
    {    
        if(request.readyState==1)
        {
            nodo.innerHTML = "Recuperando password del sistema...";
        }
        if(request.readyState==4)
        {
            respuesta = request.responseText;
            resultado = respuesta.substr(0,12);
            email = respuesta.substr(12,100);
            switch(resultado){
                case "sirecuperado":
                    nodo.innerHTML = "Enviando password de recuperacion a "+email;
                    script = "scripts/mandamail_recpwd.php?email="+email+"&usuario="+usuario;
                    envia_rec_pwd(nodo,script,email);
                break;
                case "norecuperado":
                    nodo.innerHTML = "Usuario no encontrado en la base de datos...";
                    setTimeout(limpia_resultadosrecpwd,timedelay);
                break;
            default:
                nodo.innerHTML = "Error desconocido, favor de avisar al administrador del sistema, mensage de error.- "+respuesta;
            }
        }
    }
}

function envia_rec_pwd(nodo,script,email)
{
    var request;
	request = GetXmlHttpObject();
    var respuesta;
    var timedelay = 5000;
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);

    function procesarRespuesta()
    {    
        if(request.readyState==1)
        {
            nodo.innerHTML += " <img src=\"images/enviandomail.gif\" heigth=\"15px\">";
        }
        if(request.readyState==4)
        {
            respuesta = request.responseText;
            switch(respuesta){
                case "sienviado":
                    nodo.innerHTML = "Se ha enviado un email a <"+email+"> con las instrucciones de recuperacion de password.";
                    setTimeout(cierrarecpwdForm,timedelay);
                    setTimeout(limpia_resultadosrecpwd,timedelay);
                break;
                case "noenviado":
                    nodo.innerHTML = "email no enviado, favor de contactar al administrador del sistema...";
                    timedelay = 3000;
                    setTimeout(limpia_resultadosrecpwd,timedelay);
                break;
            default:
                nodo.innerHTML = "Error desconocido, favor de avisar al administrador del sistema, mensage de error.- "+respuesta;
            }
        }
    }
}
                    