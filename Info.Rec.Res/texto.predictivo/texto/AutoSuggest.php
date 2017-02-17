<html>
<head>
<title>oki</title>

<script type="text/javascript" src="js/AutoSuggest.js?<?php echo time(); ?>" charset="utf-8"></script>

<link rel="stylesheet" href="css/autosuggest.css?<?php echo time(); ?>" type="text/css" media="screen" charset="utf-8" />

<style type="text/css">

	body {
		font-family: Lucida Grande, Arial, sans-serif;
		font-size: 10px;
		text-align: center;
		margin: 0;
		padding: 0;
	}
	
	table
	{
		border: 1px;
		background-color: #999;
		font-size: 10px;
	}
	tr
	{
		vertical-align: top;
	}
	th
	{
		text-align: left;
		background-color: #ccc;
	}
	th,
	td
	{
		padding: 2px;
		font-family: Lucida Grande, Arial, sans-serif;
		font-size: 1.2em;
	}
	td
	{
		background-color: #fff;
	}
	
	a {
		font-weight: bold;
		text-decoration: none;
		color: #f30;
	}
	
	a:hover {
		color: #fff;
		background-color: #f30; 
	}
	
	#wrapper {
		width: 600px;
		margin: 10px auto;
		text-align: left;
	}
	
	#content {
		font-size: 1.2em;
		line-height: 1.8em;
	}
	
	#content h1 {
		font-size: 1.6em;
		border-bottom: 1px solid #ccc;
		padding: 5px 0 5px 0;
	}

	#content h2 {
		border-top: 1px solid #ddd;
		padding-top: 5px;
		font-size: 1.2em;
		margin-top: 3em;
	}
	
	#content h3 {
		font-size: 1.1em;
		margin-top: 3em;
	}

	small
	{
		color: #999;
	}






	label
	{
		font-weight: bold;
	}

	
	
	
	/*
	the parent element of an autosuggest input should have a relative position
	*/
	.asholder
	{
		position: relative;
	}






	
</style>


</head>
<body>
        <small style="float:right">Hidden ID Field: <input type="text" id="testid" value="" style="font-size: 10px; width: 20px;" disabled="disabled" /></small>
	<label for="testinput">Person 1</label>
	<input style="width: 200px" type="text" id="testinput" value="" /> 
<br /><br /><br />
	<label for="testinput_xml">Person 2 & Address</label>
	<input type="text" id="testinput_xml" value="" style="width:300px" /> 
	

<script type="text/javascript">
	var options = {
		script:"query_text.php?json=true&limit=20&",
		varname:"input",
		json:true,
		shownoresults:false,
		maxresults:6,
		callback: function (obj) { document.getElementById('testid').value = obj.id; }
	};
	var as_json = new bsn.AutoSuggest('testinput', options);
	
	
	var options_xml = {
		script: function (input) { return "query_text.php?input="+input+"&testid="+document.getElementById('testid').value; },
		varname:"input"
	};
	var as_xml = new bsn.AutoSuggest('testinput_xml', options_xml);
</script>

</body>
