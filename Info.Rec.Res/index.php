<?php
@$text1 = $_POST["text1"];
@$text2 = $_POST["text2"];
@$text3 = $_POST["text3"];
?>
<form id="form1" action="" method="POST">
<input type="hidden" id="text1" name="text1" value="text1" />
	<div></form><form  id="form2" action="" method="POST">
    	<input type="hidden" id="text3" name="text3" value="text3" />
        <input type="submit" value="form2" />
	</form><form></div>
    <input type="hidden" id="text2" name="text2" value="text2" />
    <input type="submit" value="form1" />
</form>
<?php
echo "<br />";
echo "Resultados:";
echo "<br />";
echo "Text1: ".$text1;
echo "<br />";
echo "Text2: ".$text2;
echo "<br />";
echo "Text3: ".$text3;
?>