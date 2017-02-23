<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
</script>
<script>
$(document).ready(function(){
  $("#hide").click(function(){
    $("#holas").hide("slow");
  });
  $("#show").click(function(){
    $("#holas").show("slow");
  });
});
function esconde(){
    $("#holas").hide();
  }
</script>
<style type="text/css"> 
div.escondite
{
background-color:#e5eecc;
padding:7px;
border:solid 1px #c3c3c3;
}
</style>
</head>
<body onload="javascript:esconde();">
<button id="show">Show</button>
<div id="holas" class="escondite" >
<p>This is a paragraph with little content.</p>
<p>This is another small paragraph.</p>
<button id="hide">Hide</button>
</div>
</body>
</html>