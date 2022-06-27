var mostrarContenioArray: any = new Array();
var mostrarContenidoBoolean: boolean = true;
var mostrarContenidoTotal: number = 0;
function cargar() {
    var divGrande: any = document.getElementById('div-results');
    var divModificar: any = document.getElementById('anadirCont');

    setTimeout(function () {
        divModificar.style.height = (divGrande.clientHeight + 20) + 'px';
        divModificar.style.minHeight = 330 + 'px';
        console.log(divGrande.clientHeight)
    }, 100);

}
function allowDrop(ev: any) {
    ev.preventDefault();
}
function drag(ev: any) {
    ev.dataTransfer.setData("drop", ev.target.id);
}
