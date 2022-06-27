var orden: boolean = true;
var lastColumn: string = "";
var lastNumber: number = -1;
function ordenar(table: any, column: any, mostrar: any, number: any) {
    mostrar = document.getElementById(mostrar);

    var mostrarOrden: any = document.getElementsByTagName('th');
    if (lastNumber >= 0) {
        mostrarOrden[lastNumber].classList.remove('vhcenter');
    }
    mostrarOrden[number].classList.add('vhcenter');

    if (mostrarOrden[number].childNodes.length > 1) {
        mostrarOrden[number].removeChild(mostrarOrden[number].lastChild);
    }
    if (lastColumn != column) {
        lastColumn = column;
        orden = true;
        if (lastNumber >= 0) {
            mostrarOrden[lastNumber].removeChild(mostrarOrden[lastNumber].lastChild);
        }
    }

    var imgOrden: any = document.createElement('img');
    imgOrden.classList.add('img-responsive');
    imgOrden.style.paddingLeft = "5px";
    var direction: string;
    if (orden) {
        orden = false;
        direction = 'ASC';
        imgOrden.src = './img/up-arrow.png';
    } else {
        orden = true;
        direction = 'DESC';
        imgOrden.src = './img/down-arrow.png';
    }

    mostrarOrden[number].appendChild(imgOrden);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', './main/ordenar.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        setTimeout(() => {
            mostrar.innerHTML = this.responseText;
        }, 100);
    }
    xhr.send('tableName=' + table + '&columName=' + column + '&direction=' + direction);
    lastNumber = number;
}