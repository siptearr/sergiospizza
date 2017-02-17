<?php
$dir = "../autoscripts/"; 
$handle = opendir($dir); 

while($file=readdir($handle)){
	if (is_file($dir.$file)){
		unlink($dir.$file);
	}
}
echo 'Depuracion de autoscripts completa';

?>


