<?php include_once '../_header.php'; ?>

<div class="box">
    <h2>Obat</h2>
    <h4 style="margin-bottom: 28px;">
        <small>Data Obat</small>
        <div class="pull-right">
          <!--  <a href="form_obat.php" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i>&nbsp;Tambah Obat</a>-->
             <?php
                if ($level == "apoteker") {
                ?>
                    <li>
             <a href="form_obat.php" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i>&nbsp;Tambah Obat</a>
                    </li>
                
            <button class="btn btn-danger btn-xs" id="hapus_obat"><i class="glyphicon glyphicon-trash"></i>&nbsp;Hapus Obat</button><?php } ?>
        </div>
    </h4>
    <?php if (isset($_SESSION['sukses'])) {    ?>
        <div class="alert alert-success" role="alert">
            <strong>Berhasil</strong> <?= $_SESSION['sukses']; ?>
        </div>
    <?php
        unset($_SESSION['sukses']);
    } ?>

    <?php if (isset($_SESSION['gagal'])) {    ?>
        <div class="alert alert-success" role="alert">
            <strong>Berhasil</strong> <?= $_SESSION['gagal']; ?>
        </div>
    <?php
        unset($_SESSION['gagal']);
    } ?>

    <form name="proses" method="POST">
        <div class="table-responsive">
            <table id="dataTable" class="display table table-striped table-bordered table-hover" style="width: 100%;">
                <thead>
                    <tr>
                        <th style="width: 5%; text-align: center;">No</th>
                        <th style="width: 20%; text-align: center;">Nama Obat</th>
                        <th style="width: 20%; text-align: center;">Jenis Obat</th>
                        <th style="width: 10%; text-align: center;">Satuan</th>
                        <th style="width: 10%; text-align: center;">Harga</th>
                        <th style="width: 25%; text-align: center;">Keterangan</th>
                        <th style="width: 10%; text-align: center;"><i class="glyphicon glyphicon-cog"></i> &nbsp; <input type="checkbox" id="select_all"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sql_select_obat = mysqli_query($connect, "SELECT * FROM tb_obat");
                    while ($data_obat = mysqli_fetch_array($sql_select_obat)) {
                    ?>
                        <tr>
                            <td></td>
                            <td><?= $data_obat['nama_obat']; ?></td>
                            <td><?= $data_obat['jenis_obat']; ?></td>
                            <td><?= $data_obat['satuan']; ?></td>
                            <td>Rp. <?= number_format($data_obat['harga']); ?></td>
                            <td><?= $data_obat['keterangan']; ?></td>
                            <td style="vertical-align: middle; text-align: center;">
                                <a href="form_obat.php?id=<?= $data_obat['id_obat']; ?>" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;&nbsp;
                                <input type="checkbox" name="checked[]" class="check" value="<?= $data_obat['id_obat']; ?>">
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </form>
</div>

<?php include_once '../_footer.php'; ?>
