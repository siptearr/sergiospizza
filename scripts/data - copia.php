<?php
function encrypt($string, $key) {
   $result = '';
   for($i=0; $i<strlen($string); $i++) {
      $char = substr($string, $i, 1);
      $keychar = substr($key, ($i % strlen($key))-1, 1);
      $char = chr(ord($char)+ord($keychar));
      $result.=$char;
   }
   return base64_encode($result);
}

function decrypt($string, $key) {
   $result = '';
   $string = base64_decode($string);
   for($i=0; $i<strlen($string); $i++) {
      $char = substr($string, $i, 1);
      $keychar = substr($key, ($i % strlen($key))-1, 1);
      $char = chr(ord($char)-ord($keychar));
      $result.=$char;
   }
   return $result;
}

$key = decrypt("aWppY2Zm",19061980);
echo $key;
echo "<br />localhost: ".decrypt("oaickZ+YpKyt",$key);
echo "<br />userdb: ".decrypt("qJ6rppijpQ==",$key);
echo "<br />pwddb: ".decrypt("qJ6rppijpWtsZA==",$key);
echo "<br />namedb: ".decrypt("qJ6rppijpQ==",$key);


echo "<br />localhost: ".encrypt("localhost",$key);
echo "<br />userdb: ".encrypt("servesp",$key);
echo "<br />pwddb: ".encrypt("servesp234",$key);
echo "<br />namedb: ".encrypt("servesp",$key);

?>