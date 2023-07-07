-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2023 at 03:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `design-pattern`
--

-- --------------------------------------------------------

--
-- Table structure for table `oe_admins`
--

CREATE TABLE `oe_admins` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `alternate_number_type` varchar(255) DEFAULT NULL,
  `alternate_number` varchar(30) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oe_admins`
--

INSERT INTO `oe_admins` (`admin_id`, `user_id`, `alternate_number_type`, `alternate_number`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, 'Office', '1(956) 231-8787--789', '1', '2023-07-07 04:45:25', '2023-07-07 04:45:25'),
(3, 5, 'Office', '62(956) 231-8787--578', '1', '2023-07-07 04:45:25', '2023-07-07 04:45:25'),
(4, 2, '', '', '', '2023-07-07 04:45:25', '2023-07-07 04:45:25');

-- --------------------------------------------------------

--
-- Table structure for table `oe_employees`
--

CREATE TABLE `oe_employees` (
  `emp_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `alternate_number_type` varchar(255) DEFAULT NULL,
  `alternate_number` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `emp_proj_updates_notify` int(11) NOT NULL DEFAULT 0,
  `emp_promotions_notify` int(11) NOT NULL DEFAULT 0,
  `emp_new_leads_notify` int(11) NOT NULL DEFAULT 0,
  `emp_message_center_notify` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oe_employees`
--

INSERT INTO `oe_employees` (`emp_id`, `user_id`, `alternate_number_type`, `alternate_number`, `position`, `emp_proj_updates_notify`, `emp_promotions_notify`, `emp_new_leads_notify`, `emp_message_center_notify`, `created_at`, `updated_at`, `created_by`) VALUES
(3, 3, 'Office', '1(987) 987-9879', '8', 0, 0, 0, 0, '2022-02-08 14:13:41', '2023-02-08 11:53:41', 1),
(4, 6, '', '', '1', 0, 0, 0, 0, '2022-02-08 14:14:36', '2022-06-01 12:44:24', 1),
(5, 7, 'Office', '1(000) 000-0000', '9', 0, 0, 0, 0, '2022-02-19 19:31:08', '2022-03-15 20:21:57', 1),
(6, 8, 'Office', '1(760) 458-9181', '3', 0, 0, 0, 0, '2022-02-19 19:37:01', '2023-04-28 02:02:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oe_users`
--

CREATE TABLE `oe_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number_type` varchar(255) DEFAULT NULL,
  `phone_number` varchar(30) NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1=active, 0=not active',
  `is_deleted` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0= not deleted, 1= deleted',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oe_users`
--

INSERT INTO `oe_users` (`user_id`, `username`, `password`, `email`, `first_name`, `last_name`, `phone_number_type`, `phone_number`, `user_image`, `role_id`, `status`, `is_deleted`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Batman', 'bd5ef1676a1040db74e4245c2126617d', 'karanjain@synkrama.com', 'Karan', 'Jain', 'Office', '1(619) 416-6701--128', NULL, 2, '1', '0', 0, '2023-07-07 04:45:54', '2023-07-07 04:45:54'),
(2, 'DEL1Admin', '15a6b380afea23bd179b4c761a3d7e4a', 'DEL1admin1@oe.com', 'John', 'Doe', 'Office', '1(987) 987-9879--123', NULL, 2, '0', '1', 1, '2023-07-07 04:45:54', '2023-07-07 04:45:54'),
(3, 'Olive', '786380eb991be09f763b1da9268d3125', 'emp@oe.com', 'Olive', 'Yew', 'Office', '1(798) 798-7987', NULL, 3, '1', '0', 1, '2023-07-07 04:45:54', '2023-07-07 04:45:54'),
(4, 'Allie', '15a6b380afea23bd179b4c761a3d7e4a', 'emp2@oe.com', 'Allie', 'Grater', 'Office', '1(796) 786-9766', NULL, 3, '1', '0', 1, '2023-07-07 04:45:54', '2023-07-07 04:45:54'),
(5, 'staffsourabh', 'bd5ef1676a1040db74e4245c2126617d', 'staff@testing.com', 'staff', 'test', NULL, '(879) 459-7946', NULL, 5, '1', '0', 1, '2023-07-07 04:45:54', '2023-07-07 04:45:54'),
(6, 'Toddman', '81dc9bdb52d04dc20036dbd8313ed055', 'Todd@outdoorelementsusa.com', 'Todd', 'Jackson', 'Office', '1(619) 944-4204', NULL, 1, '1', '0', 1, '2023-07-07 04:45:54', '2023-07-07 04:45:54'),
(7, 'RyanR', '62f30bbbc588b631f7978ed65c6edcc6', 'Ryanr@outdoorelementsusa.com', 'Ryan', 'Ralphs', 'Office', '1(619) 933-2940', NULL, 3, '1', '0', 1, '2023-07-07 04:45:54', '2023-07-07 04:45:54'),
(8, NULL, 'ce1ba61fadcfcebb04986fd65817703d', 'kathytucker0609@gmail.com', 'Kathy Tucker', 'Tucker', NULL, '1(704) 456-8549', NULL, 3, '1', '0', 1, '2023-07-07 04:45:56', '2023-07-07 04:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `oe_user_roles`
--

CREATE TABLE `oe_user_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oe_user_roles`
--

INSERT INTO `oe_user_roles` (`role_id`, `role_name`) VALUES
(1, 'Super admin'),
(2, 'Admin'),
(3, 'Employee'),
(4, 'Dealer'),
(5, 'Staff'),
(6, 'Customer'),
(7, 'Vendor'),
(8, 'Vendors Staff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oe_admins`
--
ALTER TABLE `oe_admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `oe_employees`
--
ALTER TABLE `oe_employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `oe_users`
--
ALTER TABLE `oe_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `oe_user_roles`
--
ALTER TABLE `oe_user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oe_admins`
--
ALTER TABLE `oe_admins`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `oe_employees`
--
ALTER TABLE `oe_employees`
  MODIFY `emp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `oe_users`
--
ALTER TABLE `oe_users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5357;

--
-- AUTO_INCREMENT for table `oe_user_roles`
--
ALTER TABLE `oe_user_roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oe_admins`
--
ALTER TABLE `oe_admins`
  ADD CONSTRAINT `oe_admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `oe_users` (`user_id`);

--
-- Constraints for table `oe_employees`
--
ALTER TABLE `oe_employees`
  ADD CONSTRAINT `oe_employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `oe_users` (`user_id`);

--
-- Constraints for table `oe_users`
--
ALTER TABLE `oe_users`
  ADD CONSTRAINT `oe_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `oe_user_roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
