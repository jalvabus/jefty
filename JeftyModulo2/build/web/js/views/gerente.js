/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let app = angular.module('gerenteApp', []);

app.controller('gereteController', ($scope, $http) => {

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

    $scope.empleados = [];

    $scope.getEmpleados = function () {
        let params = "?action=getEmpleados";
        $http({
            method: 'POST',
            url: 'empleado' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }

            let data = response.data;
            console.log(data);
            $scope.empleados = data;
        });
    };

    $scope.getEmpleados();

    $scope.createEmpleado = function () {
        console.log($scope.empleado);
        let params = "?action=createEmpleado";
        params += "&status=" + $scope.empleado.estado
                + "&nombre=" + $scope.empleado.nombre
                + "&puesto=" + $scope.empleado.puesto
                + "&salario=" + $scope.empleado.salario
                + "&foto=" + $scope.empleado.foto;
        $http({
            method: 'POST',
            url: 'empleado' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }
            // Repetido
            if (Number(response.data) === 0) {
                swal({
                    title: "Empeado Repetido!",
                    text: "El usuario que intenta regsitrar ya existe!",
                    icon: "warning",
                    button: "Aceptar!",
                });
            }
            // Agreagado
            if (Number(response.data) === 1) {
                swal({
                    title: "Registro Exitoso!",
                    text: "Empleado agregado con exito!",
                    icon: "success",
                    button: "Aceptar!",
                });
            }
            // Error
            if (Number(response.data) === 2) {
                swal({
                    title: "Ocurrio un error!",
                    text: "Error!",
                    icon: "warning",
                    button: "Aceptar!",
                });
            }
            $scope.getEmpleados();
        });
    };

    $scope.uploadFile = function (files) {
        $scope.empleado.foto = files[0].name;
        console.log($scope.empleado);
    };

    $scope.deleteEmpleado = function (empleado) {
        console.log(empleado);
        swal({
            title: "Eliminar el empleado " + empleado.nombre + "?",
            text: "Si borra este empleado se perderan los datos del empleado !",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                let params = "?action=eliminar&id=" + book.id_libro;
                $http({
                    method: 'POST',
                    url: 'libro' + params
                }).then((response, err) => {
                    console.log(response.data);
                    let data = response.data;
                    swal(data, {
                        icon: "success",
                    });
                    $scope.getLibros();
                });
            } else {
                swal("Empleado no eliminado");
            }
        });
    };

    $scope.empleado = [];

    $scope.editEmpleado = function (empleado) {
        console.log(empleado);
        $scope.empleado = empleado;
    };

    $scope.saveEmpleado = function () {
        let params = "?action=updateEmpleado";
        params += "&id_empleado=" + $scope.empleado.id_empleado
                + "&status=" + $scope.empleado.estado
                + "&nombre=" + $scope.empleado.nombre
                + "&puesto=" + $scope.empleado.puesto
                + "&salario=" + $scope.empleado.salario
                + "&foto=" + $scope.empleado.foto;
        console.log(params);
        $http({
            method: 'POST',
            url: 'empleado' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }
            $scope.resetEmpleado();
            // Agreagado
            if (Number(response.data) === 1) {
                swal({
                    title: "Actualizacion Exitosa!",
                    text: "Empleado actualizado con exito!",
                    icon: "success",
                    button: "Aceptar!",
                });
            }
            // Error
            if (Number(response.data) === 2) {
                swal({
                    title: "Ocurrio un error!",
                    text: "Error!",
                    icon: "warning",
                    button: "Aceptar!",
                });
            }
        });
    };

    $scope.resetEmpleado = function () {
        $scope.empleado = [];
        $scope.getEmpleados();
    };

    $scope.changeStatusEmpleado = function (empleado) {
        let params = "?action=updateStatusEmpleado";
        let estado = empleado.estado;
        if (estado === 'Activo') {
            estado = 'Baja';
        } else {
            estado = 'Activo';
        }
        params += "&id_empleado=" + empleado.id_empleado
                + "&status=" + estado;
        console.log(params);
        $http({
            method: 'POST',
            url: 'empleado' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }
            $scope.resetEmpleado();
            // Agreagado
            if (Number(response.data) === 1) {
                swal({
                    title: "Actualizacion de estado Exitosa!",
                    text: "Empleado actualizado con exito!",
                    icon: "success",
                    button: "Aceptar!",
                });
            }
            // Error
            if (Number(response.data) === 2) {
                swal({
                    title: "Ocurrio un error!",
                    text: "Error!",
                    icon: "warning",
                    button: "Aceptar!",
                });
            }
        });
    };
});
