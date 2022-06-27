"use strict";
// Recargar
function recargar() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/mostrar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('borrar');
    location.reload();
}
// Mostrar Dades Base de Dades
function mostrarTaula(nom) {
    var mostrar = document.getElementById('mostrarIndex');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/mostrar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        mostrar.innerHTML = this.responseText;
    };
    xhr.send('taulaMostrar=' + nom);
}
// Mostrar Insertar Dades Base de Dades
function insertarDades(nom) {
    var mostrar = document.getElementById('mostrarIndex');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/mostrar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        mostrar.innerHTML = this.responseText;
    };
    xhr.send('taulaInsertar=' + nom);
}
// Insertar Programacio
// Filtrar Tipus Contingut
function filtrarLlistesInsertProgramacio() {
    var filtrar = document.getElementById('buscarLlistesInsertarProgramacio');
    var mostrar = document.getElementById('divMostrarLlistesInsertProgramacio');
    setTimeout(() => {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './main/filtros.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            mostrar.innerHTML = this.responseText;
        };
        xhr.send('filtrarLlistes=' + filtrar.value);
    }, 100);
}
// Insertar Tipus Contingut
function insertarTipusContingut() {
    var nom = document.getElementById('insertNomTipusContingut');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    var select = document.getElementById('selectTContingutInsertProgramacio');
    xhr.onload = function () {
        setTimeout(() => {
            select.innerHTML += this.responseText;
        }, 500);
    };
    xhr.send('insertTipusContingut=' + nom.value);
}
// Drop Programacio
function dropProgramacio(ev, mostrar) {
    ev.preventDefault();
    var id = ev.dataTransfer.getData("drop");
    var separar = id.split(";");
    id = document.getElementById(id);
    mostrar = document.getElementById(mostrar);
    while (mostrar.firstChild) {
        mostrar.removeChild(mostrar.firstChild);
    }
    var newObject = id.cloneNode(true);
    newObject.onclick = function () {
        mostrar.removeChild(newObject);
        xhr.open('POST', './main/create.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        var quitar = newObject.getAttribute('id').split(';');
        xhr.send('quitar=' + quitar[1]);
    };
    mostrar.appendChild(newObject);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    if (mostrar == "anadirLlista") {
        xhr.send('insertarLlistaProgramacio=' + separar[1]);
    }
    else {
        xhr.send('actualizarLlistaProgramacio=' + separar[1]);
    }
}
// Insertar Programacio
function insertarProgramacio() {
    var dataInici = document.getElementById('insertProgramacioStartDate');
    var nom = document.getElementById('nomInsertarProgramacio');
    var tipusContingut = document.getElementById('selectTContingutInsertProgramacio');
    var videowall = document.getElementById('selectVideowallInsertProgramacio');
    var dataFinal = document.getElementById('insertProgramacioFinalDate');
    var observacions = document.getElementById('insertProgramacioObservacions');
    var inconvenients = document.getElementById('insertProgramacioInconvenients');
    var checkbox = document.getElementById('checkboxActivarProgramacio');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('programacio');
        }, 500);
    };
    xhr.send('insertarProgramacio=' + nom.value + '&insertarDataInici=' + dataInici.value + '&insertarTipusContingut=' + tipusContingut.value + '&insertarVideowall=' + videowall.value + '&insertarDataFinal=' + dataFinal.value + '&insertarObservacions=' + observacions.value + '&insertarInconvenients=' + inconvenients.value);
}
// Actualizar Programacio
function actualizarProgramacio(id) {
    var dataInici = document.getElementById('actualizarProgramacioStartDate');
    var nom = document.getElementById('nomActualizarProgramacio');
    var videowall = document.getElementById('selectVideowallActualizarProgramacio');
    console.log(videowall.value);
    var dataFinal = document.getElementById('actualizarProgramacioFinalDate');
    var observacions = document.getElementById('actualizarProgramacioObservacions');
    var inconvenients = document.getElementById('actualizarProgramacioInconvenients');
    /* var checkbox: any = document.getElementById('checkboxActivarProgramacio') */
    /* alert(checkbox.checked); */
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('programacio');
            console.log(this.responseText);
        }, 500);
    };
    xhr.send('actualitzarProgramacio=' + nom.value + '&actualitzarDataInici=' + dataInici.value + '&actualitzarVideowall=' + videowall.value + '&actualitzarDataFinal=' + dataFinal.value + '&actualitzarObservacions=' + observacions.value + '&actualitzarInconvenients=' + inconvenients.value + '&actualitzarid=' + id);
}
// Fi Insertar Programacio
// Insertar Llistes Programacions
// Filtrar Continguts
function filtrarContingut() {
    var filtrar = document.getElementById('buscarContingutFiltrar');
    var mostrar = document.getElementById('divMostrarContingutCrearLLista');
    setTimeout(() => {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './main/filtros.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            mostrar.innerHTML = this.responseText;
        };
        xhr.send('filtrarContingut=' + filtrar.value);
    }, 100);
}
// Insertar Contingut
function insertarContingut() {
    var nom = document.getElementById('insertNomContingut');
    var url = document.getElementById('insertNomContingut');
    var mostrar = document.getElementById('divMostrarContingutCrearLLista');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrar.innerHTML = this.responseText;
        }, 500);
    };
    xhr.send('nomInsertarContingut=' + nom.value + '&urlInsertarContingut=' + url.value);
}
// Drop Llistes Reproduccio
function dropLlistesReproduccio(ev, mostrar) {
    ev.preventDefault();
    var id = ev.dataTransfer.getData("drop");
    var separar = id.split(";");
    id = document.getElementById(id);
    mostrar = document.getElementById(mostrar);
    var newObject = id.cloneNode(true);
    newObject.onclick = function () {
        mostrar.removeChild(newObject);
        xhr.open('POST', './main/create.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        var quitar = newObject.getAttribute('id').split(';');
        xhr.send('quitar=' + quitar[1]);
    };
    mostrar.appendChild(newObject);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('insertarContingutLlistes=' + separar[1]);
}
// Insertar Llista Programacio
function insertarLlista() {
    var nom = document.getElementById('nomInsertarLlista');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('llistes');
        }, 500);
    };
    xhr.send('nomInsertarLlista=' + nom.value);
}
// Actualizar Llista Programacio
function actualizarLlista(id) {
    var nom = document.getElementById('nomInsertarLlista');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        console.log(this.responseText);
        setTimeout(() => {
            mostrarTaula('llistes');
        }, 500);
    };
    xhr.send('nomActualitzarLlista=' + nom.value + '&idActualitzarLlista=' + id);
}
// Fi Llistes Programacio
// Insertar Videowall
// Insertar Grup
function insertarGrup() {
    var nom = document.getElementById('insertNomGrup');
    var mostrar = document.getElementById('grupInsertarVideowall');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrar.innerHTML = this.responseText;
        }, 500);
    };
    xhr.send('nomInsertarGrup=' + nom.value);
}
// Insertar Marques
function insertarMarca() {
    var nom = document.getElementById('insertNomMarca');
    var mostrar = document.getElementById('divMostrarMarquesInsertarVideowall');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrar.innerHTML = this.responseText;
        }, 500);
    };
    xhr.send('nomInsertarMarca=' + nom.value);
}
// Insertar Tipus Format
function insertarTFormat() {
    var nom = document.getElementById('insertTipusFormat');
    var mostrar = document.getElementById('tipusFormatInsertarVideowall');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrar.innerHTML = this.responseText;
        }, 500);
    };
    xhr.send('nomInsertarTipusFormat=' + nom.value);
}
// Drop Marques
function dropMarques(ev, mostrar) {
    ev.preventDefault();
    var id = ev.dataTransfer.getData("drop");
    var separar = id.split(";");
    id = document.getElementById(id);
    mostrar = document.getElementById(mostrar);
    var newObject = id.cloneNode(true);
    newObject.onclick = function () {
        mostrar.removeChild(newObject);
        xhr.open('POST', './main/create.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        var quitar = newObject.getAttribute('id').split(';');
        xhr.send('quitar=' + quitar[1]);
    };
    mostrar.appendChild(newObject);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('insertarMarques=' + separar[1]);
}
// Insertar Videowall
function insertarVideowall() {
    var nom = document.getElementById('nomInsertarVideowall');
    var grup = document.getElementById('grupInsertarVideowall');
    var tipusFormat = document.getElementById('tipusFormatInsertarVideowall');
    var client = document.getElementById('clientInsertVideowall');
    var botiga = document.getElementById('botigaInsertVideowall');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('videowall');
        }, 500);
    };
    xhr.send('nomInsertarVideowall=' + nom.value + '&grupInsertarVideowall=' + grup.value + '&tipusFormatInsertarVideowall=' + tipusFormat.value + '&clientInsertarVideowall=' + client.value + '&botigaInsertarVideowall=' + botiga.value);
}
// Actualizar Videowall
function actualizarVideowall(id) {
    var nom = document.getElementById('nomInsertarVideowall');
    var grup = document.getElementById('grupInsertarVideowall');
    var tipusFormat = document.getElementById('tipusFormatInsertarVideowall');
    var client = document.getElementById('clientInsertVideowall');
    var botiga = document.getElementById('botigaInsertVideowall');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('videowall');
        }, 500);
        console.log(this.responseText);
    };
    xhr.send('idActualizarVideowall=' + id + '&nomActualizarVideowall=' + nom.value + '&grupActualizarVideowall=' + grup.value + '&tipusFormatActualizarVideowall=' + tipusFormat.value + '&clientActualizarVideowall=' + client.value + '&botigaActualizarVideowall=' + botiga.value);
}
// Fi Videowall
// Insertar Dispositius
// Insertar Dispositiu
function insertarDispositiu() {
    var full = true;
    var nom = document.getElementById('nomInsertarDispositius');
    var videowall = document.getElementById('videowallInsertarDispositius');
    var MAC = document.getElementById('MACInsertarDispositius');
    var model = document.getElementById('modelInsertarDispositius');
    var nSerie = document.getElementById('nSerieInsertarDispositius');
    var URL = document.getElementById('URLInsertarDispositius');
    var firmware = document.getElementById('firmwareInsertarDispositius');
    var pClient = document.getElementById('progClientInsertarDispositius');
    var IP = document.getElementById('IPInsertarDispositius');
    if (nom.value.length == 0) {
        full = false;
    }
    else if (videowall.value == "") {
        full = false;
    }
    else if (MAC.value.length == 0) {
        full = false;
    }
    else if (model.value.length == 0) {
        full = false;
    }
    else if (nSerie.value.length == 0) {
        full = false;
    }
    else if (URL.value.length == 0) {
        full = false;
    }
    else if (firmware.value.length == 0) {
        full = false;
    }
    else if (pClient.value.length == 0) {
        full = false;
    }
    else if (IP.value.length == 0) {
        full = false;
    }
    if (full) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './main/create.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            setTimeout(() => {
                mostrarTaula('dispositius');
            }, 500);
            console.log(this.responseText);
        };
        xhr.send('nomInsertarDispositius=' + nom.value + '&videowallInsertarDispositius=' + videowall.value + '&MACInsertarDispositius='
            + MAC.value + '&modelInsertarDispositius=' + model.value + '&nSerieInsertarDispositius=' + nSerie.value
            + '&URLInsertarDispositius=' + URL.value + '&firmwareInsertarDispositius=' + firmware.value + '&progClientInsertarDispositius='
            + pClient.value + '&IPInsertarDispositius=' + IP.value);
    }
    else {
        if (window.confirm("No s'han omplert tots els camps.\nAfegir Dispositiu?")) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', './main/create.php', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onload = function () {
                setTimeout(() => {
                    mostrarTaula('dispositius');
                }, 500);
                console.log(this.responseText);
            };
            xhr.send('nomInsertarDispositius=' + nom.value + '&videowallInsertarDispositius=' + videowall.value + '&MACInsertarDispositius='
                + MAC.value + '&modelInsertarDispositius=' + model.value + '&nSerieInsertarDispositius=' + nSerie.value
                + '&URLInsertarDispositius=' + URL.value + '&firmwareInsertarDispositius=' + firmware.value + '&progClientInsertarDispositius='
                + pClient.value + '&IPInsertarDispositius=' + IP.value);
        }
    }
}
function actualizarDispositiu(id) {
    var nom = document.getElementById('nomInsertarDispositius');
    var videowall = document.getElementById('videowallInsertarDispositius');
    var MAC = document.getElementById('MACInsertarDispositius');
    var model = document.getElementById('modelInsertarDispositius');
    var nSerie = document.getElementById('nSerieInsertarDispositius');
    var URL = document.getElementById('URLInsertarDispositius');
    var firmware = document.getElementById('firmwareInsertarDispositius');
    var pClient = document.getElementById('progClientInsertarDispositius');
    var IP = document.getElementById('IPInsertarDispositius');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('dispositius');
        }, 500);
        console.log(this.responseText);
    };
    xhr.send('idActualizarDispositius=' + id + '&nomActualizarDispositius=' + nom.value + '&videowallActualizarDispositius=' + videowall.value + '&MACActualizarDispositius='
        + MAC.value + '&modelActualizarDispositius=' + model.value + '&nSerieActualizarDispositius=' + nSerie.value
        + '&URLActualizarDispositius=' + URL.value + '&firmwareActualizarDispositius=' + firmware.value + '&progClientActualizarDispositius='
        + pClient.value + '&IPActualizarDispositius=' + IP.value);
}
// FI Dispositius
// Actualitzar Marcas
function actualizarMarcas(id) {
    var input = document.getElementById('inputUpdateModal' + id);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/actualizar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('actualitzar=marcas&value=' + input.value + '&id=' + id);
    setTimeout(() => {
        mostrarTaula('marcas');
    }, 300);
}
function actualizartFormat(id) {
    var input = document.getElementById('inputUpdatetFormat' + id);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/actualizar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('actualitzar=tFormat&value=' + input.value + '&id=' + id);
    setTimeout(() => {
        mostrarTaula('tFormat');
    }, 300);
}
function actualizargrup(id) {
    var input = document.getElementById('inputUpdategrups' + id);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/actualizar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('actualitzar=grups&value=' + input.value + '&id=' + id);
    setTimeout(() => {
        mostrarTaula('grups');
    }, 300);
}
// Actualizar
function actualizar(id, name) {
    var mostrar = document.getElementById('mostrarIndex');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/actualizar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        mostrar.innerHTML = this.responseText;
    };
    xhr.send('actualitzar=' + name + '&id=' + id);
}
// Borrar Dades de les Taules
function deleteRow(id, tabla, campo, mostrarTabla) {
    var text = "Eliminar aquest registre?";
    if (confirm(text) == true) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './main/delete.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            setTimeout(() => {
                mostrarTaula(mostrarTabla);
            }, 200);
        };
        xhr.send('idDelete=' + id + '&tabla=' + tabla + '&campo=' + campo);
    }
}
