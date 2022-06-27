"use strict";
var mostrarContenioArray = new Array();
var mostrarContenidoBoolean = true;
var mostrarContenidoTotal = 0;
function cargar() {
    var divGrande = document.getElementById('div-results');
    var divModificar = document.getElementById('anadirCont');
    setTimeout(function () {
        divModificar.style.height = (divGrande.clientHeight + 20) + 'px';
        divModificar.style.minHeight = 330 + 'px';
        console.log(divGrande.clientHeight);
    }, 100);
}
function allowDrop(ev) {
    ev.preventDefault();
}
function drag(ev) {
    ev.dataTransfer.setData("drop", ev.target.id);
}
