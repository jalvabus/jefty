let app = angular.module('reservacionesApp', []);

app.controller('reservacionesController', ($scope, $http) => {

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

    $scope.getReservaciones = function () {
        let reservacion = "getReservaciones";
        let params = "?action=" + reservacion;
        $http({
            method: 'POST',
            url: 'mesas' + params
        }).then((response, err) => {
            if (err) {
                console.log("Error obteniendo platillos: " + err);
            } else {
                console.log(response.data);
                $scope.reservaciones = response.data;
            }
        });
    };

    $scope.validateLogin();
    $scope.getReservaciones();

    $scope.checkReservacion = function (mesa) {

        let diffDays = getDiffDays(getDate(), mesa.fecha_llegada);
        console.log('Day difference: ' + diffDays);

        var date = new Date();

        let diffHours = getDiffHour(String(date.getHours()), mesa.hora_llegada);
        console.log('Hour difference: ' + diffHours);

        let diffMinutes = getDiffMinutes(String(date.getMinutes()), mesa.hora_llegada);
        console.log('Minutes difference: ' + diffMinutes);

        if (diffDays > 0) {
            $scope.reservacionCompletada(mesa);
            swal({
                title: "Reservacion Completada!",
                text: "Su reservacion se realzo con exito!",
                icon: "success",
                button: "Aceptar!"
            });
        } else if (diffDays === 0) {
            if (diffHours > 2) {
                /**
                 * Tengo tiempo
                 */
                swal({
                    title: "Reservacion Completada!",
                    text: "Su reservacion se realzo con exito!",
                    icon: "success",
                    button: "Aceptar!"
                });
                $scope.reservacionCompletada(mesa);
            } else if (diffHours === 2) {
                /**
                 * Ya es hora 
                 */
                if (diffMinutes >= 0) {
                    /**
                     * Estoy a tiempo
                     */
                    swal({
                        title: "Reservacion Completada!",
                        text: "Su reservacion se realzo con exito!",
                        icon: "success",
                        button: "Aceptar!"
                    });
                    $scope.reservacionCompletada(mesa);
                } else {
                    mensajeCancelada();
                }
            } else {
                mensajeCancelada();
            }
        } else {
            mensajeCancelada();
        }

        function mensajeCancelada() {
            swal({
                title: "Reservacion Cancelada!",
                text: "Su fecha de reservacion expiro!",
                icon: "warning",
                button: "Aceptar!"
            });
            $scope.reservacionCompletada(mesa);
        }

        function getDate() {
            var x = new Date();
            var y = x.getFullYear().toString();
            var m = (x.getMonth() + 1).toString();
            var d = x.getDate().toString();
            if (m.length === 1) {
                m = '0' + m;
            }
            if (d.length === 1) {
                d = '0' + d;
            }
            var yyyymmdd = y + '-' + m + '-' + d;
            return yyyymmdd;
        }

        function getDiffDays(date1, date2) {
            var nowDate = new Date(date1);
            var dateReservation = new Date(date2);
            var diffDays = dateReservation.getDate() - nowDate.getDate();
            return diffDays;
        }

        function getDiffHour(time1, time2) {
            let h1 = time1.substring(0, 3);
            let h2 = time2.substring(0, 2);
            return Number(h2) - Number(h1);
        }

        function getDiffMinutes(time1, time2) {
            let h1 = time1.substring(0, 3);
            let h2 = time2.substring(3, 5);
            return Number(h2) - Number(h1);
        }

        $scope.reset();
    };

    $scope.reservacionCompletada = function (reservacion) {
        let params = "?action=updateReservacion"
                + "&id_reservacion=" + reservacion.id_reservacion
                + "&id_mesa=" + reservacion.id_mesa;
        $http({
            method: 'POST',
            url: 'mesas' + params
        }).then((response, err) => {
            if (err) {
                console.log("Error obteniendo platillos: " + err);
            }

        });
    };

    $scope.reset = function () {
        $scope.getReservaciones();
    };

});