-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2025 at 02:24 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storee`
--

-- --------------------------------------------------------

--
-- Table structure for table `customerss`
--

DROP TABLE IF EXISTS `customerss`;
CREATE TABLE IF NOT EXISTS `customerss` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customerss`
--

INSERT INTO `customerss` (`customerID`, `name`, `email`, `mobile`, `address`, `password`) VALUES
(101, 'Annie', 'annie@gmail.com', '09451404529', 'Espinosa', 'anni3'),
(102, 'Alice', 'alicee@gmail.com', '09341404039', 'Lawi', 'al1c3'),
(103, 'Allysa', 'allysa@gmail.com', '09371404529', 'Bugnay', 'ally54');

-- --------------------------------------------------------

--
-- Table structure for table `orderss`
--

DROP TABLE IF EXISTS `orderss`;
CREATE TABLE IF NOT EXISTS `orderss` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `custumerID` int NOT NULL,
  `orderDate` date NOT NULL,
  `totalAmount` varchar(100) NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `custumerID` (`custumerID`),
  UNIQUE KEY `custumerID_2` (`custumerID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderss`
--

INSERT INTO `orderss` (`orderID`, `custumerID`, `orderDate`, `totalAmount`, `status`) VALUES
(111, 101, '2025-01-01', '1000', 'pending'),
(112, 102, '2025-02-02', '2000', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `paymentt`
--

DROP TABLE IF EXISTS `paymentt`;
CREATE TABLE IF NOT EXISTS `paymentt` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` varchar(100) NOT NULL,
  `paymentMethod` varchar(100) NOT NULL,
  `customerID` int NOT NULL,
  PRIMARY KEY (`paymentID`),
  UNIQUE KEY `orderID` (`orderID`,`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `paymentt`
--

INSERT INTO `paymentt` (`paymentID`, `orderID`, `paymentDate`, `amount`, `paymentMethod`, `customerID`) VALUES
(123, 111, '2024-12-20', '1000', 'Cash', 101),
(456, 112, '2024-11-20', '2000', 'Credit', 102);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `stock` varchar(100) NOT NULL,
  `orderID` int NOT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `orderID` (`orderID`),
  UNIQUE KEY `orderID_2` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `name`, `price`, `category`, `stock`, `orderID`) VALUES
(211, 'Dowee', '1000', 'snack', '100', 111),
(212, 'Kopiko', '2000', 'drinks', '200', 112);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderss`
--
ALTER TABLE `orderss`
  ADD CONSTRAINT `orderss_ibfk_1` FOREIGN KEY (`custumerID`) REFERENCES `customerss` (`customerID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `paymentt`
--
ALTER TABLE `paymentt`
  ADD CONSTRAINT `paymentt_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orderss` (`orderID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orderss` (`orderID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
