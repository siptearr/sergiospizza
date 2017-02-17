function muestra_recpwdForm(){
    document.getElementById("recpwdForm").style.visibility = "visible";
    $.blockUI({ message: $('#recpwdForm'),
                fadeIn: 700, 
                fadeOut: 700, 
                showOverlay: true, 
                centerY: true, 
                css: { 
                    border: 'none', 
                    padding: '5px', 
                    backgroundColor: '#2EA8B1', 
                    '-webkit-border-radius': '10px', 
                    '-moz-border-radius': '10px', 
                    opacity: 1, 
                    color: '#000'
                }
            });
}

function cierrarecpwdForm(){
    $.unblockUI();
    document.getElementById("recpwdForm").style.visibility = "hidden";
    $('#usuario').val('');
    $('#mensajerecpwd').html('');
}

function limpia_resultadosrecpwd(){
    document.getElementById('mensajerecpwd').innerHTML = "";
    document.getElementById("aceptarecpwd").disabled = false;
}

function pwdrecuperacion(){
    document.getElementById("aceptarecpwd").disabled = true;
    var usuario = document.getElementById("usuario").value;
    
    if(usuario != ""){
            nodo_recpwd = document.getElementById("mensajerecpwd");
            var script_recpwd = "scripts/recuperapassword.php?usuario="+usuario;
            rec_pwd(nodo_recpwd,script_recpwd,usuario);
        }else{
            document.getElementById("mensajerecpwd").innerHTML = "Debes de escribir un nombre de usuario";
            setTimeout(limpia_resultadosrecpwd,2000);
        }
}