<?php
$file = fopen("install/datainst.php", "r") or exit("Favor de instalar primero la aplicacion!");
while(!feof($file))
{
    $localhost = fgets($file);
    $userdb = fgets($file);
    $pwddb = fgets($file);
    $namedb = fgets($file);
    $keydec = fgets($file);
}
fclose($file);
$keydb = decrypt($keydec, 19800619);
$localhost = decrypt($localhost, $keydb);
$userdb = decrypt($userdb, $keydb);
$pwddb = decrypt($pwddb, $keydb);
$namedb = decrypt($namedb, $keydb);
?>