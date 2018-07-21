let app = angular.module('usuarioApp', []);

app.controller('usuarioController', ($scope, $http) => {

    $scope.usuario = [];
    $scope.platillos = [];
    $scope.tipoOrden = [];

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

    $scope.getPlatillos = function () {
        let platillos = $scope.tipoOrden.tipo;
        let params = "?action=" + platillos;
        $http({
            method: 'POST',
            url: 'Cliente' + params
        }).then((response, err) => {
            if (err) {
                console.log("Error obteniendo platillos: " + err);
            } else {
                console.log(response.data);
                $scope.platillos = response.data;
            }
        });
    };

    $scope.ver = function () {
        console.log("Viendo detalles");
    };

    $scope.validateLogin();

    $scope.agregarOrden = function (platillo) {
        let plato = this.platillo;
        console.log(plato);
        let existe = -1;
        if (!localStorage.getItem("orden")) {
            localStorage.setItem('orden', JSON.stringify({productos: []}));
        }

        var ordenActual = JSON.parse(localStorage.getItem("orden"));

        ordenActual.productos.forEach((elemento, i) => {
            if (plato.id_platillo === elemento.id_platillo) {
                existe = i;
            }
        });

        if (existe === -1) {
            plato.CANTIDAD = 1;
            ordenActual.productos.push(plato);
        } else {
            ordenActual.productos[existe].CANTIDAD++;
        }

        localStorage.setItem("orden", JSON.stringify(ordenActual));
        console.log(ordenActual);
        swal("Agregaste el platillo '" + platillo.nombre + "' a tu orden !", "", "success");
    };

    $scope.limpiarOrden = function () {
        localStorage.setItem("orden", JSON.stringify({productos: []}));
        var divContenido = $('#contenidoOrden');
        divContenido.empty();
    };

    $scope.verCarrito = function () {
        location.replace("Carrito.jsp");
    };

    $scope.verCarritoPaquete = function () {
        location.replace("CarritoPaquete.jsp");
    };

    // $scope.limpiarOrden();

    /**
     * 
     * @returns {undefined}
     */
    $scope.mesa = [];
    $scope.chooseMesa = function (mesa) {
        $scope.mesa = mesa;
    };
    $scope.mesas = {};

    $scope.getMesas = function () {
        let params = "?action=getMesas";
        $http({
            method: 'POST',
            url: 'mesas' + params
        }).then((response, err) => {
            if (err) {
                console.log("Error obteniendo platillos: " + err);
            } else {
                console.log(response.data);
                $scope.mesas = response.data;
            }
        });
    };

    $scope.getMesas();
    $scope.reservacion = {};

    $scope.reservarMesa = function () {
        let fecha = $('#fecha').val();
        let hora = $('#hora').val();
        let comensales = $('#comensales').val();
        let mesa = $scope.mesa;
        let usuario = $scope.usuario;
        let params = "?action=reservarMesa"
                + "&id_usuario=" + usuario.id_usuario
                + "&id_mesa=" + mesa.id_mesa
                + "&fecha=" + fecha
                + "&hora=" + hora
                + "&comensales=" + comensales;
        $http({
            method: 'POST',
            url: 'mesas' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }
            let data = response.data;
            console.log(data);
            if (Number(response.data) === 0) {
                swal({
                    title: "No puede apartar mas mesas",
                    text: "Usted ya cuenta con una mesa apartada!",
                    icon: "warning",
                    button: "Aceptar",
                });
            }
            if (Number(response.data) === 1) {
                swal({
                    title: "Reservacion Exitosa!",
                    text: "Su reservacion se ah guardado!",
                    icon: "success",
                    button: "Aceptar",
                });
                $scope.reload();
            }
            if (Number(response.data) === 404) {
                swal({
                    title: "Ocurrio un error!",
                    text: "Lo sentimos ah ocurrido un error!",
                    icon: "warning",
                    button: "Aceptar",
                });
            }
        });
    };

    $scope.reload = function () {
        $scope.getMesas();
    };

    $scope.paquetes = [];
    $scope.getPaquetes = function () {
        let platillos = $scope.tipoOrden.tipo;
        let params = "?action=" + platillos;
        $http({
            method: 'POST',
            url: 'paquete' + params
        }).then((response, err) => {
            if (err) {
                console.log("Error obteniendo platillos: " + err);
            } else {
                console.log(response.data);
                $scope.paquetes = response.data;
            }
        });
    };

    $scope.paquete = [];
    $scope.agregarOrdenPaquete = function (paquete) {
        $scope.paquete = paquete;
    };


    $scope.verificacionTarjeta = false;
    $scope.verificacionTarjetaCompleto = false;
    $scope.saldo = null;
    $scope.end = false;
    $scope.tipopago = null;
    $scope.tarjeta = null;

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
                    if (data.saldo < $scope.paquete.costo) {
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

    $scope.comprarPaquete = function () {
        console.log($scope.paquete);
        console.log($scope.saldo);
        console.log($scope.tipopago);
        console.log($scope.tarjeta);

        let nuevoSaldo = Number($scope.saldo) - Number($scope.paquete.costo);

        let params = "?action=comprarPaquete";
        params += "&id_paquete=" + $scope.paquete.id_paquete
                + "&costo=" + $scope.paquete.costo
                + "&tipoCompra=" + $scope.tipopago
                + "&notarjeta=" + $scope.tarjeta
                + "&nuevoSaldo=" + nuevoSaldo;
        console.log(params);
        $http({
            method: 'POST',
            url: 'paquete' + params
        }).then((response, err) => {
            if (err) {
                console.log("Error obteniendo platillos: " + err);
            } else {
                console.log(response.data);
                swal({
                    title: "Paquete comprado!",
                    text: "Compraste el paquete!",
                    icon: "success",
                    button: "Aceptar!"
                });
                $scope.reload();
            }
        });

    };
});