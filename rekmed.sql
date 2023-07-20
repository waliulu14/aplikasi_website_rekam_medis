-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jan 2023 pada 10.06
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rekmed`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_dokter`
--

CREATE TABLE `tb_dokter` (
  `id_dokter` varchar(150) NOT NULL,
  `nama_dokter` varchar(200) NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `spesialis` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_dokter`
--

INSERT INTO `tb_dokter` (`id_dokter`, `nama_dokter`, `jenis_kelamin`, `spesialis`, `alamat`, `no_telp`) VALUES
('a147a111-7074-4c90-86c6-6edbb5a758a1', 'Dr. Fadlul Laila', 'Wanita', 'Umum', 'Padang', '08126474623'),
('d4b8d1c5-8e60-4778-9c8a-8669d6c0b3dc', 'Dr. Charmila Sari', 'Wanita', 'Umum', 'Tanjung Bingkung', '081237421423');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_obat`
--

CREATE TABLE `tb_obat` (
  `id_obat` varchar(100) NOT NULL,
  `nama_obat` varchar(200) NOT NULL,
  `jenis_obat` varchar(50) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_obat`
--

INSERT INTO `tb_obat` (`id_obat`, `nama_obat`, `jenis_obat`, `satuan`, `harga`, `keterangan`) VALUES
('1a7a162a-fbf0-4a77-a053-93fd297fab63', 'Aclidinium', 'Bronkodilator', 'Infusa', '7500', 'Meredakan gejala PPOK'),
('3d1d84a5-397d-4ac6-8f18-2d7aaaa9eb13', 'Acitretin', 'Retinoid', 'Kapsul', '13500', 'Meredakan gejala psoriasis yang parah, lichen planus, iktiosis kongenital, dan penyakit Darier\r\n'),
('6f59c5ee-4ba5-426b-b5f4-0bd506013b27', 'Acetylcysteine', 'Obat mukolitik', 'Tablet', '11200', 'Mengencerkan dahak dan mengobati keracunan paracetamol'),
('ad271000-0987-41be-baf1-db659156b3e8', 'Adalimumab', 'Imunosupresan', 'Injeksi', '35700', 'Meredakan gejala peradangan pada penyakit rheumatoid arthritis, juvenile idiopathic arthritis, artritis psoriasis, plak psoriasis, spondylitis ankilosa, kolitis ulseratif, penyakit Crohn, hidradenitis suppurativa, dan uveitis.'),
('bcf04296-e715-11eb-a5ea-c85b76b5353c', 'Acarbose', 'Antidiabetes', 'Tablet', '10000', 'Obat untuk menurunkan kadar gula darah pada penderita diabetes tipe 2'),
('bcf05127-e715-11eb-a5ea-c85b76b5353c', 'Bacitracin', 'Antibiotik polipetida', 'Krim', '25000', 'Obat antibiotik untuk mengobati luka ringan di kulit'),
('bcf0572d-e715-11eb-a5ea-c85b76b5353c', 'Caladine Lotion', 'Obat bebas', 'Losion', '18000', 'Mengatasi rasa gatal di kulit akibat biang keringat dan gigitan serangga'),
('bcf05ca5-e715-11eb-a5ea-c85b76b5353c', 'Dapsone', 'Antibiotik golongan sulfone', 'Gel', '39500', 'Mengobati kusta, dermatitis herpetiformis, dan jerawat'),
('bcf06200-e715-11eb-a5ea-c85b76b5353c', 'Enervon C', 'Multivitamin', 'Tablet', '70400', 'Bermanfaat untuk membantu menjaga daya tahan tubuh');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pasien`
--

CREATE TABLE `tb_pasien` (
  `id_pasien` varchar(150) NOT NULL,
  `nama_pasien` varchar(200) NOT NULL,
  `dok_identitas` enum('KTP','SIM','Paspor','Kitas') NOT NULL,
  `nomor_identitas` varchar(30) NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pasien`
--

INSERT INTO `tb_pasien` (`id_pasien`, `nama_pasien`, `dok_identitas`, `nomor_identitas`, `jenis_kelamin`, `alamat`, `no_telp`) VALUES
('6da700e8-496e-4877-8c4b-f4b3f46d7a28', 'Fajar Sidik', 'SIM', '6632719238', 'Pria', 'Jambi', '0821237482364');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_poliklinik`
--

CREATE TABLE `tb_poliklinik` (
  `id_poli` varchar(100) NOT NULL,
  `nama_poli` varchar(200) NOT NULL,
  `lokasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_poliklinik`
--

INSERT INTO `tb_poliklinik` (`id_poli`, `nama_poli`, `lokasi`) VALUES
('053b88c6-b707-4a9c-b2a5-55daf0241906', 'Ruangan BP', 'Ruang 2'),
('0ab117df-837e-4130-9eb1-5459cc891d65', 'Ruangan Laktasi', 'Ruang 8'),
('1aee5e89-fedd-4229-b442-2138710e905e', 'Ruangan Gizi', 'Ruang 4'),
('3e110b56-3fec-4b89-beee-032e70b01b79', 'Ruangan Imunisasi', 'Ruang 9'),
('4e9eefc9-d6af-4cca-8f33-d1831846e176', 'Ruangan Gigi', 'Ruang 1'),
('70ae0d88-cb1c-474e-b6d5-a79469fcc57b', 'Ruangan Promkes', 'Ruang 6'),
('796fe574-e964-11eb-8b4a-c85b76b5353c', 'Ruangan KIA', 'Ruang 3'),
('8b5c88c4-6d7a-4789-98d1-57b3e5c2c510', 'Ruangan Anak', 'Ruang 11'),
('be3557f6-2e4a-44b0-b216-bc98c909f4a2', 'Ruangan Lansia', 'Ruang 5'),
('cb985e04-9b43-46f8-bfa8-19cd52ba3958', 'Ruangan Gudang Obat', 'Ruang 7'),
('fdc379f3-d3a6-4291-bb53-405e017efbd7', 'Ruangan Labor', 'Ruang 10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rekam_medis`
--

CREATE TABLE `tb_rekam_medis` (
  `id_rm` varchar(100) NOT NULL,
  `id_pasien` varchar(100) NOT NULL,
  `id_dokter` varchar(100) NOT NULL,
  `id_poli` varchar(100) NOT NULL,
  `keluhan` text NOT NULL,
  `diagnosa` text NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jenis_pembayaran` enum('BPJS','Cash') DEFAULT NULL,
  `total_pembayaran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_rekam_medis`
--

INSERT INTO `tb_rekam_medis` (`id_rm`, `id_pasien`, `id_dokter`, `id_poli`, `keluhan`, `diagnosa`, `tgl_periksa`, `jenis_pembayaran`, `total_pembayaran`) VALUES
('b052135b-b90a-4fb9-ae1f-b537757f1615', '6da700e8-496e-4877-8c4b-f4b3f46d7a28', 'd4b8d1c5-8e60-4778-9c8a-8669d6c0b3dc', '1aee5e89-fedd-4229-b442-2138710e905e', 'Kurang Gizi karena mikirin mantan', 'unFollow mantan', '2023-01-04', 'BPJS', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rm_obat`
--

CREATE TABLE `tb_rm_obat` (
  `id_rm_obat` int(11) NOT NULL,
  `id_rm` varchar(100) NOT NULL,
  `id_obat` varchar(100) NOT NULL,
  `catatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_rm_obat`
--

INSERT INTO `tb_rm_obat` (`id_rm_obat`, `id_rm`, `id_obat`, `catatan`) VALUES
(1, '4b06bca4-16d4-4a7b-b84e-7e967d80ebe5', 'bcf0572d-e715-11eb-a5ea-c85b76b5353c', 'Balurin'),
(2, '77925622-0d2e-4c29-986d-6c86875c6fef', 'bcf05ca5-e715-11eb-a5ea-c85b76b5353c', '3x1 Sebelum Makan'),
(3, '77925622-0d2e-4c29-986d-6c86875c6fef', 'bcf05127-e715-11eb-a5ea-c85b76b5353c', '3x1 Sesudah Makan'),
(5, '190e1098-64e7-46e8-80d4-bc04613e2346', 'bcf0572d-e715-11eb-a5ea-c85b76b5353c', 'asdad'),
(6, 'd9220812-5939-42b5-85cf-c10cd85200fb', 'bcf04296-e715-11eb-a5ea-c85b76b5353c', '3x1'),
(7, '5caa4912-78ab-4d98-975d-2cd9d8ff1264', 'ad271000-0987-41be-baf1-db659156b3e8', '3x1 Sebelum Makan'),
(8, '3d7d46f6-d9b8-4cc7-9441-3524f342e24f', '1a7a162a-fbf0-4a77-a053-93fd297fab63', '3x1 Sesudah Makan'),
(9, '0d9fa972-9f02-4634-b71e-654998b12091', '6f59c5ee-4ba5-426b-b5f4-0bd506013b27', 'as'),
(10, 'bb788e80-8c85-4063-b3cf-35dd57e7390f', 'bcf06200-e715-11eb-a5ea-c85b76b5353c', '2 kali sehari'),
(11, 'bb788e80-8c85-4063-b3cf-35dd57e7390f', 'ad271000-0987-41be-baf1-db659156b3e8', '3 kali sehari'),
(12, '5dfdc3de-1008-404d-80bf-f97197bde2d8', 'bcf05ca5-e715-11eb-a5ea-c85b76b5353c', '2 kali sehari'),
(13, '385fe454-1eb3-4a47-a8c0-eb975b4d21c5', 'bcf04296-e715-11eb-a5ea-c85b76b5353c', '2 kali sehari'),
(14, 'b052135b-b90a-4fb9-ae1f-b537757f1615', 'bcf04296-e715-11eb-a5ea-c85b76b5353c', '2 kali sehari'),
(15, 'b052135b-b90a-4fb9-ae1f-b537757f1615', 'bcf05127-e715-11eb-a5ea-c85b76b5353c', '2 kali sehari');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` varchar(150) NOT NULL,
  `nama_user` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `level` enum('superadmin','dokter','apoteker') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `username`, `password`, `level`) VALUES
('c33a3189-e6c5-11eb-a69b-c85b76b5353c', 'Administrator', 'superadmin', '889a3a791b3875cfae413574b53da4bb8a90d53e', 'superadmin'),
('d728559a-0a17-405b-93eb-9d220ec96440', 'Apoteker', 'apoteker', '8e30c3e6d50e5d7c02e7eaffa5954b04d4a3afaf', 'apoteker'),
('ec6487e1-87c6-4825-8fa1-e5756a5418f8', 'dokter', 'dokter', '9d2878abdd504d16fe6262f17c80dae5cec34440', 'dokter');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `tb_obat`
--
ALTER TABLE `tb_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `tb_pasien`
--
ALTER TABLE `tb_pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD UNIQUE KEY `nomor_identitas` (`nomor_identitas`);

--
-- Indeks untuk tabel `tb_poliklinik`
--
ALTER TABLE `tb_poliklinik`
  ADD PRIMARY KEY (`id_poli`);

--
-- Indeks untuk tabel `tb_rekam_medis`
--
ALTER TABLE `tb_rekam_medis`
  ADD PRIMARY KEY (`id_rm`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_dokter_2` (`id_dokter`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indeks untuk tabel `tb_rm_obat`
--
ALTER TABLE `tb_rm_obat`
  ADD PRIMARY KEY (`id_rm_obat`),
  ADD KEY `id_rm` (`id_rm`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_rm_2` (`id_rm`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_rm_obat`
--
ALTER TABLE `tb_rm_obat`
  MODIFY `id_rm_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_rekam_medis`
--
ALTER TABLE `tb_rekam_medis`
  ADD CONSTRAINT `rm_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `tb_dokter` (`id_dokter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rm_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rm_poli` FOREIGN KEY (`id_poli`) REFERENCES `tb_poliklinik` (`id_poli`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_rm_obat`
--
ALTER TABLE `tb_rm_obat`
  ADD CONSTRAINT `rmobat_obat` FOREIGN KEY (`id_obat`) REFERENCES `tb_obat` (`id_obat`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
