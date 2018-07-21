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