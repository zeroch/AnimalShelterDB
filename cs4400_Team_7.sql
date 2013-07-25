-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 24, 2013 at 09:40 PM
-- Server version: 5.0.95
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cs4400_Team_7`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoptee`
--

CREATE TABLE IF NOT EXISTS `adoptee` (
  `name` varchar(60) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `DoB` date NOT NULL,
  `incoming` int(11) NOT NULL,
  `employer` varchar(60) NOT NULL,
  PRIMARY KEY  (`name`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adoptee`
--

INSERT INTO `adoptee` (`name`, `phone`, `address`, `DoB`, `incoming`, `employer`) VALUES
('Edward', '1120120416', '300 South Side Dr, Atlanta, GA 30332', '1990-06-22', 50000, 'AABBCC'),
('Erica', '2220121022', '222 North Side Dr, Atlanta, GA 30332', '1988-12-22', 70000, 'CC22EE'),
('Jeff', '9020130616', '150 South Side Dr, Atlanta, GA 30332', '1988-09-22', 60000, 'BBCC'),
('Robert', '3320130216', '150 North Side Dr, Atlanta, GA 30332', '1988-11-22', 60000, 'CCDDEE');

-- --------------------------------------------------------

--
-- Table structure for table `cat`
--

CREATE TABLE IF NOT EXISTS `cat` (
  `pet_id` int(11) NOT NULL,
  `shelter_name` varchar(60) NOT NULL,
  `breed` varchar(50) NOT NULL,
  PRIMARY KEY  (`pet_id`,`shelter_name`),
  KEY `shelter_name` (`shelter_name`),
  KEY `breed` (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cat`
--

INSERT INTO `cat` (`pet_id`, `shelter_name`, `breed`) VALUES
(1, 'aa', 'Aegean'),
(1, 'ABC', 'Bengal'),
(2, 'ABC', 'Chausie'),
(3, 'fff', 'Chausie'),
(1, 'ee', 'Javanese');

-- --------------------------------------------------------

--
-- Table structure for table `cat_breed`
--

CREATE TABLE IF NOT EXISTS `cat_breed` (
  `breed` varchar(50) NOT NULL,
  PRIMARY KEY  (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cat_breed`
--

INSERT INTO `cat_breed` (`breed`) VALUES
('Aegean'),
('Bengal'),
('Bombay'),
('Chausie'),
('Cymric'),
('Javanese'),
('x'),
('y'),
('z');

-- --------------------------------------------------------

--
-- Table structure for table `days_open`
--

CREATE TABLE IF NOT EXISTS `days_open` (
  `shelter_name` varchar(60) NOT NULL,
  `days` varchar(40) NOT NULL,
  PRIMARY KEY  (`shelter_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `days_open`
--

INSERT INTO `days_open` (`shelter_name`, `days`) VALUES
('aa', 'M, W, F '),
('ABC', 'M, T, F '),
('ada', 'W, R, F '),
('bb', 'W, R, F '),
('chen', 'M, R, F '),
('ee', 'T, R, F '),
('fff', 'T, W, F '),
('ze', 'M, W, F ');

-- --------------------------------------------------------

--
-- Table structure for table `dog`
--

CREATE TABLE IF NOT EXISTS `dog` (
  `pet_id` int(11) NOT NULL,
  `shelter_name` varchar(60) NOT NULL,
  `breed` varchar(50) NOT NULL,
  PRIMARY KEY  (`pet_id`,`shelter_name`),
  KEY `shelter_name` (`shelter_name`),
  KEY `breed` (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dog`
--

INSERT INTO `dog` (`pet_id`, `shelter_name`, `breed`) VALUES
(1, 'ada', 'Airedale Terrier'),
(2, 'ada', 'Airedale Terrier'),
(1, 'bb', 'Boerboel'),
(2, 'bb', 'Boerboel'),
(1, 'chen', 'Cairn Terrier'),
(1, 'ze', 'Cairn Terrier'),
(2, 'chen', 'Cairn Terrier'),
(2, 'ze', 'Cairn Terrier'),
(3, 'bb', 'Cairn Terrier'),
(1, 'fff', 'Chihuahua'),
(2, 'aa', 'Chihuahua'),
(2, 'fff', 'Chihuahua');

-- --------------------------------------------------------

--
-- Table structure for table `dog_breed`
--

CREATE TABLE IF NOT EXISTS `dog_breed` (
  `breed` varchar(50) NOT NULL,
  PRIMARY KEY  (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dog_breed`
--

INSERT INTO `dog_breed` (`breed`) VALUES
('a'),
('Airedale Terrier'),
('b'),
('Bichon Havanais'),
('Boerboel'),
('c'),
('Cairn Terrier'),
('Chihuahua');

-- --------------------------------------------------------

--
-- Table structure for table `Donates`
--

CREATE TABLE IF NOT EXISTS `Donates` (
  `name` varchar(60) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `d_date` date NOT NULL,
  PRIMARY KEY  (`name`,`phone`,`d_date`,`amount`,`s_name`),
  KEY `s_name` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Donates`
--

INSERT INTO `Donates` (`name`, `phone`, `s_name`, `amount`, `d_date`) VALUES
('Ze', '7708904567', 'aa', 1000.00, '2013-03-24'),
('Yang', '6788904567', 'ABC', 1000.00, '2012-03-24'),
('Wang', '1238904567', 'ada', 5000.00, '2012-10-24'),
('Ken', '6781234567', 'bb', 5000.00, '2012-05-24'),
('Jill', '6789874567', 'chen', 2000.00, '2013-07-24'),
('Frank', '4049874567', 'ee', 1500.00, '2012-12-24'),
('Eric', '4041234567', 'fff', 1500.00, '2012-11-22'),
('David', '4048904567', 'ze', 1800.00, '2013-01-22');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE IF NOT EXISTS `donor` (
  `name` varchar(60) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  PRIMARY KEY  (`name`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`name`, `phone`, `email`, `city`) VALUES
('David', '4048904567', 'dd@gatech.edu', 'Atlanta'),
('Eric', '4041234567', 'ee@gatech.edu', 'Atlanta'),
('Frank', '4049874567', 'ff@gatech.edu', 'Atlanta'),
('Jill', '6789874567', 'gg@gatech.edu', 'Atlanta'),
('Ken', '6781234567', 'hh@gatech.edu', 'Atlanta'),
('Wang', '1238904567', 'cc@gatech.edu', 'Atlanta'),
('Yang', '6788904567', 'bb@gatech.edu', 'Atlanta'),
('Ze', '7708904567', 'aa@gatech.edu', 'Atlanta');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `Enum` int(11) NOT NULL auto_increment,
  `dir_enum` int(11) default NULL,
  `shelter_name` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY  (`Enum`,`shelter_name`),
  KEY `employee_fk` (`shelter_name`),
  KEY `employee_fk_Enum` (`dir_enum`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=901235 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Enum`, `dir_enum`, `shelter_name`, `password`) VALUES
(1, NULL, 'chen', 'xyz'),
(2, NULL, 'ze', 'xy3z'),
(3, NULL, 'chen', 'xydfdz'),
(12345, 890123, 'fff', '123456'),
(123456, 123456, 'aa', '1234567'),
(123456, 123456, 'ada', '234567'),
(234567, 123456, 'aa', '2345678'),
(234567, 123456, 'ada', '345678'),
(345678, 123456, 'aa', '3456789'),
(345678, 345678, 'ABC', '3456789'),
(345678, 123456, 'ada', '456789'),
(345678, 345678, 'bb', '456789'),
(456789, 345678, 'ABC', '4567890'),
(456789, 345678, 'bb', '567890'),
(567890, 345678, 'ABC', '5678901'),
(567890, 345678, 'bb', '678901'),
(567890, 567890, 'chen', '678901'),
(678901, 345678, 'ABC', '6789012'),
(678901, 567890, 'chen', '789012'),
(678901, 678901, 'ee', '789012'),
(789012, 678901, 'ee', '890123'),
(890123, 678901, 'ee', '901234'),
(890123, 890123, 'fff', '901234'),
(901234, 890123, 'fff', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `s_name` varchar(60) NOT NULL,
  `e_date` date NOT NULL,
  `location` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `type` enum('Fundraising','Adoption') NOT NULL,
  PRIMARY KEY  (`location`,`e_date`),
  KEY `event_FK` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`s_name`, `e_date`, `location`, `description`, `type`) VALUES
('ABC', '2013-07-16', '109 South side Dr, Duluth, GA 30332', 'Buckhead Junior Leaders sponsored event at Buckhead Diner', 'Adoption'),
('aa', '2012-07-24', '115 cove creek Dr, Norcross, GA 30318', 'AB Junior Leaders sponsored event at Buckhead Diner', 'Fundraising'),
('aa', '2013-06-24', '115 South side Dr, Duluth, GA 30332', 'ABC Junior Leaders sponsored event at Buckhead Diner', 'Adoption'),
('fff', '2013-02-16', '12 North Side Dr, Atlanta, GA 30332', 'AAS  sponsored event at Turner Field', 'Fundraising'),
('ee', '2012-03-16', '12 river Side Dr, Atlanta, GA 30380', 'Northview Junior Leaders sponsored event at Buckhead Diner', 'Fundraising'),
('ee', '2012-09-24', '1200 oak creek Dr, Atlanta, GA 30180', 'Johns creek Leaders sponsored event at Johns creek Diner', 'Fundraising'),
('ABC', '2013-03-16', '18 South view Dr, Duluth, GA 30332', 'All  sponsored event at Turner Field', 'Fundraising'),
('ze', '2012-07-24', '250 North Ave, Atlanta, GA 30332', 'RR  sponsored event at Square Field', 'Adoption'),
('ze', '2013-04-24', '250 North Side Dr, Atlanta, GA 30332', 'ABC  sponsored event at Turner Field', 'Adoption'),
('ze', '2013-01-21', '29 kingsley Ave, Atlanta, GA 30302', 'CC  sponsored event at Square Field', 'Fundraising'),
('bb', '2012-09-16', '300 cove Dr, Atlanta, GA 30302', ' SDH Junior Leaders sponsored event at Buckhead Diner', 'Fundraising'),
('bb', '2013-05-16', '300 cove Dr, Atlanta, GA 30302', ' SDH Junior Leaders sponsored event at Buckhead Diner', 'Adoption'),
('fff', '2012-12-16', '300 North Side Dr, Atlanta, GA 30332', 'AJC  sponsored event at Turner Field', 'Adoption'),
('ee', '2013-04-16', '300 North Side Dr, Atlanta, GA 30332', 'AJC  sponsored event at Turner Field', 'Adoption'),
('ABC', '2012-10-16', '300 South view Dr, Duluth, GA 30332', 'ACJ  sponsored event at Turner Field', 'Adoption'),
('ee', '2013-03-16', '73 northriver Side Dr, Atlanta, GA 30380', 'Buckhead Junior Leaders sponsored event at Buckhead Diner', 'Adoption'),
('chen', '2013-07-23', 'in my home ', 'dfdf', 'Fundraising');

-- --------------------------------------------------------

--
-- Table structure for table `fosterer`
--

CREATE TABLE IF NOT EXISTS `fosterer` (
  `name` varchar(60) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY  (`name`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fosterer`
--

INSERT INTO `fosterer` (`name`, `phone`, `address`) VALUES
('Amy', '1234567890', '23 Atlanta St, Atlanta GA 30332'),
('David', '2141234567', '23 Marietta St, Atlanta GA 30332'),
('Harry', '3147483647', '14 Atlanta St, Atlanta GA 30399'),
('Jay', '7707483689', '14 oak St, Atlanta GA 30399'),
('Jerry', '6787088647', '14 hillcreek St, Atlanta GA 30399'),
('Johnny', '7708906669', '64 Marietta St, Atlanta GA 30332');

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE IF NOT EXISTS `pet` (
  `pet_id` int(11) NOT NULL auto_increment,
  `shelter_name` varchar(60) NOT NULL,
  `pet_name` varchar(60) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `age` int(11) NOT NULL,
  `assign_date` date default NULL,
  `a_name` varchar(60) default NULL,
  `a_phone` varchar(11) default NULL,
  `a_date` date default NULL,
  `f_name` varchar(60) default NULL,
  `f_phone` varchar(11) default NULL,
  `f_date` date default NULL,
  `pet_type` enum('cat','dog') NOT NULL,
  `cat_breed` varchar(50) default NULL,
  `dog_breed` varchar(50) default NULL,
  PRIMARY KEY  (`pet_id`,`shelter_name`),
  KEY `pet_fk` (`shelter_name`),
  KEY `a_name` (`a_name`,`a_phone`),
  KEY `f_name` (`f_name`,`f_phone`),
  KEY `cat_breed` (`cat_breed`),
  KEY `dog_breed` (`dog_breed`),
  KEY `f_name_2` (`f_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`pet_id`, `shelter_name`, `pet_name`, `gender`, `age`, `assign_date`, `a_name`, `a_phone`, `a_date`, `f_name`, `f_phone`, `f_date`, `pet_type`, `cat_breed`, `dog_breed`) VALUES
(1, 'aa', 'Yuanshuo', '', 2, '2012-10-16', NULL, NULL, NULL, '0', NULL, NULL, 'cat', 'Aegean', NULL),
(1, 'ABC', 'oppo', 'male', 2, '2012-11-17', 'Edward', '1120120416', '2012-04-16', NULL, NULL, NULL, 'cat', 'Bengal', NULL),
(1, 'ada', 'pii', '', 2, '2011-12-07', 'Jeff', '9020130616', '2013-07-24', NULL, NULL, NULL, 'dog', NULL, 'Airedale Terrier'),
(1, 'bb', 'emily', '', 3, '2012-06-07', NULL, NULL, NULL, NULL, NULL, NULL, 'dog', NULL, 'Boerboel'),
(1, 'chen', 'mei', '', 3, '2011-12-07', NULL, NULL, NULL, 'Amy', '1234567890', '2013-07-24', 'dog', NULL, 'Cairn Terrier'),
(1, 'ee', 'pie', 'male', 2, '2012-11-17', 'Robert', '3320130216', '2013-02-16', NULL, NULL, NULL, 'cat', 'Javanese', NULL),
(1, 'fff', 'pie', 'male', 3, '2012-10-07', NULL, NULL, NULL, 'Harry', '3147483647', '2013-03-27', 'dog', NULL, 'Chihuahua'),
(1, 'ze', 'fireball', '', 3, '2011-03-07', NULL, NULL, NULL, 'Johnny', '7708906669', '2013-05-17', 'dog', NULL, 'Cairn Terrier'),
(2, 'aa', 'mi', 'male', 2, '2012-10-16', NULL, NULL, NULL, NULL, NULL, NULL, 'dog', NULL, 'Chihuahua'),
(2, 'ABC', 'opii', '', 2, '2012-12-27', 'Erica', '2220121022', '2012-10-22', NULL, NULL, NULL, 'cat', 'Chausie', NULL),
(2, 'ada', 'iii', '', 2, '2012-02-07', NULL, NULL, NULL, NULL, NULL, NULL, 'dog', NULL, 'Airedale Terrier'),
(2, 'bb', 'Frank', '', 3, '2012-06-07', NULL, NULL, NULL, NULL, NULL, NULL, 'dog', NULL, 'Boerboel'),
(2, 'chen', 'snowball', '', 3, '2011-12-07', NULL, NULL, NULL, 'David', '2141234567', '2013-07-24', 'dog', NULL, 'Cairn Terrier'),
(2, 'fff', 'pen', 'male', 3, '2011-10-07', NULL, NULL, NULL, 'Jay', '7707483689', '2013-03-24', 'dog', NULL, 'Chihuahua'),
(2, 'ze', 'ball', '', 3, '2011-03-07', NULL, NULL, NULL, NULL, NULL, NULL, 'dog', NULL, 'Cairn Terrier'),
(3, 'aa', 'oo', 'male', 2, '2013-01-04', NULL, NULL, NULL, 'Amy', '1234567890', '2013-07-11', 'dog', NULL, 'Chihuahua'),
(3, 'bb', 'Jeff', '', 3, '2011-12-07', NULL, NULL, NULL, NULL, NULL, NULL, 'dog', NULL, 'Cairn Terrier'),
(3, 'fff', 'Hong', '', 3, '2012-09-07', NULL, NULL, NULL, 'Jerry', '6787088647', '2013-03-04', 'cat', 'Chausie', NULL),
(4, 'chen', 'chen', 'male', 2, '2013-07-24', NULL, NULL, NULL, NULL, NULL, NULL, 'cat', 'Bombay', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shelter`
--

CREATE TABLE IF NOT EXISTS `shelter` (
  `name` varchar(60) NOT NULL,
  `phone` char(11) NOT NULL,
  `st_city_state` varchar(100) NOT NULL,
  `zipcode` int(6) NOT NULL,
  `Hours_open` varchar(60) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shelter`
--

INSERT INTO `shelter` (`name`, `phone`, `st_city_state`, `zipcode`, `Hours_open`) VALUES
('aa', '6781234567', 'abdkfjldkf', 30339, '10am – 4pm'),
('ABC', '7701234567', '111 Broad St, Atlanta, GA 30332', 30080, '9am – 4pm'),
('ada', '2147483647', 'abdkfjldkf', 30339, '10am – 5pm'),
('bb', '3053102030', 'abdkfjldkf', 30339, '11am – 5pm'),
('chen', '3053233200', '2111 NE 208 ST', 33179, '10am – 4pm'),
('ee', '1121474836', '75 Marietta St, Atlanta GA 30332', 30090, '9am – 4pm'),
('fff', '4041234567', '25 Marietta St, Atlanta GA 30332', 30091, '10am – 3pm'),
('ze', '3053310000', '3235 post woods dr', 30339, '10am – 5pm');

-- --------------------------------------------------------

--
-- Stand-in structure for view `s_e0`
--
CREATE TABLE IF NOT EXISTS `s_e0` (
`sname` varchar(60)
,`No_E` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `s_name0`
--
CREATE TABLE IF NOT EXISTS `s_name0` (
`name` varchar(60)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `t_ad0`
--
CREATE TABLE IF NOT EXISTS `t_ad0` (
`sssname` varchar(60)
,`T_ad` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `t_d0`
--
CREATE TABLE IF NOT EXISTS `t_d0` (
`ssname` varchar(60)
,`T_Do` decimal(32,2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `t_re0`
--
CREATE TABLE IF NOT EXISTS `t_re0` (
`ssssname` varchar(60)
,`T_red` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v10`
--
CREATE TABLE IF NOT EXISTS `v10` (
`name` varchar(60)
,`No_E` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v20`
--
CREATE TABLE IF NOT EXISTS `v20` (
`name` varchar(60)
,`No_E` bigint(21)
,`T_ad` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v30`
--
CREATE TABLE IF NOT EXISTS `v30` (
`name` varchar(60)
,`No_E` bigint(21)
,`T_ad` bigint(21)
,`T_Do` decimal(32,2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v40`
--
CREATE TABLE IF NOT EXISTS `v40` (
`name` varchar(60)
,`No_E` bigint(21)
,`T_ad` bigint(21)
,`T_Do` decimal(32,2)
,`T_red` bigint(21)
);
-- --------------------------------------------------------

--
-- Structure for view `s_e0`
--
DROP TABLE IF EXISTS `s_e0`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_7'@'localhost' for table 's_e0')

-- --------------------------------------------------------

--
-- Structure for view `s_name0`
--
DROP TABLE IF EXISTS `s_name0`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_7'@'localhost' for table 's_name0')

-- --------------------------------------------------------

--
-- Structure for view `t_ad0`
--
DROP TABLE IF EXISTS `t_ad0`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_7'@'localhost' for table 't_ad0')

-- --------------------------------------------------------

--
-- Structure for view `t_d0`
--
DROP TABLE IF EXISTS `t_d0`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_7'@'localhost' for table 't_d0')

-- --------------------------------------------------------

--
-- Structure for view `t_re0`
--
DROP TABLE IF EXISTS `t_re0`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_7'@'localhost' for table 't_re0')

-- --------------------------------------------------------

--
-- Structure for view `v10`
--
DROP TABLE IF EXISTS `v10`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_7'@'localhost' for table 'v10')

-- --------------------------------------------------------

--
-- Structure for view `v20`
--
DROP TABLE IF EXISTS `v20`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_7'@'localhost' for table 'v20')

-- --------------------------------------------------------

--
-- Structure for view `v30`
--
DROP TABLE IF EXISTS `v30`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_7'@'localhost' for table 'v30')

-- --------------------------------------------------------

--
-- Structure for view `v40`
--
DROP TABLE IF EXISTS `v40`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_7'@'localhost' for table 'v40')

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cat`
--
ALTER TABLE `cat`
  ADD CONSTRAINT `cat_fk` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`),
  ADD CONSTRAINT `cat_ibfk_1` FOREIGN KEY (`shelter_name`) REFERENCES `pet` (`shelter_name`),
  ADD CONSTRAINT `cat_ibfk_2` FOREIGN KEY (`breed`) REFERENCES `cat_breed` (`breed`);

--
-- Constraints for table `days_open`
--
ALTER TABLE `days_open`
  ADD CONSTRAINT `fk` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`);

--
-- Constraints for table `dog`
--
ALTER TABLE `dog`
  ADD CONSTRAINT `dog_fk` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`),
  ADD CONSTRAINT `dog_ibfk_1` FOREIGN KEY (`shelter_name`) REFERENCES `pet` (`shelter_name`),
  ADD CONSTRAINT `dog_ibfk_2` FOREIGN KEY (`breed`) REFERENCES `dog_breed` (`breed`);

--
-- Constraints for table `Donates`
--
ALTER TABLE `Donates`
  ADD CONSTRAINT `Donates_fk` FOREIGN KEY (`name`, `phone`) REFERENCES `donor` (`name`, `phone`),
  ADD CONSTRAINT `donates_ibfk_1` FOREIGN KEY (`s_name`) REFERENCES `shelter` (`name`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_fk` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`),
  ADD CONSTRAINT `employee_fk_Enum` FOREIGN KEY (`dir_enum`) REFERENCES `employee` (`Enum`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_FK` FOREIGN KEY (`s_name`) REFERENCES `shelter` (`name`);

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `pet_fk` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`),
  ADD CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`a_name`, `a_phone`) REFERENCES `adoptee` (`name`, `phone`),
  ADD CONSTRAINT `pet_ibfk_2` FOREIGN KEY (`f_name`, `f_phone`) REFERENCES `fosterer` (`name`, `phone`),
  ADD CONSTRAINT `pet_ibfk_3` FOREIGN KEY (`cat_breed`) REFERENCES `cat_breed` (`breed`),
  ADD CONSTRAINT `pet_ibfk_4` FOREIGN KEY (`dog_breed`) REFERENCES `dog_breed` (`breed`);
