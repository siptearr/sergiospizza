<?php
    $idtransaccion = $_POST["idtransaccion"];
    $transaccion = $_POST["transaccion"];
    $tipovalores = $_POST["tipovalores"];
    $valores = $_POST["nombrevalores"];
    $serializa = "";
    $nombresvalores = "";
    $i=0;
    $arreglotipovalores = explode("*",$tipovalores);
    $arreglovalores = explode("*",$valores);
    $arreglotransaccion = explode("*",$transaccion);
    $tamanoarreglovalores = count($arreglovalores);
    
    while($i<$tamanoarreglovalores){
        switch(substr($arreglotipovalores[$i],0,3)){
        case 'int':
            $serializa .= $_POST[$arreglovalores[$i]].',';
        break;
        case 'var':
            $serializa .= "'".utf8_encode($_POST[$arreglovalores[$i]])."',";
        break;
        case 'dat':
            $serializa .= "'".$_POST[$arreglovalores[$i]]."',";
        break;
        case 'tim':
            $serializa .= "'".$_POST[$arreglovalores[$i]]."',";
        break;
        default:
            $serializa .= "'".utf8_encode($_POST[$arreglovalores[$i]])."',";
        }
        $nombresvalores .= $arreglovalores[$i].',';
        $i++;
    } 
    $nombresvalores = substr($nombresvalores,0,strlen($nombresvalores)-1);
    $serializa = substr($serializa,0,strlen($serializa)-1);
    
    $sql1 = $arreglotransaccion[0].$nombresvalores.$arreglotransaccion[1].$serializa.$arreglotransaccion[2];
    $conn = mysql_connect('localhost', 'softjit1_userest', 'rest123');
    mysql_select_db('softjit1_restaurante', $conn);
    $rs1 = mysql_query($sql1,$conn);
    if($rs1){
        echo 'orden*correcto*'.mysql_insert_id();
    }else{
        echo 'orden*incorrecto';
    }
    mysql_close($conn);
?>