/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : tk4_dim

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 20/01/2024 20:24:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang`  (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `satuan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_pengguna` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_barang`) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang
-- ----------------------------
INSERT INTO `barang` VALUES (1, 'Good Day Cappuccino', 'Kopi merk Good Day rasa cappuccino', 'pack', 1);
INSERT INTO `barang` VALUES (2, 'Cimory Fresh Milk Matcha', 'Susu merk Cimory dengan rasa matcha', 'pack', 1);
INSERT INTO `barang` VALUES (3, 'Aqua', 'Air mineral dengan merk Aqua', 'pack', 1);
INSERT INTO `barang` VALUES (4, 'Nutella Hazelnut Spread', 'Selai hazelnut dengan merk Nutella', 'pcs', 1);
INSERT INTO `barang` VALUES (5, 'Beras Pandanwangi', 'Beras dengan merk Pandanwangi', 'kg', 1);
INSERT INTO `barang` VALUES (6, 'Minyak Sunco', 'Minyak dengan merk Sunco', 'liter', 1);
INSERT INTO `barang` VALUES (7, 'Telur', 'Telur', 'kg', 1);
INSERT INTO `barang` VALUES (8, 'Tepung Rosebrand', 'Tepung dengan merk Rosebrand', 'pack', 1);
INSERT INTO `barang` VALUES (9, 'Gula Gulaku', 'Gula dengan merk Gulaku', 'pack', 1);
INSERT INTO `barang` VALUES (10, 'Sari Roti', 'Roti dengan merk Sari Roti', 'dzn', 1);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `nama_customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `no_hp_customer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (2, 'Toko Jaya', 'Malang', '089676328311');
INSERT INTO `customer` VALUES (3, 'Toko Abadi', 'Jakarta', '081234785434');

-- ----------------------------
-- Table structure for hak_akses
-- ----------------------------
DROP TABLE IF EXISTS `hak_akses`;
CREATE TABLE `hak_akses`  (
  `id_akses` int NOT NULL AUTO_INCREMENT,
  `nama_akses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id_akses`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hak_akses
-- ----------------------------
INSERT INTO `hak_akses` VALUES (1, 'Admin Primary', 'Database administrator');
INSERT INTO `hak_akses` VALUES (2, 'Admin General', 'Admin');
INSERT INTO `hak_akses` VALUES (3, 'User', 'User');
INSERT INTO `hak_akses` VALUES (4, 'Pembelian', 'Pembelian');
INSERT INTO `hak_akses` VALUES (5, 'Penjualan', 'Penjualan');
INSERT INTO `hak_akses` VALUES (6, 'Gudang', 'Gudang');
INSERT INTO `hak_akses` VALUES (7, 'Pembayaran', 'Pembayaran');

-- ----------------------------
-- Table structure for pembelian
-- ----------------------------
DROP TABLE IF EXISTS `pembelian`;
CREATE TABLE `pembelian`  (
  `id_pembelian` int NOT NULL AUTO_INCREMENT,
  `jumlah_pembelian` int NULL DEFAULT NULL,
  `harga_beli` double NULL DEFAULT NULL,
  `id_barang` int NULL DEFAULT NULL,
  `id_supplier` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pembelian`) USING BTREE,
  INDEX `id_barang`(`id_barang` ASC) USING BTREE,
  INDEX `id_supplier`(`id_supplier` ASC) USING BTREE,
  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pembelian
-- ----------------------------
INSERT INTO `pembelian` VALUES (15, 20, 5000, 1, 5, '2024-01-16 20:28:31', NULL);
INSERT INTO `pembelian` VALUES (16, 30, 7000, 2, 5, '2024-01-16 20:29:42', NULL);
INSERT INTO `pembelian` VALUES (17, 25, 8000, 3, 5, '2024-01-16 20:30:55', '2024-01-17 02:23:53');
INSERT INTO `pembelian` VALUES (18, 15, 4000, 4, 5, '2024-01-16 20:31:46', NULL);
INSERT INTO `pembelian` VALUES (19, 6, 20000, 5, 5, '2024-01-16 20:32:30', NULL);
INSERT INTO `pembelian` VALUES (20, 20, 15000, 6, 5, '2024-01-16 20:35:04', NULL);
INSERT INTO `pembelian` VALUES (21, 20, 70000, 7, 5, '2024-01-16 20:37:36', NULL);
INSERT INTO `pembelian` VALUES (22, 35, 9000, 8, 5, '2024-01-16 20:38:25', NULL);
INSERT INTO `pembelian` VALUES (23, 30, 10000, 9, 5, '2024-01-16 20:39:15', NULL);
INSERT INTO `pembelian` VALUES (24, 20, 11000, 10, 5, '2024-01-16 20:39:36', NULL);

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna`  (
  `id_pengguna` int NOT NULL AUTO_INCREMENT,
  `nama_pengguna` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nama_depan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nama_belakang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `id_akses` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`) USING BTREE,
  INDEX `IdAkses`(`id_akses` ASC) USING BTREE,
  CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_akses`) REFERENCES `hak_akses` (`id_akses`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES (1, 'Andini Putri', 'pass1', 'Andini', 'Putri', '081234213212', 'Malang ', 2);
INSERT INTO `pengguna` VALUES (2, 'Muhammad Putra', 'pass2', 'Muhammad', 'Putra', '082344758218', 'Solo', 2);
INSERT INTO `pengguna` VALUES (3, 'Dimas Putra', 'pass3', 'Dimas', 'Putra', '081234758381', 'Bandung', 4);
INSERT INTO `pengguna` VALUES (4, 'Dewi Putri', 'pass4', 'Dewi', 'Putri', '081937478221', 'Bandung', 4);
INSERT INTO `pengguna` VALUES (5, 'Renta Alifia', 'pass5', 'Renta', 'Alifia', '082317483282', 'Malang', 5);
INSERT INTO `pengguna` VALUES (6, 'Bagaskara Adi', 'pass6', 'Bagaskara', 'Adi', '082371836472', 'Jakarta', 5);
INSERT INTO `pengguna` VALUES (7, 'Dwi Putri', 'pass7', 'Dwi', 'Putri', '089237467281', 'Jakarta', 6);
INSERT INTO `pengguna` VALUES (8, 'Ira Lestari', 'pass8', 'Ira', 'Lestari', '081237468281', 'Jakarta', 6);

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan`  (
  `id_penjualan` int NOT NULL AUTO_INCREMENT,
  `jumlah_penjualan` int NULL DEFAULT NULL,
  `harga_jual` double NULL DEFAULT NULL,
  `id_barang` int NULL DEFAULT NULL,
  `id_customer` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_penjualan`) USING BTREE,
  INDEX `id_barang`(`id_barang` ASC) USING BTREE,
  INDEX `id_pelanggan`(`id_customer` ASC) USING BTREE,
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
INSERT INTO `penjualan` VALUES (39, 10, 80000, 1, 2, '2024-01-16 20:28:56', NULL);
INSERT INTO `penjualan` VALUES (40, 20, 8000, 2, 2, '2024-01-16 20:30:00', NULL);
INSERT INTO `penjualan` VALUES (41, 20, 11000, 3, 2, '2024-01-16 20:31:17', NULL);
INSERT INTO `penjualan` VALUES (42, 10, 6000, 4, 2, '2024-01-16 20:32:01', NULL);
INSERT INTO `penjualan` VALUES (43, 3, 30000, 5, 2, '2024-01-16 20:32:48', NULL);
INSERT INTO `penjualan` VALUES (44, 10, 30000, 6, 3, '2024-01-16 20:35:29', NULL);
INSERT INTO `penjualan` VALUES (45, 15, 80000, 7, 2, '2024-01-16 20:37:56', NULL);
INSERT INTO `penjualan` VALUES (47, 15, 20000, 9, 2, '2024-01-16 20:39:55', NULL);
INSERT INTO `penjualan` VALUES (48, 6, 15000, 8, 2, '2024-01-16 20:40:49', '2024-01-17 02:35:39');
INSERT INTO `penjualan` VALUES (49, 1, 20000, 10, 2, '2024-01-16 23:06:27', NULL);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `no_hp_supplier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat_supplier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (5, 'Supplier 1', '087766367126', 'Jakarta');
INSERT INTO `supplier` VALUES (9, 'Supplier 2', '081111111111', 'Malang');

SET FOREIGN_KEY_CHECKS = 1;
