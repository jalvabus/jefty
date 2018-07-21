let app = angular.module('carritoApp', []);

app.controller('carritoController', ($scope, $http) => {

    $scope.usuario = [];

    $scope.validateLogin = function () {
        let params = "?action=authlogin";
        $http({
            method: 'POST',
            url: 'auth' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }

            let data = response.data;
            console.log(data);
            if (data.nomUsuario) {
                $scope.usuario = response.data;
            } else {
                 location.replace("index.jsp");
            }
        });
    };

    $scope.logout = function () {
        let params = "?action=logout";
        $http({
            method: 'POST',
            url: 'auth' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }
            console.log(response.data);
            $scope.usuario = response.data;
            location.replace("index.jsp");
        });
    };

    $scope.validateLogin();


    $scope.orden = [];
    $scope.precio = [];
    $scope.showForm = false;

    $scope.cargar = function () {
        if (!localStorage.getItem("orden")) {
            localStorage.setItem("orden", JSON.stringify({productos: []}));
        }

        let orden = JSON.parse(localStorage.getItem("orden"));
        $scope.orden = orden.productos;

    };

    $scope.cargar();

    $scope.cargarDatos = function () {

        if (!localStorage.getItem("orden")) {
            localStorage.setItem("orden", JSON.stringify({productos: []}));
        }

        var total = 0;

        let orden = JSON.parse(localStorage.getItem("orden"));
        $scope.orden = orden.productos;
        console.log($scope.orden);
        $scope.orden.forEach(function (p) {
            total += p.CANTIDAD * p.precio;
        });

        let descuento = 0;

        if (Number($scope.comprasCliente) > 5) {
            descuento = 0.05;
        } else {
            descuento = 0;
        }

        $scope.precio.subtotal = total;
        $scope.precio.iva = total * 0.16;
        $scope.precio.total = total * 1.16;
        $scope.precio.descuento = total * 1.16 * descuento;
        $scope.precio.apartado = Number(total * 1.16) / 2;
        $scope.precio.totalFinal = (total * 1.16) - (total * 1.16 * descuento);

        console.log($scope.precio);
    };

    $scope.limpiarOrden = function () {
        localStorage.setItem("orden", JSON.stringify({productos: []}));
        $scope.orden = [];
        $scope.precio.total = 0.0;
    };

    $scope.eliminarCarrito = function (platillo) {

        if (!localStorage.getItem("orden")) {
            localStorage.setItem("orden", JSON.stringify({productos: []}));
        }

        var total = 0;

        var ordenActual = JSON.parse(localStorage.getItem("orden"));

        let nuevaOrden = {
            productos: []
        };

        ordenActual.productos.forEach(function (p) {
            if (p.id_platillo !== platillo.id_platillo) {
                total += p.CANTIDAD * p.precio;
                nuevaOrden.productos.push(p);
            }
        });

        localStorage.setItem("orden", JSON.stringify(nuevaOrden));

        $scope.orden = nuevaOrden.productos;

        $scope.precio.subtotal = total;
        $scope.precio.iva = total * 0.16;
        $scope.precio.total = total * 1.16;
        $scope.precio.apartado = Number(total) / 2;
    };

    $scope.reCalcular = function (platillo) {

        let valor = document.getElementById(platillo.id_platillo + 'platillo').value;
        var total = 0;
        var ordenActual = JSON.parse(localStorage.getItem("orden"));

        ordenActual.productos.forEach((elemento, i) => {
            if (platillo.id_platillo === elemento.id_platillo) {
                ordenActual.productos[i].CANTIDAD = Number(valor);
            }
        });

        ordenActual.productos.forEach(function (p) {
            total += p.CANTIDAD * p.precio;
        });

        localStorage.setItem("orden", JSON.stringify(ordenActual));

        $scope.orden = ordenActual.productos;

        $scope.precio.subtotal = total;
        $scope.precio.iva = total * 0.16;
        $scope.precio.total = total * 1.16;
        $scope.precio.apartado = Number(total) / 2;

    };

    $scope.cancelar = function () {
        $scope.showForm = false;
    };

    $scope.verificacionTarjeta = false;
    $scope.verificacionTarjetaCompleto = false;
    $scope.tipopago = null;
    $scope.tarjeta = null;
    $scope.saldo = null;

    $scope.getSaldoTarjeta = function () {
        let noTarjeta = document.getElementById('saldoTarjeta').value;

        let e = document.getElementById("tipopago");
        let tipoPago = e.options[e.selectedIndex].value;
        $scope.tipopago = tipoPago;
        $scope.tarjeta = noTarjeta;

        let action = null;
        console.log(tipopago);

        if (tipoPago === 'credito') {
            action = "getSaldoCredito";
        }
        if (tipoPago === 'prepago') {
            action = "getSaldoPrepago";
        }

        let params = "?action=" + action + "&id_usuario= " + $scope.usuario.id_usuario + "&no_tarjeta=" + noTarjeta;
        console.log(params);
        $http({
            method: 'POST',
            url: 'tarjetas' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }

            let data = response.data;
            console.log(data);
            if (tipoPago === 'prepago') {
                if (data.saldo) {
                    $scope.saldo = data.saldo;
                    $scope.end = true;
                    if (data.saldo < $scope.precio.total) {
                        swal({
                            title: "No centa con saldo suficiente!",
                            text: "",
                            icon: "warning",
                            button: "Ok!"
                        });
                        $scope.verificacionTarjeta = false;
                        $scope.verificacionTarjetaCompleto = true;
                    } else {
                        swal({
                            title: "Tarjeta Correcta !",
                            text: "Confirme la compra",
                            icon: "warning",
                            button: "Ok!"
                        });
                        $scope.verificacionTarjeta = true;
                    }
                } else {
                    swal({
                        title: "Error en la tajeta!",
                        text: "No se encontraron resultados!",
                        icon: "warning",
                        button: "Ok!"
                    });
                }
            }
            if (tipoPago === 'credito') {
                if (data.saldo) {
                    $scope.verificacionTarjeta = true;
                    $scope.verificacionTarjetaCompleto = true;
                    $scope.saldo = data.saldo;
                    $scope.end = true;
                    swal({
                        title: "Tarjeta Correcta",
                        text: "El pago se cargara a su tarjeta de credito",
                        icon: "warning",
                        button: "Ok!"
                    });
                } else {
                    swal({
                        title: "Error en la tajeta!",
                        text: "No se encontraron resultados!",
                        icon: "warning",
                        button: "Ok!"
                    });
                }
            }
        });
    };

    $scope.pagar = function () {
        console.log($scope.tipopago);
        console.log($scope.tarjeta);
        console.log($scope.saldo);
        console.log($scope.precio);
        console.log($scope.orden);
        let nuevoSaldo = Number($scope.saldo) - Number($scope.precio.apartado);
        console.log(nuevoSaldo);
        let params = "?action=finalizarCompra"
                + "&id_usuario=" + $scope.usuario.id_usuario
                + "&tipoCompra=" + $scope.tipopago
                + "&notarjeta=" + $scope.tarjeta
                + "&total=" + $scope.precio.totalFinal
                + "&restante=" + $scope.precio.apartado
                + "&nuevoSaldo=" + nuevoSaldo
                + "&cantidadPlatillos=" + $scope.orden.length;
        $scope.orden.forEach((platillo, i) => {
            params += "&idPlatillo" + i + "=" + platillo.id_platillo + "&cantidad" + i + "=" + platillo.CANTIDAD;
        });
        console.log(params);

        $http({
            method: 'POST',
            url: 'compra' + params
        }).then((response, err) => {
            let data = response.data;
            console.log(data);
            swal({
                title: "Compra Finalizada!",
                text: "Total: " + $scope.precio.totalFinal
                        + "\nPagado: " + $scope.precio.apartado
                        + "\nRestante: " + $scope.precio.apartado,
                icon: "success",
                button: "Aceptar"
            });
            $scope.limpiarOrden();
            $scope.cancelar();
            //$scope.verSugerencia();
            //$scope.resetVariables();
            $('#encuesta').modal({
                show: true
            });
        });
    };

    $scope.pagarCompleto = function () {
        console.log($scope.tipopago);
        console.log($scope.tarjeta);
        console.log($scope.saldo);
        console.log($scope.precio);
        console.log($scope.orden);
        let nuevoSaldo = Number($scope.saldo) - Number($scope.precio.totalFinal);
        console.log(nuevoSaldo);
        let params = "?action=finalizarCompra"
                + "&id_usuario=" + $scope.usuario.id_usuario
                + "&tipoCompra=" + $scope.tipopago
                + "&notarjeta=" + $scope.tarjeta
                + "&total=" + $scope.precio.totalFinal
                + "&nuevoSaldo=" + nuevoSaldo
                + "&cantidadPlatillos=" + $scope.orden.length
                + "&restante=0";
        $scope.orden.forEach((platillo, i) => {
            params += "&idPlatillo" + i + "=" + platillo.id_platillo + "&cantidad" + i + "=" + platillo.CANTIDAD;
        });
        console.log(params);

        $http({
            method: 'POST',
            url: 'compra' + params
        }).then((response, err) => {
            let data = response.data;
            console.log(data);
            swal({
                title: "Compra Finalizada!",
                text: "Total: " + $scope.precio.totalFinal.toFixed(2)
                        + "\nPagado: " + $scope.precio.totalFinal.toFixed(2)
                        + "\nRestante: 0",
                icon: "success",
                button: "Aceptar"
            });
            $scope.limpiarOrden();
            $scope.cancelar();
            //$scope.verSugerencia();
            //$scope.resetVariables();
            $('#encuesta').modal({
                show: true
            });
        });
    };

    $scope.comprasCliente = 0;

    $scope.clienteFrecuente = function () {
        let params = "?action=frecuente&id_usuario=" + $scope.usuario.id_usuario;
        console.log(params);
        $http({
            method: 'POST',
            url: 'Cliente' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }

            let data = response.data;
            console.log(data);
            $scope.comprasCliente = data;
            $scope.cargarDatos();
        });
    };

    $scope.encuesta = [];

    $scope.enviarEncuesta = function () {
        console.log($scope.encuesta);
        let params = "?action=encuesta"
                + "&p1=" + $scope.encuesta.pregunta1
                + "&p2=" + $scope.encuesta.pregunta2
                + "&p3=" + $scope.encuesta.pregunta3
                + "&p4=" + $scope.encuesta.pregunta4
                + "&p5=" + $scope.encuesta.pregunta5;
        console.log(params);
        $http({
            method: 'POST',
            url: 'compra' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }

            let data = response.data;
            console.log(data);
            $scope.comprasCliente = data;
            $scope.cargarDatos();
            swal({
                title: "Encuentra registrada !",
                text: "Gracias por contestar nuestra encuesta",
                icon: "success",
                button: "Aceptar"
            }).then((value) => {
                location.replace('Cliente.jsp');
            });
        });
    };
});
