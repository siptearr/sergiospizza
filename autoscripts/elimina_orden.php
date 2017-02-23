<?php
    $idregistro = $_GET["idregistro"];
    $catalogo = $_GET["catalogo"];
    
    $sql1 = "update ".$catalogo." set estatus='inactivo' where id".$catalogo."=".$idregistro;
    $conn = mysql_connect('localhost', 'softjit1_userest', 'rest123');
    mysql_select_db('softjit1_restaurante', $conn);
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo 'orden*correcto*'.$idregistro;
    }else{
        echo 'orden*incorrecto';
    }
    mysql_close($conn);
?>