-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2025 at 06:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(20) DEFAULT 'umum',
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `jurusan`, `tgl_daftar`) VALUES
('AU003', 'Elijah Cyrano', 'Umum', '2025-01-14'),
('TI001', 'Fadlika Alfi', 'Teknologi Informasi', '2025-02-03'),
('TM002', 'Lintang Jagaphati', 'Teknik Mesin', '2025-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `penerbit` varchar(50) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL CHECK (`tahun_terbit` between 1900 and 2025),
  `id_penerbit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penerbit`, `tahun_terbit`, `id_penerbit`) VALUES
('A001', 'Basis Data', 'CV Andi Offset', 2006, NULL),
('A002', 'Kumpulan Solusi Pemrograman Python', 'Informatika Bandung', 2019, NULL),
('A003', 'Dasar-dasar Teknik Mesin', 'Rineka Cipta', 2020, NULL),
('A004', 'Jingga dan Senja', 'Gramedia', 2010, NULL),
('A005', 'Segi Tiga', 'Gramedia', 2020, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_prminjaman` int(11) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `id_buku` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_prminjaman`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`) VALUES
(1, 'AU003', 'A004', '2025-01-20', '2025-01-27', 0),
(2, 'TM002', 'A003', '2025-03-15', '2025-03-18', 0),
(3, 'TI001', 'A002', '2025-03-11', '2025-03-25', 17500);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(50) NOT NULL,
  `penerbit` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `penerbit`, `alamat`) VALUES
('B001', 'Gramedia', 'Jl.Lurus'),
('B002', 'CV Andi Offset', 'Jl.Phlawan'),
('B003', 'Informatika Bndung', 'Jl.Bandung'),
('B004', 'Rineka Cipta', 'Jl.Kiri');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_id_penerbit` (`id_penerbit`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_prminjaman`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_prminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_id_penerbit` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
