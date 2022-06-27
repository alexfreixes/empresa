<?php
include('./db/database.php');
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Control MagInfo - VideoWalls</title>
    <link rel="icon" href="./img/VW1.ico">

    <link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="./css/main.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="./js/main.js"></script>
    <script type="text/javascript" src="./js/ajax.js"></script>
    <script type="text/javascript" src="./js/ordenar.js"></script>
</head>

<body>
    <!-- Comença NAV -->
    <nav class="navbar-default navegador">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand titolNav" onclick="location.reload()" id="titulo">Control MagInfo - VideoWalls</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle botonsNav" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Crear<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a class="botonsNav" onclick="insertarDades('programacio')">Programació</a></li>
                            <li><a class="botonsNav" onclick="insertarDades('llistes')">Llistes Reproducció</a></li>
                            <li><a class="botonsNav" onclick="insertarDades('videowall')">VideoWalls</a></li>
                            <li><a class="botonsNav" onclick="insertarDades('dispositius')">Dispositius</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle botonsNav" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Veure<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a class="botonsNav" onclick="mostrarTaula('programacio')">Programació</a></li>
                            <li><a class="botonsNav" onclick="mostrarTaula('llistes')">Llistes Reproducció</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a class="botonsNav" onclick="mostrarTaula('videowall')">VideoWalls</a></li>
                            <li><a class="botonsNav" onclick="mostrarTaula('dispositius')">Dispositius</a></li>
                            <li><a class="botonsNav" onclick="mostrarTaula('marcas')">Marcas</a></li>
                            <li><a class="botonsNav" onclick="mostrarTaula('tFormat')">Tipus de Format</a></li>
                            <li><a class="botonsNav" onclick="mostrarTaula('grups')">Grups</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div id="mostrarIndex">
    </div>
    <!-- Fi NAV -->
    <!-- jQuery -->
    <script src="./js/jquery.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="./js/bootstrap.min.js"></script>
</body>

</html>