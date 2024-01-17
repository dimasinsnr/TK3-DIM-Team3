-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 08:51 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tk4_dim`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `satuan` varchar(20) DEFAULT NULL,
  `id_pengguna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `keterangan`, `satuan`, `id_pengguna`) VALUES
(1, 'Good Day Cappuccino', 'Kopi merk Good Day rasa cappuccino', 'pack', 1),
(2, 'Cimory Fresh Milk Matcha', 'Susu merk Cimory dengan rasa matcha', 'pack', 1),
(3, 'Aqua', 'Air mineral dengan merk Aqua', 'pack', 1),
(4, 'Nutella Hazelnut Spread', 'Selai hazelnut dengan merk Nutella', 'pcs', 1),
(5, 'Beras Pandanwangi', 'Beras dengan merk Pandanwangi', 'kg', 1),
(6, 'Minyak Sunco', 'Minyak dengan merk Sunco', 'liter', 1),
(7, 'Telur', 'Telur', 'kg', 1),
(8, 'Tepung Rosebrand', 'Tepung dengan merk Rosebrand', 'pack', 1),
(9, 'Gula Gulaku', 'Gula dengan merk Gulaku', 'pack', 1),
(10, 'Sari Roti', 'Roti dengan merk Sari Roti', 'dzn', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `nama_customer` varchar(50) DEFAULT NULL,
  `alamat_customer` text DEFAULT NULL,
  `no_hp_customer` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`, `alamat_customer`, `no_hp_customer`) VALUES
(2, 'Toko Jaya', 'Malang', '089676328311'),
(3, 'Toko Abadi', 'Jakarta', '081234785434');

-- --------------------------------------------------------

--
-- Table structure for table `hak_akses`
--

CREATE TABLE `hak_akses` (
  `id_akses` int(11) NOT NULL,
  `nama_akses` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hak_akses`
--

INSERT INTO `hak_akses` (`id_akses`, `nama_akses`, `keterangan`) VALUES
(1, 'Admin Primary', 'Database administrator'),
(2, 'Admin General', 'Admin'),
(3, 'User', 'User'),
(4, 'Pembelian', 'Pembelian'),
(5, 'Penjualan', 'Penjualan'),
(6, 'Gudang', 'Gudang'),
(7, 'Pembayaran', 'Pembayaran');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `jumlah_pembelian` int(11) DEFAULT NULL,
  `harga_beli` double DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `jumlah_pembelian`, `harga_beli`, `id_barang`, `id_supplier`, `created_at`, `updated_at`) VALUES
(15, 20, 5000, 1, 5, '2024-01-16 13:28:31', NULL),
(16, 30, 7000, 2, 5, '2024-01-16 13:29:42', NULL),
(17, 25, 8000, 3, 5, '2024-01-16 13:30:55', '2024-01-16 19:23:53'),
(18, 15, 4000, 4, 5, '2024-01-16 13:31:46', NULL),
(19, 6, 20000, 5, 5, '2024-01-16 13:32:30', NULL),
(20, 20, 15000, 6, 5, '2024-01-16 13:35:04', NULL),
(21, 20, 70000, 7, 5, '2024-01-16 13:37:36', NULL),
(22, 35, 9000, 8, 5, '2024-01-16 13:38:25', NULL),
(23, 30, 10000, 9, 5, '2024-01-16 13:39:15', NULL),
(24, 20, 11000, 10, 5, '2024-01-16 13:39:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nama_depan` varchar(50) DEFAULT NULL,
  `nama_belakang` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `id_akses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama_pengguna`, `password`, `nama_depan`, `nama_belakang`, `no_hp`, `alamat`, `id_akses`) VALUES
(1, 'Andini Putri', 'pass1', 'Andini', 'Putri', '081234213212', 'Malang ', 1),
(2, 'Muhammad Putra', 'pass2', 'Muhammad', 'Putra', '082344758218', 'Solo', 2),
(3, 'Dimas Putra', 'pass3', 'Dimas', 'Putra', '081234758381', 'Bandung', 3),
(4, 'Dewi Putri', 'pass4', 'Dewi', 'Putri', '081937478221', 'Bandung', 3),
(5, 'Renta Alifia', 'pass5', 'Renta', 'Alifia', '082317483282', 'Malang', 4),
(6, 'Bagaskara Adi', 'pass6', 'Bagaskara', 'Adi', '082371836472', 'Jakarta', 4),
(7, 'Dwi Putri', 'pass7', 'Dwi', 'Putri', '089237467281', 'Jakarta', 5),
(8, 'Ira Lestari', 'pass8', 'Ira', 'Lestari', '081237468281', 'Jakarta', 5);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `jumlah_penjualan` int(11) DEFAULT NULL,
  `harga_jual` double DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `jumlah_penjualan`, `harga_jual`, `id_barang`, `id_customer`, `created_at`, `updated_at`) VALUES
(39, 10, 80000, 1, 2, '2024-01-16 13:28:56', NULL),
(40, 20, 8000, 2, 2, '2024-01-16 13:30:00', NULL),
(41, 20, 11000, 3, 2, '2024-01-16 13:31:17', NULL),
(42, 10, 6000, 4, 2, '2024-01-16 13:32:01', NULL),
(43, 3, 30000, 5, 2, '2024-01-16 13:32:48', NULL),
(44, 10, 30000, 6, 3, '2024-01-16 13:35:29', NULL),
(45, 15, 80000, 7, 2, '2024-01-16 13:37:56', NULL),
(47, 15, 20000, 9, 2, '2024-01-16 13:39:55', NULL),
(48, 6, 15000, 8, 2, '2024-01-16 13:40:49', '2024-01-16 19:35:39'),
(49, 1, 20000, 10, 2, '2024-01-16 16:06:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(255) DEFAULT NULL,
  `no_hp_supplier` varchar(30) DEFAULT NULL,
  `alamat_supplier` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `no_hp_supplier`, `alamat_supplier`) VALUES
(5, 'Supplier 1', '087766367126', 'Jakarta'),
(9, 'Supplier 2', '081111111111', 'Malang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`) USING BTREE,
  ADD KEY `id_pengguna` (`id_pengguna`) USING BTREE;

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`) USING BTREE;

--
-- Indexes for table `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD PRIMARY KEY (`id_akses`) USING BTREE;

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`) USING BTREE,
  ADD KEY `id_barang` (`id_barang`) USING BTREE,
  ADD KEY `id_supplier` (`id_supplier`) USING BTREE;

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`) USING BTREE,
  ADD KEY `IdAkses` (`id_akses`) USING BTREE;

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`) USING BTREE,
  ADD KEY `id_barang` (`id_barang`) USING BTREE,
  ADD KEY `id_pelanggan` (`id_customer`) USING BTREE;

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `id_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_akses`) REFERENCES `hak_akses` (`id_akses`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
