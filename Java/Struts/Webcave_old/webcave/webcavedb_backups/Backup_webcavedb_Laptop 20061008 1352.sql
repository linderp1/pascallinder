-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema webcavedb
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ webcavedb;
USE webcavedb;

--
-- Table structure for table `webcavedb`.`user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `name` varchar(8) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webcavedb`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`name`,`pass`,`email`) VALUES 
 ('abc','def','a.b@web.fr'),
 ('abcdddd','qwertz','a.b@web.fr'),
 ('asd','yxc','a.b@web.fr'),
 ('linderp1','5008apt19','linder.pascal@wanadoo.fr'),
 ('pal','palo','linder.pascal@wanadoo.fr'),
 ('papa','coco','a.b@d.com'),
 ('qqq','aaa','aaa'),
 ('qqqqaa','qqqqqq','aaa'),
 ('qwsa','qqq','www'),
 ('qwsaa','qqq','www'),
 ('visitor','salut','a.b@d.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Table structure for table `webcavedb`.`wine`
--

DROP TABLE IF EXISTS `wine`;
CREATE TABLE `wine` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `appellation` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `year` int(10) unsigned NOT NULL default '0',
  `volume` int(10) unsigned NOT NULL,
  `alcohol` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webcavedb`.`wine`
--

/*!40000 ALTER TABLE `wine` DISABLE KEYS */;
INSERT INTO `wine` (`id`,`name`,`appellation`,`type`,`year`,`volume`,`alcohol`) VALUES 
 (1,'Château Marcadis','Lalande de Pomerol','Bordeaux rouge',1997,75,12.5);
/*!40000 ALTER TABLE `wine` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
