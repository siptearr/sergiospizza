// JavaScript Document
var resultadodepuracion;

function GetXmlHttpObject()
{
if (window.XMLHttpRequest)
  {
  // code for IE7+, Firefox, Chrome, Opera, Safari
  return new XMLHttpRequest();
  }
else if (window.ActiveXObject)
  {
  // code for IE6, IE5
  return new ActiveXObject("Microsoft.XMLHTTP");
  }
return null;
}

function carga_info(nodo,script)
{
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Cargando datos...";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
        }  
    }
}

function carga_info_post(nodo,script,parametros){
    
    var request;
    request = GetXmlHttpObject();

    request.onreadystatechange = procesarRespuesta;
    request.open('POST', script, true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send(parametros);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Cargando datos...";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
        }  
    }
}

function ajax_asignafolioorden(nodo,script){
    var request;
    request = GetXmlHttpObject();
    request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1){
            nodo.value = "";
        }
        if(request.readyState==4){
            nodo.value = request.responseText;
            document.getElementById("folioorden").value = nodo.value;
        }
    }
}

function carga_info_submenu(nodo,seccion)
{
	var request;
	request = GetXmlHttpObject();
	var script = "seccion/"+seccion+"/";
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Cargando datos...";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
            var longseccion = seccion.length - 11;
            if(longseccion<0){
                longseccion = 0;
            }
            
            switch(seccion){
                case "orden":
                    var fecha = new Date();
                    var timestamp,mes,dia,horas,minutos,segundos;

                    timestamp = fecha.getFullYear();
                    timestamp += "-";
                    mes = fecha.getMonth()+1;
                    if(mes < 10){
                        mes = "0"+mes;
                    }
                    timestamp += mes;
                    timestamp += "-";
                    dia = fecha.getDate();
                    if(dia < 10){
                        dia = "0"+dia;
                    }
                    timestamp += dia;
                    timestamp += " ";

                    horas = fecha.getHours();
                    if(horas < 10){
                        horas = "0"+horas;
                    }
                    timestamp += horas;
                    timestamp += ":";

                    minutos = fecha.getMinutes();
                    if(minutos < 10){
                        minutos = "0"+minutos;
                    }
                    timestamp += minutos;
                    timestamp += ":";
                    
                    segundos= fecha.getSeconds();
                    if(segundos < 10){
                        segundos = "0"+segundos;
                    }
                    timestamp += segundos;
                    

                    //document.getElementById("div_main").style.float = "left";
                    
                    document.getElementById("inicio").value = timestamp;
                    document.getElementById("entregaaproximada").value = timestamp;
                    document.getElementById("horaentrega").value = timestamp;
                break;
            default:
            }
            abremenu();
            //oculta_subitems(seccion);
        }  
    }
}

function obtenitems(script){
        var request;
	request = GetXmlHttpObject();
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==4)
        {
            arreglogeneralcatalogos = request.responseText;
            $("#divcontenedor_"+seccion ).show("slow");
        }  
    }
}

function insert_info(nodo,script)
{
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Insertando datos...";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
        }  
    }
}

function update_info(nodo,script)
{
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Actualizando datos...";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
        }  
    }
}

function delete_info(nodo,script)
{
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Borrando datos...";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
        }  
    }
}

function verifica_info(nodo,script)
{
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
        }  
    }
}

function ejecuta_depuracion(script)
{
    var request;
    
    request = GetXmlHttpObject();
	
    request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            resultadodepuracion = "ejecutandose";
        }
        if(request.readyState==4)
        {
            resultadodepuracion = request.responseText;
        }  
    }
}

function cierrasesion_ajax(nodo,script)
{
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Cerrando sesion...";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
            cargamenu();
        }  
    }
}

function carga_sesion(nodo,script,usuario)
{
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Verificando datos...";
        }
        if(request.readyState==4)
        {
            switch(request.responseText.substr(0,14))
            {
            case "sesioncorrecta":
                cargaseccion('div_main','portada');
                switch(usuario){
                case "superusuario":
                    document.getElementById("liasignaciones").innerHTML = "<a href=\"javascript:cargaseccion('div_main','asignaciones');\" class=\"top_link\">Asigna Catalogos</a>";
                    document.getElementById("licatalogos").innerHTML = "<a href=\"javascript:cargaseccion('div_main','catalogos');\" class=\"top_link\">Administra Catalogos</a>";
                    document.getElementById("liasignaformatos").innerHTML = "<a href=\"javascript:cargaseccion('div_main','asignaformatos');\" class=\"top_link\">Configura Formatos</a>";
                    document.getElementById("liformatos").innerHTML = "<a href=\"javascript:cargaseccion('div_main','formatos');\" class=\"top_link\">Formatos</a>";
                    document.getElementById("liusuario").innerHTML = "<a href=\"javascript:cargaseccion('div_main','usuario');\" class=\"top_link\">Super Usuario</a>";
                    document.getElementById("lisesion").innerHTML = "<a href=\"javascript:cierrasesion();\" class=\"top_link\">Cierra Sesion</a>";
                    break;
                case "admin":
                    document.getElementById("licatalogos").innerHTML = "<a href=\"javascript:cargaseccion('div_main','catalogos');\" class=\"top_link\">Administra Catalogos</a>";
                    document.getElementById("liformatos").innerHTML = "<a href=\"javascript:cargaseccion('div_main','formatos');\" class=\"top_link\">Formatos</a>";
                    document.getElementById("liusuario").innerHTML = "<a href=\"javascript:cargaseccion('div_main','usuario');\" class=\"top_link\">Administrador</a>";
                    document.getElementById("lisesion").innerHTML = "<a href=\"javascript:cierrasesion();\" class=\"top_link\">Cierra Sesion</a>";
                    break;
		default:
                    document.getElementById("liusuario").innerHTML = "<a href=\"javascript:cargaseccion('div_main','usuario');\" class=\"top_link\">"+request.responseText.substr(14)+"</a>";
                    document.getElementById("lisesion").innerHTML = "<a href=\"javascript:cierrasesion();\" class=\"top_link\">Cierra Sesion</a>";
                }                
                cargaseccion('div_publicidad','banners');
                cargaseccion('div_videos','multimedia');
            break;
            default:
                nodo.innerHTML = request.responseText;
            break;
            }
        }  
    }
}

function guarda_form_insert(nodo,script,parametros,nomform){
    
    var request;
    request = GetXmlHttpObject();

    request.onreadystatechange = procesarRespuesta;
    request.open('POST', script, true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send(parametros);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Insertando datos...";
        }
        if(request.readyState==4)
        {
            //nodo.innerHTML = request.responseText;
            var resultado;
            resultado = request.responseText;
            //alert("resultado: "+resultado);
            limpia_formulario_insert(nomform);
            ejecuta_after_scripts(nodo,resultado,nomform);
        }  
    }
}

function inicializa_form_multiple(nodo,script,parametros,catalogo,catalogomultiple){
    
    var request;
    request = GetXmlHttpObject();

    request.onreadystatechange = procesarRespuesta;
    request.open('POST', script, true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send(parametros);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Cargando seccion...";
        }
        if(request.readyState==4)
        {
            //nodo.innerHTML = request.responseText;
            var resultado,hiddenname,nombre_nodo,nombre_seccion;
            resultado = request.responseText;
            nombre_nodo = "label"+catalogo;

            if(resultado!=catalogo){
                nodo.innerHTML = "";
                hiddenname = "id"+catalogo+"select";
                nombre_seccion = catalogomultiple;
                document.getElementById(hiddenname).value = resultado;
                cargaseccionsubmenu(nombre_nodo,nombre_seccion);
            }else{
                document.getElementById(nombre_nodo).innerHTML = "Falla al cargar la seccion - "+resultado;
                nombre_nodo.innerHTML = "";
            }
            
        }  
    }
}

function get_info_reporte(nodo,script)
{
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" width=\"20\" />Actualizando catalgo...";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
        }  
    }
}

function get_info_reporte_afiliado(nodo,script,formcatalogo,idafiliado,idusuario){
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta()
    {
        if(request.readyState==1)
        {
            nodo.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Cargando reporte...";
        }
        if(request.readyState==4)
        {
            nodo.innerHTML = request.responseText;
            addservmed(formcatalogo,idafiliado,idusuario);
        }  
    }
}

function get_elimina_fila(nodo_elimina,script,catalogo)
{
    if(!confirm("Esta accion, solo el Administrador de Sistema la puede revertir, deseas continuar")){
        return;
    }
        var request;
        request = GetXmlHttpObject();
	
        request.onreadystatechange = procesarRespuesta;
        request.open('GET', script, true);
        request.send(null);
          
        function procesarRespuesta()
        {
            if(request.readyState==1)
            {
                nodo_elimina.innerHTML = "<img src=\"imagenes/loadingcircle.gif\" />Eliminando Datos...";
            }
            if(request.readyState==4)
            {
                var resultado;
                var nomform = "elimina_"+catalogo;
                resultado = request.responseText;
                muestrareporte('',catalogo);
                ejecuta_after_scripts(nodo_elimina,resultado,nomform);
                //nodo_elimina.innerHTML = request.responseText;
            }  
        }
    
}

function carga_tiempo(nodo,script,id_captura){
	var request;
	request = GetXmlHttpObject();
	
	request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta(){
        if(request.readyState==1){
            nodo.innerHTML = "Obteniendo fecha del servidor...";
        }
        if(request.readyState==4){
            //nodo.value = request.responseText;
            //alert("id_captura: "+id_captura);
            var tiempoactual = request.responseText;
            actualiza_reloj(id_captura,tiempoactual);
        }
    }
}

function get_fechaactual(nodo,script){
    var request;
    request = GetXmlHttpObject();
	
    request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta(){
        if(request.readyState==1){
            nodo.value = "Obteniendo fecha...";
        }
        if(request.readyState==4){
            nodo.value = request.responseText;
        }
    }
}

function update_multiples_atencion(nodo,script,catalogo){
    var request;
    request = GetXmlHttpObject();
	
    request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta(){
        if(request.readyState==1){
            nodo.innerHTML = "Aplicando actualizaciones en la BD...";
        }
        if(request.readyState==4){
            var respuesta = request.responseText;
            switch(respuesta){
                case 'siactualizado':
                    nodo.innerHTML = "Insercion exitosa en la base de datos, referencias de servicios y causes actualizadas";
                    muestrareporte("",catalogo);
                    document.getElementById("add_reg").innerHTML = '<input type="button" value="Captura nuevo caso" onclick="javascript:cargaseccionsubmenu(\'div_main\',\'afiliado\');">';
                break;
                case 'noactualizado':
                    nodo.innerHTML = "Insercion no realizada en la base de datos, favor de contactar al administrador del sistema, referencias no actualizadas";
                    //nodo.innerHTML = "Insercion no realizada en la base de datos, favor de contactar al administrador del sistema, referencias no actualizadas<br />"+script;
                break;
            }
        }
    }
}

function get_popup_informacion(nodo,script){
    var request;
    request = GetXmlHttpObject();
	
    request.onreadystatechange = procesarRespuesta;
    request.open('GET', script, true);
    request.send(null);
          
    function procesarRespuesta(){
        if(request.readyState==1){
            nodo.innerHTML = "Cargando Informacion...";
        }
        if(request.readyState==4){
            nodo.innerHTML = request.responseText;
        }
    }
}