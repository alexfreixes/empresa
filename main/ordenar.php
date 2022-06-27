<?php
include('../db/database.php');
if (isset($_POST['tableName'])) {
    if ($_POST['tableName'] == 'Videowall') {
        $sql = "SELECT vi.NSVW as 'NSVW', vi.descripcio as 'nom', contrac.descripcio as 'contracte', cli.nomFiscal as 'client',gru.descripcio as 'grup',
        tf.descripcio as 'format' FROM Videowall vi LEFT JOIN Contractes contrac ON vi.idContracte = contrac.id LEFT JOIN Clients cli ON vi.idClient = cli.id
        LEFT JOIN Grups gru ON vi.idGrup = gru.id LEFT JOIN TipusFormat tf ON vi.idTipusFormat = tf.id ORDER BY " . $_POST['columName'] . " " . $_POST['direction'];
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
                <td class="text-center"><img class="logoTabla" src="./img/logo_update.png" /></td>
                <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow('<?php echo $row['NSVW']; ?>','Videowall','NSVW')"></td>
            </tr>
        <?php
            $i++;
        }
    } else if ($_POST['tableName'] == 'Programacions') {

        $sql = "SELECT gru.descripcio as 'grups', pro.id as 'id', pro.descripcio as 'nom', com.descripcio as 'comunitat', tc.descripcio as 'tContingut',
    llis.descripcio as 'nomLlista', llispro.dataInici as 'dataInici', llispro.dataFinal as 'datafinal' FROM `Programacions` pro LEFT JOIN VideowallProgramacio vipro 
    ON pro.id = vipro.idProgramacio LEFT JOIN Videowall vi ON vipro.NSVW = vi.NSVW LEFT JOIN Grups gru ON vi.idGrup = gru.id LEFT JOIN Dispositiu disp 
    ON vi.NSVW = disp.NSVW LEFT JOIN Botigues bot ON vi.idBotiga = bot.id LEFT JOIN Comunitat com ON bot.idComunitat = com.id LEFT JOIN LlistesProgramacions llispro 
    ON pro.id = llispro.idLlistes LEFT JOIN LlistaRepr llis ON llispro.idLlistes = llis.id LEFT JOIN TipusContingut tc ON pro.idTipusContingut = tc.id ORDER BY " .
            $_POST['columName'] . " " . $_POST['direction'];
        $execute = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_array($execute)) {
        ?>
            <tr>
                <td class="text-center"><?php echo $row['grups']; ?></td>
                <td class="text-center"><?php echo $row['nom']; ?></td>
                <td class="text-center"><?php echo $row['tContingut']; ?></td>
                <td class="text-center"><?php echo $row['nomLlista']; ?></td>
                <td class="text-center"><?php echo $row['dataInici']; ?></td>
                <td class="text-center"><?php echo $row['datafinal']; ?></td>
                <td class="text-center"><img class="logoTabla" src="./img/logo_update.png" /></td>
                <td class="text-center"><img class="logoTabla" src="./img/logo_delete.png" onclick="deleteRow(<?php echo $row['id']; ?>,'Programacio','id','programacio')"></td>
            </tr>
<?php
        }
    }
}
?>