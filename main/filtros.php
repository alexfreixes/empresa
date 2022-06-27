<?php
include('../db/database.php');

if (isset($_POST['filtrarContingut'])) {
    $sql = "SELECT * FROM `Contingut` WHERE `descripcio` LIKE '%" . $_POST['filtrarContingut'] . "%' ORDER BY id DESC";
    $execute = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_array($execute)) {
        echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="' . $row['id'] . '" value="' . $row['descripcio'] . '" readonly>';
    }
}
if (isset($_POST['filtrarLlistes'])) {
    $sql = "SELECT `id`, `descripcio` FROM `LlistaRepr` WHERE `descripcio` LIKE '%" . $_POST['filtrarLlistes'] . "%' ORDER BY id DESC";
    $execute = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_array($execute)) {
        echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="llista;' . $row['id'] . '" value="' . $row['descripcio'] . '" readonly>';
    }
}
