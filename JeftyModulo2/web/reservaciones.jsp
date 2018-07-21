<%-- 
    Document   : reservaciones
    Created on : 20/07/2018, 09:25:23 PM
    Author     : juana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="reservacionesApp">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Reservaciones || JeftyFood</title>
        <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
        <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Open+Sans|Raleway" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">

        <!-- Angular -->
        <script src="js/angular/angular.js"></script>
        <!-- SweetAlert -->
        <script src="js/sweetalert/sweetalert.js"></script>
    </head>
    <body ng-controller="reservacionesController">

        <!--top header-->
        <header id="home">
            <section class="top-nav hidden-xs">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="top-left">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>                                    
                                    <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="top-right">
                                <p>Ubicaci&oacute;n:<span>Blvrd Ojo de Agua</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--main-nav-->
            <div id="main-nav">
                <nav class="navbar">
                    <div class="container">
                        <div class="navbar-header">
                            <a href="#" class="navbar-brand">Mi Perfil</a>
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#ftheme">
                                <span class="sr-only">Toggle</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div class="navbar-collapse collapse" id="ftheme">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="">Inicio</a></li>
                                <li><a href="reservaciones.jsp">Reservaciones</a></li>                                
                                <li><a ng-click="logout()">Cerrar Sesion</a></li>                                 
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </header>

        <!--about-->
        <div id="about">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                        <div class="about-heading">
                            <h2>¡ BIENVENIDO {{ usuario.nomUsuario}} !</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--about-->
        <div id="empleados">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                        <div class="text-center">
                            <h1 class="title">TODAS LAS RESERVACIONES</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="padding-top: 20px;">
                <div class="row">
                    <div class="col-sm-4">
                        <input class="form-control" placeholder="Buscar Por Nombre" ng-model="nombre">
                    </div>
                </div>

                <br><br>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre Cliente</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Hora</th>
                            <th scope="col">Mesa</th>
                            <th scope="col">Comensales</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="reservacion in reservaciones">
                            <td>{{reservacion.id_reservacion}}</td>
                            <th>{{reservacion.nombreCliente}}</th>
                            <td>{{reservacion.fecha_llegada}}</td>
                            <td>{{reservacion.hora_llegada}}</td>
                            <td>{{reservacion.mesaArea}}</td>
                            <td>{{reservacion.no_comensales}}</td>
                            <td>
                                <button class="btn btn-default" ng-click="checkReservacion(reservacion)" data-toggle="modal" data-target="#modalEdit" >Check in</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!--client-->
        <div id="client">
            <div class="container">
                <div class="row"> 

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/client/client1.png" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/client/client2.png" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/client/client3.png" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/client/client4.png" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/client/client5.png" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/client/client6.png" alt="">
                    </div>
                </div>
            </div>
        </div>

        <!--footer-->
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="footer-heading">
                            <h3><span>Nosotros</span></h3>
                            <p>Cocina rica, hecha con mucha ilusión, para gente que le gusta comer y disfrutar cada bocado de la vida... Buscas un sitio íntimo para poder saborear con gusto y conversar de forma relajada. Pensando en ti creamos este espacio.</p>
                            <p>Somos un restaurante que hacemos todo desde el principio y de una forma muy personal, con dedicación y trabajo diario.</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="footer-heading">
                            <h3><span>&Uacute;ltimas</span> Novedades</h3>
                            <ul>
                                <li><a>Nuevos platillos</a></li>
                                <li><a>Nuevo equipo de trabajo</a></li>
                                <li><a>Mejoras para ti y tu familia</a></li>
                                <li><a>Pedidos y pagos en línea</a></li>
                                <li><a>Entregas a domicilio</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="footer-heading">
                            <h3><span>Siguenos</span> y Recomiendanos</h3>
                            <div class="insta">
                                <ul>
                                    <img src="images/footer/cen1.jpg" alt="">
                                    <img src="images/footer/comi1.jpg" alt="">
                                    <img src="images/footer/des1.jpg" alt="">
                                    <img src="images/footer/des2.jpg" alt="">
                                    <img src="images/footer/comi2.jpg" alt="">
                                    <img src="images/footer/comi1.png" alt="">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--bottom footer-->
        <div id="bottom-footer" class="hidden-xs">
            <div class="container">
                <div class="row">
                    <div class="footer-left">
                        <center>&copy; Jefty-Food. Todos los derechos reservados</center>
                        <div class="credits">
                            <!--Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.flexslider.js"></script>
        <script src="js/jquery.inview.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8HeI8o-c1NppZA-92oYlXakhDPYR7XMY"></script>
        <script src="js/script.js"></script>
        <script src="contactform/contactform.js"></script>

        <script src="js/views/reservaciones.js"></script>
    </body>
</html>
