<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="carritoApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente || Compras</title>

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
    <body ng-controller="carritoController">

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
                            <a href="Cliente.jsp" class="navbar-brand">Inicio</a>
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#ftheme">
                                <span class="sr-only">Toggle</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div class="navbar-collapse collapse" id="ftheme">
                            <ul class="nav navbar-nav navbar-right">                                
                                <li><a href="" ng-click="verCarrito()">Mi Carrito</a></li>
                                <li><a ng-click="logout()">Cerrar Sesion</a></li>                                
                            </ul>
                        </div>                       
                    </div>
                </nav>
            </div>
        </header>

        <!--Login form-->
        <div id="get-touch" ng-if="!showForm">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4 col-md-6 col-sm-offset-2 col-md-offset-3">
                        <div class="get-touch-heading">
                            <h2>MI ORDEN DE PLATILLOS</h2>
                            <p>Aqui esta el detalle de tus ordenes.</p>
                        </div>
                    </div>
                </div>

                <div class="content">
                    <div class="container">
                        <button class="btn btn-secondary btn-lg" ng-click="limpiarOrden()">Vaciar Carrito</button>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Platillo</th>
                                    <th>Cantidad</th>
                                    <th>Subtotal</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-if="orden.length > 0" ng-repeat="platillo in orden">
                                    <td>{{ platillo.descripcion}}</td>
                                    <td>
                                        <input id="{{platillo.id_platillo}}platillo" type="number" ng-keydown="reCalcular(platillo)" ng-keyup="reCalcular(platillo)" ng-keydown="reCalcular(platillo)" class="form-control" value="{{ platillo.CANTIDAD}}" onchange="">
                                    </td>
                                    <td> $ {{ platillo.CANTIDAD * platillo.precio}}</td>
                                    <td>
                                        <button class="btn btn-default" ng-click="eliminarCarrito(platillo)"><i class="fa fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr ng-if="orden.length === 0">
                                    <td colspan="5">Aun no tiene platillos agregados en su orden, seleccione que desea añadir<td>
                                <tr>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-lg-6">
                                <!-- Button trigger modal -->
                                <button ng-click="clienteFrecuente()" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                    Finalizar Compra
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Fializar Compra</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6 form-group" style="margin-top: 20px;">
                                <label>Subtotal: </label>
                                <input disabled type="number" value="{{precio.subtotal.toFixed(2)}}" class="form-control" id="" placeholder="Numero de tarjeta">
                            </div>
                            <div class="col-sm-6 form-group" style="margin-top: 20px;">
                                <label>IVA: </label>
                                <input disabled type="number" value="{{precio.iva.toFixed(2)}}" class="form-control" id="" placeholder="Numero de tarjeta">
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>Total: </label>
                                <input disabled type="number" value="{{precio.total.toFixed(2)}}" class="form-control" id="" placeholder="Numero de tarjeta">
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>Pago minimo:  </label>
                                <input disabled type="number" value="{{precio.apartado.toFixed(2)}}" class="form-control" id="" placeholder="Numero de tarjeta">
                            </div>
                            <div ng-if="comprasCliente > 5" class="col-sm-6 form-group">
                                <label>Descuento por cliente frecuente:  </label>
                                <input disabled type="number" value="{{precio.descuento.toFixed(2)}}" class="form-control" id="" placeholder="Numero de tarjeta">
                            </div>
                            <div ng-if="comprasCliente > 5" class="col-sm-6 form-group">
                                <label>Total Final: </label>
                                <input disabled type="number" value="{{precio.totalFinal.toFixed(2)}}" class="form-control" id="" placeholder="Numero de tarjeta">
                            </div>
                        </div>
                        <form class="contactForm" style="padding-top: 30px;">
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
                    <div class="modal-footer">
                        <button type="button" data-toggle="modal"class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" data-toggle="modal" data-target="#encuesta" class="btn btn-primary" data-dismiss="modal" ng-if="verificacionTarjeta" ng-click="pagar()">Pagar</button>
                        <button type="button" data-toggle="modal" data-target="#encuesta" class="btn btn-primary" data-dismiss="modal" ng-if="verificacionTarjetaCompleto" ng-click="pagarCompleto()">Pagar Completo</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="encuesta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Encuesta</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-12 form-group" style="margin-top: 20px;">
                                <label>¿Encontro lo que buscaba? </label>
                                <select ng-model="encuesta.pregunta1" class="form-control">
                                    <option value="si">SI</option>
                                    <option value="no">NO</option>
                                </select>
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>¿Alguna sugerencia de platillos? </label>
                                <input type="text" ng-model="encuesta.pregunta2" class="form-control" id="" placeholder="Sugerencia">
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>¿Recomendaria el sitio web? </label>
                                <select ng-model="encuesta.pregunta3" class="form-control">
                                    <option value="si">SI</option>
                                    <option value="no">NO</option>
                                </select>
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>¿Como le parecio el servicio? </label>
                                <input type="text" ng-model="encuesta.pregunta4" class="form-control" id="" placeholder="Sugerencia">
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>¿Que opina del lugar? </label>
                                <input type="text" ng-model="encuesta.pregunta5" class="form-control" id="" placeholder="Sugerencia">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="enviarEncuesta()">Enviar</button>
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

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.flexslider.js"></script>
        <script src="js/jquery.inview.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8HeI8o-c1NppZA-92oYlXakhDPYR7XMY"></script>
        <script src="js/script.js"></script>
        <script src="contactform/contactform.js"></script>

        <script src="js/views/carrito.js"></script>
    </body>
</html>
