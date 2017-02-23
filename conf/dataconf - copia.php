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


$keydb_enc = encrypt("sistrestfull", 19800619);
$keydb_enc1 = encrypt($keydb_enc, 19800619);
//$keydb_enc_dec = decrypt("rJqsrKKVqaWfpqWk", 19800619);

$localhost_enc = encrypt("localhost", $keydb_enc);
$userdb_enc = encrypt("softjit1_userest", $keydb_enc);
$pwddb_enc = encrypt("rest123", $keydb_enc);
$namedb_enc = encrypt("softjit1_restaurante", $keydb_enc);

echo '<br />';
echo $localhost_enc;
echo '<br />';
echo $userdb_enc;
echo '<br />';
echo $pwddb_enc;
echo '<br />';
echo $namedb_enc;
echo '<br />';
echo $keydb_enc1;
echo '<hr>';
echo $localhost;
echo '<br />';
echo $userdb;
echo '<br />';
echo $pwddb;
echo '<br />';
echo $namedb;
exit;
?>