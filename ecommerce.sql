-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 21 Jul 2022 pada 22.20
-- Versi server: 5.7.24
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joki_toko4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `username` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`username`, `password`, `level`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE `bank` (
  `id_bank` char(3) NOT NULL,
  `nm_bank` varchar(20) NOT NULL,
  `no_rektoko` varchar(15) NOT NULL,
  `atas_nama` varchar(25) NOT NULL,
  `logo_bank` char(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `banner`
--

CREATE TABLE `banner` (
  `id_banner` char(2) NOT NULL,
  `gambar_banner` char(18) NOT NULL,
  `judul_banner` varchar(20) NOT NULL,
  `deskripsi_banner` text NOT NULL,
  `status_banner` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id_comment` char(11) NOT NULL,
  `tanggal_comment` date NOT NULL,
  `isi_comment` text NOT NULL,
  `id_product` char(4) NOT NULL,
  `id_customer` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `confirm`
--

CREATE TABLE `confirm` (
  `id_confirm` char(11) NOT NULL,
  `tanggal_confirm` date NOT NULL,
  `tanggal_transfer` date NOT NULL,
  `jumlah_transfer` bigint(11) NOT NULL,
  `no_rekening` varchar(15) NOT NULL,
  `bukti_transfer` char(21) NOT NULL,
  `nm_pengirim` varchar(50) NOT NULL,
  `status_confirm` char(1) DEFAULT NULL,
  `id_bank` char(3) NOT NULL,
  `id_order` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` char(9) NOT NULL,
  `nm_customer` varchar(50) NOT NULL,
  `email_customer` varchar(40) NOT NULL,
  `password_customer` varchar(100) NOT NULL,
  `alamat_customer` text NOT NULL,
  `kodepos_customer` varchar(6) NOT NULL,
  `provinsi_customer` char(3) NOT NULL,
  `kota_customer` char(3) NOT NULL,
  `telp_customer` varchar(12) NOT NULL,
  `status_customer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detil_orders`
--

CREATE TABLE `detil_orders` (
  `id_order` char(11) NOT NULL,
  `id_product` char(4) NOT NULL,
  `id_size` char(2) NOT NULL,
  `qty` int(3) NOT NULL,
  `sub_total` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detil_retur`
--

CREATE TABLE `detil_retur` (
  `id_retur` char(11) NOT NULL,
  `id_order` char(11) NOT NULL,
  `id_product` char(4) NOT NULL,
  `id_size` char(2) NOT NULL,
  `qty_retur` int(3) DEFAULT NULL,
  `subtotal_retur` int(8) DEFAULT NULL,
  `alasan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detil_size`
--

CREATE TABLE `detil_size` (
  `id_product` char(4) NOT NULL,
  `id_size` char(2) NOT NULL,
  `stok` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` char(3) NOT NULL,
  `alt_kategori` varchar(30) NOT NULL,
  `nm_kategori` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id_order` char(11) NOT NULL,
  `tanggal_order` date NOT NULL,
  `ongkir` int(8) NOT NULL,
  `kurir` varchar(3) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `alamat_kirim` text NOT NULL,
  `kode_pos` char(6) NOT NULL,
  `grand_total` bigint(11) NOT NULL,
  `status` varchar(12) NOT NULL,
  `catatan` text NOT NULL,
  `total_berat` int(3) NOT NULL,
  `id_customer` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id_product` char(4) NOT NULL,
  `alt_product` varchar(30) NOT NULL,
  `nm_product` varchar(25) NOT NULL,
  `harga` int(7) NOT NULL,
  `berat` int(4) NOT NULL,
  `gambar` char(20) NOT NULL,
  `deskripsi` text NOT NULL,
  `id_kategori` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reply`
--

CREATE TABLE `reply` (
  `id_reply` char(11) NOT NULL,
  `tanggal_reply` date NOT NULL,
  `isi_reply` text NOT NULL,
  `id_comment` char(11) NOT NULL,
  `username` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resi`
--

CREATE TABLE `resi` (
  `id_resi` char(11) NOT NULL,
  `no_resi` varchar(12) NOT NULL,
  `tanggal_resi` date DEFAULT NULL,
  `id_order` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur`
--

CREATE TABLE `retur` (
  `id_retur` char(11) NOT NULL,
  `tgl_retur` date NOT NULL,
  `grandtotal_retur` int(8) DEFAULT NULL,
  `status_retur` varchar(10) NOT NULL,
  `bukti_refund` char(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `saran`
--

CREATE TABLE `saran` (
  `id_saran` char(11) NOT NULL,
  `tanggal_saran` date NOT NULL,
  `isi_saran` text NOT NULL,
  `id_customer` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `size`
--

CREATE TABLE `size` (
  `id_size` char(2) NOT NULL,
  `nm_size` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `size`
--

INSERT INTO `size` (`id_size`, `nm_size`) VALUES
('S1', 'L'),
('S2', 'XL'),
('S3', 'M'),
('S4', 'S');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indeks untuk tabel `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id_banner`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indeks untuk tabel `confirm`
--
ALTER TABLE `confirm`
  ADD PRIMARY KEY (`id_confirm`),
  ADD KEY `id_bank` (`id_bank`),
  ADD KEY `id_order` (`id_order`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `detil_orders`
--
ALTER TABLE `detil_orders`
  ADD PRIMARY KEY (`id_order`,`id_product`,`id_size`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_size` (`id_size`),
  ADD KEY `id_order` (`id_order`);

--
-- Indeks untuk tabel `detil_retur`
--
ALTER TABLE `detil_retur`
  ADD PRIMARY KEY (`id_retur`,`id_order`,`id_product`,`id_size`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_size` (`id_size`),
  ADD KEY `id_retur` (`id_retur`);

--
-- Indeks untuk tabel `detil_size`
--
ALTER TABLE `detil_size`
  ADD PRIMARY KEY (`id_product`,`id_size`),
  ADD KEY `id_size` (`id_size`),
  ADD KEY `id_product` (`id_product`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_kategori_2` (`id_kategori`);

--
-- Indeks untuk tabel `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`id_reply`);

--
-- Indeks untuk tabel `resi`
--
ALTER TABLE `resi`
  ADD PRIMARY KEY (`id_resi`),
  ADD KEY `id_order` (`id_order`);

--
-- Indeks untuk tabel `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`id_retur`);

--
-- Indeks untuk tabel `saran`
--
ALTER TABLE `saran`
  ADD PRIMARY KEY (`id_saran`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indeks untuk tabel `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id_size`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Ketidakleluasaan untuk tabel `confirm`
--
ALTER TABLE `confirm`
  ADD CONSTRAINT `confirm_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  ADD CONSTRAINT `confirm_ibfk_2` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id_bank`);

--
-- Ketidakleluasaan untuk tabel `detil_orders`
--
ALTER TABLE `detil_orders`
  ADD CONSTRAINT `detil_orders_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `detil_orders_ibfk_3` FOREIGN KEY (`id_size`) REFERENCES `size` (`id_size`),
  ADD CONSTRAINT `detil_orders_ibfk_4` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`);

--
-- Ketidakleluasaan untuk tabel `detil_retur`
--
ALTER TABLE `detil_retur`
  ADD CONSTRAINT `detil_retur_ibfk_1` FOREIGN KEY (`id_retur`) REFERENCES `retur` (`id_retur`),
  ADD CONSTRAINT `detil_retur_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `detil_orders` (`id_order`),
  ADD CONSTRAINT `detil_retur_ibfk_3` FOREIGN KEY (`id_product`) REFERENCES `detil_orders` (`id_product`),
  ADD CONSTRAINT `detil_retur_ibfk_4` FOREIGN KEY (`id_size`) REFERENCES `detil_orders` (`id_size`);

--
-- Ketidakleluasaan untuk tabel `detil_size`
--
ALTER TABLE `detil_size`
  ADD CONSTRAINT `detil_size_ibfk_2` FOREIGN KEY (`id_size`) REFERENCES `size` (`id_size`),
  ADD CONSTRAINT `detil_size_ibfk_3` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `resi`
--
ALTER TABLE `resi`
  ADD CONSTRAINT `resi_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`);

--
-- Ketidakleluasaan untuk tabel `saran`
--
ALTER TABLE `saran`
  ADD CONSTRAINT `saran_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
