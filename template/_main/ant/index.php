<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subsistema CAUSES <?php echo date("Y") ?></title>
<link rel="icon" type="image/gif" href="<?php echo $rutatemplate ?>images/iconsubsis.jpg" >
<link rel="stylesheet" type="text/css" href="<?php echo $rutatemplate ?>style.css?<?php echo time(); ?>"/>
<link href="<?php echo $rutatemplate ?>css/font-awesome.min.css?<?php echo time(); ?>" rel="stylesheet" media="screen">
<link href="<?php echo $rutatemplate ?>css/responsive.css?<?php echo time(); ?>" rel="stylesheet" media="screen" type="text/css"/>
<link rel="stylesheet" href="<?php echo $rutatemplate ?>sidr/stylesheets/jquery.sidr.dark.css?<?php echo time(); ?>">
<script src="<?php echo $rutatemplate ?>js/jquery.min.js?<?php echo time(); ?>"></script>
<script src="<?php echo $rutatemplate ?>sidr/jquery.sidr.min.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="<?php echo $rutatemplate ?>js/smoothscroll.js?<?php echo time(); ?>"></script>
<script type="text/javascript" src="<?php echo $rutatemplate ?>js/jquery.nicescroll.min.js?<?php echo time(); ?>"></script>
<script type="text/javascript">		
			 $(document).ready(function() {
				$('#simple-menu').sidr({
				side: 'right'
			});
			});
			$('.responsive-menu-button').sidr({
				name: 'sidr-main',
				source: '#navigation',
				side: 'right'

				});
			$(document).ready(
			function() {
			$("html").niceScroll({cursorborder:"0px solid #fff",cursorwidth:"5px",scrollspeed:"70"});
			}
			);
</script>
</head>

<body>
	<div class="header">
    	<div class="container">
    		<div class="logo-menu">
        		<div class="logo">
            		<h1><a href="#">Subsistema Causes</a></h1>
            	</div>
                <!--<a id="simple-menu" href="#sidr">Toggle menu</a>-->
                <div id="mobile-header">
<a class="responsive-menu-button" href="#"><img src="<?php echo $rutatemplate ?>images/11.png?<?php echo time(); ?>"/></a>
</div>
            	<div class="menu" id="navigation">
            		<ul>
                    	<li><a href="#">Inicio</a></li>
                        <li><a href="#features">Servicios Esenciales</a></li>
                        <li><a href="#stories">Causes</a></li>
                        <li><a href="#contact">Estadisticos</a></li>
                    </ul>
            	</div>
        	</div>
        </div>
    </div>
    
    <div class="banner">
    	<div class="container">
        	<div class="header-text">
            	<p class="big-text">Bienvenido al SubSistema Causes <?php echo date("Y") ?></p>
                <h2>Extant Your Creative Thoughts</h2>
                <p class="small-text">Extant is a free html5 template designed by <a href="www.html5layouts.com">HTML5 Layouts</a> and released under common creative licence 3.0</p>
                <div class="button-section">
                	<ul>
                    	<li><a href="#" class="top-button white">Learn More</a></li>
                        <li><a href="#" class="top-button green">Get Started</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div class="color-border">
    </div>
    
    <div class="desc">
    	<div class="container">
        	<h2>Extant Template Is Responsive</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in. Curabitur ut augue facilisis leo malesuada consequat.</p>
        </div>
    </div>
    
    <div class="features" id="features">
    	<div class="container">
        	<h3 class="text-head">Features Of Extant</h3>
        	<div class="features-section">
                <ul>
                	<li>
                    	<div class="feature-icon icon1"></div>
                     	<h4>Creative Design</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>
                     </li>
                     <li>
                    	<div class="feature-icon icon2"></div>
                     	<h4>Save Your Time</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>
                     </li>
                     <li>
                    	<div class="feature-icon icon3"></div>
                     	<h4>Fully Customization</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>
                     </li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="stories" id="stories">
    	<div class="container">
        	<h3 class="text-head">Stories Of Extant</h3>
            <p class="box-desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>
        	<div class="stories-section">
            	<ul>
                	<li>
                    	<a href="#">
                    	<div class="story-img"><img src="<?php echo $rutatemplate ?>images/story1.png?<?php echo time(); ?>"/></div>
                        	<div class="story-box">
                            	<h4>This is Extant</h4>
                        		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>
                        		
                            </div>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                    	<div class="story-img"><img src="<?php echo $rutatemplate ?>images/story2.png?<?php echo time(); ?>"/></div>
                        	<div class="story-box">
                            	<h4>This is Awesome</h4>
                        		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>
                        		
                            </div>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                    	<div class="story-img"><img src="<?php echo $rutatemplate ?>images/story3.png?<?php echo time(); ?>"/></div>
                        	<div class="story-box">
                            	<h4>This is Mind-blowing</h4>
                        		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>
                        		
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
   	
    <div class="contact" id="contact">
    	<div class="container">
        	<h3 class="text-head">Contact At Extant</h3>
            <p class="box-desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>
            	<div class="contact-section">
            		
                		<form>
                    		<input type="text" name="Name" placeholder="Name" />
                        	<input type="email" name="email" placeholder="Email"/>
                        	<textarea placeholder="Message" rows="6"></textarea>
                        	<button type="submit" class="submit">Send Message</button>
                   		</form>
                	
            	</div>
        </div>
    </div>
    <div class="color-border">
    </div>
    <div class="footer">
        	<div class="container">
            	<div class="infooter">
                    <p class="copyright">Copyright REPSSEG by Servicios Esenciales en Salud | Visita <a href="http://seguropopular.guanajuato.gob.mx/" target="_blank">Seguro Popular Guanajuato</a></p>
            	</div>
            </div>
        </div>
</body>
</html>
