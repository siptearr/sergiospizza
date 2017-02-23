var calendario_open = false;
var fecingtemp = "";
var fecegrtemp = "";
var fecingtitemp = "";
var fecegrtitemp = "";

function cargamenu(){
    nododecarga = document.getElementById("menu");
    var scriptdecarga = "seccion/muestramenu.php";
    carga_info(nododecarga,scriptdecarga);
}

function cargaseccion(nombre_nodo,nombre_seccion)
{
    nododecarga = document.getElementById(nombre_nodo);
    carga_info(nododecarga,nombre_seccion);
}

function cargaseccionsubmenu(nombre_nodo,nombre_seccion)
{
    nododecarga = document.getElementById(nombre_nodo);
    carga_info_submenu(nododecarga,nombre_seccion);
}

function oculta_subitems(seccion){
    var scriptdecarga = "seccion/"+seccion+"/obtensubitems.php";
    obten_items(scriptdecarga);
}
function carga_videos(nombre_nodo)
{
    num_nodos = document.getElementById(nombre_nodo).childNodes;
    alert(num_nodos);
    return;
//    nododecarga = document.getElementById(nombre_nodo).[0];
//    scrpt_nododecarga = document.getElementById(nombre_nodo).[0].innerHTML;
    
//    scriptdecarga = "../../scripts/obtenvarvideos.php?ruta="+nododecarga;
//    carga_info(nododecarga,scriptdecarga);
}

function carganotas(nombre_nodo,idseccion,toplimit)
{
    nododecarga = document.getElementById(nombre_nodo);
    var scriptdecarga = "scripts/carga_notas.php?idseccion="+idseccion+"&toplimit="+toplimit;
    carga_info(nododecarga,scriptdecarga);
}

var editor = null;
function cargaeditor(divid)
{
    if(editor)
	{
		editor.destroy();
	}
	var divreplace = document.getElementById(divid);
	editor = CKEDITOR.replace(divreplace);
}

function guarda(divid)
{
	document.getElementById(divid).innerHTML = editor.getData();
	editor.destroy();
}

function guardanueva()
{
	var nota = document.getElementById('editormodal').innerHTML;
	nodo_carga = document.getElementById('div_main');
	
	editor.destroy();
}

function cargapic(ruta)
{
    /*document.getElementById("osx-modal-title").innerHTML = "Visor de imagenes - By Softjit S.A. de C.V.";
    document.getElementById("editormodal").innerHTML = '<img src="'+ruta+'" width="590" />';
    document.getElementById("boton1modal").innerHTML = "Cerrar Visor";*/
    window.open(ruta,"_blank");
}

function cargaenlace(ruta)
{
    window.open(ruta,"_blank");
}

function cierrasesion()
{
    nodosesion = document.getElementById("lisesion");
    var scriptcierrasesion = "seccion/sesion/cierrasesion.php";
    cierrasesion_ajax(nodosesion,scriptcierrasesion);
}

function iniciasesion(usuario,contrasena,intento)
{
    nombre_seccion = "sesion";
    nombre_nodo = "div_main";
    nododecarga = document.getElementById(nombre_nodo);
    var scriptdecarga = "seccion/"+nombre_seccion+"/index.php?usuario="+usuario+"&contrasena="+contrasena+"&intento="+intento;
    carga_sesion(nododecarga,scriptdecarga,usuario);
}

function alertame()
{
    alert("Alertado");
}

function insertanota()
{
    
}

function depuraautoscripts()
{
    nodoresultado = document.getElementById("resultado");
    var scriptdepuracion = "scripts/depuracionautoscripts.php";
    verifica_info(nodoresultado,scriptdepuracion);
}

function depuraautoscriptsinicial()
{
    var scriptdepuracion = "scripts/depuracionautoscripts.php";
    ejecuta_depuracion(scriptdepuracion);
}

function procesa_formulario_insert(nodoresult,script,nomform){
    var largoForm = document.forms[nomform].length;
    var i = 1;
    var indice;
    var parametros="";

    switch(nomform){
        case "guarda_atencion":
            var idmultipleservicios = document.getElementById("idmultipleserviciosselect").value;
            var idmultiplecauses = document.getElementById("idmultiplecausesselect").value;
            
            var banderamultipleservicios = document.getElementById("idmultipleserviciosselect").value;
            if(banderamultipleservicios == 0){
                alert("captura por lo menos un SERVICIO para este caso");
                return;
            }

            var banderamultiplecauses = document.getElementById("idmultiplecausesselect").value;
            if(banderamultiplecauses == 0){
                alert("captura por lo menos un CAUSES para este caso");
                return;
            }
            
            var formmultipleservicios = document.getElementById("banderaidmultipleserviciosselect").value;
            var formmultiplecauses = document.getElementById("banderaidmultiplecausesselect").value;
            //alert(document.getElementById("idmultipleserviciosselect").value);
            //alert("formmultipleservicios: "+formmultipleservicios);
            //alert("formmultiplecauses: "+formmultiplecauses);
            if(formmultipleservicios > 0){
                if(formmultiplecauses > 0){
                    document.getElementById("multipleservicios_idmultipleservicios").value = idmultipleservicios;
                    document.getElementById("multiplecauses_idmultiplecauses").value = idmultiplecauses;
                    document.getElementById("labelmultipleservicios").innerHTML = '<input type="hidden" name="multipleservicios_idmultipleservicios" id="multipleservicios_idmultipleservicios" value="'+idmultipleservicios+'" >';
                    document.getElementById("labelmultiplecauses").innerHTML = '<input type="hidden" name="multiplecauses_idmultiplecauses" id="multiplecauses_idmultiplecauses" value="'+idmultiplecauses+'" >';
                    //alert("multipleservicios_idmultipleservicios: "+document.getElementById("multipleservicios_idmultipleservicios").value);
                    //alert("multiplecauses_idmultiplecauses: "+document.getElementById("multiplecauses_idmultiplecauses").value);
                    var fechacaptura = document.getElementById("fechacaptura").value;
                    var arrayfechacaptura = fechacaptura.split("/");
                    var dia = arrayfechacaptura[0];
                    var mes = arrayfechacaptura[1];
                    var aniohora = arrayfechacaptura[2];
                    var arrayaniohora = aniohora.split("-");
                    var anio = arrayaniohora[0];
                    var horaminutosegundo = arrayaniohora[1];
                    var arrayhoraminutosegundo = horaminutosegundo.split(":");
                    var hora = arrayhoraminutosegundo[0];
                    var minuto = arrayhoraminutosegundo[1];
                    var segundo = arrayhoraminutosegundo[2];
                    document.getElementById("fechacaptura").value = anio+"-"+mes+"-"+dia+" "+hora+":"+minuto+":"+segundo;
                    //alert(document.getElementById("fechacaptura").value);
                }else{
                    alert("captura por lo menos un CAUSES para este caso");
                    return;
                }
            }else{
                alert("captura por lo menos un SERVICIO para este caso");
                return;
            }
        break;
    default:
    }
    while (i <= largoForm){
        indice = i - 1;
        if (indice==0){
        }else{
            parametros+="&";
        }
        if(encodeURI(document.forms[nomform].elements[indice].value)!=""){
            parametros += encodeURI(document.forms[nomform].elements[indice].name)
                + "=" 
                + encodeURI(document.forms[nomform].elements[indice].value);
        }else{
            alert("Favor de llenar el valor de: "+document.forms[nomform].elements[indice].name);
            document.forms[nomform].elements[indice].focus();
            return;
        }
        i++;
    }
    nodo = document.getElementById(nodoresult);
    guarda_form_insert(nodo,script,parametros,nomform); 
  }
  
  function limpia_formulario_insert(nomform){
    var largoForm = document.forms[nomform].length-1;
    var i = 1;
    var indice;
    while (i < largoForm){
        indice = i - 1;

        if(document.forms[nomform].elements[indice].name == 'idtransaccion'){
            inicializa_selects(nomform);
            return;
        }
        if(document.forms[nomform].elements[indice].type=='select-one'){
            document.forms[nomform].elements[indice].value = "";
        }else if(document.forms[nomform].elements[indice].value!='activo'){
            document.forms[nomform].elements[indice].value = '';
        }
        i++;
    }
  }
  
function inicializa_selects(nomform){
    form_main = document.getElementById(nomform);
    var j=0;
    var largoelements = form_main.elements.length;
    for(j=0;j<=(largoelements-1);j++){
        switch(form_main.elements[j].type){
        case "select-one":
            switch(nomform){
                case "guarda_afiliado":
                    switch(form_main.elements[j].id){
                        case "genero_idgenero":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                        case "estado_idestado":
                            form_main.elements[j].selectedIndex = 10;
                        break;
                        case "municipio_idmunicipio":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                        case "localidad_idlocalidad":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                    default:
                    }
                break;
                case "guarda_atencion":
                    switch(form_main.elements[j].id){
                        case "surtmed_idsurtmed":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                        case "pago_idpago":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                        case "afiliado_idafiliado":
                            form_main.elements[j].value = document.getElementById("idafiliadoselect").value;
                            form_main.elements[j].disabled = "disabled";
                        break;
                        case "usuario_idusuario":
                            form_main.elements[j].value = document.getElementById("idusuarioselect").value;
                            form_main.elements[j].disabled = "disabled";
                        break;
                        case "servegr_idservegr":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                    default:
                    }
                break;
                case "guarda_serviciosregistrados":
                    switch(form_main.elements[j].id){
                        case "servicios_idservicios":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                        case "tiposervicio_idtiposervicio":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                        case "multipleservicios_idmultipleservicios":
                            form_main.elements[j].value = document.getElementById("idmultipleserviciosselect").value;
                        break;
                    default:
                    }
                break;
                case "guarda_causesregistrados":
                    switch(form_main.elements[j].id){
                        case "causes_idcauses":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                        case "cie10_idcie10":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                        case "cie9_idcie9":
                            form_main.elements[j].selectedIndex = 0;
                        break;
                        case "multiplecauses_idmultiplecauses":
                            form_main.elements[j].value = document.getElementById("idmultiplecausesselect").value;
                        break;
                    default:
                    }
                break;
            default:
            }
        break;
        case "hidden":
            switch(nomform){
                case "guarda_serviciosregistrados":
                    switch(form_main.elements[j].id){
                        case "multipleservicios_idmultipleservicios":
                            form_main.elements[j].value = document.getElementById("idmultipleserviciosselect").value;
                        break;
                    default:
                    }
                break;
                case "guarda_causesregistrados":
                    switch(form_main.elements[j].id){
                        case "multiplecauses_idmultiplecauses":
                            form_main.elements[j].value = document.getElementById("idmultiplecausesselect").value;
                        break;
                    default:
                    }
                break;
            default:
            }
        break;
        case "text":
            switch(nomform){
                case "guarda_atencion":
                    switch(form_main.elements[j].id){
                        case "fecing":
                            obtenfechaactual(form_main.elements[j]);
                        break;
                        case "fecegr":
                            obtenfechaactual(form_main.elements[j]);
                        break;
                        case "diasatn":
                            form_main.elements[j].value = 0;
                        break;
                        case "fecingti":
                            obtenfechaactual(form_main.elements[j]);
                        break;
                        case "fecegrti":
                            obtenfechaactual(form_main.elements[j]);
                        break;
                        case "diasatnti":
                            form_main.elements[j].value = 0;
                        break;
                        case "monto":
                            form_main.elements[j].value = 0;
                        break;
                    default:
                    }
                break;
            default:
            }
        break;
        case "textarea":
            switch(nomform){
                case "guarda_atencion":
                    switch(form_main.elements[j].id){
                        case "motivopago":
                            form_main.elements[j].value = "n/a";
                        break;
                    default:
                    }
                break;
            default:
            }
        break;
        default:
        }
    }
    //}
}

function carga_reporte_filtro(filtro,catalogo){
    document.getElementById("filtro_reporte").value = filtro;
    muestrareporte('',catalogo);
}

var objeto_settimeout;
function muestrareporte(pagina,catalogo){
    var parametros = '';
    var filtro = '';
    var subcadena = '';
    var longsubcadena = 0;
    nodo_reporte = document.getElementById("catalogo_"+catalogo);
    
    longsubcadena = catalogo.length-11;
    if(catalogo.substr(longsubcadena)=="registrados"){
        subcadena = catalogo.substr(0,longsubcadena);
        filtro = document.getElementById("multiple"+subcadena+"_idmultiple"+subcadena).value;
    }else{
        filtro = document.getElementById("filtro_reporte").value;
    }
    
    
    if(pagina!=''){
        parametros = "Pagina="+pagina;
    }else{
        parametros = "Pagina=1";
    }
    
    parametros += "&catalogo="+catalogo;
    parametros += "&filtro="+filtro;
    var script_reporte = "autoscripts/reporte_"+catalogo+".php?"+parametros;
    
    switch(catalogo){
        case "orden":
            clearTimeout(objeto_settimeout);
            objeto_settimeout = setTimeout("muestrareporte('','"+catalogo+"');",30000);
        break;
    default:
    }
    
    get_info_reporte(nodo_reporte,script_reporte);
}

function ejecuta_after_scripts(nodo,resultado,nomform){
    arreglo_resultados = resultado.split("*");
    arreglo_nombrecatalogo = nomform.split("_");
    var catalogo = arreglo_nombrecatalogo[1];
    var tipoaccion = arreglo_nombrecatalogo[0];
    var primerindicadordelautoscript = arreglo_resultados[0];
    //alert(primerindicadordelautoscript);
    switch(primerindicadordelautoscript){
        //case "acciones_especiales_para_un_valor_devuelto_en_el_script_en_un_catalogo_en_especifico":
        case "serviciosregistrados":
            switch(tipoaccion){
                case 'guarda':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Insercion exitosa en la base de datos, id insertado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Insercion exitosa en la base de datos";
                        document.getElementById("banderaidmultipleserviciosselect").value = arreglo_resultados[2];
                        muestrareporte("",catalogo);
                    }else{
                        nodo.innerHTML = "Insercion no realizada en la base de datos, favor de contactar al administrador del sistema";
                    }
                break;
                case 'elimina':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Eliminacion exitosa en la base de datos, id borrado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Eliminacion exitosa en la base de datos";
                        //alert("arreglo_resultados[2];: "+arreglo_resultados[2]);
                        document.getElementById("banderaidmultipleserviciosselect").value = arreglo_resultados[2];
                        //alert(document.getElementById("banderaidmultipleserviciosselect").value);
                        muestrareporte("",catalogo);
                    }else{
                        nodo.innerHTML = "Eliminacion no realizada en la base de datos, referencia de indice foraneo en columna hija<br />";
                    }
                break;
            }
        break;
        case "causesregistrados":
            switch(tipoaccion){
                case 'guarda':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Insercion exitosa en la base de datos, id insertado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Insercion exitosa en la base de datos";
                        document.getElementById("banderaidmultiplecausesselect").value = arreglo_resultados[2];
                        muestrareporte("",catalogo);
                    }else{
                        nodo.innerHTML = "Insercion no realizada en la base de datos, favor de contactar al administrador del sistema";
                    }
                break;
                case 'elimina':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Eliminacion exitosa en la base de datos, id borrado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Eliminacion exitosa en la base de datos";
                        document.getElementById("banderaidmultiplecausesselect").value = arreglo_resultados[2];
                        muestrareporte("",catalogo);
                    }else{
                        nodo.innerHTML = "Eliminacion no realizada en la base de datos, referencia de indice foraneo en columna hija<br />";
                    }
                break;
            }
        break;
        case "afiliado":
            switch(tipoaccion){
                case 'guarda':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Insercion exitosa en la base de datos, id insertado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Insercion exitosa en la base de datos";
                        document.getElementById("autotabla_afiliado").innerHTML = "";
                        document.getElementById("autobotones_afiliado").innerHTML = "";
                        
                        var idafiliado = arreglo_resultados[2];
                        muestrareporte(idafiliado,"afiliado");
                    }else{
                        nodo.innerHTML = "Insercion no realizada en la base de datos, favor de contactar al administrador del sistema-Script Inicial con errores";
                    }
                break;
                case 'elimina':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Eliminacion exitosa en la base de datos, id borrado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Eliminacion exitosa en la base de datos";
                        muestrareporte("",catalogo);
                    }else{
                        nodo.innerHTML = "Eliminacion no realizada en la base de datos, referencia de indice foraneo en columna hija<br />";
                    }
                break;
            }
        break;
        case "atencion":
            switch(tipoaccion){
                case 'guarda':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Insercion exitosa en la base de datos, id insertado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Insercion exitosa en la base de datos";
                        document.getElementById("autotabla_atencion").innerHTML = "";
                        document.getElementById("autobotones_atencion").innerHTML = "";
                        var idmultipleservicios = document.getElementById("idmultipleserviciosselect").value;
                        var idmultiplecauses = document.getElementById("idmultiplecausesselect").value;
                        //document.getElementById("labelmultipleservicios").innerHTML = <div id="multipleservicios_idmultipleservicios" name="multipleservicios_idmultipleservicios"><a href="javascript:aniade_multiple('labelmultipleservicios','serviciosregistrados');">Agrega servicios</a></div>;
                        //document.getElementById("labelmultiplecauses").innerHTML = <div id="multiplecauses_idmultiplecauses" name="multiplecauses_idmultiplecauses"><a href="javascript:aniade_multiple('labelmultiplecauses','causesregistrados');">Agrega causes</a></div>;
                        var script = "scripts/actualizamultiples_atencion.php?idmultipleservicios="+idmultipleservicios+"&idmultiplecauses="+idmultiplecauses;
                        /*alert("script: "+script);
                        alert("resultado: "+resultado);
                        alert("arreglo_resultados[1]: "+arreglo_resultados[1]);*/
                        update_multiples_atencion(nodo,script,catalogo);
                    }else{
                        nodo.innerHTML = "Insercion no realizada en la base de datos, favor de contactar al administrador del sistema-Script Inicial con errores";
                    }
                break;
                case 'elimina':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Eliminacion exitosa en la base de datos, id borrado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Eliminacion exitosa en la base de datos";
                        muestrareporte("",catalogo);
                    }else{
                        nodo.innerHTML = "Eliminacion no realizada en la base de datos, referencia de indice foraneo en columna hija<br />";
                    }
                break;
            }
        break;
        default:
            switch(tipoaccion){
                case 'guarda':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Insercion exitosa en la base de datos, id insertado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Insercion exitosa en la base de datos";
                        muestrareporte("",catalogo);
                    }else{
                        nodo.innerHTML = "Insercion no realizada en la base de datos, favor de contactar al administrador del sistema";
                    }
                break;
                case 'elimina':
                    if(arreglo_resultados[1]=="correcto"){
                        //nodo.innerHTML = "Eliminacion exitosa en la base de datos, id borrado = "+arreglo_resultados[2];
                        nodo.innerHTML = "Eliminacion exitosa en la base de datos";
                        muestrareporte("",catalogo);
                    }else{
                        nodo.innerHTML = "Eliminacion no realizada en la base de datos, referencia de indice foraneo en columna hija<br />";
                    }
                break;
            default:
                nodo.innerHTML = resultado;
            }
    }
}

function solo_numero(idnodo)
{
    var corrije = document.getElementById(idnodo).value;
    corrije = numeros(corrije);
    document.getElementById(idnodo).value = corrije;
}

function numeros(Text){
    var cadena="";
    for (var j = 0; j < Text.length; j++){
    var Char=Text.charCodeAt(j);
    switch(Char){
        case 48: // 0
            cadena+="0";
        break;
        case 49: // 1
            cadena+="1";
        break;
        case 50: // 2
            cadena+="2";
        break;
        case 51: // 3
            cadena+="3";
        break;
        case 52: // 4
            cadena+="4";
        break;
        case 53: // 5
            cadena+="5";
        break;
        case 54: // 6
            cadena+="6";
        break;
        case 55: // 7
            cadena+="7";
        break;
        case 56: // 8
            cadena+="8";
        break;
        case 57: // 9
            cadena+="9";
        break;
        default:
            cadena+="";
        }
    }
    return cadena;
}

function solonumeros(idnodo)
{
    var corrije = document.getElementById(idnodo).value;
    corrije = numeros(corrije);
    document.getElementById(idnodo).value = corrije;
}

function eliminafila(catalogo,idregistro){
    var script = "autoscripts/elimina_"+catalogo+".php?idregistro="+idregistro+"&catalogo="+catalogo;
    nodo_elimina = document.getElementById("resultado_"+catalogo);
    
    get_elimina_fila(nodo_elimina,script,catalogo);
}

function eliminafilacompuesta(catalogo,idregistro1,idregistro2){
    var script = "autoscripts/eliminacompuesta_"+catalogo+".php?idregistro1="+idregistro1+"&idregistro2="+idregistro2+"&catalogo="+catalogo;
    nodo_elimina = document.getElementById("resultado_"+catalogo);
    
    get_elimina_fila(nodo_elimina,script,catalogo);
}

function abremenu(){
    var menu = $('.menu-toggle').data('show-dialog');
    $('.' + menu).toggleClass('side-menu-shown');
}

function cierramenu_overlay(){
    $('.options-menu-overlay').fadeOut('fast');
}

function abremenu_clientes(){
    document.getElementById("capa_cocina").style.visibility = "hidden";
    document.getElementById("capa_pizzeria").style.visibility = "hidden";
    var menu = $('.menu-toggle').data('show-dialog');
    $('.' + menu).fadeIn(300);
    
    var parametros;
    var script;
        
    parametros = "sucursal=indistinta";
    script = "scripts/carga_catalogo_clientes.php";
    
    nodo = document.getElementById("menu_overlay");
    carga_info_post(nodo,script,parametros);
}

function abremenu_mesas(sucursal){
    document.getElementById("capa_cocina").style.visibility = "hidden";
    document.getElementById("capa_pizzeria").style.visibility = "hidden";
    var menu = $('.menu-toggle').data('show-dialog');
    $('.' + menu).fadeIn(300);
    
    var parametros;
    var script;
        
    parametros = "sucursal=" + sucursal;
    script = "scripts/carga_catalogo_mesas.php";
    
    nodo = document.getElementById("menu_overlay");
    carga_info_post(nodo,script,parametros);
}

function abremenu_restaurante(sucursal,rutatemplate){
    var menu = $('.menu-toggle').data('show-dialog');
    $('.' + menu).fadeIn(300);
    
    document.getElementById("capa_cocina").style.visibility = "visible";
    document.getElementById("menu_overlay").innerHTML = "";
    document.getElementById("capa_pizzeria").style.visibility = "hidden";
    document.getElementById("capa_mostrador").style.visibility = "hidden";
    /*var parametros;
    var script;
        
    parametros = "sucursal=" + sucursal + "&rutatemplate=" + rutatemplate;
    script = "scripts/carga_catalogo_restaurant.php";
    
    nodo = document.getElementById("menu_overlay");
    carga_info_post(nodo,script,parametros);*/
}

function abremenu_pizzeria(sucursal,rutatemplate){
    var menu = $('.menu-toggle').data('show-dialog');
    $('.' + menu).fadeIn(300);
    
    document.getElementById("capa_pizzeria").style.visibility = "visible";
    document.getElementById("menu_overlay").innerHTML = "";
    document.getElementById("capa_cocina").style.visibility = "hidden";
    document.getElementById("capa_mostrador").style.visibility = "hidden";

    /*var parametros;
    var script;
        
    parametros = "sucursal=" + sucursal + "&rutatemplate=" + rutatemplate;
    script = "scripts/carga_catalogo_restaurant.php";
    
    nodo = document.getElementById("menu_overlay");
    carga_info_post(nodo,script,parametros);*/
}

function asignamesa(idmesa){
    document.getElementById("mesa_idmesa").value = idmesa;
    guardamesa();
    $('.options-menu-overlay').fadeOut('fast');
}

function asignacliente(){
    var idcliente = document.getElementById("select_cliente").value;
    document.getElementById("cliente_idcliente").value = idcliente;
    guardacliente();
    $('.options-menu-overlay').fadeOut('fast');
}

function abremenu_mostrador(sucursal){
    document.getElementById("comandas_overlay").style.visibility = "hidden";
    document.getElementById("capa_mostrador").removeAttribute("style");
    document.getElementById("capa_mostrador").style.visibility = "visible";
    var menu = $('.menu-toggle').data('show-dialog');
    $('.' + menu).fadeIn(300);
    
    var parametros;
    var script;
        
    parametros = "sucursal="+sucursal;
    script = "scripts/carga_catalogo_clientes.php";
        
    nodo = document.getElementById("menu_overlay");
    
    asigna_folioorden();
    carga_info_post(nodo,script,parametros);
    
//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
//Codigo para la ejecucion del texto predictivo - Inicio
//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

	var options = {
		script:"scripts/obten_clientes.php?json=true&limit=20&",
		varname:"input",
		json:true,
		shownoresults:false,
		maxresults:6,
		callback: function (obj) { document.getElementById('testid').value = obj.id; }
	};
	var as_json = new bsn.AutoSuggest('testinput', options);
	
	
	var options_xml = {
		script: function (input) { return "scripts/obten_clientes.php?input="+input+"&testid="+document.getElementById('testid').value; },
		varname:"input"
	};
	var as_xml = new bsn.AutoSuggest('testinput_xml', options_xml);

//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
//Codigo para la ejecucion del texto predictivo - Fin
//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
//Codigo para la ejecucion de los menus animados - Inicio
//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
animatedcollapse.addDiv('pizzeria', 'fade=0,speed=400,group=pets,hide=1');
animatedcollapse.addDiv('cocina', 'fade=0,speed=400,group=pets,persist=1,hide=1');
animatedcollapse.addDiv('bebidas', 'fade=0,speed=400,group=pets,persist=1,hide=1');
animatedcollapse.addDiv('postres', 'fade=0,speed=400,group=pets,persist=1,hide=1');

animatedcollapse.addDiv('hidde_ingredientes', 'fade=1,height=50px');
animatedcollapse.addDiv('show_ingredientes', 'fade=1,height=100px');


animatedcollapse.addDiv('pastas', 'fade=1,height=250px');
animatedcollapse.addDiv('carnes', 'fade=1,height=150px');
animatedcollapse.addDiv('hamburguesas', 'fade=1,height=400px');
animatedcollapse.addDiv('menupostres', 'fade=1,height=150px');
animatedcollapse.addDiv('cremas', 'fade=1,height=250px');
animatedcollapse.addDiv('otrosplatillos', 'fade=1,height=400px');
animatedcollapse.addDiv('menubebidas', 'fade=1,height=300px');

animatedcollapse.addDiv('pizzabisteck', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzasuprema', 'fade=1,height=100px');
animatedcollapse.addDiv('pizzasalami', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzasalamiycarnemolida', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzajamon', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzajamonypinia', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzasergios', 'fade=1,height=100px');
animatedcollapse.addDiv('pizzachampiniones', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzasuprema', 'fade=1,height=100px');
animatedcollapse.addDiv('pizzachampiniones', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzachampinionesycarnemolida', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzamexicana', 'fade=1,height=100px');
animatedcollapse.addDiv('pizzatocinoconcebolla', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzachorizoconcebolla', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzaatun', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzacamarones', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzavegetariana', 'fade=1,height=100px');
animatedcollapse.addDiv('pizzacamaronesconchampiniones', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzasalchichaviena', 'fade=1,height=50px');
animatedcollapse.addDiv('pizzademariscos', 'fade=1,height=100px');
animatedcollapse.addDiv('pizzaespecial', 'fade=1,height=100px');
animatedcollapse.addDiv('pizzadecarnesfrias', 'fade=1,height=100px');

animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted
	//$: Access to jQuery
	//divobj: DOM reference to DIV being expanded/ collapsed. Use "divobj.id" to get its ID
	//state: "block" or "none", depending on state
}

animatedcollapse.init();
//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
//Codigo para la ejecucion de los menus animados - Fin
//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
}

function asigna_folioorden(){
    var script_folioorden,folioordenactual;
    folioordenactual = document.getElementById("folioordenhidden").value;

    if(folioordenactual == ""){
        script_folioorden = "scripts/obten_folio_orden.php";
        nodo_folioorden = document.getElementById("folioordenhidden");
        ajax_asignafolioorden(nodo_folioorden,script_folioorden);
    }else{
        if(document.getElementById("folioorden") != undefined){
            document.getElementById("folioorden").value = document.getElementById("folioordenhidden").value;
        }
    }
    
}

function cierrasesion(){
    document.forms["form_cierrasesion"].submit();
}

function inicializa_calendario2(){
/*var LEFT_CAL = Calendar.setup({
    cont: "cont",
    weekNumbers: true,
    selectionType: Calendar.SEL_MULTIPLE,
    showTime: 12
    // titleFormat: "%B %Y"
});*/
            
RANGE_CAL_1 = new Calendar({
    inputField: "fecnac",
    dateFormat: "%Y/%m/%d",
    trigger: "fecnac",
    bottomBar: false,
    onSelect: function(){
        //var date = Calendar.intToDate(this.selection.get());
        //LEFT_CAL.args.min = date;
        //LEFT_CAL.redraw();
        this.hide();
    }
});
}

function aniade_multiple(catalogo,catalogomultiple){
    var parametros;
    var script;
    catalogo = catalogo.substr(5);
    
    parametros = "catalogo=" + encodeURI(catalogo);
    script = "scripts/inicializamultiple.php";
    
    nodo = document.getElementById(catalogo+"_id"+catalogo);
    inicializa_form_multiple(nodo,script,parametros,catalogo,catalogomultiple); 
}
/*function cierra_calendario2(){
    //document.getElementById("f_rangeStart").value = "";
    //LEFT_CAL.args.min = null;
    //LEFT_CAL.redraw();
    this.hide();
}*/
function inicializarelojcaptura(id_captura){
    document.getElementById(id_captura).value = "";
    nodo_tiempo = document.getElementById(id_captura);
    var script_reloj = "scripts/reloj.php";
    
    carga_tiempo(nodo_tiempo,script_reloj,id_captura);
}

function actualiza_reloj(id_captura,tiempo){
    //alert(id_captura);
    //alert(tiempo);
    //tiempoactual = new Date("'"+tiempo+"'");
    var tiempoactual = new Date(tiempo);
    var dia = tiempoactual.getDate();
    var mes = tiempoactual.getMonth()+1;
    var anio = tiempoactual.getFullYear();
    var hora = tiempoactual.getHours(); 
    var minutos = tiempoactual.getMinutes();
    var segundos = tiempoactual.getSeconds();
    
    /*alert("dia: "+dia);
    alert("mes: "+mes);
    alert("anio: "+anio);
    alert("hora: "+hora);
    alert("minutos: "+minutos);
    alert("segundos: "+segundos);*/
    
    segundos++;
     if (segundos == 60) {
        segundos = "00";
        minutos++;
        if (minutos == 60) {
            minutos = "00";
            hora++;
            if (hora == 24) {
              hora = "00";
            }
        }
    }
    
    if(hora<10 && hora>0){
        hora='0'+hora;
    }
    if(minutos<10 && minutos>0){
        minutos='0'+minutos;
    }
    if(segundos<10 && segundos>0){
        segundos='0'+segundos;
    }
    if(mes<10 && mes>0){
        mes='0'+mes;
    }
    if(dia<10 && dia>0){
        dia='0'+dia;
    }
    
    /*alert("dia: "+dia);
    alert("mes: "+mes);
    alert("anio: "+anio);
    alert("hora: "+hora);
    alert("minutos: "+minutos);
    alert("segundos: "+segundos);*/
    
    tiempoactual = anio + " " + mes + " " + dia+ " " + hora+":"+minutos+":"+segundos;
    
    if(document.getElementById(id_captura) != undefined){
        document.getElementById(id_captura).value = dia + "/" + mes + "/" + anio+ "-" + hora + ":" + minutos + ":" + segundos;
    }
    
    setTimeout("actualiza_reloj('"+id_captura+"','"+tiempoactual+"');",1000);
}

function calculadiasatn(iding,idegr,idres){
    var f1 = document.getElementById(iding).value;
    var f2 = document.getElementById(idegr).value;
    
    var aFecha1 = f1.split('-'); 
    var aFecha2 = f2.split('-'); 
    var fFecha1 = Date.UTC(aFecha1[0],aFecha1[1]-1,aFecha1[2]); 
    var fFecha2 = Date.UTC(aFecha2[0],aFecha2[1]-1,aFecha2[2]); 
    var dif = fFecha2 - fFecha1;
    //alert(dif);
    var dias = Math.floor(dif / (1000 * 60 * 60 * 24)); 
    
    //var dias = diafin - diainicio;
    document.getElementById(idres).value = dias;
}


function obtenfecha(feccomp,iding,idegr,idres){
    switch(feccomp){
        case "fecing":
            var fecingtemp2 = document.getElementById(iding).value;
            if(fecingtemp != fecingtemp2){
                cierra_cal();
                calculadiasatn(iding,idegr,idres);
            }else{
                setTimeout("obtenfecha('"+feccomp+"','"+iding+"','"+idegr+"','"+idres+"');",100);
            }
        break;
        case "fecegr":
            var fecegrtemp2 = document.getElementById(idegr).value;
            if(fecegrtemp != fecegrtemp2){
                cierra_cal();
                calculadiasatn(iding,idegr,idres);
            }else{
                setTimeout("obtenfecha('"+feccomp+"','"+iding+"','"+idegr+"','"+idres+"');",100);
            }
        break;
        case "fecingti":
            var fecingtitemp2 = document.getElementById(iding).value;
            if(fecingtitemp != fecingtitemp2){
                cierra_cal();
                calculadiasatn(iding,idegr,idres);
            }else{
                setTimeout("obtenfecha('"+feccomp+"','"+iding+"','"+idegr+"','"+idres+"');",100);
            }
        break;
        case "fecegrti":
            var fecegrtitemp2 = document.getElementById(idegr).value;
            if(fecegrtitemp != fecegrtitemp2){
                cierra_cal();
                calculadiasatn(iding,idegr,idres);
            }else{
                setTimeout("obtenfecha('"+feccomp+"','"+iding+"','"+idegr+"','"+idres+"');",100);
            }
        break;
    default:
    }
        /*alert("feccomp: "+feccomp);
        alert("iding: "+iding);
        alert("idegr: "+idegr);
        alert("idres: "+idres);
        alert("fecingtemp: "+fecingtemp);*/
}

function cierra_cal(){
    if(calendario_open == true){
        xc_cv(0);
        calendario_open = false;
    }
}

function obtenfechaactual(nodo){
    var script = "scripts/fechaactual.php";
    
    get_fechaactual(nodo,script);
}

function muestraservicios(id){
    nodo_popup = document.getElementById("resultadomultiples");
    var script = "scripts/muestraservicios.php?idatencion="+id;
    
    get_popup_informacion(nodo_popup,script);
}

function muestracauses(id){
    nodo_popup = document.getElementById("resultadomultiples");
    var script = "scripts/muestracauses.php?idatencion="+id;
    
    get_popup_informacion(nodo_popup,script);
}

function cerrar_resultadomultiples(){
    document.getElementById("resultadomultiples").innerHTML = "";
}

function redibuja_form(catalogo,ordenamiento){
    var nomtabla = "autotabla_"+catalogo;
    var tabla = document.getElementById(nomtabla);
    var i,j,nodo,row,col,colant,longifilas;
    var valuearray = [];
    var arraytmp = [];
    i=0;
    j=0;
    longifilas = tabla.rows.length;
    for(i=0;i<longifilas;i++){
        row = tabla.rows[i];
        for(j=0;j<2;j++){
            col = row.cells[j];
            if(col != undefined){
                nodo = col.innerHTML;
                if(nodo == ""){
                    nodo = "estatus";
                }
                arraytmp[j] = nodo;
            }else{
                arraytmp[j] = "";
            }
        }
        valuearray[i] = [arraytmp[0],arraytmp[1]];
        //alert("valuearray[0][0]: "+valuearray[0][0]+"\nvaluearray[0][1]: "+valuearray[0][1]);
        //alert("valuearray["+i+"][0]: "+valuearray[i][0]+"\nvaluearray["+i+"][1]: "+valuearray[i][1]);
    }

for(i=0;i<longifilas;i++){
    row = tabla.rows[i];
    for(j=0;j<2;j++){
        col = row.cells[j];
        if(col != undefined){
            //alert("1valuearray-pos("+i+")-["+[ordenamiento[i]]+"]["+j+"]: "+valuearray[ordenamiento[i]][j]);
            if(valuearray[ordenamiento[i]][j] != ""){
                if(valuearray[ordenamiento[i]][j] == "estatus"){
                    col.innerHTML = "";
                }else{
                    col.innerHTML = valuearray[ordenamiento[i]][j];
                }
            }else{
                //alert("antes de colspan");
                colant = row.cells[j-1];
                var attspan = document.createAttribute("colspan");
                attspan.value = "2";
                colant.setAttributeNode(attspan);
                row.deleteCell(1);
                //alert("despues de colspan");
            }
        }else{
            if(i>0){
                //alert("2valuearray-pos("+i+")-["+[ordenamiento[i]]+"]["+j+"]: "+valuearray[ordenamiento[i]][j]);
                if(valuearray[ordenamiento[i]][j] != ""){
                    colant = row.cells[j-1];
                    colant.removeAttribute("colspan");
                    col = document.createElement("td");
                    col.innerHTML = valuearray[ordenamiento[i]][j];
                    insertAfter(colant,col);
                }
            }
        }
    }
}

function insertAfter(e,i){ 
        if(e.nextSibling){ 
            e.parentNode.insertBefore(i,e.nextSibling); 
        } else { 
            e.parentNode.appendChild(i); 
        }
    }
//    nodo = document.getElementById(nodoresult);
//    guarda_form_insert(nodo,script,parametros,nomform);
}

function reordena_atencion(){
    var ordenamiento = [0,2,3,4,13,14,15,5,6,7,16,17,8,9,10,1,11,12];
    redibuja_form("atencion",ordenamiento);
    
}
//class="form-control"

function aniadeorden(familia,producto){
    
    if(familia == 2){
        document.getElementById("familia_idfamilia").value = 2;
    }else{
        document.getElementById("familia_idfamilia").value = 1;
    }
    document.getElementById("producto_idproducto").value = producto;
    document.getElementById("tipoorden_idtipoorden").value = 1;
    document.getElementById("porcion_idporcion").value = 1;
    //alert(document.getElementById("mesahidden").value);
    //if(document.getElementById("mesa_idmesa").value == ""){
    if(document.getElementById("mesahidden").value != ""){
        document.getElementById("mesa_idmesa").value = document.getElementById("mesahidden").value;
    }
    if(document.getElementById("clientehidden").value != ""){
        document.getElementById("cliente_idcliente").value = document.getElementById("clientehidden").value;
    }
    
    if(document.getElementById("usuariohidden").value != ""){
        document.getElementById("usuario_idusuario").value = document.getElementById("usuariohidden").value;
    }
    //}
    
    document.getElementById("sucursal_idsucursal").value = 1;
    
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
                    

                    //document.getElementById("divmenu").style.visibility = "visible";
                    //document.getElementById("div_main").style.float = "right";
                    
                    document.getElementById("inicio").value = timestamp;
                    document.getElementById("entregaaproximada").value = timestamp;
                    document.getElementById("horaentrega").value = timestamp;
                    
}

function guardamesa(){
    document.getElementById("mesahidden").value = document.getElementById("mesa_idmesa").value;
    //alert(document.getElementById("mesahidden").value);
}

function guardacliente(){
    document.getElementById("clientehidden").value = document.getElementById("cliente_idcliente").value;
    //alert(document.getElementById("mesahidden").value);
}


function cierraproduccion(catalogo,id){
    alert(catalogo);
    alert(id);
}

function iniciar_comanda(){
    document.getElementById("capa_mostrador").style.float = "left";
    animatedcollapse.hide('pizzeria');
    animatedcollapse.hide('cocina');
    animatedcollapse.hide('bebidas');
    animatedcollapse.hide('postres');
    document.getElementById("comandas_overlay").style.visibility = "visible";
}