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
if (isset($_POST['taulaMostrar'])) {
    if ($_POST['taulaMostrar'] == 'programacio') {
?>
        <div class="container-fluid text-center marginTaula esconderTablas" id="mostrarProgramacio">
            <table class="table table-striped" id="tablaProgramacio">
                <thead>
                    <tr>
                        <th class="text-center ordenarTabla" onclick="ordenar('Programacions','gru.descripcio','mostrarProgramacionsOrdenades',0)">Grup</th>
                        <th class="text-center ordenarTabla" onclick="ordenar('Programacions','pro.descripcio','mostrarProgramacionsOrdenades',1)">Videowall</th>
                        <th class="text-center ordenarTabla" onclick="ordenar('Programacions','pro.descripcio','mostrarProgramacionsOrdenades',2)">Nom</th>
                        <th class="text-center ordenarTabla" onclick="ordenar('Programacions','tc.descripcio','mostrarProgramacionsOrdenades',3)">TipusContingut
                        </th>
                        <th class="text-center ordenarTabla" onclick="ordenar('Programacions','llis.descripcio','mostrarProgramacionsOrdenades',4)">Llista
                            Reproduccio</th>
                        <th class="text-center ordenarTabla" onclick="ordenar('Programacions','llispro.dataInici','mostrarProgramacionsOrdenades',5)">Inici</th>
                        <th class="text-center ordenarTabla" onclick="ordenar('Programacions','llispro.dataFinal','mostrarProgramacionsOrdenades',6)">Final</th>
                        <th class="text-center"></th>
                        <th class="text-center"></th>
                    </tr>
                </thead>
                <?php
                $count = "SELECT COUNT(*) as 'cont' FROM Programacions";
                $comprobar = mysqli_query($conn, $count);
                $totalRows = mysqli_fetch_assoc($comprobar);
                if ($totalRows['cont'] != 0) {
                ?>
                    <tbody id="mostrarProgramacionsOrdenades">
                        <?php
                        $sql = "SELECT gru.descripcio as 'grups', 
                        pro.id as 'id', 
                        pro.descripcio as 'nom',
                        tc.descripcio as 'tContingut',
                        llis.descripcio as 'nomLlista', 
                        llispro.dataInici as 'dataInici', 
                        llispro.dataFinal as 'datafinal',
                        vi.descripcio as 'videowall',
                        vipro.activa as 'activa',
                        llispro.activa as 'activa2'                                     
                 FROM `Programacions` pro 
                     LEFT JOIN VideowallProgramacio vipro ON pro.id = vipro.idProgramacio 
                     LEFT JOIN Videowall vi ON vipro.NSVW = vi.NSVW 
                     LEFT JOIN Grups gru ON vi.idGrup = gru.id
                     LEFT JOIN LlistesProgramacions llispro ON pro.id = llispro.idProgramacio 
                     LEFT JOIN LlistaRepr llis ON llispro.idLlistes = llis.id
                     LEFT JOIN TipusContingut tc ON pro.idTipusContingut = tc.id ORDER BY pro.id desc";
                        $execute = mysqli_query($conn, $sql);
                        $array = array();
                        while ($row = mysqli_fetch_array($execute)) {
                            $contador = true;
                            for ($i = 0; $i < count($array); $i++) {
                                if ($array[$i] == $row['id']) {
                                    $contador = false;
                                }
                            }
                            if ($contador) {
                                $array[] = $row['id'];
                        ?>
                                <tr>
                                    <td class="text-center"><?php echo $row['grups']; ?></td>
                                    <td class="text-center"><?php echo $row['videowall']; ?></td>
                                    <td class="text-center"><?php echo $row['nom']; ?></td>
                                    <td class="text-center"><?php echo $row['tContingut']; ?></td>
                                    <td class="text-center"><?php echo $row['nomLlista']; ?></td>
                                    <td class="text-center"><?php echo $row['dataInici']; ?></td>
                                    <td class="text-center"><?php echo $row['datafinal']; ?></td>
                                    <td class="text-center"><img class="logoTabla" src="./img/logo_update.png" onclick="actualizar(<?php echo $row['id']; ?>,'programacions')"></td>
                                    <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow('<?php echo $row['id']; ?>','programacions','id','programacio')"></td>
                                </tr>
                        <?php
                            }
                        }
                        ?>
                    </tbody>
                <?php
                }
                ?>
            </table>
        </div>
    <?php
    } elseif ($_POST['taulaMostrar'] == 'llistes') {
        $count = "SELECT COUNT(*) as 'cont' FROM `LlistaRepr`";
        $totalRows = mysqli_fetch_assoc(mysqli_query($conn, $count));

        if ($totalRows['cont'] > 0) {
            $sql = "SELECT * FROM `LlistaRepr`";
            $executar = mysqli_query($conn, $sql);
            $cont = 0;
            while ($row = mysqli_fetch_assoc($executar)) {
                $countContingut = "SELECT COUNT(*) as 'contador' FROM `LlistesContingut` WHERE `idLlistes` = " . $row['id'];
                $executeCountContingut = mysqli_query($conn, $countContingut);
                $totalRowsContingut = mysqli_fetch_assoc($executeCountContingut);
                if ($totalRowsContingut['contador'] > 0) {

                    for ($i = 0; $i < $totalRowsContingut['contador']; $i++) {
                        $sql = "SELECT * FROM `LlistesContingut` WHERE `idLlistes` = " . $row['id'] . " LIMIT $i,1";
                        $execute = mysqli_fetch_assoc(mysqli_query($conn, $sql));
                        $arrayContingutNumber[$row['id']][$i] = $execute['idContingut'];
                    }
                    $arrayIndex[$cont] = $row['id'];
                    $cont++;
                }
            }
            $cont = 0;
            foreach ($arrayContingutNumber as $keys) {
                foreach ($keys as $key => $value) {

                    $sqlContingutString = "SELECT * FROM `Contingut` WHERE `id` = $value";
                    $execute = mysqli_fetch_assoc(mysqli_query($conn, $sqlContingutString));
                    $arrayContingutString[$arrayIndex[$cont]][$key] = $execute['descripcio'];
                }
                $cont++;
            }
        }
    ?>
        <div class="container text-center marginTaula esconderTablas" id="mostrarLListes">
            <table class="table table-striped" id="tablaLlistes">
                <thead>
                    <tr>
                        <th class="text-center ordenarTabla" onclick="ordenar('Videowall','vi.NSVW','mostrarVideowallsOrdenat',0)">Nom</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(2,'tablaLlistes')">Contingut 1</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(3,'tablaLlistes')">Contingut 2</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(4,'tablaLlistes')">Contingut 3</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(5,'tablaLlistes')">Contingut 4</th>
                        <th class="text-center"></th>
                        <th class="text-center"></th>
                        <th class="text-center"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sqlMostrar = "SELECT * FROM `LlistaRepr` ORDER BY id DESC";
                    $executeSQLMostrar = mysqli_query($conn, $sqlMostrar);
                    while ($row = mysqli_fetch_array($executeSQLMostrar)) {
                    ?>
                        <tr>
                            <td class="text-center ordenarTabla"><?php echo $row['descripcio']; ?></td>
                            <td class="text-center ordenarTabla">
                                <?php
                                if (!empty($arrayContingutString[$row['id']][0])) {
                                    echo $arrayContingutString[$row['id']][0];
                                } else {
                                    echo "";
                                }
                                ?>
                            </td>
                            <td class="text-center ordenarTabla">
                                <?php
                                if (!empty($arrayContingutString[$row['id']][1])) {
                                    echo $arrayContingutString[$row['id']][1];
                                } else {
                                    echo "";
                                }
                                ?>
                            </td>
                            <td class="text-center ordenarTabla">
                                <?php
                                if (!empty($arrayContingutString[$row['id']][2])) {
                                    echo $arrayContingutString[$row['id']][2];
                                } else {
                                    echo "";
                                }
                                ?>
                            </td>
                            <td class="text-center ordenarTabla">
                                <?php
                                if (!empty($arrayContingutString[$row['id']][3])) {
                                    echo $arrayContingutString[$row['id']][3];
                                } else {
                                    echo "";
                                }
                                ?>
                            <td class="text-center"><button type="button" class="btnTabla" data-toggle="modal" data-target="<?php echo "#modalLlistes" . $i; ?>">
                                    <img class="logoTabla vhcenter" src="./img/logo_eye.png" />
                                </button></td>
                            <td class="text-center"><img class="logoTabla" src="./img/logo_update.png" onclick="actualizar(<?php echo $row['id']; ?>,'LlistaRepr')"></td>
                            <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow('<?php echo $row['id']; ?>','llistarepr','id','llistes')""></td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>

            </table>
        </div>
    <?php
    } elseif ($_POST['taulaMostrar'] == 'videowall') {
    ?>
        <div class=" container text-center marginTaula esconderTablas" id="mostrarVideowalls">
                                <table class="table table-striped" id="tablaVideoWalls">
                                    <thead>
                                        <tr>
                                            <th class="text-center ordenarTabla" onclick="ordenar('Videowall','vi.NSVW','mostrarVideowallsOrdenat',0)">NSVW</th>
                                            <th class="text-center ordenarTabla" onclick="ordenar('Videowall','vi.descripcio','mostrarVideowallsOrdenat',1)">Nom</th>
                                            <th class="text-center ordenarTabla" onclick="ordenar('Videowall','contrac.descripcio','mostrarVideowallsOrdenat',2)">Contracte</th>
                                            <th class="text-center ordenarTabla" onclick="ordenar('Videowall','cli.nomFiscal','mostrarVideowallsOrdenat',3)">Client</th>
                                            <th class="text-center ordenarTabla" onclick="ordenar('Videowall','gru.descripcio','mostrarVideowallsOrdenat',4)">Grup</th>
                                            <th class="text-center ordenarTabla" onclick="ordenar('Videowall','tf.descripcio','mostrarVideowallsOrdenat',5)">Format</th>
                                            <th class="text-center"></th>
                                            <th class="text-center"></th>
                                        </tr>

                                    </thead>
                                    <?php
                                    $count = "SELECT COUNT(*) as 'cont' FROM Videowall";
                                    $comprobar = mysqli_query($conn, $count);
                                    $totalRows = mysqli_fetch_assoc($comprobar);
                                    if ($totalRows['cont'] != 0) {
                                    ?>
                                        <tbody id="mostrarVideowallsOrdenat">
                                            <?php
                                            $sql = "SELECT vi.NSVW as 'NSVW', vi.descripcio as 'nom', contrac.descripcio as 'contracte', cli.nomFiscal as 'client',gru.descripcio as 'grup',
                        tf.descripcio as 'format' FROM Videowall vi LEFT JOIN Contractes contrac ON vi.idContracte = contrac.id LEFT JOIN Clients cli ON vi.idClient = cli.id
                        LEFT JOIN Grups gru ON vi.idGrup = gru.id LEFT JOIN TipusFormat tf ON vi.idTipusFormat = tf.id";
                                            $execute = mysqli_query($conn, $sql);
                                            $i = 0;
                                            while ($row = mysqli_fetch_array($execute)) {
                                            ?>
                                                <tr>
                                                    <td class="text-center"><?php echo $row['NSVW']; ?></td>
                                                    <td class="text-center"><?php echo $row['nom']; ?></td>
                                                    <td class="text-center"><?php echo $row['contracte']; ?></td>
                                                    <td class="text-center"><?php echo $row['client']; ?></td>
                                                    <td class="text-center"><?php echo $row['grup']; ?></td>
                                                    <td class="text-center"><?php echo $row['format']; ?></td>
                                                    <td class="text-center"><img class="logoTabla" src="./img/logo_update.png" onclick="actualizar('<?php echo $row['NSVW']; ?>','Videowall')"></td>
                                                    <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow('<?php echo $row['NSVW']; ?>','Videowall','NSVW','videowall')"></td>
                                                </tr>
                                            <?php
                                                $i++;
                                            }
                                            ?>
                                        </tbody>

                                    <?php
                                    }
                                    ?>
                                </table>
        </div>
    <?php
    } elseif ($_POST['taulaMostrar'] == 'dispositius') {
    ?>
        <div class="container-fluid text-center marginTaula esconderTablas" id="mostrarDispositiu">
            <table class="table table-striped" id="tablaDispositius">
                <thead>
                    <tr>
                        <th class="text-center ordenarTabla" onclick="sortTable(0,'tablaDispositius')">GN1</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(1,'tablaDispositius')">Nom</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(2,'tablaDispositius')">Model</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(3,'tablaDispositius')">Format</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(4,'tablaDispositius')">NSVW</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(5,'tablaDispositius')">MAC</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(6,'tablaDispositius')">Nº Serie</th>
                        <th class="text-center"></th>
                        <th class="text-center"></th>
                        <th class="text-center"></th>
                    </tr>
                </thead>
                <?php
                $count = "SELECT COUNT(*) as 'cont' FROM Dispositiu";
                $comprobar = mysqli_query($conn, $count);
                $totalRows = mysqli_fetch_assoc($comprobar);
                if ($totalRows['cont'] != 0) {
                ?>
                    <tbody>
                        <?php
                        $sql = "SELECT disp.id as 'id', gru.descripcio as 'GN1', cli.nomFiscal as 'Client', tf.descripcio as 'Format',
                        disp.NSVW as 'NSVW', contract.descripcio as 'contracte', disp.nom as 'nom', disp.MAC as 'MAC', disp.numSerie as 'NSerie', disp.model as 'model',
                        disp.url as 'url', disp.firmware as 'firmware', disp.prgClient as 'progClient', disp.IP as 'IP' FROM `Dispositiu` disp LEFT JOIN Videowall vi ON 
                        disp.NSVW = vi.NSVW LEFT JOIN Grups gru ON vi.idGrup = gru.id LEFT JOIN Clients cli ON vi.idClient = cli.id LEFT JOIN TipusFormat tf ON
                        vi.idTipusFormat = tf.id LEFT JOIN Contractes contract ON vi.idContracte = contract.id";
                        $execute = mysqli_query($conn, $sql);

                        $i = 0;
                        while ($row = mysqli_fetch_array($execute)) {
                        ?>
                            <tr>
                                <td class="text-center"><?php echo $row['GN1']; ?></td>
                                <td class="text-center"><?php echo $row['nom']; ?></td>
                                <td class="text-center"><?php echo $row['model']; ?></td>
                                <td class="text-center"><?php echo $row['Format']; ?></td>
                                <td class="text-center"><?php echo $row['NSVW']; ?></td>
                                <td class="text-center"><?php echo $row['MAC']; ?></td>
                                <td class="text-center "><?php echo $row['NSerie']; ?></td>
                                <td class="text-center"><button type="button" class="btnTabla" data-toggle="modal" data-target="<?php echo "#modalDispositiu" . $i; ?>">
                                        <img class="logoTabla vhcenter" src="./img/logo_eye.png" />
                                    </button></td>
                                <td class="text-center"><img class="logoTabla vhcenter" src="./img/logo_update.png" onclick="actualizar('<?php echo $row['id']; ?>','Dispositiu')" /></td>
                                <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow('<?php echo $row['id']; ?>','Dispositiu','id','dispositius')"></td>
                            </tr>
                        <?php
                            $i++;
                        } ?>
                    </tbody>
            </table>

            <?php
                    $i = 0;
                    $sql = "SELECT disp.id as 'id', gru.descripcio as 'GN1', cli.nomFiscal as 'Client', tf.descripcio as 'Format', disp.NSVW as 'NSVW',
                        contract.descripcio as 'contracte', disp.nom as 'nom', disp.MAC as 'MAC', disp.numSerie as 'NSerie', disp.model as 'model',disp.url as 'url', disp.firmware as 'firmware',
                        disp.prgClient as 'progClient', disp.IP as 'IP' FROM `Dispositiu` disp LEFT JOIN Videowall vi ON disp.NSVW = vi.NSVW LEFT JOIN Grups gru ON vi.idGrup = gru.id
                        LEFT JOIN Clients cli ON vi.idClient = cli.id LEFT JOIN TipusFormat tf ON vi.idTipusFormat = tf.id LEFT JOIN Contractes contract ON vi.idContracte = contract.id";
                    $execute = mysqli_query($conn, $sql);
                    while ($row = mysqli_fetch_array($execute)) {
            ?>

                <div class="modal fade" id="<?php echo "modalDispositiu" . $i; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Informació Extra</h4>
                            </div>
                            <div class="modal-body">

                                <table class="table table-striped">
                                    <tbody>

                                        <tr>
                                            <td class="text-center ordenarTabla"><b>Contracte</b></td>
                                            <td class="text-center"><?php echo $row['contracte']; ?></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center ordenarTabla"><b>Client</b></td>
                                            <td class="text-center"><?php echo $row['Client']; ?></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center ordenarTabla"><b>URL</b></td>
                                            <td class="text-center"><a href="<?php echo $row['url']; ?>"><?php echo $row['url']; ?></a></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center ordenarTabla"><b>Firmware</b></td>
                                            <td class="text-center"><?php echo $row['firmware']; ?></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center ordenarTabla"><b>Programa Client</b></td>
                                            <td class="text-center"><?php echo $row['progClient']; ?></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center ordenarTabla"><b>IP</b></td>
                                            <td class="text-center"><?php echo $row['IP']; ?></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            <?php
                        $i++;
                    }
                } else {
            ?>
            </table>
        <?php
                }
        ?>
        </div>
    <?php
    } elseif ($_POST['taulaMostrar'] == 'marcas') {
    ?>
        <div class="container text-center marginTaula esconderTablas" id="mostrarMarcas">
            <table class="table table-striped" id="tablaMarcas">
                <thead>
                    <tr>
                        <th class="text-center ordenarTabla" onclick="sortTable(0,'tablaMarcas')">id</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(1,'tablaMarcas')">Nom</th>
                        <th class="text-center ordenarTabla"></th>
                        <th class="text-center ordenarTabla"></th>
                    </tr>
                </thead>
                <?php
                $count = "SELECT COUNT(*) as 'cont' FROM Dispositiu";
                $comprobar = mysqli_query($conn, $count);
                $totalRows = mysqli_fetch_assoc($comprobar);
                if ($totalRows['cont'] != 0) {

                ?>
                    <tbody>
                        <?php
                        $sql = 'SELECT * FROM Marcas';
                        $execute = mysqli_query($conn, $sql);
                        while ($row = mysqli_fetch_array($execute)) {
                        ?>
                            <tr>
                                <td class="text-center"><?php echo $row['id']; ?></td>
                                <td class="text-center"><?php echo $row['descripcio']; ?></td>
                                <td class="text-center"><button style="background: transparent; border:none;" data-toggle="modal" data-target="#updateModal<?php echo $row['id']; ?>"><img class="logoTabla" src="./img/logo_update.png" /></button></td>
                                <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow('<?php echo $row['id']; ?>','Marcas','id','marcas')"></td>
                            </tr>
                            <div class="modal fade" id="updateModal<?php echo $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="updateModalLabel">Modificar Marcas</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="inputUpdateModal<?php echo $row['id']; ?>">Nom: </label>
                                                <input type="text" class="form-control" id="inputUpdateModal<?php echo $row['id']; ?>" value="<?php echo $row['descripcio']; ?>">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="actualizarMarcas('<?php echo $row['id']; ?>')">Actualizar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php
                        }
                        ?>
                    </tbody>
                <?php
                }
                ?>
            </table>
        </div>
    <?php
    } elseif ($_POST['taulaMostrar'] == 'tFormat') {
    ?>
        <div class="container text-center marginTaula esconderTablas" id="mostrarTipusFormat">
            <table class="table table-striped" id="tablaTFotmat">
                <thead>
                    <tr>
                        <th class="text-center ordenarTabla" onclick="sortTable(0,'tablaTFotmat')">id</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(1,'tablaTFotmat')">Nom</th>
                        <th class="text-center ordenarTabla"></th>
                        <th class="text-center ordenarTabla"></th>
                    </tr>
                </thead>
                <?php
                $count = "SELECT COUNT(*) as 'cont' FROM TipusFormat";
                $comprobar = mysqli_query($conn, $count);
                $totalRows = mysqli_fetch_assoc($comprobar);
                if ($totalRows['cont'] != 0) {
                ?>
                    <tbody>
                        <?php
                        $sql = 'SELECT * FROM TipusFormat';
                        $execute = mysqli_query($conn, $sql);
                        while ($row = mysqli_fetch_array($execute)) {
                        ?>
                            <tr>
                                <td class="text-center"><?php echo $row['id']; ?></td>
                                <td class="text-center"><?php echo $row['descripcio']; ?></td>
                                <td class="text-center"><button style="background: transparent; border:none;" data-toggle="modal" data-target="#updatetFormat<?php echo $row['id']; ?>"><img class="logoTabla" src="./img/logo_update.png" /></button></td>
                                <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow('<?php echo $row['id']; ?>','TipusFormat','id','tFormat')"></td>
                            </tr>
                            <div class="modal fade" id="updatetFormat<?php echo $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="updatetFormatLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="updatetFormatLabel">Modificar Marcas</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="inputUpdatetFormat<?php echo $row['id']; ?>">Nom: </label>
                                                <input type="text" class="form-control" id="inputUpdatetFormat<?php echo $row['id']; ?>" value="<?php echo $row['descripcio']; ?>">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="actualizartFormat('<?php echo $row['id']; ?>')">Actualizar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php
                        }
                        ?>
                    </tbody>
                <?php
                }
                ?>
            </table>
        </div>
    <?php
    } elseif ($_POST['taulaMostrar'] == 'grups') {
    ?>
        <div class="container text-center marginTaula esconderTablas" id="mostrarGrups">
            <table class="table table-striped" id="tableGrups">
                <thead>
                    <tr>
                        <th class="text-center ordenarTabla" onclick="sortTable(0,'tableGrups')">id</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(1,'tableGrups')">Nom</th>
                        <th class="text-center ordenarTabla"></th>
                        <th class="text-center ordenarTabla"></th>
                    </tr>
                </thead>
                <?php
                $count = "SELECT COUNT(*) as 'cont' FROM Grups";
                $comprobar = mysqli_query($conn, $count);
                $totalRows = mysqli_fetch_assoc($comprobar);
                if ($totalRows['cont'] != 0) {
                ?>
                    <tbody>
                        <?php
                        $sql = 'SELECT * FROM Grups';
                        $execute = mysqli_query($conn, $sql);
                        while ($row = mysqli_fetch_array($execute)) {
                        ?>
                            <tr>
                                <td class="text-center"><?php echo $row['id']; ?></td>
                                <td class="text-center"><?php echo $row['descripcio']; ?></td>
                                <td class="text-center"><button style="background: transparent; border:none;" data-toggle="modal" data-target="#updategrups<?php echo $row['id']; ?>"><img class="logoTabla" src="./img/logo_update.png" /></button></td>
                                <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow('<?php echo $row['id']; ?>','Grups','id','grups')"></td>
                            </tr>
                            <div class="modal fade" id="updategrups<?php echo $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="updategrupsLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="updategrupsLabel">Modificar Marcas</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="inputUpdategrups<?php echo $row['id']; ?>">Nom: </label>
                                                <input type="text" class="form-control" id="inputUpdategrups<?php echo $row['id']; ?>" value="<?php echo $row['descripcio']; ?>">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="actualizargrup('<?php echo $row['id']; ?>')">Actualizar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php
                        }
                        ?>
                    </tbody>
                <?php
                }
                ?>
            </table>
        </div>
    <?php
    } elseif ($_POST['taulaMostrar'] == 'comunitat') {
    ?>
        <div class="container text-center marginTaula esconderTablas" id="mostrarComunitat">
            <table class="table table-striped" id="tableComunitat">
                <thead>
                    <tr>
                        <th class="text-center ordenarTabla" onclick="sortTable(0,'tableComunitat')">id</th>
                        <th class="text-center ordenarTabla" onclick="sortTable(1,'tableComunitat')">Nom</th>
                        <th class="text-center ordenarTabla"></th>
                        <th class="text-center ordenarTabla"></th>
                    </tr>
                </thead>
                <?php
                $count = "SELECT COUNT(*) as 'cont' FROM Comunitat";
                $comprobar = mysqli_query($conn, $count);
                $totalRows = mysqli_fetch_assoc($comprobar);
                if ($totalRows['cont'] != 0) {
                ?>
                    <tbody>
                        <?php
                        $sql = 'SELECT * FROM Comunitat';
                        $execute = mysqli_query($conn, $sql);
                        while ($row = mysqli_fetch_array($execute)) {
                        ?>
                            <tr>
                                <td class="text-center"><?php echo $row['id']; ?></td>
                                <td class="text-center"><?php echo $row['descripcio']; ?></td>
                                <td class="text-center"><img class="logoTabla" src="./img/logo_update.png" /></button></td>
                                <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow('<?php echo $row['id']; ?>','Comunitat','id')"></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                <?php
                }
                ?>
            </table>
        </div>
    <?php
    }
} elseif (isset($_POST['taulaInsertar'])) {
    if ($_POST['taulaInsertar'] == 'programacio') {
        if (isset($_SESSION['listaProgramacio'])) {
            unset($_SESSION['listaProgramacio']);
        }
    ?>
        <div class="container">
            <div class="row">
                <div class="separar"></div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Nom:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nomInsertarProgramacio" placeholder="Nom">
                    </div>
                    <h2>Tipus Contingut:</h2>
                    <div class="form-group divSelectProgramacio vhcenterAround">
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#crearTipusContingut">
                            Crear
                        </button>
                        <select id="selectTContingutInsertProgramacio" class="padding btn btn-default">
                            <option value="" disabled selected class="text-center">Tipus de Contingut</option>
                            <?php
                            $sql = 'SELECT `id`, `descripcio` FROM `TipusContingut`';
                            $execute = mysqli_query($conn, $sql);
                            while ($row = mysqli_fetch_array($execute)) {
                                echo '<option value="' . $row['id'] . '" class="text-center">' . $row['descripcio'] . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <h2>Videowall:</h2>
                    <div class="form-group divSelectProgramacio vhcenter">
                        <select id="selectVideowallInsertProgramacio" class="padding btn btn-default">
                            <option value="" disabled selected class="text-center">Videowall</option>
                            <?php
                            $sql = 'SELECT `NSVW`, `descripcio` FROM `Videowall`';
                            $execute = mysqli_query($conn, $sql);
                            while ($row = mysqli_fetch_array($execute)) {
                                echo '<option value="' . $row['NSVW'] . '" class="text-center">' . $row['descripcio'] . '</option>';
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
                            while ($row = mysqli_fetch_array($execute)) {
                                echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="llista;' . $row['id'] . '" value="' . $row['descripcio'] . '" readonly>';
                            }
                            ?>
                        </div>
                    </div>
                </div>
                <div class="col-lg-offset-1 col-lg-4">
                    <div class="vhcenterBetween">
                        <div>
                            <h2>Data Inici</h2>
                            <input type="date" id="insertProgramacioStartDate">
                        </div>
                        <div>
                            <h2>Data Final</h2>
                            <input type="date" value="<?php echo date('Y-m-d', strtotime("2999-12-31")) ?>" id="insertProgramacioFinalDate">
                        </div>
                    </div>
                    <h2>Observacions</h2>
                    <textarea id="insertProgramacioObservacions" class="form-control" rows="3"></textarea>
                    <h2>Inconvenients</h2>
                    <textarea id="insertProgramacioInconvenients" class="form-control" rows="3"></textarea>

                    <h2>Insertar Llista</h2>
                    <div class="border text-center" id="anadirLlista" ondragover="allowDrop(event)" ondrop="dropProgramacio(event,'anadirLlista')">
                    </div>
                    <div class="vhcenter" id="divActivarProgramacioInsertProgramacio">
                        <label for="">Activar Programacio en el Videowall </label><input type="checkbox" name="" id="checkboxActivarProgramacio">
                    </div>
                    <div class="vhcenter">
                        <button type="button" class="btn btn-default separar2" id="btnCrearLlista" onclick="insertarProgramacio()">Crear Programacio</button>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="modal fade" id="crearTipusContingut" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Crear Tipus Contingut</h4>
                    </div>
                    <div class="modal-body">
                        <div class="crearContingut padding" id="crearTipusContingut">
                            <div class="form-group">
                                <label for="insertNomTipusContingut">Nom: </label>
                                <input type="text" class="form-control" id="insertNomTipusContingut" placeholder="Nom">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="insertarTipusContingut()" data-dismiss="modal">Crear</button>
                    </div>
                </div>
            </div>
        </div>
    <?php
    } elseif ($_POST['taulaInsertar'] == 'llistes') {
        if (isset($_SESSION['lista'])) {
            foreach ($_SESSION['lista'] as $key => $value) {
                unset($_SESSION['lista'][$key]);
            }
            unset($_SESSION['lista']);
        }
    ?>
        <div class="container">
            <div class="row">
                <div class="separar"></div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Nom:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nomInsertarLlista" placeholder="Nom">
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
                    </div>
                    <div class="vhcenter">
                        <button type="button" class="btn btn-default separar2" id="btnCrearLlista" onclick="insertarLlista()">Crear Llista</button>
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
    } elseif ($_POST['taulaInsertar'] == 'videowall') {
        if (isset($_SESSION['MarquesVideowall'])) {
            foreach ($_SESSION['MarquesVideowall'] as $key => $value) {
                unset($_SESSION['MarquesVideowall'][$key]);
            }
            unset($_SESSION['MarquesVideowall']);
        }
    ?>
        <div class="container">
            <div class="row">
                <div class="separar"></div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Nom:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nomInsertarVideowall" placeholder="Nom">
                    </div>
                    <h2>Grup:</h2>
                    <div class="form-group">
                        <div class="vhcenterAround">
                            <button type="button" class="padding btn btn-default" data-toggle="modal" data-target="#crearGrup">
                                Crear Grup
                            </button>
                            <select id="grupInsertarVideowall" class="padding btn btn-default">
                                <option selected disabled>Selecciona un Grup</option>
                                <?php
                                $sql = 'SELECT `id`, `descripcio` FROM `Grups`';
                                $execute = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_array($execute)) {
                                ?>
                                    <option value="<?php echo $row['id']; ?>"><?php echo $row['descripcio']; ?></option>";
                                <?php
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
                            while ($row = mysqli_fetch_array($execute)) {
                                echo '<input class="borderPetit" type="text" draggable="true" ondragstart="drag(event)" id="marca;' . $row['id'] . '" value="' . $row['descripcio'] . '" readonly>';
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
                                while ($row = mysqli_fetch_array($execute)) {
                                ?>
                                    <option value="<?php echo $row['id']; ?>"><?php echo $row['descripcio']; ?></option>";
                                <?php
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
                                while ($row = mysqli_fetch_array($execute)) {
                                ?>
                                    <option value="<?php echo $row['id']; ?>"><?php echo $row['nomFiscal']; ?></option>";
                                <?php
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
                                while ($row = mysqli_fetch_array($execute)) {
                                ?>
                                    <option value="<?php echo $row['id']; ?>"><?php echo $row['nomComercial']; ?></option>";
                                <?php
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <h2>Insertar Marques</h2>
                    <div class="border text-center" id="anadirMarques" ondragover="allowDrop(event)" ondrop="dropMarques(event,'anadirMarques')">
                    </div>

                    <div class="vhcenter">
                        <button type="button" class="btn btn-default separar2" id="btnCrearLlista" onclick="insertarVideowall()">Crear Videowall</button>
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
    } elseif ($_POST['taulaInsertar'] == 'dispositius') {
    ?>
        <div class="container">
            <div class="row">
                <div class="separar"></div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>Nom:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nomInsertarDispositius" placeholder="Nom">
                    </div>
                    <h2>VideoWall:</h2>
                    <div class="form-group">
                        <div class="vhcenterAround">
                            <select id="videowallInsertarDispositius" class="padding btn btn-default">
                                <option selected disabled value="">Selecciona un Videowall</option>
                                <?php
                                $sql = 'SELECT `NSVW`, `descripcio` FROM `Videowall`';
                                $execute = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_array($execute)) {
                                ?>
                                    <option value="<?php echo $row['NSVW']; ?>"><?php echo $row['descripcio']; ?></option>";
                                <?php
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <h2>MAC:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="MACInsertarDispositius" placeholder="XX-XX-XX-XX-XX-XX">
                    </div>
                    <h2>Model:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="modelInsertarDispositius" placeholder="Model">
                    </div>
                    <h2>Numero Serie:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nSerieInsertarDispositius" placeholder="Numero Serie">
                    </div>
                </div>
                <div class="col-lg-offset-1 col-lg-4">
                    <h2>URL:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="URLInsertarDispositius" placeholder="URL">
                    </div>
                    <h2>Firmware:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="firmwareInsertarDispositius" placeholder="Firmware">
                    </div>
                    <h2>Programa Client:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="progClientInsertarDispositius" placeholder="Firmware">
                    </div>
                    <h2>IP:</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" id="IPInsertarDispositius" placeholder="IP">
                    </div>
                    <div class="vhcenter">
                        <button type="button" class="btn btn-default separar" id="btnCrearLlista" onclick="insertarDispositiu()">Crear Dispositius</button>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
<?php
    }
}
?>