<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>La Premier De Leon</title>
<style type="text/css">
<!--
.Estilo1 {font-size: 36px}
div.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
li.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoNormal {margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
-->
</style>
<script type="text/javascript" src="timepicker/ng_all.js"></script>
<script type="text/javascript" src="timepicker/ng_ui.js"></script>
<script type="text/javascript" src="timepicker/components/timepicker.js"></script>


</head>

<body>
<input type="text" id="timepicker_input" value="10:00 am" />



<script type="text/javascript">
ng.ready( function() {
    var tp = new ng.TimePicker({
        input: 'timepicker_input',  // the input field id
        start: '12:00 am',  // what's the first available hour
        end: '11:59 pm',  // what's the last avaliable hour
        top_hour: 12  // what's the top hour (in the clock face, 0 = midnight)
    });
});
</script>
<script type="text/javascript">
  function add(){
    var tot=document.getElementById("tot").value;
    tot=parseInt(tot,10);
    var i=tot+1;
    $('#bod').append(i+".   ");
    var s=$('<input/>').attr({type:'text',id:'timepicker_start'+i}).addClass('st').appendTo("#bod");
    var s1=$('<input/>').attr({type:'text',id:'timepicker_end'+i}).addClass('et').appendTo("#bod");
    $('#bod').append("  ");
    $('#timepicker_start'+i).timpicker({showLeadingZero: true, defaultTime: '', minutes:{interval:15}});
    $('#timepicker_end'+i).timpicker({showLeadingZero: true, defaultTime: '', minutes:{interval:15}});
    document.getElementById("tot").value=i;
  }
  $(document).ready(function(e) {
    $('#timepicker_start1').timpicker({showLeadingZero: true, defaultTime: '', minutes:{interval:15}});
    $('#timepicker_end1').timpicker({showLeadingZero: true, defaultTime: '', minutes:{interval:15}});
  });
</script>
</body>
</html>
