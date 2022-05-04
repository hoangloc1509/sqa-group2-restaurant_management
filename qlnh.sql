-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 11:19 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlnh`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbldish`
--

CREATE TABLE `tbldish` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbldish`
--

INSERT INTO `tbldish` (`id`, `name`, `price`, `type`, `image`, `description`) VALUES
(2, 'Gà tần ', 125000, 'Món chính', 'https://meta.vn/Data/image/2019/11/09/cach-lam-ga-ham-thuoc-bac-3.jpg', 'Gà tần thuốc bắc '),
(3, 'Gà quay', 125000, 'Món chính', 'https://cdn.tgdd.vn/Files/2020/10/10/1297715/chieu-dai-ca-nha-voi-mon-ga-quay-me-da-gion-thom-ngon-nuc-mui-202010101538080615.jpg', 'Gà quay me sốt cay'),
(4, 'Canh cá', 100000, 'Món chính', 'http://cdn.tgdd.vn/Files/2020/06/13/1262703/cach-nau-canh-chua-ca-chep-thom-ngon-bo-duong-khong-bi-tanh-cho-ba-bau-202006131050180899.jpg', 'Canh chua cá chép'),
(5, 'Pepsi', 12000, 'Đồ uống', 'https://webgiadinh.vn/wp-content/uploads/2021/08/nuoc-ngot-pepsi.jpg', 'Pepsi 12000đ/lon'),
(6, 'Pepsi chai 330ml', 10000, 'Đồ uống', 'https://cdn.tgdd.vn/Products/Images/2443/76466/bhx/nuoc-ngot-pepsi-cola-390ml-202004091020350617.JPG', NULL),
(7, 'Pepsi chai 1.5l', 17000, 'Đồ uống', 'https://www.uprice.vn/static/images/wss/806412178/nt2kkfoh25qwl.jpg', NULL),
(8, 'Khoai tây chiên', 10000, 'Khai vị', 'https://img-global.cpcdn.com/recipes/f58a99db45e8e52f/1200x630cq70/photo.jpg', NULL),
(9, 'Bánh gà phô mai que', 12000, 'Khai vị', 'https://cf.shopee.vn/file/22aab7874859bf7e5f4513ecb77c98e7', NULL),
(10, 'Bánh kem dâu chocolate', 35000, 'Tráng miệng', 'https://hoanghaigroup.com/wp-content/uploads/2020/07/Mon-trang-mieng-Banh-kem-dau-chocolate.jpg', NULL),
(11, 'Sữa chua hương dâu', 15000, 'Tráng miệng', 'https://media.cooky.vn/images/blog-2016/5-kieu-bien-tau-trai-cay-tro-thanh-mon-ngon-kho-choi-tu%204.jpg', NULL),
(12, 'Rau câu trái cây', 30000, 'Tráng miệng', 'https://media.cooky.vn/recipe/g3/29741/s800x500/recipe-cover-r29741.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbldishordered`
--

CREATE TABLE `tbldishordered` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `dish_id` int(10) DEFAULT NULL,
  `reser_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbldishordered`
--

INSERT INTO `tbldishordered` (`id`, `name`, `quantity`, `price`, `dish_id`, `reser_id`) VALUES
(4, 'Gà quay', 1, 125000, 3, 1),
(5, 'Gà quay', 1, 125000, 3, 1),
(6, 'Gà tần ', 1, 125000, 2, 3),
(7, 'Bánh kem dâu chocolate', 1, 35000, 10, 3),
(8, 'Khoai tây chiên', 1, 10000, 8, 2),
(9, 'Gà quay', 3, 375000, 3, 2),
(10, 'Pepsi chai 1.5l', 2, 34000, 7, 2),
(11, 'Sữa chua hương dâu', 3, 45000, 11, 4),
(12, 'Bánh kem dâu chocolate', 2, 70000, 10, 4),
(13, 'Canh cá', 2, 200000, 4, 5),
(14, 'Bánh gà phô mai que', 2, 24000, 9, 5),
(15, 'Pepsi chai 1.5l', 1, 17000, 7, 5),
(16, 'Khoai tây chiên', 1, 10000, 8, 6),
(17, 'Gà tần ', 1, 125000, 2, 6),
(18, 'Canh cá', 2, 200000, 4, 6),
(19, 'Pepsi chai 1.5l', 1, 17000, 7, 6),
(20, 'Pepsi chai 330ml', 1, 10000, 6, 7),
(21, 'Gà quay', 1, 125000, 3, 7),
(22, 'Canh cá', 2, 200000, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tblreser`
--

CREATE TABLE `tblreser` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `booked_date` date DEFAULT NULL,
  `booked_time` varchar(255) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `is_ordered` int(11) NOT NULL,
  `is_paid` int(11) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblreser`
--

INSERT INTO `tblreser` (`id`, `name`, `phone`, `quantity`, `booked_date`, `booked_time`, `UserId`, `is_ordered`, `is_paid`, `amount`) VALUES
(1, 'Hoàng Đình Lộc', '0135487654', 4, '2022-03-20', '08:00:00', 1, 1, 1, 250000),
(2, 'Nguyễn Trung Phong', '0135487654', 12, '2022-03-23', '19:00:00', 1, 1, 0, 419000),
(3, 'Ngô Phan Đình Nhã', '01688175231', 1, '2022-03-23', '11:00:00', 2, 1, 1, 160000),
(4, 'Ngô Đăng Thái', '0178944256', 2, '2022-03-24', '14:00:00', 5, 1, 0, 115000),
(5, 'Hoàng Duy Đạt', '0987125465', 6, '2022-03-25', '20:00:00', 4, 1, 0, 241000),
(6, 'Ngô Đăng Thái', '01688175231', 12, '2022-03-23', '21:00:00', 5, 1, 0, 352000),
(7, 'Ngô Phan Đình Nhã', '0178944256', 6, '2022-03-24', '12:00:00', 2, 1, 0, 335000),
(8, 'Hoàng Đình Lộc', '0987125465', 6, '2022-03-30', '16:00:00', 1, 0, 0, 0),
(9, 'Nguyễn Tử Quảng', '0124597895', 12, '2022-05-01', '08:00:00', 1, 0, 0, 0),
(13, 'Ngô Phan Đình Nhã', '0745215784', 12, '2022-05-02', '09:00:00', 2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`id`, `username`, `password`, `role`, `name`) VALUES
(1, 'hoangloc', '123', 'client', 'Hoàng Đình Lộc'),
(2, 'dinhnha', '123', 'client', 'Ngô Phan Đình Nhã'),
(3, 'kai', '123', 'admin', ''),
(4, 'duydat', '123', 'client', 'Hoàng Duy Đạt'),
(5, 'dangthai', '123', 'client', 'Ngô Đăng Thái'),
(6, 'lexluthor', '123', 'receptionist', 'Le Minh Tuan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbldish`
--
ALTER TABLE `tbldish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldishordered`
--
ALTER TABLE `tbldishordered`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dish_id` (`dish_id`),
  ADD KEY `reser_id` (`reser_id`);

--
-- Indexes for table `tblreser`
--
ALTER TABLE `tblreser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbldish`
--
ALTER TABLE `tbldish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbldishordered`
--
ALTER TABLE `tbldishordered`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tblreser`
--
ALTER TABLE `tblreser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbldishordered`
--
ALTER TABLE `tbldishordered`
  ADD CONSTRAINT `tbldishordered_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `tbldish` (`id`),
  ADD CONSTRAINT `tbldishordered_ibfk_2` FOREIGN KEY (`reser_id`) REFERENCES `tblreser` (`id`);

--
-- Constraints for table `tblreser`
--
ALTER TABLE `tblreser`
  ADD CONSTRAINT `tblreser_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `tbluser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
