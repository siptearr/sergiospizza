<?php
if ( !class_exists( "conectabd" ) ) 
{ 
	class conectabd
	{
		var $db_user;
		var $db_pass;
		var $db_host;	
		var $db_name;
		function asignabd()
		{
	//Pruebas en el tres
			$this->db_user = 'softjitc_premier';
			$this->db_pass = 'lapremier123';
			$this->db_host = 'localhost';
			$this->db_name = 'softjitc_lapremier';
			//$this->db_name = 'softjitc_lapremier';' 
  		}

 	}
}
?>
