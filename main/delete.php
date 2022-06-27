<?php
session_start();
include('../db/database.php');
if (isset($_POST['borrar'])) {
    if (isset($_SESSION['listaProgramacio'])) {
        unset($_SESSION['listaProgramacio']);
    }
    if (isset($_SESSION['lista'])) {
        foreach ($_SESSION['lista'] as $key => $value) {
            unset($_SESSION['lista'][$key]);
        }
        unset($_SESSION['lista']);
    }
    if (isset($_SESSION['MarquesVideowall'])) {
        foreach ($_SESSION['MarquesVideowall'] as $key => $value) {
            unset($_SESSION['MarquesVideowall'][$key]);
        }
        unset($_SESSION['MarquesVideowall']);
    }
    if (isset($_SESSION['ContingutLlistes'])) {
        foreach ($_SESSION['ContingutLlistes'] as $key => $value) {
            unset($_SESSION['ContingutLlistes'][$key]);
        }
        unset($_SESSION['ContingutLlistes']);
    }
}
if (isset($_POST['quitar'])) {
    if (isset($_SESSION['listaProgramacio'])) {
        if ($_SESSION['listaProgramacio'] == $_POST['quitar']) {
            unset($_SESSION['listaProgramacio']);
        }
    }
    if (isset($_SESSION['lista'])) {
        foreach ($_SESSION['lista'] as $key => $value) {
            if ($value == $_POST['quitar']) {
                unset($_SESSION['lista'][$key]);
            }
        }
    }
    if (isset($_SESSION['MarquesVideowall'])) {
        foreach ($_SESSION['MarquesVideowall'] as $key => $value) {
            if ($value == $_POST['quitar']) {
                unset($_SESSION['MarquesVideowall'][$key]);
            }
        }
    }
}
if (isset($_POST['idDelete'])) {
    $delete = "DELETE FROM " . $_POST['tabla'] . " WHERE " . $_POST['campo'] . " LIKE '" . $_POST['idDelete'] . "'";
    $execute = mysqli_query($conn, $delete);
} else {
    header("Location: ../index.php");
}
