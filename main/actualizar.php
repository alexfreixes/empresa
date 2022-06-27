<?php
session_start();
include('../db/database.php');
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

if (isset($_POST['actualitzar'])) {
    if ($_POST['actualitzar'] == 'Programacions') {

        if (isset($_SESSION['listaProgramacio'])) {
            unset($_SESSION['listaProgramacio']);
        }

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
                       vi.descripcio as 'videowall',
                       vi.NSVW as 'NSVW'      
                FROM `Programacions` pro 
                    LEFT JOIN VideowallProgramacio vipro ON pro.id = vipro.idProgramacio 
                    LEFT JOIN Videowall vi ON vipro.NSVW = vi.NSVW 
                    LEFT JOIN Grups gru ON vi.idGrup = gru.id
                    LEFT JOIN LlistesProgramacions llispro ON pro.id = llispro.idProgramacio 
                    LEFT JOIN LlistaRepr llis ON llispro.idLlistes = llis.id
                    LEFT JOIN TipusContingut tc ON pro.idTipusContingut = tc.id 
                WHERE pro.id =" . $_POST['id'] . " AND vipro.activa = 1";
        $execute = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($execute);
?>
        <div class="container">
            <div class="row">
                <div class="separar"></div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Nom:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nomActualizarProgramacio" placeholder="Nom" value="<?php echo $row['nom']; ?>">
                    </div>
                    <h2>Videowall:</h2>
                    <div class="form-group divSelectProgramacio vhcenter">
                        <select id="selectVideowallActualizarProgramacio" class="padding btn btn-default">
                            <?php
                            $sql = 'SELECT `NSVW`, `descripcio` FROM `Videowall`';
                            $execute = mysqli_query($conn, $sql);

                            echo '<option value="' . $row['NSVW'] . '" class="text-center" selected>' . $row['videowall'] . '</option>';

                            while ($options = mysqli_fetch_array($execute)) {
                                echo '<option value="' . $options['NSVW'] . '" class="text-center">' . $options['descripcio'] . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <h2>Llistes Reproducció</h2>
                    <div class="border">
                        <div class="vhcenter">
                            <input class="padding" type="text" name="buscarLlistesInsertarProgramacio" id="buscarLlistesInsertarProgramacio" onkeydown="filtrarLlistesInsertProgramacio()" placeholder="Filtrar Llista">
                        </div>
                        <div id="divMostrarLlistesInsertProgramacio">
                            <?php
                            $sql = "SELECT `id`, `descripcio` FROM `LlistaRepr` ORDER BY id DESC LIMIT 0,10";
                            $execute = mysqli_query($conn, $sql);
                            while ($filaInterna = mysqli_fetch_array($execute)) {
                                echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="llista;' . $filaInterna['id'] . '" value="' . $filaInterna['descripcio'] . '" readonly>';
                            }
                            ?>
                        </div>
                    </div>

                </div>
                <div class="col-lg-offset-1 col-lg-4">
                    <div class="vhcenterBetween">
                        <div>
                            <h2>Data Inici</h2>
                            <input type="date" id="actualizarProgramacioStartDate" value="<?php echo date('Y-m-d', strtotime($row['dataInici'])); ?>">
                        </div>
                        <div>
                            <h2>Data Final</h2>
                            <input type="date" value="<?php echo date('Y-m-d', strtotime($row['datafinal'])); ?>" id="actualizarProgramacioFinalDate">
                        </div>
                    </div>
                    <h2>Observacions</h2>
                    <textarea id="actualizarProgramacioObservacions" class="form-control" rows="3"><?php echo $row['observacions']; ?></textarea>
                    <h2>Inconvenients</h2>
                    <textarea id="actualizarProgramacioInconvenients" class="form-control" rows="3"><?php echo $row['inconvenients']; ?></textarea>
                    <div class="vhcenter" id="divActivarProgramacioActualizarProgramacio">
                        <label for="">Activar Programacio en el Videowall </label><input type="checkbox" name="" id="checkboxActivarProgramacio">
                    </div>
                    <h2>Insertar Llista</h2>
                    <div class="border text-center" id="actualizarLlista" ondragover="allowDrop(event)" ondrop="dropProgramacio(event,'actualizarLlista')">
                        <input class="borderPetit" type="text" id="llista;<?php echo $row['idLlista']; ?>" value="<?php echo $row['nomLlista']; ?>" readonly="">
                        <?php
                        $_SESSION['listaProgramacio'] = $row['idLlista'];
                        ?>
                    </div>
                    <div class="vhcenter">
                        <button type="button" class="btn btn-default separar2" id="btnCrearLlista" onclick="actualizarProgramacio(<?php echo $row['id']; ?>)">Actualizar Programacio</button>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    <?php
    } else if ($_POST['actualitzar'] == 'LlistaRepr') {
        if (isset($_SESSION['lista'])) {
            foreach ($_SESSION['lista'] as $key => $value) {
                unset($_SESSION['lista'][$key]);
            }
            unset($_SESSION['lista']);
        }
        if (isset($_SESSION['ContingutLlistes'])) {
            foreach ($_SESSION['ContingutLlistes'] as $key => $value) {
                unset($_SESSION['ContingutLlistes'][$key]);
            }
            unset($_SESSION['ContingutLlistes']);
        }
        if (!isset($_SESSION['ContingutLlistes'])) {
            $_SESSION['ContingutLlistes'] = array();
        }

        $countContingut = "SELECT COUNT(*) as 'contador' FROM `LlistesContingut` WHERE `idLlistes` = " . $_POST['id'];
        $executeCountContingut = mysqli_query($conn, $countContingut);
        $totalRowsContingut = mysqli_fetch_assoc($executeCountContingut);
        if ($totalRowsContingut['contador'] > 0) {

            for ($i = 0; $i < $totalRowsContingut['contador']; $i++) {
                $sql = "SELECT * FROM `LlistesContingut` WHERE `idLlistes` = " . $_POST['id'] . " LIMIT $i,1";
                $execute = mysqli_fetch_assoc(mysqli_query($conn, $sql));
                $arrayContingutNumber[$_POST['id']][$i] = $execute['idContingut'];
            }
            foreach ($arrayContingutNumber as $keys) {
                foreach ($keys as $key => $value) {

                    $sqlContingutString = "SELECT * FROM `Contingut` WHERE `id` = $value";
                    $execute = mysqli_fetch_assoc(mysqli_query($conn, $sqlContingutString));
                    $arrayContingutString[$_POST['id']][$key] = '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="cont;' . $execute['id'] . '" value="' . $execute['descripcio'] . '" readonly="">';
                    array_push($_SESSION['ContingutLlistes'], $execute['id']);
                }
            }
        }
    ?>
        <div class="container">
            <div class="row">
                <div class="separar"></div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Nom:</h2>
                    <div class="form-group">
                        <?php
                        $sql = "SELECT `descripcio` FROM `llistarepr` WHERE id = " . $_POST['id'];
                        $execute = mysqli_query($conn, $sql);
                        $row = mysqli_fetch_array($execute);
                        ?>
                        <input type="text" class="form-control" id="nomInsertarLlista" value="<?php echo $row['descripcio']; ?>" placeholder="Nom">
                    </div>
                    <h2 class="separar">Continguts</h2>
                    <div class="border">
                        <div class="vhcenter">
                            <button type="button" class="padding btn btn-sm btn-default" data-toggle="modal" data-target="#crearContingut">
                                Crear Contingut
                            </button>
                            <input class="padding" type="text" name="buscarContingutFiltrar" id="buscarContingutFiltrar" onkeydown="filtrarContingut()" placeholder="Filtrar Contingut">
                        </div>
                        <div id="divMostrarContingutCrearLLista">
                            <?php
                            $sql = "SELECT * FROM `Contingut` ORDER BY id DESC LIMIT 0,10";
                            $execute = mysqli_query($conn, $sql);
                            while ($row = mysqli_fetch_array($execute)) {
                                echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="cont;' . $row['id'] . '" value="' . $row['descripcio'] . '" readonly>';
                            }
                            ?>
                        </div>
                    </div>
                </div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Afegir a la Llista</h2>
                    <div class="border text-center" id="anadirCont" ondragover="allowDrop(event)" ondrop="dropLlistesReproduccio(event,'anadirCont')">
                        <?php
                        if (!empty($arrayContingutString[$_POST['id']][0])) {
                            echo $arrayContingutString[$_POST['id']][0];
                        }
                        if (!empty($arrayContingutString[$_POST['id']][1])) {
                            echo $arrayContingutString[$_POST['id']][1];
                        }
                        if (!empty($arrayContingutString[$_POST['id']][2])) {
                            echo $arrayContingutString[$_POST['id']][2];
                        }
                        if (!empty($arrayContingutString[$_POST['id']][3])) {
                            echo $arrayContingutString[$_POST['id']][3];
                        }
                        if (!empty($arrayContingutString[$_POST['id']][4])) {
                            echo $arrayContingutString[$_POST['id']][4];
                        }
                        if (!empty($arrayContingutString[$_POST['id']][5])) {
                            echo $arrayContingutString[$_POST['id']][5];
                        }
                        if (!empty($arrayContingutString[$_POST['id']][6])) {
                            echo $arrayContingutString[$_POST['id']][6];
                        }
                        if (!empty($arrayContingutString[$_POST['id']][7])) {
                            echo $arrayContingutString[$_POST['id']][7];
                        }
                        if (!empty($arrayContingutString[$_POST['id']][8])) {
                            echo $arrayContingutString[$_POST['id']][8];
                        }
                        if (!empty($arrayContingutString[$_POST['id']][9])) {
                            echo $arrayContingutString[$_POST['id']][9];
                        }
                        ?>
                    </div>
                    <div class="vhcenter">
                        <button type="button" class="btn btn-default separar2" id="btnCrearLlista" onclick="actualizarLlista(<?php echo $_POST['id']; ?>)">Actualizar Llista</button>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <div class="modal fade" id="crearContingut" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Crear Contingut</h4>
                    </div>
                    <div class="modal-body">
                        <div class="crearContingut padding" id="crearContingut">
                            <div class="form-group">
                                <label for="insertNomContingut">Nom: </label>
                                <input type="text" class="form-control" id="insertNomContingut" placeholder="Nom">
                            </div>
                            <div class="form-group">
                                <label for="insertURLContingut">URL: </label>
                                <input type="text" class="form-control" id="insertURLContingut" placeholder="URL">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="insertarContingut()" data-dismiss="modal">Crear</button>
                    </div>
                </div>
            </div>
        </div>
    <?php
    } else if ($_POST['actualitzar'] == 'Videowall') {
    ?>
        <div class="container">
            <div class="row">
                <div class="separar"></div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Nom:</h2>
                    <div class="form-group">
                        <?php
                        $sql = "SELECT vi.NSVW as 'NSVW', vi.descripcio as 'nom', contrac.descripcio as 'contracte', cli.nomFiscal as 'client',gru.descripcio as 'grup',
                        tf.descripcio as 'format', bot.nomComercial as 'botiga' FROM Videowall vi LEFT JOIN Contractes contrac ON vi.idContracte = contrac.id 
                        LEFT JOIN Clients cli ON vi.idClient = cli.id LEFT JOIN Grups gru ON vi.idGrup = gru.id LEFT JOIN TipusFormat tf ON vi.idTipusFormat = tf.id 
                        LEFT JOIN Botigues bot ON bot.idClient = cli.id WHERE vi.NSVW = '" . $_POST['id'] . "'";
                        $execute = mysqli_query($conn, $sql);
                        $row = mysqli_fetch_array($execute);
                        ?>
                        <input type="text" class="form-control" id="nomInsertarVideowall" value="<?php echo $row['nom']; ?>" placeholder="Nom">
                    </div>
                    <h2>Grup:</h2>
                    <div class="form-group">
                        <div class="vhcenterAround">
                            <button type="button" class="padding btn btn-default" data-toggle="modal" data-target="#crearGrup">
                                Crear Grup
                            </button>
                            <select id="grupInsertarVideowall" class="padding btn btn-default">
                                <?php
                                $sql = 'SELECT `id`, `descripcio` FROM `Grups`';
                                $execute = mysqli_query($conn, $sql);

                                while ($options = mysqli_fetch_array($execute)) {
                                    if ($row['grup'] == $options['descripcio']) {
                                        echo '<option value="' . $options['id'] . '" selected>' . $options['descripcio'] . '</option>';
                                    } else {
                                        echo '<option value="' . $options['id'] . '">' . $options['descripcio'] . '</option>';
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <h2>Marques</h2>
                    <div class="border">
                        <div class="vhcenterAround">
                            <button type="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#crearMarca">
                                Crear Marca
                            </button>
                            <input class="padding" type="text" name="marquesInsertarVideowall" id="marquesInsertarVideowall" onkeydown="filtrarmarquesInsertarVideowall()" placeholder="Filtrar Marques.">
                        </div>
                        <div id="divMostrarMarquesInsertarVideowall">
                            <?php
                            $sql = "SELECT `id`, `descripcio` FROM `Marcas` ORDER BY id DESC";
                            $execute = mysqli_query($conn, $sql);
                            while ($executeMarcas = mysqli_fetch_array($execute)) {
                                echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="marca;' . $executeMarcas['id'] . '" value="' . $executeMarcas['descripcio'] . '" readonly>';
                            }
                            ?>
                        </div>
                    </div>
                </div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Tipus Format:</h2>
                    <div class="form-group">
                        <div class="vhcenterAround">
                            <button type="button" class="padding btn btn-default" data-toggle="modal" data-target="#crearTipusFormat">
                                Crear Format
                            </button>
                            <select id="tipusFormatInsertarVideowall" class="padding btn btn-default">
                                <option selected disabled>Selecciona un Format</option>
                                <?php
                                $sql = 'SELECT `id`, `descripcio` FROM `TipusFormat`';
                                $execute = mysqli_query($conn, $sql);

                                while ($options = mysqli_fetch_array($execute)) {

                                    if ($row['format'] == $options['descripcio']) {
                                        echo '<option value="' . $options['id'] . '" selected>' . $options['descripcio'] . '</option>';
                                    } else {
                                        echo '<option value="' . $options['id'] . '">' . $options['descripcio'] . '</option>';
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <h2>Client:</h2>
                    <div class="form-group">
                        <div class="vhcenterAround">
                            <select id="clientInsertVideowall" class="padding btn btn-default">
                                <option selected disabled>Selecciona un Client</option>
                                <?php
                                $sql = 'SELECT `id`, `nomFiscal` FROM `Clients`';
                                $execute = mysqli_query($conn, $sql);

                                while ($options = mysqli_fetch_array($execute)) {
                                    if ($row['client'] == $options['nomFiscal']) {
                                        echo '<option value="' . $options['id'] . '" selected>' . $options['nomFiscal'] . '</option>';
                                    } else {
                                        echo '<option value="' . $options['id'] . '">' . $options['nomFiscal'] . '</option>';
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <h2>Botiga:</h2>
                    <div class="form-group">
                        <div class="vhcenterAround">
                            <select id="botigaInsertVideowall" class="padding btn btn-default">
                                <option selected disabled>Selecciona una Botiga</option>
                                <?php
                                $sql = 'SELECT `id`,`nomComercial` FROM `Botigues`';
                                $execute = mysqli_query($conn, $sql);

                                while ($options = mysqli_fetch_array($execute)) {
                                    if ($row['botiga'] == $options['nomComercial']) {
                                        echo '<option value="' . $options['id'] . '" selected>' . $options['nomComercial'] . '</option>';
                                    } else {
                                        echo '<option value="' . $options['id'] . '">' . $options['nomComercial'] . '</option>';
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <h2>Insertar Marques</h2>
                    <div class="border text-center" id="anadirMarques" ondragover="allowDrop(event)" ondrop="dropMarques(event,'anadirMarques')">
                        <?php
                        if (!isset($_SESSION['MarquesVideowall'])) {
                            $_SESSION['MarquesVideowall'] = array();
                        }
                        $countMarcas = "SELECT COUNT(*) as 'contador' FROM `MarcasVideowall` WHERE `NSVW` = '" . $_POST['id'] . "'";
                        $executecountMarcas = mysqli_query($conn, $countMarcas);
                        $totalRowsMarcas = mysqli_fetch_assoc($executecountMarcas);
                        if ($totalRowsMarcas['contador'] > 0) {

                            for ($i = 0; $i < $totalRowsMarcas['contador']; $i++) {
                                $sql = "SELECT * FROM `MarcasVideowall` WHERE `NSVW` = '" . $_POST['id'] . "' LIMIT $i,1";
                                $execute = mysqli_fetch_assoc(mysqli_query($conn, $sql));
                                $arrayContingutNumber[$i] = $execute['idMarcas'];
                            }

                            foreach ($arrayContingutNumber as $key => $value) {
                                $sqlContingutString = "SELECT * FROM `Marcas` WHERE `id` = $value";
                                $execute = mysqli_fetch_assoc(mysqli_query($conn, $sqlContingutString));
                                $arrayContingutString[$key] = '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="cont;' . $execute['id'] . '" value="' . $execute['descripcio'] . '" readonly="">';
                                echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="cont;' . $execute['id'] . '" value="' . $execute['descripcio'] . '" readonly="">';
                                array_push($_SESSION['MarquesVideowall'], $execute['id']);
                            }
                        }
                        ?>
                    </div>

                    <div class="vhcenter">
                        <button type="button" class="btn btn-default separar2" id="btnCrearLlista" onclick="actualizarVideowall('<?php echo $_POST['id']; ?>')">Actualizar Videowall</button>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <div class="modal fade" id="crearGrup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Crear Grup</h4>
                    </div>
                    <div class="modal-body">
                        <div class="crearContingut padding" id="crearGrup">
                            <div class="form-group">
                                <label for="insertNomGrup">Nom: </label>
                                <input type="text" class="form-control" id="insertNomGrup" placeholder="Nom">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="insertarGrup()" data-dismiss="modal">Crear</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="crearTipusFormat" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Crear Tipus Format</h4>
                    </div>
                    <div class="modal-body">
                        <div class="crearContingut padding" id="crearTipusFormat">
                            <div class="form-group">
                                <label for="insertTipusFormat">Nom: </label>
                                <input type="text" class="form-control" id="insertTipusFormat" placeholder="Nom">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="insertarTFormat()" data-dismiss="modal">Crear</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="crearMarca" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Crear Marca</h4>
                    </div>
                    <div class="modal-body">
                        <div class="padding">
                            <div class="form-group">
                                <label for="insertNomMarca">Nom: </label>
                                <input type="text" class="form-control" id="insertNomMarca" placeholder="Nom">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="insertarMarca()" data-dismiss="modal">Crear</button>
                    </div>
                </div>
            </div>
        </div>
    <?php
    } else if ($_POST['actualitzar'] == 'Dispositiu') {
        $sql = "SELECT `id`, `NSVW`, `nom`, `MAC`, `model`, `numSerie`, `url`, `firmware`, `prgClient`, `IP`, `baixa` FROM `Dispositiu` WHERE id = " . $_POST['id'];
        $execute = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($execute)
    ?>
        <div class="container">
            <div class="row">
                <div class="separar"></div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Nom:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nomInsertarDispositius" value="<?php echo $row['nom']; ?>" placeholder="Nom">
                    </div>
                    <h2>VideoWall:</h2>
                    <div class="form-group">
                        <div class="vhcenterAround">
                            <select id="videowallInsertarDispositius" class="padding btn btn-default">
                                <option selected disabled value="">Selecciona un Videowall</option>
                                <?php
                                $sql = 'SELECT `NSVW`, `descripcio` FROM `Videowall`';
                                $execute = mysqli_query($conn, $sql);
                                while ($options = mysqli_fetch_array($execute)) {
                                    if ($row['NSVW'] == $options['NSVW']) {
                                        echo '<option value="' . $options['NSVW'] . '" selected>' . $options['descripcio'] . '</option>';
                                    } else {
                                        echo '<option value="' . $options['NSVW'] . '">' . $options['descripcio'] . '</option>';
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <h2>MAC:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="MACInsertarDispositius" value="<?php echo $row['MAC']; ?>" placeholder="XX-XX-XX-XX-XX-XX">
                    </div>
                    <h2>Model:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="modelInsertarDispositius" value="<?php echo $row['model']; ?>" placeholder="Model">
                    </div>
                    <h2>Numero Serie:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nSerieInsertarDispositius" value="<?php echo $row['numSerie']; ?>" placeholder="Numero Serie">
                    </div>
                </div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>URL:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="URLInsertarDispositius" value="<?php echo $row['url']; ?>" placeholder="URL">
                    </div>
                    <h2>Firmware:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="firmwareInsertarDispositius" value="<?php echo $row['prgClient']; ?>" placeholder="Firmware">
                    </div>
                    <h2>Programa Client:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="progClientInsertarDispositius" value="<?php echo $row['prgClient']; ?>" placeholder="Firmware">
                    </div>
                    <h2>IP:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="IPInsertarDispositius" value="<?php echo $row['IP']; ?>" placeholder="IP">
                    </div>
                    <div class="vhcenter">
                        <button type="button" class="btn btn-default separar" id="btnCrearLlista" onclick="actualizarDispositiu(<?php echo $row['id']; ?>)">Actualizar Dispositius</button>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
<?php
    }
}
?>