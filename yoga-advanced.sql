-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2018 at 12:59 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yoga-advanced`
--

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1516204284),
('m130524_201442_init', 1516204288),
('m180117_183559_create_tbl_comment_table', 1516214176),
('m180119_092121_create_tbl_tahun_ajaran_table', 1516353705),
('m180119_092325_create_tbl_kelas_table', 1516353818),
('m180119_092720_create_tbl_data_induk_siswa_table', 1516354064),
('m180119_092918_create_tbl_kelas_tahun_ajaran_table', 1516354173),
('m180119_093150_create_tbl_siswa_kelas_tahun_ajaran_table', 1516354377),
('m180119_161551_create_tbl_kelas_tahun_ajaran_table', 1516378566);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`id`, `name`, `message`) VALUES
(4, 'gendut', 'kopi hitam masih panas. kopi hitam ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_induk_siswa`
--

CREATE TABLE IF NOT EXISTS `tbl_data_induk_siswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nis` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nama_ortu` varchar(255) NOT NULL,
  `tahun_masuk` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-tbl_data_induk_siswa-created_by` (`created_by`),
  KEY `idx-tbl_data_induk_siswa-updated_by` (`updated_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE IF NOT EXISTS `tbl_kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-tbl_kelas-created_by` (`created_by`),
  KEY `idx-tbl_kelas-updated_by` (`updated_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id`, `nama`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(12, 'yoga', '2018-01-21 18:43:03', '2018-01-21 18:43:03', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas_tahun_ajaran`
--

CREATE TABLE IF NOT EXISTS `tbl_kelas_tahun_ajaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tahun_ajaran` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-tbl_kelas_tahun_ajaran-id_tahun_ajaran` (`id_tahun_ajaran`),
  KEY `idx-tbl_kelas_tahun_ajaran-id_kelas` (`id_kelas`),
  KEY `idx-tbl_kelas_tahun_ajaran-created_by` (`created_by`),
  KEY `idx-tbl_kelas_tahun_ajaran-updated_by` (`updated_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_kelas_tahun_ajaran`
--

INSERT INTO `tbl_kelas_tahun_ajaran` (`id`, `id_tahun_ajaran`, `id_kelas`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(10, 6, 12, '2018-01-21 18:47:33', '2018-01-21 18:47:33', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa_kelas_tahun_ajaran`
--

CREATE TABLE IF NOT EXISTS `tbl_siswa_kelas_tahun_ajaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_data_induk_siswa` int(11) NOT NULL,
  `id_kelas_tahun_ajaran` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-tbl_siswa_kelas_tahun_ajaran-id_data_induk_siswa` (`id_data_induk_siswa`),
  KEY `idx-tbl_siswa_kelas_tahun_ajaran-id_kelas_tahun_ajaran` (`id_kelas_tahun_ajaran`),
  KEY `idx-tbl_siswa_kelas_tahun_ajaran-created_by` (`created_by`),
  KEY `idx-tbl_siswa_kelas_tahun_ajaran-updated_by` (`updated_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tahun_ajaran`
--

CREATE TABLE IF NOT EXISTS `tbl_tahun_ajaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-tbl_tahun_ajaran-created_by` (`created_by`),
  KEY `idx-tbl_tahun_ajaran-updated_by` (`updated_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_tahun_ajaran`
--

INSERT INTO `tbl_tahun_ajaran` (`id`, `nama`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(6, '2017-2018', '2018-01-21 18:46:43', '2018-01-21 18:46:43', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(4, 'yoga', 'vYczgRRF5NQYgra5wxuCxpGd5jn1U9Z-', '$2y$13$aEZVUa.sAZ5xYmHAisCHheSLmrOdcXeWDC2S55.kcHxjQmId/.c2.', NULL, 'yoga@gmail.com', 10, 1516534802, 1516534802);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_data_induk_siswa`
--
ALTER TABLE `tbl_data_induk_siswa`
  ADD CONSTRAINT `fk-tbl_data_induk_siswa-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tbl_data_induk_siswa-updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `fk-tbl_kelas-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tbl_kelas-updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_kelas_tahun_ajaran`
--
ALTER TABLE `tbl_kelas_tahun_ajaran`
  ADD CONSTRAINT `fk-tbl_kelas_tahun_ajaran-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tbl_kelas_tahun_ajaran-id_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `tbl_kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tbl_kelas_tahun_ajaran-id_tahun_ajaran` FOREIGN KEY (`id_tahun_ajaran`) REFERENCES `tbl_tahun_ajaran` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tbl_kelas_tahun_ajaran-updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_siswa_kelas_tahun_ajaran`
--
ALTER TABLE `tbl_siswa_kelas_tahun_ajaran`
  ADD CONSTRAINT `fk-tbl_siswa_kelas_tahun_ajaran-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tbl_siswa_kelas_tahun_ajaran-id_data_induk_siswa` FOREIGN KEY (`id_data_induk_siswa`) REFERENCES `tbl_data_induk_siswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tbl_siswa_kelas_tahun_ajaran-id_kelas_tahun_ajaran` FOREIGN KEY (`id_kelas_tahun_ajaran`) REFERENCES `tbl_kelas_tahun_ajaran` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tbl_siswa_kelas_tahun_ajaran-updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_tahun_ajaran`
--
ALTER TABLE `tbl_tahun_ajaran`
  ADD CONSTRAINT `fk-tbl_tahun_ajaran-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tbl_tahun_ajaran-updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
