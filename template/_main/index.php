<?php
if(!@session_start()){
    session_start();
    if($_SESSION['login']){
        header("Location ?accion=login");
    }
}
?>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Subsistema CAUSES <?php echo date("Y") ?></title>
    	<meta name="description" content="">
        <meta name="viewport" content="width=device-width">
<!-- 
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
-->
        <link rel="icon" type="image/gif" href="<?php echo $rutatemplate ?>images/iconsubsis.jpg?<?php echo time(); ?>" >
        <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/bootstrap.min.css?<?php echo time(); ?>">
        <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/font-awesome.css?<?php echo time(); ?>">
        <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/animate.css?<?php echo time(); ?>">
        <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/templatemo_misc.css?<?php echo time(); ?>">
        <link rel="stylesheet" href="<?php echo $rutatemplate ?>css/templatemo_style.css?<?php echo time(); ?>">
        <script src="<?php echo $rutatemplate ?>js/vendor/modernizr-2.6.1-respond-1.1.0.min.js?<?php echo time(); ?>"></script>
    </head>
    <body>
        <div class="site-main" id="sTop">
            <div class="site-header">
               <!-- <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="social-icons">
                                <li><a href="#" class="fa fa-facebook"></a></li>
                                <li><a href="#" class="fa fa-twitter"></a></li>
                                <li><a href="#" class="fa fa-dribbble"></a></li>
                                <li><a href="#" class="fa fa-linkedin"></a></li>
                            </ul>
                        </div>  <!--/.col-md-12 
                    </div> <!--/.row 
                </div>  /.container -->
                <div class="main-header">
                    <div class="container">
                        <div id="menu-wrapper">
                            <div class="row">
                                <div class="logo-wrapper col-md-2 col-sm-2">
                                    <h1>
                                        <a href="#">Serv.Esenciales</a>
                                    </h1>
                                </div> <!-- /.logo-wrapper -->
                                <div class="col-md-10 col-sm-10 main-menu text-right">
                                    <div class="toggle-menu visible-sm visible-xs"><i class="fa fa-bars"></i></div>
                                    <ul class="menu-first">
                                        <li class="active"><a href="#">Subsistema CAUSES</a></li>
                                        <li><a href="#causes">CAUSES</a></li>
                                        <li><a href="#estadisticas">Estadisticas</a></li>
                                        <li><a href="#contacto">Contacto</a></li>
                                    </ul>                                    
                                </div> <!-- /.main-menu -->
                            </div> <!-- /.row -->
                        </div> <!-- /#menu-wrapper -->                        
                    </div> <!-- /.container -->
                </div> <!-- /.main-header -->
            </div> <!-- /.site-header -->
            <div class="site-slider">
                <div class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <div class="overlay"></div>
                                <img src="<?php echo $rutatemplate ?>images/slide1.jpg?<?php echo time(); ?>" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>Departamento de Servicios Esenciales</h2>
                                    <p>Subsistema CAUSES <?php echo date("Y") ?></p>
                                    <form action="" method="POST">
                                        <input type="hidden" name="accion" id="accion" value="login">
                                        <input type="submit" class="slider-btn" value="Inicia Sesion">
                                    </form>
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="<?php echo $rutatemplate ?>images/slide2.jpg?<?php echo time(); ?>" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>Subsistema CAUSES <?php echo date("Y") ?></h2>
                                    <p>Departamento de Servicios Esenciales</p>
                                    <form action="" method="POST">
                                        <input type="hidden" name="accion" id="accion" value="login">
                                        <input type="submit" class="slider-btn" value="Inicia Sesion">
                                    </form>
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="<?php echo $rutatemplate ?>images/slide3.jpg?<?php echo time(); ?>" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>Departamento de Servicios Esenciales</h2>
                                    <p>Subsistema CAUSES <?php echo date("Y") ?></p>
                                    <form action="" method="POST">
                                        <input type="hidden" name="accion" id="accion" value="login">
                                        <input type="submit" class="slider-btn" value="Inicia Sesion">
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.flexslider -->
                </div> <!-- /.slider -->
            </div> <!-- /.site-slider -->
        </div> <!-- /.site-main -->


        <div class="content-section" id="causes">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>Our Portfolio</h2>
                        <p>What we have done so far</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="<?php echo $rutatemplate ?>images/gallery/p1.jpg?<?php echo time(); ?>" alt="">
                            <div class="portfolio-overlay">
                                <h3>New Street</h3>
                                <p>Asperiores commodi illo fuga perferendis dolore repellendus sapiente ipsum.</p>
                                <a href="<?php echo $rutatemplate ?>images/gallery/p1.jpg?<?php echo time(); ?>" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="<?php echo $rutatemplate ?>images/gallery/p2.jpg?<?php echo time(); ?>" alt="">
                            <div class="portfolio-overlay">
                                <h3>Floating</h3>
                                <p>Asperiores commodi illo fuga perferendis dolore repellendus sapiente ipsum.</p>
                                <a href="<?php echo $rutatemplate ?>images/gallery/p2.jpg?<?php echo time(); ?>" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="<?php echo $rutatemplate ?>images/gallery/p7.jpg?<?php echo time(); ?>" alt="">
                            <div class="portfolio-overlay">
                                <h3>Urban Life</h3>
                                <p>Asperiores commodi illo fuga perferendis dolore repellendus sapiente ipsum.</p>
                                <a href="<?php echo $rutatemplate ?>images/gallery/p7.jpg?<?php echo time(); ?>" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="<?php echo $rutatemplate ?>images/gallery/p8.jpg?<?php echo time(); ?>" alt="">
                            <div class="portfolio-overlay">
                                <h3>Transport</h3>
                                <p>Asperiores commodi illo fuga perferendis dolore repellendus sapiente ipsum.</p>
                                <a href="<?php echo $rutatemplate ?>images/gallery/p8.jpg?<?php echo time(); ?>" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="<?php echo $rutatemplate ?>images/gallery/p3.jpg?<?php echo time(); ?>" alt="">
                            <div class="portfolio-overlay">
                                <h3>Digital Age</h3>
                                <p>Asperiores commodi illo fuga perferendis dolore repellendus sapiente ipsum.</p>
                                <a href="<?php echo $rutatemplate ?>images/gallery/p3.jpg?<?php echo time(); ?>" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="<?php echo $rutatemplate ?>images/gallery/p4.jpg?<?php echo time(); ?>" alt="">
                            <div class="portfolio-overlay">
                                <h3>Horizon</h3>
                                <p>Asperiores commodi illo fuga perferendis dolore repellendus sapiente ipsum.</p>
                                <a href="<?php echo $rutatemplate ?>images/gallery/p4.jpg?<?php echo time(); ?>" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="<?php echo $rutatemplate ?>images/gallery/p5.jpg?<?php echo time(); ?>" alt="">
                            <div class="portfolio-overlay">
                                <h3>Aqua City</h3>
                                <p>Asperiores commodi illo fuga perferendis dolore repellendus sapiente ipsum.</p>
                                <a href="<?php echo $rutatemplate ?>images/gallery/p5.jpg?<?php echo time(); ?>" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="<?php echo $rutatemplate ?>images/gallery/p6.jpg?<?php echo time(); ?>" alt="">
                            <div class="portfolio-overlay">
                                <h3>Path Finder</h3>
                                <p>Asperiores commodi illo fuga perferendis dolore repellendus sapiente ipsum.</p>
                                <a href="<?php echo $rutatemplate ?>images/gallery/p6.jpg?<?php echo time(); ?>" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#portfolio -->




        <div class="content-section" id="estadisticas">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>Our Team</h2>
                        <p>Meet our people and about our company</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="<?php echo $rutatemplate ?>images/member1.jpg?<?php echo time(); ?>" alt="">
                            <div class="team-overlay">
                                <h3>Tracy</h3>
                                <span>Designer</span>
                                <ul class="social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-linkedin"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="<?php echo $rutatemplate ?>images/member2.jpg?<?php echo time(); ?>" alt="">
                            <div class="team-overlay">
                                <h3>Mary</h3>
                                <span>Developer</span>
                                <ul class="social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-linkedin"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="<?php echo $rutatemplate ?>images/member3.jpg?<?php echo time(); ?>" alt="">
                            <div class="team-overlay">
                                <h3>Julia</h3>
                                <span>Director</span>
                                <ul class="social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-linkedin"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="<?php echo $rutatemplate ?>images/member4.jpg?<?php echo time(); ?>" alt="">
                            <div class="team-overlay">
                                <h3>Linda</h3>
                                <span>Chief Executive</span>
                                <ul class="social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-linkedin"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="skills-heading">
                            <h3 class="skills-title">Our skills on web design</h3>
                            <p class="small-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div> <!-- /.col-md-12 -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="col-md-8 col-sm-6">
                        <p>Aliquam faucibus in dolor sed vestibulum. Sed adipiscing malesuada luctus. Morbi tincidunt, tellus scelerisque scelerisque scelerisque, sapien dui pretium augue, at consectetur sapien tellus vitae nunc. Ut vitae metus quis nulla cursus adipiscing pretium vel dolor. Fusce lacinia accumsan arcu, quis porttitor nisi tincidunt ut. <br><br>
						Etiam tincidunt, magna eu elementum tristique, sapien nisl venenatis lacus, nec sagittis lectus dui eget lorem. Donec in tempus mi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin laoreet ac quam et volutpat. Aenean egestas interdum dolor, et mollis lectus consequat a.<br><br>
						Nunc malesuada nunc eget nunc sollicitudin posuere. Maecenas vitae tortor quis odio hendrerit sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris ullamcorper, felis sit amet gravida malesuada, nisi sem rhoncus massa, non tempor est erat sit amet diam.<!-- spacing for mobile viewing --><br><br>
						</p>
                    </div> <!-- /.col-md-8 -->
                    <div class="col-md-4 col-sm-6">
                        <ul class="progess-bars">
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">Photoshop 90%</div>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">HTML 75%</div>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="68" aria-valuemin="0" aria-valuemax="100" style="width: 68%;">WordPress 68%</div>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%;">Marketing 95%</div>
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.col-md-4 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#our-team -->




        <div class="content-section" id="contacto">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>Contact Us</h2>
                        <p>Feel free to send a message</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="col-md-12">
                       <div class="googlemap-wrapper">
                            <div id="map_canvas" class="map-canvas"></div>
                        </div> <!-- /.googlemap-wrapper -->
                    </div> <!-- /.col-md-12 -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="col-md-7 col-sm-6">
                        <p><a rel="nofollow" href="http://www.templatemo.com/tm-406-flex" target="_parent">Flex</a> is free responsive HTML5 template by <span class="blue">template</span><span class="green">mo</span> that can be used for any commercial or personal website. Slider images and portfolio images are from <a rel="nofollow" href="http://unsplash.com">Unsplash</a> website. Duis ullamcorper tortor tellus. Ut diam libero, ultricies non augue a, mollis congue risus. Fusce a quam eget nisi luctus imperdiet. Aenean semper erat neque. Nunc et scelerisque nunc, in adipiscing magna. Phasellus in erat non tellus molestie sagittis sed a justo. Nam vehicula volutpat nibh, in posuere dolor dictum sit amet.<br><br>
				    Consectetur quod at aperiam corporis totam. Nesciunt minima laborum sapiente totam facere unde est cum quia. Hic, suscipit, praesentium earum quod ea distinctio impedit ullam deserunt minus dolore quibusdam quis saepe aliquam doloribus voluptatibus eum excepturi.
                    	</p>
                        <ul class="contact-info">
                            <li>Phone: 010-080-0180</li>
                            <li>Email: <a href="mailto:info@company.com">info@company.com</a></li>
                            <li>Address: 123 Premium Studio, Thamine Street, Digital Estate</li>
                        </ul>
                        <!-- spacing for mobile viewing --><br><br>
                    </div> <!-- /.col-md-7 -->
                    <div class="col-md-5 col-sm-6">
                        <div class="contact-form">
                            <?php include("seccion/contacto/index.php"); ?>
                        </div> <!-- /.contact-form -->
                    </div> <!-- /.col-md-5 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#contact -->
            
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-xs-12 text-left">
                        <span>
                            <p> &copy; 2016. Diseñado para Servicios Esenciales | REPSSEG | Visita: <a href="http://seguropopular.guanajuato.gob.mx" class="external" target="_blank">Seguro Popular Guanajuato</a></p>
                        </span>
                  </div> <!-- /.text-center -->
                    <div class="col-md-4 hidden-xs text-right">
                        <a href="#top" id="go-top">Ve arriba</a>
                    </div> <!-- /.text-center -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#footer -->
        
        <script src="<?php echo $rutatemplate ?>js/vendor/jquery-1.11.0.min.js?<?php echo time(); ?>"></script>
        <script>window.jQuery || document.write('<script src="<?php echo $rutatemplate ?>js/vendor/jquery-1.11.0.min.js?<?php echo time(); ?>"><\/script>')</script>
        <script src="<?php echo $rutatemplate ?>js/bootstrap.js?<?php echo time(); ?>"></script>
        <script src="<?php echo $rutatemplate ?>js/plugins.js?<?php echo time(); ?>"></script>
        <script src="<?php echo $rutatemplate ?>js/main.js?<?php echo time(); ?>"></script>

        <!-- Google Map -->
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script src="<?php echo $rutatemplate ?>js/vendor/jquery.gmap3.min.js?<?php echo time(); ?>"></script>
        
        <!-- Google Map Init-->
        <script type="text/javascript">
            jQuery(function($){
                $('#map_canvas').gmap3({
                    marker:{
                        address: '20.9989867,-101.2859235' 
                    },
                        map:{
                        options:{
                        zoom: 15,
                        scrollwheel: false,
                        streetViewControl : true
                        }
                    }
                });
            });
        </script>
    </body>
</html>