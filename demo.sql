-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2018 at 08:42 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `findage` (IN `regNo` VARCHAR(11), IN `firstName` VARCHAR(255), IN `middleName` VARCHAR(255), IN `lastName` VARCHAR(255), IN `dob` DATE, IN `gender` VARCHAR(255), IN `contactNo` BIGINT(20), IN `email` VARCHAR(255), IN `password` VARCHAR(255))  BEGIN

INSERT INTO userregistration(regNo,firstName, middleName, lastName, dob,age,  gender, contactNo, email,password) VALUES(regno,firstname, middlename, lastname, dob,(SELECT FLOOR( DATEDIFF(NOW(),dob)/365)),  gender, contactno, email, password); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertdata` (`name` VARCHAR(100), `email` VARCHAR(100), `message` VARCHAR(1000))  BEGIN 
INSERT INTO feedback(name,email,message)
VALUES (name,email,message);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `reg_date`, `updation_date`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin123', '2018-09-21 06:32:09', '2018-09-21'),
(2, 'shreecha', 'shrichas518@gmail.com', 'shreecha123', '2018-10-23 08:59:04', '0000-00-00'),
(3, 'shireesha', 'shireeshasuresh18@gmail.com', 'shireesha123', '2018-10-23 08:59:04', '2018-10-24');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_sn` varchar(255) NOT NULL,
  `course_fn` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_sn`, `course_fn`, `posting_date`) VALUES
(1, 'B10992', 'B.Tech', 'Bachelor  of Technology', '2016-04-11 08:31:42'),
(3, 'BSC12', 'BSC', 'Bachelor  of Science', '2016-04-11 08:33:23'),
(4, 'BC36356', 'BCA', 'Bachelor Of Computer Application', '2016-04-11 08:34:18'),
(5, 'BE765', 'BE', 'Bachelor of Engineering', '2016-04-11 08:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `message`) VALUES
(16, 'Kishan Shetty', 'kishansh98@hotmail.com', 'Amazing Spiderman');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `regno` varchar(255) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `totalamount` bigint(20) NOT NULL,
  `updationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cardname` varchar(100) DEFAULT NULL,
  `cardnumber` bigint(20) DEFAULT NULL,
  `expmonth` int(11) DEFAULT NULL,
  `expyear` int(11) DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `regno`, `emailid`, `totalamount`, `updationDate`, `cardname`, `cardnumber`, `expmonth`, `expyear`, `cvv`) VALUES
(1, 'Kiran S Happy', '1js16is035', 'test@gmail.com', 22000, '2018-11-15 05:38:57', 'KIRAN S', 1111111111111111, 10, 2022, 333),
(2, 'Kishan Rajeev Shetty', '1js16is037', 'kishansh98@hotmail.com', 70000, '2018-11-15 05:40:10', 'KISHAN SHETTY', 2222222222222222, 11, 2023, 222),
(3, 'Brinda N Murthy', '1js16is020', 'brinda@gmail.com', 84000, '2018-11-15 05:43:18', 'BRINDA MURTHY', 3333333333333333, 4, 2034, 222),
(5, 'Santosh K Naidu', '1js16is001', 'santosh@gmail.com', 66000, '2018-11-15 05:56:42', 'SANTOSH', 5555555555555555, 10, 2023, 222),
(6, 'KiraN S Happy', '1js16is035', 'test@gmail.com', 22000, '2018-11-16 10:22:15', 'TEST CARD NAME', 2458624752485214, 9, 2019, 582),
(7, 'Bhoomika A Nidtha', '1js16ee008', 'bhoomi@gmail.com', 96000, '2018-11-19 07:27:02', 'BHOOMIKA N', 6666666666666666, 8, 2025, 333);

--
-- Triggers `payment`
--
DELIMITER $$
CREATE TRIGGER `capitalize` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN 
SET NEW.cardname =UPPER(NEW.cardname);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `feespm` int(11) NOT NULL,
  `foodstatus` int(11) NOT NULL,
  `stayfrom` date NOT NULL,
  `expiry` date NOT NULL,
  `duration` int(11) NOT NULL,
  `course` varchar(500) NOT NULL,
  `regno` varchar(255) NOT NULL,
  `firstName` varchar(500) NOT NULL,
  `middleName` varchar(500) NOT NULL,
  `lastName` varchar(500) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `contactno` bigint(11) NOT NULL,
  `emailid` varchar(500) NOT NULL,
  `egycontactno` bigint(11) NOT NULL,
  `guardianName` varchar(500) NOT NULL,
  `guardianRelation` varchar(500) NOT NULL,
  `guardianContactno` bigint(11) NOT NULL,
  `corresAddress` varchar(500) NOT NULL,
  `corresCIty` varchar(500) NOT NULL,
  `corresState` varchar(500) NOT NULL,
  `corresPincode` int(11) NOT NULL,
  `pmntAddress` varchar(500) NOT NULL,
  `pmntCity` varchar(500) NOT NULL,
  `pmnatetState` varchar(500) NOT NULL,
  `pmntPincode` int(11) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `roomno`, `seater`, `feespm`, `foodstatus`, `stayfrom`, `expiry`, `duration`, `course`, `regno`, `firstName`, `middleName`, `lastName`, `gender`, `contactno`, `emailid`, `egycontactno`, `guardianName`, `guardianRelation`, `guardianContactno`, `corresAddress`, `corresCIty`, `corresState`, `corresPincode`, `pmntAddress`, `pmntCity`, `pmnatetState`, `pmntPincode`, `postingDate`, `updationDate`) VALUES
(1, 600, 5, 5000, 1, '2018-11-15', '2019-11-15', 12, 'Bachelor of Engineering', '1js16is020', 'Brinda', 'N', 'Murthy', 'Female', 7345765434, 'brinda@gmail.com', 6789678906, 'Kiran', 'Brother', 6789789789, 'JSS College of Engineering', 'Banglore', 'Karnataka', 560023, 'JSS College of Engineering', 'Banglore', 'Karnataka', 560023, '2018-11-15 05:42:52', ''),
(2, 132, 5, 2000, 0, '2018-11-15', '2019-10-15', 11, 'Bachelor  of Science', '1js16is035', 'Kiran', 'Subbu', 'Happy', 'Male', 1111111111, 'test@gmail.com', 6789678906, 'Brinda', 'Sister', 6789789789, 'JSS College of Engineering', 'Banglore', 'Karnataka', 560068, 'JSS College of Engineering', 'Banglore', 'Karnataka', 560068, '2018-11-15 05:37:12', '19-11-2018 01:08:28'),
(3, 600, 5, 5000, 1, '2018-11-22', '2019-09-22', 10, 'Bachelor  of Technology', '1js16is037', 'Kishan', 'R', 'Shetty', 'Male', 7345765434, 'kishansh98@hotmail.com', 6789678906, 'Kiran', 'Brother', 6789789789, 'JSS College of Engineering', 'Banglore', 'Karnataka', 560068, 'JSS College of Engineering', 'Banglore', 'Karnataka', 560068, '2018-11-15 05:28:10', '19-11-2018 01:11:42'),
(4, 201, 2, 6000, 1, '2018-11-19', '2019-11-19', 12, 'Bachelor of Engineering', '1js16ee008', 'Bhoomika', 'A', 'Nidtha', 'Female', 7654345434, 'bhoomi@gmail.com', 6789678906, 'Kishan', 'Boyfriend', 6789789789, 'JSS College of Engineering', 'Banglore', 'Karnataka', 560068, 'JSS College of Engineering', 'Banglore', 'Karnataka', 560068, '2018-11-19 07:25:54', ''),
(5, 200, 2, 6000, 0, '2018-11-14', '2019-10-14', 11, 'Bachelor  of Science', '1js16is001', 'Santosh', 'K', 'Naidu', 'Male', 7345765434, 'santosh@gmail.com', 6789678906, 'Kishan', 'Brother', 6789789789, 'JSS College of Engineering', 'Banglore', 'Karnataka', 546123, 'JSS College of Engineering', 'Banglore', 'Karnataka', 546123, '2018-11-15 05:56:18', '');

-- Triggers `registration`
--
DELIMITER $$
CREATE TRIGGER `setexpiry` BEFORE INSERT ON `registration` FOR EACH ROW BEGIN
SET NEW.expiry = date_add(new.stayfrom, interval new.duration month);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `fees` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `seater`, `room_no`, `fees`, `posting_date`) VALUES
(2, 2, 201, 6000, '2016-04-11 20:00:47'),
(3, 2, 200, 6000, '2016-04-11 20:00:58'),
(4, 3, 112, 4000, '2016-04-11 20:01:07'),
(5, 5, 132, 2000, '2016-04-11 20:01:15'),
(6, 5, 600, 5000, '2018-10-21 06:26:33');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `State` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `State`) VALUES
(1, 'Andaman and Nicobar Island (UT)'),
(2, 'Andhra Pradesh'),
(3, 'Arunachal Pradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chandigarh (UT)'),
(7, 'Chhattisgarh'),
(8, 'Dadra and Nagar Haveli (UT)'),
(9, 'Daman and Diu (UT)'),
(10, 'Delhi (NCT)'),
(11, 'Goa'),
(12, 'Gujarat'),
(13, 'Haryana'),
(14, 'Himachal Pradesh'),
(15, 'Jammu and Kashmir'),
(16, 'Jharkhand'),
(17, 'Karnataka'),
(18, 'Kerala'),
(19, 'Lakshadweep (UT)'),
(20, 'Madhya Pradesh'),
(21, 'Maharashtra'),
(22, 'Manipur'),
(23, 'Meghalaya'),
(24, 'Mizoram'),
(25, 'Nagaland'),
(26, 'Odisha'),
(27, 'Puducherry (UT)'),
(28, 'Punjab'),
(29, 'Rajastha'),
(30, 'Sikkim'),
(31, 'Tamil Nadu'),
(32, 'Telangana'),
(33, 'Tripura'),
(34, 'Uttarakhand'),
(35, 'Uttar Pradesh'),
(36, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userId`, `userEmail`, `loginTime`) VALUES
(16, 1, 'kishansh98@hotmail.com', '2018-11-15 05:05:38'),
(17, 2, 'test@gmail.com', '2018-11-15 05:36:26'),
(18, 1, 'kishansh98@hotmail.com', '2018-11-15 05:39:48'),
(19, 3, 'brinda@gmail.com', '2018-11-15 05:42:14'),
(20, 4, 'hash@gmail.com', '2018-11-15 05:46:25'),
(21, 5, 'santosh@gmail.com', '2018-11-15 05:55:48'),
(22, 4, 'test@gmail.com', '2018-11-15 06:05:38'),
(23, 4, 'test@gmail.com', '2018-11-15 06:08:41'),
(24, 4, 'test@gmail.com', '2018-11-15 13:03:33'),
(25, 4, 'test@gmail.com', '2018-11-15 13:08:29'),
(26, 4, 'test@gmail.com', '2018-11-15 13:14:07'),
(27, 4, 'test@gmail.com', '2018-11-15 13:39:59'),
(28, 4, 'test@gmail.com', '2018-11-15 14:10:43'),
(29, 4, 'test@gmail.com', '2018-11-16 10:21:09'),
(30, 4, 'test@gmail.com', '2018-11-19 05:44:27'),
(31, 4, 'test@gmail.com', '2018-11-19 05:52:55'),
(32, 6, 'bhoomi@gmail.com', '2018-11-19 07:24:36'),
(33, 4, 'test@gmail.com', '2018-11-19 07:33:48'),
(34, 2, 'test@gmail.com', '2018-11-19 07:36:26'),
(35, 2, 'test@gmail.com', '2018-11-19 07:37:32'),
(36, 3, 'kishansh98@hotmail.com', '2018-11-19 07:41:34');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `id` int(11) NOT NULL,
  `regNo` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contactNo` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(45) NOT NULL,
  `passUdateDate` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`id`, `regNo`, `firstName`, `middleName`, `lastName`, `dob`, `age`, `gender`, `contactNo`, `email`, `password`, `regDate`, `updationDate`, `passUdateDate`) VALUES
(4, '1js16ee008', 'Bhoomika', 'A', 'Nidtha', '1998-07-15', 20, 'Female', 7654345434, 'bhoomi@gmail.com', '123456', '2018-11-19 07:24:25', '', ''),
(1, '1js16is020', 'Brinda', 'N', 'Murthy', '1995-03-14', 23, 'Female', 7345765434, 'brinda@gmail.com', '123456', '2018-11-15 05:42:05', '', ''),
(3, '1js16is037', 'Kishan', 'R', 'Shetty', '2003-01-13', 15, 'Male', 7345765434, 'kishansh98@hotmail.com', '123456', '2018-11-15 05:04:04', '19-11-2018 01:11:41', ''),
(5, '1js16is001', 'Santosh', 'K', 'Naidu', '2003-01-20', 15, 'Male', 7345765434, 'santosh@gmail.com', '123456', '2018-11-15 05:55:09', '', ''),
(2, '1js16is035', 'Kiran', 'Subbu', 'Happy', '2000-01-18', 18, 'Male', 1111111111, 'test@gmail.com', '1234567', '2018-11-15 05:29:59', '19-11-2018 01:08:28', '15-11-2018 06:40:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
