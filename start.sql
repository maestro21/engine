SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `globals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

INSERT INTO `globals` (`id`, `name`, `value`) VALUES
(1, 'langs', 'en'),
(2, 'theme', 'demo'),
(3, 'deflang', 'en'),
(4, 'defmodule', 'pages');

CREATE TABLE IF NOT EXISTS `langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbr` text COLLATE utf8_unicode_ci,
  `name` text COLLATE utf8_unicode_ci,
  `isactive` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;


INSERT INTO `langs` (`id`, `abbr`, `name`, `isactive`) VALUES
(1, 'en', 'English', 1),
(2, 'ru', 'Русский', 1);

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text COLLATE utf8_unicode_ci,
  `isactive` int(11) DEFAULT '0',
  `defrights` int(11) DEFAULT '0',
  `defrights_allow` text COLLATE utf8_unicode_ci,
  `defrights_deny` text COLLATE utf8_unicode_ci,
  `fields` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

INSERT INTO `modules` (`id`, `url`, `isactive`, `defrights`, `defrights_allow`, `defrights_deny`, `fields`) VALUES
(1, 'users', 1, 0, 'login,register,logout,recover,view', '', 'name text text\r\npass pass pass\r\nemail text text\r\nisadmin int checkbox\r\nrights text multselect'),
(7, 'globals', 1, 0, '', '', ''),
(9, 'modules', 1, 0, '', '', 'url text text\r\nisactive int checkbox\r\ndefrights int checkbox\r\ndefrights_allow text text\r\ndefrights_deny text text\r\nfields text textarea'),
(10, 'langs', 1, 0, '', '', 'abbr text text\r\nname text text\r\nisactive int checkbox'),
(11, 'filemanager', 1, 0, '', '', 'path text text\r\ncontent text textarea'),
(12, 'pages', 1, 0, 'items,view', '', 'lang text select\r\nurl text text\r\ntitle text text\r\ntext text html');

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `text` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

INSERT INTO `pages` (`id`, `lang`, `url`, `title`, `text`) VALUES
(1, 'en', 'welcome', 'Welcome!', 'Welcome to the website powered by Maestro engine! '),
(5, 'ru', 'welcome', 'Добро пожаловать !', 'Добро пожаловать на сайт, созданный на движке Маэстро!');

CREATE TABLE IF NOT EXISTS `rightlist` (
  `module` text COLLATE utf8_unicode_ci NOT NULL,
  `function` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `pass` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci,
  `isadmin` int(11) DEFAULT '0',
  `rights` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2
