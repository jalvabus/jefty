<!DOCTYPE html>
<html lang="en" ng-app="gerenteApp">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Gerente || JeftyFood</title>
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
        <style>
            .title {
                font-family: 'Josefin Sans', sans-serif;
                font-weight: 700;
                font-size: 45px;
                text-transform: uppercase;
            }
        </style>
    </head>

    <body id="top" data-spy="scroll" ng-controller="gereteController">

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
                                <li><a href="#about">Inicio</a></li>
                                <li><a href="#empleados">Empleados</a></li>
                                <li><a href="#service">Mesas</a></li>
                                <li><a href="#portfolio">Clientes</a></li>
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

            <!--about wrapper left-->
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 hidden-sm col-md-5">
                        <div class="about-left">
                            <img src="images/about/gere.jpg" alt="">
                        </div>
                    </div>

                    <!--about wrapper right-->
                    <div class="col-xs-12 col-md-7">
                        <div class="about-right">
                            <div class="about-right-heading">
                                <h2 style="padding-top: 25px;">"El éxito de un restaurante va de la mano del profesionalismo, el entusiasmo y el compromiso con las necesidades y expectativas del cliente."</h2>
                            </div>

                            <div class="" style="padding-bottom: 10px;">
                                <div class="about-right-wrapper">
                                    <button class="btn btn-default" onclick="obtenerReporte()">Ver Encuestas</button>                                    
                                </div>
                            </div>                            
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
                            <h1 class="title">GESTION DE EMPLEADOS</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal">
                    Agregar
                </button>
                <br><br>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th>Nombre</th>
                            <th class="text-center">Puesto</th>
                            <th class="text-center">Salario</th>
                            <th class="text-center">Estado</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="empleado in empleados">
                            <td>{{empleado.id_empleado}}</td>
                            <th>{{empleado.nombre}}</th>
                            <td>{{empleado.puesto}}</td>
                            <td>{{empleado.salario}}</td>
                            <td>{{empleado.estado}}</td>
                            <td>
                                <button class="btn btn-default" ng-click="editEmpleado(empleado)" data-toggle="modal" data-target="#modalEdit"><i class="fa fa-pencil"></i> Editar</button>
                                <%--<button class="btn btn-danger" ng-click="deleteEmpleado(empleado)"><i class="fa fa-trash"></i> Eliminar </button>--%>
                                <button ng-if="empleado.estado === 'Activo'" class="btn btn-default" ng-click="changeStatusEmpleado(empleado)"><i class="fa fa-toggle-on"></i> Desactivar</button>
                                <button ng-if="empleado.estado !== 'Activo'" class="btn btn-default" ng-click="changeStatusEmpleado(empleado)"><i class="fa fa-toggle-off"></i> Activar</button>

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <!-- Modal Create -->
        <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel">Nuevo registro de empleado</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" ng-click="resetEmpleado()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="container-fluid">
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Nombre: </label>
                                    <input type="text" class="form-control" ng-model="empleado.nombre" placeholder="Nombre">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Puesto: </label>
                                    <select class="form-control" ng-model="empleado.puesto">
                                        <option value="gerente">Gerente</option>
                                        <option value="vendedor">Vendedor</option>
                                        <option value="cliente">Cliente</option>
                                    </select>                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Salario: </label>
                                    <input type="number" class="form-control" ng-model="empleado.salario" placeholder="$0.0">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Status </label>
                                    <select class="form-control" ng-model="empleado.estado">
                                        <option value="Activo">Activo</option>
                                        <option value="Baja">Baja</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Imagen </label>
                                    <input type="file" class="form-control" onchange="angular.element(this).scope().uploadFile(this.files)" placeholder="Usuario">
                                </div>
                                <div class="form-group col-sm-6">
                                    <img src="images/user/{{empleado.foto}}">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" ng-click="resetEmpleado()">Close</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="createEmpleado()"
                                ng-disabled="!empleado.estado || !empleado.foto || !empleado.nombre || !empleado.puesto || !empleado.salario">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Update -->
        <div class="modal fade bd-example-modal-lg" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel">Editar datos del empleado</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" ng-click="resetEmpleado()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="container-fluid">
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Nombre: </label>
                                    <input type="text" class="form-control" ng-model="empleado.nombre" placeholder="Nombre">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Puesto: </label>
                                    <select class="form-control" ng-model="empleado.puesto">
                                        <option value="gerente">Gerente</option>
                                        <option value="vendedor">Vendedor</option>
                                        <option value="cliente">Cliente</option>
                                    </select>                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Salario: </label>
                                    <input type="number" class="form-control" ng-model="empleado.salario" placeholder="$0.0">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Status </label>
                                    <select class="form-control" ng-model="empleado.estado">
                                        <option value="Activo">Activo</option>
                                        <option value="Baja">Baja</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Imagen </label>
                                    <input type="file" class="form-control" onchange="angular.element(this).scope().uploadFile(this.files)" placeholder="Usuario">
                                </div>
                                <div class="form-group col-sm-6">
                                    <img src="images/user/{{empleado.foto}}">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" ng-click="resetEmpleado()">Close</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="saveEmpleado()"
                                ng-disabled="!empleado.estado || !empleado.foto || !empleado.nombre || !empleado.puesto || !empleado.salario">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>

        <!--menú de comida-->
        <div id="client">
            <div class="container">
                <div class="row"> 

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/manager/desa.jpg" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/manager/almuerzo.jpg" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/manager/comida.jpg" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/manager/snack.jpg" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/manager/cena.jpg" alt="">
                    </div>

                    <div class="col-sm-4 col-md-2">
                        <span></span><img src="images/manager/merienda.jpg" alt="">
                    </div>
                </div>
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

        <script src="js/views/gerente.js"></script>
        <script src="js/views/encuestas.js"></script>
    </body>
</html>