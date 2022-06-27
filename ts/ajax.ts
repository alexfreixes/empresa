// Recargar
function recargar() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/mostrar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('borrar');
    location.reload();
}

// Mostrar Dades Base de Dades
function mostrarTaula(nom: string) {
    var mostrar: any = document.getElementById('mostrarIndex');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/mostrar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        mostrar.innerHTML = this.responseText;
    }
    xhr.send('taulaMostrar=' + nom);
}

// Mostrar Insertar Dades Base de Dades
function insertarDades(nom: string) {
    var mostrar: any = document.getElementById('mostrarIndex');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/mostrar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        mostrar.innerHTML = this.responseText;
    }
    xhr.send('taulaInsertar=' + nom);
}


// Insertar Programacio
// Filtrar Tipus Contingut
function filtrarLlistesInsertProgramacio() {
    var filtrar: any = document.getElementById('buscarLlistesInsertarProgramacio');
    var mostrar: any = document.getElementById('divMostrarLlistesInsertProgramacio');
    setTimeout(() => {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './main/filtros.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            mostrar.innerHTML = this.responseText;
        }
        xhr.send('filtrarLlistes=' + filtrar.value);
    }, 100);

}
// Insertar Tipus Contingut
function insertarTipusContingut() {
    var nom: any = document.getElementById('insertNomTipusContingut');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    var select: any = document.getElementById('selectTContingutInsertProgramacio');


    xhr.onload = function () {
        setTimeout(() => {
            select.innerHTML += this.responseText;
        }, 500);
    }
    xhr.send('insertTipusContingut=' + nom.value);
}
// Drop Programacio
function dropProgramacio(ev: any, mostrar: any) {
    ev.preventDefault();

    var id: any = ev.dataTransfer.getData("drop");
    var separar: any = id.split(";");
    id = document.getElementById(id);

    mostrar = document.getElementById(mostrar);

    while (mostrar.firstChild) {
        mostrar.removeChild(mostrar.firstChild);
    }

    var newObject: any = id.cloneNode(true);

    newObject.onclick = function () {
        mostrar.removeChild(newObject);
        xhr.open('POST', './main/create.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

        var quitar: any = newObject.getAttribute('id').split(';');

        xhr.send('quitar=' + quitar[1]);
    }

    mostrar.appendChild(newObject);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    if (mostrar == "anadirLlista") {
        xhr.send('insertarLlistaProgramacio=' + separar[1]);
    } else {
        xhr.send('actualizarLlistaProgramacio=' + separar[1]);
    }

}
// Insertar Programacio
function insertarProgramacio() {
    var dataInici: any = document.getElementById('insertProgramacioStartDate');
    var nom: any = document.getElementById('nomInsertarProgramacio');
    var tipusContingut: any = document.getElementById('selectTContingutInsertProgramacio');

    var videowall: any = document.getElementById('selectVideowallInsertProgramacio');
    var dataFinal: any = document.getElementById('insertProgramacioFinalDate');
    var observacions: any = document.getElementById('insertProgramacioObservacions');
    var inconvenients: any = document.getElementById('insertProgramacioInconvenients');
    var checkbox: any = document.getElementById('checkboxActivarProgramacio')
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('programacio');
        }, 500);
    }
    xhr.send('insertarProgramacio=' + nom.value + '&insertarDataInici=' + dataInici.value + '&insertarTipusContingut=' + tipusContingut.value + '&insertarVideowall=' + videowall.value + '&insertarDataFinal=' + dataFinal.value + '&insertarObservacions=' + observacions.value + '&insertarInconvenients=' + inconvenients.value);
}
// Actualizar Programacio
function actualizarProgramacio(id: any) {
    var dataInici: any = document.getElementById('actualizarProgramacioStartDate');
    var nom: any = document.getElementById('nomActualizarProgramacio');

    var videowall: any = document.getElementById('selectVideowallActualizarProgramacio');
    console.log(videowall.value);
    var dataFinal: any = document.getElementById('actualizarProgramacioFinalDate');
    var observacions: any = document.getElementById('actualizarProgramacioObservacions');
    var inconvenients: any = document.getElementById('actualizarProgramacioInconvenients');
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
    }
    xhr.send('actualitzarProgramacio=' + nom.value + '&actualitzarDataInici=' + dataInici.value + '&actualitzarVideowall=' + videowall.value + '&actualitzarDataFinal=' + dataFinal.value + '&actualitzarObservacions=' + observacions.value + '&actualitzarInconvenients=' + inconvenients.value + '&actualitzarid=' + id);
}
// Fi Insertar Programacio


// Insertar Llistes Programacions
// Filtrar Continguts
function filtrarContingut() {
    var filtrar: any = document.getElementById('buscarContingutFiltrar');
    var mostrar: any = document.getElementById('divMostrarContingutCrearLLista');
    setTimeout(() => {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './main/filtros.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            mostrar.innerHTML = this.responseText;
        }
        xhr.send('filtrarContingut=' + filtrar.value);
    }, 100);

}
// Insertar Contingut
function insertarContingut() {
    var nom: any = document.getElementById('insertNomContingut');
    var url: any = document.getElementById('insertNomContingut');
    var mostrar: any = document.getElementById('divMostrarContingutCrearLLista');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrar.innerHTML = this.responseText;
        }, 500);
    }
    xhr.send('nomInsertarContingut=' + nom.value + '&urlInsertarContingut=' + url.value);
}
// Drop Llistes Reproduccio
function dropLlistesReproduccio(ev: any, mostrar: any) {
    ev.preventDefault();

    var id: any = ev.dataTransfer.getData("drop");
    var separar: any = id.split(";");
    id = document.getElementById(id);

    mostrar = document.getElementById(mostrar);

    var newObject: any = id.cloneNode(true);

    newObject.onclick = function () {
        mostrar.removeChild(newObject);
        xhr.open('POST', './main/create.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

        var quitar: any = newObject.getAttribute('id').split(';');

        xhr.send('quitar=' + quitar[1]);
    }

    mostrar.appendChild(newObject);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('insertarContingutLlistes=' + separar[1]);

}
// Insertar Llista Programacio
function insertarLlista() {
    var nom: any = document.getElementById('nomInsertarLlista');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('llistes');
        }, 500);
    }
    xhr.send('nomInsertarLlista=' + nom.value);
}
// Actualizar Llista Programacio
function actualizarLlista(id: number) {
    var nom: any = document.getElementById('nomInsertarLlista');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        console.log(this.responseText);
        setTimeout(() => {
            mostrarTaula('llistes');
        }, 500);
    }
    xhr.send('nomActualitzarLlista=' + nom.value + '&idActualitzarLlista=' + id);
}
// Fi Llistes Programacio


// Insertar Videowall
// Insertar Grup
function insertarGrup() {
    var nom: any = document.getElementById('insertNomGrup');
    var mostrar: any = document.getElementById('grupInsertarVideowall');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrar.innerHTML = this.responseText;
        }, 500);
    }
    xhr.send('nomInsertarGrup=' + nom.value);
}
// Insertar Marques
function insertarMarca() {
    var nom: any = document.getElementById('insertNomMarca');
    var mostrar: any = document.getElementById('divMostrarMarquesInsertarVideowall');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrar.innerHTML = this.responseText;
        }, 500);
    }
    xhr.send('nomInsertarMarca=' + nom.value);
}
// Insertar Tipus Format
function insertarTFormat() {
    var nom: any = document.getElementById('insertTipusFormat');
    var mostrar: any = document.getElementById('tipusFormatInsertarVideowall');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrar.innerHTML = this.responseText;
        }, 500);
    }
    xhr.send('nomInsertarTipusFormat=' + nom.value);
}
// Drop Marques
function dropMarques(ev: any, mostrar: any) {
    ev.preventDefault();

    var id: any = ev.dataTransfer.getData("drop");
    var separar: any = id.split(";");
    id = document.getElementById(id);

    mostrar = document.getElementById(mostrar);

    var newObject: any = id.cloneNode(true);

    newObject.onclick = function () {
        mostrar.removeChild(newObject);
        xhr.open('POST', './main/create.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

        var quitar: any = newObject.getAttribute('id').split(';');

        xhr.send('quitar=' + quitar[1]);
    }

    mostrar.appendChild(newObject);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('insertarMarques=' + separar[1]);
}
// Insertar Videowall
function insertarVideowall() {
    var nom: any = document.getElementById('nomInsertarVideowall');
    var grup: any = document.getElementById('grupInsertarVideowall');
    var tipusFormat: any = document.getElementById('tipusFormatInsertarVideowall');
    var client: any = document.getElementById('clientInsertVideowall');
    var botiga: any = document.getElementById('botigaInsertVideowall');

    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('videowall');
        }, 500);
    }

    xhr.send('nomInsertarVideowall=' + nom.value + '&grupInsertarVideowall=' + grup.value + '&tipusFormatInsertarVideowall=' + tipusFormat.value + '&clientInsertarVideowall=' + client.value + '&botigaInsertarVideowall=' + botiga.value);
}
// Actualizar Videowall
function actualizarVideowall(id: any) {
    var nom: any = document.getElementById('nomInsertarVideowall');
    var grup: any = document.getElementById('grupInsertarVideowall');
    var tipusFormat: any = document.getElementById('tipusFormatInsertarVideowall');
    var client: any = document.getElementById('clientInsertVideowall');
    var botiga: any = document.getElementById('botigaInsertVideowall');

    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('videowall');
        }, 500);
        console.log(this.responseText);
    }
    xhr.send('idActualizarVideowall=' + id + '&nomActualizarVideowall=' + nom.value + '&grupActualizarVideowall=' + grup.value + '&tipusFormatActualizarVideowall=' + tipusFormat.value + '&clientActualizarVideowall=' + client.value + '&botigaActualizarVideowall=' + botiga.value);
}
// Fi Videowall


// Insertar Dispositius
// Insertar Dispositiu
function insertarDispositiu() {
    var full: boolean = true;
    var nom: any = document.getElementById('nomInsertarDispositius');
    var videowall: any = document.getElementById('videowallInsertarDispositius');
    var MAC: any = document.getElementById('MACInsertarDispositius');
    var model: any = document.getElementById('modelInsertarDispositius');
    var nSerie: any = document.getElementById('nSerieInsertarDispositius');
    var URL: any = document.getElementById('URLInsertarDispositius');
    var firmware: any = document.getElementById('firmwareInsertarDispositius');
    var pClient: any = document.getElementById('progClientInsertarDispositius');
    var IP: any = document.getElementById('IPInsertarDispositius');

    if (nom.value.length == 0) {
        full = false;
    } else if (videowall.value == "") {
        full = false;
    } else if (MAC.value.length == 0) {
        full = false;
    } else if (model.value.length == 0) {
        full = false;
    } else if (nSerie.value.length == 0) {
        full = false;
    } else if (URL.value.length == 0) {
        full = false;
    } else if (firmware.value.length == 0) {
        full = false;
    } else if (pClient.value.length == 0) {
        full = false;
    } else if (IP.value.length == 0) {
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
        }

        xhr.send('nomInsertarDispositius=' + nom.value + '&videowallInsertarDispositius=' + videowall.value + '&MACInsertarDispositius='
            + MAC.value + '&modelInsertarDispositius=' + model.value + '&nSerieInsertarDispositius=' + nSerie.value
            + '&URLInsertarDispositius=' + URL.value + '&firmwareInsertarDispositius=' + firmware.value + '&progClientInsertarDispositius='
            + pClient.value + '&IPInsertarDispositius=' + IP.value);

    } else {
        if (window.confirm("No s'han omplert tots els camps.\nAfegir Dispositiu?")) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', './main/create.php', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onload = function () {
                setTimeout(() => {
                    mostrarTaula('dispositius');
                }, 500);
                console.log(this.responseText);
            }

            xhr.send('nomInsertarDispositius=' + nom.value + '&videowallInsertarDispositius=' + videowall.value + '&MACInsertarDispositius='
                + MAC.value + '&modelInsertarDispositius=' + model.value + '&nSerieInsertarDispositius=' + nSerie.value
                + '&URLInsertarDispositius=' + URL.value + '&firmwareInsertarDispositius=' + firmware.value + '&progClientInsertarDispositius='
                + pClient.value + '&IPInsertarDispositius=' + IP.value);
        }
    }
}

function actualizarDispositiu(id: any) {
    var nom: any = document.getElementById('nomInsertarDispositius');
    var videowall: any = document.getElementById('videowallInsertarDispositius');
    var MAC: any = document.getElementById('MACInsertarDispositius');
    var model: any = document.getElementById('modelInsertarDispositius');
    var nSerie: any = document.getElementById('nSerieInsertarDispositius');
    var URL: any = document.getElementById('URLInsertarDispositius');
    var firmware: any = document.getElementById('firmwareInsertarDispositius');
    var pClient: any = document.getElementById('progClientInsertarDispositius');
    var IP: any = document.getElementById('IPInsertarDispositius');

    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/create.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrarTaula('dispositius');
        }, 500);
        console.log(this.responseText);
    }

    xhr.send('idActualizarDispositius=' + id + '&nomActualizarDispositius=' + nom.value + '&videowallActualizarDispositius=' + videowall.value + '&MACActualizarDispositius='
        + MAC.value + '&modelActualizarDispositius=' + model.value + '&nSerieActualizarDispositius=' + nSerie.value
        + '&URLActualizarDispositius=' + URL.value + '&firmwareActualizarDispositius=' + firmware.value + '&progClientActualizarDispositius='
        + pClient.value + '&IPActualizarDispositius=' + IP.value);


}
// FI Dispositius

// Actualitzar Marcas
function actualizarMarcas(id: any) {
    var input: any = document.getElementById('inputUpdateModal' + id);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/actualizar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('actualitzar=marcas&value=' + input.value + '&id=' + id);
    setTimeout(() => {
        mostrarTaula('marcas');
    }, 300);

}
function actualizartFormat(id: any) {
    var input: any = document.getElementById('inputUpdatetFormat' + id);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/actualizar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('actualitzar=tFormat&value=' + input.value + '&id=' + id);
    setTimeout(() => {
        mostrarTaula('tFormat');
    }, 300);

}
function actualizargrup(id: any) {
    var input: any = document.getElementById('inputUpdategrups' + id);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/actualizar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('actualitzar=grups&value=' + input.value + '&id=' + id);
    setTimeout(() => {
        mostrarTaula('grups');
    }, 300);

}


// Actualizar
function actualizar(id: any, name: string) {
    var mostrar: any = document.getElementById('mostrarIndex');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/actualizar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        mostrar.innerHTML = this.responseText;
    }
    xhr.send('actualitzar=' + name + '&id=' + id);
}

// Borrar Dades de les Taules
function deleteRow(id: string, tabla: string, campo: string, mostrarTabla: string) {
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
