<!DOCTYPE html>
<html lang="en" ng-app="usuarioApp">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Cliente || JeftyFood</title>
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

    <body id="top" data-spy="scroll" ng-controller="usuarioController">

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
                                <li><a href="#">Inicio</a></li>                                
                                <li><a href="" ng-if="tipoOrden.tipo === 'Individual'" ng-click="verCarrito()">Mi Carrito</a></li>
                                <li><a href="" ng-if="tipoOrden.tipo === 'Grupal'" ng-click="verCarritoPaquete()">Mi Carrito</a></li>
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

            <!--about wrapper left-->
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 hidden-sm col-md-5">
                        <div class="about-left">
                            <img src="images/about/equipo.jpg" alt="">
                        </div>
                    </div>

                    <!--about wrapper right-->
                    <div class="col-xs-12 col-md-7">
                        <div class="about-right">
                            <div class="about-right-heading">
                                <h2 style="padding-top: 25px;">Gracias por elegirnos y tener tu cuenta con nosotros,
                                    a contuniaci&oacute;n podr&aacute;s seleccionar tu tipo de orden y comenzar a realizar tu orden.</h2>
                            </div>

                            <div class="" style="padding-bottom: 10px;">
                                <div class="about-right-wrapper">
                                    <h3>Para comenzar tu pedido selecciona
                                        el tipo de orden</h3>
                                    <div class="form-group">
                                        <select ng-model="tipoOrden.tipo" class="form-control">
                                            <option value="Individual">Individual</option>
                                            <option value="Grupal">Grupal</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="" style="padding-bottom: 10px;" ng-if="tipoOrden.tipo">
                                <div class="about-right-wrapper">
                                    <a>
                                        <h3 ng-if="tipoOrden.tipo === 'Individual'" ng-click="getPlatillos()">Ver los platillos individuales.</h3>
                                        <h3 ng-if="tipoOrden.tipo === 'Grupal'" ng-click="getPaquetes()">Ver los paquetes.</h3>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--PLATILOS-->
        <div id="portfolio" ng-if="platillos.length > 0 && tipoOrden.tipo === 'Individual'">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                        <div class="portfolio-heading">
                            <h2>Platillos Individuales</h2>
                            <p>Aqu&iacute; podr&aacute;s seleccionar tus platillos que se irán agregando a tu carrito.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="portfolio-thumbnail">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-3" ng-repeat="platillo in platillos">
                            <div class="item" style="margin: 5px;">
                                <%-- Aqui se cambiaria la ruta de los platillos
                                    si en la base se registra el nombre o la ruta 
                                    solo podrias src="{{platillo.ruta}}" o src="images/platillo/{{platillo.ruta}}"
                                --%>
                                <img src="images/portfolio/arrachera.jpg" alt="">
                                <div class="caption">
                                    <i class="fa fa-shopping-cart" aria-hidden="true" ng-click="agregarOrden(platillo)"></i>
                                    <p>{{ platillo.nombre}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--PAQUETES-->
        <div id="portfolio" ng-if="paquetes.length > 0 && tipoOrden.tipo === 'Grupal'">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                        <div class="portfolio-heading">
                            <h2>Paquetes Grupales</h2>
                            <p>Aqu&iacute; podr&aacute;s seleccionar tus paquetes que se irán agregando a tu carrito.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="portfolio-thumbnail">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-3" ng-repeat="paquete in paquetes">
                            <div class="item" style="margin: 5px;">
                                <%-- Aqui se cambiaria la ruta de los platillos
                                    si en la base se registra el nombre o la ruta 
                                    solo podrias src="{{platillo.ruta}}" o src="images/platillo/{{platillo.ruta}}"
                                --%>
                                <img src="images/portfolio/arrachera.jpg" alt="">
                                <div class="caption">
                                    <i class="fa fa-shopping-cart" aria-hidden="true" ng-click="agregarOrdenPaquete(paquete)" data-toggle="modal" data-target="#exampleModalCenter"></i>
                                    <p>{{ paquete.nombre}} - Personas: {{ paquete.cantidadPersonas}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Paquete -->
        <div style="padding-top: 150px;" class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="exampleModalCenterTitle">Comprar Paquete {{paquete.nombre}}</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>Platillo</label>
                                <input disabled type="text" class="form-control" ng-model="paquete.platillo">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Cantidad</label>
                                <input disabled type="text" class="form-control" ng-model="paquete.cantidadPlatillo">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Bebida</label>
                                <input disabled type="text" class="form-control" ng-model="paquete.bebida">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Cantidad</label>
                                <input disabled type="text" class="form-control" ng-model="paquete.cantidadBebida">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Postre</label>
                                <input disabled type="text" class="form-control" ng-model="paquete.postre">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Cantidad</label>
                                <input disabled type="text" class="form-control" ng-model="paquete.cantidadPostre">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Cantida Personas</label>
                                <input disabled type="text" class="form-control" ng-model="paquete.cantidadPersonas">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Costo</label>
                                <input disabled type="text" class="form-control" ng-model="paquete.costo">
                            </div>
                            <form class="contactForm col-sm-12" style="padding 10px;">
                                <label>Seleccione tipo de pago</label>
                                <select ng-model="tipopago" id="tipopago" class="form-control">
                                    <option value="credito">Tarjeta Credito</option>
                                    <option value="prepago">Tarjeta Prepago</option>
                                </select>
                                <div class="form-group" style="margin-top: 20px;" ng-if="tipopago">
                                    <label>Inrese numero de tarjeta de {{tipopago}}</label>
                                    <input type="number" class="form-control" id="saldoTarjeta" placeholder="Numero de tarjeta">
                                </div>
                                <button style="margin-top: 20px;" class="btn btn-default" ng-click="getSaldoTarjeta();">Comprobar Saldo</button>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" ng-if="verificacionTarjeta" ng-click="comprarPaquete()">Pagar Paquete</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- MESAS -->
        <div id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                        <div class="portfolio-heading">
                            <h2>Mesas Disponibles</h2>
                            <p>Puedes apartar una mesa.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container row">
                <div class="col-xs-6 col-md-3 text-center" ng-repeat="mesa in mesas" >
                    <div class="thumbnail text-center" style="padding: 20px; background-color: #f5f5f5;">
                        <h2>{{ mesa.area}}</h2>
                        <h4 ng-if="mesa.estado === 'Reservada'" style="color: red;">{{ mesa.estado}}</h4>
                        <h4 ng-if="mesa.estado !== 'Reservada'">{{ mesa.estado}}</h4>
                        <p>_________________________________</p>
                        <a ng-if="mesa.estado !== 'Reservada'" class="btn" 
                           style="border-color: gray; border-radius: 2px; color: black; background-color: white;"
                           data-toggle="modal" data-target="#modalApartado" ng-click="chooseMesa(mesa)">Reservar Mesa</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Reservar Mesa -->
        <div class="modal fade" id="modalApartado" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Reservar Mesa</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Fecha reserva: </label>
                                    <input type="date" ng-model="reservacion.fecha" id="fecha" class="form-control">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Hora llegada: </label>
                                    <input type="time" ng-model="reservacion.hora" id="hora" class="form-control">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>No Comensales: </label>
                                    <input type="number" ng-model="reservacion.comensales" min="1" id="comensales" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary" data-dismiss="modal"
                                    ng-disabled="!reservacion.fecha || !reservacion.hora || !reservacion.comensales" ng-click="reservarMesa()">Reservar Mesa</button>
                        </div>
                    </div>
                </form>
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

        <script src="js/views/usuarios.js"></script>
    </body>
</html>