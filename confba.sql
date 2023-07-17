-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 17, 2023 at 05:46 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `confba`
--

-- --------------------------------------------------------

--
-- Table structure for table `oradores`
--

CREATE TABLE `oradores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `temario` varchar(150) NOT NULL,
  `foto` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oradores`
--

INSERT INTO `oradores` (`id`, `nombre`, `apellido`, `temario`, `foto`) VALUES
(1, 'Steve', 'Jobs', 'Reinventando dispositivos móviles y haciendo computadores eficientes.', 'steve.jpg'),
(2, 'Bill', 'Gates', 'El viaje de Microsoft hacia un mundo conectado (a mis servidores).', 'bill.jpg'),
(3, 'Ada', 'Lovelance', 'Mi legado en la era de la programación y la transformación informática.', 'adal.jpg'),
(8, 'Nikola', 'Tesla', 'Mi visión del futuro y mi aporte al avance de la tecnología. ', 'tesla.png'),
(35, 'Charly', 'Cimino', 'El manejo de la paciencia empezando a programar en Java.', 'charly2.png'),
(89, 'Alan', 'Turing', 'El avance de la inteligencia artificial y sus desafíos hacia el futuro.', 'turing.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oradores`
--
ALTER TABLE `oradores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oradores`
--
ALTER TABLE `oradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
