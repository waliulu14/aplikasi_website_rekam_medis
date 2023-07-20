<?php
include_once '../_config/config.php';
include_once '../_config/tidaklogin.php';

$id_rm = $_GET['id'];
$sql_select_rm = mysqli_query($connect, "SELECT * FROM tb_rekam_medis JOIN tb_pasien ON tb_pasien.id_pasien = tb_rekam_medis.id_pasien JOIN tb_dokter ON tb_dokter.id_dokter = tb_rekam_medis.id_dokter JOIN tb_poliklinik ON tb_poliklinik.id_poli = tb_rekam_medis.id_poli WHERE id_rm = '$id_rm'") or die(mysqli_error($connect));

$row = mysqli_fetch_array($sql_select_rm);

if ($row) {
    ?>
    <html>
    <head>
        <meta charset="utf-8">
        <title>Detail Rekam Medis</title>
        <link rel="stylesheet" href="../_assets/css/style-rm.css">
        <link rel="license" href="https://www.opensource.org/licenses/mit-license/">
    </head>
    <body>
        <header>
            <h1>Detail Rekam Medis</h1>
            <h1>Puskesmas Bukit Sileh</h1>
        </header>
        <article>
            <table class="meta" style="margin-right: 200px;">
                <tr>
                    <th><span>Nama Pasien</span></th>
                    <td><span><?= $row['nama_pasien'] ?? ''; ?></span></td>
                </tr>
                <tr>
                    <th><span>Nama Dokter</span></th>
                    <td><span><?= $row['nama_dokter'] ?? ''; ?></span></td>
                </tr>
                <tr>
                    <th><span>Ruangan</span></th>
                    <td><span><?= $row['nama_poli'] ?? ''; ?></span></td>
                </tr>
            </table>
            <table class="meta">
                <tr>
                    <th><span>Tanggal</span></th>
                    <td><span><?= isset($row['tgl_periksa']) ? date("d F Y", strtotime($row['tgl_periksa'])) : ''; ?></span></td>
                </tr>
                <tr>
                    <th><span>Pembayaran</span></th>
                    <td><span><?= $row['jenis_pembayaran'] ?? ''; ?></span></td>
                </tr>
                <tr>
                    <th><span>Total</span></th>
                    <td><span>Rp. <?= isset($row['total_pembayaran']) ? number_format($row['total_pembayaran']) : ''; ?></span></td>
                </tr>
            </table>
            <table class="inventory">
                <thead>
                    <tr>
                        <th>Nama Obat</th>
                        <th>Harga Obat</th>
                        <th>Catatan</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sub_total = 0;
                    $sql_select = mysqli_query($connect, "SELECT * FROM tb_rm_obat JOIN tb_obat ON tb_obat.id_obat = tb_rm_obat.id_obat  WHERE id_rm = '$id_rm'");
                    while ($row_obat = mysqli_fetch_array($sql_select)) {
                        $sub_total += $row_obat['harga'];
                        ?>
                        <tr>
                            <td><?= $row_obat['nama_obat'] ?? ''; ?></td>
                            <td>Rp. <?= isset($row_obat['harga']) ? number_format($row_obat['harga']) : ''; ?></td>
                            <td><?= $row_obat['catatan'] ?? ''; ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
            <table class="balance">
                <tr>
                    <th><span>Sub Total Obat</span></th>
                    <td><span>Rp. <?= isset($sub_total) ? number_format($sub_total) : ''; ?></span></td>
                </tr>
                <tr>
                    <th><span>Biaya Administrasi</span></th>
                    <td><span>Rp. <?= $row['jenis_pembayaran'] != 'BPJS' && isset($sub_total) ? number_format(10000) : '0'; ?></span></td>
                </tr>
                <tr>
                    <th><span>Biaya Periksa Dokter</span></th>
                    <td><span>Rp. <?= $row['jenis_pembayaran'] != 'BPJS' && isset($sub_total) ? number_format(35000) : '0'; ?></span></td>
                </tr>
                <tr>
                    <th><span>Total Keseluruhan</span></th>
                    <td><span>Rp. <?= $row['jenis_pembayaran'] != 'BPJS' && isset($sub_total) ? number_format($sub_total + 10000 + 35000) : '0'; ?></span></td>
                </tr>
            </table>
        </article>
        <a href="<?= base_url('rekam_medis') ?>" class="button-kembali">&lt;&lt; Kembali</a>
        <a Print" class="button-print" onclick="window.print()">Cetak</a>
    </body>
    </html>
    <?php
} else {
    // Handle case when record not found
    echo "Record not found.";
}
?>
