
let app = angular.module("indexApp", []);

app.controller('indexController', ($scope, $http) => {
    $scope.usuario = [];

    $scope.login = function () {
        let usuario = document.getElementById('usuario').value;
        let password = document.getElementById('password').value;
        //let params = "?action=login&usuario=LucytaniaRuz&password=ed321";
        let params = "?action=login&usuario=" + usuario + "&password=" + password + "";
        console.log(params);
        $http({
            method: 'POST',
            url: 'auth' + params
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }
            let data = response.data;
            console.log(data);
            
            if (data.tipo === 'cliente') {
                console.log(response.data);
                $scope.usuario = response.data;
                location.replace("Cliente.jsp");
            } else if (data.tipo === 'gerente') {
                location.replace("Gerente.jsp");
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
            $scope.usuario = response.data;
            location.replace("index.jsp");
        });
    };
    
    /**
     * 
     * @returns Funcion para generar reporete con AngularJS
     */
    $scope.mostrarReporte = function () {
        $http({
            method: 'POST',
            url: 'encuestas'
        }).then((response, err) => {
            if (err) {
                return console.log(err);
            }
            console.log(response.data);
        });
    };
});


var xhr;

function crearObjeto() {
    if (window.ActiveXObject) {
        xhr = new ActiveXObject("Microsoft.XMLHttp");
    } else if ((window.XMLHttpRequest) || (typeofHMLHttpRequest) !== undefined) {
        xhr = new XMLHttpRequest();
    } else {
        alert("Su navegador no soporta AJAX");
        return;
    }
}

function obtenerReporte () {
    crearObjeto();
    var servlet = 'encuestas';
    xhr.open("POST", servlet, true);
    xhr.onreadystatechange = respuestaRegistro;
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.send(null);
}
function respuestaRegistro() {
    if (xhr.readyState === 4) {
        var respuesta = xhr.responseText;
        console.log(respuesta);
    }
}

