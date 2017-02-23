<?php
$host ="tcp:cqjq9os5al.database.windows.net,1433"; 
$username ="rickcloud_root@cqjq9os5al";
$password ="S0p1k1r198";
$database ="rickcloud_db";

mssql_connect($host, $username, $password);
mssql_select_db($database);

$query ="insert into rickcloud.TodoItem(text,complete) values('Hola Karlita Hermosa 2";
$result =mssql_query($query);

echo "insercion realizada: ".$result;



	
/*
$serverName = "tcp:cqjq9os5al.database.windows.net,1433";
$uid = "rickcloud_root@cqjq9os5al";
$pwd = "S0p1k1r198";
$connectionInfo = array( "UID"=>$uid,
                         "PWD"=>$pwd,
                         "Database"=>"rickcloud_db");
$conn = sqlsrv_connect( $serverName, $connectionInfo);
if( $conn === false )
{
     echo "Unable to connect.</br>";
     die( print_r( sqlsrv_errors(), true));
}
$tsql = "insert into rickcloud.TodoItem(text,complete) values('Hola Karlita Hermosa',0)";
$stmt = sqlsrv_query( $conn, $tsql);
if( $stmt === false )
{
     echo "Error in executing query.</br>";
     die( print_r( sqlsrv_errors(), true));
}

echo "se inserto el valor en la BD: ".$stmt;


sqlsrv_free_stmt( $stmt);
sqlsrv_close( $conn);

/*$i=0;
while($row=sqlsrv_fetch_array($stmt)){
echo "columna: ".$i." valor: ".$row["text"]."</br>";
$i++;
}*/
  
  
?>