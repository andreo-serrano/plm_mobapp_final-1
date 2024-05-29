-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for plmcrsdb
CREATE DATABASE IF NOT EXISTS `plmcrsdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci */;
USE `plmcrsdb`;

-- Dumping structure for table plmcrsdb.activities
CREATE TABLE IF NOT EXISTS `activities` (
  `activityid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity` varchar(80) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `setid` int(11) DEFAULT NULL,
  `setlabel` tinyint(1) DEFAULT NULL,
  `defaultactivity` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`activityid`)
) ENGINE=InnoDB AUTO_INCREMENT=4294967296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.activity_schedules
CREATE TABLE IF NOT EXISTS `activity_schedules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `aysem` smallint(5) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `last_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_activity_schedules_users` (`last_modified_by`),
  CONSTRAINT `FK_activity_schedules_users` FOREIGN KEY (`last_modified_by`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.activity_schedules_by_type
CREATE TABLE IF NOT EXISTS `activity_schedules_by_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `aysem` smallint(5) NOT NULL,
  `data_type` varchar(16) NOT NULL,
  `data_id` bigint(20) NOT NULL,
  `year_level` tinyint(1) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `last_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`activity_id`,`aysem`,`data_type`,`data_id`,`year_level`)
) ENGINE=InnoDB AUTO_INCREMENT=202399055 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.add_drop_late_payment
CREATE TABLE IF NOT EXISTS `add_drop_late_payment` (
  `assess_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL DEFAULT 0,
  `aysem` int(5) NOT NULL DEFAULT 0,
  `ornumber` varchar(16) NOT NULL,
  `datePaid` datetime DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amt_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `w_balance` tinyint(1) NOT NULL DEFAULT 0,
  `balance_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `assess_on` datetime DEFAULT current_timestamp(),
  `assess_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`assess_id`),
  UNIQUE KEY `UNIQUE_OR` (`ornumber`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.add_drop_late_payment_fee
CREATE TABLE IF NOT EXISTS `add_drop_late_payment_fee` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `assess_id` int(11) unsigned NOT NULL,
  `feeCode` varchar(20) DEFAULT NULL,
  `feeAmount` decimal(10,2) DEFAULT 0.00,
  `updateBy` varchar(20) DEFAULT NULL,
  `updateOn` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessID_studentid_feeCode` (`assess_id`,`feeCode`),
  CONSTRAINT `FK_add_drop_late_payment_fee_add_drop_late_payment` FOREIGN KEY (`assess_id`) REFERENCES `add_drop_late_payment` (`assess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.allfees
CREATE TABLE IF NOT EXISTS `allfees` (
  `feecode` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `amount` float NOT NULL DEFAULT 0,
  `difference` float NOT NULL DEFAULT 0,
  `feetype` varchar(2) NOT NULL DEFAULT '',
  `amountPTNPP` float(10,2) NOT NULL DEFAULT 0.00,
  `amountPTPay` float(10,2) NOT NULL DEFAULT 0.00,
  `feeorder` int(5) NOT NULL DEFAULT 0,
  `clPartial` float(10,2) NOT NULL DEFAULT 0.00,
  `clPaying` float(10,2) NOT NULL DEFAULT 0.00,
  `med123` float(10,2) NOT NULL DEFAULT 0.00,
  `med4` float(10,2) NOT NULL DEFAULT 0.00,
  `flag_include` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`feecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.allfeesbeforecm
CREATE TABLE IF NOT EXISTS `allfeesbeforecm` (
  `feecode` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `amount` float NOT NULL DEFAULT 0,
  `difference` float NOT NULL DEFAULT 0,
  `feetype` char(2) NOT NULL DEFAULT '',
  `amountPTNPP` float(10,2) NOT NULL DEFAULT 0.00,
  `amountPTPay` float(10,2) NOT NULL DEFAULT 0.00,
  `feeorder` int(5) NOT NULL DEFAULT 0,
  `amountCLPartial` float(10,2) NOT NULL DEFAULT 0.00,
  `amountCLPaying` float(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`feecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.app_visitors
CREATE TABLE IF NOT EXISTS `app_visitors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `login` datetime NOT NULL DEFAULT current_timestamp(),
  `logout` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.assessment
CREATE TABLE IF NOT EXISTS `assessment` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `aysem` int(11) NOT NULL DEFAULT 0,
  `tuition` decimal(10,0) NOT NULL DEFAULT 0,
  `miscellaneous` decimal(10,0) DEFAULT NULL,
  `student_fund` decimal(10,0) DEFAULT NULL,
  `laboratory` decimal(10,0) DEFAULT NULL,
  `nstp` decimal(10,0) DEFAULT NULL,
  `entrance_deposit` decimal(10,0) DEFAULT NULL,
  `id` decimal(10,0) DEFAULT NULL,
  `fine` decimal(10,0) DEFAULT NULL,
  `edf` decimal(10,0) DEFAULT NULL,
  `differential` decimal(10,0) DEFAULT NULL,
  `total_units` decimal(10,0) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `paid` smallint(4) DEFAULT NULL,
  `total_paid` decimal(10,0) DEFAULT NULL,
  `with_balance` smallint(4) DEFAULT NULL,
  `total_balance` decimal(10,0) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  `stfapx` varchar(1) DEFAULT 'B',
  `edf_foreign` decimal(10,0) DEFAULT NULL,
  `foreign_notation` varchar(10) DEFAULT 'USD',
  `peso_conversion` decimal(10,0) DEFAULT NULL,
  `paid_foreign` tinyint(1) DEFAULT NULL,
  `edfforeign` decimal(10,0) DEFAULT NULL,
  `edfnotation` varchar(10) DEFAULT NULL,
  `changeamt` decimal(10,0) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `differential2` decimal(10,0) DEFAULT NULL,
  `remarks2` text DEFAULT NULL,
  `manualupby` int(11) DEFAULT NULL,
  `manualupon` datetime DEFAULT NULL,
  `stfap` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.assessment_stud
CREATE TABLE IF NOT EXISTS `assessment_stud` (
  `assess_id` varchar(20) NOT NULL DEFAULT '0',
  `studentid` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `datePaid` datetime DEFAULT NULL,
  `ornumber` varchar(16) DEFAULT NULL,
  `aysem` int(5) NOT NULL DEFAULT 0,
  `amt_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `w_balance` tinyint(1) DEFAULT 0,
  `balance_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `assess_by` int(11) DEFAULT NULL,
  `assess_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `total_units` float(10,2) DEFAULT 0.00,
  `type_payment` tinyint(6) DEFAULT NULL,
  `chk_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `assess_amt` decimal(10,2) DEFAULT NULL,
  `subsidy` decimal(10,2) DEFAULT NULL,
  `tuitionFee` decimal(10,2) DEFAULT NULL,
  `miscFee` decimal(10,2) DEFAULT NULL,
  `labFee` decimal(10,2) DEFAULT 0.00,
  `otherFee` decimal(10,2) DEFAULT NULL,
  `withFee` int(1) DEFAULT 0,
  `tuition_fee_assistance` tinyint(3) unsigned DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.assess_studfee
CREATE TABLE IF NOT EXISTS `assess_studfee` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `assessID` varchar(20) DEFAULT NULL,
  `studentid` int(9) DEFAULT NULL,
  `feeCode` varchar(20) DEFAULT NULL,
  `feeAmount` decimal(10,2) DEFAULT 0.00,
  `aysem` int(5) DEFAULT NULL,
  `paid` int(2) DEFAULT 0,
  `active` int(2) DEFAULT 1,
  `updateBy` varchar(20) DEFAULT NULL,
  `updateOn` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessID_studentid_feeCode` (`assessID`,`studentid`,`feeCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3754138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.ass_studfee
CREATE TABLE IF NOT EXISTS `ass_studfee` (
  `assess_id` varchar(20) NOT NULL DEFAULT '',
  `studentid` int(11) NOT NULL DEFAULT 0,
  `feename` varchar(50) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `aysem` int(6) DEFAULT NULL,
  `fee_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`assess_id`,`studentid`,`feename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.ay
CREATE TABLE IF NOT EXISTS `ay` (
  `AY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACADYR` varchar(40) NOT NULL,
  PRIMARY KEY (`AY_ID`),
  UNIQUE KEY `acadyr` (`ACADYR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.blockclasses
CREATE TABLE IF NOT EXISTS `blockclasses` (
  `blockid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `rank` smallint(6) NOT NULL DEFAULT 1,
  `blockslots` smallint(6) NOT NULL DEFAULT 0,
  `enlisted` smallint(6) NOT NULL DEFAULT 0,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp NULL DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp NULL DEFAULT NULL,
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp NULL DEFAULT NULL,
  `linkedclassid` int(11) DEFAULT NULL,
  `blockclassdemand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.blockprograms
CREATE TABLE IF NOT EXISTS `blockprograms` (
  `blockid` int(11) NOT NULL DEFAULT 0,
  `programid` int(11) NOT NULL DEFAULT 0,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.blocks
CREATE TABLE IF NOT EXISTS `blocks` (
  `blockid` int(11) NOT NULL DEFAULT 0,
  `block` varchar(100) NOT NULL DEFAULT '',
  `unitid` int(11) DEFAULT NULL,
  `yearstanding` smallint(6) NOT NULL DEFAULT 1,
  `slots` smallint(6) NOT NULL DEFAULT 50,
  `enlisted` smallint(6) NOT NULL DEFAULT 0,
  `demand` smallint(6) NOT NULL DEFAULT 0,
  `template` tinyint(1) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `tableau` varchar(255) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `post` int(1) DEFAULT NULL,
  UNIQUE KEY `blockid` (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.buildings
CREATE TABLE IF NOT EXISTS `buildings` (
  `buildingid` int(11) NOT NULL AUTO_INCREMENT,
  `unitid` int(11) NOT NULL DEFAULT 0,
  `building` varchar(8) NOT NULL DEFAULT '',
  `buildingname` varchar(40) NOT NULL DEFAULT '',
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `mapoutline` text DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  PRIMARY KEY (`buildingid`),
  UNIQUE KEY `ak_buildings` (`unitid`,`building`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.calendar
CREATE TABLE IF NOT EXISTS `calendar` (
  `unitid` int(11) NOT NULL DEFAULT 0,
  `activitydate` datetime DEFAULT NULL,
  `activityupto` datetime DEFAULT '0000-00-00 00:00:00',
  `extendedto` datetime DEFAULT '0000-00-00 00:00:00',
  `activityid` int(11) NOT NULL DEFAULT 0,
  `foraysem` smallint(6) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT '0000-00-00 00:00:00',
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT '0000-00-00 00:00:00',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT '0000-00-00 00:00:00',
  `order_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.cancelled_grad_or
CREATE TABLE IF NOT EXISTS `cancelled_grad_or` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL DEFAULT 0,
  `aysem` int(5) NOT NULL DEFAULT 0,
  `ornumber` varchar(16) DEFAULT NULL,
  `datePaid` datetime DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amt_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `w_balance` tinyint(1) NOT NULL DEFAULT 0,
  `balance_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `type_payment` tinyint(6) DEFAULT NULL,
  `chk_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `dFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `torFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `etFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `aFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dsFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `assess_on` datetime DEFAULT current_timestamp(),
  `assess_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `inserted_on` datetime DEFAULT current_timestamp(),
  `insertedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_OR` (`ornumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.cancelled_or
CREATE TABLE IF NOT EXISTS `cancelled_or` (
  `assess_id` varchar(20) NOT NULL DEFAULT '0',
  `studentid` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `datePaid` datetime DEFAULT current_timestamp(),
  `ornumber` varchar(16) DEFAULT NULL,
  `aysem` smallint(6) NOT NULL DEFAULT 0,
  `amt_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `w_balance` tinyint(1) DEFAULT 0,
  `balance_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `assess_by` int(11) DEFAULT NULL,
  `assess_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `total_units` float(10,2) DEFAULT 0.00,
  `type_payment` tinyint(1) DEFAULT NULL,
  `chk_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `assess_amt` double DEFAULT NULL,
  `subsidy` decimal(10,2) DEFAULT NULL,
  `tuitionFee` decimal(10,2) DEFAULT NULL,
  `miscFee` decimal(10,2) DEFAULT NULL,
  `labFee` decimal(10,2) DEFAULT NULL,
  `otherFee` decimal(10,2) DEFAULT NULL,
  KEY `date` (`datePaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) NOT NULL DEFAULT '',
  `label` char(1) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `provinceid` int(11) NOT NULL DEFAULT 0,
  `city` varchar(40) NOT NULL DEFAULT '',
  `capital` tinyint(1) DEFAULT 0,
  `cityhooddate` date DEFAULT NULL,
  `mapoutline` text DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`cityid`),
  UNIQUE KEY `provinceid` (`provinceid`,`city`)
) ENGINE=InnoDB AUTO_INCREMENT=3946 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.class
CREATE TABLE IF NOT EXISTS `class` (
  `CLASS_ID` int(11) NOT NULL,
  `CLASS_CODE` varchar(30) NOT NULL,
  `SUBJ_ID` int(11) NOT NULL,
  `INST_ID` int(11) NOT NULL,
  `SYID` int(11) NOT NULL,
  `AY` varchar(11) NOT NULL,
  `DAY` varchar(20) NOT NULL,
  `C_TIME` varchar(11) NOT NULL,
  `IDNO` int(11) NOT NULL,
  `ROOM` varchar(30) NOT NULL DEFAULT 'NONE',
  `SECTION` varchar(30) NOT NULL DEFAULT 'NONE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.classblock
CREATE TABLE IF NOT EXISTS `classblock` (
  `CLASSID` int(11) DEFAULT NULL,
  `RESTRICTION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.classes
CREATE TABLE IF NOT EXISTS `classes` (
  `classid` int(11) NOT NULL DEFAULT 0,
  `class` varchar(40) DEFAULT NULL,
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `sectionid` int(11) DEFAULT NULL,
  `topic` varchar(80) DEFAULT NULL,
  `linkedclassid` int(11) DEFAULT NULL,
  `linktype` char(1) DEFAULT NULL,
  `credits` double NOT NULL DEFAULT 3,
  `displayedcredits` varchar(5) DEFAULT NULL,
  `slots` smallint(6) NOT NULL DEFAULT 30,
  `unitid` int(11) NOT NULL DEFAULT 0,
  `schedule` varchar(500) DEFAULT NULL,
  `restrictionsx` varchar(160) DEFAULT NULL,
  `minyearlevel` char(1) NOT NULL DEFAULT '1',
  `freeforalllater` tinyint(1) NOT NULL DEFAULT 0,
  `language` char(1) DEFAULT NULL,
  `instructors2` varchar(60) DEFAULT NULL,
  `concealinstructors` tinyint(1) NOT NULL DEFAULT 0,
  `issueclasscards` tinyint(1) NOT NULL DEFAULT 1,
  `enlisted` smallint(6) NOT NULL DEFAULT 0,
  `demand` smallint(6) NOT NULL DEFAULT 0,
  `freshmendemand` smallint(6) NOT NULL DEFAULT 0,
  `syllabus` varchar(255) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `gradessubmittedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE current_timestamp(6),
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `restrictions2` int(11) DEFAULT NULL,
  `restrictions` varchar(255) DEFAULT NULL,
  `Column 48` varchar(6) DEFAULT '',
  `instructors` varchar(500) DEFAULT NULL,
  `oldinst` tinyint(1) NOT NULL DEFAULT 0,
  `actualcredits` double NOT NULL DEFAULT 0,
  `newclassid` int(11) DEFAULT NULL,
  `instructors3` varchar(1000) DEFAULT NULL,
  `labcreditsforpt` varchar(5) DEFAULT NULL,
  `petclass` tinyint(4) DEFAULT 0,
  `forgrad` int(1) DEFAULT 0,
  `smallclass` int(1) DEFAULT 0,
  `office365_group_id` char(36) DEFAULT NULL,
  `owners` text DEFAULT NULL,
  `teams_assigned_email_id` int(11) DEFAULT NULL,
  `sync_async` varchar(5) DEFAULT '',
  `sync_mode` varchar(6) DEFAULT '',
  `add1` varchar(50) DEFAULT '',
  PRIMARY KEY (`classid`),
  KEY `linkedclassid` (`linkedclassid`),
  FULLTEXT KEY `FT_INSTRUCTORS` (`instructors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.classhours
CREATE TABLE IF NOT EXISTS `classhours` (
  `classid` int(11) NOT NULL DEFAULT 0,
  `day` smallint(6) NOT NULL DEFAULT 0,
  `start` time DEFAULT NULL,
  `finish` time DEFAULT NULL,
  `meetingtype` char(3) NOT NULL DEFAULT '',
  `roomid` int(11) NOT NULL DEFAULT 0,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NULL DEFAULT NULL ON UPDATE current_timestamp(6),
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `event_id` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.classlists
CREATE TABLE IF NOT EXISTS `classlists` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `initialgrade` varchar(4) NOT NULL DEFAULT '',
  `tuitionpaid` decimal(10,0) NOT NULL DEFAULT 0,
  `remarks` varchar(254) DEFAULT '',
  `inserttype` char(1) NOT NULL DEFAULT 'A',
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NULL DEFAULT NULL ON UPDATE current_timestamp(6),
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `pet` tinyint(1) NOT NULL DEFAULT 0,
  `team_status` tinyint(4) NOT NULL DEFAULT 0,
  `withdrawn` tinyint(4) NOT NULL DEFAULT 0,
  `awol` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `UNIQUE_class_student` (`studentid`,`classid`),
  KEY `FK_classlists_classes` (`classid`),
  CONSTRAINT `FK_classlists_classes` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.cldeadline
CREATE TABLE IF NOT EXISTS `cldeadline` (
  `aysem` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.cog_purpose
CREATE TABLE IF NOT EXISTS `cog_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='purpose for the COG';

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.collecting_officer
CREATE TABLE IF NOT EXISTS `collecting_officer` (
  `Onumber` int(11) NOT NULL DEFAULT 0,
  `Oname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) DEFAULT NULL,
  `aysem` varchar(5) NOT NULL DEFAULT '0',
  `date_entered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_ended` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `encodedby` varchar(20) NOT NULL DEFAULT '',
  `date_encoded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Onumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `countryid` char(2) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `currencyid` char(3) DEFAULT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.course
CREATE TABLE IF NOT EXISTS `course` (
  `COURSE_ID` int(11) NOT NULL,
  `COURSE_NAME` varchar(30) NOT NULL,
  `COURSE_LEVEL` int(11) NOT NULL DEFAULT 1,
  `COURSE_MAJOR` varchar(30) NOT NULL DEFAULT 'None',
  `COURSE_DESC` varchar(255) NOT NULL,
  `DEPT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.courses
CREATE TABLE IF NOT EXISTS `courses` (
  `courseid` int(11) NOT NULL,
  `courseno` varchar(50) DEFAULT NULL,
  `coursetitle` varchar(120) DEFAULT NULL,
  `topicbased` tinyint(1) DEFAULT NULL,
  `credits2` smallint(6) DEFAULT NULL,
  `repeatableto` smallint(6) DEFAULT NULL,
  `lechours` double DEFAULT NULL,
  `labhours` double DEFAULT NULL,
  `lechourstype` char(1) DEFAULT NULL,
  `labhourstype` char(1) DEFAULT NULL,
  `coursecategoryid2` int(11) DEFAULT NULL,
  `degreelevel` char(1) DEFAULT NULL,
  `revisionyear` smallint(6) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `requisites` text DEFAULT NULL,
  `tts` text DEFAULT NULL,
  `ccc` int(11) DEFAULT NULL,
  `orderno` bigint(20) DEFAULT NULL,
  `inlcude` tinyint(1) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT NULL,
  `area` varchar(40) DEFAULT NULL,
  `credits` double DEFAULT NULL,
  `college` varchar(8) DEFAULT NULL,
  `hrs_wks_persem` smallint(6) DEFAULT NULL,
  `coursecategoryid` varchar(10) DEFAULT NULL,
  `chk` smallint(6) DEFAULT NULL,
  `wddropdown` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.cross_enrolled_subjects
CREATE TABLE IF NOT EXISTS `cross_enrolled_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) DEFAULT NULL,
  `subjectid` int(11) DEFAULT NULL,
  `finalgrade` float DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `completiongrade` varchar(50) DEFAULT NULL,
  `subjectcode` varchar(50) DEFAULT NULL,
  `aysem` int(11) DEFAULT NULL,
  `schoolid` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `currencyid` char(3) NOT NULL DEFAULT '',
  `exchangerate` decimal(10,0) NOT NULL DEFAULT 0,
  `pegdate` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  PRIMARY KEY (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.curricula
CREATE TABLE IF NOT EXISTS `curricula` (
  `curriculumid` int(11) NOT NULL DEFAULT 0,
  `programid` int(11) NOT NULL DEFAULT 0,
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `clusterid` int(11) NOT NULL DEFAULT 0,
  `credits` decimal(10,0) NOT NULL DEFAULT 0,
  `curriculumtype` char(1) NOT NULL DEFAULT '',
  `year` smallint(6) NOT NULL DEFAULT 0,
  `sem` smallint(6) NOT NULL DEFAULT 0,
  `row` smallint(6) NOT NULL DEFAULT 0,
  `remarks` varchar(254) NOT NULL DEFAULT '',
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.curriculum
CREATE TABLE IF NOT EXISTS `curriculum` (
  `ordernumber` int(7) DEFAULT NULL,
  `curriculumid` int(7) DEFAULT NULL,
  `programid` int(7) DEFAULT NULL,
  `subjectid` int(7) DEFAULT NULL,
  `revisionyear` int(4) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `sem` int(1) DEFAULT NULL,
  `prereq` int(10) DEFAULT NULL,
  `enteredby` int(10) DEFAULT NULL,
  `enteredon` datetime DEFAULT current_timestamp(),
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT current_timestamp(),
  `clusterid` int(3) DEFAULT NULL,
  `active` int(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.curriculum2016
CREATE TABLE IF NOT EXISTS `curriculum2016` (
  `ordernumber` int(7) DEFAULT NULL,
  `curriculumid` int(7) DEFAULT NULL,
  `programid` int(7) DEFAULT NULL,
  `subjectid` int(7) DEFAULT NULL,
  `revisionyear` int(4) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `sem` int(1) DEFAULT NULL,
  `prereq` int(10) DEFAULT NULL,
  `enteredby` int(10) DEFAULT NULL,
  `enteredon` datetime DEFAULT current_timestamp(),
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT current_timestamp(),
  `clusterid` int(3) DEFAULT NULL,
  `active` int(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.curriculumtypes
CREATE TABLE IF NOT EXISTS `curriculumtypes` (
  `curriculumtype` char(1) NOT NULL DEFAULT '',
  `label` varchar(20) NOT NULL DEFAULT '',
  `priority` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`curriculumtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.curriculum_2016
CREATE TABLE IF NOT EXISTS `curriculum_2016` (
  `ordernumber` int(7) DEFAULT NULL,
  `curriculumid` int(7) DEFAULT NULL,
  `programid` int(7) DEFAULT NULL,
  `subjectid` int(7) DEFAULT NULL,
  `revisionyear` int(4) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `sem` int(1) DEFAULT NULL,
  `prereq` int(10) DEFAULT NULL,
  `enteredby` int(10) DEFAULT NULL,
  `enteredon` datetime DEFAULT current_timestamp(),
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT current_timestamp(),
  `clusterid` int(3) DEFAULT NULL,
  `active` int(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.dean
CREATE TABLE IF NOT EXISTS `dean` (
  `deanid` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(30) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `middlename` varchar(30) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `unitid2` int(11) DEFAULT NULL,
  PRIMARY KEY (`deanid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.department
CREATE TABLE IF NOT EXISTS `department` (
  `DEPT_ID` int(11) NOT NULL,
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `DEPARTMENT_DESC` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.designation
CREATE TABLE IF NOT EXISTS `designation` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `eq_units` int(11) DEFAULT NULL,
  `plm_email_address` varchar(60) DEFAULT NULL,
  `plm_email_address_id` char(36) DEFAULT NULL,
  KEY `designation_id` (`designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `employeeid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `salutation` varchar(9) DEFAULT NULL,
  `lastname` varchar(30) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `middlename` varchar(30) DEFAULT NULL,
  `pedigree` varchar(4) DEFAULT NULL,
  `maidenname` varchar(30) DEFAULT NULL,
  `gender` varchar(1) NOT NULL DEFAULT '',
  `birthdate` date DEFAULT NULL,
  `birthplacecid` int(11) DEFAULT NULL,
  `civilstatus` char(1) DEFAULT NULL,
  `citizenshipcid` char(2) NOT NULL DEFAULT 'PH',
  `streetaddress` varchar(60) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `mobilephone` varchar(30) DEFAULT NULL,
  `pstreetaddress` varchar(60) DEFAULT NULL,
  `pcityid` int(11) DEFAULT NULL,
  `pzipcode` varchar(10) DEFAULT NULL,
  `pphone` varchar(30) DEFAULT NULL,
  `tin` varchar(20) DEFAULT NULL,
  `gsis` varchar(20) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `rank` int(2) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `ta_edit` int(1) DEFAULT 0,
  `plm_email_address` varchar(60) DEFAULT NULL,
  `plm_email_address_id` char(36) DEFAULT NULL,
  `empID_HRIS` int(10) DEFAULT NULL,
  `salary_grade` int(2) DEFAULT NULL,
  `rate_undergrad` float DEFAULT NULL,
  `rate_graduateSchool` float DEFAULT NULL,
  `rate_monthly` float DEFAULT NULL,
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2017369115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.enlistmentaudit
CREATE TABLE IF NOT EXISTS `enlistmentaudit` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `action` char(1) DEFAULT NULL,
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.enrolled
CREATE TABLE IF NOT EXISTS `enrolled` (
  `studentid` int(11) NOT NULL,
  `unitid` int(11) DEFAULT NULL,
  `applicantid` int(11) DEFAULT NULL,
  `plm_address_password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.enrollmentbuffer
CREATE TABLE IF NOT EXISTS `enrollmentbuffer` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `blockid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.eval_students
CREATE TABLE IF NOT EXISTS `eval_students` (
  `studentid` int(11) NOT NULL,
  `aysem` int(5) DEFAULT NULL,
  `fromdb` tinyint(4) DEFAULT NULL,
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `evaluated` int(11) DEFAULT NULL,
  `updatedon` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `loa` int(11) DEFAULT 0,
  UNIQUE KEY `studentid` (`studentid`,`aysem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.faculty_designation
CREATE TABLE IF NOT EXISTS `faculty_designation` (
  `faculty_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `schedule` varchar(150) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `aysem` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT current_timestamp(),
  `updatedBy` varchar(50) DEFAULT NULL,
  `active` int(1) DEFAULT 1,
  UNIQUE KEY `UQ_FACULTY_DESIGNATION` (`faculty_id`,`designation_id`,`aysem`,`unitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.faculty_type
CREATE TABLE IF NOT EXISTS `faculty_type` (
  `typeid` int(11) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.feeamount
CREATE TABLE IF NOT EXISTS `feeamount` (
  `feegroupid` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `yearlevel` varchar(5) NOT NULL DEFAULT '',
  `sem` char(3) NOT NULL DEFAULT '',
  `unitid` int(11) DEFAULT NULL,
  `programid` int(11) DEFAULT NULL,
  `subjectid` int(11) DEFAULT NULL,
  `scholasticstatus` char(3) NOT NULL DEFAULT '',
  `startaysem` varchar(5) NOT NULL DEFAULT '',
  `endaysem` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.feedetails
CREATE TABLE IF NOT EXISTS `feedetails` (
  `feeid` int(11) NOT NULL DEFAULT 0,
  `feeitemid` int(11) NOT NULL DEFAULT 0,
  `amountdue` decimal(10,0) NOT NULL DEFAULT 0,
  `sourcetable` varchar(40) NOT NULL DEFAULT '',
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  PRIMARY KEY (`feeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.feegroup
CREATE TABLE IF NOT EXISTS `feegroup` (
  `feegroupid` int(11) NOT NULL DEFAULT 0,
  `feeparentid` int(11) NOT NULL DEFAULT 0,
  `accountcode` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.feeitems
CREATE TABLE IF NOT EXISTS `feeitems` (
  `feeitemid` int(11) NOT NULL DEFAULT 0,
  `categoryid` varchar(20) NOT NULL DEFAULT '',
  `feeitem` varchar(50) NOT NULL DEFAULT '',
  `subitem` varchar(20) NOT NULL DEFAULT '',
  `currencyid` char(3) NOT NULL DEFAULT '',
  `sourcetable` varchar(40) NOT NULL DEFAULT '',
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.fees
CREATE TABLE IF NOT EXISTS `fees` (
  `feeid` int(11) NOT NULL AUTO_INCREMENT,
  `unitid` int(11) NOT NULL DEFAULT 0,
  `fee` varchar(50) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `instituteddate` date DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `updatefunction` varchar(64) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT NULL,
  `amountdue` decimal(10,0) DEFAULT NULL,
  `fixed` tinyint(1) DEFAULT NULL,
  `yearlevel` smallint(6) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `baseunit` int(11) DEFAULT NULL,
  `minaysem` int(11) DEFAULT NULL,
  `stfapbracket` char(2) DEFAULT NULL,
  PRIMARY KEY (`feeid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.feetypes
CREATE TABLE IF NOT EXISTS `feetypes` (
  `feegroupid` double DEFAULT NULL,
  `feeparentid` varchar(255) DEFAULT NULL,
  `accountcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.freshmen_course
CREATE TABLE IF NOT EXISTS `freshmen_course` (
  `studentid` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `date_entered` datetime DEFAULT current_timestamp(),
  `entered_by` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.gcash
CREATE TABLE IF NOT EXISTS `gcash` (
  `student_no` int(9) NOT NULL,
  `uploaded` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `UQ_student_no` (`student_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.gcash_osds
CREATE TABLE IF NOT EXISTS `gcash_osds` (
  `student_no` int(9) NOT NULL,
  `uploaded_count` tinyint(1) NOT NULL DEFAULT 0,
  `invalid` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`student_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `studentid` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for view plmcrsdb.get_undergrad
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_undergrad` (
	`studentid` INT(9) UNSIGNED NOT NULL,
	`name` VARCHAR(89) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`lastname` VARCHAR(30) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`firstname` VARCHAR(50) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`middlename` VARCHAR(30) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`pedigree` VARCHAR(4) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`programtitle` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_unicode_520_ci',
	`unitname` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_unicode_520_ci',
	`block` VARCHAR(100) NULL COLLATE 'utf8mb4_unicode_520_ci'
) ENGINE=MyISAM;

-- Dumping structure for table plmcrsdb.grades
CREATE TABLE IF NOT EXISTS `grades` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `credits` double DEFAULT NULL,
  `initialgrade` varchar(4) DEFAULT NULL,
  `finalgrade` varchar(6) DEFAULT NULL,
  `gradevalue` decimal(10,2) DEFAULT NULL,
  `finalizationtype` char(1) DEFAULT NULL,
  `finalizationdate` date DEFAULT NULL,
  `gradestatus` char(1) DEFAULT NULL,
  `intermediategrade` varchar(4) DEFAULT NULL,
  `intermediatetype` char(1) DEFAULT NULL,
  `intermediatedate` date DEFAULT NULL,
  `requisitestatus` char(1) NOT NULL DEFAULT 'I',
  `deficiencies` varchar(60) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `readonly` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(4) DEFAULT 0,
  `completiongrade` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`studentid`,`classid`),
  KEY `studentid` (`studentid`),
  KEY `classid` (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.gradesaudit
CREATE TABLE IF NOT EXISTS `gradesaudit` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `credits` double DEFAULT NULL,
  `initialgrade` varchar(4) DEFAULT NULL,
  `finalgrade` varchar(4) DEFAULT NULL,
  `intermediategrade` varchar(4) DEFAULT NULL,
  `changedby` int(11) DEFAULT NULL,
  `changedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `subjectid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.gradesunique
CREATE TABLE IF NOT EXISTS `gradesunique` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `credits` double DEFAULT NULL,
  `initialgrade` varchar(4) DEFAULT NULL,
  `finalgrade` varchar(4) DEFAULT NULL,
  `gradevalue` decimal(10,2) DEFAULT NULL,
  `finalizationtype` char(1) DEFAULT NULL,
  `finalizationdate` date DEFAULT NULL,
  `gradestatus` char(1) DEFAULT NULL,
  `intermediategrade` varchar(4) DEFAULT NULL,
  `intermediatetype` char(1) DEFAULT NULL,
  `intermediatedate` datetime DEFAULT NULL,
  `requisitestatus` char(1) NOT NULL DEFAULT 'I',
  `deficiencies` varchar(60) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `readonly` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(4) DEFAULT 0,
  `completiongrade` decimal(10,2) DEFAULT 0.00,
  `uniq` varchar(50) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.grades_bak2016201610151200
CREATE TABLE IF NOT EXISTS `grades_bak2016201610151200` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `credits` double DEFAULT NULL,
  `initialgrade` varchar(4) DEFAULT NULL,
  `finalgrade` varchar(4) DEFAULT NULL,
  `gradevalue` decimal(10,2) DEFAULT NULL,
  `finalizationtype` char(1) DEFAULT NULL,
  `finalizationdate` date DEFAULT NULL,
  `gradestatus` char(1) DEFAULT NULL,
  `intermediategrade` varchar(4) DEFAULT NULL,
  `intermediatetype` char(1) DEFAULT NULL,
  `intermediatedate` date DEFAULT NULL,
  `requisitestatus` char(1) NOT NULL DEFAULT 'I',
  `deficiencies` varchar(60) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `readonly` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(4) DEFAULT 0,
  `completiongrade` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.grades_duplicates
CREATE TABLE IF NOT EXISTS `grades_duplicates` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `credits` double DEFAULT NULL,
  `initialgrade` varchar(4) DEFAULT NULL,
  `finalgrade` varchar(4) DEFAULT NULL,
  `gradevalue` decimal(10,2) DEFAULT NULL,
  `finalizationtype` char(1) DEFAULT NULL,
  `finalizationdate` date DEFAULT NULL,
  `gradestatus` char(1) DEFAULT NULL,
  `intermediategrade` varchar(4) DEFAULT NULL,
  `intermediatetype` char(1) DEFAULT NULL,
  `intermediatedate` date DEFAULT NULL,
  `requisitestatus` char(1) NOT NULL DEFAULT 'I',
  `deficiencies` varchar(60) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `readonly` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(4) DEFAULT 0,
  `completiongrade` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.grades_savetemps
CREATE TABLE IF NOT EXISTS `grades_savetemps` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `credits` double DEFAULT NULL,
  `initialgrade` varchar(10) DEFAULT NULL,
  `finalgrade` varchar(10) DEFAULT NULL,
  `gradevalue` decimal(10,2) DEFAULT NULL,
  `finalizationtype` char(1) DEFAULT NULL,
  `finalizationdate` date DEFAULT NULL,
  `gradestatus` char(1) DEFAULT NULL,
  `intermediategrade` varchar(4) DEFAULT NULL,
  `intermediatetype` char(1) DEFAULT NULL,
  `intermediatedate` date DEFAULT NULL,
  `requisitestatus` char(1) NOT NULL DEFAULT 'I',
  `deficiencies` varchar(60) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `readonly` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.graduatingfees
CREATE TABLE IF NOT EXISTS `graduatingfees` (
  `feecode` varchar(50) DEFAULT NULL,
  `feename` varchar(50) DEFAULT NULL,
  `amount1` decimal(10,2) DEFAULT NULL,
  `amount2` decimal(10,2) DEFAULT NULL,
  `enteredby` int(8) DEFAULT NULL,
  `enteredon` timestamp NULL DEFAULT current_timestamp(),
  `forgradFee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.graduating_class
CREATE TABLE IF NOT EXISTS `graduating_class` (
  `studentid` int(11) DEFAULT NULL,
  `graduating` int(1) DEFAULT NULL,
  `aySem` int(2) DEFAULT NULL,
  `dateGenerated` datetime DEFAULT current_timestamp(),
  `generatedBy` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='list of graduating Students';

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.graduation_fees
CREATE TABLE IF NOT EXISTS `graduation_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `amount1` float(65,2) NOT NULL DEFAULT 0.00 COMMENT 'Amount for Undegrad NOT IN (CN, CPT, CET, CAUP)',
  `amount2` float(65,2) NOT NULL DEFAULT 0.00 COMMENT 'Amount for Undegrad IN (CN, CPT, CET, CAUP)',
  `amount3` float(65,2) NOT NULL DEFAULT 0.00 COMMENT 'Amount for GP',
  `aysem` int(5) NOT NULL DEFAULT 0,
  `active` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `aysem` (`aysem`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.graduation_payment
CREATE TABLE IF NOT EXISTS `graduation_payment` (
  `assess_id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL DEFAULT 0,
  `aysem` int(5) NOT NULL DEFAULT 0,
  `ornumber` varchar(16) NOT NULL,
  `datePaid` datetime DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amt_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `w_balance` tinyint(1) NOT NULL DEFAULT 0,
  `balance_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `type_payment` tinyint(6) DEFAULT NULL,
  `chk_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `dFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `torFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `etFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `aFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dsFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `assess_on` datetime DEFAULT current_timestamp(),
  `assess_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`assess_id`),
  UNIQUE KEY `UNIQUE_STUD` (`studentid`,`aysem`),
  UNIQUE KEY `UNIQUE_OR` (`ornumber`)
) ENGINE=InnoDB AUTO_INCREMENT=1973 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.gwa
CREATE TABLE IF NOT EXISTS `gwa` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `aysem` smallint(5) NOT NULL DEFAULT 0,
  `gwa` decimal(10,2) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`studentid`,`aysem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for view plmcrsdb.gwa_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `gwa_view` (
	`gwa` DOUBLE(19,2) NULL,
	`studentid` INT(11) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table plmcrsdb.g_graduating
CREATE TABLE IF NOT EXISTS `g_graduating` (
  `studentid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `aysem` char(5) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `unit` varchar(15) DEFAULT NULL,
  `program` varchar(15) DEFAULT NULL,
  `scholastic_status` varchar(15) DEFAULT 'PAYING',
  `evaluated` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.id_requirements
CREATE TABLE IF NOT EXISTS `id_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `file_prefix` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.institutions
CREATE TABLE IF NOT EXISTS `institutions` (
  `institutionid` int(11) DEFAULT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `institutiontype` char(1) DEFAULT NULL,
  `acronym` varchar(10) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `head` varchar(40) DEFAULT NULL,
  `registrar` varchar(40) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `streetaddress` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.instructor
CREATE TABLE IF NOT EXISTS `instructor` (
  `INST_ID` int(30) NOT NULL AUTO_INCREMENT,
  `INST_FULLNAME` varchar(255) NOT NULL,
  `INST_ADDRESS` varchar(255) NOT NULL,
  `INST_SEX` varchar(20) NOT NULL DEFAULT 'Male',
  `INST_STATUS` varchar(20) NOT NULL DEFAULT 'Single',
  `SPECIALIZATION` text NOT NULL,
  `INST_EMAIL` varchar(255) NOT NULL,
  `EMPLOYMENT_STATUS` varchar(40) NOT NULL DEFAULT 'Probationary',
  PRIMARY KEY (`INST_ID`),
  UNIQUE KEY `INST_EMAIL` (`INST_EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.jllclasses
CREATE TABLE IF NOT EXISTS `jllclasses` (
  `classid` int(11) NOT NULL DEFAULT 0,
  `class` varchar(40) DEFAULT NULL,
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `sectionid` int(11) DEFAULT NULL,
  `topic` varchar(80) DEFAULT NULL,
  `linkedclassid` int(11) DEFAULT NULL,
  `linktype` char(1) DEFAULT NULL,
  `credits` double NOT NULL DEFAULT 3,
  `displayedcredits` varchar(5) DEFAULT NULL,
  `slots` smallint(6) NOT NULL DEFAULT 30,
  `unitid` int(11) NOT NULL DEFAULT 0,
  `schedule` varchar(255) DEFAULT NULL,
  `restrictionsx` varchar(160) DEFAULT NULL,
  `minyearlevel` char(1) NOT NULL DEFAULT '1',
  `freeforalllater` tinyint(1) NOT NULL DEFAULT 0,
  `language` char(1) DEFAULT NULL,
  `instructors2` varchar(60) DEFAULT NULL,
  `concealinstructors` tinyint(1) NOT NULL DEFAULT 0,
  `issueclasscards` tinyint(1) NOT NULL DEFAULT 1,
  `enlisted` smallint(6) NOT NULL DEFAULT 0,
  `demand` smallint(6) NOT NULL DEFAULT 0,
  `freshmendemand` smallint(6) NOT NULL DEFAULT 0,
  `syllabus` varchar(255) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `gradessubmittedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE current_timestamp(6),
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `restrictions2` int(11) DEFAULT NULL,
  `restrictions` varchar(255) DEFAULT NULL,
  `instructors` varchar(250) DEFAULT NULL,
  `oldinst` tinyint(1) NOT NULL DEFAULT 0,
  `actualcredits` double NOT NULL DEFAULT 0,
  `newclassid` int(11) DEFAULT NULL,
  `instructors3` varchar(1000) DEFAULT NULL,
  `labcreditsforpt` varchar(5) DEFAULT NULL,
  `petclass` tinyint(4) DEFAULT 0,
  `forgrad` int(1) DEFAULT 0,
  `smallclass` int(1) DEFAULT 0,
  `office365_group_id` char(36) DEFAULT NULL,
  `owners` text DEFAULT NULL,
  `team_status` varchar(5) DEFAULT NULL,
  `channel_status` tinyint(1) DEFAULT 0,
  `hidden_in_outlook` tinyint(1) DEFAULT 0,
  `team_url` text DEFAULT NULL,
  PRIMARY KEY (`classid`),
  KEY `linkedclassid` (`linkedclassid`),
  FULLTEXT KEY `FT_INSTRUCTORS` (`instructors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.jllclasslists
CREATE TABLE IF NOT EXISTS `jllclasslists` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `initialgrade` varchar(4) NOT NULL DEFAULT '',
  `tuitionpaid` decimal(10,0) NOT NULL DEFAULT 0,
  `remarks` varchar(254) DEFAULT '',
  `inserttype` char(1) NOT NULL DEFAULT 'A',
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE current_timestamp(6),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `pet` tinyint(1) NOT NULL DEFAULT 0,
  `team_status` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `UNIQUE_class_student` (`studentid`,`classid`),
  KEY `FK_classlists_classes` (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.jllstudents
CREATE TABLE IF NOT EXISTS `jllstudents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(9) unsigned NOT NULL,
  `name` varchar(70) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(30) DEFAULT NULL,
  `pedigree` varchar(4) DEFAULT NULL,
  `maidenname` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `birthplacecid` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `civilstatus` char(10) DEFAULT NULL,
  `citizenshipcid` char(2) DEFAULT 'PH',
  `residentalien` date DEFAULT NULL,
  `religionid` int(11) unsigned DEFAULT NULL,
  `mobilephone` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `entryaysem` smallint(6) unsigned DEFAULT NULL,
  `recordstatus` char(1) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT current_timestamp(),
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp NULL DEFAULT current_timestamp(),
  `validatedby` int(11) unsigned DEFAULT NULL,
  `validatedon` datetime DEFAULT current_timestamp(),
  `birthplacecity` varchar(50) DEFAULT NULL,
  `isstudent` tinyint(1) unsigned DEFAULT NULL,
  `dategraduated` datetime DEFAULT NULL,
  `clearancedate` datetime DEFAULT NULL,
  `admissionreq` text DEFAULT NULL,
  `employeedependentid` int(11) unsigned DEFAULT NULL,
  `employeedependentunitid` int(11) unsigned DEFAULT NULL,
  `religion` varchar(75) DEFAULT NULL,
  `birth_place` varchar(150) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `complexion` varchar(10) DEFAULT NULL,
  `blood_type` varchar(3) DEFAULT NULL,
  `entrance_data` varchar(100) DEFAULT NULL,
  `middle_initial` varchar(15) DEFAULT NULL,
  `telephone_number` varchar(15) DEFAULT NULL,
  `dominant_hand` varchar(10) DEFAULT NULL,
  `medical_history` varchar(100) DEFAULT NULL,
  `plm_email_address` varchar(60) DEFAULT NULL,
  `mobile_number_network` varchar(5) DEFAULT NULL,
  `info_updated` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `plm_email_address_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_STUDENT_NUMBER` (`studentid`),
  KEY `IDX_LAST_NAME` (`lastname`),
  KEY `IDX_FIRST_NAME` (`firstname`)
) ENGINE=InnoDB AUTO_INCREMENT=61968 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.level
CREATE TABLE IF NOT EXISTS `level` (
  `YR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LEVEL` varchar(30) NOT NULL,
  `LEVEL_DESCRIPTION` varchar(255) NOT NULL,
  PRIMARY KEY (`YR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.major
CREATE TABLE IF NOT EXISTS `major` (
  `MAJOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAJOR` varchar(30) NOT NULL,
  PRIMARY KEY (`MAJOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.matriculationfees
CREATE TABLE IF NOT EXISTS `matriculationfees` (
  `feecode` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `feetype` char(2) NOT NULL DEFAULT '',
  `feeorder` int(5) NOT NULL DEFAULT 0,
  `ugNP` float NOT NULL DEFAULT 0,
  `ugNPP` float NOT NULL DEFAULT 0,
  `ugPaying` float NOT NULL DEFAULT 0,
  `ptNP` float NOT NULL DEFAULT 0,
  `ptNPP` float(10,2) NOT NULL DEFAULT 0.00,
  `ptPaying` float(10,2) NOT NULL DEFAULT 0.00,
  `clPartial` float(10,2) NOT NULL DEFAULT 0.00,
  `clPaying` float(10,2) NOT NULL DEFAULT 0.00,
  `med123` float(10,2) NOT NULL DEFAULT 0.00,
  `med4` float(10,2) DEFAULT 0.00,
  `flag_include` int(1) DEFAULT 1,
  `forMed` int(1) DEFAULT 1,
  PRIMARY KEY (`feecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.matriculationfees_copy
CREATE TABLE IF NOT EXISTS `matriculationfees_copy` (
  `feecode` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `feetype` char(2) NOT NULL DEFAULT '',
  `feeorder` int(5) NOT NULL DEFAULT 0,
  `ugNP` float NOT NULL DEFAULT 0,
  `ugNPP` float NOT NULL DEFAULT 0,
  `ugPaying` float NOT NULL DEFAULT 0,
  `ptNP` float NOT NULL DEFAULT 0,
  `ptNPP` float(10,2) NOT NULL DEFAULT 0.00,
  `ptPaying` float(10,2) NOT NULL DEFAULT 0.00,
  `clPartial` float(10,2) NOT NULL DEFAULT 0.00,
  `clPaying` float(10,2) NOT NULL DEFAULT 0.00,
  `med123` float(10,2) NOT NULL DEFAULT 0.00,
  `med4` float(10,2) DEFAULT 0.00,
  `flag_include` int(1) DEFAULT 1,
  `forMed` int(1) DEFAULT 1,
  PRIMARY KEY (`feecode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.medfeedetails
CREATE TABLE IF NOT EXISTS `medfeedetails` (
  `aysem` int(11) DEFAULT NULL,
  `yrlevel` int(11) DEFAULT 0,
  `amount` float(10,2) DEFAULT 0.00,
  `lab_hours` float(10,2) DEFAULT 0.00,
  `tuition` float(10,2) DEFAULT 0.00,
  `tot_units` float(10,2) DEFAULT 0.00,
  `precep_hrs` float(10,2) DEFAULT 0.00,
  `pre_amt` float(10,2) DEFAULT 0.00,
  `per_unit` float(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.medicalfund
CREATE TABLE IF NOT EXISTS `medicalfund` (
  `studentid` int(11) DEFAULT NULL,
  `aysem` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `updateby` int(11) DEFAULT NULL,
  `updateon` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.meetingtypes
CREATE TABLE IF NOT EXISTS `meetingtypes` (
  `meetingtype` char(3) NOT NULL DEFAULT '',
  `label` varchar(100) DEFAULT NULL,
  `shortlabel` varchar(7) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`meetingtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.meetingtypes_copy
CREATE TABLE IF NOT EXISTS `meetingtypes_copy` (
  `meetingtype` char(3) NOT NULL DEFAULT '',
  `label` varchar(100) DEFAULT NULL,
  `shortlabel` varchar(7) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`meetingtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.nstp_classlists
CREATE TABLE IF NOT EXISTS `nstp_classlists` (
  `studentid` int(9) unsigned NOT NULL DEFAULT 0,
  `nstp_type` char(4) NOT NULL,
  `classid` int(15) NOT NULL,
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  UNIQUE KEY `UNIQUE_student` (`studentid`),
  CONSTRAINT `FK_nstp_classlists_students` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.official_receipt
CREATE TABLE IF NOT EXISTS `official_receipt` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(60) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `date` datetime DEFAULT '0000-00-00 00:00:00',
  `aysem` smallint(5) NOT NULL DEFAULT 0,
  `tuitionFee` decimal(10,2) DEFAULT 0.00,
  `miscFee` decimal(10,2) DEFAULT 0.00,
  `labFee` decimal(10,2) DEFAULT 0.00,
  `otherFee` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.passcode
CREATE TABLE IF NOT EXISTS `passcode` (
  `facultyid` int(11) DEFAULT NULL,
  `passcode` varchar(50) DEFAULT NULL,
  `expiration` datetime DEFAULT '2016-10-18 15:40:03'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.payment_type
CREATE TABLE IF NOT EXISTS `payment_type` (
  `id` int(9) DEFAULT NULL,
  `payment_code` int(1) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `enteredOn` date DEFAULT NULL,
  `enteredBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.peclasslists
CREATE TABLE IF NOT EXISTS `peclasslists` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `initialgrade` varchar(4) NOT NULL DEFAULT '',
  `tuitionpaid` varchar(10) NOT NULL DEFAULT '0',
  `remarks` varchar(254) NOT NULL DEFAULT '',
  `inserttype` char(1) NOT NULL DEFAULT 'A',
  `insertedby` varchar(11) NOT NULL DEFAULT '0',
  `insertedon` varchar(14) DEFAULT NULL,
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` varchar(14) DEFAULT '00000000000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `pet` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `UNIQUE_STUDENT_CLASS` (`studentid`,`classid`),
  FULLTEXT KEY `initialgrade` (`initialgrade`,`remarks`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.pef_table
CREATE TABLE IF NOT EXISTS `pef_table` (
  `pef_index` int(11) NOT NULL AUTO_INCREMENT,
  `pef_stdno` varchar(20) NOT NULL DEFAULT '',
  `pef_sy` varchar(10) NOT NULL DEFAULT '',
  `pef_sem` varchar(10) DEFAULT NULL,
  `updatedby` varchar(30) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  PRIMARY KEY (`pef_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.photo
CREATE TABLE IF NOT EXISTS `photo` (
  `PHOTO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILENAME` text NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `SIZE` int(30) NOT NULL,
  `CAPTION` varchar(255) NOT NULL,
  `IDNO` int(11) NOT NULL,
  `PRIMARY` varchar(20) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`PHOTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.prechoices
CREATE TABLE IF NOT EXISTS `prechoices` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `rank` smallint(6) DEFAULT 1,
  `classid` int(11) NOT NULL DEFAULT 0,
  `choicetype` char(1) NOT NULL DEFAULT 'P',
  `requisitestatus` char(1) NOT NULL DEFAULT 'I',
  `deficiencies` varchar(60) DEFAULT NULL,
  `curriculumid` int(11) DEFAULT NULL,
  `processedon` date DEFAULT NULL,
  `result` varchar(12) DEFAULT NULL,
  `submitmode` char(1) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updateon` datetime DEFAULT NULL,
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT NULL,
  `desiredunits` int(11) DEFAULT NULL,
  `subjectid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.preclasslists
CREATE TABLE IF NOT EXISTS `preclasslists` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT NULL,
  `subjectid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.presurvey
CREATE TABLE IF NOT EXISTS `presurvey` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `foraysem` smallint(6) NOT NULL DEFAULT 0,
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  `recommended` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`studentid`,`foraysem`,`subjectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.primarytables
CREATE TABLE IF NOT EXISTS `primarytables` (
  `primarytableid` int(11) NOT NULL DEFAULT 0,
  `primarytable` varchar(245) NOT NULL DEFAULT '',
  `description` varchar(245) DEFAULT NULL,
  `updatedby` int(11) DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.printid_trail
CREATE TABLE IF NOT EXISTS `printid_trail` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `printid` varchar(50) NOT NULL DEFAULT '',
  `generatedby` int(11) NOT NULL DEFAULT 0,
  `generatedon` time DEFAULT NULL,
  `action` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.programcourses
CREATE TABLE IF NOT EXISTS `programcourses` (
  `programcourseid` int(11) NOT NULL AUTO_INCREMENT,
  `program2` varchar(10) NOT NULL DEFAULT '',
  `year` smallint(6) NOT NULL DEFAULT 0,
  `sem` smallint(6) NOT NULL DEFAULT 0,
  `row` smallint(6) NOT NULL DEFAULT 0,
  `coursetype` char(1) NOT NULL DEFAULT '',
  `course` varchar(30) NOT NULL DEFAULT '',
  `area` varchar(40) NOT NULL DEFAULT '',
  `elective` tinyint(1) NOT NULL DEFAULT 0,
  `program` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`programcourseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.programs
CREATE TABLE IF NOT EXISTS `programs` (
  `programid` int(11) NOT NULL AUTO_INCREMENT,
  `unitid` int(11) DEFAULT NULL,
  `program` varchar(20) NOT NULL DEFAULT '',
  `revisionyear` smallint(6) DEFAULT NULL,
  `programtitle` varchar(200) NOT NULL DEFAULT '',
  `revisedpid` int(11) DEFAULT NULL,
  `degree` varchar(4) DEFAULT NULL,
  `major` varchar(14) DEFAULT NULL,
  `degreelevel` char(1) NOT NULL DEFAULT 'U',
  `numyears` smallint(6) DEFAULT NULL,
  `numcredits` smallint(6) DEFAULT NULL,
  `entrancecode` varchar(20) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `pseudodata` varchar(20) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT NULL,
  `categoryID` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `forplmat` int(1) DEFAULT 0,
  `waitlist_program` int(1) DEFAULT 0,
  `waitlist_slots` int(3) DEFAULT 0,
  `waitlist_taken` int(3) DEFAULT 0,
  PRIMARY KEY (`programid`),
  UNIQUE KEY `unitid` (`unitid`,`revisionyear`,`degree`,`major`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.programunits
CREATE TABLE IF NOT EXISTS `programunits` (
  `programid` int(11) NOT NULL DEFAULT 0,
  `unitid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.provinces
CREATE TABLE IF NOT EXISTS `provinces` (
  `provinceid` int(11) NOT NULL DEFAULT 0,
  `countryid` char(2) NOT NULL DEFAULT 'PH',
  `province` varchar(40) NOT NULL DEFAULT '',
  `regionid` int(11) DEFAULT 0,
  `mapoutline` text DEFAULT NULL,
  `updatedby` int(11) DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.rank
CREATE TABLE IF NOT EXISTS `rank` (
  `rankid` int(2) DEFAULT NULL,
  `rank_name` varchar(50) DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.recordtypes
CREATE TABLE IF NOT EXISTS `recordtypes` (
  `recordtypeid` int(11) DEFAULT NULL,
  `recordtype` varchar(50) DEFAULT NULL,
  `label` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.refreshed_grad_or
CREATE TABLE IF NOT EXISTS `refreshed_grad_or` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL DEFAULT 0,
  `aysem` int(5) NOT NULL DEFAULT 0,
  `ornumber` varchar(16) DEFAULT NULL,
  `datePaid` datetime DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amt_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `w_balance` tinyint(1) NOT NULL DEFAULT 0,
  `balance_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `type_payment` tinyint(6) DEFAULT NULL,
  `chk_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `dFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `torFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `etFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `aFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dsFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `assess_on` datetime DEFAULT current_timestamp(),
  `assess_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `inserted_on` datetime DEFAULT current_timestamp(),
  `insertedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.regions
CREATE TABLE IF NOT EXISTS `regions` (
  `regionid` int(11) NOT NULL DEFAULT 0,
  `regioncode` varchar(6) NOT NULL DEFAULT '',
  `region` varchar(50) NOT NULL DEFAULT '',
  `mapoutline` text DEFAULT NULL,
  PRIMARY KEY (`regionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.registrationcodes
CREATE TABLE IF NOT EXISTS `registrationcodes` (
  `registrationcode` char(1) NOT NULL DEFAULT '',
  `label` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`registrationcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.registration_dates
CREATE TABLE IF NOT EXISTS `registration_dates` (
  `registrationdateid` int(11) NOT NULL AUTO_INCREMENT,
  `aysem` smallint(6) NOT NULL DEFAULT 0,
  `registrationtype` char(1) NOT NULL DEFAULT '',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `enddate` date DEFAULT '0000-00-00',
  `insertedby` int(11) DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  UNIQUE KEY `registrationdateid` (`registrationdateid`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.relations
CREATE TABLE IF NOT EXISTS `relations` (
  `relationid` int(11) NOT NULL DEFAULT 0,
  `relation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`relationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.religions
CREATE TABLE IF NOT EXISTS `religions` (
  `religionid` int(11) NOT NULL AUTO_INCREMENT,
  `religion` varchar(200) NOT NULL DEFAULT '',
  `restrictions` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`religionid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.requested_room_schedules
CREATE TABLE IF NOT EXISTS `requested_room_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `roomid` int(11) NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `date` date NOT NULL,
  `day` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_requested_room_schedule_dates_requested_room_schedules` (`schedule_id`),
  KEY `FK_requested_room_schedules_rooms` (`roomid`),
  CONSTRAINT `FK_requested_room_schedule_dates_requested_room_schedules` FOREIGN KEY (`schedule_id`) REFERENCES `requested_schedules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_requested_room_schedules_rooms` FOREIGN KEY (`roomid`) REFERENCES `rooms` (`roomid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.requested_schedules
CREATE TABLE IF NOT EXISTS `requested_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requested_for_class` int(11) DEFAULT NULL,
  `requested_for` varchar(50) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_requested_room_schedules_classes` (`requested_for_class`),
  CONSTRAINT `FK_requested_room_schedules_classes` FOREIGN KEY (`requested_for_class`) REFERENCES `classes` (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.rle_af_fee
CREATE TABLE IF NOT EXISTS `rle_af_fee` (
  `subjectid` int(11) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `rle_amount` float(10,2) DEFAULT NULL,
  `af_amount` float(10,2) DEFAULT NULL,
  `aysem` int(5) DEFAULT NULL,
  `remarks` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `roleid` int(11) NOT NULL DEFAULT 0,
  `role` varchar(40) NOT NULL DEFAULT '',
  `category` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `updatedby` int(11) DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.room
CREATE TABLE IF NOT EXISTS `room` (
  `ROOM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROOM_NAME` varchar(30) NOT NULL,
  `ROOM_DESC` varchar(30) NOT NULL,
  PRIMARY KEY (`ROOM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `buildingid` int(11) NOT NULL,
  `room` varchar(20) NOT NULL,
  `roomname` varchar(100) DEFAULT NULL,
  `roomnum` decimal(10,0) DEFAULT NULL,
  `roomnumend` decimal(10,0) DEFAULT 0,
  `roomtype` char(1) DEFAULT '0',
  `unitid` int(11) DEFAULT NULL,
  `seatingcapacity` smallint(6) DEFAULT NULL,
  `actualseats` smallint(6) DEFAULT NULL,
  `floorarea` smallint(6) DEFAULT NULL,
  `availablefrom` datetime DEFAULT NULL,
  `availableto` datetime DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `can_be_conflict` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'The room can have conflicts',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.roomtypes
CREATE TABLE IF NOT EXISTS `roomtypes` (
  `roomtype` char(1) NOT NULL DEFAULT '',
  `label` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`roomtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.sap_requirements
CREATE TABLE IF NOT EXISTS `sap_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `file_prefix` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.scholarships
CREATE TABLE IF NOT EXISTS `scholarships` (
  `scholarshipid` int(11) NOT NULL DEFAULT 0,
  `scholarship` varchar(100) DEFAULT NULL,
  `institutionid` int(11) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `insertedby` int(11) NOT NULL,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  PRIMARY KEY (`scholarshipid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.scholasticstatus
CREATE TABLE IF NOT EXISTS `scholasticstatus` (
  `scholasticid` int(11) NOT NULL DEFAULT 0,
  `label` varchar(100) NOT NULL,
  `discount` float(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.school
CREATE TABLE IF NOT EXISTS `school` (
  `school_id` int(11) DEFAULT NULL,
  `school_name` varchar(50) DEFAULT NULL,
  `school_code` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.schoolyr
CREATE TABLE IF NOT EXISTS `schoolyr` (
  `SYID` int(11) NOT NULL AUTO_INCREMENT,
  `AY` varchar(30) NOT NULL,
  `SEMESTER` varchar(20) NOT NULL,
  `COURSE_ID` int(11) NOT NULL,
  `IDNO` int(30) NOT NULL,
  `CATEGORY` varchar(30) NOT NULL DEFAULT 'ENROLLED',
  `DATE_RESERVED` datetime NOT NULL,
  `DATE_ENROLLED` datetime NOT NULL,
  `STATUS` varchar(30) NOT NULL DEFAULT 'New',
  PRIMARY KEY (`SYID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.sections
CREATE TABLE IF NOT EXISTS `sections` (
  `sectionid` int(11) NOT NULL DEFAULT 0,
  `section` varchar(10) NOT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  `standard` tinyint(1) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL,
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT NULL,
  `sectionprint` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.semester
CREATE TABLE IF NOT EXISTS `semester` (
  `SEM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEM` varchar(15) NOT NULL DEFAULT 'First',
  PRIMARY KEY (`SEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.serial
CREATE TABLE IF NOT EXISTS `serial` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `subjectid` int(10) NOT NULL DEFAULT 0,
  `classid` int(10) NOT NULL DEFAULT 0,
  `studentid` int(10) NOT NULL DEFAULT 0,
  `programid` int(10) NOT NULL DEFAULT 0,
  `serialnumber` varchar(15) NOT NULL DEFAULT '0',
  `nstp` varchar(5) NOT NULL DEFAULT '0',
  `region` varchar(5) NOT NULL DEFAULT '0',
  `designation` varchar(5) NOT NULL DEFAULT '0',
  `series` varchar(10) NOT NULL DEFAULT '0',
  `year` varchar(5) NOT NULL DEFAULT '0',
  `aysem` int(11) NOT NULL DEFAULT 0,
  `status` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.serial_no
CREATE TABLE IF NOT EXISTS `serial_no` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `subjectid` int(10) NOT NULL DEFAULT 0,
  `classid` int(10) NOT NULL DEFAULT 0,
  `studentid` int(10) NOT NULL DEFAULT 0,
  `programid` int(10) NOT NULL DEFAULT 0,
  `serialnumber` varchar(15) NOT NULL DEFAULT '0',
  `nstp` varchar(5) NOT NULL DEFAULT '0',
  `region` varchar(5) NOT NULL DEFAULT '0',
  `designation` varchar(5) NOT NULL DEFAULT '0',
  `series` varchar(10) NOT NULL DEFAULT '0',
  `year` varchar(5) NOT NULL DEFAULT '0',
  `aysem` int(11) NOT NULL DEFAULT 0,
  `status` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL,
  `payload` varchar(50) NOT NULL,
  `last_activity` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `user_agent` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.stfap
CREATE TABLE IF NOT EXISTS `stfap` (
  `bracket` varchar(2) DEFAULT NULL,
  `living` double DEFAULT 0,
  `book` double DEFAULT 0,
  `tuition` double DEFAULT 0,
  `misc` double DEFAULT 0,
  `lab` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.studentaddresses
CREATE TABLE IF NOT EXISTS `studentaddresses` (
  `studentaddressid` int(11) NOT NULL DEFAULT 0,
  `studentid` int(11) DEFAULT 0,
  `addresstype` char(1) DEFAULT NULL,
  `streetaddressold` varchar(60) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(12) DEFAULT NULL,
  `housingtype` char(50) DEFAULT NULL,
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedby` int(11) DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `city` varchar(100) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `streetaddress` longtext DEFAULT NULL,
  PRIMARY KEY (`studentaddressid`),
  UNIQUE KEY `studentid` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.studentcontacts
CREATE TABLE IF NOT EXISTS `studentcontacts` (
  `studentcontactid` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(70) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `pedigree` varchar(4) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `relationid` int(11) DEFAULT NULL,
  `deceased` tinyint(4) DEFAULT NULL,
  `guardian` tinyint(4) DEFAULT NULL,
  `contactifemergency` tinyint(4) DEFAULT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `schoolemployee` tinyint(4) DEFAULT NULL,
  `officephone` varchar(30) DEFAULT NULL,
  `mobilephone` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `studentaddressid` int(11) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` date DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` date DEFAULT NULL,
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` date DEFAULT NULL,
  PRIMARY KEY (`studentcontactid`)
) ENGINE=InnoDB AUTO_INCREMENT=7623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.students
CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(9) unsigned NOT NULL,
  `name` varchar(70) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(30) DEFAULT NULL,
  `pedigree` varchar(4) DEFAULT NULL,
  `maidenname` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `birthplacecid` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `civilstatus` char(10) DEFAULT NULL,
  `citizenshipcid` char(2) DEFAULT 'PH',
  `residentalien` date DEFAULT NULL,
  `religionid` int(11) unsigned DEFAULT NULL,
  `mobilephone` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `entryaysem` smallint(6) unsigned DEFAULT NULL,
  `recordstatus` char(1) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT current_timestamp(),
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp NULL DEFAULT current_timestamp(),
  `validatedby` int(11) unsigned DEFAULT NULL,
  `validatedon` datetime DEFAULT current_timestamp(),
  `birthplacecity` varchar(50) DEFAULT NULL,
  `isstudent` tinyint(1) unsigned DEFAULT NULL,
  `dategraduated` datetime DEFAULT NULL,
  `clearancedate` datetime DEFAULT NULL,
  `admissionreq` text DEFAULT NULL,
  `employeedependentid` int(11) unsigned DEFAULT NULL,
  `employeedependentunitid` int(11) unsigned DEFAULT NULL,
  `religion` varchar(75) DEFAULT NULL,
  `birth_place` varchar(150) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `complexion` varchar(10) DEFAULT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `entrance_data` varchar(100) DEFAULT NULL,
  `middle_initial` varchar(15) DEFAULT NULL,
  `telephone_number` varchar(15) DEFAULT NULL,
  `dominant_hand` varchar(10) DEFAULT NULL,
  `medical_history` varchar(100) DEFAULT NULL,
  `plm_email_address` varchar(60) DEFAULT NULL,
  `plm_email_address_id` char(36) DEFAULT NULL,
  `annual_family_income` decimal(10,2) DEFAULT NULL,
  `q1` tinyint(4) NOT NULL DEFAULT 0,
  `q2a` varchar(20) DEFAULT NULL,
  `q2bLaptop` tinyint(4) NOT NULL DEFAULT 0,
  `q2bSmartphone` tinyint(4) NOT NULL DEFAULT 0,
  `q2bPersonalComputer` tinyint(4) NOT NULL DEFAULT 0,
  `q2bTablet` tinyint(4) NOT NULL DEFAULT 0,
  `q3` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_STUDENT_NUMBER` (`studentid`),
  KEY `IDX_LAST_NAME` (`lastname`),
  KEY `IDX_FIRST_NAME` (`firstname`)
) ENGINE=InnoDB AUTO_INCREMENT=92395 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.students20153
CREATE TABLE IF NOT EXISTS `students20153` (
  `studentid` int(11) DEFAULT NULL,
  `aysem` smallint(6) DEFAULT NULL,
  `programid` int(11) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `blockid` int(11) DEFAULT NULL,
  `yearstanding` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.studentschoolinfos
CREATE TABLE IF NOT EXISTS `studentschoolinfos` (
  `schoolinfoid` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `rrank` int(11) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `institutionid` int(11) DEFAULT NULL,
  `entryaysem` int(11) DEFAULT NULL,
  `entrydate` datetime DEFAULT NULL,
  `programid` int(11) DEFAULT NULL,
  `nonupprogram` varchar(50) DEFAULT NULL,
  `recordtype` char(1) DEFAULT NULL,
  `honorsreceived` varchar(50) DEFAULT NULL,
  `exittype` char(1) DEFAULT NULL,
  `exitaysem` int(11) DEFAULT NULL,
  `exitdate` datetime DEFAULT NULL,
  `sonumber` varchar(10) DEFAULT NULL,
  `soremarks` varchar(20) DEFAULT NULL,
  `sodate` datetime DEFAULT NULL,
  `nceerating` varchar(10) DEFAULT NULL,
  `nceeremarks` varchar(20) DEFAULT NULL,
  `nceedate` varchar(30) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.studentsubjects
CREATE TABLE IF NOT EXISTS `studentsubjects` (
  `STUDSUBJ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDNO` int(11) NOT NULL,
  `SUBJ_ID` int(11) NOT NULL,
  `LEVEL` int(11) NOT NULL,
  `SEMESTER` varchar(30) NOT NULL,
  `SY` text NOT NULL,
  PRIMARY KEY (`STUDSUBJ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.students_req
CREATE TABLE IF NOT EXISTS `students_req` (
  `studentid` int(9) DEFAULT NULL,
  `spar` int(1) DEFAULT 0,
  `birth_cert` int(1) DEFAULT 0,
  `f_137` int(1) DEFAULT 0,
  `f_138` int(1) DEFAULT 0,
  `bar_cert_sketch` int(1) DEFAULT 0,
  `voters_record` int(1) DEFAULT 0,
  `manilan` int(1) DEFAULT 0,
  `district` int(1) DEFAULT 0,
  `entered_on` datetime DEFAULT current_timestamp(),
  `entered_by` varchar(50) DEFAULT '0',
  `updated_on` datetime DEFAULT current_timestamp(),
  `updated_by` varchar(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.studentterms
CREATE TABLE IF NOT EXISTS `studentterms` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `aysem` smallint(6) NOT NULL DEFAULT 0,
  `programid` int(11) NOT NULL DEFAULT 0,
  `unitid` int(11) DEFAULT NULL,
  `institutionid` int(11) DEFAULT NULL,
  `otherstudentid` varchar(10) DEFAULT NULL,
  `advisereid` int(11) DEFAULT NULL,
  `blockid` int(11) DEFAULT 0,
  `yearlevel` smallint(6) NOT NULL DEFAULT 1,
  `yearstanding` smallint(6) DEFAULT 1,
  `studenttype` char(1) NOT NULL DEFAULT 'N',
  `registrationcode` char(1) NOT NULL DEFAULT 'R',
  `civilstatus` char(1) DEFAULT NULL,
  `employment` char(1) DEFAULT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `grossfamilyincome` decimal(10,0) DEFAULT NULL,
  `personalincome` decimal(10,0) DEFAULT NULL,
  `scholasticstanding` char(1) DEFAULT NULL,
  `cwa` decimal(10,2) DEFAULT NULL,
  `gwa` decimal(10,4) DEFAULT NULL,
  `graduating` char(1) NOT NULL DEFAULT 'f',
  `contract` varchar(255) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `insertedby` int(11) DEFAULT 0,
  `insertedon` timestamp NULL DEFAULT current_timestamp(),
  `updatedby` int(11) DEFAULT 0,
  `updatedon` timestamp NULL DEFAULT current_timestamp(),
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp NULL DEFAULT current_timestamp(),
  `tableau` varchar(255) DEFAULT NULL,
  `recordstatus` char(1) DEFAULT NULL,
  `percent_failed` decimal(10,0) DEFAULT NULL,
  `oldcredits` int(11) DEFAULT NULL,
  `officiallyenrolled` tinyint(1) DEFAULT NULL,
  `classcardprintedby` int(11) DEFAULT NULL,
  `classcardprintedon` datetime DEFAULT NULL,
  `leccredits` double DEFAULT NULL,
  `labcredits` double DEFAULT NULL,
  `credits` double DEFAULT NULL,
  `stfapbracket` char(2) DEFAULT NULL,
  `graduated` date DEFAULT '0000-00-00',
  `forgonetuitionfee` int(11) DEFAULT NULL,
  `scholarshipid` int(11) DEFAULT NULL,
  `datediploma` date DEFAULT NULL,
  `clearancedate` date DEFAULT NULL,
  `scholastic_status` int(1) DEFAULT 2,
  `isupdated` tinyint(1) DEFAULT 0,
  `ssnextterm` int(11) DEFAULT NULL,
  `isPrfPrinted` tinyint(1) NOT NULL DEFAULT 0,
  `loa` tinyint(1) NOT NULL DEFAULT 0,
  `hd` tinyint(1) NOT NULL DEFAULT 0,
  `step1` tinyint(1) NOT NULL DEFAULT 0,
  `step2` tinyint(1) NOT NULL DEFAULT 0,
  `step3` tinyint(1) NOT NULL DEFAULT 0,
  `step4` tinyint(1) NOT NULL DEFAULT 0,
  `withdrawn` tinyint(1) NOT NULL DEFAULT 0,
  `awol` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`studentid`,`aysem`,`programid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.studenttypes
CREATE TABLE IF NOT EXISTS `studenttypes` (
  `studenttype` char(50) DEFAULT NULL,
  `label` varchar(40) DEFAULT NULL,
  `order` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_address
CREATE TABLE IF NOT EXISTS `student_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(9) unsigned NOT NULL,
  `mail_street` varchar(200) NOT NULL,
  `mail_city` varchar(200) NOT NULL,
  `mail_prov` varchar(200) NOT NULL,
  `mail_contact_no` varchar(20) NOT NULL,
  `perm_street` varchar(200) NOT NULL,
  `perm_city` varchar(200) NOT NULL,
  `perm_prov` varchar(200) NOT NULL,
  `perm_contact_no` varchar(20) NOT NULL,
  `mail_submunicipality` varchar(200) NOT NULL,
  `mail_zip_code` char(4) NOT NULL,
  `perm_submunicipality` varchar(200) NOT NULL,
  `perm_zip_code` char(4) NOT NULL,
  `mail_barangay` varchar(200) NOT NULL,
  `perm_barangay` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_STUDENTID` (`studentid`),
  CONSTRAINT `FK_STUDENT` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=24260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_attended_schools
CREATE TABLE IF NOT EXISTS `student_attended_schools` (
  `studentid` int(11) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `categorytype` char(3) DEFAULT NULL,
  `degree` varchar(30) DEFAULT NULL,
  `institutionid` int(11) DEFAULT NULL,
  `institution` varchar(50) DEFAULT NULL,
  `exitschoolyear` varchar(9) DEFAULT NULL,
  `exitdate` datetime DEFAULT NULL,
  `exittype` char(1) DEFAULT NULL,
  `eerating` decimal(4,2) DEFAULT NULL,
  `eetakendate` datetime DEFAULT NULL,
  `otherrating` decimal(4,2) DEFAULT NULL,
  `othertakendate` datetime DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_cpi
CREATE TABLE IF NOT EXISTS `student_cpi` (
  `studentid` int(11) NOT NULL,
  `college` varchar(50) DEFAULT NULL,
  `program` varchar(50) DEFAULT NULL,
  `gender_cpi` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `civil_status` varchar(50) NOT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `tel_number` varchar(50) DEFAULT NULL,
  `cel_number` varchar(50) DEFAULT NULL,
  `present_address` varchar(50) DEFAULT NULL,
  `perm_address` varchar(50) DEFAULT NULL,
  `emerg_name` varchar(50) DEFAULT NULL,
  `emerg_rel` varchar(50) DEFAULT NULL,
  `emerg_contactNo` varchar(50) DEFAULT NULL,
  `f_contactNo` varchar(50) DEFAULT NULL,
  `f_occupation` varchar(50) DEFAULT NULL,
  `m_contactNo` varchar(11) DEFAULT NULL,
  `m_occupation` varchar(50) DEFAULT NULL,
  `g_name` varchar(50) DEFAULT NULL,
  `g_address` varchar(50) DEFAULT NULL,
  `g_contactNo` varchar(11) DEFAULT NULL,
  `g_occupation` varchar(50) DEFAULT NULL,
  `parents_livingStats` varchar(50) DEFAULT NULL,
  `living_arrangement` varchar(50) DEFAULT NULL,
  `sibl_rank` varchar(50) DEFAULT NULL,
  `elementary` varchar(100) DEFAULT NULL,
  `secondary` varchar(100) DEFAULT NULL,
  `tertiary` varchar(100) DEFAULT NULL,
  `others_school` varchar(100) DEFAULT NULL,
  `elem_awards` varchar(250) DEFAULT NULL,
  `sec_awards` varchar(250) DEFAULT NULL,
  `ter_awards` varchar(250) DEFAULT NULL,
  `other_awards` varchar(250) DEFAULT NULL,
  `healthStats` varchar(50) DEFAULT NULL,
  `engage_physical` varchar(50) DEFAULT NULL,
  `doctors_care` varchar(50) DEFAULT NULL,
  `doctors_care_reason` varchar(250) DEFAULT NULL,
  `takingMedication` varchar(50) DEFAULT NULL,
  `takingMedication_reason` varchar(250) DEFAULT NULL,
  `takingMedication_type` varchar(250) DEFAULT NULL,
  `withHistory` varchar(50) DEFAULT NULL,
  `withHistory_details` varchar(250) DEFAULT NULL,
  `currentHistory` varchar(250) DEFAULT NULL,
  `currentHistory_details` varchar(250) DEFAULT NULL,
  `course_1st` varchar(250) DEFAULT NULL,
  `course_2nd` varchar(250) DEFAULT NULL,
  `course_3rd` varchar(250) DEFAULT NULL,
  `financial_sec` varchar(10) DEFAULT NULL,
  `jobs_avail` varchar(10) DEFAULT NULL,
  `parents_choicce` varchar(10) DEFAULT NULL,
  `help_society` varchar(10) DEFAULT NULL,
  `childhood_dream` varchar(10) DEFAULT NULL,
  `status_recog` varchar(10) DEFAULT NULL,
  `creativity` varchar(10) DEFAULT NULL,
  `indepedence` varchar(10) DEFAULT NULL,
  `more_fullfillment` varchar(10) DEFAULT NULL,
  `challenge_adventure` varchar(10) DEFAULT NULL,
  `leisure_enjoyment` varchar(10) DEFAULT NULL,
  `peer_influencce` varchar(10) DEFAULT NULL,
  `pursuit_knowledge` varchar(10) DEFAULT NULL,
  `others_inf` varchar(250) DEFAULT NULL,
  `hdys_5years` varchar(250) DEFAULT NULL,
  `describe_yourself` varchar(250) DEFAULT NULL,
  `talents` varchar(250) DEFAULT NULL,
  `goals` varchar(250) DEFAULT NULL,
  `sib_name1` varchar(250) DEFAULT NULL,
  `sib_sex1` varchar(250) DEFAULT NULL,
  `sib_age1` varchar(250) DEFAULT NULL,
  `sib_school1` varchar(250) DEFAULT NULL,
  `sib_name2` varchar(250) DEFAULT NULL,
  `sib_sex2` varchar(250) DEFAULT NULL,
  `sib_age2` varchar(250) DEFAULT NULL,
  `sib_school2` varchar(250) DEFAULT NULL,
  `sib_name3` varchar(250) DEFAULT NULL,
  `sib_sex3` varchar(250) DEFAULT NULL,
  `sib_age3` varchar(250) DEFAULT NULL,
  `sib_school3` varchar(250) DEFAULT NULL,
  `sib_name4` varchar(250) DEFAULT NULL,
  `sib_sex4` varchar(250) DEFAULT NULL,
  `sib_age4` varchar(250) DEFAULT NULL,
  `sib_school4` varchar(250) DEFAULT NULL,
  `sib_name5` varchar(250) DEFAULT NULL,
  `sib_sex5` varchar(250) DEFAULT NULL,
  `sib_age5` varchar(250) DEFAULT NULL,
  `sib_school5` varchar(250) DEFAULT NULL,
  `createdOn` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_cpi_appointment
CREATE TABLE IF NOT EXISTS `student_cpi_appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL DEFAULT 0,
  `contactNo` varchar(11) NOT NULL DEFAULT '0',
  `counselor` varchar(50) DEFAULT '0',
  `appointment_date` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `time1` varchar(50) DEFAULT NULL,
  `time2` time DEFAULT NULL,
  `time3` time DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_deficiency
CREATE TABLE IF NOT EXISTS `student_deficiency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) DEFAULT NULL,
  `subjectid` int(11) DEFAULT NULL,
  `aysem` int(11) DEFAULT NULL,
  `enteredBy` int(11) DEFAULT NULL,
  `enteredOn` datetime DEFAULT current_timestamp(),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105970 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='subject deficiency of students';

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_educ
CREATE TABLE IF NOT EXISTS `student_educ` (
  `studentid` int(9) unsigned NOT NULL,
  `lrn` varchar(50) DEFAULT NULL,
  `shschool_name` varchar(500) DEFAULT NULL,
  `shschool_add` varchar(300) DEFAULT NULL,
  `shstrand` varchar(10) DEFAULT NULL,
  `shyear_entered` int(11) DEFAULT NULL,
  `shyear_graduated` int(11) DEFAULT NULL,
  `shhonor` varchar(200) DEFAULT NULL,
  `shgenave` decimal(10,2) DEFAULT 0.00,
  `shremarks` varchar(200) DEFAULT NULL,
  `orgname` varchar(300) DEFAULT NULL,
  `orgpos` varchar(150) DEFAULT NULL,
  `prev_tertiary_school_year` year(4) DEFAULT NULL,
  `prev_tertiary_semesters` tinyint(1) DEFAULT NULL,
  `public_private` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `UNIQUE_STUDENT_NUMBER` (`studentid`),
  CONSTRAINT `FK_student_educ_students` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_family
CREATE TABLE IF NOT EXISTS `student_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(9) unsigned NOT NULL,
  `f_name` varchar(75) DEFAULT NULL,
  `f_contact` varchar(20) DEFAULT NULL,
  `f_address` varchar(300) DEFAULT NULL,
  `f_occu` varchar(200) DEFAULT NULL,
  `f_office` varchar(300) DEFAULT NULL,
  `f_ofaddress` varchar(300) DEFAULT NULL,
  `f_ofnumber` varchar(20) DEFAULT NULL,
  `m_name` varchar(75) DEFAULT NULL,
  `m_address` varchar(300) DEFAULT NULL,
  `m_contact` varchar(20) DEFAULT NULL,
  `m_occu` varchar(200) DEFAULT NULL,
  `m_office` varchar(300) DEFAULT NULL,
  `m_ofaddress` varchar(300) DEFAULT NULL,
  `m_ofnumber` varchar(20) DEFAULT NULL,
  `g_name` varchar(75) DEFAULT NULL,
  `g_rel` varchar(40) DEFAULT NULL,
  `g_contact` varchar(20) DEFAULT NULL,
  `g_address` varchar(300) DEFAULT NULL,
  `g_occu` varchar(200) DEFAULT NULL,
  `g_office` varchar(300) DEFAULT NULL,
  `g_ofaddress` varchar(300) DEFAULT NULL,
  `g_ofnumber` varchar(20) DEFAULT NULL,
  `f_last_name` varchar(50) DEFAULT NULL,
  `f_first_name` varchar(50) DEFAULT NULL,
  `f_middle_name` varchar(50) DEFAULT NULL,
  `m_last_name` varchar(50) DEFAULT NULL,
  `m_first_name` varchar(50) DEFAULT NULL,
  `m_middle_name` varchar(50) DEFAULT NULL,
  `g_last_name` varchar(50) DEFAULT NULL,
  `g_first_name` varchar(50) DEFAULT NULL,
  `g_middle_name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `studentid` (`studentid`),
  CONSTRAINT `FK_STUDENTS` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=30025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_freshmeninfo
CREATE TABLE IF NOT EXISTS `student_freshmeninfo` (
  `studentid` int(9) unsigned DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `extname` varchar(50) DEFAULT NULL,
  `maidenname` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pob` varchar(150) DEFAULT NULL,
  `mobnumber` varchar(15) DEFAULT NULL,
  `telnumber` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `civstatus` int(1) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `dhand` varchar(10) DEFAULT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `complexion` varchar(10) DEFAULT NULL,
  `medhistory` varchar(100) DEFAULT NULL,
  `middle_initial` varchar(10) DEFAULT NULL,
  `annual_family_income` decimal(10,2) DEFAULT NULL,
  `q1` tinyint(4) DEFAULT 0,
  `q2a` varchar(20) DEFAULT NULL,
  `q2bLaptop` tinyint(4) DEFAULT 0,
  `q2bSmartphone` tinyint(4) DEFAULT 0,
  `q2bPersonalComputer` tinyint(4) DEFAULT 0,
  `q2bTablet` tinyint(4) DEFAULT 0,
  `q3` text DEFAULT NULL,
  `date_entered` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `freshmenid` (`studentid`),
  UNIQUE KEY `UNIQUE_EMAIL` (`email`),
  CONSTRAINT `FK_student_freshmeninfo_students` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_freshmen_add
CREATE TABLE IF NOT EXISTS `student_freshmen_add` (
  `studentid` int(9) unsigned DEFAULT NULL,
  `mailadd_street` varchar(200) DEFAULT NULL,
  `mailadd_province` varchar(200) DEFAULT NULL,
  `mailadd_city_municipality` varchar(200) DEFAULT NULL,
  `mailadd_submunicipality` varchar(200) DEFAULT NULL,
  `mailadd_barangay` varchar(200) DEFAULT NULL,
  `mailadd_zip_code` char(4) DEFAULT NULL,
  `mailadd_contact_no` varchar(50) DEFAULT NULL,
  `permadd_street` varchar(200) DEFAULT NULL,
  `permadd_province` varchar(200) DEFAULT NULL,
  `permadd_city_municipality` varchar(200) DEFAULT NULL,
  `permadd_submunicipality` varchar(200) DEFAULT NULL,
  `permadd_barangay` varchar(200) DEFAULT NULL,
  `permadd_zip_code` char(4) DEFAULT NULL,
  `permadd_contact_no` varchar(50) DEFAULT NULL,
  `date_entered` datetime NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `freshmenid` (`studentid`),
  CONSTRAINT `FK_student_freshmen_add_students` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_freshmen_educ
CREATE TABLE IF NOT EXISTS `student_freshmen_educ` (
  `studentid` int(9) unsigned DEFAULT NULL,
  `lrn` varchar(50) DEFAULT NULL,
  `shschool_name` varchar(500) DEFAULT NULL,
  `shschool_add` varchar(300) DEFAULT NULL,
  `shstrand` varchar(10) DEFAULT NULL,
  `shyear_entered` int(11) DEFAULT NULL,
  `shyear_graduated` int(11) DEFAULT NULL,
  `shhonor` varchar(200) DEFAULT NULL,
  `shgenave` decimal(10,2) DEFAULT 0.00,
  `shremarks` varchar(200) DEFAULT NULL,
  `orgname` varchar(300) DEFAULT NULL,
  `orgpos` varchar(150) DEFAULT NULL,
  `public_private` varchar(10) DEFAULT NULL,
  `date_entered` datetime NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `freshmenid` (`studentid`),
  CONSTRAINT `FK_student_freshmen_educ_students` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_freshmen_family
CREATE TABLE IF NOT EXISTS `student_freshmen_family` (
  `studentid` int(9) unsigned DEFAULT NULL,
  `f_last_name` varchar(50) DEFAULT NULL,
  `f_first_name` varchar(50) DEFAULT NULL,
  `f_middle_name` varchar(50) DEFAULT NULL,
  `f_contact` varchar(150) DEFAULT NULL,
  `f_address` varchar(300) DEFAULT NULL,
  `f_occu` varchar(200) DEFAULT NULL,
  `f_office` varchar(300) DEFAULT NULL,
  `f_ofaddress` varchar(300) DEFAULT NULL,
  `f_ofnumber` varchar(200) DEFAULT NULL,
  `m_last_name` varchar(50) DEFAULT NULL,
  `m_first_name` varchar(50) DEFAULT NULL,
  `m_middle_name` varchar(50) DEFAULT NULL,
  `m_address` varchar(300) DEFAULT NULL,
  `m_contact` varchar(150) DEFAULT NULL,
  `m_occu` varchar(200) DEFAULT NULL,
  `m_office` varchar(300) DEFAULT NULL,
  `m_ofaddress` varchar(300) DEFAULT NULL,
  `m_ofnumber` varchar(150) DEFAULT NULL,
  `g_last_name` varchar(50) DEFAULT NULL,
  `g_first_name` varchar(50) DEFAULT NULL,
  `g_middle_name` varchar(50) DEFAULT NULL,
  `g_rel` varchar(200) DEFAULT NULL,
  `g_address` varchar(300) DEFAULT NULL,
  `g_occu` varchar(200) DEFAULT NULL,
  `g_office` varchar(300) DEFAULT NULL,
  `g_contact` varchar(150) DEFAULT NULL,
  `g_ofaddress` varchar(300) DEFAULT NULL,
  `g_ofnumber` varchar(150) DEFAULT NULL,
  `entered_on` datetime NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `freshmenid` (`studentid`),
  CONSTRAINT `FK_student_freshmen_family_students` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_id_requirements
CREATE TABLE IF NOT EXISTS `student_id_requirements` (
  `student_id` int(11) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `location` text NOT NULL,
  `requirement_tag` int(11) NOT NULL DEFAULT 0,
  `remarks` varchar(500) DEFAULT NULL,
  `verified_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `Index 1` (`student_id`,`requirement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for view plmcrsdb.student_info_for_id
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `student_info_for_id` (
	`studentid` INT(9) UNSIGNED NOT NULL,
	`name` VARCHAR(89) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`lastname` VARCHAR(30) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`firstname` VARCHAR(50) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`middlename` VARCHAR(30) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`pedigree` VARCHAR(4) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`programtitle` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_unicode_520_ci',
	`unitname` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_unicode_520_ci',
	`g_name` VARCHAR(200) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`g_address` VARCHAR(300) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`g_contact` VARCHAR(150) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`block` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_520_ci',
	`insertedon` DATETIME NULL
) ENGINE=MyISAM;

-- Dumping structure for table plmcrsdb.student_sap_requirements
CREATE TABLE IF NOT EXISTS `student_sap_requirements` (
  `student_id` int(11) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `location` text NOT NULL,
  `requirement_tag` int(11) NOT NULL DEFAULT 0,
  `remarks` varchar(500) DEFAULT NULL,
  `verified_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `Index 1` (`student_id`,`requirement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_status
CREATE TABLE IF NOT EXISTS `student_status` (
  `studentid` int(11) DEFAULT NULL,
  `statusid` int(11) DEFAULT NULL,
  `aysem` int(11) DEFAULT NULL,
  `inserted_by` int(11) DEFAULT NULL,
  `inserted_on` datetime DEFAULT NULL,
  `flag_cancel` int(11) DEFAULT NULL,
  `upateby` int(11) DEFAULT NULL,
  `updateon` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_upload_requirements
CREATE TABLE IF NOT EXISTS `student_upload_requirements` (
  `student_id` int(11) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `location` text NOT NULL,
  `requirement_tag` int(11) NOT NULL DEFAULT 0,
  `remarks` varchar(500) DEFAULT NULL,
  `verified_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `Index 1` (`student_id`,`requirement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.student_vaccination
CREATE TABLE IF NOT EXISTS `student_vaccination` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `first_dose` varchar(50) NOT NULL,
  `date_first` date NOT NULL,
  `second_dose` varchar(50) DEFAULT NULL,
  `date_second` date DEFAULT NULL,
  `booster` varchar(50) DEFAULT NULL,
  `date_booster` date DEFAULT NULL,
  `second_booster` varchar(100) DEFAULT NULL,
  `sec_booster_date` date DEFAULT NULL,
  `enteredOn` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.studterms_update
CREATE TABLE IF NOT EXISTS `studterms_update` (
  `studentid` int(11) DEFAULT NULL,
  `graduating` varchar(1) DEFAULT NULL,
  `scholastic_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.study_load
CREATE TABLE IF NOT EXISTS `study_load` (
  `faculty_code` int(11) DEFAULT NULL,
  `study_units` int(11) DEFAULT NULL,
  `teaching_units` int(11) DEFAULT NULL,
  `aysem` int(11) DEFAULT NULL,
  `entered_by` int(11) DEFAULT NULL,
  `entered_on` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `Index 1` (`faculty_code`,`aysem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `SUBJ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUBJ_CODE` varchar(30) NOT NULL,
  `SUBJ_DESCRIPTION` varchar(255) NOT NULL,
  `UNIT` int(2) NOT NULL,
  `PRE_REQUISITE` varchar(30) NOT NULL DEFAULT 'None',
  `COURSE_ID` int(11) NOT NULL,
  `AY` varchar(30) NOT NULL,
  `SEMESTER` varchar(20) NOT NULL,
  PRIMARY KEY (`SUBJ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.subjects
CREATE TABLE IF NOT EXISTS `subjects` (
  `subjectid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(20) NOT NULL DEFAULT '',
  `subjectname` varchar(20) NOT NULL DEFAULT '',
  `subjectnum` decimal(10,0) DEFAULT NULL,
  `revisionyear` smallint(6) DEFAULT NULL,
  `revisedsid` int(11) DEFAULT NULL,
  `romanformat` tinyint(1) DEFAULT NULL,
  `subjecttitle` varchar(150) DEFAULT NULL,
  `topicbased` tinyint(1) DEFAULT NULL,
  `languagebased` tinyint(1) DEFAULT NULL,
  `repeatableto` decimal(10,0) DEFAULT 3,
  `credited` decimal(10,2) DEFAULT 0.00,
  `degreelevel` char(1) NOT NULL DEFAULT 'U',
  `description` varchar(255) DEFAULT NULL,
  `requisites` varchar(254) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE current_timestamp(6),
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `credits` double NOT NULL DEFAULT 3,
  `notes` varchar(50) DEFAULT NULL,
  `coursecode` int(11) DEFAULT NULL,
  `coursecode_updatedby` int(11) DEFAULT NULL,
  `marked_delete` tinyint(1) DEFAULT NULL,
  `labbased` tinyint(4) DEFAULT 0,
  `lab_hrs` decimal(10,2) DEFAULT 0.00,
  `labfee` float(10,2) DEFAULT 0.00,
  `RLE_fee` float(10,2) DEFAULT NULL,
  `Affiliation_fee` float(10,2) DEFAULT NULL,
  `tacredits` decimal(10,0) DEFAULT NULL,
  `active` int(1) DEFAULT 1,
  `accredit_cluster` varchar(20) DEFAULT NULL,
  `credits2016` double NOT NULL DEFAULT 3,
  `co_owner_id` int(11) DEFAULT NULL,
  `co_owner_id2` int(11) DEFAULT NULL,
  PRIMARY KEY (`subjectid`),
  UNIQUE KEY `subject` (`subject`,`subjectname`,`subjectnum`,`revisionyear`,`coursecode`)
) ENGINE=InnoDB AUTO_INCREMENT=342179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.subjects2
CREATE TABLE IF NOT EXISTS `subjects2` (
  `subjectid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(20) NOT NULL DEFAULT '',
  `subjectname` varchar(20) NOT NULL DEFAULT '',
  `subjectnum` decimal(10,0) DEFAULT NULL,
  `revisionyear` smallint(6) DEFAULT NULL,
  `revisedsid` int(11) DEFAULT NULL,
  `romanformat` tinyint(1) DEFAULT NULL,
  `subjecttitle` varchar(150) DEFAULT NULL,
  `topicbased` tinyint(1) DEFAULT NULL,
  `languagebased` tinyint(1) DEFAULT NULL,
  `repeatableto` decimal(10,0) DEFAULT 3,
  `credited` decimal(10,2) DEFAULT 0.00,
  `degreelevel` char(1) NOT NULL DEFAULT 'U',
  `description` varchar(255) DEFAULT NULL,
  `requisites` varchar(254) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE current_timestamp(6),
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `credits` double NOT NULL DEFAULT 3,
  `notes` varchar(50) DEFAULT NULL,
  `coursecode` int(11) DEFAULT NULL,
  `coursecode_updatedby` int(11) DEFAULT NULL,
  `marked_delete` tinyint(1) DEFAULT NULL,
  `labbased` tinyint(4) DEFAULT 0,
  `lab_hrs` decimal(10,2) DEFAULT 0.00,
  `labfee` float(10,2) DEFAULT 0.00,
  `RLE_fee` float(10,2) DEFAULT NULL,
  `Affiliation_fee` float(10,2) DEFAULT NULL,
  `tacredits` decimal(10,0) DEFAULT NULL,
  `active` int(1) DEFAULT 1,
  `accredit_cluster` varchar(20) DEFAULT NULL,
  `credits2016` double NOT NULL DEFAULT 3,
  `co_owner_id` int(11) DEFAULT NULL,
  `co_owner_id2` int(11) DEFAULT NULL,
  PRIMARY KEY (`subjectid`),
  UNIQUE KEY `subject` (`subject`,`subjectname`,`subjectnum`,`revisionyear`,`coursecode`)
) ENGINE=InnoDB AUTO_INCREMENT=342131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.subjects_copy
CREATE TABLE IF NOT EXISTS `subjects_copy` (
  `subjectid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(20) NOT NULL DEFAULT '',
  `subjectname` varchar(20) NOT NULL DEFAULT '',
  `subjectnum` decimal(10,0) DEFAULT NULL,
  `revisionyear` smallint(6) DEFAULT NULL,
  `revisedsid` int(11) DEFAULT NULL,
  `romanformat` tinyint(1) DEFAULT NULL,
  `subjecttitle` varchar(150) DEFAULT NULL,
  `topicbased` tinyint(1) DEFAULT NULL,
  `languagebased` tinyint(1) DEFAULT NULL,
  `repeatableto` decimal(10,0) DEFAULT 3,
  `credited` decimal(10,2) DEFAULT 0.00,
  `degreelevel` char(1) NOT NULL DEFAULT 'U',
  `description` varchar(255) DEFAULT NULL,
  `requisites` varchar(254) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE current_timestamp(6),
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `credits` double NOT NULL DEFAULT 3,
  `notes` varchar(50) DEFAULT NULL,
  `coursecode` int(11) DEFAULT NULL,
  `coursecode_updatedby` int(11) DEFAULT NULL,
  `marked_delete` tinyint(1) DEFAULT NULL,
  `labbased` tinyint(4) DEFAULT 0,
  `lab_hrs` decimal(10,2) DEFAULT 0.00,
  `labfee` float(10,2) DEFAULT 0.00,
  `RLE_fee` float(10,2) DEFAULT NULL,
  `Affiliation_fee` float(10,2) DEFAULT NULL,
  `tacredits` decimal(10,0) DEFAULT NULL,
  `active` int(1) DEFAULT 1,
  `accredit_cluster` varchar(20) DEFAULT NULL,
  `credits2016` double NOT NULL DEFAULT 3,
  `co_owner_id` int(11) DEFAULT NULL,
  `co_owner_id2` int(11) DEFAULT NULL,
  PRIMARY KEY (`subjectid`) USING BTREE,
  UNIQUE KEY `subject` (`subject`,`subjectname`,`subjectnum`,`revisionyear`,`coursecode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=342150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.ta_consultation
CREATE TABLE IF NOT EXISTS `ta_consultation` (
  `facultyid` int(11) DEFAULT NULL,
  `day_time` varchar(50) DEFAULT NULL,
  `nHrs` float(10,2) DEFAULT NULL,
  `aysem` int(5) DEFAULT NULL,
  `insertedBy` varchar(50) DEFAULT NULL,
  `insertedOn` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.ta_subjects
CREATE TABLE IF NOT EXISTS `ta_subjects` (
  `facultyid` int(11) DEFAULT NULL,
  `subjectCodeSection` varchar(50) DEFAULT NULL,
  `subjectTitle` varchar(150) DEFAULT NULL,
  `units` float(10,2) DEFAULT NULL,
  `aysem` int(5) DEFAULT NULL,
  `schedule` mediumtext DEFAULT NULL,
  `noStudents` int(3) DEFAULT NULL,
  `creditedUnits` float(10,2) DEFAULT NULL,
  `college` varchar(50) DEFAULT NULL,
  `typeLoad` int(11) DEFAULT NULL,
  `insertedBy` varchar(50) DEFAULT NULL,
  `insertedOn` timestamp NULL DEFAULT current_timestamp(),
  `smallclass` int(1) DEFAULT 0,
  `effectivity_date` varchar(100) DEFAULT NULL,
  `ed_group` int(2) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.ta_summary
CREATE TABLE IF NOT EXISTS `ta_summary` (
  `facultyid` int(11) DEFAULT NULL,
  `regular` float DEFAULT NULL,
  `extra` float DEFAULT NULL,
  `admin` float DEFAULT NULL,
  `substitution` float DEFAULT NULL,
  `off_campus` float DEFAULT NULL,
  `study` float DEFAULT NULL,
  `outside` float DEFAULT NULL,
  `pro_bono` float DEFAULT NULL,
  `aysem` int(5) DEFAULT NULL,
  `insertedBy` varchar(50) DEFAULT NULL,
  `insertedOn` timestamp NULL DEFAULT current_timestamp(),
  `effectivitydate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.tblrequirements
CREATE TABLE IF NOT EXISTS `tblrequirements` (
  `REQ_ID` int(30) NOT NULL AUTO_INCREMENT,
  `NSO` varchar(5) NOT NULL DEFAULT 'no',
  `BAPTISMAL` varchar(5) NOT NULL DEFAULT 'no',
  `ENTRANCE_TEST_RESULT` varchar(5) NOT NULL DEFAULT 'no',
  `MARRIAGE_CONTRACT` varchar(5) NOT NULL DEFAULT 'no',
  `CERTIFICATE_OF_TRANSFER` varchar(5) NOT NULL DEFAULT 'no',
  `IDNO` int(20) NOT NULL,
  PRIMARY KEY (`REQ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.tblstuddetails
CREATE TABLE IF NOT EXISTS `tblstuddetails` (
  `DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FATHER` varchar(255) NOT NULL,
  `FATHER_OCCU` varchar(255) NOT NULL,
  `MOTHER` varchar(255) NOT NULL,
  `MOTHER_OCCU` varchar(255) NOT NULL,
  `BOARDING` varchar(5) NOT NULL DEFAULT 'no',
  `WITH_FAMILY` varchar(5) NOT NULL DEFAULT 'yes',
  `GUARDIAN` varchar(255) NOT NULL,
  `GUARDIAN_ADDRESS` varchar(255) NOT NULL,
  `OTHER_PERSON_SUPPORT` varchar(255) NOT NULL,
  `ADDRESS` text NOT NULL,
  `IDNO` int(30) NOT NULL,
  PRIMARY KEY (`DETAIL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.tblstudent
CREATE TABLE IF NOT EXISTS `tblstudent` (
  `S_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDNO` int(20) NOT NULL,
  `FNAME` varchar(40) NOT NULL,
  `LNAME` varchar(40) NOT NULL,
  `MNAME` varchar(40) NOT NULL,
  `SEX` varchar(10) NOT NULL DEFAULT 'Male',
  `BDAY` date NOT NULL,
  `BPLACE` text NOT NULL,
  `STATUS` varchar(30) NOT NULL,
  `AGE` int(30) NOT NULL,
  `NATIONALITY` varchar(40) NOT NULL,
  `RELIGION` varchar(255) NOT NULL,
  `CONTACT_NO` varchar(40) NOT NULL,
  `HOME_ADD` text NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  PRIMARY KEY (`S_ID`),
  UNIQUE KEY `IDNO` (`IDNO`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.teaching_assignments
CREATE TABLE IF NOT EXISTS `teaching_assignments` (
  `classid` int(11) NOT NULL DEFAULT 0,
  `class` varchar(40) DEFAULT NULL,
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `sectionid` int(11) DEFAULT NULL,
  `topic` varchar(80) DEFAULT NULL,
  `linkedclassid` int(11) DEFAULT NULL,
  `linktype` char(1) DEFAULT NULL,
  `credits` double NOT NULL DEFAULT 3,
  `displayedcredits` varchar(5) DEFAULT NULL,
  `slots` smallint(6) NOT NULL DEFAULT 30,
  `unitid` int(11) NOT NULL DEFAULT 0,
  `schedule` varchar(255) DEFAULT NULL,
  `restrictionsx` varchar(160) DEFAULT NULL,
  `minyearlevel` char(1) NOT NULL DEFAULT '1',
  `freeforalllater` tinyint(1) NOT NULL DEFAULT 0,
  `language` char(1) DEFAULT NULL,
  `instructors2` varchar(60) DEFAULT NULL,
  `concealinstructors` tinyint(1) NOT NULL DEFAULT 0,
  `issueclasscards` tinyint(1) NOT NULL DEFAULT 1,
  `enlisted` smallint(6) NOT NULL DEFAULT 0,
  `demand` smallint(6) NOT NULL DEFAULT 0,
  `freshmendemand` smallint(6) NOT NULL DEFAULT 0,
  `syllabus` varchar(255) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `gradessubmittedon` timestamp(6) NULL DEFAULT NULL,
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) NOT NULL,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `restrictions2` int(11) DEFAULT NULL,
  `restrictions` varchar(255) DEFAULT NULL,
  `instructors` text DEFAULT NULL,
  `oldinst` tinyint(1) NOT NULL DEFAULT 0,
  `actualcredits` double NOT NULL DEFAULT 0,
  `newclassid` int(11) DEFAULT NULL,
  `instructors3` varchar(1000) DEFAULT NULL,
  `labcreditsforpt` varchar(5) DEFAULT NULL,
  UNIQUE KEY `UQ_CLASSID` (`classid`),
  FULLTEXT KEY `FT_INSTRUCTORS` (`instructors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.teams_assigned_email_addresses
CREATE TABLE IF NOT EXISTS `teams_assigned_email_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(50) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.tempclassid
CREATE TABLE IF NOT EXISTS `tempclassid` (
  `classid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.tempclasslists
CREATE TABLE IF NOT EXISTS `tempclasslists` (
  `studentid` int(11) DEFAULT 0,
  `classid` int(11) DEFAULT 0,
  `initialgrade` varchar(4) DEFAULT NULL,
  `tuitionpaid` varchar(10) DEFAULT '0',
  `remarks` varchar(254) DEFAULT NULL,
  `inserttype` char(1) NOT NULL DEFAULT '',
  `insertedby` varchar(11) NOT NULL DEFAULT '0',
  `insertedon` timestamp NULL DEFAULT current_timestamp(),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` varchar(14) DEFAULT '00000000000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NULL DEFAULT NULL,
  `pet` tinyint(4) DEFAULT 0,
  FULLTEXT KEY `Index 1` (`initialgrade`,`remarks`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.tempfaculty
CREATE TABLE IF NOT EXISTS `tempfaculty` (
  `classid` int(11) NOT NULL,
  `instructors3` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.temptable
CREATE TABLE IF NOT EXISTS `temptable` (
  `studentid` int(11) DEFAULT 0,
  `classid` int(11) DEFAULT 0,
  `initialgrade` varchar(4) DEFAULT NULL,
  `tuitionpaid` decimal(10,0) DEFAULT 0,
  `remarks` varchar(254) DEFAULT NULL,
  `inserttype` char(1) NOT NULL,
  `insertedby` int(11) NOT NULL DEFAULT 0,
  `insertedon` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) NOT NULL DEFAULT 0,
  `validatedon` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `pet` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.tmp
CREATE TABLE IF NOT EXISTS `tmp` (
  `studentid` int(11) DEFAULT NULL,
  `classid` int(11) DEFAULT NULL,
  `initialgrade` varchar(4) DEFAULT NULL,
  `tuitionpaid` decimal(10,0) DEFAULT NULL,
  `remarks` varchar(254) DEFAULT NULL,
  `inserttype` char(50) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp(6) NULL DEFAULT NULL ON UPDATE current_timestamp(6),
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NULL DEFAULT '0000-00-00 00:00:00.000000',
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` datetime DEFAULT NULL,
  `pet` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.tmp2
CREATE TABLE IF NOT EXISTS `tmp2` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.torprinttemplate
CREATE TABLE IF NOT EXISTS `torprinttemplate` (
  `studentid` int(11) NOT NULL DEFAULT 0,
  `updatedon` datetime DEFAULT NULL,
  `postdata` blob DEFAULT NULL,
  `templatetype` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.uhs
CREATE TABLE IF NOT EXISTS `uhs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NOT NULL DEFAULT 0,
  `CBC` int(11) NOT NULL DEFAULT 0,
  `XRAY` int(11) NOT NULL DEFAULT 0,
  `recommendation` int(11) NOT NULL DEFAULT 0,
  `ROTCexempt` int(11) NOT NULL DEFAULT 0,
  `PEstreexempt` int(11) NOT NULL DEFAULT 0,
  `insertedBy` varchar(50) NOT NULL DEFAULT '0',
  `insertedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 2` (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.units
CREATE TABLE IF NOT EXISTS `units` (
  `unitid` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(8) NOT NULL,
  `unitname` varchar(80) NOT NULL,
  `unittype` char(1) DEFAULT NULL,
  `academiclevel` smallint(6) DEFAULT NULL,
  `offersclasses` tinyint(1) DEFAULT NULL,
  `parentunitid` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `totalitems` smallint(6) DEFAULT NULL,
  `facultyitems` int(11) DEFAULT NULL,
  `regstartcode` int(11) NOT NULL DEFAULT 0,
  `regendcode` int(11) NOT NULL DEFAULT 0,
  `remarks` varchar(254) DEFAULT NULL,
  `pseudodata` varchar(20) DEFAULT NULL,
  `active` int(1) DEFAULT 1,
  `unitlevel` int(1) DEFAULT 1,
  PRIMARY KEY (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.unitsubjects
CREATE TABLE IF NOT EXISTS `unitsubjects` (
  `unitid` int(11) NOT NULL DEFAULT 0,
  `subjectid` int(11) NOT NULL DEFAULT 0,
  `sinceaysem` int(11) DEFAULT NULL,
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `updatedon` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.unittypes
CREATE TABLE IF NOT EXISTS `unittypes` (
  `unittype` char(1) NOT NULL DEFAULT '',
  `label` varchar(20) DEFAULT NULL,
  `academiclevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`unittype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.updatestat
CREATE TABLE IF NOT EXISTS `updatestat` (
  `studentid` int(11) NOT NULL,
  `yearlevel` smallint(6) DEFAULT NULL,
  `programid` int(11) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `studtype` char(1) DEFAULT NULL,
  `aysem` int(5) DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.upload_requirements
CREATE TABLE IF NOT EXISTS `upload_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `file_prefix` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.useraccounts
CREATE TABLE IF NOT EXISTS `useraccounts` (
  `ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_NAME` varchar(255) NOT NULL,
  `ACCOUNT_USERNAME` varchar(255) NOT NULL,
  `ACCOUNT_PASSWORD` text NOT NULL,
  `ACCOUNT_TYPE` varchar(30) NOT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  UNIQUE KEY `ACCOUNT_USERNAME` (`ACCOUNT_USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.useraudit
CREATE TABLE IF NOT EXISTS `useraudit` (
  `userid` int(11) NOT NULL DEFAULT 0,
  `actiontime` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `action` varchar(254) NOT NULL DEFAULT '',
  `parameters` varchar(254) NOT NULL DEFAULT '',
  `remotehost` varchar(50) DEFAULT NULL,
  `remoteaddr` text DEFAULT NULL,
  PRIMARY KEY (`userid`,`actiontime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for table plmcrsdb.users
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) DEFAULT NULL,
  `employeeid` int(11) DEFAULT NULL,
  `studentcontactid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(20) NOT NULL DEFAULT '',
  `expiration` date DEFAULT '0000-00-00',
  `recallquestion` varchar(30) DEFAULT NULL,
  `recallanswer` varchar(30) DEFAULT NULL,
  `insertedby` int(11) DEFAULT NULL,
  `insertedon` timestamp(6) NULL DEFAULT current_timestamp(6),
  `updatedby` int(11) DEFAULT NULL,
  `updatedon` timestamp(6) NULL DEFAULT NULL ON UPDATE current_timestamp(6),
  `validatedby` int(11) DEFAULT NULL,
  `validatedon` timestamp(6) NULL DEFAULT NULL,
  `usertype` varchar(10) DEFAULT NULL,
  `mailpassword` varchar(20) DEFAULT NULL,
  `mailnickname` varchar(50) DEFAULT NULL,
  `mailactive` tinyint(1) DEFAULT NULL,
  `mailalternate` varchar(50) DEFAULT NULL,
  `pending` tinyint(1) DEFAULT NULL,
  `pdetails` varchar(50) DEFAULT NULL,
  `mailappalias` varchar(20) DEFAULT NULL,
  `mailactivatedon` timestamp(6) NULL DEFAULT NULL,
  `mailrequest` tinyint(1) DEFAULT NULL,
  `mailrequestedon` timestamp(6) NULL DEFAULT NULL,
  `mailnick2process` varchar(20) DEFAULT NULL,
  `mailnickname2` varchar(100) DEFAULT NULL,
  `user_enabled` tinyint(1) DEFAULT 0,
  `old_studentid` int(11) DEFAULT 0,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2016395457 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for view plmcrsdb.u_graduating_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `u_graduating_view` (
	`studentid` INT(11) NULL,
	`name` VARCHAR(70) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`aySem` INT(2) NULL,
	`unitid` INT(11) NULL,
	`unit` VARCHAR(8) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`program` VARCHAR(20) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`scholastic_status` VARCHAR(100) NULL COLLATE 'utf8mb4_unicode_520_ci'
) ENGINE=MyISAM;

-- Dumping structure for table plmcrsdb.validgrades
CREATE TABLE IF NOT EXISTS `validgrades` (
  `validgradeid` int(11) NOT NULL AUTO_INCREMENT,
  `validgrade` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(50) DEFAULT NULL,
  `validgradestatus` char(1) DEFAULT NULL,
  `insertedas` mediumtext DEFAULT NULL,
  `label` varchar(10) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`validgradeid`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for view plmcrsdb.view_all_graduating
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_all_graduating` (
	`studentid` INT(11) NULL,
	`name` VARCHAR(100) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`aySem` CHAR(11) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`unitid` INT(11) NULL,
	`unit` VARCHAR(15) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`program` VARCHAR(20) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`scholastic_status` VARCHAR(100) NULL COLLATE 'utf8mb4_unicode_520_ci',
	`evaluated` INT(11) NULL,
	`isGP` INT(1) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table plmcrsdb.withdrawn_students
CREATE TABLE IF NOT EXISTS `withdrawn_students` (
  `studentid` int(9) unsigned NOT NULL,
  `aysem` smallint(6) NOT NULL,
  `programid` int(11) NOT NULL,
  `unitid` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  KEY `FK_withdrawn_students_students` (`studentid`),
  KEY `FK_withdrawn_students_programs` (`programid`),
  KEY `FK_withdrawn_students_units` (`unitid`),
  CONSTRAINT `FK_withdrawn_students_programs` FOREIGN KEY (`programid`) REFERENCES `programs` (`programid`),
  CONSTRAINT `FK_withdrawn_students_students` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `FK_withdrawn_students_units` FOREIGN KEY (`unitid`) REFERENCES `units` (`unitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Data exporting was unselected.

-- Dumping structure for trigger plmcrsdb.classes_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `classes_after_delete` AFTER DELETE ON `classes` FOR EACH ROW BEGIN
	DELETE ta FROM
		plmcrsdb.teaching_assignments AS ta
	WHERE
		ta.classid = OLD.classid;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger plmcrsdb.classes_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `classes_after_insert` AFTER INSERT ON `classes` FOR EACH ROW CALL updateTeachingAssigments()//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger plmcrsdb.classes_after_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `classes_after_update` AFTER UPDATE ON `classes` FOR EACH ROW CALL updateTeachingAssigments()//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger plmcrsdb.student_data_trigger
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_data_trigger` AFTER INSERT ON `students` FOR EACH ROW BEGIN
    INSERT INTO `rfid_db`.`student_data` (
        `studentid`,
        `name`,
        `lastname`,
        `firstname`,
        `middlename`,
        `programtitle`,
        `unitname`,
        `g_name`,
        `g_address`,
        `g_contact`,
        `block`,
        `insertedon`,
        `imageblob`
    ) select distinct `s`.`studentid` AS `studentid`,concat(`s`.`firstname`,' ',
 if(substr(`s`.`middlename`,1,1) not in ('','-','_'), concat(substr(`s`.`middlename`,1,1),'. ') , ''),
 `s`.`lastname`,' ',`s`.`pedigree`) AS `name`,
`s`.`lastname` AS `lastname`,`s`.`firstname` AS `firstname`,`s`.`middlename` AS `middlename`,
`p`.`programtitle` AS `programtitle`,`u`.`unitname` AS `unitname`,`f`.`g_name` AS `g_name`,`f`.`g_address` AS `g_address`,
`f`.`g_contact` AS `g_contact`, UPPER(`b`.`block`) AS `block`,`s`.`insertedon` AS `insertedon`, i.student_image AS imageblob
 from ((((((`plmcrsdb`.`students` `s` 
 join `plmcrsdb`.`studentterms` `t` on((`t`.`studentid` = `s`.`studentid`))) 
 join `plmcrsdb`.`programs` `p` on((`p`.`programid` = `t`.`programid`))) 
 join `plmcrsdb`.`units` `u` on((`u`.`unitid` = `t`.`unitid`))) 
 join `plmat_db`.`freshmen_studnum` `m` on((`m`.`student_no` = `s`.`studentid`))) 
 left join `plmat_db`.`freshmen_family` `f` on((`f`.`freshmenid` = `m`.`freshmenid`))) 
 join `plmcrsdb`.`blocks` `b` on ((`b`.`blockid` = `t`.`blockid`)))
 left join `rfid_db`.`image_rfid` i on `i`.student_id = s.studentid
 where ((`s`.`studentid` like concat((select substr(cast(max(`s`.`studentid`) as char charset utf8mb4),1,4) from `plmcrsdb`.`students` `s`),'%')) 
 and (`m`.`withdrawn` = 0) 
 and (`t`.`recordstatus` = 'E') 
 and (`m`.`freshmenid` not in (20180,20181))) 
 order by `s`.`insertedon` ASC 
    ON DUPLICATE KEY UPDATE
    	  `imageblob`    = i.student_image;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger plmcrsdb.updateTaSubjects
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `updateTaSubjects` BEFORE UPDATE ON `classes` FOR EACH ROW BEGIN
UPDATE
    ta_subjects AS s
SET
    s.noStudents = new.enlisted
WHERE
    s.subjectCodeSection = CONCAT(NEW.class, '-', NEW.sectionid)
    AND
        s.aysem = SUBSTR(NEW.classid, 1, 5);    
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view plmcrsdb.get_undergrad
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_undergrad`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_undergrad` AS select distinct `s`.`studentid` AS `studentid`,concat(`s`.`firstname`,' ',if((substr(`s`.`middlename`,1,1) not in ('','-','_')),concat(substr(`s`.`middlename`,1,1),'. '),''),`s`.`lastname`,' ',`s`.`pedigree`) AS `name`,`s`.`lastname` AS `lastname`,`s`.`firstname` AS `firstname`,`s`.`middlename` AS `middlename`,`s`.`pedigree` AS `pedigree`,`p`.`programtitle` AS `programtitle`,`u`.`unitname` AS `unitname`,if((`b`.`block` not in ('','N','null')),`b`.`block`,'') AS `block` from ((((`students` `s` join `studentterms` `t` on((`t`.`studentid` = `s`.`studentid`))) join `programs` `p` on((`p`.`programid` = `t`.`programid`))) join `units` `u` on((`u`.`unitid` = `t`.`unitid`))) left join `blocks` `b` on((`b`.`blockid` = `t`.`blockid`))) where ((`t`.`recordstatus` = 'E') and (`t`.`aysem` = (select max(`studentterms`.`aysem`) from `studentterms`))) order by `s`.`insertedon` ;

-- Dumping structure for view plmcrsdb.gwa_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `gwa_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `gwa_view` AS select round((sum((`g`.`gradevalue` * `g`.`credits`)) / sum(`g`.`credits`)),2) AS `gwa`,`g`.`studentid` AS `studentid` from (`grades` `g` join `subjects` `s` on((`g`.`subjectid` = `s`.`subjectid`))) where ((not((`s`.`subject` like 'PE%'))) and (not((`s`.`subject` like 'NSTP%'))) and (`g`.`classid` like '20162%') and (`g`.`finalgrade` <> 'INC') and (`g`.`finalgrade` <> 'DO')) group by `g`.`studentid` order by `g`.`studentid` ;

-- Dumping structure for view plmcrsdb.student_info_for_id
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `student_info_for_id`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `student_info_for_id` AS select distinct `s`.`studentid` AS `studentid`,concat(`s`.`firstname`,' ',if((substr(`s`.`middlename`,1,1) not in ('','-','_')),concat(substr(`s`.`middlename`,1,1),'. '),''),`s`.`lastname`,' ',`s`.`pedigree`) AS `name`,`s`.`lastname` AS `lastname`,`s`.`firstname` AS `firstname`,`s`.`middlename` AS `middlename`,`s`.`pedigree` AS `pedigree`,`p`.`programtitle` AS `programtitle`,`u`.`unitname` AS `unitname`,`f`.`g_name` AS `g_name`,`f`.`g_address` AS `g_address`,`f`.`g_contact` AS `g_contact`,ucase(`b`.`block`) AS `block`,`s`.`insertedon` AS `insertedon` from ((((((`plmcrsdb`.`students` `s` join `plmcrsdb`.`studentterms` `t` on((`t`.`studentid` = `s`.`studentid`))) join `plmcrsdb`.`programs` `p` on((`p`.`programid` = `t`.`programid`))) join `plmcrsdb`.`units` `u` on((`u`.`unitid` = `t`.`unitid`))) join `plmat_db`.`freshmen_studnum` `m` on((`m`.`student_no` = `s`.`studentid`))) left join `plmat_db`.`freshmen_family` `f` on((`f`.`freshmenid` = `m`.`freshmenid`))) join `plmcrsdb`.`blocks` `b` on((`b`.`blockid` = `t`.`blockid`))) where ((`s`.`studentid` like concat((select substr(cast(max(`s`.`studentid`) as char charset utf8mb4),1,4) from `plmcrsdb`.`students` `s`),'%')) and (`m`.`withdrawn` = 0) and (`t`.`recordstatus` = 'E') and (`m`.`freshmenid` not in (20180,20181))) order by `s`.`insertedon` ;

-- Dumping structure for view plmcrsdb.u_graduating_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `u_graduating_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `u_graduating_view` AS select `gc`.`studentid` AS `studentid`,`s`.`name` AS `name`,`gc`.`aySem` AS `aySem`,`st`.`unitid` AS `unitid`,`u`.`unit` AS `unit`,`p`.`program` AS `program`,`ss`.`label` AS `scholastic_status` from (((((`graduating_class` `gc` join `students` `s` on((`gc`.`studentid` = `s`.`studentid`))) left join `studentterms` `st` on(((`gc`.`studentid` = `st`.`studentid`) and (`gc`.`aySem` = `st`.`aysem`)))) left join `units` `u` on((`st`.`unitid` = `u`.`unitid`))) left join `programs` `p` on((`st`.`programid` = `p`.`programid`))) left join `scholasticstatus` `ss` on((`st`.`scholastic_status` = `ss`.`scholasticid`))) where (`gc`.`graduating` = 1) order by `s`.`name` ;

-- Dumping structure for view plmcrsdb.view_all_graduating
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_all_graduating`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_all_graduating` AS select `ugv`.`studentid` AS `studentid`,`ugv`.`name` AS `name`,`ugv`.`aySem` AS `aySem`,`ugv`.`unitid` AS `unitid`,`ugv`.`unit` AS `unit`,`ugv`.`program` AS `program`,`ugv`.`scholastic_status` AS `scholastic_status`,coalesce(`es`.`evaluated`,0) AS `evaluated`,0 AS `isGP` from (`u_graduating_view` `ugv` left join `eval_students` `es` on(((`ugv`.`studentid` = `es`.`studentid`) and (`ugv`.`aySem` = `es`.`aysem`)))) union all select `gg`.`studentid` AS `studentid`,`gg`.`name` AS `name`,`gg`.`aysem` AS `aysem`,`gg`.`unitid` AS `unitid`,`gg`.`unit` AS `unit`,`gg`.`program` AS `program`,`gg`.`scholastic_status` AS `scholastic_status`,`gg`.`evaluated` AS `evaluated`,1 AS `isGP` from `g_graduating` `gg` order by `name` ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
