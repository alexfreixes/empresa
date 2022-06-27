<?php
session_start();
require_once('../db/database.php');

// Crear Programacio
// Crear Tipus de Contingut
if (isset($_POST['insertTipusContingut'])) {
    if ($_POST['insertTipusContingut'] != "") {
        $sql = "INSERT INTO `TipusContingut`(`descripcio`) VALUES ('" . $_POST['insertTipusContingut'] . "')";
        $execute = mysqli_query($conn, $sql);

        $sql = "SELECT * FROM `TipusContingut` ORDER BY id DESC LIMIT 0,1";
        $execute = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($execute);
        echo '<option value="' . $row['id'] . '" class="text-center">' . $row['descripcio'] . '</option>';
    }
}
// Guardar Llista per insertar
if (isset($_POST['insertarLlistaProgramacio'])) {
    $_SESSION['listaProgramacio'] =  $_POST['insertarLlistaProgramacio'];
}
if (isset($_POST['actualizarLlistaProgramacio'])) {
    $_SESSION['listaProgramacio'] =  $_POST['actualizarLlistaProgramacio'];
}
// Insertar Programacio
if (isset($_POST['insertarProgramacio'])) {
    $sql = "INSERT INTO `Programacions`(`descripcio`, `idTipusContingut`, `observacions`) VALUES ('" . $_POST['insertarProgramacio'] . "','" . $_POST['insertarTipusContingut'] . "','" . $_POST['insertarObservacions'] . "')";
    $execute = mysqli_query($conn, $sql);

    $select = 'SELECT * FROM `Programacions` ORDER BY id DESC LIMIT 0,1';
    $execute = mysqli_query($conn, $select);
    $row = mysqli_fetch_array($execute);

    $sql = "INSERT INTO `VideowallProgramacio`(`NSVW`, `idProgramacio`, `activa`) VALUES ('" . $_POST['insertarVideowall'] . "','" . $row['id'] . "','1')";
    $execute = mysqli_query($conn, $sql);

    $sql = "INSERT INTO `LlistesProgramacions`(`idProgramacio`, `idLlistes`, `dataInici`, `dataFinal`, `inconvenients`) VALUES ('" . $row['id'] . "','" . $_SESSION['listaProgramacio'] . "','" . $_POST['insertarDataInici'] . "','" . $_POST['insertarDataFinal'] . "','" . $_POST['insertarInconvenients'] . "')";
    $execute = mysqli_query($conn, $sql);
    if (isset($_SESSION['listaProgramacio'])) {
        unset($_SESSION['listaProgramacio']);
    }
}
// Actualizar Programacion
if (isset($_POST['actualitzarProgramacio'])) {

    $sql = "SELECT gru.descripcio as 'grups', 
                pro.id as 'id', 
                pro.descripcio as 'nom',
                pro.observacions as 'observacions',
                tc.descripcio as 'tContingut',
                llis.descripcio as 'nomLlista',
                llis.id as 'idLlista', 
                llispro.dataInici as 'dataInici',
                llispro.dataFinal as 'datafinal',
                llispro.inconvenients as 'inconvenients',
                vipro.NSVW as 'videowall',
                vipro.activa as 'activa'
            FROM `Programacions` pro 
                LEFT JOIN VideowallProgramacio vipro ON pro.id = vipro.idProgramacio 
                LEFT JOIN Videowall vi ON vipro.NSVW = vi.NSVW 
                LEFT JOIN Grups gru ON vi.idGrup = gru.id
                LEFT JOIN LlistesProgramacions llispro ON pro.id = llispro.idProgramacio 
                LEFT JOIN LlistaRepr llis ON llispro.idLlistes = llis.id
                LEFT JOIN TipusContingut tc ON pro.idTipusContingut = tc.id 
            WHERE pro.id =" . $_POST['actualitzarid'] . " AND vipro.activa = 1";

    $execute = mysqli_query($conn, $sql);
    $old = mysqli_fetch_array($execute);

    if ($old['nom'] != $_POST['actualitzarProgramacio']) {
        $update = "UPDATE `Programacions` SET `descripcio`='" . $_POST['actualitzarProgramacio'] . "' WHERE id = " . $old['id'];
        $execute = mysqli_query($conn, $update);
    }
    if ($old['dataInici'] != $_POST['actualitzarDataInici']) {
        $update = "UPDATE `LlistesProgramacions` SET `dataInici`='" . $_POST['actualitzarDataInici'] . "' WHERE `idProgramacio` = " . $old['id'] . " AND `dataInici` = '" . $old['dataInici'] . "'";
        $execute = mysqli_query($conn, $update);
    }
    if ($old['datafinal'] != $_POST['actualitzarDataFinal']) {
        $update = "UPDATE `LlistesProgramacions` SET `dataFinal`='" . $_POST['actualitzarDataFinal'] . "' WHERE `idProgramacio` = " . $old['id'] . " AND `dataFinal` = '" . $old['datafinal'] . "'";
        $execute = mysqli_query($conn, $update);
    }
    if ($old['videowall'] != $_POST['actualitzarVideowall']) {
        $update = "UPDATE `VideowallProgramacio` SET `activa`='0' WHERE idProgramacio = " . $old['id'];
        $execute = mysqli_query($conn, $update);

        $insert = "INSERT INTO `VideowallProgramacio`(`NSVW`, `idProgramacio`, `activa`) VALUES ('" . $_POST['actualitzarVideowall'] . "','" . $_POST['actualitzarid'] . "',1)";
        $execute = mysqli_query($conn, $insert);
    }

    if ($old['observacions'] != $_POST['actualitzarObservacions']) {
        $update = "UPDATE `Programacions` SET `observacions`='" . $_POST['actualitzarObservacions'] . "' WHERE `id` = " . $old['id'];
        $execute = mysqli_query($conn, $update);
    }
    if ($old['inconvenients'] != $_POST['actualitzarInconvenients']) {
        $update = "UPDATE `LlistesProgramacions` SET `inconvenients`='" . $_POST['actualitzarInconvenients'] . "' WHERE `idProgramacio` = '" . $old['id'] . "' AND `inconvenients` = '" . $old['inconvenients'] . "'";
        $execute = mysqli_query($conn, $update);
    }
    if (isset($_SESSION['listaProgramacio'])) {
        if ($old['idLlista'] != $_SESSION['listaProgramacio']) {
            $update = "UPDATE `LlistesProgramacions` SET `activa`='0' WHERE idProgramacio = " . $old['id'];
            $execute = mysqli_query($conn, $update);

            $insert = "INSERT INTO `LlistesProgramacions`(`idProgramacio`, `idLlistes`, `dataInici`, `dataFinal`, `inconvenients`, `activa`) VALUES ('" . $old['id'] . "','" . $_SESSION['listaProgramacio'] . "','" . $_POST['actualitzarDataInici'] . "','" . $_POST['actualitzarDataFinal'] . "','" . $_POST['actualitzarInconvenients'] . "','1')";
            $execute = mysqli_query($conn, $insert);
        }
    }




    if (isset($_SESSION['listaProgramacio'])) {
        unset($_SESSION['listaProgramacio']);
    }
}
// Fi Crear Programacio

// Crear Llista de Reproduccio
// Crear Contingut
if (isset($_POST['nomInsertarContingut'])) {
    if ($_POST['nomInsertarContingut'] != "") {
        $sql = "INSERT INTO `Contingut`(`descripcio`, `url`) VALUES ('" . $_POST['nomInsertarContingut'] . "','" . $_POST['urlInsertarContingut'] . "')";
        $execute = mysqli_query($conn, $sql);

        $sql = "SELECT * FROM `Contingut` ORDER BY id DESC LIMIT 0,10";
        $execute = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_array($execute)) {
            echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="' . $row['id'] . '" value="' . $row['descripcio'] . '" readonly>';
        }
    }
}
// Guardar Contingut per insertar
if (isset($_POST['insertarContingutLlistes'])) {
    if (!isset($_SESSION['ContingutLlistes'])) {
        $_SESSION['ContingutLlistes'] = array();
    }
    array_push($_SESSION['ContingutLlistes'], $_POST['insertarContingutLlistes']);
}
// Insertar Llistes Programacio
if (isset($_POST['nomInsertarLlista'])) {

    $insert = "INSERT INTO `LlistaRepr`(`descripcio`) VALUES ('" . $_POST['nomInsertarLlista'] . "')";
    mysqli_query($conn, $insert);

    $sql = "SELECT * FROM `LlistaRepr` ORDER BY id DESC LIMIT 0,1";
    $executar = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($executar);

    foreach ($_SESSION['ContingutLlistes'] as $key => $value) {
        $insert = "INSERT INTO `LlistesContingut`(`idLlistes`, `idContingut`) VALUES ('" . $row['id'] . "','$value')";
        mysqli_query($conn, $insert);
    }

    if (isset($_SESSION['ContingutLlistes'])) {
        foreach ($_SESSION['ContingutLlistes'] as $key => $value) {
            unset($_SESSION['ContingutLlistes'][$key]);
        }
        unset($_SESSION['ContingutLlistes']);
    }
}
// Actualitzar Llistes Programacio
if (isset($_POST['nomActualitzarLlista'])) {

    $update = "UPDATE `llistarepr` SET `descripcio`='" . $_POST['nomActualitzarLlista'] . "' WHERE id = " . $_POST['idActualitzarLlista'];
    echo $update;
    mysqli_query($conn, $update);

    $delete = "DELETE FROM `llistescontingut` WHERE `idLlistes` = " . $_POST['idActualitzarLlista'];
    echo "\n" . $delete;
    mysqli_query($conn, $delete);

    foreach ($_SESSION['ContingutLlistes'] as $key => $value) {
        $insert = "INSERT INTO `LlistesContingut`(`idLlistes`, `idContingut`) VALUES ('" . $_POST['idActualitzarLlista'] . "','$value')";
        mysqli_query($conn, $insert);
    }

    if (isset($_SESSION['ContingutLlistes'])) {
        foreach ($_SESSION['ContingutLlistes'] as $key => $value) {
            unset($_SESSION['ContingutLlistes'][$key]);
        }
        unset($_SESSION['ContingutLlistes']);
    }
}
// Fi Crear Llistes Reproduccio

// Crear Videowall
// Insertar Grup
if (isset($_POST['nomInsertarGrup'])) {
    if ($_POST['nomInsertarGrup'] != "") {
        $sql = "INSERT INTO `Grups`(`descripcio`) VALUES ('" . $_POST['nomInsertarGrup'] . "')";
        $execute = mysqli_query($conn, $sql);
        echo "<option selected disabled>Selecciona un Grup</option>";
        $sql = 'SELECT `id`, `descripcio` FROM `Grups`';
        $execute = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_array($execute)) {
            echo '<option value="' . $row['id'] . '">' . $row['descripcio'] . '</option>';
        }
    }
}
// Insertar Marques
if (isset($_POST['nomInsertarMarca'])) {
    if ($_POST['nomInsertarMarca'] != "") {
        $sql = "INSERT INTO `Marcas`(`descripcio`) VALUES ('" . $_POST['nomInsertarMarca'] . "')";
        $execute = mysqli_query($conn, $sql);

        $sql = "SELECT * FROM `Marcas` ORDER BY id DESC";
        $execute = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_array($execute)) {
            echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="marca;' . $row['id'] . '" value="' . $row['descripcio'] . '" readonly>';
        }
    }
}
// Insertar Tipus Format
if (isset($_POST['nomInsertarTipusFormat'])) {
    if ($_POST['nomInsertarTipusFormat'] != "") {
        $sql = "INSERT INTO `TipusFormat`(`descripcio`) VALUES ('" . $_POST['nomInsertarTipusFormat'] . "')";
        $execute = mysqli_query($conn, $sql);

        echo "<option selected disabled>Selecciona un Format</option>";

        $sql = 'SELECT `id`, `descripcio` FROM `TipusFormat`';
        $execute = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_array($execute)) {

            echo '<option value="' . $row['id'] . '">' . $row['descripcio'] . '</option>';
        }
    }
}

// Guardar Marques per insertar
if (isset($_POST['insertarMarques'])) {
    if (!isset($_SESSION['MarquesVideowall'])) {
        $_SESSION['MarquesVideowall'] = array();
    }
    array_push($_SESSION['MarquesVideowall'], $_POST['insertarMarques']);
}
// Insertar Videowall
if (isset($_POST['nomInsertarVideowall'])) {

    $sql = "SELECT * FROM `Videowall` ORDER BY NSVW DESC LIMIT 0,1";
    $executar = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($executar);

    $id = explode("VW", $row['NSVW']);
    $id[1]++;
    if ($id[1] < 10) {
        $NSVW = "VW000" . $id[1];
    } elseif ($id[1] < 100) {
        $NSVW =  "VW00" . $id[1];
    } elseif ($id[1] < 1000) {
        $NSVW =  "VW0" . $id[1];
    } else {
        $NSVW = "VW" . $id[1];
    }

    /* echo "\n" . $NSVW;
    echo "\n" . $_POST['nomInsertarVideowall'];
    echo "\n" . $_POST['grupInsertarVideowall'];
    echo "\n" . $_POST['tipusFormatInsertarVideowall'];
    echo "\n" . $_POST['clientInsertarVideowall'];
    echo "\n" . $_POST['botigaInsertarVideowall']; */
    $insert = "INSERT INTO `Videowall`(`NSVW`, `descripcio`, `idGrup`, `idTipusFormat`, `idClient`, `idBotiga`) VALUES ('" . $NSVW . "',
    '" . $_POST['nomInsertarVideowall'] . "','" . $_POST['grupInsertarVideowall'] . "','" . $_POST['tipusFormatInsertarVideowall'] . "',
    '" . $_POST['clientInsertarVideowall'] . "','" . $_POST['botigaInsertarVideowall'] . "')";
    mysqli_query($conn, $insert);

    foreach ($_SESSION['MarquesVideowall'] as $key => $value) {
        $insert = "INSERT INTO `MarcasVideowall`(`NSVW`, `idMarcas`) VALUES ('" . $NSVW . "','$value')";
        mysqli_query($conn, $insert);
    }

    if (isset($_SESSION['MarquesVideowall'])) {
        foreach ($_SESSION['MarquesVideowall'] as $key => $value) {
            unset($_SESSION['MarquesVideowall'][$key]);
        }
        unset($_SESSION['MarquesVideowall']);
    }
}
// Actualizar Videowall
if (isset($_POST['nomActualizarVideowall'])) {

    $update = "UPDATE `Videowall` SET `descripcio`='" . $_POST['nomActualizarVideowall'] . "' WHERE `NSVW` = '" . $_POST['idActualizarVideowall'] . "'";
    $executar = mysqli_query($conn, $update);

    $update = "UPDATE `Videowall` SET `idTipusFormat`=" . $_POST['tipusFormatActualizarVideowall'] . " WHERE `NSVW` = '" . $_POST['idActualizarVideowall'] . "'";
    $executar = mysqli_query($conn, $update);

    $update = "UPDATE `Videowall` SET `idGrup`=" . $_POST['grupActualizarVideowall'] . " WHERE `NSVW` = '" . $_POST['idActualizarVideowall'] . "'";
    $executar = mysqli_query($conn, $update);

    $update = "UPDATE `Videowall` SET `idClient`=" . $_POST['clientActualizarVideowall'] . " WHERE `NSVW` = '" . $_POST['idActualizarVideowall'] . "'";
    $executar = mysqli_query($conn, $update);

    $update = "UPDATE `Videowall` SET `idBotiga`=" . $_POST['botigaActualizarVideowall'] . " WHERE `NSVW` = '" . $_POST['idActualizarVideowall'] . "'";
    $executar = mysqli_query($conn, $update);

    $delete = "DELETE FROM `MarcasVideowall` WHERE `NSVW` = '" . $_POST['idActualizarVideowall'] . "'";
    $executar = mysqli_query($conn, $delete);

    foreach ($_SESSION['MarquesVideowall'] as $key => $value) {
        $insert = "INSERT INTO `MarcasVideowall`(`NSVW`, `idMarcas`) VALUES ('" . $_POST['idActualizarVideowall'] . "','$value')";
        mysqli_query($conn, $insert);
    }

    if (isset($_SESSION['MarquesVideowall'])) {
        foreach ($_SESSION['MarquesVideowall'] as $key => $value) {
            unset($_SESSION['MarquesVideowall'][$key]);
        }
        unset($_SESSION['MarquesVideowall']);
    }
}


// Insertar Dispositiu
if (isset($_POST['nomInsertarDispositius'])) {
    $insert = "INSERT INTO `Dispositiu`(`NSVW`, `nom`, `MAC`, `model`, `numSerie`, `url`, `firmware`, `prgClient`, `IP`) VALUES 
    ('" . $_POST['videowallInsertarDispositius'] . "','" . $_POST['nomInsertarDispositius'] . "','" . $_POST['MACInsertarDispositius'] . "',
    '" . $_POST['modelInsertarDispositius'] . "','" . $_POST['nSerieInsertarDispositius'] . "','" . $_POST['URLInsertarDispositius'] . "',
    '" . $_POST['firmwareInsertarDispositius'] . "','" . $_POST['progClientInsertarDispositius'] . "','" . $_POST['IPInsertarDispositius'] . "')";
    echo $insert;
    mysqli_query($conn, $insert);
}
// Actualizar Dispositiu
if (isset($_POST['nomActualizarDispositius'])) {
    $update = "UPDATE `Dispositiu` SET `NSVW`='" . $_POST['videowallActualizarDispositius'] . "',`nom`='" . $_POST['nomActualizarDispositius'] . "',
    `MAC`='" . $_POST['MACActualizarDispositius'] . "',`model`='" . $_POST['modelActualizarDispositius'] . "',`numSerie`='" . $_POST['nSerieActualizarDispositius'] . "',
    `url`='" . $_POST['URLActualizarDispositius'] . "',`firmware`='" . $_POST['firmwareActualizarDispositius'] . "',`prgClient`='" . $_POST['progClientActualizarDispositius'] . "',
    `IP`='" . $_POST['IPActualizarDispositius'] . "' WHERE id = " . $_POST['idActualizarDispositius'];
    mysqli_query($conn, $update);
    echo $update;

}
// Fi Crear Videowall