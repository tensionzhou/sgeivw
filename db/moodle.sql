-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 05 月 24 日 04:05
-- 服务器版本: 5.5.16
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `moodle`
--

-- --------------------------------------------------------

--
-- 表的结构 `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '100000',
  `timedue` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `numfiles` bigint(10) unsigned NOT NULL DEFAULT '0',
  `data1` text COLLATE utf8_unicode_ci,
  `data2` text COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` text COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) unsigned NOT NULL DEFAULT '0',
  `teacher` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemarked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) unsigned NOT NULL,
  `purpose` smallint(4) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `status` smallint(4) unsigned NOT NULL,
  `execution` smallint(4) unsigned NOT NULL,
  `executiontime` bigint(10) unsigned NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `nextstarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_backup_files`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_files` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backup_code` bigint(10) unsigned NOT NULL DEFAULT '0',
  `file_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `old_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `new_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backfile_bacfilpat_uix` (`backup_code`,`file_type`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store and recode ids to user and course files' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_backup_files_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_files_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `info` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_backfiletemp_bacconcomf_ix` (`backupid`,`contextid`,`component`,`filearea`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store files along the backup process. Note this table isn' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_backup_ids`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_ids` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backup_code` bigint(12) unsigned NOT NULL DEFAULT '0',
  `table_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `old_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `new_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `info` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backids_bactabold_uix` (`backup_code`,`table_name`,`old_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store and convert ids in backup/restore' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_backup_ids_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_ids_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemname` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `newitemid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `parentitemid` bigint(10) unsigned DEFAULT NULL,
  `info` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backidstemp_baciteite_uix` (`backupid`,`itemname`,`itemid`),
  KEY `mdl_backidstemp_bacitepar_ix` (`backupid`,`itemname`,`parentitemid`),
  KEY `mdl_backidstemp_bacitenew_ix` (`backupid`,`itemname`,`newitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all sort of ids along the backup process. Note this' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) unsigned NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) unsigned NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `version`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 2011112900, 0, 0, 1),
(2, 'admin_bookmarks', 2011112900, 0, 0, 1),
(3, 'blog_menu', 2011112900, 0, 0, 1),
(4, 'blog_recent', 2011112900, 0, 0, 1),
(5, 'blog_tags', 2011112900, 0, 0, 1),
(6, 'calendar_month', 2011112900, 0, 0, 1),
(7, 'calendar_upcoming', 2011112900, 0, 0, 1),
(8, 'comments', 2011112900, 0, 0, 1),
(9, 'community', 2011112900, 0, 0, 1),
(10, 'completionstatus', 2011112900, 0, 0, 1),
(11, 'course_list', 2011112900, 0, 0, 1),
(12, 'course_overview', 2011112900, 0, 0, 1),
(13, 'course_summary', 2011112900, 0, 0, 1),
(14, 'feedback', 2011112900, 0, 0, 0),
(15, 'glossary_random', 2011112900, 0, 0, 1),
(16, 'html', 2011112900, 0, 0, 1),
(17, 'login', 2011112900, 0, 0, 1),
(18, 'mentees', 2011112900, 0, 0, 1),
(19, 'messages', 2011112900, 0, 0, 1),
(20, 'mnet_hosts', 2011112900, 0, 0, 1),
(21, 'myprofile', 2011112900, 0, 0, 1),
(22, 'navigation', 2011112900, 0, 0, 1),
(23, 'news_items', 2011112900, 0, 0, 1),
(24, 'online_users', 2011112900, 0, 0, 1),
(25, 'participants', 2011112900, 0, 0, 1),
(26, 'private_files', 2011112900, 0, 0, 1),
(27, 'quiz_results', 2011112900, 0, 0, 1),
(28, 'recent_activity', 2011112900, 0, 0, 1),
(29, 'rss_client', 2011112900, 300, 0, 1),
(30, 'search_forums', 2011112900, 0, 0, 1),
(31, 'section_links', 2011112900, 0, 0, 1),
(32, 'selfcompletion', 2011112900, 0, 0, 1),
(33, 'settings', 2011112900, 0, 0, 1),
(34, 'site_main_menu', 2011112900, 0, 0, 1),
(35, 'social_activities', 2011112900, 0, 0, 1),
(36, 'tag_flickr', 2011112900, 0, 0, 1),
(37, 'tag_youtube', 2011112900, 0, 0, 1),
(38, 'tags', 2011112900, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) unsigned NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(10, 'private_files', 5, 0, 'my-index', '3', 'side-post', 0, ''),
(11, 'online_users', 5, 0, 'my-index', '3', 'side-post', 1, ''),
(12, 'course_overview', 5, 0, 'my-index', '3', 'content', 0, ''),
(13, 'course_list', 5, 0, 'my-index', '3', 'content', 1, ''),
(18, 'search_forums', 27, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(19, 'news_items', 27, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(20, 'calendar_upcoming', 27, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(21, 'recent_activity', 27, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(22, 'completionstatus', 27, 0, 'course-view-*', NULL, 'side-post', 4, ''),
(23, 'selfcompletion', 27, 0, 'course-view-*', NULL, 'side-post', 5, '');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) unsigned NOT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mdl_block_positions`
--

INSERT INTO `mdl_block_positions` (`id`, `blockinstanceid`, `contextid`, `pagetype`, `subpage`, `visible`, `region`, `weight`) VALUES
(1, 4, 5, 'my-index', '3', 1, 'side-pre', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `blogid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `timefetched` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) unsigned NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` text COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1337564815, '1', 1337572015),
(2, 'accesslib/dirtycontexts', '/1/3/20', 1337757772, '1', 1337764972),
(3, 'accesslib/dirtycontexts', '/1/3/20/21', 1337757770, '1', 1337764970),
(4, 'accesslib/dirtycontexts', '/1/3/20/22', 1337757770, '1', 1337764970),
(5, 'accesslib/dirtycontexts', '/1/3/20/23', 1337757770, '1', 1337764970),
(6, 'accesslib/dirtycontexts', '/1/3/20/24', 1337757770, '1', 1337764970),
(7, 'accesslib/dirtycontexts', '/1/3/20/25', 1337757771, '1', 1337764971),
(8, 'accesslib/dirtycontexts', '/1/26', 1337758013, '1', 1337765213),
(9, 'accesslib/dirtycontexts', '/1/26/27', 1337763215, '1', 1337770415),
(10, 'accesslib/dirtycontexts', '/1/26/27/33', 1337759371, '1', 1337766571);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_cache_text`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_text` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `formattedtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For storing temporary copies of processed texts' AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, '3422b9b9bbc2bc332353cc7c42990465', '<div class="no-overflow"><p>Final is everything!</p></div>', 1337759358),
(2, '93ee0a49fe2aa403d4792fad172e265e', '<div class="no-overflow"><p>Final is everything!</p></div>', 1337762120),
(3, 'b913a53ae5e35010950921f7a993aa56', '<div class="text_to_html">The default category for questions shared in context ''PE001''.</div>', 1337759282),
(4, 'dde2928f06359c2d959ef261eb80e88e', '<p>What is The ERP solution from SmarkGlobal?</p>', 1337759282),
(5, 'f5d9ed93463f2ddda021295a3373c7b1', '<p>The Best IT Corp. Ever?</p>', 1337759282),
(6, '01906881600d07b9e429ddc58c7d8061', '<div class="no-overflow"><div class="text_to_html"><p>moodletest</p></div></div>', 1337761536),
(7, 'ac1e8a42647e3c97ac1ca1a31b661f68', '<p>moodletest</p>', 1337761536),
(8, '5e5b3e72658fea459155ee8525996512', '<div class="no-overflow"><p>PE001</p></div>', 1337761536),
(9, 'fa104b654790f9b2b5d60457d3b936a4', '<div class="no-overflow"><p>PE001</p></div>', 1337759317),
(10, '8ac1c79be320cbcfa0a5ddee1b457478', '<div class="no-overflow"><div class="no-overflow"><p>Final is everything!</p></div></div>', 1337763193),
(11, '393ee555b560796aade1d04dc95ef35c', '<p>What is The ERP solution from SmarkGlobal?</p>', 1337759444),
(12, '8fa38e4b67145b87656bb586700d5bd1', '<p>Dynamics ERP</p>', 1337759444),
(13, '6c5b67dc049bb2543bbd0e4e70b4e77f', '<p>SALESFORCE</p>', 1337759444),
(14, '0504859f8b90814926b35eca3670fcf3', '<p>SAP r4</p>', 1337759444),
(15, 'a66800d4e69406a8f1c64aad7b362153', '<p>MOSES</p>', 1337761915),
(16, '458df6d8e5ae32c6b966bceb94d90925', '<p>The Best IT Corp. Ever?</p>', 1337759444),
(17, 'd447121957ae37cfa0b0c432feff3669', '<p>SmarkGlobal</p>', 1337761915),
(18, '21122e541b8e20b19aa08d5b49d72d7c', '<p>Alisoft</p>', 1337759444),
(19, '095c6a0b1cea26df6db2928ffd2c5664', '<p>Microsoft</p>', 1337759444),
(20, '8eb33d4a0aab51009eb412f3015f2372', '<p>SAP</p>', 1337759444),
(21, 'f2edf78cad1165ab6a7fad523ae1c643', '<p>Dynamics ERP</p>', 1337761915),
(22, '3eeb4a0f2b67e71e035650dc832b74a1', '<p>SALESFORCE</p>', 1337761915),
(23, '46d3fc0587527de62b7a36e8d4da01fb', '<p>SAP r4</p>', 1337761915),
(24, '1b8b7ff26427b0473ea1d8dc4268fcaf', '<p>MOSES</p>', 1337761915),
(25, '85b3e062ab9c0ba589e10343529ce0e7', '<p>What is The ERP solution from SmarkGlobal?</p>', 1337761915),
(26, 'ccbe506482bd177cb6fb40a21594b8ce', '<p>SmarkGlobal</p>', 1337761915),
(27, 'd8508b27bc936868269360e969f63e37', '<p>Alisoft</p>', 1337761915),
(28, '249182b4c8af735843904d5fe32d5cf4', '<p>Microsoft</p>', 1337761915),
(29, '852cb860506e6ffdc93158a380497fe4', '<p>SAP</p>', 1337761915),
(30, '48dc089bcc219f038a9c62c1368cae01', '<p>The Best IT Corp. Ever?</p>', 1337761915),
(31, 'd896d7743f7b00b223453fa2ba6d2342', '<p>Overall feedback here, Boundary 100%</p>', 1337761914);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) unsigned NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities' AUTO_INCREMENT=379 ;

--
-- 转存表中的数据 `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(39, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(40, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(41, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(42, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(43, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(44, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(45, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(46, 'moodle/role:review', 'read', 50, 'moodle', 8),
(47, 'moodle/role:override', 'write', 50, 'moodle', 28),
(48, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(49, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(50, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(51, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(52, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(53, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(54, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(55, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(56, 'moodle/course:create', 'write', 40, 'moodle', 4),
(57, 'moodle/course:request', 'write', 10, 'moodle', 0),
(58, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(59, 'moodle/course:update', 'write', 50, 'moodle', 4),
(60, 'moodle/course:view', 'read', 50, 'moodle', 0),
(61, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(62, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(63, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(64, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(65, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(66, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(67, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(68, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(69, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(70, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(71, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(72, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(73, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(74, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(76, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(77, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(78, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(79, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(80, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(81, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(82, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(83, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(84, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(85, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(86, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(87, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(88, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(89, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(90, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(91, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(92, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(93, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(94, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(95, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(96, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(97, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(98, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(99, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(100, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(101, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(102, 'moodle/question:add', 'write', 50, 'moodle', 20),
(103, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(104, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(105, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(106, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(107, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(108, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(109, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(110, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(111, 'moodle/question:config', 'write', 10, 'moodle', 2),
(112, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(113, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(114, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(115, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(116, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(117, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(118, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(119, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(120, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(121, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(122, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(123, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(124, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(125, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(126, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(127, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(128, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(129, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(130, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(131, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(132, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(133, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(134, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(135, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(136, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(137, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(138, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(139, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(140, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(141, 'moodle/block:view', 'read', 80, 'moodle', 0),
(142, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(143, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(144, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(145, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(146, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(147, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(148, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(149, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(150, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(151, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(152, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(153, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(154, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(155, 'moodle/community:add', 'write', 10, 'moodle', 0),
(156, 'moodle/community:download', 'write', 10, 'moodle', 0),
(157, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(158, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(159, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(160, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(161, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(162, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(163, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(164, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(165, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(166, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(167, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(168, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(169, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(170, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(171, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(172, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(173, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(174, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(175, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(176, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(177, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(178, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(179, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(180, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(181, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(182, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(183, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(184, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(185, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(186, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(187, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(188, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(189, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(190, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(191, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(192, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(193, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(194, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(195, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(196, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(197, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(198, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(199, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(200, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(201, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(202, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(203, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(204, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(205, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(206, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(207, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(208, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(209, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(210, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(211, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(212, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(213, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(214, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(215, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(216, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(217, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(218, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(219, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(220, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(221, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(222, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(223, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(224, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(225, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(226, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(227, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(228, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(229, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(230, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(231, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(232, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(233, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(234, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(235, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(236, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(237, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(238, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(239, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(240, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(241, 'mod/lti:grade', 'write', 70, 'mod_lti', 4),
(242, 'mod/lti:manage', 'write', 70, 'mod_lti', 4),
(243, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(244, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(245, 'mod/page:view', 'read', 70, 'mod_page', 0),
(246, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(247, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(248, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(249, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(250, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(251, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(252, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(253, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(254, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(255, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(256, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(257, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(258, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(259, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(260, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(261, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(262, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(263, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(264, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(265, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(266, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(267, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(268, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(269, 'mod/url:view', 'read', 70, 'mod_url', 0),
(270, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(271, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(272, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(273, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(274, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(275, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(276, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(277, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(278, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(279, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(280, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(281, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(282, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(283, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(284, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(285, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(286, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(287, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(288, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(289, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(290, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(291, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(292, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(293, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(294, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(295, 'enrol/authorize:config', 'write', 50, 'enrol_authorize', 0),
(296, 'enrol/authorize:manage', 'write', 50, 'enrol_authorize', 0),
(297, 'enrol/authorize:unenrol', 'write', 50, 'enrol_authorize', 0),
(298, 'enrol/authorize:unenrolself', 'write', 50, 'enrol_authorize', 0),
(299, 'enrol/authorize:managepayments', 'write', 10, 'enrol_authorize', 8),
(300, 'enrol/authorize:uploadcsv', 'write', 10, 'enrol_authorize', 4),
(301, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(302, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(303, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(304, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(305, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(306, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(307, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(308, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(309, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(310, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(311, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(312, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(313, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(314, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(315, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(316, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(317, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(318, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(319, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(320, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(321, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(322, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(323, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(324, 'report/completion:view', 'read', 50, 'report_completion', 8),
(325, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(326, 'report/log:view', 'read', 50, 'report_log', 8),
(327, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(328, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(329, 'report/outline:view', 'read', 50, 'report_outline', 8),
(330, 'report/participation:view', 'read', 50, 'report_participation', 8),
(331, 'report/progress:view', 'read', 50, 'report_progress', 8),
(332, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(333, 'report/security:view', 'read', 10, 'report_security', 2),
(334, 'report/stats:view', 'read', 50, 'report_stats', 8),
(335, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(336, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(337, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(338, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(339, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(340, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(341, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(342, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(343, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(344, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(345, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(346, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(347, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(348, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(349, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(350, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(351, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(352, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(353, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(354, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(355, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(356, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(357, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(358, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(359, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(360, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(361, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(362, 'repository/local:view', 'read', 70, 'repository_local', 0),
(363, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(364, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(365, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(366, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(367, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(368, 'repository/url:view', 'read', 70, 'repository_url', 0),
(369, 'repository/user:view', 'read', 70, 'repository_user', 0),
(370, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(371, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(372, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(373, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(374, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(375, 'tool/unittest:execute', 'write', 10, 'tool_unittest', 32),
(376, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(377, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(378, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showresults` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `optionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `text` text COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables' AUTO_INCREMENT=386 ;

--
-- 转存表中的数据 `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email,googleoauth2'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'standard'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'Ejk5EIPZNehVDyDUWGhglEJyBtl2DfUqlocalhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '283'),
(21, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(22, 'version', '2011120503'),
(23, 'enableoutcomes', '1'),
(24, 'usecomments', '1'),
(25, 'usetags', '1'),
(26, 'enablenotes', '1'),
(27, 'enableportfolios', '0'),
(28, 'enablewebservices', '0'),
(29, 'messaging', '1'),
(30, 'messaginghidereadnotifications', '0'),
(31, 'messagingdeletereadnotificationsdelay', '604800'),
(32, 'enablestats', '0'),
(33, 'enablerssfeeds', '0'),
(34, 'bloglevel', '4'),
(35, 'enablecompletion', '1'),
(36, 'enableavailability', '1'),
(37, 'enableplagiarism', '0'),
(38, 'autologinguests', '0'),
(39, 'hiddenuserfields', ''),
(40, 'showuseridentity', 'email'),
(41, 'enablegravatar', '0'),
(42, 'enablecourserequests', '0'),
(43, 'defaultrequestcategory', '1'),
(44, 'courserequestnotify', ''),
(45, 'grade_profilereport', 'user'),
(46, 'grade_aggregationposition', '1'),
(47, 'grade_includescalesinaggregation', '1'),
(48, 'grade_hiddenasdate', '0'),
(49, 'gradepublishing', '0'),
(50, 'grade_export_displaytype', '1'),
(51, 'grade_export_decimalpoints', '2'),
(52, 'grade_navmethod', '0'),
(53, 'gradeexport', ''),
(54, 'unlimitedgrades', '0'),
(55, 'grade_hideforcedsettings', '1'),
(56, 'grade_aggregation', '11'),
(57, 'grade_aggregation_flag', '0'),
(58, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(59, 'grade_aggregateonlygraded', '1'),
(60, 'grade_aggregateonlygraded_flag', '2'),
(61, 'grade_aggregateoutcomes', '0'),
(62, 'grade_aggregateoutcomes_flag', '2'),
(63, 'grade_aggregatesubcats', '0'),
(64, 'grade_aggregatesubcats_flag', '2'),
(65, 'grade_keephigh', '0'),
(66, 'grade_keephigh_flag', '3'),
(67, 'grade_droplow', '0'),
(68, 'grade_droplow_flag', '2'),
(69, 'grade_displaytype', '1'),
(70, 'grade_decimalpoints', '2'),
(71, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(72, 'grade_report_studentsperpage', '100'),
(73, 'grade_report_quickgrading', '1'),
(74, 'grade_report_showquickfeedback', '0'),
(75, 'grade_report_fixedstudents', '0'),
(76, 'grade_report_meanselection', '1'),
(77, 'grade_report_enableajax', '0'),
(78, 'grade_report_showcalculations', '0'),
(79, 'grade_report_showeyecons', '0'),
(80, 'grade_report_showaverages', '1'),
(81, 'grade_report_showlocks', '0'),
(82, 'grade_report_showranges', '0'),
(83, 'grade_report_showanalysisicon', '1'),
(84, 'grade_report_showuserimage', '1'),
(85, 'grade_report_showactivityicons', '1'),
(86, 'grade_report_shownumberofgrades', '0'),
(87, 'grade_report_averagesdisplaytype', 'inherit'),
(88, 'grade_report_rangesdisplaytype', 'inherit'),
(89, 'grade_report_averagesdecimalpoints', 'inherit'),
(90, 'grade_report_rangesdecimalpoints', 'inherit'),
(91, 'grade_report_overview_showrank', '0'),
(92, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(93, 'grade_report_user_showrank', '0'),
(94, 'grade_report_user_showpercentage', '1'),
(95, 'grade_report_user_showgrade', '1'),
(96, 'grade_report_user_showfeedback', '1'),
(97, 'grade_report_user_showrange', '1'),
(98, 'grade_report_user_showweight', '0'),
(99, 'grade_report_user_showaverage', '0'),
(100, 'grade_report_user_showlettergrade', '0'),
(101, 'grade_report_user_rangedecimals', '0'),
(102, 'grade_report_user_showhiddenitems', '1'),
(103, 'grade_report_user_showtotalsifcontainhidden', '0'),
(104, 'timezone', '99'),
(105, 'forcetimezone', '99'),
(106, 'country', '0'),
(107, 'defaultcity', ''),
(108, 'geoipfile', 'C:\\Zend\\Apache2\\moodledata/geoip/GeoLiteCity.dat'),
(109, 'googlemapkey', ''),
(110, 'allcountrycodes', ''),
(111, 'autolang', '1'),
(112, 'lang', 'en'),
(113, 'langmenu', '1'),
(114, 'langlist', ''),
(115, 'langcache', '1'),
(116, 'langstringcache', '1'),
(117, 'locale', ''),
(118, 'latinexcelexport', '0'),
(120, 'authpreventaccountcreation', '0'),
(121, 'loginpageautofocus', '0'),
(122, 'guestloginbutton', '1'),
(123, 'alternateloginurl', ''),
(124, 'forgottenpasswordurl', ''),
(125, 'auth_instructions', ''),
(126, 'allowemailaddresses', ''),
(127, 'denyemailaddresses', ''),
(128, 'verifychangedemail', '1'),
(129, 'recaptchapublickey', ''),
(130, 'recaptchaprivatekey', ''),
(131, 'sitedefaultlicense', 'allrightsreserved'),
(132, 'cachetext', '60'),
(133, 'filteruploadedfiles', '0'),
(134, 'filtermatchoneperpage', '0'),
(135, 'filtermatchonepertext', '0'),
(136, 'filter_multilang_force_old', '0'),
(137, 'filter_mediaplugin_enable_youtube', '1'),
(138, 'filter_mediaplugin_enable_vimeo', '0'),
(139, 'filter_mediaplugin_enable_mp3', '1'),
(140, 'filter_mediaplugin_enable_flv', '1'),
(141, 'filter_mediaplugin_enable_swf', '1'),
(142, 'filter_mediaplugin_enable_html5audio', '0'),
(143, 'filter_mediaplugin_enable_html5video', '0'),
(144, 'filter_mediaplugin_enable_qt', '1'),
(145, 'filter_mediaplugin_enable_wmp', '1'),
(146, 'filter_mediaplugin_enable_rm', '1'),
(147, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(148, 'filter_tex_latexbackground', '#FFFFFF'),
(149, 'filter_tex_density', '120'),
(150, 'filter_tex_pathlatex', '"c:\\texmf\\miktex\\bin\\latex.exe" '),
(151, 'filter_tex_pathdvips', '"c:\\texmf\\miktex\\bin\\dvips.exe" '),
(152, 'filter_tex_pathconvert', '"c:\\imagemagick\\convert.exe" '),
(153, 'filter_tex_convertformat', 'gif'),
(154, 'filter_censor_badwords', ''),
(155, 'portfolio_moderate_filesize_threshold', '1048576'),
(156, 'portfolio_high_filesize_threshold', '5242880'),
(157, 'portfolio_moderate_db_threshold', '20'),
(158, 'portfolio_high_db_threshold', '50'),
(159, 'repositorycacheexpire', '120'),
(160, 'repositoryallowexternallinks', '1'),
(161, 'legacyfilesinnewcourses', '0'),
(162, 'enablewsdocumentation', '0'),
(163, 'allowbeforeblock', '0'),
(164, 'allowedip', ''),
(165, 'blockedip', ''),
(166, 'protectusernames', '1'),
(167, 'forcelogin', '0'),
(168, 'forceloginforprofiles', '1'),
(169, 'forceloginforprofileimage', '0'),
(170, 'opentogoogle', '0'),
(171, 'maxbytes', '0'),
(172, 'userquota', '104857600'),
(173, 'allowobjectembed', '0'),
(174, 'enabletrusttext', '0'),
(175, 'maxeditingtime', '1800'),
(176, 'fullnamedisplay', 'language'),
(177, 'extendedusernamechars', '0'),
(178, 'sitepolicy', ''),
(179, 'sitepolicyguest', ''),
(180, 'keeptagnamecase', '1'),
(181, 'profilesforenrolledusersonly', '1'),
(182, 'cronclionly', '0'),
(183, 'cronremotepassword', ''),
(184, 'passwordpolicy', '1'),
(185, 'minpasswordlength', '1'),
(186, 'minpassworddigits', '0'),
(187, 'minpasswordlower', '0'),
(188, 'minpasswordupper', '0'),
(189, 'minpasswordnonalphanum', '0'),
(190, 'maxconsecutiveidentchars', '0'),
(191, 'groupenrolmentkeypolicy', '1'),
(192, 'disableuserimages', '0'),
(193, 'emailchangeconfirmation', '1'),
(194, 'rememberusername', '2'),
(195, 'strictformsrequired', '0'),
(196, 'loginhttps', '0'),
(197, 'cookiesecure', '0'),
(198, 'cookiehttponly', '0'),
(199, 'allowframembedding', '0'),
(200, 'loginpasswordautocomplete', '0'),
(201, 'restrictmodulesfor', 'none'),
(202, 'restrictbydefault', '0'),
(203, 'displayloginfailures', ''),
(204, 'notifyloginfailures', ''),
(205, 'notifyloginthreshold', '10'),
(206, 'runclamonupload', '0'),
(207, 'pathtoclam', ''),
(208, 'quarantinedir', ''),
(209, 'clamfailureonupload', 'donothing'),
(210, 'themelist', ''),
(211, 'themedesignermode', '0'),
(212, 'allowuserthemes', '0'),
(213, 'allowcoursethemes', '0'),
(214, 'allowcategorythemes', '0'),
(215, 'allowthemechangeonurl', '0'),
(216, 'allowuserblockhiding', '1'),
(217, 'allowblockstodock', '1'),
(218, 'custommenuitems', ''),
(219, 'enabledevicedetection', '1'),
(220, 'devicedetectregex', '[]'),
(221, 'calendar_adminseesall', '0'),
(222, 'calendar_site_timeformat', '0'),
(223, 'calendar_startwday', '0'),
(224, 'calendar_weekend', '65'),
(225, 'calendar_lookahead', '21'),
(226, 'calendar_maxevents', '10'),
(227, 'enablecalendarexport', '1'),
(228, 'calendar_exportsalt', 'sGeFHbr98S0rl9Zr9PLJq9yTGFrSJBIERhGnNtnNjG1Ph4OntiXGXMLhOJ3u'),
(229, 'useblogassociations', '1'),
(230, 'useexternalblogs', '1'),
(231, 'externalblogcrontime', '86400'),
(232, 'maxexternalblogsperuser', '1'),
(233, 'blogusecomments', '1'),
(234, 'blogshowcommentscount', '1'),
(235, 'defaulthomepage', '0'),
(236, 'navshowcategories', '1'),
(237, 'navshowallcourses', '0'),
(238, 'navcourselimit', '20'),
(239, 'navlinkcoursesections', '0'),
(240, 'usesitenameforsitepages', '0'),
(241, 'navadduserpostslinks', '1'),
(242, 'formatstringstriptags', '1'),
(243, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(244, 'docroot', 'http://docs.moodle.org'),
(245, 'doctonewwindow', '0'),
(246, 'courselistshortnames', '0'),
(247, 'enableajax', '1'),
(248, 'useexternalyui', '0'),
(249, 'yuicomboloading', '1'),
(250, 'cachejs', '1'),
(251, 'enablecourseajax', '1'),
(252, 'additionalhtmlhead', ''),
(253, 'additionalhtmltopofbody', ''),
(254, 'additionalhtmlfooter', ''),
(255, 'gdversion', '2'),
(256, 'pathtodu', ''),
(257, 'aspellpath', ''),
(258, 'pathtodot', ''),
(259, 'supportpage', ''),
(260, 'dbsessions', '1'),
(261, 'sessioncookie', ''),
(262, 'sessioncookiepath', ''),
(263, 'sessioncookiedomain', ''),
(264, 'statsfirstrun', 'none'),
(265, 'statsmaxruntime', '0'),
(266, 'statsruntimedays', '31'),
(267, 'statsruntimestarthour', '0'),
(268, 'statsruntimestartminute', '0'),
(269, 'statsuserthreshold', '0'),
(270, 'slasharguments', '1'),
(271, 'getremoteaddrconf', '0'),
(272, 'proxyhost', ''),
(273, 'proxyport', '0'),
(274, 'proxytype', 'HTTP'),
(275, 'proxyuser', ''),
(276, 'proxypassword', ''),
(277, 'proxybypass', 'localhost, 127.0.0.1'),
(278, 'maintenance_enabled', '0'),
(279, 'maintenance_message', ''),
(280, 'deleteunconfirmed', '168'),
(281, 'deleteincompleteusers', '0'),
(282, 'logguests', '1'),
(283, 'loglifetime', '0'),
(284, 'disablegradehistory', '0'),
(285, 'gradehistorylifetime', '0'),
(286, 'numcoursesincombo', '500'),
(287, 'extramemorylimit', '512M'),
(288, 'curlcache', '120'),
(289, 'curltimeoutkbitrate', '56'),
(290, 'enablesafebrowserintegration', '0'),
(291, 'enablegroupmembersonly', '0'),
(292, 'debug', '0'),
(293, 'debugdisplay', '0'),
(294, 'xmlstrictheaders', '0'),
(295, 'debugsmtp', '0'),
(296, 'perfdebug', '7'),
(297, 'debugstringids', '0'),
(298, 'debugvalidators', '0'),
(299, 'debugpageinfo', '0'),
(300, 'release', '2.2.3 (Build: 20120514)'),
(301, 'jsrev', '282'),
(303, 'notloggedinroleid', '6'),
(304, 'guestroleid', '6'),
(305, 'defaultuserroleid', '7'),
(306, 'creatornewroleid', '3'),
(307, 'restorernewroleid', '3'),
(308, 'gradebookroles', '5'),
(309, 'assignment_maxbytes', '1048576'),
(310, 'assignment_itemstocount', '1'),
(311, 'assignment_showrecentsubmissions', '1'),
(312, 'chat_method', 'ajax'),
(313, 'chat_refresh_userlist', '10'),
(314, 'chat_old_ping', '35'),
(315, 'chat_refresh_room', '5'),
(316, 'chat_normal_updatemode', 'jsupdate'),
(317, 'chat_serverhost', 'localhost'),
(318, 'chat_serverip', '127.0.0.1'),
(319, 'chat_serverport', '9111'),
(320, 'chat_servermax', '100'),
(321, 'data_enablerssfeeds', '0'),
(322, 'feedback_allowfullanonymous', '0'),
(323, 'forum_displaymode', '3'),
(324, 'forum_replytouser', '1'),
(325, 'forum_shortpost', '300'),
(326, 'forum_longpost', '600'),
(327, 'forum_manydiscussions', '100'),
(328, 'forum_maxbytes', '512000'),
(329, 'forum_maxattachments', '9'),
(330, 'forum_trackreadposts', '1'),
(331, 'forum_oldpostdays', '14'),
(332, 'forum_usermarksread', '0'),
(333, 'forum_cleanreadtime', '2'),
(334, 'digestmailtime', '17'),
(335, 'forum_enablerssfeeds', '0'),
(336, 'forum_enabletimedposts', '0'),
(337, 'glossary_entbypage', '10'),
(338, 'glossary_dupentries', '0'),
(339, 'glossary_allowcomments', '0'),
(340, 'glossary_linkbydefault', '1'),
(341, 'glossary_defaultapproval', '1'),
(342, 'glossary_enablerssfeeds', '0'),
(343, 'glossary_linkentries', '0'),
(344, 'glossary_casesensitive', '0'),
(345, 'glossary_fullmatch', '0'),
(346, 'lesson_slideshowwidth', '640'),
(347, 'lesson_slideshowheight', '480'),
(348, 'lesson_slideshowbgcolor', '#FFFFFF'),
(349, 'lesson_mediawidth', '640'),
(350, 'lesson_mediaheight', '480'),
(351, 'lesson_mediaclose', '0'),
(352, 'lesson_maxhighscores', '10'),
(353, 'lesson_maxanswers', '4'),
(354, 'lesson_defaultnextpage', '0'),
(355, 'block_course_list_adminview', 'all'),
(356, 'block_course_list_hideallcourseslink', '0'),
(357, 'block_online_users_timetosee', '5'),
(358, 'block_rss_client_num_entries', '5'),
(359, 'block_rss_client_timeout', '30'),
(360, 'block_tags_showcoursetags', '0'),
(361, 'jabberhost', ''),
(362, 'jabberserver', ''),
(363, 'jabberusername', ''),
(364, 'jabberpassword', ''),
(365, 'jabberport', '5222'),
(366, 'smtphosts', ''),
(367, 'smtpuser', ''),
(368, 'smtppass', ''),
(369, 'smtpmaxbulk', '1'),
(370, 'noreplyaddress', 'noreply@localhost'),
(371, 'sitemailcharset', '0'),
(372, 'allowusermailcharset', '0'),
(373, 'mailnewline', 'LF'),
(374, 'profileroles', '3,4,5'),
(375, 'defaultallowedmodules', ''),
(376, 'coursecontact', '3'),
(377, 'frontpage', '1'),
(378, 'frontpageloggedin', '1'),
(379, 'maxcategorydepth', '0'),
(380, 'commentsperpage', '15'),
(381, 'coursesperpage', '20'),
(382, 'defaultfrontpageroleid', '8'),
(383, 'supportname', 'Admin User'),
(384, 'supportemail', 'admin@admin.com'),
(385, 'registerauth', '');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  `oldvalue` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=770 ;

--
-- 转存表中的数据 `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1337328152, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1337328152, NULL, 'usecomments', '1', NULL),
(3, 0, 1337328152, NULL, 'usetags', '1', NULL),
(4, 0, 1337328152, NULL, 'enablenotes', '1', NULL),
(5, 0, 1337328152, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1337328152, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1337328153, NULL, 'messaging', '1', NULL),
(8, 0, 1337328153, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1337328153, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1337328153, NULL, 'enablestats', '0', NULL),
(11, 0, 1337328153, NULL, 'enablerssfeeds', '0', NULL),
(12, 0, 1337328153, NULL, 'bloglevel', '4', NULL),
(13, 0, 1337328153, NULL, 'enablecompletion', '0', NULL),
(14, 0, 1337328153, NULL, 'enableavailability', '0', NULL),
(15, 0, 1337328153, NULL, 'enableplagiarism', '0', NULL),
(16, 0, 1337328153, NULL, 'autologinguests', '0', NULL),
(17, 0, 1337328153, NULL, 'hiddenuserfields', '', NULL),
(18, 0, 1337328153, NULL, 'showuseridentity', 'email', NULL),
(19, 0, 1337328153, NULL, 'enablegravatar', '0', NULL),
(20, 0, 1337328153, 'moodlecourse', 'format', 'weeks', NULL),
(21, 0, 1337328153, 'moodlecourse', 'maxsections', '52', NULL),
(22, 0, 1337328153, 'moodlecourse', 'numsections', '10', NULL),
(23, 0, 1337328153, 'moodlecourse', 'hiddensections', '0', NULL),
(24, 0, 1337328153, 'moodlecourse', 'newsitems', '5', NULL),
(25, 0, 1337328153, 'moodlecourse', 'showgrades', '1', NULL),
(26, 0, 1337328153, 'moodlecourse', 'showreports', '0', NULL),
(27, 0, 1337328154, 'moodlecourse', 'maxbytes', '104857600', NULL),
(28, 0, 1337328154, 'moodlecourse', 'groupmode', '0', NULL),
(29, 0, 1337328154, 'moodlecourse', 'groupmodeforce', '0', NULL),
(30, 0, 1337328154, 'moodlecourse', 'visible', '1', NULL),
(31, 0, 1337328154, 'moodlecourse', 'lang', '', NULL),
(32, 0, 1337328154, 'moodlecourse', 'enablecompletion', '0', NULL),
(33, 0, 1337328154, 'moodlecourse', 'completionstartonenrol', '0', NULL),
(34, 0, 1337328154, NULL, 'enablecourserequests', '0', NULL),
(35, 0, 1337328154, NULL, 'defaultrequestcategory', '1', NULL),
(36, 0, 1337328154, NULL, 'courserequestnotify', '', NULL),
(37, 0, 1337328154, 'backup', 'loglifetime', '30', NULL),
(38, 0, 1337328154, 'backup', 'backup_general_users', '1', NULL),
(39, 0, 1337328154, 'backup', 'backup_general_users_locked', '0', NULL),
(40, 0, 1337328154, 'backup', 'backup_general_anonymize', '0', NULL),
(41, 0, 1337328154, 'backup', 'backup_general_anonymize_locked', '0', NULL),
(42, 0, 1337328154, 'backup', 'backup_general_role_assignments', '1', NULL),
(43, 0, 1337328154, 'backup', 'backup_general_role_assignments_locked', '0', NULL),
(44, 0, 1337328154, 'backup', 'backup_general_activities', '1', NULL),
(45, 0, 1337328154, 'backup', 'backup_general_activities_locked', '0', NULL),
(46, 0, 1337328154, 'backup', 'backup_general_blocks', '1', NULL),
(47, 0, 1337328154, 'backup', 'backup_general_blocks_locked', '0', NULL),
(48, 0, 1337328154, 'backup', 'backup_general_filters', '1', NULL),
(49, 0, 1337328155, 'backup', 'backup_general_filters_locked', '0', NULL),
(50, 0, 1337328155, 'backup', 'backup_general_comments', '1', NULL),
(51, 0, 1337328155, 'backup', 'backup_general_comments_locked', '0', NULL),
(52, 0, 1337328155, 'backup', 'backup_general_userscompletion', '1', NULL),
(53, 0, 1337328155, 'backup', 'backup_general_userscompletion_locked', '0', NULL),
(54, 0, 1337328155, 'backup', 'backup_general_logs', '0', NULL),
(55, 0, 1337328155, 'backup', 'backup_general_logs_locked', '0', NULL),
(56, 0, 1337328155, 'backup', 'backup_general_histories', '0', NULL),
(57, 0, 1337328155, 'backup', 'backup_general_histories_locked', '0', NULL),
(58, 0, 1337328155, 'backup', 'backup_auto_active', '0', NULL),
(59, 0, 1337328155, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(60, 0, 1337328155, 'backup', 'backup_auto_hour', '0', NULL),
(61, 0, 1337328155, 'backup', 'backup_auto_minute', '0', NULL),
(62, 0, 1337328155, 'backup', 'backup_auto_storage', '0', NULL),
(63, 0, 1337328155, 'backup', 'backup_auto_destination', '', NULL),
(64, 0, 1337328155, 'backup', 'backup_auto_keep', '1', NULL),
(65, 0, 1337328155, 'backup', 'backup_shortname', '0', NULL),
(66, 0, 1337328155, 'backup', 'backup_auto_users', '1', NULL),
(67, 0, 1337328155, 'backup', 'backup_auto_role_assignments', '1', NULL),
(68, 0, 1337328155, 'backup', 'backup_auto_activities', '1', NULL),
(69, 0, 1337328155, 'backup', 'backup_auto_blocks', '1', NULL),
(70, 0, 1337328155, 'backup', 'backup_auto_filters', '1', NULL),
(71, 0, 1337328155, 'backup', 'backup_auto_comments', '1', NULL),
(72, 0, 1337328156, 'backup', 'backup_auto_userscompletion', '1', NULL),
(73, 0, 1337328156, 'backup', 'backup_auto_logs', '0', NULL),
(74, 0, 1337328156, 'backup', 'backup_auto_histories', '0', NULL),
(75, 0, 1337328156, NULL, 'grade_profilereport', 'user', NULL),
(76, 0, 1337328156, NULL, 'grade_aggregationposition', '1', NULL),
(77, 0, 1337328156, NULL, 'grade_includescalesinaggregation', '1', NULL),
(78, 0, 1337328156, NULL, 'grade_hiddenasdate', '0', NULL),
(79, 0, 1337328156, NULL, 'gradepublishing', '0', NULL),
(80, 0, 1337328156, NULL, 'grade_export_displaytype', '1', NULL),
(81, 0, 1337328156, NULL, 'grade_export_decimalpoints', '2', NULL),
(82, 0, 1337328156, NULL, 'grade_navmethod', '0', NULL),
(83, 0, 1337328156, NULL, 'gradeexport', '', NULL),
(84, 0, 1337328156, NULL, 'unlimitedgrades', '0', NULL),
(85, 0, 1337328156, NULL, 'grade_hideforcedsettings', '1', NULL),
(86, 0, 1337328156, NULL, 'grade_aggregation', '11', NULL),
(87, 0, 1337328156, NULL, 'grade_aggregation_flag', '0', NULL),
(88, 0, 1337328156, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(89, 0, 1337328156, NULL, 'grade_aggregateonlygraded', '1', NULL),
(90, 0, 1337328156, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(91, 0, 1337328157, NULL, 'grade_aggregateoutcomes', '0', NULL),
(92, 0, 1337328157, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(93, 0, 1337328157, NULL, 'grade_aggregatesubcats', '0', NULL),
(94, 0, 1337328157, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(95, 0, 1337328157, NULL, 'grade_keephigh', '0', NULL),
(96, 0, 1337328157, NULL, 'grade_keephigh_flag', '3', NULL),
(97, 0, 1337328157, NULL, 'grade_droplow', '0', NULL),
(98, 0, 1337328157, NULL, 'grade_droplow_flag', '2', NULL),
(99, 0, 1337328157, NULL, 'grade_displaytype', '1', NULL),
(100, 0, 1337328157, NULL, 'grade_decimalpoints', '2', NULL),
(101, 0, 1337328157, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(102, 0, 1337328157, NULL, 'grade_report_studentsperpage', '100', NULL),
(103, 0, 1337328157, NULL, 'grade_report_quickgrading', '1', NULL),
(104, 0, 1337328157, NULL, 'grade_report_showquickfeedback', '0', NULL),
(105, 0, 1337328157, NULL, 'grade_report_fixedstudents', '0', NULL),
(106, 0, 1337328157, NULL, 'grade_report_meanselection', '1', NULL),
(107, 0, 1337328157, NULL, 'grade_report_enableajax', '0', NULL),
(108, 0, 1337328157, NULL, 'grade_report_showcalculations', '0', NULL),
(109, 0, 1337328157, NULL, 'grade_report_showeyecons', '0', NULL),
(110, 0, 1337328157, NULL, 'grade_report_showaverages', '1', NULL),
(111, 0, 1337328157, NULL, 'grade_report_showlocks', '0', NULL),
(112, 0, 1337328157, NULL, 'grade_report_showranges', '0', NULL),
(113, 0, 1337328157, NULL, 'grade_report_showanalysisicon', '1', NULL),
(114, 0, 1337328157, NULL, 'grade_report_showuserimage', '1', NULL),
(115, 0, 1337328158, NULL, 'grade_report_showactivityicons', '1', NULL),
(116, 0, 1337328158, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(117, 0, 1337328158, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(118, 0, 1337328158, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(119, 0, 1337328158, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(120, 0, 1337328158, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(121, 0, 1337328158, NULL, 'grade_report_overview_showrank', '0', NULL),
(122, 0, 1337328158, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(123, 0, 1337328158, NULL, 'grade_report_user_showrank', '0', NULL),
(124, 0, 1337328158, NULL, 'grade_report_user_showpercentage', '1', NULL),
(125, 0, 1337328158, NULL, 'grade_report_user_showgrade', '1', NULL),
(126, 0, 1337328158, NULL, 'grade_report_user_showfeedback', '1', NULL),
(127, 0, 1337328158, NULL, 'grade_report_user_showrange', '1', NULL),
(128, 0, 1337328158, NULL, 'grade_report_user_showweight', '0', NULL),
(129, 0, 1337328158, NULL, 'grade_report_user_showaverage', '0', NULL),
(130, 0, 1337328158, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(131, 0, 1337328158, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(132, 0, 1337328158, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(133, 0, 1337328158, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(134, 0, 1337328158, NULL, 'timezone', '99', NULL),
(135, 0, 1337328158, NULL, 'forcetimezone', '99', NULL),
(136, 0, 1337328158, NULL, 'country', '0', NULL),
(137, 0, 1337328158, NULL, 'defaultcity', '', NULL),
(138, 0, 1337328159, NULL, 'geoipfile', 'C:\\Zend\\Apache2\\moodledata/geoip/GeoLiteCity.dat', NULL),
(139, 0, 1337328159, NULL, 'googlemapkey', '', NULL),
(140, 0, 1337328159, NULL, 'allcountrycodes', '', NULL),
(141, 0, 1337328159, NULL, 'autolang', '1', NULL),
(142, 0, 1337328159, NULL, 'lang', 'en', NULL),
(143, 0, 1337328159, NULL, 'langmenu', '1', NULL),
(144, 0, 1337328159, NULL, 'langlist', '', NULL),
(145, 0, 1337328159, NULL, 'langcache', '1', NULL),
(146, 0, 1337328159, NULL, 'langstringcache', '1', NULL),
(147, 0, 1337328159, NULL, 'locale', '', NULL),
(148, 0, 1337328159, NULL, 'latinexcelexport', '0', NULL),
(149, 0, 1337328159, NULL, 'registerauth', '', NULL),
(150, 0, 1337328159, NULL, 'authpreventaccountcreation', '0', NULL),
(151, 0, 1337328159, NULL, 'loginpageautofocus', '0', NULL),
(152, 0, 1337328159, NULL, 'guestloginbutton', '1', NULL),
(153, 0, 1337328159, NULL, 'alternateloginurl', '', NULL),
(154, 0, 1337328159, NULL, 'forgottenpasswordurl', '', NULL),
(155, 0, 1337328159, NULL, 'auth_instructions', '', NULL),
(156, 0, 1337328159, NULL, 'allowemailaddresses', '', NULL),
(157, 0, 1337328159, NULL, 'denyemailaddresses', '', NULL),
(158, 0, 1337328160, NULL, 'verifychangedemail', '1', NULL),
(159, 0, 1337328160, NULL, 'recaptchapublickey', '', NULL),
(160, 0, 1337328160, NULL, 'recaptchaprivatekey', '', NULL),
(161, 0, 1337328160, 'enrol_database', 'dbtype', '', NULL),
(162, 0, 1337328160, 'enrol_database', 'dbhost', 'localhost', NULL),
(163, 0, 1337328160, 'enrol_database', 'dbuser', '', NULL),
(164, 0, 1337328160, 'enrol_database', 'dbpass', '', NULL),
(165, 0, 1337328160, 'enrol_database', 'dbname', '', NULL),
(166, 0, 1337328160, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(167, 0, 1337328160, 'enrol_database', 'dbsetupsql', '', NULL),
(168, 0, 1337328160, 'enrol_database', 'dbsybasequoting', '0', NULL),
(169, 0, 1337328160, 'enrol_database', 'debugdb', '0', NULL),
(170, 0, 1337328160, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(171, 0, 1337328160, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(172, 0, 1337328160, 'enrol_database', 'localrolefield', 'shortname', NULL),
(173, 0, 1337328161, 'enrol_database', 'remoteenroltable', '', NULL),
(174, 0, 1337328161, 'enrol_database', 'remotecoursefield', '', NULL),
(175, 0, 1337328161, 'enrol_database', 'remoteuserfield', '', NULL),
(176, 0, 1337328161, 'enrol_database', 'remoterolefield', '', NULL),
(177, 0, 1337328161, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(178, 0, 1337328161, 'enrol_database', 'unenrolaction', '0', NULL),
(179, 0, 1337328161, 'enrol_database', 'newcoursetable', '', NULL),
(180, 0, 1337328161, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(181, 0, 1337328161, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(182, 0, 1337328161, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(183, 0, 1337328161, 'enrol_database', 'newcoursecategory', '', NULL),
(184, 0, 1337328161, 'enrol_database', 'templatecourse', '', NULL),
(185, 0, 1337328161, 'enrol_flatfile', 'location', '', NULL),
(186, 0, 1337328161, 'enrol_flatfile', 'mailstudents', '0', NULL),
(187, 0, 1337328161, 'enrol_flatfile', 'mailteachers', '0', NULL),
(188, 0, 1337328161, 'enrol_flatfile', 'mailadmins', '0', NULL),
(189, 0, 1337328161, 'enrol_guest', 'requirepassword', '0', NULL),
(190, 0, 1337328161, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(191, 0, 1337328161, 'enrol_guest', 'showhint', '0', NULL),
(192, 0, 1337328161, 'enrol_guest', 'defaultenrol', '1', NULL),
(193, 0, 1337328161, 'enrol_guest', 'status', '1', NULL),
(194, 0, 1337328161, 'enrol_guest', 'status_adv', '0', NULL),
(195, 0, 1337328161, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(196, 0, 1337328161, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(197, 0, 1337328162, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(198, 0, 1337328162, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(199, 0, 1337328162, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(200, 0, 1337328162, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(201, 0, 1337328162, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(202, 0, 1337328162, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(203, 0, 1337328162, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(204, 0, 1337328162, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(205, 0, 1337328162, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(206, 0, 1337328162, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(207, 0, 1337328162, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(208, 0, 1337328162, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(209, 0, 1337328162, 'enrol_ldap', 'host_url', '', NULL),
(210, 0, 1337328162, 'enrol_ldap', 'ldap_version', '3', NULL),
(211, 0, 1337328162, 'enrol_ldap', 'ldapencoding', 'utf-8', NULL),
(212, 0, 1337328162, 'enrol_ldap', 'bind_dn', '', NULL),
(213, 0, 1337328162, 'enrol_ldap', 'bind_pw', '', NULL),
(214, 0, 1337328162, 'enrol_ldap', 'course_search_sub', '0', NULL),
(215, 0, 1337328162, 'enrol_ldap', 'memberattribute_isdn', '0', NULL),
(216, 0, 1337328162, 'enrol_ldap', 'user_contexts', '', NULL),
(217, 0, 1337328162, 'enrol_ldap', 'user_search_sub', '0', NULL),
(218, 0, 1337328162, 'enrol_ldap', 'user_type', 'default', NULL),
(219, 0, 1337328162, 'enrol_ldap', 'opt_deref', '0', NULL),
(220, 0, 1337328162, 'enrol_ldap', 'idnumber_attribute', '', NULL),
(221, 0, 1337328163, 'enrol_ldap', 'objectclass', '', NULL),
(222, 0, 1337328163, 'enrol_ldap', 'course_idnumber', '', NULL),
(223, 0, 1337328163, 'enrol_ldap', 'course_shortname', '', NULL),
(224, 0, 1337328163, 'enrol_ldap', 'course_fullname', '', NULL),
(225, 0, 1337328163, 'enrol_ldap', 'course_summary', '', NULL),
(226, 0, 1337328163, 'enrol_ldap', 'ignorehiddencourses', '0', NULL),
(227, 0, 1337328163, 'enrol_ldap', 'unenrolaction', '0', NULL),
(228, 0, 1337328163, 'enrol_ldap', 'autocreate', '0', NULL),
(229, 0, 1337328163, 'enrol_ldap', 'template', '', NULL),
(230, 0, 1337328163, 'enrol_ldap', 'nested_groups', '0', NULL),
(231, 0, 1337328163, 'enrol_ldap', 'group_memberofattribute', '', NULL),
(232, 0, 1337328163, 'enrol_manual', 'defaultenrol', '1', NULL),
(233, 0, 1337328163, 'enrol_manual', 'status', '0', NULL),
(234, 0, 1337328163, 'enrol_manual', 'enrolperiod', '0', NULL),
(235, 0, 1337328163, 'enrol_paypal', 'paypalbusiness', '', NULL),
(236, 0, 1337328163, 'enrol_paypal', 'mailstudents', '0', NULL),
(237, 0, 1337328163, 'enrol_paypal', 'mailteachers', '0', NULL),
(238, 0, 1337328163, 'enrol_paypal', 'mailadmins', '0', NULL),
(239, 0, 1337328163, 'enrol_paypal', 'status', '1', NULL),
(240, 0, 1337328163, 'enrol_paypal', 'cost', '0', NULL),
(241, 0, 1337328163, 'enrol_paypal', 'currency', 'USD', NULL),
(242, 0, 1337328163, 'enrol_paypal', 'enrolperiod', '0', NULL),
(243, 0, 1337328164, 'enrol_self', 'requirepassword', '0', NULL),
(244, 0, 1337328164, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(245, 0, 1337328164, 'enrol_self', 'showhint', '0', NULL),
(246, 0, 1337328164, 'enrol_self', 'defaultenrol', '1', NULL),
(247, 0, 1337328164, 'enrol_self', 'status', '1', NULL),
(248, 0, 1337328164, 'enrol_self', 'groupkey', '0', NULL),
(249, 0, 1337328164, 'enrol_self', 'enrolperiod', '0', NULL),
(250, 0, 1337328164, 'enrol_self', 'longtimenosee', '0', NULL),
(251, 0, 1337328164, 'enrol_self', 'maxenrolled', '0', NULL),
(252, 0, 1337328164, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(253, 0, 1337328164, 'editor_tinymce', 'spellengine', 'GoogleSpell', NULL),
(254, 0, 1337328164, 'editor_tinymce', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(255, 0, 1337328164, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(256, 0, 1337328164, NULL, 'cachetext', '60', NULL),
(257, 0, 1337328164, NULL, 'filteruploadedfiles', '0', NULL),
(258, 0, 1337328164, NULL, 'filtermatchoneperpage', '0', NULL),
(259, 0, 1337328164, NULL, 'filtermatchonepertext', '0', NULL),
(260, 0, 1337328164, 'filter_urltolink', 'formats', '0', NULL),
(261, 0, 1337328164, 'filter_urltolink', 'embedimages', '1', NULL),
(262, 0, 1337328164, 'filter_emoticon', 'formats', '1,4,0', NULL),
(263, 0, 1337328164, NULL, 'filter_multilang_force_old', '0', NULL),
(264, 0, 1337328164, NULL, 'filter_mediaplugin_enable_youtube', '1', NULL),
(265, 0, 1337328165, NULL, 'filter_mediaplugin_enable_vimeo', '0', NULL),
(266, 0, 1337328165, NULL, 'filter_mediaplugin_enable_mp3', '1', NULL),
(267, 0, 1337328165, NULL, 'filter_mediaplugin_enable_flv', '1', NULL),
(268, 0, 1337328165, NULL, 'filter_mediaplugin_enable_swf', '1', NULL),
(269, 0, 1337328165, NULL, 'filter_mediaplugin_enable_html5audio', '0', NULL),
(270, 0, 1337328165, NULL, 'filter_mediaplugin_enable_html5video', '0', NULL),
(271, 0, 1337328165, NULL, 'filter_mediaplugin_enable_qt', '1', NULL),
(272, 0, 1337328165, NULL, 'filter_mediaplugin_enable_wmp', '1', NULL),
(273, 0, 1337328165, NULL, 'filter_mediaplugin_enable_rm', '1', NULL),
(274, 0, 1337328165, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(275, 0, 1337328165, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(276, 0, 1337328165, NULL, 'filter_tex_density', '120', NULL),
(277, 0, 1337328165, NULL, 'filter_tex_pathlatex', '"c:\\texmf\\miktex\\bin\\latex.exe" ', NULL),
(278, 0, 1337328165, NULL, 'filter_tex_pathdvips', '"c:\\texmf\\miktex\\bin\\dvips.exe" ', NULL),
(279, 0, 1337328165, NULL, 'filter_tex_pathconvert', '"c:\\imagemagick\\convert.exe" ', NULL),
(280, 0, 1337328165, NULL, 'filter_tex_convertformat', 'gif', NULL),
(281, 0, 1337328165, NULL, 'filter_censor_badwords', '', NULL),
(282, 0, 1337328165, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(283, 0, 1337328165, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(284, 0, 1337328165, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(285, 0, 1337328165, NULL, 'portfolio_high_db_threshold', '50', NULL),
(286, 0, 1337328165, NULL, 'repositorycacheexpire', '120', NULL),
(287, 0, 1337328165, NULL, 'repositoryallowexternallinks', '1', NULL),
(288, 0, 1337328166, NULL, 'legacyfilesinnewcourses', '0', NULL),
(289, 0, 1337328166, NULL, 'enablewsdocumentation', '0', NULL),
(290, 0, 1337328166, NULL, 'allowbeforeblock', '0', NULL),
(291, 0, 1337328166, NULL, 'allowedip', '', NULL),
(292, 0, 1337328166, NULL, 'blockedip', '', NULL),
(293, 0, 1337328166, NULL, 'protectusernames', '1', NULL),
(294, 0, 1337328166, NULL, 'forcelogin', '0', NULL),
(295, 0, 1337328166, NULL, 'forceloginforprofiles', '1', NULL),
(296, 0, 1337328166, NULL, 'forceloginforprofileimage', '0', NULL),
(297, 0, 1337328166, NULL, 'opentogoogle', '0', NULL),
(298, 0, 1337328166, NULL, 'maxbytes', '0', NULL),
(299, 0, 1337328166, NULL, 'userquota', '104857600', NULL),
(300, 0, 1337328166, NULL, 'allowobjectembed', '0', NULL),
(301, 0, 1337328166, NULL, 'enabletrusttext', '0', NULL),
(302, 0, 1337328166, NULL, 'maxeditingtime', '1800', NULL),
(303, 0, 1337328166, NULL, 'fullnamedisplay', 'language', NULL),
(304, 0, 1337328166, NULL, 'extendedusernamechars', '0', NULL),
(305, 0, 1337328166, NULL, 'sitepolicy', '', NULL),
(306, 0, 1337328166, NULL, 'sitepolicyguest', '', NULL),
(307, 0, 1337328166, NULL, 'keeptagnamecase', '1', NULL),
(308, 0, 1337328166, NULL, 'profilesforenrolledusersonly', '1', NULL),
(309, 0, 1337328167, NULL, 'cronclionly', '0', NULL),
(310, 0, 1337328167, NULL, 'cronremotepassword', '', NULL),
(311, 0, 1337328167, NULL, 'passwordpolicy', '1', NULL),
(312, 0, 1337328167, NULL, 'minpasswordlength', '8', NULL),
(313, 0, 1337328167, NULL, 'minpassworddigits', '1', NULL),
(314, 0, 1337328167, NULL, 'minpasswordlower', '1', NULL),
(315, 0, 1337328167, NULL, 'minpasswordupper', '1', NULL),
(316, 0, 1337328167, NULL, 'minpasswordnonalphanum', '1', NULL),
(317, 0, 1337328167, NULL, 'maxconsecutiveidentchars', '0', NULL),
(318, 0, 1337328167, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(319, 0, 1337328167, NULL, 'disableuserimages', '0', NULL),
(320, 0, 1337328167, NULL, 'emailchangeconfirmation', '1', NULL),
(321, 0, 1337328167, NULL, 'rememberusername', '2', NULL),
(322, 0, 1337328167, NULL, 'strictformsrequired', '0', NULL),
(323, 0, 1337328167, NULL, 'loginhttps', '0', NULL),
(324, 0, 1337328167, NULL, 'cookiesecure', '0', NULL),
(325, 0, 1337328167, NULL, 'cookiehttponly', '0', NULL),
(326, 0, 1337328167, NULL, 'allowframembedding', '0', NULL),
(327, 0, 1337328167, NULL, 'loginpasswordautocomplete', '0', NULL),
(328, 0, 1337328167, NULL, 'restrictmodulesfor', 'none', NULL),
(329, 0, 1337328167, NULL, 'restrictbydefault', '0', NULL),
(330, 0, 1337328167, NULL, 'displayloginfailures', '', NULL),
(331, 0, 1337328167, NULL, 'notifyloginfailures', '', NULL),
(332, 0, 1337328168, NULL, 'notifyloginthreshold', '10', NULL),
(333, 0, 1337328168, NULL, 'runclamonupload', '0', NULL),
(334, 0, 1337328168, NULL, 'pathtoclam', '', NULL),
(335, 0, 1337328168, NULL, 'quarantinedir', '', NULL),
(336, 0, 1337328168, NULL, 'clamfailureonupload', 'donothing', NULL),
(337, 0, 1337328168, NULL, 'themelist', '', NULL),
(338, 0, 1337328168, NULL, 'themedesignermode', '0', NULL),
(339, 0, 1337328168, NULL, 'allowuserthemes', '0', NULL),
(340, 0, 1337328168, NULL, 'allowcoursethemes', '0', NULL),
(341, 0, 1337328168, NULL, 'allowcategorythemes', '0', NULL),
(342, 0, 1337328168, NULL, 'allowthemechangeonurl', '0', NULL),
(343, 0, 1337328168, NULL, 'allowuserblockhiding', '1', NULL),
(344, 0, 1337328168, NULL, 'allowblockstodock', '1', NULL),
(345, 0, 1337328168, NULL, 'custommenuitems', '', NULL),
(346, 0, 1337328168, NULL, 'enabledevicedetection', '1', NULL),
(347, 0, 1337328168, NULL, 'devicedetectregex', '[]', NULL),
(348, 0, 1337328168, 'theme_afterburner', 'logo', '', NULL),
(349, 0, 1337328168, 'theme_afterburner', 'footnote', '', NULL),
(350, 0, 1337328168, 'theme_afterburner', 'customcss', '', NULL),
(351, 0, 1337328168, 'theme_arialist', 'logo', '', NULL),
(352, 0, 1337328168, 'theme_arialist', 'tagline', '', NULL),
(353, 0, 1337328168, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(354, 0, 1337328168, 'theme_arialist', 'regionwidth', '250', NULL),
(355, 0, 1337328169, 'theme_arialist', 'customcss', '', NULL),
(356, 0, 1337328169, 'theme_brick', 'logo', '', NULL),
(357, 0, 1337328169, 'theme_brick', 'linkcolor', '#06365b', NULL),
(358, 0, 1337328169, 'theme_brick', 'linkhover', '#5487ad', NULL),
(359, 0, 1337328169, 'theme_brick', 'maincolor', '#8e2800', NULL),
(360, 0, 1337328169, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(361, 0, 1337328169, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(362, 0, 1337328169, 'theme_formal_white', 'fontsizereference', '13', NULL),
(363, 0, 1337328169, 'theme_formal_white', 'noframe', '0', NULL),
(364, 0, 1337328169, 'theme_formal_white', 'displaylogo', '1', NULL),
(365, 0, 1337328169, 'theme_formal_white', 'logo', '', NULL),
(366, 0, 1337328169, 'theme_formal_white', 'frontpagelogo', '', NULL),
(367, 0, 1337328169, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(368, 0, 1337328169, 'theme_formal_white', 'creditstomoodleorg', '2', NULL),
(369, 0, 1337328169, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(370, 0, 1337328169, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(371, 0, 1337328169, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(372, 0, 1337328169, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(373, 0, 1337328169, 'theme_formal_white', 'footnote', '', NULL),
(374, 0, 1337328169, 'theme_formal_white', 'customcss', '', NULL),
(375, 0, 1337328169, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(376, 0, 1337328169, 'theme_fusion', 'tagline', '', NULL),
(377, 0, 1337328170, 'theme_fusion', 'footertext', '', NULL),
(378, 0, 1337328170, 'theme_fusion', 'customcss', '', NULL),
(379, 0, 1337328170, 'theme_magazine', 'background', '', NULL),
(380, 0, 1337328170, 'theme_magazine', 'logo', '', NULL),
(381, 0, 1337328170, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(382, 0, 1337328170, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(383, 0, 1337328170, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(384, 0, 1337328170, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(385, 0, 1337328170, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(386, 0, 1337328170, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(387, 0, 1337328170, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(388, 0, 1337328170, 'theme_mymobile', 'colourswatch', 'light', NULL),
(389, 0, 1337328170, 'theme_mymobile', 'showmobileintro', '', NULL),
(390, 0, 1337328170, 'theme_mymobile', 'showsitetopic', 'topicshow', NULL),
(391, 0, 1337328170, 'theme_mymobile', 'showfullsizeimages', 'ithumb', NULL),
(392, 0, 1337328170, 'theme_mymobile', 'usetableview', 'tabshow', NULL),
(393, 0, 1337328170, 'theme_nimble', 'tagline', '', NULL),
(394, 0, 1337328170, 'theme_nimble', 'footerline', '', NULL),
(395, 0, 1337328170, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(396, 0, 1337328170, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(397, 0, 1337328170, 'theme_nimble', 'linkhover', '#222222', NULL),
(398, 0, 1337328170, 'theme_nonzero', 'regionprewidth', '200', NULL),
(399, 0, 1337328170, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(400, 0, 1337328170, 'theme_nonzero', 'customcss', '', NULL),
(401, 0, 1337328171, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(402, 0, 1337328171, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(403, 0, 1337328171, 'theme_overlay', 'footertext', '', NULL),
(404, 0, 1337328171, 'theme_overlay', 'customcss', '', NULL),
(405, 0, 1337328171, 'theme_sky_high', 'logo', '', NULL),
(406, 0, 1337328171, 'theme_sky_high', 'regionwidth', '240', NULL),
(407, 0, 1337328171, 'theme_sky_high', 'footnote', '', NULL),
(408, 0, 1337328171, 'theme_sky_high', 'customcss', '', NULL),
(409, 0, 1337328171, 'theme_splash', 'logo', '', NULL),
(410, 0, 1337328171, 'theme_splash', 'tagline', 'Virtual learning center', NULL),
(411, 0, 1337328171, 'theme_splash', 'hide_tagline', '0', NULL),
(412, 0, 1337328171, 'theme_splash', 'footnote', '', NULL),
(413, 0, 1337328171, 'theme_splash', 'customcss', '', NULL),
(414, 0, 1337328171, NULL, 'calendar_adminseesall', '0', NULL),
(415, 0, 1337328171, NULL, 'calendar_site_timeformat', '0', NULL),
(416, 0, 1337328171, NULL, 'calendar_startwday', '0', NULL),
(417, 0, 1337328171, NULL, 'calendar_weekend', '65', NULL),
(418, 0, 1337328171, NULL, 'calendar_lookahead', '21', NULL),
(419, 0, 1337328171, NULL, 'calendar_maxevents', '10', NULL),
(420, 0, 1337328171, NULL, 'enablecalendarexport', '1', NULL),
(421, 0, 1337328171, NULL, 'calendar_exportsalt', 'sGeFHbr98S0rl9Zr9PLJq9yTGFrSJBIERhGnNtnNjG1Ph4OntiXGXMLhOJ3u', NULL),
(422, 0, 1337328171, NULL, 'useblogassociations', '1', NULL),
(423, 0, 1337328171, NULL, 'useexternalblogs', '1', NULL),
(424, 0, 1337328172, NULL, 'externalblogcrontime', '86400', NULL),
(425, 0, 1337328172, NULL, 'maxexternalblogsperuser', '1', NULL),
(426, 0, 1337328172, NULL, 'blogusecomments', '1', NULL),
(427, 0, 1337328172, NULL, 'blogshowcommentscount', '1', NULL),
(428, 0, 1337328172, NULL, 'defaulthomepage', '0', NULL),
(429, 0, 1337328172, NULL, 'navshowcategories', '1', NULL),
(430, 0, 1337328172, NULL, 'navshowallcourses', '0', NULL),
(431, 0, 1337328172, NULL, 'navcourselimit', '20', NULL),
(432, 0, 1337328172, NULL, 'navlinkcoursesections', '0', NULL),
(433, 0, 1337328172, NULL, 'usesitenameforsitepages', '0', NULL),
(434, 0, 1337328172, NULL, 'navadduserpostslinks', '1', NULL),
(435, 0, 1337328172, NULL, 'formatstringstriptags', '1', NULL),
(436, 0, 1337328172, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(437, 0, 1337328172, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(438, 0, 1337328172, NULL, 'doctonewwindow', '0', NULL),
(439, 0, 1337328172, NULL, 'courselistshortnames', '0', NULL),
(440, 0, 1337328172, NULL, 'enableajax', '1', NULL),
(441, 0, 1337328172, NULL, 'useexternalyui', '0', NULL),
(442, 0, 1337328172, NULL, 'yuicomboloading', '1', NULL),
(443, 0, 1337328172, NULL, 'cachejs', '1', NULL),
(444, 0, 1337328172, NULL, 'enablecourseajax', '1', NULL),
(445, 0, 1337328172, NULL, 'additionalhtmlhead', '', NULL),
(446, 0, 1337328173, NULL, 'additionalhtmltopofbody', '', NULL),
(447, 0, 1337328173, NULL, 'additionalhtmlfooter', '', NULL),
(448, 0, 1337328173, NULL, 'gdversion', '2', NULL),
(449, 0, 1337328173, NULL, 'pathtodu', '', NULL),
(450, 0, 1337328173, NULL, 'aspellpath', '', NULL),
(451, 0, 1337328173, NULL, 'pathtodot', '', NULL),
(452, 0, 1337328173, NULL, 'supportpage', '', NULL),
(453, 0, 1337328173, NULL, 'dbsessions', '1', NULL),
(454, 0, 1337328173, NULL, 'sessioncookie', '', NULL),
(455, 0, 1337328173, NULL, 'sessioncookiepath', '', NULL),
(456, 0, 1337328173, NULL, 'sessioncookiedomain', '', NULL),
(457, 0, 1337328173, NULL, 'statsfirstrun', 'none', NULL),
(458, 0, 1337328173, NULL, 'statsmaxruntime', '0', NULL),
(459, 0, 1337328173, NULL, 'statsruntimedays', '31', NULL),
(460, 0, 1337328173, NULL, 'statsruntimestarthour', '0', NULL),
(461, 0, 1337328173, NULL, 'statsruntimestartminute', '0', NULL),
(462, 0, 1337328173, NULL, 'statsuserthreshold', '0', NULL),
(463, 0, 1337328173, NULL, 'slasharguments', '1', NULL),
(464, 0, 1337328173, NULL, 'getremoteaddrconf', '0', NULL),
(465, 0, 1337328173, NULL, 'proxyhost', '', NULL),
(466, 0, 1337328173, NULL, 'proxyport', '0', NULL),
(467, 0, 1337328173, NULL, 'proxytype', 'HTTP', NULL),
(468, 0, 1337328173, NULL, 'proxyuser', '', NULL),
(469, 0, 1337328173, NULL, 'proxypassword', '', NULL),
(470, 0, 1337328174, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(471, 0, 1337328174, NULL, 'maintenance_enabled', '0', NULL),
(472, 0, 1337328174, NULL, 'maintenance_message', '', NULL),
(473, 0, 1337328174, NULL, 'deleteunconfirmed', '168', NULL),
(474, 0, 1337328174, NULL, 'deleteincompleteusers', '0', NULL),
(475, 0, 1337328174, NULL, 'logguests', '1', NULL),
(476, 0, 1337328174, NULL, 'loglifetime', '0', NULL),
(477, 0, 1337328174, NULL, 'disablegradehistory', '0', NULL),
(478, 0, 1337328174, NULL, 'gradehistorylifetime', '0', NULL),
(479, 0, 1337328174, NULL, 'numcoursesincombo', '500', NULL),
(480, 0, 1337328174, NULL, 'extramemorylimit', '512M', NULL),
(481, 0, 1337328174, NULL, 'curlcache', '120', NULL),
(482, 0, 1337328174, NULL, 'curltimeoutkbitrate', '56', NULL),
(483, 0, 1337328174, NULL, 'enablesafebrowserintegration', '0', NULL),
(484, 0, 1337328174, NULL, 'enablegroupmembersonly', '0', NULL),
(485, 0, 1337328174, NULL, 'debug', '0', NULL),
(486, 0, 1337328174, NULL, 'debugdisplay', '0', NULL),
(487, 0, 1337328174, NULL, 'xmlstrictheaders', '0', NULL),
(488, 0, 1337328174, NULL, 'debugsmtp', '0', NULL),
(489, 0, 1337328174, NULL, 'perfdebug', '7', NULL),
(490, 0, 1337328174, NULL, 'debugstringids', '0', NULL),
(491, 0, 1337328174, NULL, 'debugvalidators', '0', NULL),
(492, 0, 1337328174, NULL, 'debugpageinfo', '0', NULL),
(493, 2, 1337328451, NULL, 'notloggedinroleid', '6', NULL),
(494, 2, 1337328451, NULL, 'guestroleid', '6', NULL),
(495, 2, 1337328452, NULL, 'defaultuserroleid', '7', NULL),
(496, 2, 1337328452, NULL, 'creatornewroleid', '3', NULL),
(497, 2, 1337328452, NULL, 'restorernewroleid', '3', NULL),
(498, 2, 1337328452, NULL, 'gradebookroles', '5', NULL),
(499, 2, 1337328452, NULL, 'assignment_maxbytes', '1048576', NULL),
(500, 2, 1337328452, NULL, 'assignment_itemstocount', '1', NULL),
(501, 2, 1337328452, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(502, 2, 1337328452, NULL, 'chat_method', 'ajax', NULL),
(503, 2, 1337328452, NULL, 'chat_refresh_userlist', '10', NULL),
(504, 2, 1337328452, NULL, 'chat_old_ping', '35', NULL),
(505, 2, 1337328452, NULL, 'chat_refresh_room', '5', NULL),
(506, 2, 1337328452, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(507, 2, 1337328452, NULL, 'chat_serverhost', 'localhost', NULL),
(508, 2, 1337328452, NULL, 'chat_serverip', '127.0.0.1', NULL),
(509, 2, 1337328452, NULL, 'chat_serverport', '9111', NULL),
(510, 2, 1337328452, NULL, 'chat_servermax', '100', NULL),
(511, 2, 1337328452, NULL, 'data_enablerssfeeds', '0', NULL),
(512, 2, 1337328452, NULL, 'feedback_allowfullanonymous', '0', NULL),
(513, 2, 1337328452, 'folder', 'requiremodintro', '1', NULL),
(514, 2, 1337328452, NULL, 'forum_displaymode', '3', NULL),
(515, 2, 1337328452, NULL, 'forum_replytouser', '1', NULL),
(516, 2, 1337328453, NULL, 'forum_shortpost', '300', NULL),
(517, 2, 1337328453, NULL, 'forum_longpost', '600', NULL),
(518, 2, 1337328453, NULL, 'forum_manydiscussions', '100', NULL),
(519, 2, 1337328453, NULL, 'forum_maxbytes', '512000', NULL),
(520, 2, 1337328453, NULL, 'forum_maxattachments', '9', NULL),
(521, 2, 1337328453, NULL, 'forum_trackreadposts', '1', NULL),
(522, 2, 1337328453, NULL, 'forum_oldpostdays', '14', NULL),
(523, 2, 1337328453, NULL, 'forum_usermarksread', '0', NULL),
(524, 2, 1337328453, NULL, 'forum_cleanreadtime', '2', NULL),
(525, 2, 1337328453, NULL, 'digestmailtime', '17', NULL),
(526, 2, 1337328453, NULL, 'forum_enablerssfeeds', '0', NULL),
(527, 2, 1337328453, NULL, 'forum_enabletimedposts', '0', NULL),
(528, 2, 1337328453, NULL, 'glossary_entbypage', '10', NULL),
(529, 2, 1337328453, NULL, 'glossary_dupentries', '0', NULL),
(530, 2, 1337328453, NULL, 'glossary_allowcomments', '0', NULL),
(531, 2, 1337328453, NULL, 'glossary_linkbydefault', '1', NULL),
(532, 2, 1337328453, NULL, 'glossary_defaultapproval', '1', NULL),
(533, 2, 1337328453, NULL, 'glossary_enablerssfeeds', '0', NULL),
(534, 2, 1337328453, NULL, 'glossary_linkentries', '0', NULL),
(535, 2, 1337328453, NULL, 'glossary_casesensitive', '0', NULL),
(536, 2, 1337328453, NULL, 'glossary_fullmatch', '0', NULL),
(537, 2, 1337328453, 'imscp', 'requiremodintro', '1', NULL),
(538, 2, 1337328454, 'imscp', 'keepold', '1', NULL),
(539, 2, 1337328454, 'imscp', 'keepold_adv', '0', NULL),
(540, 2, 1337328454, NULL, 'lesson_slideshowwidth', '640', NULL),
(541, 2, 1337328454, NULL, 'lesson_slideshowheight', '480', NULL),
(542, 2, 1337328454, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(543, 2, 1337328454, NULL, 'lesson_mediawidth', '640', NULL),
(544, 2, 1337328454, NULL, 'lesson_mediaheight', '480', NULL),
(545, 2, 1337328454, NULL, 'lesson_mediaclose', '0', NULL),
(546, 2, 1337328454, NULL, 'lesson_maxhighscores', '10', NULL),
(547, 2, 1337328454, NULL, 'lesson_maxanswers', '4', NULL),
(548, 2, 1337328454, NULL, 'lesson_defaultnextpage', '0', NULL),
(549, 2, 1337328454, 'page', 'requiremodintro', '1', NULL),
(550, 2, 1337328454, 'page', 'displayoptions', '5', NULL),
(551, 2, 1337328454, 'page', 'printheading', '1', NULL),
(552, 2, 1337328454, 'page', 'printheading_adv', '0', NULL),
(553, 2, 1337328454, 'page', 'printintro', '0', NULL),
(554, 2, 1337328454, 'page', 'printintro_adv', '0', NULL),
(555, 2, 1337328454, 'page', 'display', '5', NULL),
(556, 2, 1337328454, 'page', 'display_adv', '1', NULL),
(557, 2, 1337328454, 'page', 'popupwidth', '620', NULL),
(558, 2, 1337328454, 'page', 'popupwidth_adv', '1', NULL),
(559, 2, 1337328454, 'page', 'popupheight', '450', NULL),
(560, 2, 1337328454, 'page', 'popupheight_adv', '1', NULL),
(561, 2, 1337328455, 'quiz', 'timelimit', '0', NULL),
(562, 2, 1337328455, 'quiz', 'timelimit_adv', '0', NULL),
(563, 2, 1337328455, 'quiz', 'attempts', '0', NULL),
(564, 2, 1337328455, 'quiz', 'attempts_adv', '0', NULL),
(565, 2, 1337328455, 'quiz', 'grademethod', '1', NULL),
(566, 2, 1337328455, 'quiz', 'grademethod_adv', '0', NULL),
(567, 2, 1337328455, 'quiz', 'maximumgrade', '10', NULL),
(568, 2, 1337328455, 'quiz', 'shufflequestions', '0', NULL),
(569, 2, 1337328455, 'quiz', 'shufflequestions_adv', '0', NULL),
(570, 2, 1337328455, 'quiz', 'questionsperpage', '1', NULL),
(571, 2, 1337328455, 'quiz', 'questionsperpage_adv', '0', NULL),
(572, 2, 1337328455, 'quiz', 'shuffleanswers', '1', NULL),
(573, 2, 1337328455, 'quiz', 'shuffleanswers_adv', '0', NULL),
(574, 2, 1337328455, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(575, 2, 1337328455, 'quiz', 'attemptonlast', '0', NULL),
(576, 2, 1337328456, 'quiz', 'attemptonlast_adv', '1', NULL),
(577, 2, 1337328456, 'quiz', 'reviewattempt', '69904', NULL),
(578, 2, 1337328456, 'quiz', 'reviewcorrectness', '69904', NULL),
(579, 2, 1337328456, 'quiz', 'reviewmarks', '69904', NULL),
(580, 2, 1337328456, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(581, 2, 1337328456, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(582, 2, 1337328456, 'quiz', 'reviewrightanswer', '69904', NULL),
(583, 2, 1337328456, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(584, 2, 1337328456, 'quiz', 'showuserpicture', '0', NULL),
(585, 2, 1337328456, 'quiz', 'showuserpicture_adv', '0', NULL),
(586, 2, 1337328456, 'quiz', 'decimalpoints', '2', NULL),
(587, 2, 1337328456, 'quiz', 'decimalpoints_adv', '0', NULL),
(588, 2, 1337328456, 'quiz', 'questiondecimalpoints', '-1', NULL),
(589, 2, 1337328456, 'quiz', 'questiondecimalpoints_adv', '0', NULL),
(590, 2, 1337328456, 'quiz', 'showblocks', '0', NULL),
(591, 2, 1337328456, 'quiz', 'showblocks_adv', '1', NULL),
(592, 2, 1337328456, 'quiz', 'password', '', NULL),
(593, 2, 1337328456, 'quiz', 'password_adv', '0', NULL),
(594, 2, 1337328456, 'quiz', 'subnet', '', NULL),
(595, 2, 1337328456, 'quiz', 'subnet_adv', '0', NULL),
(596, 2, 1337328456, 'quiz', 'delay1', '0', NULL),
(597, 2, 1337328457, 'quiz', 'delay1_adv', '0', NULL),
(598, 2, 1337328457, 'quiz', 'delay2', '0', NULL),
(599, 2, 1337328457, 'quiz', 'delay2_adv', '0', NULL),
(600, 2, 1337328457, 'quiz', 'browsersecurity', '-', NULL),
(601, 2, 1337328457, 'quiz', 'browsersecurity_adv', '1', NULL),
(602, 2, 1337328457, 'resource', 'framesize', '130', NULL),
(603, 2, 1337328457, 'resource', 'requiremodintro', '1', NULL),
(604, 2, 1337328457, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(605, 2, 1337328457, 'resource', 'printheading', '0', NULL),
(606, 2, 1337328457, 'resource', 'printheading_adv', '0', NULL),
(607, 2, 1337328457, 'resource', 'printintro', '1', NULL),
(608, 2, 1337328457, 'resource', 'printintro_adv', '0', NULL),
(609, 2, 1337328457, 'resource', 'display', '0', NULL),
(610, 2, 1337328457, 'resource', 'display_adv', '0', NULL),
(611, 2, 1337328457, 'resource', 'popupwidth', '620', NULL),
(612, 2, 1337328457, 'resource', 'popupwidth_adv', '1', NULL),
(613, 2, 1337328457, 'resource', 'popupheight', '450', NULL),
(614, 2, 1337328457, 'resource', 'popupheight_adv', '1', NULL),
(615, 2, 1337328457, 'resource', 'filterfiles', '0', NULL),
(616, 2, 1337328458, 'resource', 'filterfiles_adv', '1', NULL),
(617, 2, 1337328458, 'scorm', 'displaycoursestructure', '0', NULL),
(618, 2, 1337328458, 'scorm', 'displaycoursestructure_adv', '0', NULL),
(619, 2, 1337328458, 'scorm', 'popup', '0', NULL),
(620, 2, 1337328458, 'scorm', 'popup_adv', '0', NULL),
(621, 2, 1337328458, 'scorm', 'framewidth', '100', NULL),
(622, 2, 1337328458, 'scorm', 'framewidth_adv', '1', NULL),
(623, 2, 1337328458, 'scorm', 'frameheight', '500', NULL),
(624, 2, 1337328458, 'scorm', 'frameheight_adv', '1', NULL),
(625, 2, 1337328458, 'scorm', 'winoptgrp_adv', '1', NULL),
(626, 2, 1337328458, 'scorm', 'resizable', '0', NULL),
(627, 2, 1337328458, 'scorm', 'scrollbars', '0', NULL),
(628, 2, 1337328458, 'scorm', 'directories', '0', NULL),
(629, 2, 1337328458, 'scorm', 'location', '0', NULL),
(630, 2, 1337328458, 'scorm', 'menubar', '0', NULL),
(631, 2, 1337328458, 'scorm', 'toolbar', '0', NULL),
(632, 2, 1337328458, 'scorm', 'status', '0', NULL),
(633, 2, 1337328458, 'scorm', 'skipview', '0', NULL),
(634, 2, 1337328458, 'scorm', 'skipview_adv', '1', NULL),
(635, 2, 1337328458, 'scorm', 'hidebrowse', '0', NULL),
(636, 2, 1337328458, 'scorm', 'hidebrowse_adv', '1', NULL),
(637, 2, 1337328458, 'scorm', 'hidetoc', '0', NULL),
(638, 2, 1337328458, 'scorm', 'hidetoc_adv', '1', NULL),
(639, 2, 1337328459, 'scorm', 'hidenav', '0', NULL),
(640, 2, 1337328459, 'scorm', 'hidenav_adv', '0', NULL),
(641, 2, 1337328459, 'scorm', 'grademethod', '1', NULL),
(642, 2, 1337328459, 'scorm', 'grademethod_adv', '0', NULL),
(643, 2, 1337328459, 'scorm', 'maxgrade', '100', NULL),
(644, 2, 1337328459, 'scorm', 'maxgrade_adv', '0', NULL),
(645, 2, 1337328459, 'scorm', 'maxattempts', '0', NULL),
(646, 2, 1337328459, 'scorm', 'maxattempts_adv', '0', NULL),
(647, 2, 1337328459, 'scorm', 'whatgrade', '0', NULL),
(648, 2, 1337328459, 'scorm', 'whatgrade_adv', '0', NULL),
(649, 2, 1337328459, 'scorm', 'displayattemptstatus', '1', NULL),
(650, 2, 1337328459, 'scorm', 'displayattemptstatus_adv', '0', NULL),
(651, 2, 1337328459, 'scorm', 'forcecompleted', '0', NULL),
(652, 2, 1337328459, 'scorm', 'forcecompleted_adv', '1', NULL),
(653, 2, 1337328459, 'scorm', 'forcenewattempt', '0', NULL),
(654, 2, 1337328459, 'scorm', 'forcenewattempt_adv', '1', NULL),
(655, 2, 1337328459, 'scorm', 'lastattemptlock', '0', NULL),
(656, 2, 1337328459, 'scorm', 'lastattemptlock_adv', '1', NULL),
(657, 2, 1337328459, 'scorm', 'auto', '0', NULL),
(658, 2, 1337328459, 'scorm', 'auto_adv', '1', NULL),
(659, 2, 1337328460, 'scorm', 'updatefreq', '0', NULL),
(660, 2, 1337328460, 'scorm', 'updatefreq_adv', '1', NULL),
(661, 2, 1337328460, 'scorm', 'allowtypeexternal', '0', NULL),
(662, 2, 1337328460, 'scorm', 'allowtypelocalsync', '0', NULL),
(663, 2, 1337328460, 'scorm', 'allowtypeimsrepository', '0', NULL),
(664, 2, 1337328460, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(665, 2, 1337328460, 'scorm', 'allowaicchacp', '0', NULL),
(666, 2, 1337328460, 'scorm', 'aicchacptimeout', '30', NULL),
(667, 2, 1337328460, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(668, 2, 1337328460, 'scorm', 'forcejavascript', '1', NULL),
(669, 2, 1337328460, 'scorm', 'allowapidebug', '0', NULL),
(670, 2, 1337328460, 'scorm', 'apidebugmask', '.*', NULL),
(671, 2, 1337328460, 'url', 'framesize', '130', NULL),
(672, 2, 1337328461, 'url', 'requiremodintro', '1', NULL),
(673, 2, 1337328461, 'url', 'secretphrase', '', NULL),
(674, 2, 1337328461, 'url', 'rolesinparams', '0', NULL),
(675, 2, 1337328461, 'url', 'displayoptions', '0,1,5,6', NULL),
(676, 2, 1337328461, 'url', 'printheading', '0', NULL),
(677, 2, 1337328461, 'url', 'printheading_adv', '0', NULL),
(678, 2, 1337328461, 'url', 'printintro', '1', NULL),
(679, 2, 1337328461, 'url', 'printintro_adv', '0', NULL),
(680, 2, 1337328461, 'url', 'display', '0', NULL),
(681, 2, 1337328461, 'url', 'display_adv', '0', NULL),
(682, 2, 1337328461, 'url', 'popupwidth', '620', NULL),
(683, 2, 1337328461, 'url', 'popupwidth_adv', '1', NULL),
(684, 2, 1337328461, 'url', 'popupheight', '450', NULL),
(685, 2, 1337328461, 'url', 'popupheight_adv', '1', NULL),
(686, 2, 1337328461, 'workshop', 'grade', '80', NULL),
(687, 2, 1337328461, 'workshop', 'gradinggrade', '20', NULL),
(688, 2, 1337328461, 'workshop', 'gradedecimals', '0', NULL),
(689, 2, 1337328462, 'workshop', 'maxbytes', '0', NULL),
(690, 2, 1337328462, 'workshop', 'strategy', 'accumulative', NULL),
(691, 2, 1337328462, 'workshop', 'examplesmode', '0', NULL),
(692, 2, 1337328462, 'workshopallocation_random', 'numofreviews', '5', NULL),
(693, 2, 1337328462, 'workshopform_numerrors', 'grade0', 'No', NULL),
(694, 2, 1337328462, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(695, 2, 1337328462, 'workshopeval_best', 'comparison', '5', NULL),
(696, 2, 1337328462, NULL, 'block_course_list_adminview', 'all', NULL),
(697, 2, 1337328462, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(698, 2, 1337328462, NULL, 'block_online_users_timetosee', '5', NULL),
(699, 2, 1337328462, NULL, 'block_rss_client_num_entries', '5', NULL),
(700, 2, 1337328462, NULL, 'block_rss_client_timeout', '30', NULL),
(701, 2, 1337328462, 'blocks/section_links', 'numsections1', '22', NULL),
(702, 2, 1337328462, 'blocks/section_links', 'incby1', '2', NULL),
(703, 2, 1337328462, 'blocks/section_links', 'numsections2', '40', NULL),
(704, 2, 1337328462, 'blocks/section_links', 'incby2', '5', NULL),
(705, 2, 1337328462, NULL, 'block_tags_showcoursetags', '0', NULL),
(706, 2, 1337328462, NULL, 'jabberhost', '', NULL),
(707, 2, 1337328462, NULL, 'jabberserver', '', NULL),
(708, 2, 1337328462, NULL, 'jabberusername', '', NULL),
(709, 2, 1337328462, NULL, 'jabberpassword', '', NULL),
(710, 2, 1337328462, NULL, 'jabberport', '5222', NULL),
(711, 2, 1337328463, NULL, 'smtphosts', '', NULL),
(712, 2, 1337328463, NULL, 'smtpuser', '', NULL),
(713, 2, 1337328463, NULL, 'smtppass', '', NULL),
(714, 2, 1337328463, NULL, 'smtpmaxbulk', '1', NULL),
(715, 2, 1337328463, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(716, 2, 1337328463, NULL, 'sitemailcharset', '0', NULL),
(717, 2, 1337328463, NULL, 'allowusermailcharset', '0', NULL),
(718, 2, 1337328463, NULL, 'mailnewline', 'LF', NULL),
(719, 2, 1337328463, 'enrol_cohort', 'roleid', '5', NULL),
(720, 2, 1337328463, 'enrol_database', 'defaultrole', '5', NULL),
(721, 2, 1337328463, 'enrol_database', 'defaultcategory', '1', NULL),
(722, 2, 1337328463, 'enrol_flatfile', 'map_1', 'manager', NULL),
(723, 2, 1337328463, 'enrol_flatfile', 'map_2', 'coursecreator', NULL),
(724, 2, 1337328463, 'enrol_flatfile', 'map_3', 'editingteacher', NULL),
(725, 2, 1337328463, 'enrol_flatfile', 'map_4', 'teacher', NULL),
(726, 2, 1337328463, 'enrol_flatfile', 'map_5', 'student', NULL),
(727, 2, 1337328463, 'enrol_flatfile', 'map_6', 'guest', NULL),
(728, 2, 1337328463, 'enrol_flatfile', 'map_7', 'user', NULL),
(729, 2, 1337328463, 'enrol_flatfile', 'map_8', 'frontpage', NULL),
(730, 2, 1337328463, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(731, 2, 1337328463, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(732, 2, 1337328463, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(733, 2, 1337328464, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(734, 2, 1337328464, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(735, 2, 1337328464, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(736, 2, 1337328464, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(737, 2, 1337328464, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(738, 2, 1337328464, 'enrol_ldap', 'category', '1', NULL),
(739, 2, 1337328464, 'enrol_manual', 'roleid', '5', NULL),
(740, 2, 1337328464, 'enrol_meta', 'nosyncroleids', '', NULL),
(741, 2, 1337328464, 'enrol_meta', 'syncall', '1', NULL),
(742, 2, 1337328464, 'enrol_meta', 'unenrolaction', '0', NULL),
(743, 2, 1337328464, 'enrol_mnet', 'roleid', '5', NULL),
(744, 2, 1337328464, 'enrol_mnet', 'roleid_adv', '1', NULL),
(745, 2, 1337328464, 'enrol_paypal', 'roleid', '5', NULL),
(746, 2, 1337328464, 'enrol_self', 'roleid', '5', NULL),
(747, 2, 1337328464, NULL, 'profileroles', '5,4,3', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(748, 2, 1337328464, NULL, 'defaultallowedmodules', '', NULL),
(749, 2, 1337328464, NULL, 'coursecontact', '3', NULL),
(750, 2, 1337328464, NULL, 'frontpage', '1', NULL),
(751, 2, 1337328464, NULL, 'frontpageloggedin', '1', NULL),
(752, 2, 1337328464, NULL, 'maxcategorydepth', '0', NULL),
(753, 2, 1337328464, NULL, 'commentsperpage', '15', NULL),
(754, 2, 1337328465, NULL, 'coursesperpage', '20', NULL),
(755, 2, 1337328465, NULL, 'defaultfrontpageroleid', '8', NULL),
(756, 2, 1337328465, NULL, 'supportname', 'Admin User', NULL),
(757, 2, 1337328465, NULL, 'supportemail', 'admin@admin.com', NULL),
(758, 2, 1337328484, NULL, 'registerauth', '', NULL),
(759, 2, 1337328519, NULL, 'profileroles', '3,4,5', '5,4,3'),
(760, 2, 1337328519, NULL, 'minpasswordlength', '1', '8'),
(761, 2, 1337328519, NULL, 'minpassworddigits', '0', '1'),
(762, 2, 1337328519, NULL, 'minpasswordlower', '0', '1'),
(763, 2, 1337328519, NULL, 'minpasswordupper', '0', '1'),
(764, 2, 1337328519, NULL, 'minpasswordnonalphanum', '0', '1'),
(765, 2, 1337757731, 'moodlecourse', 'enablecompletion', '1', '0'),
(766, 2, 1337757731, 'moodlecourse', 'completionstartonenrol', '1', '0'),
(767, 2, 1337757881, NULL, 'enablecompletion', '1', '0'),
(768, 2, 1337757881, NULL, 'enableavailability', '1', '0'),
(769, 2, 1337757926, NULL, 'enableoutcomes', '1', '0');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=799 ;

--
-- 转存表中的数据 `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'format', 'weeks'),
(2, 'moodlecourse', 'maxsections', '52'),
(3, 'moodlecourse', 'numsections', '10'),
(4, 'moodlecourse', 'hiddensections', '0'),
(5, 'moodlecourse', 'newsitems', '5'),
(6, 'moodlecourse', 'showgrades', '1'),
(7, 'moodlecourse', 'showreports', '0'),
(8, 'moodlecourse', 'maxbytes', '104857600'),
(9, 'moodlecourse', 'groupmode', '0'),
(10, 'moodlecourse', 'groupmodeforce', '0'),
(11, 'moodlecourse', 'visible', '1'),
(12, 'moodlecourse', 'lang', ''),
(13, 'moodlecourse', 'enablecompletion', '1'),
(14, 'moodlecourse', 'completionstartonenrol', '1'),
(15, 'backup', 'loglifetime', '30'),
(16, 'backup', 'backup_general_users', '1'),
(17, 'backup', 'backup_general_users_locked', '0'),
(18, 'backup', 'backup_general_anonymize', '0'),
(19, 'backup', 'backup_general_anonymize_locked', '0'),
(20, 'backup', 'backup_general_role_assignments', '1'),
(21, 'backup', 'backup_general_role_assignments_locked', '0'),
(22, 'backup', 'backup_general_activities', '1'),
(23, 'backup', 'backup_general_activities_locked', '0'),
(24, 'backup', 'backup_general_blocks', '1'),
(25, 'backup', 'backup_general_blocks_locked', '0'),
(26, 'backup', 'backup_general_filters', '1'),
(27, 'backup', 'backup_general_filters_locked', '0'),
(28, 'backup', 'backup_general_comments', '1'),
(29, 'backup', 'backup_general_comments_locked', '0'),
(30, 'backup', 'backup_general_userscompletion', '1'),
(31, 'backup', 'backup_general_userscompletion_locked', '0'),
(32, 'backup', 'backup_general_logs', '0'),
(33, 'backup', 'backup_general_logs_locked', '0'),
(34, 'backup', 'backup_general_histories', '0'),
(35, 'backup', 'backup_general_histories_locked', '0'),
(36, 'backup', 'backup_auto_active', '0'),
(37, 'backup', 'backup_auto_weekdays', '0000000'),
(38, 'backup', 'backup_auto_hour', '0'),
(39, 'backup', 'backup_auto_minute', '0'),
(40, 'backup', 'backup_auto_storage', '0'),
(41, 'backup', 'backup_auto_destination', ''),
(42, 'backup', 'backup_auto_keep', '1'),
(43, 'backup', 'backup_shortname', '0'),
(44, 'backup', 'backup_auto_users', '1'),
(45, 'backup', 'backup_auto_role_assignments', '1'),
(46, 'backup', 'backup_auto_activities', '1'),
(47, 'backup', 'backup_auto_blocks', '1'),
(48, 'backup', 'backup_auto_filters', '1'),
(49, 'backup', 'backup_auto_comments', '1'),
(50, 'backup', 'backup_auto_userscompletion', '1'),
(51, 'backup', 'backup_auto_logs', '0'),
(52, 'backup', 'backup_auto_histories', '0'),
(53, 'enrol_database', 'dbtype', ''),
(54, 'enrol_database', 'dbhost', 'localhost'),
(55, 'enrol_database', 'dbuser', ''),
(56, 'enrol_database', 'dbpass', ''),
(57, 'enrol_database', 'dbname', ''),
(58, 'enrol_database', 'dbencoding', 'utf-8'),
(59, 'enrol_database', 'dbsetupsql', ''),
(60, 'enrol_database', 'dbsybasequoting', '0'),
(61, 'enrol_database', 'debugdb', '0'),
(62, 'enrol_database', 'localcoursefield', 'idnumber'),
(63, 'enrol_database', 'localuserfield', 'idnumber'),
(64, 'enrol_database', 'localrolefield', 'shortname'),
(65, 'enrol_database', 'remoteenroltable', ''),
(66, 'enrol_database', 'remotecoursefield', ''),
(67, 'enrol_database', 'remoteuserfield', ''),
(68, 'enrol_database', 'remoterolefield', ''),
(69, 'enrol_database', 'ignorehiddencourses', '0'),
(70, 'enrol_database', 'unenrolaction', '0'),
(71, 'enrol_database', 'newcoursetable', ''),
(72, 'enrol_database', 'newcoursefullname', 'fullname'),
(73, 'enrol_database', 'newcourseshortname', 'shortname'),
(74, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(75, 'enrol_database', 'newcoursecategory', ''),
(76, 'enrol_database', 'templatecourse', ''),
(77, 'enrol_flatfile', 'location', ''),
(78, 'enrol_flatfile', 'mailstudents', '0'),
(79, 'enrol_flatfile', 'mailteachers', '0'),
(80, 'enrol_flatfile', 'mailadmins', '0'),
(81, 'enrol_guest', 'requirepassword', '0'),
(82, 'enrol_guest', 'usepasswordpolicy', '0'),
(83, 'enrol_guest', 'showhint', '0'),
(84, 'enrol_guest', 'defaultenrol', '1'),
(85, 'enrol_guest', 'status', '1'),
(86, 'enrol_guest', 'status_adv', '0'),
(87, 'enrol_imsenterprise', 'imsfilelocation', ''),
(88, 'enrol_imsenterprise', 'logtolocation', ''),
(89, 'enrol_imsenterprise', 'mailadmins', '0'),
(90, 'enrol_imsenterprise', 'createnewusers', '0'),
(91, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(92, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(93, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(94, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(95, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(96, 'enrol_imsenterprise', 'createnewcourses', '0'),
(97, 'enrol_imsenterprise', 'createnewcategories', '0'),
(98, 'enrol_imsenterprise', 'imsunenrol', '0'),
(99, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(100, 'enrol_imsenterprise', 'imscapitafix', '0'),
(101, 'enrol_ldap', 'host_url', ''),
(102, 'enrol_ldap', 'ldap_version', '3'),
(103, 'enrol_ldap', 'ldapencoding', 'utf-8'),
(104, 'enrol_ldap', 'bind_dn', ''),
(105, 'enrol_ldap', 'bind_pw', ''),
(106, 'enrol_ldap', 'course_search_sub', '0'),
(107, 'enrol_ldap', 'memberattribute_isdn', '0'),
(108, 'enrol_ldap', 'user_contexts', ''),
(109, 'enrol_ldap', 'user_search_sub', '0'),
(110, 'enrol_ldap', 'user_type', 'default'),
(111, 'enrol_ldap', 'opt_deref', '0'),
(112, 'enrol_ldap', 'idnumber_attribute', ''),
(113, 'enrol_ldap', 'objectclass', ''),
(114, 'enrol_ldap', 'course_idnumber', ''),
(115, 'enrol_ldap', 'course_shortname', ''),
(116, 'enrol_ldap', 'course_fullname', ''),
(117, 'enrol_ldap', 'course_summary', ''),
(118, 'enrol_ldap', 'ignorehiddencourses', '0'),
(119, 'enrol_ldap', 'unenrolaction', '0'),
(120, 'enrol_ldap', 'autocreate', '0'),
(121, 'enrol_ldap', 'template', ''),
(122, 'enrol_ldap', 'nested_groups', '0'),
(123, 'enrol_ldap', 'group_memberofattribute', ''),
(124, 'enrol_manual', 'defaultenrol', '1'),
(125, 'enrol_manual', 'status', '0'),
(126, 'enrol_manual', 'enrolperiod', '0'),
(127, 'enrol_paypal', 'paypalbusiness', ''),
(128, 'enrol_paypal', 'mailstudents', '0'),
(129, 'enrol_paypal', 'mailteachers', '0'),
(130, 'enrol_paypal', 'mailadmins', '0'),
(131, 'enrol_paypal', 'status', '1'),
(132, 'enrol_paypal', 'cost', '0'),
(133, 'enrol_paypal', 'currency', 'USD'),
(134, 'enrol_paypal', 'enrolperiod', '0'),
(135, 'enrol_self', 'requirepassword', '0'),
(136, 'enrol_self', 'usepasswordpolicy', '0'),
(137, 'enrol_self', 'showhint', '0'),
(138, 'enrol_self', 'defaultenrol', '1'),
(139, 'enrol_self', 'status', '1'),
(140, 'enrol_self', 'groupkey', '0'),
(141, 'enrol_self', 'enrolperiod', '0'),
(142, 'enrol_self', 'longtimenosee', '0'),
(143, 'enrol_self', 'maxenrolled', '0'),
(144, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(145, 'editor_tinymce', 'spellengine', 'GoogleSpell'),
(146, 'editor_tinymce', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(147, 'filter_urltolink', 'formats', '0'),
(148, 'filter_urltolink', 'embedimages', '1'),
(149, 'filter_emoticon', 'formats', '1,4,0'),
(150, 'theme_afterburner', 'logo', ''),
(151, 'theme_afterburner', 'footnote', ''),
(152, 'theme_afterburner', 'customcss', ''),
(153, 'theme_arialist', 'logo', ''),
(154, 'theme_arialist', 'tagline', ''),
(155, 'theme_arialist', 'linkcolor', '#f25f0f'),
(156, 'theme_arialist', 'regionwidth', '250'),
(157, 'theme_arialist', 'customcss', ''),
(158, 'theme_brick', 'logo', ''),
(159, 'theme_brick', 'linkcolor', '#06365b'),
(160, 'theme_brick', 'linkhover', '#5487ad'),
(161, 'theme_brick', 'maincolor', '#8e2800'),
(162, 'theme_brick', 'maincolorlink', '#fff0a5'),
(163, 'theme_brick', 'headingcolor', '#5c3500'),
(164, 'theme_formal_white', 'fontsizereference', '13'),
(165, 'theme_formal_white', 'noframe', '0'),
(166, 'theme_formal_white', 'displaylogo', '1'),
(167, 'theme_formal_white', 'logo', ''),
(168, 'theme_formal_white', 'frontpagelogo', ''),
(169, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(170, 'theme_formal_white', 'creditstomoodleorg', '2'),
(171, 'theme_formal_white', 'blockcolumnwidth', '200'),
(172, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(173, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(174, 'theme_formal_white', 'rblockcolumnbgc', ''),
(175, 'theme_formal_white', 'footnote', ''),
(176, 'theme_formal_white', 'customcss', ''),
(177, 'theme_fusion', 'linkcolor', '#2d83d5'),
(178, 'theme_fusion', 'tagline', ''),
(179, 'theme_fusion', 'footertext', ''),
(180, 'theme_fusion', 'customcss', ''),
(181, 'theme_magazine', 'background', ''),
(182, 'theme_magazine', 'logo', ''),
(183, 'theme_magazine', 'linkcolor', '#32529a'),
(184, 'theme_magazine', 'linkhover', '#4e2300'),
(185, 'theme_magazine', 'maincolor', '#002f2f'),
(186, 'theme_magazine', 'maincoloraccent', '#092323'),
(187, 'theme_magazine', 'headingcolor', '#4e0000'),
(188, 'theme_magazine', 'blockcolor', '#002f2f'),
(189, 'theme_magazine', 'forumback', '#e6e2af'),
(190, 'theme_mymobile', 'colourswatch', 'light'),
(191, 'theme_mymobile', 'showmobileintro', ''),
(192, 'theme_mymobile', 'showsitetopic', 'topicshow'),
(193, 'theme_mymobile', 'showfullsizeimages', 'ithumb'),
(194, 'theme_mymobile', 'usetableview', 'tabshow'),
(195, 'theme_nimble', 'tagline', ''),
(196, 'theme_nimble', 'footerline', ''),
(197, 'theme_nimble', 'backgroundcolor', '#454545'),
(198, 'theme_nimble', 'linkcolor', '#2a65b1'),
(199, 'theme_nimble', 'linkhover', '#222222'),
(200, 'theme_nonzero', 'regionprewidth', '200'),
(201, 'theme_nonzero', 'regionpostwidth', '200'),
(202, 'theme_nonzero', 'customcss', ''),
(203, 'theme_overlay', 'linkcolor', '#428ab5'),
(204, 'theme_overlay', 'headercolor', '#2a4c7b'),
(205, 'theme_overlay', 'footertext', ''),
(206, 'theme_overlay', 'customcss', ''),
(207, 'theme_sky_high', 'logo', ''),
(208, 'theme_sky_high', 'regionwidth', '240'),
(209, 'theme_sky_high', 'footnote', ''),
(210, 'theme_sky_high', 'customcss', ''),
(211, 'theme_splash', 'logo', ''),
(212, 'theme_splash', 'tagline', 'Virtual learning center'),
(213, 'theme_splash', 'hide_tagline', '0'),
(214, 'theme_splash', 'footnote', ''),
(215, 'theme_splash', 'customcss', ''),
(216, 'qtype_calculated', 'version', '2011102700'),
(217, 'qtype_calculatedmulti', 'version', '2011102700'),
(218, 'qtype_calculatedsimple', 'version', '2011102700'),
(219, 'qtype_description', 'version', '2011102700'),
(220, 'qtype_essay', 'version', '2011102700'),
(221, 'qtype_match', 'version', '2011102700'),
(222, 'qtype_missingtype', 'version', '2011102700'),
(223, 'qtype_multianswer', 'version', '2011102700'),
(224, 'qtype_multichoice', 'version', '2011102700'),
(225, 'qtype_numerical', 'version', '2011102700'),
(226, 'qtype_random', 'version', '2011102700'),
(227, 'qtype_randomsamatch', 'version', '2010090501'),
(228, 'qtype_shortanswer', 'version', '2011102700'),
(229, 'qtype_truefalse', 'version', '2011102700'),
(238, 'auth_cas', 'version', '2011112900'),
(240, 'auth_db', 'version', '2011112900'),
(242, 'auth_email', 'version', '2011112900'),
(243, 'auth_fc', 'version', '2011112900'),
(245, 'auth_imap', 'version', '2011112900'),
(247, 'auth_ldap', 'version', '2011112900'),
(249, 'auth_manual', 'version', '2011112900'),
(250, 'auth_mnet', 'version', '2011112900'),
(252, 'auth_nntp', 'version', '2011112900'),
(254, 'auth_nologin', 'version', '2011112900'),
(255, 'auth_none', 'version', '2011112900'),
(256, 'auth_pam', 'version', '2011112900'),
(258, 'auth_pop3', 'version', '2011112900'),
(260, 'auth_radius', 'version', '2011112900'),
(262, 'auth_shibboleth', 'version', '2011112900'),
(264, 'auth_webservice', 'version', '2011112900'),
(265, 'enrol_authorize', 'version', '2011112902'),
(266, 'enrol_category', 'version', '2011112900'),
(268, 'enrol_cohort', 'version', '2011112900'),
(269, 'enrol_database', 'version', '2011112900'),
(271, 'enrol_flatfile', 'version', '2011112901'),
(272, 'enrol_guest', 'version', '2011112901'),
(274, 'enrol_imsenterprise', 'version', '2011112901'),
(276, 'enrol_ldap', 'version', '2011112900'),
(278, 'enrol_manual', 'version', '2011112901'),
(280, 'enrol_meta', 'version', '2011112901'),
(282, 'enrol_mnet', 'version', '2011112900'),
(283, 'enrol_paypal', 'version', '2011112901'),
(284, 'enrol_self', 'version', '2011112900'),
(286, 'message_email', 'version', '2011112900'),
(288, 'message', 'email_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(289, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedin', 'email'),
(290, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedoff', 'email'),
(291, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(292, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(293, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(294, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(295, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(296, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(297, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(298, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(299, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(300, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(301, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(302, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(303, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(304, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(305, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(306, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(307, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(308, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(309, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(310, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(311, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(312, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(313, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(314, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(315, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(316, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(317, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(318, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(319, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(320, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(321, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(322, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(323, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(324, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(325, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(326, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(327, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(328, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(329, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(330, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(331, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(332, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(333, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(334, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(335, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(336, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(337, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(338, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(339, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(340, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(341, 'message_jabber', 'version', '2011112900'),
(343, 'message', 'jabber_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(344, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(345, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(346, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(347, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(348, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(349, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(350, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(351, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(352, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(353, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(354, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(355, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(356, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(357, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(358, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(359, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(360, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(361, 'message_popup', 'version', '2011112900'),
(363, 'message', 'popup_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(364, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(365, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(366, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(367, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(368, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(369, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(370, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(371, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(372, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(373, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(374, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(375, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(376, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(377, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(378, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(379, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(380, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(381, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(383, 'filter_activitynames', 'version', '2011112900'),
(384, 'filter_algebra', 'version', '2011112900'),
(385, 'filter_censor', 'version', '2011112900'),
(386, 'filter_data', 'version', '2011102800'),
(388, 'filter_emailprotect', 'version', '2011112900'),
(389, 'filter_emoticon', 'version', '2011112900'),
(390, 'filter_glossary', 'version', '2011102800'),
(392, 'filter_mediaplugin', 'version', '2011112900'),
(394, 'filter_multilang', 'version', '2011112900'),
(395, 'filter_tex', 'version', '2011112900'),
(397, 'filter_tidy', 'version', '2011112900'),
(398, 'filter_urltolink', 'version', '2011112900'),
(399, 'editor_textarea', 'version', '2011112900'),
(400, 'editor_tinymce', 'version', '2012030300'),
(401, 'format_scorm', 'version', '2011120100'),
(402, 'format_social', 'version', '2011120100'),
(403, 'format_topics', 'version', '2011120100'),
(404, 'format_weeks', 'version', '2011120100'),
(405, 'profilefield_checkbox', 'version', '2011112900'),
(406, 'profilefield_datetime', 'version', '2011112900'),
(407, 'profilefield_menu', 'version', '2011112900'),
(408, 'profilefield_text', 'version', '2011112900'),
(409, 'profilefield_textarea', 'version', '2011112900'),
(410, 'report_backups', 'version', '2011110300'),
(411, 'report_completion', 'version', '2011110300'),
(413, 'report_configlog', 'version', '2011110300'),
(414, 'report_courseoverview', 'version', '2011110300'),
(415, 'report_log', 'version', '2011110300'),
(417, 'report_loglive', 'version', '2011110300'),
(418, 'report_outline', 'version', '2011110300'),
(420, 'report_participation', 'version', '2011110300'),
(422, 'report_progress', 'version', '2011110300'),
(424, 'report_questioninstances', 'version', '2011110300'),
(425, 'report_security', 'version', '2011110300'),
(426, 'report_stats', 'version', '2011110300'),
(428, 'gradeexport_ods', 'version', '2011112900'),
(429, 'gradeexport_txt', 'version', '2011112900'),
(430, 'gradeexport_xls', 'version', '2011112900'),
(431, 'gradeexport_xml', 'version', '2011112900'),
(432, 'gradeimport_csv', 'version', '2011112900'),
(433, 'gradeimport_xml', 'version', '2011112900'),
(434, 'gradereport_grader', 'version', '2011112900'),
(435, 'gradereport_outcomes', 'version', '2011112900'),
(436, 'gradereport_overview', 'version', '2011112900'),
(437, 'gradereport_user', 'version', '2011112900'),
(438, 'gradingform_rubric', 'version', '2011110900'),
(439, 'mnetservice_enrol', 'version', '2011112900'),
(440, 'webservice_amf', 'version', '2011112900'),
(441, 'webservice_rest', 'version', '2011112900'),
(442, 'webservice_soap', 'version', '2011112900'),
(443, 'webservice_xmlrpc', 'version', '2011112900'),
(444, 'repository_alfresco', 'version', '2011112900'),
(445, 'repository_boxnet', 'version', '2011112900'),
(446, 'repository_coursefiles', 'version', '2012010100'),
(447, 'repository_dropbox', 'version', '2011112900'),
(448, 'repository_filesystem', 'version', '2012010100'),
(449, 'repository_flickr', 'version', '2011112900'),
(450, 'repository_flickr_public', 'version', '2011112900'),
(451, 'repository_googledocs', 'version', '2011112900'),
(452, 'repository_local', 'version', '2012010100'),
(454, 'local', 'enablecourseinstances', '0'),
(455, 'local', 'enableuserinstances', '0'),
(456, 'repository_merlot', 'version', '2011112900'),
(457, 'repository_picasa', 'version', '2011112900'),
(458, 'repository_recent', 'version', '2011112900'),
(460, 'recent', 'enablecourseinstances', '0'),
(461, 'recent', 'enableuserinstances', '0'),
(462, 'repository_s3', 'version', '2011112900'),
(463, 'repository_upload', 'version', '2011112900'),
(465, 'upload', 'enablecourseinstances', '0'),
(466, 'upload', 'enableuserinstances', '0'),
(467, 'repository_url', 'version', '2011112900'),
(468, 'repository_user', 'version', '2011112900'),
(470, 'user', 'enablecourseinstances', '0'),
(471, 'user', 'enableuserinstances', '0'),
(472, 'repository_webdav', 'version', '2012010100'),
(473, 'repository_wikimedia', 'version', '2011112900'),
(474, 'repository_youtube', 'version', '2011112900'),
(475, 'portfolio_boxnet', 'version', '2011112900'),
(476, 'portfolio_download', 'version', '2011112900'),
(477, 'portfolio_flickr', 'version', '2011112900'),
(478, 'portfolio_googledocs', 'version', '2011112900'),
(479, 'portfolio_mahara', 'version', '2011112900'),
(480, 'portfolio_picasa', 'version', '2011112900'),
(481, 'qbehaviour_adaptive', 'version', '2011102700'),
(482, 'qbehaviour_adaptivenopenalty', 'version', '2011102700'),
(483, 'qbehaviour_deferredcbm', 'version', '2011102700'),
(484, 'qbehaviour_deferredfeedback', 'version', '2011102700'),
(485, 'qbehaviour_immediatecbm', 'version', '2011102700'),
(486, 'qbehaviour_immediatefeedback', 'version', '2011102700'),
(487, 'qbehaviour_informationitem', 'version', '2011102700'),
(488, 'qbehaviour_interactive', 'version', '2011102700'),
(489, 'qbehaviour_interactivecountback', 'version', '2011102700'),
(490, 'qbehaviour_manualgraded', 'version', '2011102700'),
(491, 'qbehaviour_missing', 'version', '2011102700'),
(492, 'qformat_aiken', 'version', '2011102700'),
(493, 'qformat_blackboard', 'version', '2011102700'),
(494, 'qformat_blackboard_six', 'version', '2011102700'),
(495, 'qformat_examview', 'version', '2011102700'),
(496, 'qformat_gift', 'version', '2011102700'),
(497, 'qformat_learnwise', 'version', '2011102700'),
(498, 'qformat_missingword', 'version', '2011102700'),
(499, 'qformat_multianswer', 'version', '2011102700'),
(500, 'qformat_webct', 'version', '2011102700'),
(501, 'qformat_xhtml', 'version', '2011102700'),
(502, 'qformat_xml', 'version', '2011102700'),
(503, 'tool_bloglevelupgrade', 'version', '2011092500'),
(505, 'tool_capability', 'version', '2011092500'),
(506, 'tool_customlang', 'version', '2011092500'),
(508, 'tool_dbtransfer', 'version', '2011092500'),
(509, 'tool_generator', 'version', '2011092500'),
(510, 'tool_health', 'version', '2011092500'),
(511, 'tool_innodb', 'version', '2011092500'),
(512, 'tool_langimport', 'version', '2011092500'),
(513, 'tool_multilangupgrade', 'version', '2011092500'),
(514, 'tool_profiling', 'version', '2011092500'),
(515, 'tool_qeupgradehelper', 'version', '2011092500'),
(517, 'tool_replace', 'version', '2011092500'),
(518, 'tool_spamcleaner', 'version', '2011092500'),
(519, 'tool_timezoneimport', 'version', '2011092500'),
(520, 'tool_unittest', 'version', '2011092500'),
(522, 'tool_unsuproles', 'version', '2011092500'),
(524, 'tool_uploaduser', 'version', '2011092500'),
(525, 'tool_xmldb', 'version', '2011092500'),
(526, 'theme_afterburner', 'version', '2011082400'),
(527, 'theme_anomaly', 'version', '2011082400'),
(528, 'theme_arialist', 'version', '2011082400'),
(529, 'theme_base', 'version', '2011082400'),
(530, 'theme_binarius', 'version', '2011082400'),
(531, 'theme_boxxie', 'version', '2011082400'),
(532, 'theme_brick', 'version', '2011082400'),
(533, 'theme_canvas', 'version', '2011082400'),
(534, 'theme_formal_white', 'version', '2011082400'),
(536, 'theme_formfactor', 'version', '2011082400'),
(537, 'theme_fusion', 'version', '2011082400'),
(538, 'theme_leatherbound', 'version', '2011082400'),
(539, 'theme_magazine', 'version', '2011082400'),
(540, 'theme_mymobile', 'version', '2011101801'),
(541, 'theme_nimble', 'version', '2011082400'),
(542, 'theme_nonzero', 'version', '2011082400'),
(543, 'theme_overlay', 'version', '2011082400'),
(544, 'theme_serenity', 'version', '2011082400'),
(545, 'theme_sky_high', 'version', '2011082400'),
(546, 'theme_splash', 'version', '2011082400'),
(547, 'theme_standard', 'version', '2011082400'),
(548, 'theme_standardold', 'version', '2011082400'),
(549, 'assignment_offline', 'version', '2011112900'),
(550, 'assignment_online', 'version', '2011112900'),
(551, 'assignment_upload', 'version', '2011112900'),
(552, 'assignment_uploadsingle', 'version', '2011112900'),
(553, 'datafield_checkbox', 'version', '2011112900'),
(554, 'datafield_date', 'version', '2011112900'),
(555, 'datafield_file', 'version', '2011112900'),
(556, 'datafield_latlong', 'version', '2011112900'),
(557, 'datafield_menu', 'version', '2011112900'),
(558, 'datafield_multimenu', 'version', '2011112900'),
(559, 'datafield_number', 'version', '2011112900'),
(560, 'datafield_picture', 'version', '2011112900'),
(561, 'datafield_radiobutton', 'version', '2011112900'),
(562, 'datafield_text', 'version', '2011112900'),
(563, 'datafield_textarea', 'version', '2011112900'),
(564, 'datafield_url', 'version', '2011112900'),
(565, 'datapreset_imagegallery', 'version', '2011112900'),
(566, 'quiz_grading', 'version', '2011051200'),
(567, 'quiz_overview', 'version', '2011051200'),
(568, 'quiz_responses', 'version', '2011051200'),
(569, 'quiz_statistics', 'version', '2011122300'),
(571, 'quizaccess_delaybetweenattempts', 'version', '2011092300'),
(572, 'quizaccess_ipaddress', 'version', '2011092300'),
(573, 'quizaccess_numattempts', 'version', '2011092300'),
(574, 'quizaccess_openclosedate', 'version', '2011092300'),
(575, 'quizaccess_password', 'version', '2011092300'),
(576, 'quizaccess_safebrowser', 'version', '2011092300'),
(577, 'quizaccess_securewindow', 'version', '2011092300'),
(578, 'quizaccess_timelimit', 'version', '2011092300'),
(579, 'scormreport_basic', 'version', '2011071100'),
(580, 'scormreport_interactions', 'version', '2011110100'),
(581, 'workshopform_accumulative', 'version', '2010091700'),
(583, 'workshopform_comments', 'version', '2010091700'),
(585, 'workshopform_numerrors', 'version', '2010091700'),
(587, 'workshopform_rubric', 'version', '2010091700'),
(589, 'workshopallocation_manual', 'version', '2010090501'),
(590, 'workshopallocation_random', 'version', '2010090501'),
(591, 'workshopeval_best', 'version', '2010090501'),
(592, 'folder', 'requiremodintro', '1'),
(593, 'imscp', 'requiremodintro', '1'),
(594, 'imscp', 'keepold', '1'),
(595, 'imscp', 'keepold_adv', '0'),
(596, 'page', 'requiremodintro', '1'),
(597, 'page', 'displayoptions', '5'),
(598, 'page', 'printheading', '1'),
(599, 'page', 'printheading_adv', '0'),
(600, 'page', 'printintro', '0'),
(601, 'page', 'printintro_adv', '0'),
(602, 'page', 'display', '5'),
(603, 'page', 'display_adv', '1'),
(604, 'page', 'popupwidth', '620'),
(605, 'page', 'popupwidth_adv', '1'),
(606, 'page', 'popupheight', '450'),
(607, 'page', 'popupheight_adv', '1'),
(608, 'quiz', 'timelimit', '0'),
(609, 'quiz', 'timelimit_adv', '0'),
(610, 'quiz', 'attempts', '0'),
(611, 'quiz', 'attempts_adv', '0'),
(612, 'quiz', 'grademethod', '1'),
(613, 'quiz', 'grademethod_adv', '0'),
(614, 'quiz', 'maximumgrade', '10'),
(615, 'quiz', 'shufflequestions', '0'),
(616, 'quiz', 'shufflequestions_adv', '0'),
(617, 'quiz', 'questionsperpage', '1'),
(618, 'quiz', 'questionsperpage_adv', '0'),
(619, 'quiz', 'shuffleanswers', '1'),
(620, 'quiz', 'shuffleanswers_adv', '0'),
(621, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(622, 'quiz', 'attemptonlast', '0'),
(623, 'quiz', 'attemptonlast_adv', '1'),
(624, 'quiz', 'reviewattempt', '69904'),
(625, 'quiz', 'reviewcorrectness', '69904'),
(626, 'quiz', 'reviewmarks', '69904'),
(627, 'quiz', 'reviewspecificfeedback', '69904'),
(628, 'quiz', 'reviewgeneralfeedback', '69904'),
(629, 'quiz', 'reviewrightanswer', '69904'),
(630, 'quiz', 'reviewoverallfeedback', '4368'),
(631, 'quiz', 'showuserpicture', '0'),
(632, 'quiz', 'showuserpicture_adv', '0'),
(633, 'quiz', 'decimalpoints', '2'),
(634, 'quiz', 'decimalpoints_adv', '0'),
(635, 'quiz', 'questiondecimalpoints', '-1'),
(636, 'quiz', 'questiondecimalpoints_adv', '0'),
(637, 'quiz', 'showblocks', '0'),
(638, 'quiz', 'showblocks_adv', '1'),
(639, 'quiz', 'password', ''),
(640, 'quiz', 'password_adv', '0'),
(641, 'quiz', 'subnet', ''),
(642, 'quiz', 'subnet_adv', '0'),
(643, 'quiz', 'delay1', '0'),
(644, 'quiz', 'delay1_adv', '0'),
(645, 'quiz', 'delay2', '0'),
(646, 'quiz', 'delay2_adv', '0'),
(647, 'quiz', 'browsersecurity', '-'),
(648, 'quiz', 'browsersecurity_adv', '1'),
(649, 'resource', 'framesize', '130'),
(650, 'resource', 'requiremodintro', '1'),
(651, 'resource', 'displayoptions', '0,1,4,5,6'),
(652, 'resource', 'printheading', '0'),
(653, 'resource', 'printheading_adv', '0'),
(654, 'resource', 'printintro', '1'),
(655, 'resource', 'printintro_adv', '0'),
(656, 'resource', 'display', '0'),
(657, 'resource', 'display_adv', '0'),
(658, 'resource', 'popupwidth', '620'),
(659, 'resource', 'popupwidth_adv', '1'),
(660, 'resource', 'popupheight', '450'),
(661, 'resource', 'popupheight_adv', '1'),
(662, 'resource', 'filterfiles', '0'),
(663, 'resource', 'filterfiles_adv', '1'),
(664, 'scorm', 'displaycoursestructure', '0'),
(665, 'scorm', 'displaycoursestructure_adv', '0'),
(666, 'scorm', 'popup', '0'),
(667, 'scorm', 'popup_adv', '0'),
(668, 'scorm', 'framewidth', '100'),
(669, 'scorm', 'framewidth_adv', '1'),
(670, 'scorm', 'frameheight', '500'),
(671, 'scorm', 'frameheight_adv', '1'),
(672, 'scorm', 'winoptgrp_adv', '1'),
(673, 'scorm', 'resizable', '0'),
(674, 'scorm', 'scrollbars', '0'),
(675, 'scorm', 'directories', '0'),
(676, 'scorm', 'location', '0'),
(677, 'scorm', 'menubar', '0'),
(678, 'scorm', 'toolbar', '0'),
(679, 'scorm', 'status', '0'),
(680, 'scorm', 'skipview', '0'),
(681, 'scorm', 'skipview_adv', '1'),
(682, 'scorm', 'hidebrowse', '0'),
(683, 'scorm', 'hidebrowse_adv', '1'),
(684, 'scorm', 'hidetoc', '0'),
(685, 'scorm', 'hidetoc_adv', '1'),
(686, 'scorm', 'hidenav', '0'),
(687, 'scorm', 'hidenav_adv', '0'),
(688, 'scorm', 'grademethod', '1'),
(689, 'scorm', 'grademethod_adv', '0'),
(690, 'scorm', 'maxgrade', '100'),
(691, 'scorm', 'maxgrade_adv', '0'),
(692, 'scorm', 'maxattempts', '0'),
(693, 'scorm', 'maxattempts_adv', '0'),
(694, 'scorm', 'whatgrade', '0'),
(695, 'scorm', 'whatgrade_adv', '0'),
(696, 'scorm', 'displayattemptstatus', '1'),
(697, 'scorm', 'displayattemptstatus_adv', '0'),
(698, 'scorm', 'forcecompleted', '0'),
(699, 'scorm', 'forcecompleted_adv', '1'),
(700, 'scorm', 'forcenewattempt', '0'),
(701, 'scorm', 'forcenewattempt_adv', '1'),
(702, 'scorm', 'lastattemptlock', '0'),
(703, 'scorm', 'lastattemptlock_adv', '1'),
(704, 'scorm', 'auto', '0'),
(705, 'scorm', 'auto_adv', '1'),
(706, 'scorm', 'updatefreq', '0'),
(707, 'scorm', 'updatefreq_adv', '1'),
(708, 'scorm', 'allowtypeexternal', '0'),
(709, 'scorm', 'allowtypelocalsync', '0'),
(710, 'scorm', 'allowtypeimsrepository', '0'),
(711, 'scorm', 'allowtypeexternalaicc', '0'),
(712, 'scorm', 'allowaicchacp', '0'),
(713, 'scorm', 'aicchacptimeout', '30'),
(714, 'scorm', 'aicchacpkeepsessiondata', '1'),
(715, 'scorm', 'forcejavascript', '1'),
(716, 'scorm', 'allowapidebug', '0'),
(717, 'scorm', 'apidebugmask', '.*'),
(718, 'url', 'framesize', '130'),
(719, 'url', 'requiremodintro', '1'),
(720, 'url', 'secretphrase', ''),
(721, 'url', 'rolesinparams', '0'),
(722, 'url', 'displayoptions', '0,1,5,6'),
(723, 'url', 'printheading', '0'),
(724, 'url', 'printheading_adv', '0'),
(725, 'url', 'printintro', '1'),
(726, 'url', 'printintro_adv', '0'),
(727, 'url', 'display', '0'),
(728, 'url', 'display_adv', '0'),
(729, 'url', 'popupwidth', '620'),
(730, 'url', 'popupwidth_adv', '1'),
(731, 'url', 'popupheight', '450'),
(732, 'url', 'popupheight_adv', '1'),
(733, 'workshop', 'grade', '80'),
(734, 'workshop', 'gradinggrade', '20'),
(735, 'workshop', 'gradedecimals', '0'),
(736, 'workshop', 'maxbytes', '0'),
(737, 'workshop', 'strategy', 'accumulative'),
(738, 'workshop', 'examplesmode', '0'),
(739, 'workshopallocation_random', 'numofreviews', '5'),
(740, 'workshopform_numerrors', 'grade0', 'No'),
(741, 'workshopform_numerrors', 'grade1', 'Yes'),
(742, 'workshopeval_best', 'comparison', '5'),
(743, 'blocks/section_links', 'numsections1', '22'),
(744, 'blocks/section_links', 'incby1', '2'),
(745, 'blocks/section_links', 'numsections2', '40'),
(746, 'blocks/section_links', 'incby2', '5'),
(747, 'enrol_cohort', 'roleid', '5'),
(748, 'enrol_database', 'defaultrole', '5'),
(749, 'enrol_database', 'defaultcategory', '1'),
(750, 'enrol_flatfile', 'map_1', 'manager'),
(751, 'enrol_flatfile', 'map_2', 'coursecreator'),
(752, 'enrol_flatfile', 'map_3', 'editingteacher'),
(753, 'enrol_flatfile', 'map_4', 'teacher'),
(754, 'enrol_flatfile', 'map_5', 'student'),
(755, 'enrol_flatfile', 'map_6', 'guest'),
(756, 'enrol_flatfile', 'map_7', 'user'),
(757, 'enrol_flatfile', 'map_8', 'frontpage'),
(758, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(759, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(760, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(761, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(762, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(763, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(764, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(765, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(766, 'enrol_ldap', 'category', '1'),
(767, 'enrol_manual', 'roleid', '5'),
(768, 'enrol_meta', 'nosyncroleids', ''),
(769, 'enrol_meta', 'syncall', '1'),
(770, 'enrol_meta', 'unenrolaction', '0'),
(771, 'enrol_mnet', 'roleid', '5'),
(772, 'enrol_mnet', 'roleid_adv', '1'),
(773, 'enrol_paypal', 'roleid', '5'),
(774, 'enrol_self', 'roleid', '5'),
(775, 'auth_googleoauth2', 'version', '2012010900'),
(776, 'auth/googleoauth2', 'googleclientid', ''),
(777, 'auth/googleoauth2', 'googleclientsecret', ''),
(778, 'auth/googleoauth2', 'facebookclientid', '487368041276859'),
(779, 'auth/googleoauth2', 'facebookclientsecret', '3a4f74604214ae12f3a644462acb62df'),
(780, 'auth/googleoauth2', 'messengerclientid', ''),
(781, 'auth/googleoauth2', 'messengerclientsecret', ''),
(782, 'auth/googleoauth2', 'googleipinfodbkey', ''),
(783, 'auth/googleoauth2', 'googleuserprefix', 'social_user_'),
(784, 'auth/googleoauth2', 'field_lock_email', 'locked'),
(785, 'auth/googleoauth2', 'field_lock_firstname', 'unlocked'),
(786, 'auth/googleoauth2', 'field_lock_lastname', 'unlocked'),
(787, 'auth/googleoauth2', 'field_lock_city', 'unlocked'),
(788, 'auth/googleoauth2', 'field_lock_country', 'unlocked'),
(789, 'auth/googleoauth2', 'field_lock_lang', 'unlocked'),
(790, 'auth/googleoauth2', 'field_lock_description', 'unlocked'),
(791, 'auth/googleoauth2', 'field_lock_url', 'unlocked'),
(792, 'auth/googleoauth2', 'field_lock_idnumber', 'unlocked'),
(793, 'auth/googleoauth2', 'field_lock_institution', 'unlocked'),
(794, 'auth/googleoauth2', 'field_lock_department', 'unlocked'),
(795, 'auth/googleoauth2', 'field_lock_phone1', 'unlocked'),
(796, 'auth/googleoauth2', 'field_lock_phone2', 'unlocked'),
(797, 'auth/googleoauth2', 'field_lock_address', 'unlocked'),
(798, 'auth/googleoauth2', 'lastusernumber', '1');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set' AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(15, 80, 10, '/1/5/15', 3),
(16, 80, 11, '/1/5/16', 3),
(17, 80, 12, '/1/5/17', 3),
(18, 80, 13, '/1/5/18', 3),
(19, 30, 3, '/1/19', 2),
(26, 40, 2, '/1/26', 2),
(27, 50, 3, '/1/26/27', 3),
(28, 80, 18, '/1/26/27/28', 4),
(29, 80, 19, '/1/26/27/29', 4),
(30, 80, 20, '/1/26/27/30', 4),
(31, 80, 21, '/1/26/27/31', 4),
(32, 70, 2, '/1/26/27/32', 4),
(34, 70, 4, '/1/26/27/34', 4),
(35, 80, 22, '/1/26/27/35', 4),
(36, 80, 23, '/1/26/27/36', 4);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` text COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `format` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `modinfo` longtext COLLATE utf8_unicode_ci,
  `newsitems` mediumint(5) unsigned NOT NULL DEFAULT '1',
  `startdate` bigint(10) unsigned NOT NULL DEFAULT '0',
  `numsections` mediumint(5) unsigned NOT NULL DEFAULT '1',
  `marker` bigint(10) unsigned NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `showreports` smallint(4) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hiddensections` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `groupmode` smallint(4) unsigned NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) unsigned NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `requested` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `restrictmodules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionstartonenrol` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `modinfo`, `newsitems`, `startdate`, `numsections`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `hiddensections`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `theme`, `timecreated`, `timemodified`, `requested`, `restrictmodules`, `enablecompletion`, `completionstartonenrol`, `completionnotify`) VALUES
(1, 0, 1, 'moodletest', 'moodletest', '', '<p>moodletest</p>', 0, 'site', 1, 'a:0:{}', 3, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, '', '', 1337328135, 1337328484, 0, 0, 0, 0, 0),
(3, 2, 10001, 'Puppy English 001', 'PE001', 'PE001', '<p>PE001</p>', 1, 'weeks', 1, 'a:2:{i:2;O:8:"stdClass":10:{s:2:"id";s:1:"2";s:2:"cm";s:1:"2";s:3:"mod";s:5:"forum";s:7:"section";s:1:"0";s:9:"sectionid";s:1:"3";s:6:"module";s:1:"7";s:5:"added";s:10:"1337758312";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:10:"News forum";}i:4;O:8:"stdClass":16:{s:2:"id";s:1:"2";s:2:"cm";s:1:"4";s:3:"mod";s:4:"quiz";s:7:"section";s:1:"1";s:9:"sectionid";s:1:"4";s:6:"module";s:2:"14";s:5:"added";s:10:"1337758817";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:10:"completion";s:1:"2";s:25:"completiongradeitemnumber";s:1:"0";s:14:"completionview";s:1:"1";s:16:"showavailability";s:1:"1";s:15:"showdescription";s:1:"1";s:7:"content";s:58:"<div class="no-overflow"><p>Final is everything!</p></div>";s:4:"name";s:10:"Final Test";}}', 5, 1337126400, 1, 0, 104857600, 0, 0, 1, 1, 0, 0, 0, 0, '', '', 1337758285, 1337761780, 0, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_allowed_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_allowed_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courallomodu_cou_ix` (`course`),
  KEY `mdl_courallomodu_mod_ix` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='allowed modules foreach course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursecount` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 20000, 0, 1, 1, 1337328135, 1, '/1', NULL),
(2, 'Primary English', 'PE2012', '', 1, 0, 10000, 1, 1, 1, 0, 1, '/2', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned DEFAULT NULL,
  `timenotified` bigint(10) unsigned DEFAULT NULL,
  `timeenrolled` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timestarted` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) unsigned DEFAULT NULL,
  `reaggregate` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_course_completions`
--

INSERT INTO `mdl_course_completions` (`id`, `userid`, `course`, `deleted`, `timenotified`, `timeenrolled`, `timestarted`, `timecompleted`, `reaggregate`) VALUES
(2, 3, 3, NULL, NULL, 0, 1337763224, NULL, 1337763224);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) unsigned DEFAULT NULL,
  `method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `mdl_course_completion_aggr_methd`
--

INSERT INTO `mdl_course_completion_aggr_methd` (`id`, `course`, `criteriatype`, `method`, `value`) VALUES
(9, 3, NULL, 2, NULL),
(10, 3, 4, 1, NULL),
(11, 3, 8, 1, NULL),
(12, 3, 7, 2, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) unsigned NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) unsigned DEFAULT NULL,
  `courseinstance` bigint(10) unsigned DEFAULT NULL,
  `enrolperiod` bigint(10) unsigned DEFAULT NULL,
  `timeend` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `mdl_course_completion_criteria`
--

INSERT INTO `mdl_course_completion_criteria` (`id`, `course`, `criteriatype`, `module`, `moduleinstance`, `courseinstance`, `enrolperiod`, `timeend`, `gradepass`, `role`) VALUES
(11, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) unsigned DEFAULT NULL,
  `deleted` tinyint(1) unsigned DEFAULT NULL,
  `timecompleted` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_course_completion_crit_compl`
--

INSERT INTO `mdl_course_completion_crit_compl` (`id`, `userid`, `course`, `criteriaid`, `gradefinal`, `unenroled`, `deleted`, `timecompleted`) VALUES
(2, 3, 3, 11, NULL, NULL, NULL, 1337763224);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_completion_notify`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_notify` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `role` bigint(10) unsigned NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `timesent` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courcompnoti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion notification emails' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_display`
--

CREATE TABLE IF NOT EXISTS `mdl_course_display` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courdisp_couuse_ix` (`course`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about how to display the course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instance` bigint(10) unsigned NOT NULL DEFAULT '0',
  `section` bigint(10) unsigned NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) unsigned NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) unsigned NOT NULL DEFAULT '0',
  `completion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) unsigned DEFAULT NULL,
  `completionview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) unsigned NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) unsigned NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `groupmembersonly`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `availablefrom`, `availableuntil`, `showavailability`, `showdescription`) VALUES
(2, 3, 7, 2, 3, NULL, 1337758312, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(4, 3, 14, 2, 4, '', 1337758817, 0, 0, 1, 1, 0, 0, 0, 2, 0, 1, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_modules_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_availability` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) unsigned NOT NULL,
  `sourcecmid` bigint(10) unsigned DEFAULT NULL,
  `requiredcompletion` tinyint(1) unsigned DEFAULT NULL,
  `gradeitemid` bigint(10) unsigned DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table stores conditions that affect whether a module/activit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `completionstate` tinyint(1) unsigned NOT NULL,
  `viewed` tinyint(1) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_course_modules_completion`
--

INSERT INTO `mdl_course_modules_completion` (`id`, `coursemoduleid`, `userid`, `completionstate`, `viewed`, `timemodified`) VALUES
(1, 4, 2, 0, 1, 0),
(2, 4, 3, 1, 1, 1337759426);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `timepublished` bigint(10) unsigned NOT NULL,
  `enrollable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `timechecked` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `section` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sequence` text COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_coursect_cousec_ix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`) VALUES
(1, 1, 0, NULL, '', 1, '', 1),
(3, 3, 0, NULL, NULL, 1, '2', 1),
(4, 3, 1, NULL, '', 1, '4', 1),
(5, 3, 2, NULL, '', 1, NULL, 1),
(6, 3, 3, NULL, '', 1, NULL, 1),
(7, 3, 4, NULL, '', 1, NULL, 1),
(8, 3, 5, NULL, '', 1, NULL, 1),
(9, 3, 6, NULL, '', 1, NULL, 1),
(10, 3, 7, NULL, '', 1, NULL, 1),
(11, 3, 8, NULL, '', 1, NULL, 1),
(12, 3, 9, NULL, '', 1, NULL, 1),
(13, 3, 10, NULL, '', 1, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `comments` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `requiredentries` int(8) unsigned NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) unsigned NOT NULL DEFAULT '0',
  `maxentries` int(8) unsigned NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `singletemplate` text COLLATE utf8_unicode_ci,
  `listtemplate` text COLLATE utf8_unicode_ci,
  `listtemplateheader` text COLLATE utf8_unicode_ci,
  `listtemplatefooter` text COLLATE utf8_unicode_ci,
  `addtemplate` text COLLATE utf8_unicode_ci,
  `rsstemplate` text COLLATE utf8_unicode_ci,
  `rsstitletemplate` text COLLATE utf8_unicode_ci,
  `csstemplate` text COLLATE utf8_unicode_ci,
  `jstemplate` text COLLATE utf8_unicode_ci,
  `asearchtemplate` text COLLATE utf8_unicode_ci,
  `approval` smallint(4) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) unsigned NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) unsigned NOT NULL DEFAULT '0',
  `editany` smallint(4) unsigned NOT NULL DEFAULT '0',
  `notification` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `recordid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `param1` text COLLATE utf8_unicode_ci,
  `param2` text COLLATE utf8_unicode_ci,
  `param3` text COLLATE utf8_unicode_ci,
  `param4` text COLLATE utf8_unicode_ci,
  `param5` text COLLATE utf8_unicode_ci,
  `param6` text COLLATE utf8_unicode_ci,
  `param7` text COLLATE utf8_unicode_ci,
  `param8` text COLLATE utf8_unicode_ci,
  `param9` text COLLATE utf8_unicode_ci,
  `param10` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `dataid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `approved` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) unsigned DEFAULT '0',
  `enrolstartdate` bigint(10) unsigned DEFAULT '0',
  `enrolenddate` bigint(10) unsigned DEFAULT '0',
  `expirynotify` tinyint(1) unsigned DEFAULT '0',
  `expirythreshold` bigint(10) unsigned DEFAULT '0',
  `notifyall` tinyint(1) unsigned DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) unsigned DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customchar1`, `customchar2`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `timecreated`, `timemodified`) VALUES
(4, 'manual', 0, 3, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1337758286, 1337758286),
(5, 'guest', 1, 3, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1337758286, 1337761780),
(6, 'self', 1, 3, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1337758286, 1337758286);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_enrol_authorize`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `paymentmethod` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cc',
  `refundinfo` smallint(4) unsigned NOT NULL DEFAULT '0',
  `ccname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `transid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `settletime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauth_cou_ix` (`courseid`),
  KEY `mdl_enroauth_use_ix` (`userid`),
  KEY `mdl_enroauth_sta_ix` (`status`),
  KEY `mdl_enroauth_tra_ix` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about authorize.net transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_enrol_authorize_refunds`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize_refunds` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transid` bigint(20) unsigned DEFAULT '0',
  `settletime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauthrefu_tra_ix` (`transid`),
  KEY `mdl_enroauthrefu_ord_ix` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Authorize.net refunds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `repeatid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) unsigned NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeduration` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) unsigned NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` mediumtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `internal` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfolio.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0),
(2, 'user_logout', 'mod_chat', '/mod/chat/lib.php', 's:16:"chat_user_logout";', 'instant', 0, 1),
(3, 'user_enrolled', 'mod_forum', '/mod/forum/lib.php', 's:19:"forum_user_enrolled";', 'instant', 0, 1),
(4, 'user_unenrolled', 'mod_forum', '/mod/forum/lib.php', 's:21:"forum_user_unenrolled";', 'instant', 0, 1),
(5, 'quiz_attempt_submitted', 'mod_quiz', '/mod/quiz/locallib.php', 's:30:"quiz_attempt_submitted_handler";', 'cron', 0, 1),
(6, 'role_assigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(7, 'role_unassigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(8, 'cohort_member_added', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:12:"member_added";}', 'instant', 0, 1),
(9, 'cohort_member_removed', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:14:"member_removed";}', 'instant', 0, 1),
(10, 'cohort_deleted', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:7:"deleted";}', 'instant', 0, 1),
(11, 'role_assigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(12, 'role_unassigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(13, 'user_enrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"user_enrolled";}', 'instant', 0, 1),
(14, 'user_unenrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"user_unenrolled";}', 'instant', 0, 1),
(15, 'user_enrol_modified', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:19:"user_enrol_modified";}', 'instant', 0, 1),
(16, 'course_deleted', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:14:"course_deleted";}', 'instant', 0, 1),
(17, 'user_deleted', 'portfolio_googledocs', '/portfolio/googledocs/lib.php', 's:33:"portfolio_googledocs_user_deleted";', 'cron', 0, 0),
(18, 'user_deleted', 'portfolio_picasa', '/portfolio/picasa/lib.php', 's:29:"portfolio_picasa_user_deleted";', 'cron', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` mediumtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mdl_events_queue`
--

INSERT INTO `mdl_events_queue` (`id`, `eventdata`, `stackdump`, `userid`, `timecreated`) VALUES
(1, 'Tzo4OiJzdGRDbGFzcyI6ODp7czo5OiJjb21wb25lbnQiO3M6ODoibW9kX3F1aXoiO3M6OToiYXR0ZW1wdGlkIjtzOjE6IjEiO3M6MTA6InRpbWVmaW5pc2giO2k6MTMzNzc1OTQyNjtzOjY6InVzZXJpZCI7czoxOiIzIjtzOjExOiJzdWJtaXR0ZXJpZCI7czoxOiIzIjtzOjY6InF1aXppZCI7czoxOiIyIjtzOjQ6ImNtaWQiO3M6MToiNCI7czo4OiJjb3Vyc2VpZCI7czoxOiIzIjt9', '', 3, 1337759426);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) unsigned NOT NULL,
  `handlerid` bigint(10) unsigned NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` mediumtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mdl_events_queue_handlers`
--

INSERT INTO `mdl_events_queue_handlers` (`id`, `queuedeventid`, `handlerid`, `status`, `errormessage`, `timemodified`) VALUES
(1, 1, 5, 0, '', 1337759426);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions' AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(2, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(3, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(4, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(5, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(6, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(7, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(8, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(9, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(10, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(16, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(17, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(18, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(19, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(20, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(21, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(22, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(23, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(24, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(25, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(26, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(27, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(28, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(29, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(30, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(31, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(32, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(33, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(34, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(35, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(36, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(37, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(38, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(39, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(40, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(41, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(42, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(43, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(44, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(45, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(46, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(47, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(48, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(49, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(50, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1337328151, NULL, 'moodle_mobile_app', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `creatorid` bigint(20) unsigned NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `lastaccess` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` text COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `random_response` bigint(10) unsigned NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `random_response` bigint(10) unsigned NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `template` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` text COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` smallint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dependitem` bigint(10) unsigned NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `item` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `item` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned DEFAULT NULL,
  `filesize` bigint(10) unsigned NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `source` text COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'filter/activitynames', 1, -9999, 1),
(2, 'filter/algebra', 1, -9999, 2),
(3, 'filter/urltolink', 1, -9999, 3),
(4, 'filter/data', 1, -9999, 4),
(5, 'filter/emoticon', 1, -9999, 5),
(6, 'filter/emailprotect', 1, -9999, 6),
(7, 'filter/glossary', 1, -9999, 7),
(8, 'filter/tidy', 1, -9999, 8),
(9, 'filter/multilang', 1, -9999, 9),
(10, 'filter/mediaplugin', 1, -9999, 10),
(11, 'filter/tex', 1, -9999, 11),
(12, 'filter/censor', 1, -9999, 12);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) unsigned NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `warnafter` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blockafter` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) unsigned NOT NULL DEFAULT '0',
  `completionreplies` int(9) unsigned NOT NULL DEFAULT '0',
  `completionposts` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`) VALUES
(2, 3, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1337758312, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forum` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usermodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) unsigned NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `discussionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `postid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forumid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `discussionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `postid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `firstread` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastread` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forum` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forumid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showall` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `globalglossary` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `entbypage` smallint(3) unsigned NOT NULL DEFAULT '10',
  `editalways` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionentries` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` text COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `approved` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `entryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned DEFAULT NULL,
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_grade_categories`
--

INSERT INTO `mdl_grade_categories` (`id`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `timecreated`, `timemodified`, `hidden`) VALUES
(2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 1337758348, 1337759489, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned DEFAULT NULL,
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `mdl_grade_categories_history`
--

INSERT INTO `mdl_grade_categories_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `hidden`) VALUES
(1, 1, 1, 'system', 1337757769, 2, 2, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(2, 2, 1, 'system', 1337757769, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(3, 3, 1, 'coursedelete', 1337757769, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(4, 1, 2, 'system', 1337758348, 2, 3, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(5, 2, 2, 'system', 1337758348, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(6, 2, 2, NULL, 1337758548, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(7, 2, 2, NULL, 1337758817, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(8, 2, 2, NULL, 1337759489, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `exported` bigint(10) unsigned NOT NULL DEFAULT '0',
  `overridden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `excluded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` mediumtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `information` mediumtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_grade_grades`
--

INSERT INTO `mdl_grade_grades` (`id`, `itemid`, `userid`, `rawgrade`, `rawgrademax`, `rawgrademin`, `rawscaleid`, `usermodified`, `finalgrade`, `hidden`, `locked`, `locktime`, `exported`, `overridden`, `excluded`, `feedback`, `feedbackformat`, `information`, `informationformat`, `timecreated`, `timemodified`) VALUES
(1, 4, 3, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, 1337759426, 1337759510),
(2, 2, 3, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `exported` bigint(10) unsigned NOT NULL DEFAULT '0',
  `overridden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `excluded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` mediumtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `information` mediumtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mdl_grade_grades_history`
--

INSERT INTO `mdl_grade_grades_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `itemid`, `userid`, `rawgrade`, `rawgrademax`, `rawgrademin`, `rawscaleid`, `usermodified`, `finalgrade`, `hidden`, `locked`, `locktime`, `exported`, `overridden`, `excluded`, `feedback`, `feedbackformat`, `information`, `informationformat`) VALUES
(1, 1, 1, 'mod/quiz', 1337759426, 3, 4, 3, 100.00000, 100.00000, 0.00000, NULL, 3, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(2, 1, 2, 'system', 1337759426, 3, 2, 3, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(3, 2, 2, 'aggregation', 1337759426, 3, 2, 3, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(4, 2, 1, 'mod/quiz', 1337759510, 2, 4, 3, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) unsigned DEFAULT NULL,
  `newgradeitem` bigint(10) unsigned DEFAULT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` mediumtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `categoryid` bigint(10) unsigned DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) unsigned DEFAULT NULL,
  `itemnumber` bigint(10) unsigned DEFAULT NULL,
  `iteminfo` mediumtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` mediumtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `outcomeid` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mdl_grade_items`
--

INSERT INTO `mdl_grade_items` (`id`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `display`, `decimals`, `hidden`, `locked`, `locktime`, `needsupdate`, `timecreated`, `timemodified`) VALUES
(2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 60.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1337758348, 1337759489),
(4, 3, 2, 'Final Test', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, NULL, 1, 0, 0, 0, 1337758817, 1337759510);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `categoryid` bigint(10) unsigned DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) unsigned DEFAULT NULL,
  `itemnumber` bigint(10) unsigned DEFAULT NULL,
  `iteminfo` mediumtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` mediumtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `outcomeid` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `mdl_grade_items_history`
--

INSERT INTO `mdl_grade_items_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `hidden`, `locked`, `locktime`, `needsupdate`, `display`, `decimals`) VALUES
(1, 1, 1, 'system', 1337757769, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(2, 3, 1, 'coursedelete', 1337757769, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(3, 1, 2, 'system', 1337758348, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(4, 2, 2, 'course/completion.php', 1337758349, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 60.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(5, 1, 3, NULL, 1337758548, 2, 3, 2, 'Final Quizz', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 1, 0, 0, 1, 0, NULL),
(6, 2, 3, NULL, 1337758548, 2, 3, 2, 'Final Quizz', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(7, 2, 2, NULL, 1337758548, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 60.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(8, 1, 4, NULL, 1337758817, 2, 3, 2, 'Final Test', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 1, 0, 0, 1, 0, NULL),
(9, 2, 4, NULL, 1337758817, 2, 3, 2, 'Final Test', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(10, 2, 2, NULL, 1337758817, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 60.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(11, 3, 3, 'mod/quiz', 1337759371, 2, 3, 2, 'Final Quizz', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(12, 2, 4, NULL, 1337759426, 3, 3, 2, 'Final Test', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 1, 0, 0, 0, 0, NULL),
(13, 2, 4, NULL, 1337759488, 2, 3, 2, 'Final Test', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 0, 0, NULL),
(14, 2, 2, NULL, 1337759489, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 60.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 0, 0, NULL),
(15, 2, 4, NULL, 1337759510, 2, 3, 2, 'Final Test', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 1, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `outcomeid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` text COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) unsigned NOT NULL,
  `criterionid` bigint(10) unsigned NOT NULL,
  `levelid` bigint(10) unsigned DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) unsigned NOT NULL,
  `score` decimal(10,5) unsigned NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) unsigned NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `usercreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `usermodified` bigint(10) unsigned NOT NULL,
  `timecopied` bigint(10) unsigned DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) unsigned NOT NULL,
  `raterid` bigint(10) unsigned NOT NULL,
  `itemid` bigint(10) unsigned DEFAULT NULL,
  `rawgrade` decimal(10,5) unsigned DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `configdata` text COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) unsigned NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` mediumtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `practice` smallint(3) unsigned NOT NULL DEFAULT '0',
  `modattempts` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usepassword` smallint(3) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) unsigned NOT NULL DEFAULT '0',
  `conditions` text COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) unsigned NOT NULL DEFAULT '0',
  `ongoing` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) unsigned NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) unsigned NOT NULL DEFAULT '5',
  `review` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) unsigned NOT NULL DEFAULT '0',
  `feedback` smallint(3) unsigned NOT NULL DEFAULT '1',
  `minquestions` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxpages` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timed` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retake` smallint(3) unsigned NOT NULL DEFAULT '1',
  `activitylink` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) unsigned NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) unsigned NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) unsigned NOT NULL DEFAULT '0',
  `slideshow` smallint(3) unsigned NOT NULL DEFAULT '0',
  `width` bigint(10) unsigned NOT NULL DEFAULT '640',
  `height` bigint(10) unsigned NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) unsigned NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) unsigned NOT NULL DEFAULT '0',
  `progressbar` smallint(3) unsigned NOT NULL DEFAULT '0',
  `highscores` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) unsigned NOT NULL DEFAULT '0',
  `available` bigint(10) unsigned NOT NULL DEFAULT '0',
  `deadline` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` text COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `response` text COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answerid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retry` smallint(3) unsigned NOT NULL DEFAULT '0',
  `correct` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useranswer` text COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retry` bigint(10) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timeseen` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` double unsigned NOT NULL DEFAULT '0',
  `late` smallint(3) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `gradeid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `qtype` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qoption` smallint(3) unsigned NOT NULL DEFAULT '0',
  `layout` smallint(3) unsigned NOT NULL DEFAULT '1',
  `display` smallint(3) unsigned NOT NULL DEFAULT '1',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` text COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `starttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lessontime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` text COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=140 ;

--
-- 转存表中的数据 `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1337328450, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2&course=1', ''),
(2, 1337328485, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(3, 1337328523, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(4, 1337328525, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(5, 1337328564, 2, '127.0.0.1', 1, 'user', 0, 'change password', 'view.php?id=2&course=1', '2'),
(6, 1337328570, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(7, 1337332715, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(8, 1337332914, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(9, 1337333225, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(10, 1337333226, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(11, 1337564779, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(12, 1337564780, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(13, 1337564827, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(14, 1337564832, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(15, 1337564835, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(16, 1337568157, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(17, 1337568227, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(18, 1337568238, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(19, 1337568242, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(20, 1337568261, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(21, 1337568296, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(22, 1337568306, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(23, 1337568410, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(24, 1337568416, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(25, 1337590513, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(26, 1337590514, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(27, 1337593369, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(28, 1337593409, 0, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/new user'),
(29, 1337593431, 3, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(30, 1337593434, 0, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(31, 1337593679, 0, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(32, 1337593679, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(33, 1337593691, 3, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(34, 1337593691, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(35, 1337593694, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(36, 1337593697, 3, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=3&course=1', '3'),
(37, 1337593704, 0, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(38, 1337593704, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(39, 1337593707, 3, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=3&course=1', '3'),
(40, 1337593816, 0, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(41, 1337593816, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(42, 1337594974, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(43, 1337594979, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(44, 1337594988, 0, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(45, 1337594988, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(46, 1337594998, 3, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=3&course=1', '3'),
(47, 1337595088, 1, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '1'),
(48, 1337595088, 1, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(49, 1337595093, 1, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(50, 1337595195, 1, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(51, 1337595223, 1, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(52, 1337595240, 1, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(53, 1337595240, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(54, 1337668122, 1, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '1'),
(55, 1337668123, 1, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(56, 1337757421, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(57, 1337757422, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(58, 1337757556, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=2', 'Cambridge English 1 (ID 2)'),
(61, 1337757768, 2, '127.0.0.1', 1, 'course', 0, 'delete', 'view.php?id=2', 'Cambridge English 1 (ID 2)'),
(62, 1337758286, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=3', 'Puppy English 001 (ID 3)'),
(63, 1337758311, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(64, 1337758351, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(65, 1337758548, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/quiz/view.php?id=3', 'quiz 1'),
(66, 1337758548, 2, '127.0.0.1', 3, 'quiz', 3, 'add', 'view.php?id=3', '1'),
(67, 1337758549, 2, '127.0.0.1', 3, 'quiz', 3, 'view', 'view.php?id=3', '1'),
(68, 1337758817, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/quiz/view.php?id=4', 'quiz 2'),
(69, 1337758817, 2, '127.0.0.1', 3, 'quiz', 4, 'add', 'view.php?id=4', '2'),
(70, 1337758819, 2, '127.0.0.1', 3, 'quiz', 4, 'view', 'view.php?id=4', '2'),
(71, 1337758825, 2, '127.0.0.1', 3, 'quiz', 4, 'editquestions', 'view.php?id=4', '2'),
(72, 1337759137, 2, '127.0.0.1', 3, 'quiz', 4, 'editquestions', 'view.php?id=4', '2'),
(73, 1337759138, 2, '127.0.0.1', 3, 'quiz', 4, 'editquestions', 'view.php?id=4', '2'),
(74, 1337759280, 2, '127.0.0.1', 3, 'quiz', 4, 'editquestions', 'view.php?id=4', '2'),
(75, 1337759281, 2, '127.0.0.1', 3, 'quiz', 4, 'editquestions', 'view.php?id=4', '2'),
(76, 1337759316, 0, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(77, 1337759316, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(78, 1337759321, 3, '127.0.0.1', 1, 'auth_googleoauth2', 0, '', '', 'social_user_1/lijinglue@live.com/3'),
(79, 1337759322, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(80, 1337759336, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(81, 1337759339, 3, '127.0.0.1', 3, 'quiz', 4, 'view', 'view.php?id=4', '2'),
(82, 1337759343, 3, '127.0.0.1', 3, 'quiz', 4, 'attempt', 'review.php?attempt=1', '2'),
(83, 1337759344, 3, '127.0.0.1', 3, 'quiz', 4, 'continue attempt', 'review.php?attempt=1', '2'),
(84, 1337759357, 2, '127.0.0.1', 3, 'quiz', 3, 'view', 'view.php?id=3', '1'),
(85, 1337759365, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(86, 1337759371, 2, '127.0.0.1', 3, 'course', 3, 'delete mod', 'view.php?id=3', 'quiz 1'),
(87, 1337759386, 3, '127.0.0.1', 3, 'quiz', 4, 'view summary', 'summary.php?attempt=1', '2'),
(88, 1337759406, 3, '127.0.0.1', 3, 'quiz', 4, 'continue attempt', 'review.php?attempt=1', '2'),
(89, 1337759412, 3, '127.0.0.1', 3, 'quiz', 4, 'continue attempt', 'review.php?attempt=1', '2'),
(90, 1337759417, 3, '127.0.0.1', 3, 'quiz', 4, 'continue attempt', 'review.php?attempt=1', '2'),
(91, 1337759419, 3, '127.0.0.1', 3, 'quiz', 4, 'view summary', 'summary.php?attempt=1', '2'),
(92, 1337759426, 3, '127.0.0.1', 3, 'quiz', 4, 'close attempt', 'review.php?attempt=1', '2'),
(93, 1337759427, 3, '127.0.0.1', 3, 'quiz', 4, 'review', 'review.php?attempt=1', '2'),
(94, 1337759440, 3, '127.0.0.1', 3, 'quiz', 4, 'view', 'view.php?id=4', '2'),
(95, 1337759444, 3, '127.0.0.1', 3, 'quiz', 4, 'attempt', 'review.php?attempt=2', '2'),
(96, 1337759445, 3, '127.0.0.1', 3, 'quiz', 4, 'continue attempt', 'review.php?attempt=2', '2'),
(97, 1337759452, 2, '127.0.0.1', 3, 'quiz', 4, 'view', 'view.php?id=4', '2'),
(98, 1337759489, 2, '127.0.0.1', 3, 'course', 0, 'update mod', '../mod/quiz/view.php?id=4', 'quiz 2'),
(99, 1337759489, 2, '127.0.0.1', 3, 'quiz', 4, 'update', 'view.php?id=4', '2'),
(100, 1337759490, 2, '127.0.0.1', 3, 'quiz', 4, 'view', 'view.php?id=4', '2'),
(101, 1337759498, 2, '127.0.0.1', 3, 'quiz', 4, 'report', 'report.php?id=4&mode=overview', '2'),
(102, 1337759510, 2, '127.0.0.1', 3, 'quiz', 4, 'report', 'report.php?id=4&mode=overview', '2'),
(103, 1337759510, 2, '127.0.0.1', 3, 'quiz', 4, 'delete attempt', 'report.php?id=4', '2'),
(104, 1337759511, 2, '127.0.0.1', 3, 'quiz', 4, 'report', 'report.php?id=4&mode=overview', '2'),
(105, 1337759519, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(106, 1337759522, 3, '127.0.0.1', 3, 'quiz', 4, 'view', 'view.php?id=4', '2'),
(107, 1337759530, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(108, 1337759536, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(109, 1337759548, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(110, 1337759548, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(111, 1337759560, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(112, 1337759562, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(113, 1337760478, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(114, 1337760965, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(115, 1337760975, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(116, 1337760986, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(117, 1337760987, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(118, 1337760996, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(119, 1337761002, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(120, 1337761534, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(121, 1337761539, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(122, 1337761713, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(123, 1337761751, 2, '127.0.0.1', 3, 'course', 0, 'update', 'edit.php?id=3', '3'),
(124, 1337761752, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(125, 1337761780, 2, '127.0.0.1', 3, 'course', 0, 'update', 'edit.php?id=3', '3'),
(126, 1337761781, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(127, 1337761854, 2, '127.0.0.1', 3, 'user', 0, 'view all', 'index.php?id=3', ''),
(128, 1337761865, 2, '127.0.0.1', 3, 'quiz', 4, 'view', 'view.php?id=4', '2'),
(129, 1337761881, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(130, 1337761914, 2, '127.0.0.1', 3, 'quiz', 4, 'review', 'review.php?attempt=1', '2'),
(131, 1337761924, 2, '127.0.0.1', 3, 'quiz', 4, 'view', 'view.php?id=4', '2'),
(132, 1337761932, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(133, 1337762119, 2, '127.0.0.1', 3, 'quiz', 4, 'view', 'view.php?id=4', '2'),
(134, 1337762171, 2, '127.0.0.1', 3, 'user', 0, 'view', 'view.php?id=3&course=3', '3'),
(135, 1337762275, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(136, 1337762456, 2, '127.0.0.1', 3, 'user', 0, 'view', 'view.php?id=3&course=3', '3'),
(137, 1337762482, 2, '127.0.0.1', 3, 'user', 0, 'view', 'view.php?id=3&course=3', '3'),
(138, 1337763192, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(139, 1337763246, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=145 ;

--
-- 转存表中的数据 `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(3, 'course', 'view', 'course', 'fullname', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(6, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(7, 'course', 'report log', 'course', 'fullname', 'moodle'),
(8, 'course', 'report live', 'course', 'fullname', 'moodle'),
(9, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(10, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(11, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(12, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(13, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(14, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(15, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(16, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(17, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(18, 'group', 'view', 'groups', 'name', 'moodle'),
(19, 'tag', 'update', 'tag', 'name', 'moodle'),
(20, 'tag', 'flag', 'tag', 'name', 'moodle'),
(21, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(22, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(23, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(24, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(25, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(26, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(27, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(28, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(29, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(30, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(31, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(32, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(33, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(34, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(35, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(36, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(37, 'data', 'view', 'data', 'name', 'mod_data'),
(38, 'data', 'add', 'data', 'name', 'mod_data'),
(39, 'data', 'update', 'data', 'name', 'mod_data'),
(40, 'data', 'record delete', 'data', 'name', 'mod_data'),
(41, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(42, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(43, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(44, 'data', 'templates def', 'data', 'name', 'mod_data'),
(45, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(46, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(47, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(48, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(49, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(50, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(51, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(52, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(53, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(54, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(55, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(56, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(57, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(58, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(59, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(60, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(61, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(62, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(63, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(64, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(65, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(66, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(67, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(68, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(69, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(70, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(71, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(72, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(73, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(74, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(75, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(76, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(77, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(78, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(79, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(80, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(81, 'label', 'add', 'label', 'name', 'mod_label'),
(82, 'label', 'update', 'label', 'name', 'mod_label'),
(83, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(84, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(85, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(86, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(87, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(88, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(89, 'page', 'view', 'page', 'name', 'mod_page'),
(90, 'page', 'view all', 'page', 'name', 'mod_page'),
(91, 'page', 'update', 'page', 'name', 'mod_page'),
(92, 'page', 'add', 'page', 'name', 'mod_page'),
(93, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(94, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(95, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(96, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(97, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(98, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(99, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(100, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(101, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(102, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(103, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(104, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(105, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(106, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(107, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(108, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(109, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(110, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(111, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(112, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(113, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(114, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(115, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(116, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(117, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(118, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(119, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(120, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(121, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(122, 'url', 'view', 'url', 'name', 'mod_url'),
(123, 'url', 'view all', 'url', 'name', 'mod_url'),
(124, 'url', 'update', 'url', 'name', 'mod_url'),
(125, 'url', 'add', 'url', 'name', 'mod_url'),
(126, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(127, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(128, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(129, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(130, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(131, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(132, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(133, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(134, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(135, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(136, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(137, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(138, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(139, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(140, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(141, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(142, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(143, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(144, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) unsigned NOT NULL,
  `sqltext` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `info` text COLLATE utf8_unicode_ci,
  `backtrace` text COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `typeid` bigint(10) unsigned DEFAULT NULL,
  `toolurl` text COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` text COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) unsigned DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) unsigned DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) unsigned DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) unsigned DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) unsigned DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8_unicode_ci,
  `secureicon` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `datesubmitted` bigint(10) unsigned NOT NULL,
  `dateupdated` bigint(10) unsigned NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) unsigned NOT NULL,
  `state` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` text COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `course` bigint(10) unsigned NOT NULL,
  `coursevisible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createdby` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useridto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` text COLLATE utf8_unicode_ci,
  `fullmessage` text COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) unsigned DEFAULT '0',
  `fullmessagehtml` mediumtext COLLATE utf8_unicode_ci,
  `smallmessage` text COLLATE utf8_unicode_ci,
  `notification` tinyint(1) unsigned DEFAULT '0',
  `contexturl` text COLLATE utf8_unicode_ci,
  `contexturlname` text COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contactid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blocked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'instantmessage', 'moodle', NULL),
(4, 'backup', 'moodle', 'moodle/site:config'),
(5, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(6, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(7, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(8, 'assignment_updates', 'mod_assignment', NULL),
(9, 'submission', 'mod_feedback', NULL),
(10, 'message', 'mod_feedback', NULL),
(11, 'posts', 'mod_forum', NULL),
(12, 'graded_essay', 'mod_lesson', NULL),
(13, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(14, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(15, 'authorize_enrolment', 'enrol_authorize', NULL),
(16, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(17, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(18, 'paypal_enrolment', 'enrol_paypal', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useridto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` text COLLATE utf8_unicode_ci,
  `fullmessage` text COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) unsigned DEFAULT '0',
  `fullmessagehtml` mediumtext COLLATE utf8_unicode_ci,
  `smallmessage` text COLLATE utf8_unicode_ci,
  `notification` tinyint(1) unsigned DEFAULT '0',
  `contexturl` text COLLATE utf8_unicode_ci,
  `contexturlname` text COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) unsigned NOT NULL,
  `processorid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL,
  `remoteid` bigint(10) unsigned NOT NULL,
  `categoryid` bigint(10) unsigned NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) unsigned DEFAULT '0',
  `startdate` bigint(10) unsigned NOT NULL,
  `roleid` bigint(10) unsigned NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `remotecourseid` bigint(10) unsigned NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) unsigned NOT NULL DEFAULT '0',
  `transport` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `portno` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost:8080/moodle', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `remoteid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rpcid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `help` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rpcid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site' AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `version`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assignment', 2011112900, 60, 0, '', 1),
(2, 'chat', 2011112900, 300, 0, '', 1),
(3, 'choice', 2011112900, 0, 0, '', 1),
(4, 'data', 2011112901, 0, 0, '', 1),
(5, 'feedback', 2011112900, 0, 0, '', 0),
(6, 'folder', 2011112900, 0, 0, '', 1),
(7, 'forum', 2011112900, 60, 0, '', 1),
(8, 'glossary', 2011112900, 0, 0, '', 1),
(9, 'imscp', 2011112900, 0, 0, '', 1),
(10, 'label', 2011112900, 0, 0, '', 1),
(11, 'lesson', 2011112900, 0, 0, '', 1),
(12, 'lti', 2011112900, 0, 0, '', 1),
(13, 'page', 2011112900, 0, 0, '', 1),
(14, 'quiz', 2011112901, 60, 0, '', 1),
(15, 'resource', 2011112900, 0, 0, '', 1),
(16, 'scorm', 2011112901, 300, 0, '', 1),
(17, 'survey', 2011112900, 0, 0, '', 1),
(18, 'url', 2011112900, 0, 0, '', 1),
(19, 'wiki', 2011112900, 0, 0, '', 1),
(20, 'workshop', 2011112902, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0),
(3, 2, '__default', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) unsigned DEFAULT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text COLLATE utf8_unicode_ci,
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `time` bigint(10) unsigned NOT NULL,
  `portfolio` bigint(10) unsigned NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) unsigned NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `moduleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) unsigned NOT NULL DEFAULT '0',
  `format` bigint(10) unsigned NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) unsigned NOT NULL,
  `totalcputime` bigint(10) unsigned NOT NULL,
  `totalcalls` bigint(10) unsigned NOT NULL,
  `totalmemory` bigint(10) unsigned NOT NULL,
  `runreference` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) unsigned NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` text COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` text COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) unsigned NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `createdby` bigint(10) unsigned DEFAULT NULL,
  `modifiedby` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_question`
--

INSERT INTO `mdl_question` (`id`, `category`, `parent`, `name`, `questiontext`, `questiontextformat`, `generalfeedback`, `generalfeedbackformat`, `defaultmark`, `penalty`, `qtype`, `length`, `stamp`, `version`, `hidden`, `timecreated`, `timemodified`, `createdby`, `modifiedby`) VALUES
(1, 2, 0, 'Question1', '<p>What is The ERP solution from SmarkGlobal?</p>', 1, '', 1, 50.0000000, 1.0000000, 'multichoice', 1, 'www.motest.com:8080+120523074535+9sASIJ', 'www.motest.com:8080+120523074535+biTsTk', 0, 1337759135, 1337759135, 2, 2),
(2, 2, 0, 'Q2', '<p>The Best IT Corp. Ever?</p>', 1, '', 1, 50.0000000, 1.0000000, 'multichoice', 1, 'www.motest.com:8080+120523074759+xLi9Jy', 'www.motest.com:8080+120523074759+r96es5', 0, 1337759279, 1337759279, 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` text COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `mdl_question_answers`
--

INSERT INTO `mdl_question_answers` (`id`, `question`, `answer`, `answerformat`, `fraction`, `feedback`, `feedbackformat`) VALUES
(1, 1, '<p>MOSES</p>', 1, 1.0000000, '', 1),
(2, 1, '<p>SAP r4</p>', 1, 0.0000000, '', 1),
(3, 1, '<p>SALESFORCE</p>', 1, 0.0000000, '', 1),
(4, 1, '<p>Dynamics ERP</p>', 1, 0.0000000, '', 1),
(5, 2, '<p>SmarkGlobal</p>', 1, 1.0000000, '', 1),
(6, 2, '<p>Microsoft</p>', 1, 0.0000000, '', 1),
(7, 2, '<p>Alisoft</p>', 1, 0.0000000, '', 1),
(8, 2, '<p>SAP</p>', 1, 0.0000000, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) unsigned NOT NULL,
  `slot` bigint(10) unsigned NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) unsigned NOT NULL,
  `variant` bigint(10) unsigned NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `flagged` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `questionsummary` text COLLATE utf8_unicode_ci,
  `rightanswer` text COLLATE utf8_unicode_ci,
  `responsesummary` text COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_question_attempts`
--

INSERT INTO `mdl_question_attempts` (`id`, `questionusageid`, `slot`, `behaviour`, `questionid`, `variant`, `maxmark`, `minfraction`, `flagged`, `questionsummary`, `rightanswer`, `responsesummary`, `timemodified`) VALUES
(1, 1, 1, 'adaptive', 1, 1, 50.0000000, 0.0000000, 0, '\n\nWhat is The ERP solution from SmarkGlobal?: \n\nDynamics ERP; \n\nSALESFORCE; \n\nSAP r4; \n\nMOSES', '\n\nMOSES', '\n\nMOSES', 1337759426),
(2, 1, 2, 'adaptive', 2, 1, 50.0000000, 0.0000000, 0, '\n\nThe Best IT Corp. Ever?: \n\nSmarkGlobal; \n\nAlisoft; \n\nMicrosoft; \n\nSAP', '\n\nSmarkGlobal', '\n\nSmarkGlobal', 1337759426);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) unsigned NOT NULL,
  `sequencenumber` bigint(10) unsigned NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `mdl_question_attempt_steps`
--

INSERT INTO `mdl_question_attempt_steps` (`id`, `questionattemptid`, `sequencenumber`, `state`, `fraction`, `timecreated`, `userid`) VALUES
(1, 1, 0, 'todo', NULL, 1337759342, 3),
(2, 2, 0, 'todo', NULL, 1337759342, 3),
(3, 1, 1, 'todo', NULL, 1337759385, 3),
(4, 2, 1, 'todo', NULL, 1337759385, 3),
(5, 1, 2, 'complete', 1.0000000, 1337759411, 3),
(6, 2, 2, 'complete', 1.0000000, 1337759415, 3),
(7, 1, 3, 'gradedright', 1.0000000, 1337759426, 3),
(8, 2, 3, 'gradedright', 1.0000000, 1337759426, 3);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) unsigned NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `mdl_question_attempt_step_data`
--

INSERT INTO `mdl_question_attempt_step_data` (`id`, `attemptstepid`, `name`, `value`) VALUES
(1, 1, '_order', '4,3,2,1'),
(2, 2, '_order', '5,7,6,8'),
(3, 3, 'answer', '3'),
(4, 4, 'answer', '0'),
(5, 5, '-submit', '1'),
(6, 5, 'answer', '3'),
(7, 5, '-_try', '1'),
(8, 5, '-_rawfraction', '1.0000000'),
(9, 6, '-submit', '1'),
(10, 6, 'answer', '0'),
(11, 6, '-_try', '1'),
(12, 6, '-_rawfraction', '1.0000000'),
(13, 7, '-finish', '1'),
(14, 7, '-_try', '1'),
(15, 7, '-_rawfraction', '1.0000000'),
(16, 8, '-finish', '1'),
(17, 8, '-_try', '1'),
(18, 8, '-_rawfraction', '1.0000000');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` text COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mdl_question_categories`
--

INSERT INTO `mdl_question_categories` (`id`, `name`, `contextid`, `info`, `infoformat`, `stamp`, `parent`, `sortorder`) VALUES
(1, 'Default for Final Test', 34, 'The default category for questions shared in context ''Final Test''.', 0, 'www.motest.com:8080+120523074025+92YtH9', 0, 999),
(2, 'Default for PE001', 27, 'The default category for questions shared in context ''PE001''.', 0, 'www.motest.com:8080+120523074025+EkPQeS', 0, 999),
(3, 'Default for Primary English', 26, 'The default category for questions shared in context ''Primary English''.', 0, 'www.motest.com:8080+120523074025+edXl9N', 0, 999),
(4, 'Default for System', 1, 'The default category for questions shared in context ''System''.', 0, 'www.motest.com:8080+120523074025+KWQGMU', 0, 999);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) unsigned NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) unsigned NOT NULL,
  `hint` text COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) unsigned DEFAULT NULL,
  `clearwrong` tinyint(1) unsigned DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_match`
--

CREATE TABLE IF NOT EXISTS `mdl_question_match` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subquestions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines fixed matching questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_match_sub`
--

CREATE TABLE IF NOT EXISTS `mdl_question_match_sub` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `questiontext` text COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatcsub_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the subquestions that make up a matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sequence` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_multichoice`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multichoice` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `answers` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que2_ix` (`question`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_question_multichoice`
--

INSERT INTO `mdl_question_multichoice` (`id`, `question`, `layout`, `answers`, `single`, `shuffleanswers`, `correctfeedback`, `correctfeedbackformat`, `partiallycorrectfeedback`, `partiallycorrectfeedbackformat`, `incorrectfeedback`, `incorrectfeedbackformat`, `answernumbering`, `shownumcorrect`) VALUES
(1, 1, 0, '1,2,3,4', 1, 1, '', 1, '', 1, '', 1, 'ABCD', 0),
(2, 2, 0, '5,6,7,8', 1, 1, '', 1, '', 1, '', 1, 'abc', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `showunits` smallint(4) unsigned NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) unsigned NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) unsigned NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_randomsamatch`
--

CREATE TABLE IF NOT EXISTS `mdl_question_randomsamatch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `choose` bigint(10) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_sessions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `questionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newest` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newgraded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` text COLLATE utf8_unicode_ci NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Gives ids of the newest open and newest graded states' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_shortanswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_shortanswer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answers` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesshor_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_states`
--

CREATE TABLE IF NOT EXISTS `mdl_question_states` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `event` smallint(4) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user responses to an attempt, and percentage grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mdl_question_usages`
--

INSERT INTO `mdl_question_usages` (`id`, `contextid`, `component`, `preferredbehaviour`) VALUES
(1, 34, 'mod_quiz', 'adaptive');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-2',
  `reviewattempt` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` text COLLATE utf8_unicode_ci NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timelimit` bigint(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Main information about each quiz' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_quiz`
--

INSERT INTO `mdl_quiz` (`id`, `course`, `name`, `intro`, `introformat`, `timeopen`, `timeclose`, `preferredbehaviour`, `attempts`, `attemptonlast`, `grademethod`, `decimalpoints`, `questiondecimalpoints`, `reviewattempt`, `reviewcorrectness`, `reviewmarks`, `reviewspecificfeedback`, `reviewgeneralfeedback`, `reviewrightanswer`, `reviewoverallfeedback`, `questionsperpage`, `shufflequestions`, `shuffleanswers`, `questions`, `sumgrades`, `grade`, `timecreated`, `timemodified`, `timelimit`, `password`, `subnet`, `browsersecurity`, `delay1`, `delay2`, `showuserpicture`, `showblocks`) VALUES
(2, 3, 'Final Test', '<p>Final is everything!</p>', 1, 0, 0, 'adaptive', 1, 0, 1, 2, -1, 69632, 0, 16, 0, 0, 0, 16, 1, 0, 1, '1,2,0,0', 100.00000, 100.00000, 0, 1337759488, 0, '', '', '-', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `layout` text COLLATE utf8_unicode_ci NOT NULL,
  `preview` smallint(3) unsigned NOT NULL DEFAULT '0',
  `needsupgradetonewqe` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_use_ix` (`userid`),
  KEY `mdl_quizatte_qui_ix` (`quiz`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores various attempts on a quiz' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mdl_quiz_attempts`
--

INSERT INTO `mdl_quiz_attempts` (`id`, `uniqueid`, `quiz`, `userid`, `attempt`, `sumgrades`, `timestart`, `timefinish`, `timemodified`, `layout`, `preview`, `needsupgradetonewqe`) VALUES
(1, 1, 2, 3, 1, 100.00000, 1337759342, 1337759426, 1337759426, '1,2,0', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedbacktext` text COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mdl_quiz_feedback`
--

INSERT INTO `mdl_quiz_feedback` (`id`, `quizid`, `feedbacktext`, `feedbacktextformat`, `mingrade`, `maxgrade`) VALUES
(3, 2, '<p>Overall feedback here, Boundary 100%</p>', 1, 0.00000, 101.00000);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overall grade for each user on the quiz, based on their ' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mdl_quiz_grades`
--

INSERT INTO `mdl_quiz_grades` (`id`, `quiz`, `userid`, `grade`, `timemodified`) VALUES
(1, 2, 3, 100.00000, 1337759510);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned DEFAULT NULL,
  `userid` bigint(10) unsigned DEFAULT NULL,
  `timeopen` bigint(10) unsigned DEFAULT NULL,
  `timeclose` bigint(10) unsigned DEFAULT NULL,
  `timelimit` bigint(10) unsigned DEFAULT NULL,
  `attempts` mediumint(6) unsigned DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) unsigned NOT NULL,
  `slot` bigint(10) unsigned NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_question_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the maximum possible grade (weight) for each question' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mdl_quiz_question_instances`
--

INSERT INTO `mdl_quiz_question_instances` (`id`, `quiz`, `question`, `grade`) VALUES
(1, 2, 1, 50.0000000),
(2, 2, 2, 50.0000000);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_question_response_stats`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_response_stats` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) unsigned NOT NULL,
  `questionid` bigint(10) unsigned NOT NULL,
  `subqid` bigint(10) unsigned NOT NULL,
  `aid` bigint(10) unsigned DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `rcount` bigint(10) unsigned DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Quiz question responses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_statistics` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) unsigned NOT NULL,
  `questionid` bigint(10) unsigned NOT NULL,
  `slot` bigint(10) unsigned DEFAULT NULL,
  `subquestion` smallint(4) unsigned NOT NULL,
  `s` bigint(10) unsigned NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` mediumtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` mediumtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Default comment for the table, please edit me' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) unsigned NOT NULL,
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `lastcron`, `cron`, `capability`) VALUES
(1, 'overview', 10000, 0, 0, NULL),
(2, 'responses', 9000, 0, 0, NULL),
(3, 'grading', 6000, 0, 0, NULL),
(4, 'statistics', 8000, 0, 18000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) unsigned NOT NULL,
  `groupid` bigint(10) unsigned NOT NULL,
  `allattempts` smallint(4) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `firstattemptscount` bigint(10) unsigned NOT NULL,
  `allattemptscount` bigint(10) unsigned NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) unsigned DEFAULT '1',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'local', 1, 1),
(2, 'recent', 1, 2),
(3, 'upload', 1, 3),
(4, 'user', 1, 4);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1337328289, 1337328289, 0),
(2, '', 2, 0, 1, NULL, NULL, 1337328290, 1337328290, 0),
(3, '', 3, 0, 1, NULL, NULL, 1337328291, 1337328291, 0),
(4, '', 4, 0, 1, NULL, NULL, 1337328292, 1337328292, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) unsigned DEFAULT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `alltext` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` text COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `cmid` bigint(10) unsigned DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  `migrated` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_nam_uix` (`name`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, 'Manager', 'manager', 'Managers can access course and modify them, they usually do not participate in courses.', 1, 'manager'),
(2, 'Course creator', 'coursecreator', 'Course creators can create new courses.', 2, 'coursecreator'),
(3, 'Teacher', 'editingteacher', 'Teachers can do anything within a course, including changing the activities and grading students.', 3, 'editingteacher'),
(4, 'Non-editing teacher', 'teacher', 'Non-editing teachers can teach in courses and grade students, but may not alter activities.', 4, 'teacher'),
(5, 'Student', 'student', 'Students generally have fewer privileges within a course.', 5, 'student'),
(6, 'Guest', 'guest', 'Guests have minimal privileges and usually can not enter text anywhere.', 6, 'guest'),
(7, 'Authenticated user', 'user', 'All logged in users.', 7, 'user'),
(8, 'Authenticated user on frontpage', 'frontpage', 'All logged in users in the frontpage course.', 8, 'frontpage');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `allowassign` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL,
  `allowswitch` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(2, 5, 27, 3, 1337758292, 2, '', 0, 0),
(3, 3, 27, 2, 1337763215, 2, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=902 ;

--
-- 转存表中的数据 `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1337328137, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1337328137, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1337328137, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1337328137, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1337328137, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1337328137, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1337328137, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1337328137, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1337328137, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1337328137, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1337328137, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1337328137, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1337328137, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1337328137, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1337328137, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1337328137, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1337328137, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1337328137, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1337328137, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1337328137, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1337328137, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1337328137, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1337328137, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1337328137, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1337328137, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1337328137, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1337328137, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1337328138, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1337328138, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1337328138, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1337328138, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1337328138, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1337328138, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1337328138, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1337328138, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1337328138, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1337328138, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1337328138, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1337328138, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1337328138, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1337328138, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1337328138, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1337328138, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1337328138, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1337328138, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1337328138, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1337328138, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1337328138, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1337328138, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1337328138, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1337328138, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1337328138, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1337328138, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1337328138, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1337328138, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1337328138, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1337328139, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1337328139, 0),
(59, 1, 1, 'moodle/user:create', 1, 1337328139, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1337328139, 0),
(61, 1, 1, 'moodle/user:update', 1, 1337328139, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1337328139, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1337328139, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1337328139, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1337328139, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1337328139, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1337328139, 0),
(68, 1, 4, 'moodle/user:viewhiddendetails', 1, 1337328139, 0),
(69, 1, 3, 'moodle/user:viewhiddendetails', 1, 1337328139, 0),
(70, 1, 1, 'moodle/user:viewhiddendetails', 1, 1337328139, 0),
(71, 1, 1, 'moodle/user:loginas', 1, 1337328139, 0),
(72, 1, 1, 'moodle/user:managesyspages', 1, 1337328139, 0),
(73, 1, 7, 'moodle/user:manageownblocks', 1, 1337328139, 0),
(74, 1, 7, 'moodle/user:manageownfiles', 1, 1337328139, 0),
(75, 1, 1, 'moodle/my:configsyspages', 1, 1337328139, 0),
(76, 1, 3, 'moodle/role:assign', 1, 1337328139, 0),
(77, 1, 1, 'moodle/role:assign', 1, 1337328139, 0),
(78, 1, 4, 'moodle/role:review', 1, 1337328139, 0),
(79, 1, 3, 'moodle/role:review', 1, 1337328139, 0),
(80, 1, 1, 'moodle/role:review', 1, 1337328139, 0),
(81, 1, 1, 'moodle/role:override', 1, 1337328139, 0),
(82, 1, 3, 'moodle/role:safeoverride', 1, 1337328140, 0),
(83, 1, 1, 'moodle/role:manage', 1, 1337328140, 0),
(84, 1, 3, 'moodle/role:switchroles', 1, 1337328140, 0),
(85, 1, 1, 'moodle/role:switchroles', 1, 1337328140, 0),
(86, 1, 1, 'moodle/category:manage', 1, 1337328140, 0),
(87, 1, 2, 'moodle/category:viewhiddencategories', 1, 1337328140, 0),
(88, 1, 1, 'moodle/category:viewhiddencategories', 1, 1337328140, 0),
(89, 1, 1, 'moodle/cohort:manage', 1, 1337328140, 0),
(90, 1, 1, 'moodle/cohort:assign', 1, 1337328140, 0),
(91, 1, 3, 'moodle/cohort:view', 1, 1337328140, 0),
(92, 1, 1, 'moodle/cohort:view', 1, 1337328140, 0),
(93, 1, 2, 'moodle/course:create', 1, 1337328140, 0),
(94, 1, 1, 'moodle/course:create', 1, 1337328140, 0),
(95, 1, 7, 'moodle/course:request', 1, 1337328140, 0),
(96, 1, 1, 'moodle/course:delete', 1, 1337328140, 0),
(97, 1, 3, 'moodle/course:update', 1, 1337328140, 0),
(98, 1, 1, 'moodle/course:update', 1, 1337328140, 0),
(99, 1, 1, 'moodle/course:view', 1, 1337328140, 0),
(100, 1, 3, 'moodle/course:enrolreview', 1, 1337328140, 0),
(101, 1, 1, 'moodle/course:enrolreview', 1, 1337328140, 0),
(102, 1, 3, 'moodle/course:enrolconfig', 1, 1337328140, 0),
(103, 1, 1, 'moodle/course:enrolconfig', 1, 1337328140, 0),
(104, 1, 4, 'moodle/course:bulkmessaging', 1, 1337328140, 0),
(105, 1, 3, 'moodle/course:bulkmessaging', 1, 1337328140, 0),
(106, 1, 1, 'moodle/course:bulkmessaging', 1, 1337328140, 0),
(107, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1337328140, 0),
(108, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1337328140, 0),
(109, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1337328140, 0),
(110, 1, 2, 'moodle/course:viewhiddencourses', 1, 1337328141, 0),
(111, 1, 4, 'moodle/course:viewhiddencourses', 1, 1337328141, 0),
(112, 1, 3, 'moodle/course:viewhiddencourses', 1, 1337328141, 0),
(113, 1, 1, 'moodle/course:viewhiddencourses', 1, 1337328141, 0),
(114, 1, 3, 'moodle/course:visibility', 1, 1337328141, 0),
(115, 1, 1, 'moodle/course:visibility', 1, 1337328141, 0),
(116, 1, 3, 'moodle/course:managefiles', 1, 1337328141, 0),
(117, 1, 1, 'moodle/course:managefiles', 1, 1337328141, 0),
(118, 1, 3, 'moodle/course:manageactivities', 1, 1337328141, 0),
(119, 1, 1, 'moodle/course:manageactivities', 1, 1337328141, 0),
(120, 1, 3, 'moodle/course:activityvisibility', 1, 1337328141, 0),
(121, 1, 1, 'moodle/course:activityvisibility', 1, 1337328141, 0),
(122, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1337328141, 0),
(123, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1337328141, 0),
(124, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1337328141, 0),
(125, 1, 5, 'moodle/course:viewparticipants', 1, 1337328141, 0),
(126, 1, 4, 'moodle/course:viewparticipants', 1, 1337328141, 0),
(127, 1, 3, 'moodle/course:viewparticipants', 1, 1337328141, 0),
(128, 1, 1, 'moodle/course:viewparticipants', 1, 1337328141, 0),
(129, 1, 3, 'moodle/course:changefullname', 1, 1337328141, 0),
(130, 1, 1, 'moodle/course:changefullname', 1, 1337328141, 0),
(131, 1, 3, 'moodle/course:changeshortname', 1, 1337328141, 0),
(132, 1, 1, 'moodle/course:changeshortname', 1, 1337328141, 0),
(133, 1, 3, 'moodle/course:changeidnumber', 1, 1337328141, 0),
(134, 1, 1, 'moodle/course:changeidnumber', 1, 1337328141, 0),
(135, 1, 3, 'moodle/course:changecategory', 1, 1337328141, 0),
(136, 1, 1, 'moodle/course:changecategory', 1, 1337328141, 0),
(137, 1, 3, 'moodle/course:changesummary', 1, 1337328141, 0),
(138, 1, 1, 'moodle/course:changesummary', 1, 1337328141, 0),
(139, 1, 1, 'moodle/site:viewparticipants', 1, 1337328141, 0),
(140, 1, 5, 'moodle/course:viewscales', 1, 1337328142, 0),
(141, 1, 4, 'moodle/course:viewscales', 1, 1337328142, 0),
(142, 1, 3, 'moodle/course:viewscales', 1, 1337328142, 0),
(143, 1, 1, 'moodle/course:viewscales', 1, 1337328142, 0),
(144, 1, 3, 'moodle/course:managescales', 1, 1337328142, 0),
(145, 1, 1, 'moodle/course:managescales', 1, 1337328142, 0),
(146, 1, 3, 'moodle/course:managegroups', 1, 1337328142, 0),
(147, 1, 1, 'moodle/course:managegroups', 1, 1337328142, 0),
(148, 1, 3, 'moodle/course:reset', 1, 1337328142, 0),
(149, 1, 1, 'moodle/course:reset', 1, 1337328142, 0),
(150, 1, 6, 'moodle/blog:view', 1, 1337328142, 0),
(151, 1, 7, 'moodle/blog:view', 1, 1337328142, 0),
(152, 1, 5, 'moodle/blog:view', 1, 1337328142, 0),
(153, 1, 4, 'moodle/blog:view', 1, 1337328142, 0),
(154, 1, 3, 'moodle/blog:view', 1, 1337328142, 0),
(155, 1, 1, 'moodle/blog:view', 1, 1337328142, 0),
(156, 1, 6, 'moodle/blog:search', 1, 1337328142, 0),
(157, 1, 7, 'moodle/blog:search', 1, 1337328142, 0),
(158, 1, 5, 'moodle/blog:search', 1, 1337328142, 0),
(159, 1, 4, 'moodle/blog:search', 1, 1337328142, 0),
(160, 1, 3, 'moodle/blog:search', 1, 1337328142, 0),
(161, 1, 1, 'moodle/blog:search', 1, 1337328142, 0),
(162, 1, 1, 'moodle/blog:viewdrafts', 1, 1337328142, 0),
(163, 1, 7, 'moodle/blog:create', 1, 1337328142, 0),
(164, 1, 1, 'moodle/blog:create', 1, 1337328142, 0),
(165, 1, 4, 'moodle/blog:manageentries', 1, 1337328142, 0),
(166, 1, 3, 'moodle/blog:manageentries', 1, 1337328142, 0),
(167, 1, 1, 'moodle/blog:manageentries', 1, 1337328142, 0),
(168, 1, 5, 'moodle/blog:manageexternal', 1, 1337328142, 0),
(169, 1, 7, 'moodle/blog:manageexternal', 1, 1337328142, 0),
(170, 1, 4, 'moodle/blog:manageexternal', 1, 1337328142, 0),
(171, 1, 3, 'moodle/blog:manageexternal', 1, 1337328142, 0),
(172, 1, 1, 'moodle/blog:manageexternal', 1, 1337328142, 0),
(173, 1, 5, 'moodle/blog:associatecourse', 1, 1337328142, 0),
(174, 1, 7, 'moodle/blog:associatecourse', 1, 1337328142, 0),
(175, 1, 4, 'moodle/blog:associatecourse', 1, 1337328143, 0),
(176, 1, 3, 'moodle/blog:associatecourse', 1, 1337328143, 0),
(177, 1, 1, 'moodle/blog:associatecourse', 1, 1337328143, 0),
(178, 1, 5, 'moodle/blog:associatemodule', 1, 1337328143, 0),
(179, 1, 7, 'moodle/blog:associatemodule', 1, 1337328143, 0),
(180, 1, 4, 'moodle/blog:associatemodule', 1, 1337328143, 0),
(181, 1, 3, 'moodle/blog:associatemodule', 1, 1337328143, 0),
(182, 1, 1, 'moodle/blog:associatemodule', 1, 1337328143, 0),
(183, 1, 7, 'moodle/calendar:manageownentries', 1, 1337328143, 0),
(184, 1, 1, 'moodle/calendar:manageownentries', 1, 1337328143, 0),
(185, 1, 4, 'moodle/calendar:managegroupentries', 1, 1337328143, 0),
(186, 1, 3, 'moodle/calendar:managegroupentries', 1, 1337328143, 0),
(187, 1, 1, 'moodle/calendar:managegroupentries', 1, 1337328143, 0),
(188, 1, 4, 'moodle/calendar:manageentries', 1, 1337328143, 0),
(189, 1, 3, 'moodle/calendar:manageentries', 1, 1337328143, 0),
(190, 1, 1, 'moodle/calendar:manageentries', 1, 1337328143, 0),
(191, 1, 1, 'moodle/user:editprofile', 1, 1337328143, 0),
(192, 1, 6, 'moodle/user:editownprofile', -1000, 1337328143, 0),
(193, 1, 7, 'moodle/user:editownprofile', 1, 1337328143, 0),
(194, 1, 1, 'moodle/user:editownprofile', 1, 1337328143, 0),
(195, 1, 6, 'moodle/user:changeownpassword', -1000, 1337328143, 0),
(196, 1, 7, 'moodle/user:changeownpassword', 1, 1337328143, 0),
(197, 1, 1, 'moodle/user:changeownpassword', 1, 1337328143, 0),
(198, 1, 5, 'moodle/user:readuserposts', 1, 1337328144, 0),
(199, 1, 4, 'moodle/user:readuserposts', 1, 1337328144, 0),
(200, 1, 3, 'moodle/user:readuserposts', 1, 1337328144, 0),
(201, 1, 1, 'moodle/user:readuserposts', 1, 1337328144, 0),
(202, 1, 5, 'moodle/user:readuserblogs', 1, 1337328144, 0),
(203, 1, 4, 'moodle/user:readuserblogs', 1, 1337328144, 0),
(204, 1, 3, 'moodle/user:readuserblogs', 1, 1337328144, 0),
(205, 1, 1, 'moodle/user:readuserblogs', 1, 1337328144, 0),
(206, 1, 1, 'moodle/user:editmessageprofile', 1, 1337328144, 0),
(207, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1337328144, 0),
(208, 1, 7, 'moodle/user:editownmessageprofile', 1, 1337328144, 0),
(209, 1, 1, 'moodle/user:editownmessageprofile', 1, 1337328144, 0),
(210, 1, 3, 'moodle/question:managecategory', 1, 1337328144, 0),
(211, 1, 1, 'moodle/question:managecategory', 1, 1337328144, 0),
(212, 1, 3, 'moodle/question:add', 1, 1337328144, 0),
(213, 1, 1, 'moodle/question:add', 1, 1337328144, 0),
(214, 1, 3, 'moodle/question:editmine', 1, 1337328144, 0),
(215, 1, 1, 'moodle/question:editmine', 1, 1337328144, 0),
(216, 1, 3, 'moodle/question:editall', 1, 1337328144, 0),
(217, 1, 1, 'moodle/question:editall', 1, 1337328144, 0),
(218, 1, 3, 'moodle/question:viewmine', 1, 1337328144, 0),
(219, 1, 1, 'moodle/question:viewmine', 1, 1337328144, 0),
(220, 1, 3, 'moodle/question:viewall', 1, 1337328144, 0),
(221, 1, 1, 'moodle/question:viewall', 1, 1337328144, 0),
(222, 1, 3, 'moodle/question:usemine', 1, 1337328144, 0),
(223, 1, 1, 'moodle/question:usemine', 1, 1337328144, 0),
(224, 1, 3, 'moodle/question:useall', 1, 1337328144, 0),
(225, 1, 1, 'moodle/question:useall', 1, 1337328144, 0),
(226, 1, 3, 'moodle/question:movemine', 1, 1337328144, 0),
(227, 1, 1, 'moodle/question:movemine', 1, 1337328144, 0),
(228, 1, 3, 'moodle/question:moveall', 1, 1337328144, 0),
(229, 1, 1, 'moodle/question:moveall', 1, 1337328144, 0),
(230, 1, 1, 'moodle/question:config', 1, 1337328145, 0),
(231, 1, 5, 'moodle/question:flag', 1, 1337328145, 0),
(232, 1, 4, 'moodle/question:flag', 1, 1337328145, 0),
(233, 1, 3, 'moodle/question:flag', 1, 1337328145, 0),
(234, 1, 1, 'moodle/question:flag', 1, 1337328145, 0),
(235, 1, 4, 'moodle/site:doclinks', 1, 1337328145, 0),
(236, 1, 3, 'moodle/site:doclinks', 1, 1337328145, 0),
(237, 1, 1, 'moodle/site:doclinks', 1, 1337328145, 0),
(238, 1, 3, 'moodle/course:sectionvisibility', 1, 1337328145, 0),
(239, 1, 1, 'moodle/course:sectionvisibility', 1, 1337328145, 0),
(240, 1, 3, 'moodle/course:useremail', 1, 1337328145, 0),
(241, 1, 1, 'moodle/course:useremail', 1, 1337328145, 0),
(242, 1, 3, 'moodle/course:viewhiddensections', 1, 1337328145, 0),
(243, 1, 1, 'moodle/course:viewhiddensections', 1, 1337328145, 0),
(244, 1, 3, 'moodle/course:setcurrentsection', 1, 1337328145, 0),
(245, 1, 1, 'moodle/course:setcurrentsection', 1, 1337328145, 0),
(246, 1, 4, 'moodle/grade:viewall', 1, 1337328145, 0),
(247, 1, 3, 'moodle/grade:viewall', 1, 1337328145, 0),
(248, 1, 1, 'moodle/grade:viewall', 1, 1337328145, 0),
(249, 1, 5, 'moodle/grade:view', 1, 1337328145, 0),
(250, 1, 4, 'moodle/grade:viewhidden', 1, 1337328145, 0),
(251, 1, 3, 'moodle/grade:viewhidden', 1, 1337328145, 0),
(252, 1, 1, 'moodle/grade:viewhidden', 1, 1337328145, 0),
(253, 1, 3, 'moodle/grade:import', 1, 1337328145, 0),
(254, 1, 1, 'moodle/grade:import', 1, 1337328145, 0),
(255, 1, 4, 'moodle/grade:export', 1, 1337328145, 0),
(256, 1, 3, 'moodle/grade:export', 1, 1337328145, 0),
(257, 1, 1, 'moodle/grade:export', 1, 1337328145, 0),
(258, 1, 3, 'moodle/grade:manage', 1, 1337328145, 0),
(259, 1, 1, 'moodle/grade:manage', 1, 1337328145, 0),
(260, 1, 3, 'moodle/grade:edit', 1, 1337328146, 0),
(261, 1, 1, 'moodle/grade:edit', 1, 1337328146, 0),
(262, 1, 3, 'moodle/grade:managegradingforms', 1, 1337328146, 0),
(263, 1, 1, 'moodle/grade:managegradingforms', 1, 1337328146, 0),
(264, 1, 1, 'moodle/grade:sharegradingforms', 1, 1337328146, 0),
(265, 1, 1, 'moodle/grade:managesharedforms', 1, 1337328146, 0),
(266, 1, 3, 'moodle/grade:manageoutcomes', 1, 1337328146, 0),
(267, 1, 1, 'moodle/grade:manageoutcomes', 1, 1337328146, 0),
(268, 1, 3, 'moodle/grade:manageletters', 1, 1337328146, 0),
(269, 1, 1, 'moodle/grade:manageletters', 1, 1337328146, 0),
(270, 1, 3, 'moodle/grade:hide', 1, 1337328146, 0),
(271, 1, 1, 'moodle/grade:hide', 1, 1337328146, 0),
(272, 1, 3, 'moodle/grade:lock', 1, 1337328146, 0),
(273, 1, 1, 'moodle/grade:lock', 1, 1337328146, 0),
(274, 1, 3, 'moodle/grade:unlock', 1, 1337328146, 0),
(275, 1, 1, 'moodle/grade:unlock', 1, 1337328146, 0),
(276, 1, 7, 'moodle/my:manageblocks', 1, 1337328146, 0),
(277, 1, 4, 'moodle/notes:view', 1, 1337328146, 0),
(278, 1, 3, 'moodle/notes:view', 1, 1337328146, 0),
(279, 1, 1, 'moodle/notes:view', 1, 1337328146, 0),
(280, 1, 4, 'moodle/notes:manage', 1, 1337328146, 0),
(281, 1, 3, 'moodle/notes:manage', 1, 1337328146, 0),
(282, 1, 1, 'moodle/notes:manage', 1, 1337328146, 0),
(283, 1, 4, 'moodle/tag:manage', 1, 1337328146, 0),
(284, 1, 3, 'moodle/tag:manage', 1, 1337328146, 0),
(285, 1, 1, 'moodle/tag:manage', 1, 1337328146, 0),
(286, 1, 1, 'moodle/tag:create', 1, 1337328146, 0),
(287, 1, 7, 'moodle/tag:create', 1, 1337328146, 0),
(288, 1, 1, 'moodle/tag:edit', 1, 1337328147, 0),
(289, 1, 7, 'moodle/tag:edit', 1, 1337328147, 0),
(290, 1, 4, 'moodle/tag:editblocks', 1, 1337328147, 0),
(291, 1, 3, 'moodle/tag:editblocks', 1, 1337328147, 0),
(292, 1, 1, 'moodle/tag:editblocks', 1, 1337328147, 0),
(293, 1, 6, 'moodle/block:view', 1, 1337328147, 0),
(294, 1, 7, 'moodle/block:view', 1, 1337328147, 0),
(295, 1, 5, 'moodle/block:view', 1, 1337328147, 0),
(296, 1, 4, 'moodle/block:view', 1, 1337328147, 0),
(297, 1, 3, 'moodle/block:view', 1, 1337328147, 0),
(298, 1, 3, 'moodle/block:edit', 1, 1337328147, 0),
(299, 1, 7, 'moodle/portfolio:export', 1, 1337328147, 0),
(300, 1, 5, 'moodle/portfolio:export', 1, 1337328147, 0),
(301, 1, 4, 'moodle/portfolio:export', 1, 1337328147, 0),
(302, 1, 3, 'moodle/portfolio:export', 1, 1337328147, 0),
(303, 1, 8, 'moodle/comment:view', 1, 1337328147, 0),
(304, 1, 6, 'moodle/comment:view', 1, 1337328147, 0),
(305, 1, 7, 'moodle/comment:view', 1, 1337328147, 0),
(306, 1, 5, 'moodle/comment:view', 1, 1337328147, 0),
(307, 1, 4, 'moodle/comment:view', 1, 1337328147, 0),
(308, 1, 3, 'moodle/comment:view', 1, 1337328147, 0),
(309, 1, 1, 'moodle/comment:view', 1, 1337328147, 0),
(310, 1, 7, 'moodle/comment:post', 1, 1337328147, 0),
(311, 1, 5, 'moodle/comment:post', 1, 1337328147, 0),
(312, 1, 4, 'moodle/comment:post', 1, 1337328147, 0),
(313, 1, 3, 'moodle/comment:post', 1, 1337328147, 0),
(314, 1, 1, 'moodle/comment:post', 1, 1337328147, 0),
(315, 1, 3, 'moodle/comment:delete', 1, 1337328147, 0),
(316, 1, 1, 'moodle/comment:delete', 1, 1337328147, 0),
(317, 1, 1, 'moodle/webservice:createtoken', 1, 1337328147, 0),
(318, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1337328147, 0),
(319, 1, 7, 'moodle/rating:view', 1, 1337328147, 0),
(320, 1, 5, 'moodle/rating:view', 1, 1337328147, 0),
(321, 1, 4, 'moodle/rating:view', 1, 1337328147, 0),
(322, 1, 3, 'moodle/rating:view', 1, 1337328147, 0),
(323, 1, 1, 'moodle/rating:view', 1, 1337328148, 0),
(324, 1, 7, 'moodle/rating:viewany', 1, 1337328148, 0),
(325, 1, 5, 'moodle/rating:viewany', 1, 1337328148, 0),
(326, 1, 4, 'moodle/rating:viewany', 1, 1337328148, 0),
(327, 1, 3, 'moodle/rating:viewany', 1, 1337328148, 0),
(328, 1, 1, 'moodle/rating:viewany', 1, 1337328148, 0),
(329, 1, 7, 'moodle/rating:viewall', 1, 1337328148, 0),
(330, 1, 5, 'moodle/rating:viewall', 1, 1337328148, 0),
(331, 1, 4, 'moodle/rating:viewall', 1, 1337328148, 0),
(332, 1, 3, 'moodle/rating:viewall', 1, 1337328148, 0),
(333, 1, 1, 'moodle/rating:viewall', 1, 1337328148, 0),
(334, 1, 7, 'moodle/rating:rate', 1, 1337328148, 0),
(335, 1, 5, 'moodle/rating:rate', 1, 1337328148, 0),
(336, 1, 4, 'moodle/rating:rate', 1, 1337328148, 0),
(337, 1, 3, 'moodle/rating:rate', 1, 1337328148, 0),
(338, 1, 1, 'moodle/rating:rate', 1, 1337328148, 0),
(339, 1, 1, 'moodle/course:publish', 1, 1337328148, 0),
(340, 1, 4, 'moodle/course:markcomplete', 1, 1337328148, 0),
(341, 1, 3, 'moodle/course:markcomplete', 1, 1337328148, 0),
(342, 1, 1, 'moodle/course:markcomplete', 1, 1337328148, 0),
(343, 1, 1, 'moodle/community:add', 1, 1337328148, 0),
(344, 1, 4, 'moodle/community:add', 1, 1337328148, 0),
(345, 1, 3, 'moodle/community:add', 1, 1337328148, 0),
(346, 1, 1, 'moodle/community:download', 1, 1337328148, 0),
(347, 1, 3, 'moodle/community:download', 1, 1337328148, 0),
(348, 1, 6, 'mod/assignment:view', 1, 1337328184, 0),
(349, 1, 5, 'mod/assignment:view', 1, 1337328184, 0),
(350, 1, 4, 'mod/assignment:view', 1, 1337328184, 0),
(351, 1, 3, 'mod/assignment:view', 1, 1337328184, 0),
(352, 1, 1, 'mod/assignment:view', 1, 1337328184, 0),
(353, 1, 5, 'mod/assignment:submit', 1, 1337328184, 0),
(354, 1, 4, 'mod/assignment:grade', 1, 1337328184, 0),
(355, 1, 3, 'mod/assignment:grade', 1, 1337328184, 0),
(356, 1, 1, 'mod/assignment:grade', 1, 1337328184, 0),
(357, 1, 4, 'mod/assignment:exportownsubmission', 1, 1337328184, 0),
(358, 1, 3, 'mod/assignment:exportownsubmission', 1, 1337328184, 0),
(359, 1, 1, 'mod/assignment:exportownsubmission', 1, 1337328184, 0),
(360, 1, 5, 'mod/assignment:exportownsubmission', 1, 1337328184, 0),
(361, 1, 5, 'mod/chat:chat', 1, 1337328187, 0),
(362, 1, 4, 'mod/chat:chat', 1, 1337328187, 0),
(363, 1, 3, 'mod/chat:chat', 1, 1337328187, 0),
(364, 1, 1, 'mod/chat:chat', 1, 1337328187, 0),
(365, 1, 5, 'mod/chat:readlog', 1, 1337328187, 0),
(366, 1, 4, 'mod/chat:readlog', 1, 1337328187, 0),
(367, 1, 3, 'mod/chat:readlog', 1, 1337328187, 0),
(368, 1, 1, 'mod/chat:readlog', 1, 1337328187, 0),
(369, 1, 4, 'mod/chat:deletelog', 1, 1337328187, 0),
(370, 1, 3, 'mod/chat:deletelog', 1, 1337328187, 0),
(371, 1, 1, 'mod/chat:deletelog', 1, 1337328187, 0),
(372, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1337328187, 0),
(373, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1337328187, 0),
(374, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1337328187, 0),
(375, 1, 4, 'mod/chat:exportsession', 1, 1337328188, 0),
(376, 1, 3, 'mod/chat:exportsession', 1, 1337328188, 0),
(377, 1, 1, 'mod/chat:exportsession', 1, 1337328188, 0),
(378, 1, 5, 'mod/choice:choose', 1, 1337328189, 0),
(379, 1, 4, 'mod/choice:choose', 1, 1337328189, 0),
(380, 1, 3, 'mod/choice:choose', 1, 1337328189, 0),
(381, 1, 4, 'mod/choice:readresponses', 1, 1337328189, 0),
(382, 1, 3, 'mod/choice:readresponses', 1, 1337328189, 0),
(383, 1, 1, 'mod/choice:readresponses', 1, 1337328189, 0),
(384, 1, 4, 'mod/choice:deleteresponses', 1, 1337328189, 0),
(385, 1, 3, 'mod/choice:deleteresponses', 1, 1337328189, 0),
(386, 1, 1, 'mod/choice:deleteresponses', 1, 1337328189, 0),
(387, 1, 4, 'mod/choice:downloadresponses', 1, 1337328189, 0),
(388, 1, 3, 'mod/choice:downloadresponses', 1, 1337328189, 0),
(389, 1, 1, 'mod/choice:downloadresponses', 1, 1337328189, 0),
(390, 1, 8, 'mod/data:viewentry', 1, 1337328191, 0),
(391, 1, 6, 'mod/data:viewentry', 1, 1337328191, 0),
(392, 1, 5, 'mod/data:viewentry', 1, 1337328191, 0),
(393, 1, 4, 'mod/data:viewentry', 1, 1337328191, 0),
(394, 1, 3, 'mod/data:viewentry', 1, 1337328191, 0),
(395, 1, 1, 'mod/data:viewentry', 1, 1337328191, 0),
(396, 1, 5, 'mod/data:writeentry', 1, 1337328191, 0),
(397, 1, 4, 'mod/data:writeentry', 1, 1337328191, 0),
(398, 1, 3, 'mod/data:writeentry', 1, 1337328191, 0),
(399, 1, 1, 'mod/data:writeentry', 1, 1337328191, 0),
(400, 1, 5, 'mod/data:comment', 1, 1337328191, 0),
(401, 1, 4, 'mod/data:comment', 1, 1337328191, 0),
(402, 1, 3, 'mod/data:comment', 1, 1337328191, 0),
(403, 1, 1, 'mod/data:comment', 1, 1337328191, 0),
(404, 1, 4, 'mod/data:rate', 1, 1337328191, 0),
(405, 1, 3, 'mod/data:rate', 1, 1337328191, 0),
(406, 1, 1, 'mod/data:rate', 1, 1337328191, 0),
(407, 1, 4, 'mod/data:viewrating', 1, 1337328191, 0),
(408, 1, 3, 'mod/data:viewrating', 1, 1337328191, 0),
(409, 1, 1, 'mod/data:viewrating', 1, 1337328191, 0),
(410, 1, 4, 'mod/data:viewanyrating', 1, 1337328191, 0),
(411, 1, 3, 'mod/data:viewanyrating', 1, 1337328191, 0),
(412, 1, 1, 'mod/data:viewanyrating', 1, 1337328191, 0),
(413, 1, 4, 'mod/data:viewallratings', 1, 1337328191, 0),
(414, 1, 3, 'mod/data:viewallratings', 1, 1337328191, 0),
(415, 1, 1, 'mod/data:viewallratings', 1, 1337328191, 0),
(416, 1, 4, 'mod/data:approve', 1, 1337328191, 0),
(417, 1, 3, 'mod/data:approve', 1, 1337328191, 0),
(418, 1, 1, 'mod/data:approve', 1, 1337328192, 0),
(419, 1, 4, 'mod/data:manageentries', 1, 1337328192, 0),
(420, 1, 3, 'mod/data:manageentries', 1, 1337328192, 0),
(421, 1, 1, 'mod/data:manageentries', 1, 1337328192, 0),
(422, 1, 4, 'mod/data:managecomments', 1, 1337328192, 0),
(423, 1, 3, 'mod/data:managecomments', 1, 1337328192, 0),
(424, 1, 1, 'mod/data:managecomments', 1, 1337328192, 0),
(425, 1, 3, 'mod/data:managetemplates', 1, 1337328192, 0),
(426, 1, 1, 'mod/data:managetemplates', 1, 1337328192, 0),
(427, 1, 4, 'mod/data:viewalluserpresets', 1, 1337328192, 0),
(428, 1, 3, 'mod/data:viewalluserpresets', 1, 1337328192, 0),
(429, 1, 1, 'mod/data:viewalluserpresets', 1, 1337328192, 0),
(430, 1, 1, 'mod/data:manageuserpresets', 1, 1337328192, 0),
(431, 1, 1, 'mod/data:exportentry', 1, 1337328192, 0),
(432, 1, 4, 'mod/data:exportentry', 1, 1337328192, 0),
(433, 1, 3, 'mod/data:exportentry', 1, 1337328192, 0),
(434, 1, 1, 'mod/data:exportownentry', 1, 1337328192, 0),
(435, 1, 4, 'mod/data:exportownentry', 1, 1337328192, 0),
(436, 1, 3, 'mod/data:exportownentry', 1, 1337328192, 0),
(437, 1, 5, 'mod/data:exportownentry', 1, 1337328192, 0),
(438, 1, 1, 'mod/data:exportallentries', 1, 1337328192, 0),
(439, 1, 4, 'mod/data:exportallentries', 1, 1337328192, 0),
(440, 1, 3, 'mod/data:exportallentries', 1, 1337328192, 0),
(441, 1, 6, 'mod/feedback:view', 1, 1337328196, 0),
(442, 1, 5, 'mod/feedback:view', 1, 1337328196, 0),
(443, 1, 4, 'mod/feedback:view', 1, 1337328196, 0),
(444, 1, 3, 'mod/feedback:view', 1, 1337328196, 0),
(445, 1, 1, 'mod/feedback:view', 1, 1337328196, 0),
(446, 1, 5, 'mod/feedback:complete', 1, 1337328196, 0),
(447, 1, 5, 'mod/feedback:viewanalysepage', 1, 1337328196, 0),
(448, 1, 3, 'mod/feedback:viewanalysepage', 1, 1337328196, 0),
(449, 1, 1, 'mod/feedback:viewanalysepage', 1, 1337328196, 0),
(450, 1, 3, 'mod/feedback:deletesubmissions', 1, 1337328196, 0),
(451, 1, 1, 'mod/feedback:deletesubmissions', 1, 1337328196, 0),
(452, 1, 1, 'mod/feedback:mapcourse', 1, 1337328197, 0),
(453, 1, 3, 'mod/feedback:edititems', 1, 1337328197, 0),
(454, 1, 1, 'mod/feedback:edititems', 1, 1337328197, 0),
(455, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1337328197, 0),
(456, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1337328197, 0),
(457, 1, 3, 'mod/feedback:createpublictemplate', 1, 1337328197, 0),
(458, 1, 1, 'mod/feedback:createpublictemplate', 1, 1337328197, 0),
(459, 1, 3, 'mod/feedback:deletetemplate', 1, 1337328197, 0),
(460, 1, 1, 'mod/feedback:deletetemplate', 1, 1337328197, 0),
(461, 1, 4, 'mod/feedback:viewreports', 1, 1337328197, 0),
(462, 1, 3, 'mod/feedback:viewreports', 1, 1337328197, 0),
(463, 1, 1, 'mod/feedback:viewreports', 1, 1337328197, 0),
(464, 1, 4, 'mod/feedback:receivemail', 1, 1337328197, 0),
(465, 1, 3, 'mod/feedback:receivemail', 1, 1337328197, 0),
(466, 1, 6, 'mod/folder:view', 1, 1337328198, 0),
(467, 1, 7, 'mod/folder:view', 1, 1337328198, 0),
(468, 1, 3, 'mod/folder:managefiles', 1, 1337328198, 0),
(469, 1, 8, 'mod/forum:viewdiscussion', 1, 1337328201, 0),
(470, 1, 6, 'mod/forum:viewdiscussion', 1, 1337328201, 0),
(471, 1, 5, 'mod/forum:viewdiscussion', 1, 1337328201, 0),
(472, 1, 4, 'mod/forum:viewdiscussion', 1, 1337328201, 0),
(473, 1, 3, 'mod/forum:viewdiscussion', 1, 1337328201, 0),
(474, 1, 1, 'mod/forum:viewdiscussion', 1, 1337328201, 0),
(475, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1337328201, 0),
(476, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1337328201, 0),
(477, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1337328201, 0),
(478, 1, 5, 'mod/forum:startdiscussion', 1, 1337328201, 0),
(479, 1, 4, 'mod/forum:startdiscussion', 1, 1337328201, 0),
(480, 1, 3, 'mod/forum:startdiscussion', 1, 1337328201, 0),
(481, 1, 1, 'mod/forum:startdiscussion', 1, 1337328202, 0),
(482, 1, 5, 'mod/forum:replypost', 1, 1337328202, 0),
(483, 1, 4, 'mod/forum:replypost', 1, 1337328202, 0),
(484, 1, 3, 'mod/forum:replypost', 1, 1337328202, 0),
(485, 1, 1, 'mod/forum:replypost', 1, 1337328202, 0),
(486, 1, 4, 'mod/forum:addnews', 1, 1337328202, 0),
(487, 1, 3, 'mod/forum:addnews', 1, 1337328202, 0),
(488, 1, 1, 'mod/forum:addnews', 1, 1337328202, 0),
(489, 1, 4, 'mod/forum:replynews', 1, 1337328202, 0),
(490, 1, 3, 'mod/forum:replynews', 1, 1337328202, 0),
(491, 1, 1, 'mod/forum:replynews', 1, 1337328202, 0),
(492, 1, 5, 'mod/forum:viewrating', 1, 1337328202, 0),
(493, 1, 4, 'mod/forum:viewrating', 1, 1337328202, 0),
(494, 1, 3, 'mod/forum:viewrating', 1, 1337328202, 0),
(495, 1, 1, 'mod/forum:viewrating', 1, 1337328202, 0),
(496, 1, 4, 'mod/forum:viewanyrating', 1, 1337328202, 0),
(497, 1, 3, 'mod/forum:viewanyrating', 1, 1337328202, 0),
(498, 1, 1, 'mod/forum:viewanyrating', 1, 1337328202, 0),
(499, 1, 4, 'mod/forum:viewallratings', 1, 1337328202, 0),
(500, 1, 3, 'mod/forum:viewallratings', 1, 1337328202, 0),
(501, 1, 1, 'mod/forum:viewallratings', 1, 1337328202, 0),
(502, 1, 4, 'mod/forum:rate', 1, 1337328202, 0),
(503, 1, 3, 'mod/forum:rate', 1, 1337328202, 0),
(504, 1, 1, 'mod/forum:rate', 1, 1337328202, 0),
(505, 1, 5, 'mod/forum:createattachment', 1, 1337328202, 0),
(506, 1, 4, 'mod/forum:createattachment', 1, 1337328202, 0),
(507, 1, 3, 'mod/forum:createattachment', 1, 1337328202, 0),
(508, 1, 1, 'mod/forum:createattachment', 1, 1337328202, 0),
(509, 1, 5, 'mod/forum:deleteownpost', 1, 1337328202, 0),
(510, 1, 4, 'mod/forum:deleteownpost', 1, 1337328202, 0),
(511, 1, 3, 'mod/forum:deleteownpost', 1, 1337328202, 0),
(512, 1, 1, 'mod/forum:deleteownpost', 1, 1337328202, 0),
(513, 1, 4, 'mod/forum:deleteanypost', 1, 1337328202, 0),
(514, 1, 3, 'mod/forum:deleteanypost', 1, 1337328203, 0),
(515, 1, 1, 'mod/forum:deleteanypost', 1, 1337328203, 0),
(516, 1, 4, 'mod/forum:splitdiscussions', 1, 1337328203, 0),
(517, 1, 3, 'mod/forum:splitdiscussions', 1, 1337328203, 0),
(518, 1, 1, 'mod/forum:splitdiscussions', 1, 1337328203, 0),
(519, 1, 4, 'mod/forum:movediscussions', 1, 1337328203, 0),
(520, 1, 3, 'mod/forum:movediscussions', 1, 1337328203, 0),
(521, 1, 1, 'mod/forum:movediscussions', 1, 1337328203, 0),
(522, 1, 4, 'mod/forum:editanypost', 1, 1337328203, 0),
(523, 1, 3, 'mod/forum:editanypost', 1, 1337328203, 0),
(524, 1, 1, 'mod/forum:editanypost', 1, 1337328203, 0),
(525, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1337328203, 0),
(526, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1337328203, 0),
(527, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1337328203, 0),
(528, 1, 4, 'mod/forum:viewsubscribers', 1, 1337328203, 0),
(529, 1, 3, 'mod/forum:viewsubscribers', 1, 1337328203, 0),
(530, 1, 1, 'mod/forum:viewsubscribers', 1, 1337328203, 0),
(531, 1, 4, 'mod/forum:managesubscriptions', 1, 1337328203, 0),
(532, 1, 3, 'mod/forum:managesubscriptions', 1, 1337328203, 0),
(533, 1, 1, 'mod/forum:managesubscriptions', 1, 1337328203, 0),
(534, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1337328203, 0),
(535, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1337328203, 0),
(536, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1337328203, 0),
(537, 1, 4, 'mod/forum:exportdiscussion', 1, 1337328203, 0),
(538, 1, 3, 'mod/forum:exportdiscussion', 1, 1337328203, 0),
(539, 1, 1, 'mod/forum:exportdiscussion', 1, 1337328203, 0),
(540, 1, 4, 'mod/forum:exportpost', 1, 1337328203, 0),
(541, 1, 3, 'mod/forum:exportpost', 1, 1337328203, 0),
(542, 1, 1, 'mod/forum:exportpost', 1, 1337328203, 0),
(543, 1, 4, 'mod/forum:exportownpost', 1, 1337328203, 0),
(544, 1, 3, 'mod/forum:exportownpost', 1, 1337328203, 0),
(545, 1, 1, 'mod/forum:exportownpost', 1, 1337328203, 0),
(546, 1, 5, 'mod/forum:exportownpost', 1, 1337328203, 0),
(547, 1, 4, 'mod/forum:addquestion', 1, 1337328204, 0),
(548, 1, 3, 'mod/forum:addquestion', 1, 1337328204, 0),
(549, 1, 1, 'mod/forum:addquestion', 1, 1337328204, 0),
(550, 1, 5, 'mod/glossary:write', 1, 1337328206, 0),
(551, 1, 4, 'mod/glossary:write', 1, 1337328206, 0),
(552, 1, 3, 'mod/glossary:write', 1, 1337328206, 0),
(553, 1, 1, 'mod/glossary:write', 1, 1337328206, 0),
(554, 1, 4, 'mod/glossary:manageentries', 1, 1337328206, 0),
(555, 1, 3, 'mod/glossary:manageentries', 1, 1337328206, 0),
(556, 1, 1, 'mod/glossary:manageentries', 1, 1337328206, 0),
(557, 1, 4, 'mod/glossary:managecategories', 1, 1337328206, 0),
(558, 1, 3, 'mod/glossary:managecategories', 1, 1337328206, 0),
(559, 1, 1, 'mod/glossary:managecategories', 1, 1337328206, 0),
(560, 1, 5, 'mod/glossary:comment', 1, 1337328206, 0),
(561, 1, 4, 'mod/glossary:comment', 1, 1337328206, 0),
(562, 1, 3, 'mod/glossary:comment', 1, 1337328206, 0),
(563, 1, 1, 'mod/glossary:comment', 1, 1337328206, 0),
(564, 1, 4, 'mod/glossary:managecomments', 1, 1337328206, 0),
(565, 1, 3, 'mod/glossary:managecomments', 1, 1337328206, 0),
(566, 1, 1, 'mod/glossary:managecomments', 1, 1337328206, 0),
(567, 1, 4, 'mod/glossary:import', 1, 1337328206, 0),
(568, 1, 3, 'mod/glossary:import', 1, 1337328206, 0),
(569, 1, 1, 'mod/glossary:import', 1, 1337328206, 0),
(570, 1, 4, 'mod/glossary:export', 1, 1337328206, 0),
(571, 1, 3, 'mod/glossary:export', 1, 1337328206, 0),
(572, 1, 1, 'mod/glossary:export', 1, 1337328206, 0),
(573, 1, 4, 'mod/glossary:approve', 1, 1337328206, 0),
(574, 1, 3, 'mod/glossary:approve', 1, 1337328206, 0),
(575, 1, 1, 'mod/glossary:approve', 1, 1337328206, 0),
(576, 1, 4, 'mod/glossary:rate', 1, 1337328207, 0),
(577, 1, 3, 'mod/glossary:rate', 1, 1337328207, 0),
(578, 1, 1, 'mod/glossary:rate', 1, 1337328207, 0),
(579, 1, 4, 'mod/glossary:viewrating', 1, 1337328207, 0),
(580, 1, 3, 'mod/glossary:viewrating', 1, 1337328207, 0),
(581, 1, 1, 'mod/glossary:viewrating', 1, 1337328207, 0),
(582, 1, 4, 'mod/glossary:viewanyrating', 1, 1337328207, 0),
(583, 1, 3, 'mod/glossary:viewanyrating', 1, 1337328207, 0),
(584, 1, 1, 'mod/glossary:viewanyrating', 1, 1337328207, 0),
(585, 1, 4, 'mod/glossary:viewallratings', 1, 1337328207, 0),
(586, 1, 3, 'mod/glossary:viewallratings', 1, 1337328207, 0),
(587, 1, 1, 'mod/glossary:viewallratings', 1, 1337328207, 0),
(588, 1, 4, 'mod/glossary:exportentry', 1, 1337328207, 0),
(589, 1, 3, 'mod/glossary:exportentry', 1, 1337328207, 0),
(590, 1, 1, 'mod/glossary:exportentry', 1, 1337328207, 0),
(591, 1, 4, 'mod/glossary:exportownentry', 1, 1337328207, 0),
(592, 1, 3, 'mod/glossary:exportownentry', 1, 1337328207, 0),
(593, 1, 1, 'mod/glossary:exportownentry', 1, 1337328207, 0),
(594, 1, 5, 'mod/glossary:exportownentry', 1, 1337328207, 0),
(595, 1, 6, 'mod/imscp:view', 1, 1337328208, 0),
(596, 1, 7, 'mod/imscp:view', 1, 1337328208, 0),
(597, 1, 3, 'mod/lesson:edit', 1, 1337328212, 0),
(598, 1, 1, 'mod/lesson:edit', 1, 1337328212, 0),
(599, 1, 4, 'mod/lesson:manage', 1, 1337328212, 0),
(600, 1, 3, 'mod/lesson:manage', 1, 1337328212, 0),
(601, 1, 1, 'mod/lesson:manage', 1, 1337328212, 0),
(602, 1, 6, 'mod/lti:view', 1, 1337328213, 0),
(603, 1, 5, 'mod/lti:view', 1, 1337328213, 0),
(604, 1, 4, 'mod/lti:view', 1, 1337328213, 0),
(605, 1, 3, 'mod/lti:view', 1, 1337328213, 0),
(606, 1, 1, 'mod/lti:view', 1, 1337328213, 0),
(607, 1, 4, 'mod/lti:grade', 1, 1337328213, 0),
(608, 1, 3, 'mod/lti:grade', 1, 1337328213, 0),
(609, 1, 1, 'mod/lti:grade', 1, 1337328213, 0),
(610, 1, 4, 'mod/lti:manage', 1, 1337328214, 0),
(611, 1, 3, 'mod/lti:manage', 1, 1337328214, 0),
(612, 1, 1, 'mod/lti:manage', 1, 1337328214, 0),
(613, 1, 4, 'mod/lti:addcoursetool', 1, 1337328214, 0),
(614, 1, 3, 'mod/lti:addcoursetool', 1, 1337328214, 0),
(615, 1, 1, 'mod/lti:addcoursetool', 1, 1337328214, 0),
(616, 1, 4, 'mod/lti:requesttooladd', 1, 1337328214, 0),
(617, 1, 3, 'mod/lti:requesttooladd', 1, 1337328214, 0),
(618, 1, 1, 'mod/lti:requesttooladd', 1, 1337328214, 0),
(619, 1, 6, 'mod/page:view', 1, 1337328214, 0),
(620, 1, 7, 'mod/page:view', 1, 1337328214, 0),
(621, 1, 6, 'mod/quiz:view', 1, 1337328217, 0),
(622, 1, 5, 'mod/quiz:view', 1, 1337328217, 0),
(623, 1, 4, 'mod/quiz:view', 1, 1337328217, 0),
(624, 1, 3, 'mod/quiz:view', 1, 1337328217, 0),
(625, 1, 1, 'mod/quiz:view', 1, 1337328217, 0),
(626, 1, 5, 'mod/quiz:attempt', 1, 1337328218, 0),
(627, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1337328218, 0),
(628, 1, 3, 'mod/quiz:manage', 1, 1337328218, 0),
(629, 1, 1, 'mod/quiz:manage', 1, 1337328218, 0),
(630, 1, 3, 'mod/quiz:manageoverrides', 1, 1337328218, 0),
(631, 1, 1, 'mod/quiz:manageoverrides', 1, 1337328218, 0),
(632, 1, 4, 'mod/quiz:preview', 1, 1337328218, 0),
(633, 1, 3, 'mod/quiz:preview', 1, 1337328218, 0),
(634, 1, 1, 'mod/quiz:preview', 1, 1337328218, 0),
(635, 1, 4, 'mod/quiz:grade', 1, 1337328218, 0),
(636, 1, 3, 'mod/quiz:grade', 1, 1337328218, 0),
(637, 1, 1, 'mod/quiz:grade', 1, 1337328218, 0),
(638, 1, 4, 'mod/quiz:regrade', 1, 1337328218, 0),
(639, 1, 3, 'mod/quiz:regrade', 1, 1337328218, 0),
(640, 1, 1, 'mod/quiz:regrade', 1, 1337328218, 0),
(641, 1, 4, 'mod/quiz:viewreports', 1, 1337328218, 0),
(642, 1, 3, 'mod/quiz:viewreports', 1, 1337328218, 0),
(643, 1, 1, 'mod/quiz:viewreports', 1, 1337328218, 0),
(644, 1, 3, 'mod/quiz:deleteattempts', 1, 1337328218, 0),
(645, 1, 1, 'mod/quiz:deleteattempts', 1, 1337328218, 0),
(646, 1, 6, 'mod/resource:view', 1, 1337328220, 0),
(647, 1, 7, 'mod/resource:view', 1, 1337328220, 0),
(648, 1, 4, 'mod/scorm:viewreport', 1, 1337328224, 0),
(649, 1, 3, 'mod/scorm:viewreport', 1, 1337328224, 0),
(650, 1, 1, 'mod/scorm:viewreport', 1, 1337328224, 0),
(651, 1, 5, 'mod/scorm:skipview', 1, 1337328224, 0),
(652, 1, 5, 'mod/scorm:savetrack', 1, 1337328224, 0),
(653, 1, 4, 'mod/scorm:savetrack', 1, 1337328224, 0),
(654, 1, 3, 'mod/scorm:savetrack', 1, 1337328224, 0),
(655, 1, 1, 'mod/scorm:savetrack', 1, 1337328224, 0),
(656, 1, 5, 'mod/scorm:viewscores', 1, 1337328224, 0),
(657, 1, 4, 'mod/scorm:viewscores', 1, 1337328224, 0),
(658, 1, 3, 'mod/scorm:viewscores', 1, 1337328224, 0),
(659, 1, 1, 'mod/scorm:viewscores', 1, 1337328224, 0),
(660, 1, 4, 'mod/scorm:deleteresponses', 1, 1337328224, 0),
(661, 1, 3, 'mod/scorm:deleteresponses', 1, 1337328225, 0),
(662, 1, 1, 'mod/scorm:deleteresponses', 1, 1337328225, 0),
(663, 1, 5, 'mod/survey:participate', 1, 1337328228, 0),
(664, 1, 4, 'mod/survey:participate', 1, 1337328228, 0),
(665, 1, 3, 'mod/survey:participate', 1, 1337328228, 0),
(666, 1, 1, 'mod/survey:participate', 1, 1337328228, 0),
(667, 1, 4, 'mod/survey:readresponses', 1, 1337328228, 0),
(668, 1, 3, 'mod/survey:readresponses', 1, 1337328228, 0),
(669, 1, 1, 'mod/survey:readresponses', 1, 1337328228, 0),
(670, 1, 4, 'mod/survey:download', 1, 1337328229, 0),
(671, 1, 3, 'mod/survey:download', 1, 1337328229, 0),
(672, 1, 1, 'mod/survey:download', 1, 1337328229, 0),
(673, 1, 6, 'mod/url:view', 1, 1337328230, 0),
(674, 1, 7, 'mod/url:view', 1, 1337328230, 0),
(675, 1, 6, 'mod/wiki:viewpage', 1, 1337328232, 0),
(676, 1, 5, 'mod/wiki:viewpage', 1, 1337328232, 0),
(677, 1, 4, 'mod/wiki:viewpage', 1, 1337328232, 0),
(678, 1, 3, 'mod/wiki:viewpage', 1, 1337328232, 0),
(679, 1, 1, 'mod/wiki:viewpage', 1, 1337328232, 0),
(680, 1, 5, 'mod/wiki:editpage', 1, 1337328232, 0),
(681, 1, 4, 'mod/wiki:editpage', 1, 1337328232, 0),
(682, 1, 3, 'mod/wiki:editpage', 1, 1337328232, 0),
(683, 1, 1, 'mod/wiki:editpage', 1, 1337328232, 0),
(684, 1, 5, 'mod/wiki:createpage', 1, 1337328232, 0),
(685, 1, 4, 'mod/wiki:createpage', 1, 1337328232, 0),
(686, 1, 3, 'mod/wiki:createpage', 1, 1337328232, 0),
(687, 1, 1, 'mod/wiki:createpage', 1, 1337328232, 0),
(688, 1, 5, 'mod/wiki:viewcomment', 1, 1337328232, 0),
(689, 1, 4, 'mod/wiki:viewcomment', 1, 1337328232, 0),
(690, 1, 3, 'mod/wiki:viewcomment', 1, 1337328232, 0),
(691, 1, 1, 'mod/wiki:viewcomment', 1, 1337328232, 0),
(692, 1, 5, 'mod/wiki:editcomment', 1, 1337328232, 0),
(693, 1, 4, 'mod/wiki:editcomment', 1, 1337328232, 0),
(694, 1, 3, 'mod/wiki:editcomment', 1, 1337328233, 0),
(695, 1, 1, 'mod/wiki:editcomment', 1, 1337328233, 0),
(696, 1, 4, 'mod/wiki:managecomment', 1, 1337328233, 0),
(697, 1, 3, 'mod/wiki:managecomment', 1, 1337328233, 0),
(698, 1, 1, 'mod/wiki:managecomment', 1, 1337328233, 0),
(699, 1, 4, 'mod/wiki:managefiles', 1, 1337328233, 0),
(700, 1, 3, 'mod/wiki:managefiles', 1, 1337328233, 0),
(701, 1, 1, 'mod/wiki:managefiles', 1, 1337328233, 0),
(702, 1, 4, 'mod/wiki:overridelock', 1, 1337328233, 0),
(703, 1, 3, 'mod/wiki:overridelock', 1, 1337328233, 0),
(704, 1, 1, 'mod/wiki:overridelock', 1, 1337328233, 0),
(705, 1, 4, 'mod/wiki:managewiki', 1, 1337328233, 0),
(706, 1, 3, 'mod/wiki:managewiki', 1, 1337328233, 0),
(707, 1, 1, 'mod/wiki:managewiki', 1, 1337328233, 0),
(708, 1, 6, 'mod/workshop:view', 1, 1337328238, 0),
(709, 1, 5, 'mod/workshop:view', 1, 1337328238, 0),
(710, 1, 4, 'mod/workshop:view', 1, 1337328238, 0),
(711, 1, 3, 'mod/workshop:view', 1, 1337328238, 0),
(712, 1, 1, 'mod/workshop:view', 1, 1337328238, 0),
(713, 1, 4, 'mod/workshop:switchphase', 1, 1337328238, 0),
(714, 1, 3, 'mod/workshop:switchphase', 1, 1337328238, 0),
(715, 1, 1, 'mod/workshop:switchphase', 1, 1337328238, 0),
(716, 1, 3, 'mod/workshop:editdimensions', 1, 1337328238, 0),
(717, 1, 1, 'mod/workshop:editdimensions', 1, 1337328238, 0),
(718, 1, 5, 'mod/workshop:submit', 1, 1337328238, 0),
(719, 1, 5, 'mod/workshop:peerassess', 1, 1337328238, 0),
(720, 1, 4, 'mod/workshop:manageexamples', 1, 1337328238, 0),
(721, 1, 3, 'mod/workshop:manageexamples', 1, 1337328239, 0),
(722, 1, 1, 'mod/workshop:manageexamples', 1, 1337328239, 0),
(723, 1, 4, 'mod/workshop:allocate', 1, 1337328239, 0),
(724, 1, 3, 'mod/workshop:allocate', 1, 1337328239, 0),
(725, 1, 1, 'mod/workshop:allocate', 1, 1337328239, 0),
(726, 1, 4, 'mod/workshop:publishsubmissions', 1, 1337328239, 0),
(727, 1, 3, 'mod/workshop:publishsubmissions', 1, 1337328239, 0),
(728, 1, 1, 'mod/workshop:publishsubmissions', 1, 1337328239, 0),
(729, 1, 5, 'mod/workshop:viewauthornames', 1, 1337328239, 0),
(730, 1, 4, 'mod/workshop:viewauthornames', 1, 1337328239, 0),
(731, 1, 3, 'mod/workshop:viewauthornames', 1, 1337328239, 0),
(732, 1, 1, 'mod/workshop:viewauthornames', 1, 1337328239, 0),
(733, 1, 4, 'mod/workshop:viewreviewernames', 1, 1337328239, 0),
(734, 1, 3, 'mod/workshop:viewreviewernames', 1, 1337328239, 0),
(735, 1, 1, 'mod/workshop:viewreviewernames', 1, 1337328239, 0),
(736, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1337328239, 0),
(737, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1337328239, 0),
(738, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1337328239, 0),
(739, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1337328240, 0),
(740, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1337328240, 0),
(741, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1337328240, 0),
(742, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1337328240, 0),
(743, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1337328240, 0),
(744, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1337328240, 0),
(745, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1337328240, 0),
(746, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1337328240, 0),
(747, 1, 4, 'mod/workshop:viewallassessments', 1, 1337328240, 0),
(748, 1, 3, 'mod/workshop:viewallassessments', 1, 1337328240, 0),
(749, 1, 1, 'mod/workshop:viewallassessments', 1, 1337328240, 0),
(750, 1, 4, 'mod/workshop:overridegrades', 1, 1337328240, 0),
(751, 1, 3, 'mod/workshop:overridegrades', 1, 1337328240, 0),
(752, 1, 1, 'mod/workshop:overridegrades', 1, 1337328240, 0),
(753, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1337328240, 0),
(754, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1337328240, 0),
(755, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1337328240, 0),
(756, 1, 1, 'enrol/authorize:config', 1, 1337328247, 0),
(757, 1, 1, 'enrol/authorize:manage', 1, 1337328248, 0),
(758, 1, 3, 'enrol/authorize:manage', 1, 1337328248, 0),
(759, 1, 1, 'enrol/authorize:unenrol', 1, 1337328248, 0),
(760, 1, 1, 'enrol/authorize:managepayments', 1, 1337328248, 0),
(761, 1, 1, 'enrol/authorize:uploadcsv', 1, 1337328248, 0),
(762, 1, 3, 'enrol/cohort:config', 1, 1337328249, 0),
(763, 1, 1, 'enrol/cohort:config', 1, 1337328249, 0),
(764, 1, 1, 'enrol/guest:config', 1, 1337328251, 0),
(765, 1, 3, 'enrol/guest:config', 1, 1337328252, 0),
(766, 1, 1, 'enrol/ldap:manage', 1, 1337328252, 0),
(767, 1, 1, 'enrol/manual:config', 1, 1337328253, 0),
(768, 1, 1, 'enrol/manual:enrol', 1, 1337328253, 0),
(769, 1, 3, 'enrol/manual:enrol', 1, 1337328253, 0),
(770, 1, 1, 'enrol/manual:manage', 1, 1337328253, 0),
(771, 1, 3, 'enrol/manual:manage', 1, 1337328253, 0),
(772, 1, 1, 'enrol/manual:unenrol', 1, 1337328253, 0),
(773, 1, 3, 'enrol/manual:unenrol', 1, 1337328253, 0),
(774, 1, 1, 'enrol/meta:config', 1, 1337328254, 0),
(775, 1, 3, 'enrol/meta:config', 1, 1337328254, 0),
(776, 1, 1, 'enrol/meta:selectaslinked', 1, 1337328254, 0),
(777, 1, 1, 'enrol/meta:unenrol', 1, 1337328254, 0),
(778, 1, 1, 'enrol/paypal:config', 1, 1337328256, 0),
(779, 1, 1, 'enrol/paypal:manage', 1, 1337328256, 0),
(780, 1, 3, 'enrol/paypal:manage', 1, 1337328256, 0),
(781, 1, 1, 'enrol/paypal:unenrol', 1, 1337328256, 0),
(782, 1, 3, 'enrol/self:config', 1, 1337328256, 0),
(783, 1, 1, 'enrol/self:config', 1, 1337328256, 0),
(784, 1, 3, 'enrol/self:manage', 1, 1337328256, 0),
(785, 1, 1, 'enrol/self:manage', 1, 1337328256, 0),
(786, 1, 5, 'enrol/self:unenrolself', 1, 1337328256, 0),
(787, 1, 3, 'enrol/self:unenrol', 1, 1337328256, 0),
(788, 1, 1, 'enrol/self:unenrol', 1, 1337328256, 0),
(789, 1, 7, 'block/online_users:viewlist', 1, 1337328263, 0),
(790, 1, 6, 'block/online_users:viewlist', 1, 1337328263, 0),
(791, 1, 5, 'block/online_users:viewlist', 1, 1337328263, 0),
(792, 1, 4, 'block/online_users:viewlist', 1, 1337328263, 0),
(793, 1, 3, 'block/online_users:viewlist', 1, 1337328263, 0),
(794, 1, 1, 'block/online_users:viewlist', 1, 1337328263, 0),
(795, 1, 4, 'block/rss_client:manageownfeeds', 1, 1337328265, 0),
(796, 1, 3, 'block/rss_client:manageownfeeds', 1, 1337328265, 0),
(797, 1, 1, 'block/rss_client:manageownfeeds', 1, 1337328265, 0),
(798, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1337328265, 0),
(799, 1, 4, 'report/completion:view', 1, 1337328275, 0),
(800, 1, 3, 'report/completion:view', 1, 1337328275, 0),
(801, 1, 1, 'report/completion:view', 1, 1337328275, 0),
(802, 1, 4, 'report/courseoverview:view', 1, 1337328275, 0),
(803, 1, 3, 'report/courseoverview:view', 1, 1337328275, 0),
(804, 1, 1, 'report/courseoverview:view', 1, 1337328275, 0),
(805, 1, 4, 'report/log:view', 1, 1337328276, 0),
(806, 1, 3, 'report/log:view', 1, 1337328276, 0),
(807, 1, 1, 'report/log:view', 1, 1337328276, 0),
(808, 1, 4, 'report/log:viewtoday', 1, 1337328276, 0),
(809, 1, 3, 'report/log:viewtoday', 1, 1337328276, 0),
(810, 1, 1, 'report/log:viewtoday', 1, 1337328276, 0),
(811, 1, 4, 'report/loglive:view', 1, 1337328276, 0),
(812, 1, 3, 'report/loglive:view', 1, 1337328276, 0),
(813, 1, 1, 'report/loglive:view', 1, 1337328276, 0),
(814, 1, 4, 'report/outline:view', 1, 1337328276, 0),
(815, 1, 3, 'report/outline:view', 1, 1337328276, 0),
(816, 1, 1, 'report/outline:view', 1, 1337328277, 0),
(817, 1, 4, 'report/participation:view', 1, 1337328277, 0),
(818, 1, 3, 'report/participation:view', 1, 1337328277, 0),
(819, 1, 1, 'report/participation:view', 1, 1337328277, 0),
(820, 1, 4, 'report/progress:view', 1, 1337328277, 0),
(821, 1, 3, 'report/progress:view', 1, 1337328277, 0),
(822, 1, 1, 'report/progress:view', 1, 1337328277, 0),
(823, 1, 1, 'report/security:view', 1, 1337328278, 0),
(824, 1, 4, 'report/stats:view', 1, 1337328278, 0),
(825, 1, 3, 'report/stats:view', 1, 1337328279, 0),
(826, 1, 1, 'report/stats:view', 1, 1337328279, 0),
(827, 1, 4, 'gradeexport/ods:view', 1, 1337328279, 0),
(828, 1, 3, 'gradeexport/ods:view', 1, 1337328279, 0),
(829, 1, 1, 'gradeexport/ods:view', 1, 1337328279, 0),
(830, 1, 1, 'gradeexport/ods:publish', 1, 1337328279, 0),
(831, 1, 4, 'gradeexport/txt:view', 1, 1337328279, 0),
(832, 1, 3, 'gradeexport/txt:view', 1, 1337328279, 0),
(833, 1, 1, 'gradeexport/txt:view', 1, 1337328279, 0),
(834, 1, 1, 'gradeexport/txt:publish', 1, 1337328279, 0),
(835, 1, 4, 'gradeexport/xls:view', 1, 1337328280, 0),
(836, 1, 3, 'gradeexport/xls:view', 1, 1337328280, 0),
(837, 1, 1, 'gradeexport/xls:view', 1, 1337328280, 0),
(838, 1, 1, 'gradeexport/xls:publish', 1, 1337328280, 0),
(839, 1, 4, 'gradeexport/xml:view', 1, 1337328280, 0),
(840, 1, 3, 'gradeexport/xml:view', 1, 1337328280, 0),
(841, 1, 1, 'gradeexport/xml:view', 1, 1337328280, 0),
(842, 1, 1, 'gradeexport/xml:publish', 1, 1337328280, 0),
(843, 1, 3, 'gradeimport/csv:view', 1, 1337328281, 0),
(844, 1, 1, 'gradeimport/csv:view', 1, 1337328281, 0),
(845, 1, 3, 'gradeimport/xml:view', 1, 1337328281, 0),
(846, 1, 1, 'gradeimport/xml:view', 1, 1337328281, 0),
(847, 1, 1, 'gradeimport/xml:publish', 1, 1337328281, 0),
(848, 1, 4, 'gradereport/grader:view', 1, 1337328281, 0),
(849, 1, 3, 'gradereport/grader:view', 1, 1337328281, 0),
(850, 1, 1, 'gradereport/grader:view', 1, 1337328281, 0),
(851, 1, 4, 'gradereport/outcomes:view', 1, 1337328282, 0),
(852, 1, 3, 'gradereport/outcomes:view', 1, 1337328282, 0),
(853, 1, 1, 'gradereport/outcomes:view', 1, 1337328282, 0),
(854, 1, 5, 'gradereport/overview:view', 1, 1337328282, 0),
(855, 1, 1, 'gradereport/overview:view', 1, 1337328282, 0),
(856, 1, 5, 'gradereport/user:view', 1, 1337328282, 0),
(857, 1, 4, 'gradereport/user:view', 1, 1337328282, 0),
(858, 1, 3, 'gradereport/user:view', 1, 1337328282, 0),
(859, 1, 1, 'gradereport/user:view', 1, 1337328282, 0),
(860, 1, 7, 'repository/alfresco:view', 1, 1337328286, 0),
(861, 1, 7, 'repository/boxnet:view', 1, 1337328287, 0),
(862, 1, 2, 'repository/coursefiles:view', 1, 1337328287, 0),
(863, 1, 4, 'repository/coursefiles:view', 1, 1337328287, 0),
(864, 1, 3, 'repository/coursefiles:view', 1, 1337328287, 0),
(865, 1, 1, 'repository/coursefiles:view', 1, 1337328287, 0),
(866, 1, 7, 'repository/dropbox:view', 1, 1337328288, 0),
(867, 1, 2, 'repository/filesystem:view', 1, 1337328288, 0),
(868, 1, 4, 'repository/filesystem:view', 1, 1337328288, 0),
(869, 1, 3, 'repository/filesystem:view', 1, 1337328288, 0),
(870, 1, 1, 'repository/filesystem:view', 1, 1337328288, 0),
(871, 1, 7, 'repository/flickr:view', 1, 1337328288, 0),
(872, 1, 7, 'repository/flickr_public:view', 1, 1337328288, 0),
(873, 1, 7, 'repository/googledocs:view', 1, 1337328289, 0),
(874, 1, 2, 'repository/local:view', 1, 1337328289, 0),
(875, 1, 4, 'repository/local:view', 1, 1337328289, 0),
(876, 1, 3, 'repository/local:view', 1, 1337328289, 0),
(877, 1, 1, 'repository/local:view', 1, 1337328289, 0),
(878, 1, 7, 'repository/merlot:view', 1, 1337328290, 0),
(879, 1, 7, 'repository/picasa:view', 1, 1337328290, 0),
(880, 1, 7, 'repository/recent:view', 1, 1337328290, 0),
(881, 1, 7, 'repository/s3:view', 1, 1337328291, 0),
(882, 1, 7, 'repository/upload:view', 1, 1337328291, 0),
(883, 1, 7, 'repository/url:view', 1, 1337328291, 0),
(884, 1, 7, 'repository/user:view', 1, 1337328292, 0),
(885, 1, 2, 'repository/webdav:view', 1, 1337328292, 0),
(886, 1, 4, 'repository/webdav:view', 1, 1337328292, 0),
(887, 1, 3, 'repository/webdav:view', 1, 1337328292, 0),
(888, 1, 1, 'repository/webdav:view', 1, 1337328292, 0),
(889, 1, 7, 'repository/wikimedia:view', 1, 1337328293, 0),
(890, 1, 7, 'repository/youtube:view', 1, 1337328293, 0),
(891, 1, 1, 'tool/customlang:view', 1, 1337328303, 0),
(892, 1, 1, 'tool/customlang:edit', 1, 1337328303, 0),
(893, 1, 4, 'quiz/grading:viewstudentnames', 1, 1337328318, 0),
(894, 1, 3, 'quiz/grading:viewstudentnames', 1, 1337328318, 0),
(895, 1, 1, 'quiz/grading:viewstudentnames', 1, 1337328318, 0),
(896, 1, 4, 'quiz/grading:viewidnumber', 1, 1337328318, 0),
(897, 1, 3, 'quiz/grading:viewidnumber', 1, 1337328318, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(898, 1, 1, 'quiz/grading:viewidnumber', 1, 1337328318, 0),
(899, 1, 4, 'quiz/statistics:view', 1, 1337328320, 0),
(900, 1, 3, 'quiz/statistics:view', 1, 1337328320, 0),
(901, 1, 1, 'quiz/statistics:view', 1, 1337328320, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL,
  `contextlevel` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `roleid` bigint(10) unsigned NOT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mdl_scale`
--

INSERT INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
(1, 0, 0, 'Separate and Connected ways of knowing', 'Mostly separate knowing,Separate and connected,Mostly connected knowing', 'The scale based on the theory of separate and connected knowing. This theory describes two different ways that we can evaluate and learn about the things we see and hear.<ul><li><strong>Separate knowers</strong> remain as objective as possible without including feelings and emotions. In a discussion with other people, they like to defend their own ideas, using logic to find holes in opponent''s ideas.</li><li><strong>Connected knowers</strong> are more sensitive to other people. They are skilled at empathy and tends to listen and ask questions until they feel they can connect and "understand things from their point of view". They learn by trying to share the experiences that led to the knowledge they find in other people.</li></ul>', 0, 1337758373);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `launch` bigint(10) unsigned NOT NULL DEFAULT '0',
  `skipview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `hidenav` tinyint(1) NOT NULL DEFAULT '0',
  `auto` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `popup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) unsigned NOT NULL DEFAULT '100',
  `height` bigint(10) unsigned NOT NULL DEFAULT '600',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scormid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) unsigned DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) unsigned DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) unsigned NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` text COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attempt` bigint(10) unsigned NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) unsigned NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) unsigned NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) unsigned NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(8, 0, 'ml1p9hu41p0tc8ngm63tgg92k4', 0, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjE6ImNhbGVuZGFyc2hvd2V2ZW50dHlwZSI7aToxNTt9VVNFUnxPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtpOjA7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjc6InNlc3NrZXkiO3M6MTA6InE2TXE1bGRISjciO3M6MTA6InByZWZlcmVuY2UiO2E6MDp7fXM6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6Njp7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzEiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzMiO3M6MzoiaW50IjtzOjEyOiJibG9jazRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2szaGlkZGVuIjtzOjQ6ImJvb2wiO31zOjY6ImFjY2VzcyI7YTo3OntzOjI6InJhIjthOjE6e3M6MjoiLzEiO2E6MTp7aTo2O2k6Njt9fXM6NDoicmRlZiI7YToxOntzOjQ6Ii8xOjYiO2E6MjI6e3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7aToxO3M6MTk6Im1vZC9hc3NpZ25tZW50OnZpZXciO2k6MTtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO2k6MTtzOjE3OiJtb2QvZmVlZGJhY2s6dmlldyI7aToxO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7aToxO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7aToxO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtpOjE7czoxMjoibW9kL2x0aTp2aWV3IjtpOjE7czoxMzoibW9kL3BhZ2U6dmlldyI7aToxO3M6MTM6Im1vZC9xdWl6OnZpZXciO2k6MTtzOjE3OiJtb2QvcmVzb3VyY2U6dmlldyI7aToxO3M6MTI6Im1vZC91cmw6dmlldyI7aToxO3M6MTc6Im1vZC93aWtpOnZpZXdwYWdlIjtpOjE7czoxNzoibW9kL3dvcmtzaG9wOnZpZXciO2k6MTtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO2k6LTEwMDA7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtpOi0xMDAwO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtpOi0xMDAwO3M6MjM6Im1vb2RsZS91c2VyOnZpZXdkZXRhaWxzIjtpOjE7fX1zOjEwOiJyZGVmX2NvdW50IjtpOjE7czo4OiJyZGVmX2xjYyI7aToxO3M6NjoibG9hZGVkIjthOjE6e2k6MTtpOjE7fXM6NDoidGltZSI7aToxMzM3NTg5Mzg4O3M6MzoicnN3IjthOjA6e319czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjA6e31zOjk6InRlbXBndWVzdCI7YTowOnt9fX0=', 1337589387, 1337589486, '127.0.0.1', '127.0.0.1'),
(14, 0, 'jqtu8mtut7gqlrsvt2pb7vdh33', 3, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo0OntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YToyOntzOjE2OiJ1c2VyYmxvZ29wdGlvbnMzIjthOjM6e2k6MDtpOjEzMzc1OTM0MTA7aToxO3M6MToiMyI7aToyO3M6NzA5OiJhOjI6e3M6NDoidmlldyI7YToyOntzOjY6InN0cmluZyI7czoyMjoiVmlldyBhbGwgb2YgbXkgZW50cmllcyI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6MTQ6Ind3dy5tb3Rlc3QuY29tIjtzOjc6IgAqAHBvcnQiO2k6ODA4MDtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MjI6Ii9tb29kbGUvYmxvZy9pbmRleC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6InVzZXJpZCI7czoxOiIzIjt9fX1zOjM6ImFkZCI7YToyOntzOjY6InN0cmluZyI7czoxNToiQWRkIGEgbmV3IGVudHJ5IjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czoxNDoid3d3Lm1vdGVzdC5jb20iO3M6NzoiACoAcG9ydCI7aTo4MDgwO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoyMToiL21vb2RsZS9ibG9nL2VkaXQucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJhY3Rpb24iO3M6MzoiYWRkIjt9fX19Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zMTkiO2E6Mzp7aTowO2k6MTMzNzU5MzQxMDtpOjE7czoxOiIzIjtpOjI7czo0OiJiOjA7Ijt9fX1zOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MDtzOjEyOiJqdXN0bG9nZ2VkaW4iO2I6MTt9VVNFUnxPOjg6InN0ZENsYXNzIjo1Nzp7czoyOiJpZCI7czoxOiIzIjtzOjQ6ImF1dGgiO3M6MTI6Imdvb2dsZW9hdXRoMiI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6MTM6InNvY2lhbF91c2VyXzEiO3M6ODoicGFzc3dvcmQiO3M6MTA6Im5vdCBjYWNoZWQiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo3OiJKaW5nbHVlIjtzOjg6Imxhc3RuYW1lIjtzOjI6IkxpIjtzOjU6ImVtYWlsIjtzOjE4OiJsaWppbmdsdWVAbGl2ZS5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6NDoibGFuZyI7czoyOiJlbiI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzM3NTkzNDA5IjtzOjEwOiJsYXN0YWNjZXNzIjtzOjEwOiIxMzM3NTkzNDEwIjtzOjk6Imxhc3Rsb2dpbiI7czoxMDoiMTMzNzU5MzQxMCI7czoxMjoiY3VycmVudGxvZ2luIjtpOjEzMzc1OTM0MzE7czo2OiJsYXN0aXAiO3M6OToiMTI3LjAuMC4xIjtzOjY6InNlY3JldCI7czowOiIiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjEwOiIxMzM3NTkzNDA5IjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MTA6IjEzMzc1OTM0MDkiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjtzOjY6Imd1aWRlZCI7czoxOiIwIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjA6e31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjA6e31zOjExOiJncm91cG1lbWJlciI7YTowOnt9czo3OiJwcm9maWxlIjthOjA6e31zOjc6InNlc3NrZXkiO3M6MTA6IlJwNEV1a2RXTGIiO3M6MTA6InByZWZlcmVuY2UiO2E6MTp7czoxMToiX2xhc3Rsb2FkZWQiO2k6MTMzNzU5MzQzMTt9fQ==', 1337593431, 1337593431, '127.0.0.1', '127.0.0.1'),
(15, 0, '7ff4ilig65mta80n9a23nubda0', 3, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjoxOntzOjEyOiJqdXN0bG9nZ2VkaW4iO2I6MTt9VVNFUnxPOjg6InN0ZENsYXNzIjo1Nzp7czoyOiJpZCI7czoxOiIzIjtzOjQ6ImF1dGgiO3M6MTI6Imdvb2dsZW9hdXRoMiI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6MTM6InNvY2lhbF91c2VyXzEiO3M6ODoicGFzc3dvcmQiO3M6MTA6Im5vdCBjYWNoZWQiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo3OiJKaW5nbHVlIjtzOjg6Imxhc3RuYW1lIjtzOjI6IkxpIjtzOjU6ImVtYWlsIjtzOjE4OiJsaWppbmdsdWVAbGl2ZS5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6NDoibGFuZyI7czoyOiJlbiI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzM3NTkzNDA5IjtzOjEwOiJsYXN0YWNjZXNzIjtzOjEwOiIxMzM3NTkzNDMxIjtzOjk6Imxhc3Rsb2dpbiI7czoxMDoiMTMzNzU5MzQzMSI7czoxMjoiY3VycmVudGxvZ2luIjtpOjEzMzc1OTM0MzQ7czo2OiJsYXN0aXAiO3M6OToiMTI3LjAuMC4xIjtzOjY6InNlY3JldCI7czowOiIiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjEwOiIxMzM3NTkzNDA5IjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MTA6IjEzMzc1OTM0MDkiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjtzOjY6Imd1aWRlZCI7czoxOiIwIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjA6e31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjA6e31zOjExOiJncm91cG1lbWJlciI7YTowOnt9czo3OiJwcm9maWxlIjthOjA6e31zOjc6InNlc3NrZXkiO3M6MTA6InBMOXVCOHlhdFAiO3M6MTA6InByZWZlcmVuY2UiO2E6MTp7czoxMToiX2xhc3Rsb2FkZWQiO2k6MTMzNzU5MzQzNDt9fQ==', 1337593435, 1337593435, '127.0.0.1', '127.0.0.1'),
(22, 0, 'u68458jedii0i86bo9j52vl9p2', 3, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjozOntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YToyOntzOjE2OiJ1c2VyYmxvZ29wdGlvbnMzIjthOjM6e2k6MDtpOjEzMzc1OTU3NTk7aToxO3M6MToiMyI7aToyO3M6NzA5OiJhOjI6e3M6NDoidmlldyI7YToyOntzOjY6InN0cmluZyI7czoyMjoiVmlldyBhbGwgb2YgbXkgZW50cmllcyI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6MTQ6Ind3dy5tb3Rlc3QuY29tIjtzOjc6IgAqAHBvcnQiO2k6ODA4MDtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MjI6Ii9tb29kbGUvYmxvZy9pbmRleC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6InVzZXJpZCI7czoxOiIzIjt9fX1zOjM6ImFkZCI7YToyOntzOjY6InN0cmluZyI7czoxNToiQWRkIGEgbmV3IGVudHJ5IjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czoxNDoid3d3Lm1vdGVzdC5jb20iO3M6NzoiACoAcG9ydCI7aTo4MDgwO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoyMToiL21vb2RsZS9ibG9nL2VkaXQucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJhY3Rpb24iO3M6MzoiYWRkIjt9fX19Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zMTkiO2E6Mzp7aTowO2k6MTMzNzU5NTc1OTtpOjE7czoxOiIzIjtpOjI7czo0OiJiOjA7Ijt9fX1zOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MDt9VVNFUnxPOjg6InN0ZENsYXNzIjo2Mzp7czoyOiJpZCI7czoxOiIzIjtzOjQ6ImF1dGgiO3M6MTI6Imdvb2dsZW9hdXRoMiI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6MTM6InNvY2lhbF91c2VyXzEiO3M6ODoicGFzc3dvcmQiO3M6MTA6Im5vdCBjYWNoZWQiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo3OiJKaW5nbHVlIjtzOjg6Imxhc3RuYW1lIjtzOjI6IkxpIjtzOjU6ImVtYWlsIjtzOjE4OiJsaWppbmdsdWVAbGl2ZS5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6NDoibGFuZyI7czoyOiJlbiI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzM3NTkzNDA5IjtzOjEwOiJsYXN0YWNjZXNzIjtpOjEzMzc1OTU3NTk7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzMzc1OTM3MDQiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzM3NTkzODE2O3M6NjoibGFzdGlwIjtzOjk6IjEyNy4wLjAuMSI7czo2OiJzZWNyZXQiO3M6MDoiIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTMzNzU5MzQwOSI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxMzM3NTkzNDA5IjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7TjtzOjEyOiJzY3JlZW5yZWFkZXIiO3M6MToiMCI7czo2OiJndWlkZWQiO3M6MToiMSI7czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YTowOnt9czoxOToiY3VycmVudGNvdXJzZWFjY2VzcyI7YTowOnt9czoxMToiZ3JvdXBtZW1iZXIiO2E6MDp7fXM6NzoicHJvZmlsZSI7YTowOnt9czo3OiJzZXNza2V5IjtzOjEwOiI3VDB5alFYZWxrIjtzOjEwOiJwcmVmZXJlbmNlIjthOjE6e3M6MTE6Il9sYXN0bG9hZGVkIjtpOjEzMzc1OTU3NTk7fXM6NjoiYWNjZXNzIjthOjc6e3M6MjoicmEiO2E6Mjp7czoyOiIvMSI7YToxOntpOjc7aTo3O31zOjQ6Ii8xLzIiO2E6MTp7aTo4O2k6ODt9fXM6NDoicmRlZiI7YToyOntzOjQ6Ii8xOjciO2E6NDc6e3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7aToxO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7aToxO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtpOjE7czoxMzoibW9kL3BhZ2U6dmlldyI7aToxO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtpOjE7czoxMjoibW9kL3VybDp2aWV3IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVjb3Vyc2UiO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpjcmVhdGUiO2k6MTtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjMyOiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlb3duZW50cmllcyI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnBvc3QiO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7czoyMToibW9vZGxlL2NvdXJzZTpyZXF1ZXN0IjtpOjE7czoyMjoibW9vZGxlL215Om1hbmFnZWJsb2NrcyI7aToxO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtpOjE7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtpOjE7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YWxsIjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtpOjE7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO2k6MTtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7aToxO3M6MTU6Im1vb2RsZS90YWc6ZWRpdCI7aToxO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtpOjE7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtpOjE7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO2k6MTtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO2k6MTtzOjI2OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25maWxlcyI7aToxO3M6MzU6Im1vb2RsZS93ZWJzZXJ2aWNlOmNyZWF0ZW1vYmlsZXRva2VuIjtpOjE7czoyNDoicmVwb3NpdG9yeS9hbGZyZXNjbzp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9ib3huZXQ6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtpOjE7czoyOToicmVwb3NpdG9yeS9mbGlja3JfcHVibGljOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L2ZsaWNrcjp2aWV3IjtpOjE7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L21lcmxvdDp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvcmVjZW50OnZpZXciO2k6MTtzOjE4OiJyZXBvc2l0b3J5L3MzOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtpOjE7czoxOToicmVwb3NpdG9yeS91cmw6dmlldyI7aToxO3M6MjA6InJlcG9zaXRvcnkvdXNlcjp2aWV3IjtpOjE7czoyNToicmVwb3NpdG9yeS93aWtpbWVkaWE6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtpOjE7fXM6NDoiLzE6OCI7YTozOntzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO2k6MTtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7fX1zOjEwOiJyZGVmX2NvdW50IjtpOjI7czo4OiJyZGVmX2xjYyI7aToyO3M6NjoibG9hZGVkIjthOjE6e2k6MTtpOjE7fXM6NDoidGltZSI7aToxMzM3NTkzODE2O3M6MzoicnN3IjthOjA6e319czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjA6e31zOjk6InRlbXBndWVzdCI7YTowOnt9fXM6MTc6Im1lc3NhZ2VfbGFzdHBvcHVwIjtpOjA7czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YTo3OntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMyI7czozOiJpbnQiO3M6MTI6ImJsb2NrNGhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazVoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2szaGlkZGVuIjtzOjQ6ImJvb2wiO31zOjc6ImRpc3BsYXkiO2E6MTp7aToxO2k6MDt9czo3OiJlZGl0aW5nIjtpOjA7fQ==', 1337593816, 1337595759, '127.0.0.1', '127.0.0.1'),
(27, 0, 'rrk798jqfguhe9l3f57scuqh32', 3, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo0OntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czoxMDoibG9naW5jb3VudCI7aTowO3M6ODoibmF2Y2FjaGUiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6Im5hdmlnYXRpb24iO2E6Mjp7czoxNjoidXNlcmJsb2dvcHRpb25zMyI7YTozOntpOjA7aToxMzM3NTk1MjQwO2k6MTtzOjE6IjMiO2k6MjtzOjcwOToiYToyOntzOjQ6InZpZXciO2E6Mjp7czo2OiJzdHJpbmciO3M6MjI6IlZpZXcgYWxsIG9mIG15IGVudHJpZXMiO3M6NDoibGluayI7TzoxMDoibW9vZGxlX3VybCI6OTp7czo5OiIAKgBzY2hlbWUiO3M6NDoiaHR0cCI7czo3OiIAKgBob3N0IjtzOjE0OiJ3d3cubW90ZXN0LmNvbSI7czo3OiIAKgBwb3J0IjtpOjgwODA7czo3OiIAKgB1c2VyIjtzOjA6IiI7czo3OiIAKgBwYXNzIjtzOjA6IiI7czo3OiIAKgBwYXRoIjtzOjIyOiIvbW9vZGxlL2Jsb2cvaW5kZXgucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJ1c2VyaWQiO3M6MToiMyI7fX19czozOiJhZGQiO2E6Mjp7czo2OiJzdHJpbmciO3M6MTU6IkFkZCBhIG5ldyBlbnRyeSI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6MTQ6Ind3dy5tb3Rlc3QuY29tIjtzOjc6IgAqAHBvcnQiO2k6ODA4MDtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MjE6Ii9tb29kbGUvYmxvZy9lZGl0LnBocCI7czoxNjoiACoAc2xhc2hhcmd1bWVudCI7czowOiIiO3M6OToiACoAYW5jaG9yIjtOO3M6OToiACoAcGFyYW1zIjthOjE6e3M6NjoiYWN0aW9uIjtzOjM6ImFkZCI7fX19fSI7fXM6MTc6ImNvbnRleHRoYXNyZXBvczE5IjthOjM6e2k6MDtpOjEzMzc1OTUyNDA7aToxO3M6MToiMyI7aToyO3M6NDoiYjowOyI7fX19czoyMToibG9hZF9uYXZpZ2F0aW9uX2FkbWluIjtiOjA7fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6NjI6e3M6MjoiaWQiO3M6MToiMyI7czo0OiJhdXRoIjtzOjEyOiJnb29nbGVvYXV0aDIiO3M6OToiY29uZmlybWVkIjtzOjE6IjEiO3M6MTI6InBvbGljeWFncmVlZCI7czoxOiIwIjtzOjc6ImRlbGV0ZWQiO3M6MToiMCI7czo5OiJzdXNwZW5kZWQiO3M6MToiMCI7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjg6InVzZXJuYW1lIjtzOjEzOiJzb2NpYWxfdXNlcl8xIjtzOjg6InBhc3N3b3JkIjtzOjEwOiJub3QgY2FjaGVkIjtzOjg6ImlkbnVtYmVyIjtzOjA6IiI7czo5OiJmaXJzdG5hbWUiO3M6NzoiSmluZ2x1ZSI7czo4OiJsYXN0bmFtZSI7czoyOiJMaSI7czo1OiJlbWFpbCI7czoxODoibGlqaW5nbHVlQGxpdmUuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6MDoiIjtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMzNzU5MzQwOSI7czoxMDoibGFzdGFjY2VzcyI7aToxMzM3NTk1MjQwO3M6OToibGFzdGxvZ2luIjtzOjEwOiIxMzM3NTk0OTg4IjtzOjEyOiJjdXJyZW50bG9naW4iO2k6MTMzNzU5NTI0MDtzOjY6Imxhc3RpcCI7czo5OiIxMjcuMC4wLjEiO3M6Njoic2VjcmV0IjtzOjA6IiI7czo3OiJwaWN0dXJlIjtzOjE6IjAiO3M6MzoidXJsIjtzOjA6IiI7czoxNzoiZGVzY3JpcHRpb25mb3JtYXQiO3M6MToiMCI7czoxMDoibWFpbGZvcm1hdCI7czoxOiIxIjtzOjEwOiJtYWlsZGlnZXN0IjtzOjE6IjAiO3M6MTE6Im1haWxkaXNwbGF5IjtzOjE6IjIiO3M6MTA6Imh0bWxlZGl0b3IiO3M6MToiMSI7czo0OiJhamF4IjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MTA6IjEzMzc1OTM0MDkiO3M6MTI6InRpbWVtb2RpZmllZCI7czoxMDoiMTMzNzU5MzQwOSI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxMjoic2NyZWVucmVhZGVyIjtzOjE6IjAiO3M6NjoiZ3VpZGVkIjtzOjE6IjEiO3M6MTY6Imxhc3Rjb3Vyc2VhY2Nlc3MiO2E6MDp7fXM6MTk6ImN1cnJlbnRjb3Vyc2VhY2Nlc3MiO2E6MDp7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6MDp7fXM6Nzoic2Vzc2tleSI7czoxMDoiTXQ4aGs1U0RkVCI7czoxMDoicHJlZmVyZW5jZSI7YToxOntzOjExOiJfbGFzdGxvYWRlZCI7aToxMzM3NTk1MjQwO31zOjY6ImFjY2VzcyI7YTo3OntzOjI6InJhIjthOjI6e3M6MjoiLzEiO2E6MTp7aTo3O2k6Nzt9czo0OiIvMS8yIjthOjE6e2k6ODtpOjg7fX1zOjQ6InJkZWYiO2E6Mjp7czo0OiIvMTo3IjthOjQ3OntzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO2k6MTtzOjE1OiJtb2QvZm9sZGVyOnZpZXciO2k6MTtzOjE0OiJtb2QvaW1zY3A6dmlldyI7aToxO3M6MTM6Im1vZC9wYWdlOnZpZXciO2k6MTtzOjE3OiJtb2QvcmVzb3VyY2U6dmlldyI7aToxO3M6MTI6Im1vZC91cmw6dmlldyI7aToxO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtpOjE7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtpOjE7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlbW9kdWxlIjtpOjE7czoxODoibW9vZGxlL2Jsb2c6Y3JlYXRlIjtpOjE7czoyNjoibW9vZGxlL2Jsb2c6bWFuYWdlZXh0ZXJuYWwiO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO2k6MTtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtpOjE7czozMjoibW9vZGxlL2NhbGVuZGFyOm1hbmFnZW93bmVudHJpZXMiO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO3M6MjE6Im1vb2RsZS9jb3Vyc2U6cmVxdWVzdCI7aToxO3M6MjI6Im1vb2RsZS9teTptYW5hZ2VibG9ja3MiO2k6MTtzOjIzOiJtb29kbGUvcG9ydGZvbGlvOmV4cG9ydCI7aToxO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7aToxO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7aToxO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7aToxO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FueSI7aToxO3M6MjM6Im1vb2RsZS9zaXRlOnNlbmRtZXNzYWdlIjtpOjE7czoxNzoibW9vZGxlL3RhZzpjcmVhdGUiO2k6MTtzOjE1OiJtb29kbGUvdGFnOmVkaXQiO2k6MTtzOjI5OiJtb29kbGUvdXNlcjpjaGFuZ2Vvd25wYXNzd29yZCI7aToxO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7aToxO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtpOjE7czoyNzoibW9vZGxlL3VzZXI6bWFuYWdlb3duYmxvY2tzIjtpOjE7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlb3duZmlsZXMiO2k6MTtzOjM1OiJtb29kbGUvd2Vic2VydmljZTpjcmVhdGVtb2JpbGV0b2tlbiI7aToxO3M6MjQ6InJlcG9zaXRvcnkvYWxmcmVzY286dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvYm94bmV0OnZpZXciO2k6MTtzOjIzOiJyZXBvc2l0b3J5L2Ryb3Bib3g6dmlldyI7aToxO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9mbGlja3I6dmlldyI7aToxO3M6MjY6InJlcG9zaXRvcnkvZ29vZ2xlZG9jczp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9tZXJsb3Q6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvcGljYXNhOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3JlY2VudDp2aWV3IjtpOjE7czoxODoicmVwb3NpdG9yeS9zMzp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS91cGxvYWQ6dmlldyI7aToxO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO2k6MTtzOjIwOiJyZXBvc2l0b3J5L3VzZXI6dmlldyI7aToxO3M6MjU6InJlcG9zaXRvcnkvd2lraW1lZGlhOnZpZXciO2k6MTtzOjIzOiJyZXBvc2l0b3J5L3lvdXR1YmU6dmlldyI7aToxO31zOjQ6Ii8xOjgiO2E6Mzp7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtpOjE7czoyNDoibW9kL2ZvcnVtOnZpZXdkaXNjdXNzaW9uIjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO319czoxMDoicmRlZl9jb3VudCI7aToyO3M6ODoicmRlZl9sY2MiO2k6MjtzOjY6ImxvYWRlZCI7YToxOntpOjE7aToxO31zOjQ6InRpbWUiO2k6MTMzNzU5NTI0MDtzOjM6InJzdyI7YTowOnt9fXM6NToiZW5yb2wiO2E6Mjp7czo4OiJlbnJvbGxlZCI7YTowOnt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX1zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6Nzp7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzEiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzMiO3M6MzoiaW50IjtzOjEyOiJibG9jazRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2s1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrM2hpZGRlbiI7czo0OiJib29sIjt9czo3OiJkaXNwbGF5IjthOjE6e2k6MTtpOjA7fX0=', 1337595240, 1337595240, '127.0.0.1', '127.0.0.1'),
(29, 0, 'ac6cj5kvupbksquml9at7hmg80', 1, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjozOntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czoxMDoibG9naW5jb3VudCI7aTowO3M6NDoibGFuZyI7czoyOiJlbiI7fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6NTk6e3M6MjoiaWQiO3M6MToiMSI7czo0OiJhdXRoIjtzOjY6Im1hbnVhbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6NToiZ3Vlc3QiO3M6ODoicGFzc3dvcmQiO3M6MzI6IjBmYzc3MDZlYmJlMDhiMWI0OWVmYTBhMjFiYjU3NjMxIjtzOjg6ImlkbnVtYmVyIjtzOjA6IiI7czo5OiJmaXJzdG5hbWUiO3M6MTA6Ikd1ZXN0IHVzZXIiO3M6ODoibGFzdG5hbWUiO3M6MToiICI7czo1OiJlbWFpbCI7czoxNDoicm9vdEBsb2NhbGhvc3QiO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTMzNzMyODEzNiI7czoxMDoibGFzdGFjY2VzcyI7aToxMzM3NjY4MTIzO3M6OToibGFzdGxvZ2luIjtzOjEwOiIxMzM3NTk1MDg4IjtzOjEyOiJjdXJyZW50bG9naW4iO2k6MTMzNzY2ODEyMjtzOjY6Imxhc3RpcCI7czo5OiIxMjcuMC4wLjEiO3M6Njoic2VjcmV0IjtzOjA6IiI7czo3OiJwaWN0dXJlIjtzOjE6IjAiO3M6MzoidXJsIjtzOjA6IiI7czoxNzoiZGVzY3JpcHRpb25mb3JtYXQiO3M6MToiMCI7czoxMDoibWFpbGZvcm1hdCI7czoxOiIxIjtzOjEwOiJtYWlsZGlnZXN0IjtzOjE6IjAiO3M6MTE6Im1haWxkaXNwbGF5IjtzOjE6IjIiO3M6MTA6Imh0bWxlZGl0b3IiO3M6MToiMSI7czo0OiJhamF4IjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MToiMCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxMzM3MzI4MTM2IjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7TjtzOjEyOiJzY3JlZW5yZWFkZXIiO3M6MToiMCI7czo2OiJndWlkZWQiO3M6MToiMSI7czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YTowOnt9czoxOToiY3VycmVudGNvdXJzZWFjY2VzcyI7YTowOnt9czoxMToiZ3JvdXBtZW1iZXIiO2E6MDp7fXM6NzoicHJvZmlsZSI7YTowOnt9czo3OiJzZXNza2V5IjtzOjEwOiJWRk00em9VRnR4IjtzOjEwOiJwcmVmZXJlbmNlIjthOjA6e31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjY6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xIjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrM2hpZGRlbiI7czo0OiJib29sIjt9czo2OiJhY2Nlc3MiO2E6Nzp7czoyOiJyYSI7YToxOntzOjI6Ii8xIjthOjE6e2k6NjtpOjY7fX1zOjQ6InJkZWYiO2E6MTp7czo0OiIvMTo2IjthOjIyOntzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO2k6MTtzOjE5OiJtb2QvYXNzaWdubWVudDp2aWV3IjtpOjE7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtpOjE7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO2k6MTtzOjE1OiJtb2QvZm9sZGVyOnZpZXciO2k6MTtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO2k6MTtzOjE0OiJtb2QvaW1zY3A6dmlldyI7aToxO3M6MTI6Im1vZC9sdGk6dmlldyI7aToxO3M6MTM6Im1vZC9wYWdlOnZpZXciO2k6MTtzOjEzOiJtb2QvcXVpejp2aWV3IjtpOjE7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO2k6MTtzOjEyOiJtb2QvdXJsOnZpZXciO2k6MTtzOjE3OiJtb2Qvd2lraTp2aWV3cGFnZSI7aToxO3M6MTc6Im1vZC93b3Jrc2hvcDp2aWV3IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO2k6MTtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtpOi0xMDAwO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7aTotMTAwMDtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7aTotMTAwMDtzOjIzOiJtb29kbGUvdXNlcjp2aWV3ZGV0YWlscyI7aToxO319czoxMDoicmRlZl9jb3VudCI7aToxO3M6ODoicmRlZl9sY2MiO2k6MTtzOjY6ImxvYWRlZCI7YToxOntpOjE7aToxO31zOjQ6InRpbWUiO2k6MTMzNzY2ODEyMztzOjM6InJzdyI7YTowOnt9fXM6NToiZW5yb2wiO2E6Mjp7czo4OiJlbnJvbGxlZCI7YTowOnt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX19', 1337668122, 1337668123, '127.0.0.1', '127.0.0.1'),
(30, 0, 'o6ksmt9e7ehplv35ie0vcq3si2', 0, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjE6ImNhbGVuZGFyc2hvd2V2ZW50dHlwZSI7aToxNTt9VVNFUnxPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtpOjA7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjc6InNlc3NrZXkiO3M6MTA6IlF6aGQyejBWUjkiO3M6MTA6InByZWZlcmVuY2UiO2E6MDp7fXM6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6Njp7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzEiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzMiO3M6MzoiaW50IjtzOjEyOiJibG9jazRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2szaGlkZGVuIjtzOjQ6ImJvb2wiO31zOjY6ImFjY2VzcyI7YTo3OntzOjI6InJhIjthOjE6e3M6MjoiLzEiO2E6MTp7aTo2O2k6Njt9fXM6NDoicmRlZiI7YToxOntzOjQ6Ii8xOjYiO2E6MjI6e3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7aToxO3M6MTk6Im1vZC9hc3NpZ25tZW50OnZpZXciO2k6MTtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO2k6MTtzOjE3OiJtb2QvZmVlZGJhY2s6dmlldyI7aToxO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7aToxO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7aToxO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtpOjE7czoxMjoibW9kL2x0aTp2aWV3IjtpOjE7czoxMzoibW9kL3BhZ2U6dmlldyI7aToxO3M6MTM6Im1vZC9xdWl6OnZpZXciO2k6MTtzOjE3OiJtb2QvcmVzb3VyY2U6dmlldyI7aToxO3M6MTI6Im1vZC91cmw6dmlldyI7aToxO3M6MTc6Im1vZC93aWtpOnZpZXdwYWdlIjtpOjE7czoxNzoibW9kL3dvcmtzaG9wOnZpZXciO2k6MTtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO2k6LTEwMDA7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtpOi0xMDAwO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtpOi0xMDAwO3M6MjM6Im1vb2RsZS91c2VyOnZpZXdkZXRhaWxzIjtpOjE7fX1zOjEwOiJyZGVmX2NvdW50IjtpOjE7czo4OiJyZGVmX2xjYyI7aToxO3M6NjoibG9hZGVkIjthOjE6e2k6MTtpOjE7fXM6NDoidGltZSI7aToxMzM3Njc0OTQ5O3M6MzoicnN3IjthOjA6e319czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjA6e31zOjk6InRlbXBndWVzdCI7YTowOnt9fX0=', 1337674948, 1337674949, '127.0.0.1', '127.0.0.1'),
(31, 0, '3lnivuf83ncm50of3tc3id8nl0', 0, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjoyOntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czo4OiJ3YW50c3VybCI7czozNDoiaHR0cDovL3d3dy5tb3Rlc3QuY29tOjgwODAvc2dlaXZ3LyI7fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6Nzp7czoyOiJpZCI7aTowO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo3OiJzZXNza2V5IjtzOjEwOiJzMFlzS1gyQWNIIjtzOjEwOiJwcmVmZXJlbmNlIjthOjA6e31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjY6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xIjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrM2hpZGRlbiI7czo0OiJib29sIjt9czo2OiJhY2Nlc3MiO2E6Nzp7czoyOiJyYSI7YToxOntzOjI6Ii8xIjthOjE6e2k6NjtpOjY7fX1zOjQ6InJkZWYiO2E6MTp7czo0OiIvMTo2IjthOjIyOntzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO2k6MTtzOjE5OiJtb2QvYXNzaWdubWVudDp2aWV3IjtpOjE7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtpOjE7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO2k6MTtzOjE1OiJtb2QvZm9sZGVyOnZpZXciO2k6MTtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO2k6MTtzOjE0OiJtb2QvaW1zY3A6dmlldyI7aToxO3M6MTI6Im1vZC9sdGk6dmlldyI7aToxO3M6MTM6Im1vZC9wYWdlOnZpZXciO2k6MTtzOjEzOiJtb2QvcXVpejp2aWV3IjtpOjE7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO2k6MTtzOjEyOiJtb2QvdXJsOnZpZXciO2k6MTtzOjE3OiJtb2Qvd2lraTp2aWV3cGFnZSI7aToxO3M6MTc6Im1vZC93b3Jrc2hvcDp2aWV3IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO2k6MTtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtpOi0xMDAwO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7aTotMTAwMDtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7aTotMTAwMDtzOjIzOiJtb29kbGUvdXNlcjp2aWV3ZGV0YWlscyI7aToxO319czoxMDoicmRlZl9jb3VudCI7aToxO3M6ODoicmRlZl9sY2MiO2k6MTtzOjY6ImxvYWRlZCI7YToxOntpOjE7aToxO31zOjQ6InRpbWUiO2k6MTMzNzc1NzMzNTtzOjM6InJzdyI7YTowOnt9fXM6NToiZW5yb2wiO2E6Mjp7czo4OiJlbnJvbGxlZCI7YTowOnt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX19', 1337757334, 1337759297, '127.0.0.1', '127.0.0.1'),
(32, 0, 'ar81g9hmcfb9vgt2gfirktl1b4', 0, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImxhbmciO3M6MjoiZW4iO31VU0VSfE86ODoic3RkQ2xhc3MiOjM6e3M6MjoiaWQiO2k6MDtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6Nzoic2Vzc2tleSI7czoxMDoiU1BKcjVudGRHYiI7fQ==', 1337757402, 1337757402, '127.0.0.1', '127.0.0.1');
INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(34, 0, 'faqhvcnpfc182n4hkdr0dc1547', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo5OntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czoxMDoibG9naW5jb3VudCI7aTowO3M6MjI6ImFkbWluX2NyaXRpY2FsX3dhcm5pbmciO2k6MDtzOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MTtzOjE0OiJmcm9tZGlzY3Vzc2lvbiI7czo1NDoiaHR0cDovL3d3dy5tb3Rlc3QuY29tOjgwODAvc2dlaXZ3L2NvdXJzZS92aWV3LnBocD9pZD0zIjtzOjg6Im5hdmNhY2hlIjtPOjg6InN0ZENsYXNzIjoxOntzOjEwOiJuYXZpZ2F0aW9uIjthOjU6e3M6MTY6InVzZXJibG9nb3B0aW9uczIiO2E6Mzp7aTowO2k6MTMzNzc2MzcxODtpOjE7czoxOiIyIjtpOjI7czo3MDk6ImE6Mjp7czo0OiJ2aWV3IjthOjI6e3M6Njoic3RyaW5nIjtzOjIyOiJWaWV3IGFsbCBvZiBteSBlbnRyaWVzIjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czoxNDoid3d3Lm1vdGVzdC5jb20iO3M6NzoiACoAcG9ydCI7aTo4MDgwO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoyMjoiL3NnZWl2dy9ibG9nL2luZGV4LnBocCI7czoxNjoiACoAc2xhc2hhcmd1bWVudCI7czowOiIiO3M6OToiACoAYW5jaG9yIjtOO3M6OToiACoAcGFyYW1zIjthOjE6e3M6NjoidXNlcmlkIjtzOjE6IjIiO319fXM6MzoiYWRkIjthOjI6e3M6Njoic3RyaW5nIjtzOjE1OiJBZGQgYSBuZXcgZW50cnkiO3M6NDoibGluayI7TzoxMDoibW9vZGxlX3VybCI6OTp7czo5OiIAKgBzY2hlbWUiO3M6NDoiaHR0cCI7czo3OiIAKgBob3N0IjtzOjE0OiJ3d3cubW90ZXN0LmNvbSI7czo3OiIAKgBwb3J0IjtpOjgwODA7czo3OiIAKgB1c2VyIjtzOjA6IiI7czo3OiIAKgBwYXNzIjtzOjA6IiI7czo3OiIAKgBwYXRoIjtzOjIxOiIvc2dlaXZ3L2Jsb2cvZWRpdC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6ImFjdGlvbiI7czozOiJhZGQiO319fX0iO31zOjE2OiJjb250ZXh0aGFzcmVwb3M1IjthOjM6e2k6MDtpOjEzMzc3NjM3MTg7aToxO3M6MToiMiI7aToyO3M6NDoiYjowOyI7fXM6MTc6ImNvbnRleHRoYXNyZXBvczI3IjthOjM6e2k6MDtpOjEzMzc3NjM3MTg7aToxO3M6MToiMiI7aToyO3M6NDoiYjowOyI7fXM6MTY6InVzZXJibG9nb3B0aW9uczMiO2E6Mzp7aTowO2k6MTMzNzc2MjE3MTtpOjE7czoxOiIyIjtpOjI7czozNzc6ImE6MTp7czoxMToidXNlcmVudHJpZXMiO2E6Mjp7czo2OiJzdHJpbmciO3M6MzA6IlZpZXcgYWxsIGVudHJpZXMgYnkgSmluZ2x1ZSBMaSI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6MTQ6Ind3dy5tb3Rlc3QuY29tIjtzOjc6IgAqAHBvcnQiO2k6ODA4MDtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MjI6Ii9zZ2VpdncvYmxvZy9pbmRleC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6InVzZXJpZCI7czoxOiIzIjt9fX19Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zMTkiO2E6Mzp7aTowO2k6MTMzNzc2MjE3MTtpOjE7czoxOiIyIjtpOjI7czo0OiJiOjA7Ijt9fX1zOjE1OiJjb21wbGV0aW9uY2FjaGUiO2E6MTp7aTozO2E6Mzp7aToyO086ODoic3RkQ2xhc3MiOjY6e3M6MjoiaWQiO2k6MDtzOjE0OiJjb3Vyc2Vtb2R1bGVpZCI7czoxOiIyIjtzOjY6InVzZXJpZCI7czoxOiIyIjtzOjE1OiJjb21wbGV0aW9uc3RhdGUiO2k6MDtzOjY6InZpZXdlZCI7aTowO3M6MTI6InRpbWVtb2RpZmllZCI7aTowO31pOjQ7Tzo4OiJzdGRDbGFzcyI6Njp7czoyOiJpZCI7czoxOiIxIjtzOjE0OiJjb3Vyc2Vtb2R1bGVpZCI7czoxOiI0IjtzOjY6InVzZXJpZCI7czoxOiIyIjtzOjE1OiJjb21wbGV0aW9uc3RhdGUiO3M6MToiMCI7czo2OiJ2aWV3ZWQiO3M6MToiMSI7czoxMjoidGltZW1vZGlmaWVkIjtzOjE6IjAiO31zOjc6InVwZGF0ZWQiO2k6MTMzNzc2MzE5Mzt9fXM6MjE6ImNvbXBsZXRpb25jYWNoZXVzZXJpZCI7czoxOiIyIjtzOjk6ImZsZXh0YWJsZSI7YToyOntzOjMxOiJtb2QtcXVpei1yZXBvcnQtb3ZlcnZpZXctcmVwb3J0IjtPOjg6InN0ZENsYXNzIjo1OntzOjg6InVuaXF1ZWlkIjtzOjMxOiJtb2QtcXVpei1yZXBvcnQtb3ZlcnZpZXctcmVwb3J0IjtzOjg6ImNvbGxhcHNlIjthOjA6e31zOjY6InNvcnRieSI7YTowOnt9czo3OiJpX2ZpcnN0IjtzOjA6IiI7czo2OiJpX2xhc3QiO3M6MDoiIjt9czoyNToidXNlci1pbmRleC1wYXJ0aWNpcGFudHMtMyI7Tzo4OiJzdGRDbGFzcyI6NTp7czo4OiJ1bmlxdWVpZCI7czoyNToidXNlci1pbmRleC1wYXJ0aWNpcGFudHMtMyI7czo4OiJjb2xsYXBzZSI7YTowOnt9czo2OiJzb3J0YnkiO2E6MTp7czoxMDoibGFzdGFjY2VzcyI7aTozO31zOjc6ImlfZmlyc3QiO3M6MDoiIjtzOjY6ImlfbGFzdCI7czowOiIiO319fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6NjU6e3M6MjoiaWQiO3M6MToiMiI7czo0OiJhdXRoIjtzOjY6Im1hbnVhbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6ODoicGFzc3dvcmQiO3M6MzI6IjIwMDhjMjNlY2Q5OGU4ZGY2NWM5NmI1MjBiNWVhZjExIjtzOjg6ImlkbnVtYmVyIjtzOjA6IiI7czo5OiJmaXJzdG5hbWUiO3M6NToiQWRtaW4iO3M6ODoibGFzdG5hbWUiO3M6NDoiVXNlciI7czo1OiJlbWFpbCI7czoxNToiYWRtaW5AYWRtaW4uY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6ODoiSG9uZ0tvbmciO3M6NzoiY291bnRyeSI7czoyOiJISyI7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjU6InRoZW1lIjtzOjA6IiI7czo4OiJ0aW1lem9uZSI7czoyOiI5OSI7czoxMToiZmlyc3RhY2Nlc3MiO3M6MTA6IjEzMzczMjg0NTAiO3M6MTA6Imxhc3RhY2Nlc3MiO2k6MTMzNzc2MzcxODtzOjk6Imxhc3Rsb2dpbiI7czoxMDoiMTMzNzU5MDUxMyI7czoxMjoiY3VycmVudGxvZ2luIjtpOjEzMzc3NTc0MjI7czo2OiJsYXN0aXAiO3M6OToiMTI3LjAuMC4xIjtzOjY6InNlY3JldCI7czowOiIiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIxIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjE6IjAiO3M6MTI6InRpbWVtb2RpZmllZCI7czoxMDoiMTMzNzMyODQ1MCI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxMjoic2NyZWVucmVhZGVyIjtzOjE6IjAiO3M6NjoiZ3VpZGVkIjtzOjE6IjEiO3M6MTY6Imxhc3Rjb3Vyc2VhY2Nlc3MiO2E6MDp7fXM6MTk6ImN1cnJlbnRjb3Vyc2VhY2Nlc3MiO2E6Mjp7aToyO2k6MTMzNzc1Nzc0NTtpOjM7aToxMzM3NzYzNzE4O31zOjExOiJncm91cG1lbWJlciI7YTowOnt9czo3OiJwcm9maWxlIjthOjA6e31zOjc6InNlc3NrZXkiO3M6MTA6Ik00WWlWdGw1b2siO3M6MTA6InByZWZlcmVuY2UiO2E6NTp7czoxODoiZW1haWxfYm91bmNlX2NvdW50IjtzOjE6IjEiO3M6MTY6ImVtYWlsX3NlbmRfY291bnQiO3M6MToiMSI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MToiMCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MToiMCI7czoxMToiX2xhc3Rsb2FkZWQiO2k6MTMzNzc2MzcyMzt9czoxNzoibWVzc2FnZV9sYXN0cG9wdXAiO2k6MDtzOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjMwOntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMyI7czozOiJpbnQiO3M6MTI6ImJsb2NrNGhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazVoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2szaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xNCI7czozOiJpbnQiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xNSI7czozOiJpbnQiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xNiI7czozOiJpbnQiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xNyI7czozOiJpbnQiO3M6MTM6ImJsb2NrMTRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxNWhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE2aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTdoaWRkZW4iO3M6NDoiYm9vbCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzYiO3M6MzoiaW50IjtzOjEyOiJibG9jazZoaWRkZW4iO3M6NDoiYm9vbCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzE4IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzE5IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzIwIjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzIxIjtzOjM6ImludCI7czoxMzoiYmxvY2sxOGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE5aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMjBoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2syMWhpZGRlbiI7czo0OiJib29sIjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMjIiO3M6MzoiaW50IjtzOjEzOiJibG9jazIyaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrMWhpZGRlbiI7czo0OiJib29sIjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMjMiO3M6MzoiaW50IjtzOjEzOiJibG9jazIzaGlkZGVuIjtzOjQ6ImJvb2wiO31zOjc6ImRpc3BsYXkiO2E6MTp7aTozO2k6MDt9czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjA6e31zOjk6InRlbXBndWVzdCI7YTowOnt9fXM6NzoiZWRpdGluZyI7aToxO3M6MTc6ImdyYWRlX2xhc3RfcmVwb3J0IjthOjE6e2k6MztzOjQ6InVzZXIiO31zOjEyOiJncmFkZWVkaXRpbmciO2E6MTp7aTozO2k6MDt9czo2OiJhY2Nlc3MiO2E6Nzp7czoyOiJyYSI7YTozOntzOjI6Ii8xIjthOjE6e2k6NztpOjc7fXM6NDoiLzEvMiI7YToxOntpOjg7aTo4O31zOjg6Ii8xLzI2LzI3IjthOjE6e2k6MztpOjM7fX1zOjQ6InJkZWYiO2E6Mzp7czo0OiIvMTozIjthOjI2Mzp7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtpOjE7czozMToiYmxvY2svcnNzX2NsaWVudDptYW5hZ2Vvd25mZWVkcyI7aToxO3M6MjI6ImVucm9sL2F1dGhvcml6ZTptYW5hZ2UiO2k6MTtzOjE5OiJlbnJvbC9jb2hvcnQ6Y29uZmlnIjtpOjE7czoxODoiZW5yb2wvZ3Vlc3Q6Y29uZmlnIjtpOjE7czoxODoiZW5yb2wvbWFudWFsOmVucm9sIjtpOjE7czoxOToiZW5yb2wvbWFudWFsOm1hbmFnZSI7aToxO3M6MjA6ImVucm9sL21hbnVhbDp1bmVucm9sIjtpOjE7czoxNzoiZW5yb2wvbWV0YTpjb25maWciO2k6MTtzOjE5OiJlbnJvbC9wYXlwYWw6bWFuYWdlIjtpOjE7czoxNzoiZW5yb2wvc2VsZjpjb25maWciO2k6MTtzOjE3OiJlbnJvbC9zZWxmOm1hbmFnZSI7aToxO3M6MTg6ImVucm9sL3NlbGY6dW5lbnJvbCI7aToxO3M6MjA6ImdyYWRlZXhwb3J0L29kczp2aWV3IjtpOjE7czoyMDoiZ3JhZGVleHBvcnQvdHh0OnZpZXciO2k6MTtzOjIwOiJncmFkZWV4cG9ydC94bHM6dmlldyI7aToxO3M6MjA6ImdyYWRlZXhwb3J0L3htbDp2aWV3IjtpOjE7czoyMDoiZ3JhZGVpbXBvcnQvY3N2OnZpZXciO2k6MTtzOjIwOiJncmFkZWltcG9ydC94bWw6dmlldyI7aToxO3M6MjM6ImdyYWRlcmVwb3J0L2dyYWRlcjp2aWV3IjtpOjE7czoyNToiZ3JhZGVyZXBvcnQvb3V0Y29tZXM6dmlldyI7aToxO3M6MjE6ImdyYWRlcmVwb3J0L3VzZXI6dmlldyI7aToxO3M6MzQ6Im1vZC9hc3NpZ25tZW50OmV4cG9ydG93bnN1Ym1pc3Npb24iO2k6MTtzOjIwOiJtb2QvYXNzaWdubWVudDpncmFkZSI7aToxO3M6MTk6Im1vZC9hc3NpZ25tZW50OnZpZXciO2k6MTtzOjEzOiJtb2QvY2hhdDpjaGF0IjtpOjE7czoxODoibW9kL2NoYXQ6ZGVsZXRlbG9nIjtpOjE7czozNDoibW9kL2NoYXQ6ZXhwb3J0cGFydGljaXBhdGVkc2Vzc2lvbiI7aToxO3M6MjI6Im1vZC9jaGF0OmV4cG9ydHNlc3Npb24iO2k6MTtzOjE2OiJtb2QvY2hhdDpyZWFkbG9nIjtpOjE7czoxNzoibW9kL2Nob2ljZTpjaG9vc2UiO2k6MTtzOjI2OiJtb2QvY2hvaWNlOmRlbGV0ZXJlc3BvbnNlcyI7aToxO3M6Mjg6Im1vZC9jaG9pY2U6ZG93bmxvYWRyZXNwb25zZXMiO2k6MTtzOjI0OiJtb2QvY2hvaWNlOnJlYWRyZXNwb25zZXMiO2k6MTtzOjE2OiJtb2QvZGF0YTphcHByb3ZlIjtpOjE7czoxNjoibW9kL2RhdGE6Y29tbWVudCI7aToxO3M6MjU6Im1vZC9kYXRhOmV4cG9ydGFsbGVudHJpZXMiO2k6MTtzOjIwOiJtb2QvZGF0YTpleHBvcnRlbnRyeSI7aToxO3M6MjM6Im1vZC9kYXRhOmV4cG9ydG93bmVudHJ5IjtpOjE7czoyMzoibW9kL2RhdGE6bWFuYWdlY29tbWVudHMiO2k6MTtzOjIyOiJtb2QvZGF0YTptYW5hZ2VlbnRyaWVzIjtpOjE7czoyNDoibW9kL2RhdGE6bWFuYWdldGVtcGxhdGVzIjtpOjE7czoxMzoibW9kL2RhdGE6cmF0ZSI7aToxO3M6MjM6Im1vZC9kYXRhOnZpZXdhbGxyYXRpbmdzIjtpOjE7czoyNzoibW9kL2RhdGE6dmlld2FsbHVzZXJwcmVzZXRzIjtpOjE7czoyMjoibW9kL2RhdGE6dmlld2FueXJhdGluZyI7aToxO3M6MTg6Im1vZC9kYXRhOnZpZXdlbnRyeSI7aToxO3M6MTk6Im1vZC9kYXRhOnZpZXdyYXRpbmciO2k6MTtzOjE5OiJtb2QvZGF0YTp3cml0ZWVudHJ5IjtpOjE7czozNDoibW9kL2ZlZWRiYWNrOmNyZWF0ZXByaXZhdGV0ZW1wbGF0ZSI7aToxO3M6MzM6Im1vZC9mZWVkYmFjazpjcmVhdGVwdWJsaWN0ZW1wbGF0ZSI7aToxO3M6MzA6Im1vZC9mZWVkYmFjazpkZWxldGVzdWJtaXNzaW9ucyI7aToxO3M6Mjc6Im1vZC9mZWVkYmFjazpkZWxldGV0ZW1wbGF0ZSI7aToxO3M6MjI6Im1vZC9mZWVkYmFjazplZGl0aXRlbXMiO2k6MTtzOjI0OiJtb2QvZmVlZGJhY2s6cmVjZWl2ZW1haWwiO2k6MTtzOjE3OiJtb2QvZmVlZGJhY2s6dmlldyI7aToxO3M6Mjg6Im1vZC9mZWVkYmFjazp2aWV3YW5hbHlzZXBhZ2UiO2k6MTtzOjI0OiJtb2QvZmVlZGJhY2s6dmlld3JlcG9ydHMiO2k6MTtzOjIyOiJtb2QvZm9sZGVyOm1hbmFnZWZpbGVzIjtpOjE7czoxNzoibW9kL2ZvcnVtOmFkZG5ld3MiO2k6MTtzOjIxOiJtb2QvZm9ydW06YWRkcXVlc3Rpb24iO2k6MTtzOjI2OiJtb2QvZm9ydW06Y3JlYXRlYXR0YWNobWVudCI7aToxO3M6MjM6Im1vZC9mb3J1bTpkZWxldGVhbnlwb3N0IjtpOjE7czoyMzoibW9kL2ZvcnVtOmRlbGV0ZW93bnBvc3QiO2k6MTtzOjIxOiJtb2QvZm9ydW06ZWRpdGFueXBvc3QiO2k6MTtzOjI2OiJtb2QvZm9ydW06ZXhwb3J0ZGlzY3Vzc2lvbiI7aToxO3M6MjM6Im1vZC9mb3J1bTpleHBvcnRvd25wb3N0IjtpOjE7czoyMDoibW9kL2ZvcnVtOmV4cG9ydHBvc3QiO2k6MTtzOjI5OiJtb2QvZm9ydW06bWFuYWdlc3Vic2NyaXB0aW9ucyI7aToxO3M6MjU6Im1vZC9mb3J1bTptb3ZlZGlzY3Vzc2lvbnMiO2k6MTtzOjMxOiJtb2QvZm9ydW06cG9zdHdpdGhvdXR0aHJvdHRsaW5nIjtpOjE7czoxNDoibW9kL2ZvcnVtOnJhdGUiO2k6MTtzOjE5OiJtb2QvZm9ydW06cmVwbHluZXdzIjtpOjE7czoxOToibW9kL2ZvcnVtOnJlcGx5cG9zdCI7aToxO3M6MjY6Im1vZC9mb3J1bTpzcGxpdGRpc2N1c3Npb25zIjtpOjE7czoyNToibW9kL2ZvcnVtOnN0YXJ0ZGlzY3Vzc2lvbiI7aToxO3M6MjQ6Im1vZC9mb3J1bTp2aWV3YWxscmF0aW5ncyI7aToxO3M6MjM6Im1vZC9mb3J1bTp2aWV3YW55cmF0aW5nIjtpOjE7czoyNDoibW9kL2ZvcnVtOnZpZXdkaXNjdXNzaW9uIjtpOjE7czozMDoibW9kL2ZvcnVtOnZpZXdoaWRkZW50aW1lZHBvc3RzIjtpOjE7czozMzoibW9kL2ZvcnVtOnZpZXdxYW5kYXdpdGhvdXRwb3N0aW5nIjtpOjE7czoyMDoibW9kL2ZvcnVtOnZpZXdyYXRpbmciO2k6MTtzOjI1OiJtb2QvZm9ydW06dmlld3N1YnNjcmliZXJzIjtpOjE7czoyMDoibW9kL2dsb3NzYXJ5OmFwcHJvdmUiO2k6MTtzOjIwOiJtb2QvZ2xvc3Nhcnk6Y29tbWVudCI7aToxO3M6MTk6Im1vZC9nbG9zc2FyeTpleHBvcnQiO2k6MTtzOjI0OiJtb2QvZ2xvc3Nhcnk6ZXhwb3J0ZW50cnkiO2k6MTtzOjI3OiJtb2QvZ2xvc3Nhcnk6ZXhwb3J0b3duZW50cnkiO2k6MTtzOjE5OiJtb2QvZ2xvc3Nhcnk6aW1wb3J0IjtpOjE7czoyOToibW9kL2dsb3NzYXJ5Om1hbmFnZWNhdGVnb3JpZXMiO2k6MTtzOjI3OiJtb2QvZ2xvc3Nhcnk6bWFuYWdlY29tbWVudHMiO2k6MTtzOjI2OiJtb2QvZ2xvc3Nhcnk6bWFuYWdlZW50cmllcyI7aToxO3M6MTc6Im1vZC9nbG9zc2FyeTpyYXRlIjtpOjE7czoyNzoibW9kL2dsb3NzYXJ5OnZpZXdhbGxyYXRpbmdzIjtpOjE7czoyNjoibW9kL2dsb3NzYXJ5OnZpZXdhbnlyYXRpbmciO2k6MTtzOjIzOiJtb2QvZ2xvc3Nhcnk6dmlld3JhdGluZyI7aToxO3M6MTg6Im1vZC9nbG9zc2FyeTp3cml0ZSI7aToxO3M6MTU6Im1vZC9sZXNzb246ZWRpdCI7aToxO3M6MTc6Im1vZC9sZXNzb246bWFuYWdlIjtpOjE7czoyMToibW9kL2x0aTphZGRjb3Vyc2V0b29sIjtpOjE7czoxMzoibW9kL2x0aTpncmFkZSI7aToxO3M6MTQ6Im1vZC9sdGk6bWFuYWdlIjtpOjE7czoyMjoibW9kL2x0aTpyZXF1ZXN0dG9vbGFkZCI7aToxO3M6MTI6Im1vZC9sdGk6dmlldyI7aToxO3M6MjM6Im1vZC9xdWl6OmRlbGV0ZWF0dGVtcHRzIjtpOjE7czoxNDoibW9kL3F1aXo6Z3JhZGUiO2k6MTtzOjE1OiJtb2QvcXVpejptYW5hZ2UiO2k6MTtzOjI0OiJtb2QvcXVpejptYW5hZ2VvdmVycmlkZXMiO2k6MTtzOjE2OiJtb2QvcXVpejpwcmV2aWV3IjtpOjE7czoxNjoibW9kL3F1aXo6cmVncmFkZSI7aToxO3M6MTM6Im1vZC9xdWl6OnZpZXciO2k6MTtzOjIwOiJtb2QvcXVpejp2aWV3cmVwb3J0cyI7aToxO3M6MjU6Im1vZC9zY29ybTpkZWxldGVyZXNwb25zZXMiO2k6MTtzOjE5OiJtb2Qvc2Nvcm06c2F2ZXRyYWNrIjtpOjE7czoyMDoibW9kL3Njb3JtOnZpZXdyZXBvcnQiO2k6MTtzOjIwOiJtb2Qvc2Nvcm06dmlld3Njb3JlcyI7aToxO3M6MTk6Im1vZC9zdXJ2ZXk6ZG93bmxvYWQiO2k6MTtzOjIyOiJtb2Qvc3VydmV5OnBhcnRpY2lwYXRlIjtpOjE7czoyNDoibW9kL3N1cnZleTpyZWFkcmVzcG9uc2VzIjtpOjE7czoxOToibW9kL3dpa2k6Y3JlYXRlcGFnZSI7aToxO3M6MjA6Im1vZC93aWtpOmVkaXRjb21tZW50IjtpOjE7czoxNzoibW9kL3dpa2k6ZWRpdHBhZ2UiO2k6MTtzOjIyOiJtb2Qvd2lraTptYW5hZ2Vjb21tZW50IjtpOjE7czoyMDoibW9kL3dpa2k6bWFuYWdlZmlsZXMiO2k6MTtzOjE5OiJtb2Qvd2lraTptYW5hZ2V3aWtpIjtpOjE7czoyMToibW9kL3dpa2k6b3ZlcnJpZGVsb2NrIjtpOjE7czoyMDoibW9kL3dpa2k6dmlld2NvbW1lbnQiO2k6MTtzOjE3OiJtb2Qvd2lraTp2aWV3cGFnZSI7aToxO3M6MjE6Im1vZC93b3Jrc2hvcDphbGxvY2F0ZSI7aToxO3M6Mjc6Im1vZC93b3Jrc2hvcDplZGl0ZGltZW5zaW9ucyI7aToxO3M6Mjg6Im1vZC93b3Jrc2hvcDppZ25vcmVkZWFkbGluZXMiO2k6MTtzOjI3OiJtb2Qvd29ya3Nob3A6bWFuYWdlZXhhbXBsZXMiO2k6MTtzOjI3OiJtb2Qvd29ya3Nob3A6b3ZlcnJpZGVncmFkZXMiO2k6MTtzOjMxOiJtb2Qvd29ya3Nob3A6cHVibGlzaHN1Ym1pc3Npb25zIjtpOjE7czoyNDoibW9kL3dvcmtzaG9wOnN3aXRjaHBoYXNlIjtpOjE7czoxNzoibW9kL3dvcmtzaG9wOnZpZXciO2k6MTtzOjMxOiJtb2Qvd29ya3Nob3A6dmlld2FsbGFzc2Vzc21lbnRzIjtpOjE7czozMToibW9kL3dvcmtzaG9wOnZpZXdhbGxzdWJtaXNzaW9ucyI7aToxO3M6Mjg6Im1vZC93b3Jrc2hvcDp2aWV3YXV0aG9ybmFtZXMiO2k6MTtzOjMyOiJtb2Qvd29ya3Nob3A6dmlld2F1dGhvcnB1Ymxpc2hlZCI7aToxO3M6Mzc6Im1vZC93b3Jrc2hvcDp2aWV3cHVibGlzaGVkc3VibWlzc2lvbnMiO2k6MTtzOjMwOiJtb2Qvd29ya3Nob3A6dmlld3Jldmlld2VybmFtZXMiO2k6MTtzOjI4OiJtb29kbGUvYmFja3VwOmJhY2t1cGFjdGl2aXR5IjtpOjE7czoyNjoibW9vZGxlL2JhY2t1cDpiYWNrdXBjb3Vyc2UiO2k6MTtzOjI3OiJtb29kbGUvYmFja3VwOmJhY2t1cHNlY3Rpb24iO2k6MTtzOjI5OiJtb29kbGUvYmFja3VwOmJhY2t1cHRhcmdldGh1YiI7aToxO3M6MzI6Im1vb2RsZS9iYWNrdXA6YmFja3VwdGFyZ2V0aW1wb3J0IjtpOjE7czoyMzoibW9vZGxlL2JhY2t1cDpjb25maWd1cmUiO2k6MTtzOjI2OiJtb29kbGUvYmFja3VwOmRvd25sb2FkZmlsZSI7aToxO3M6MTc6Im1vb2RsZS9ibG9jazplZGl0IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVjb3Vyc2UiO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO2k6MTtzOjI1OiJtb29kbGUvYmxvZzptYW5hZ2VlbnRyaWVzIjtpOjE7czoyNjoibW9vZGxlL2Jsb2c6bWFuYWdlZXh0ZXJuYWwiO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO2k6MTtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtpOjE7czoyOToibW9vZGxlL2NhbGVuZGFyOm1hbmFnZWVudHJpZXMiO2k6MTtzOjM0OiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlZ3JvdXBlbnRyaWVzIjtpOjE7czoxODoibW9vZGxlL2NvaG9ydDp2aWV3IjtpOjE7czoyMToibW9vZGxlL2NvbW1lbnQ6ZGVsZXRlIjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO2k6MTtzOjIwOiJtb29kbGUvY29tbXVuaXR5OmFkZCI7aToxO3M6MjU6Im1vb2RsZS9jb21tdW5pdHk6ZG93bmxvYWQiO2k6MTtzOjMyOiJtb29kbGUvY291cnNlOmFjdGl2aXR5dmlzaWJpbGl0eSI7aToxO3M6Mjc6Im1vb2RsZS9jb3Vyc2U6YnVsa21lc3NhZ2luZyI7aToxO3M6Mjg6Im1vb2RsZS9jb3Vyc2U6Y2hhbmdlY2F0ZWdvcnkiO2k6MTtzOjI4OiJtb29kbGUvY291cnNlOmNoYW5nZWZ1bGxuYW1lIjtpOjE7czoyODoibW9vZGxlL2NvdXJzZTpjaGFuZ2VpZG51bWJlciI7aToxO3M6Mjk6Im1vb2RsZS9jb3Vyc2U6Y2hhbmdlc2hvcnRuYW1lIjtpOjE7czoyNzoibW9vZGxlL2NvdXJzZTpjaGFuZ2VzdW1tYXJ5IjtpOjE7czoyNToibW9vZGxlL2NvdXJzZTplbnJvbGNvbmZpZyI7aToxO3M6MjU6Im1vb2RsZS9jb3Vyc2U6ZW5yb2xyZXZpZXciO2k6MTtzOjMwOiJtb29kbGUvY291cnNlOm1hbmFnZWFjdGl2aXRpZXMiO2k6MTtzOjI1OiJtb29kbGUvY291cnNlOm1hbmFnZWZpbGVzIjtpOjE7czoyNjoibW9vZGxlL2NvdXJzZTptYW5hZ2Vncm91cHMiO2k6MTtzOjI2OiJtb29kbGUvY291cnNlOm1hbmFnZXNjYWxlcyI7aToxO3M6MjY6Im1vb2RsZS9jb3Vyc2U6bWFya2NvbXBsZXRlIjtpOjE7czoxOToibW9vZGxlL2NvdXJzZTpyZXNldCI7aToxO3M6MzE6Im1vb2RsZS9jb3Vyc2U6c2VjdGlvbnZpc2liaWxpdHkiO2k6MTtzOjMxOiJtb29kbGUvY291cnNlOnNldGN1cnJlbnRzZWN0aW9uIjtpOjE7czoyMDoibW9vZGxlL2NvdXJzZTp1cGRhdGUiO2k6MTtzOjIzOiJtb29kbGUvY291cnNlOnVzZXJlbWFpbCI7aToxO3M6MzQ6Im1vb2RsZS9jb3Vyc2U6dmlld2hpZGRlbmFjdGl2aXRpZXMiO2k6MTtzOjMxOiJtb29kbGUvY291cnNlOnZpZXdoaWRkZW5jb3Vyc2VzIjtpOjE7czozMjoibW9vZGxlL2NvdXJzZTp2aWV3aGlkZGVuc2VjdGlvbnMiO2k6MTtzOjM0OiJtb29kbGUvY291cnNlOnZpZXdoaWRkZW51c2VyZmllbGRzIjtpOjE7czozMDoibW9vZGxlL2NvdXJzZTp2aWV3cGFydGljaXBhbnRzIjtpOjE7czoyNDoibW9vZGxlL2NvdXJzZTp2aWV3c2NhbGVzIjtpOjE7czoyNDoibW9vZGxlL2NvdXJzZTp2aXNpYmlsaXR5IjtpOjE7czoyMDoibW9vZGxlL2ZpbHRlcjptYW5hZ2UiO2k6MTtzOjE3OiJtb29kbGUvZ3JhZGU6ZWRpdCI7aToxO3M6MTk6Im1vb2RsZS9ncmFkZTpleHBvcnQiO2k6MTtzOjE3OiJtb29kbGUvZ3JhZGU6aGlkZSI7aToxO3M6MTk6Im1vb2RsZS9ncmFkZTppbXBvcnQiO2k6MTtzOjE3OiJtb29kbGUvZ3JhZGU6bG9jayI7aToxO3M6MTk6Im1vb2RsZS9ncmFkZTptYW5hZ2UiO2k6MTtzOjMxOiJtb29kbGUvZ3JhZGU6bWFuYWdlZ3JhZGluZ2Zvcm1zIjtpOjE7czoyNjoibW9vZGxlL2dyYWRlOm1hbmFnZWxldHRlcnMiO2k6MTtzOjI3OiJtb29kbGUvZ3JhZGU6bWFuYWdlb3V0Y29tZXMiO2k6MTtzOjE5OiJtb29kbGUvZ3JhZGU6dW5sb2NrIjtpOjE7czoyMDoibW9vZGxlL2dyYWRlOnZpZXdhbGwiO2k6MTtzOjIzOiJtb29kbGUvZ3JhZGU6dmlld2hpZGRlbiI7aToxO3M6MTk6Im1vb2RsZS9ub3RlczptYW5hZ2UiO2k6MTtzOjE3OiJtb29kbGUvbm90ZXM6dmlldyI7aToxO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtpOjE7czoxOToibW9vZGxlL3F1ZXN0aW9uOmFkZCI7aToxO3M6MjM6Im1vb2RsZS9xdWVzdGlvbjplZGl0YWxsIjtpOjE7czoyNDoibW9vZGxlL3F1ZXN0aW9uOmVkaXRtaW5lIjtpOjE7czoyMDoibW9vZGxlL3F1ZXN0aW9uOmZsYWciO2k6MTtzOjMwOiJtb29kbGUvcXVlc3Rpb246bWFuYWdlY2F0ZWdvcnkiO2k6MTtzOjIzOiJtb29kbGUvcXVlc3Rpb246bW92ZWFsbCI7aToxO3M6MjQ6Im1vb2RsZS9xdWVzdGlvbjptb3ZlbWluZSI7aToxO3M6MjI6Im1vb2RsZS9xdWVzdGlvbjp1c2VhbGwiO2k6MTtzOjIzOiJtb29kbGUvcXVlc3Rpb246dXNlbWluZSI7aToxO3M6MjM6Im1vb2RsZS9xdWVzdGlvbjp2aWV3YWxsIjtpOjE7czoyNDoibW9vZGxlL3F1ZXN0aW9uOnZpZXdtaW5lIjtpOjE7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtpOjE7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YWxsIjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtpOjE7czoyNDoibW9vZGxlL3Jlc3RvcmU6Y29uZmlndXJlIjtpOjE7czozMDoibW9vZGxlL3Jlc3RvcmU6cmVzdG9yZWFjdGl2aXR5IjtpOjE7czoyODoibW9vZGxlL3Jlc3RvcmU6cmVzdG9yZWNvdXJzZSI7aToxO3M6Mjk6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmVzZWN0aW9uIjtpOjE7czozMToibW9vZGxlL3Jlc3RvcmU6cmVzdG9yZXRhcmdldGh1YiI7aToxO3M6MzQ6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmV0YXJnZXRpbXBvcnQiO2k6MTtzOjI1OiJtb29kbGUvcmVzdG9yZTp1cGxvYWRmaWxlIjtpOjE7czoxODoibW9vZGxlL3JvbGU6YXNzaWduIjtpOjE7czoxODoibW9vZGxlL3JvbGU6cmV2aWV3IjtpOjE7czoyNDoibW9vZGxlL3JvbGU6c2FmZW92ZXJyaWRlIjtpOjE7czoyMzoibW9vZGxlL3JvbGU6c3dpdGNocm9sZXMiO2k6MTtzOjI3OiJtb29kbGUvc2l0ZTphY2Nlc3NhbGxncm91cHMiO2k6MTtzOjIwOiJtb29kbGUvc2l0ZTpkb2NsaW5rcyI7aToxO3M6MjQ6Im1vb2RsZS9zaXRlOm1hbmFnZWJsb2NrcyI7aToxO3M6Mjc6Im1vb2RsZS9zaXRlOnJlYWRhbGxtZXNzYWdlcyI7aToxO3M6MjQ6Im1vb2RsZS9zaXRlOnRydXN0Y29udGVudCI7aToxO3M6MjU6Im1vb2RsZS9zaXRlOnZpZXdmdWxsbmFtZXMiO2k6MTtzOjIzOiJtb29kbGUvc2l0ZTp2aWV3cmVwb3J0cyI7aToxO3M6Mjg6Im1vb2RsZS9zaXRlOnZpZXd1c2VyaWRlbnRpdHkiO2k6MTtzOjIxOiJtb29kbGUvdGFnOmVkaXRibG9ja3MiO2k6MTtzOjE3OiJtb29kbGUvdGFnOm1hbmFnZSI7aToxO3M6MjU6Im1vb2RsZS91c2VyOnJlYWR1c2VyYmxvZ3MiO2k6MTtzOjI1OiJtb29kbGUvdXNlcjpyZWFkdXNlcnBvc3RzIjtpOjE7czoyMzoibW9vZGxlL3VzZXI6dmlld2RldGFpbHMiO2k6MTtzOjI5OiJtb29kbGUvdXNlcjp2aWV3aGlkZGVuZGV0YWlscyI7aToxO3M6MjU6InF1aXovZ3JhZGluZzp2aWV3aWRudW1iZXIiO2k6MTtzOjI5OiJxdWl6L2dyYWRpbmc6dmlld3N0dWRlbnRuYW1lcyI7aToxO3M6MjA6InF1aXovc3RhdGlzdGljczp2aWV3IjtpOjE7czoyMjoicmVwb3J0L2NvbXBsZXRpb246dmlldyI7aToxO3M6MjY6InJlcG9ydC9jb3Vyc2VvdmVydmlldzp2aWV3IjtpOjE7czoxNToicmVwb3J0L2xvZzp2aWV3IjtpOjE7czoyMDoicmVwb3J0L2xvZzp2aWV3dG9kYXkiO2k6MTtzOjE5OiJyZXBvcnQvbG9nbGl2ZTp2aWV3IjtpOjE7czoxOToicmVwb3J0L291dGxpbmU6dmlldyI7aToxO3M6MjU6InJlcG9ydC9wYXJ0aWNpcGF0aW9uOnZpZXciO2k6MTtzOjIwOiJyZXBvcnQvcHJvZ3Jlc3M6dmlldyI7aToxO3M6MTc6InJlcG9ydC9zdGF0czp2aWV3IjtpOjE7czoyNzoicmVwb3NpdG9yeS9jb3Vyc2VmaWxlczp2aWV3IjtpOjE7czoyNjoicmVwb3NpdG9yeS9maWxlc3lzdGVtOnZpZXciO2k6MTtzOjIxOiJyZXBvc2l0b3J5L2xvY2FsOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3dlYmRhdjp2aWV3IjtpOjE7fXM6NDoiLzE6NyI7YTo0Nzp7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtpOjE7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtpOjE7czoxNDoibW9kL2ltc2NwOnZpZXciO2k6MTtzOjEzOiJtb2QvcGFnZTp2aWV3IjtpOjE7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO2k6MTtzOjEyOiJtb2QvdXJsOnZpZXciO2k6MTtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7aToxO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZWNvdXJzZSI7aToxO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZW1vZHVsZSI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOmNyZWF0ZSI7aToxO3M6MjY6Im1vb2RsZS9ibG9nOm1hbmFnZWV4dGVybmFsIjtpOjE7czoxODoibW9vZGxlL2Jsb2c6c2VhcmNoIjtpOjE7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7aToxO3M6MzI6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2Vvd25lbnRyaWVzIjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO2k6MTtzOjIxOiJtb29kbGUvY291cnNlOnJlcXVlc3QiO2k6MTtzOjIyOiJtb29kbGUvbXk6bWFuYWdlYmxvY2tzIjtpOjE7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO2k6MTtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO2k6MTtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO2k6MTtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO2k6MTtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO2k6MTtzOjIzOiJtb29kbGUvc2l0ZTpzZW5kbWVzc2FnZSI7aToxO3M6MTc6Im1vb2RsZS90YWc6Y3JlYXRlIjtpOjE7czoxNToibW9vZGxlL3RhZzplZGl0IjtpOjE7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO2k6MTtzOjMzOiJtb29kbGUvdXNlcjplZGl0b3dubWVzc2FnZXByb2ZpbGUiO2k6MTtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7aToxO3M6Mjc6Im1vb2RsZS91c2VyOm1hbmFnZW93bmJsb2NrcyI7aToxO3M6MjY6Im1vb2RsZS91c2VyOm1hbmFnZW93bmZpbGVzIjtpOjE7czozNToibW9vZGxlL3dlYnNlcnZpY2U6Y3JlYXRlbW9iaWxldG9rZW4iO2k6MTtzOjI0OiJyZXBvc2l0b3J5L2FsZnJlc2NvOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L2JveG5ldDp2aWV3IjtpOjE7czoyMzoicmVwb3NpdG9yeS9kcm9wYm94OnZpZXciO2k6MTtzOjI5OiJyZXBvc2l0b3J5L2ZsaWNrcl9wdWJsaWM6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvZmxpY2tyOnZpZXciO2k6MTtzOjI2OiJyZXBvc2l0b3J5L2dvb2dsZWRvY3M6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvbWVybG90OnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3BpY2FzYTp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9yZWNlbnQ6dmlldyI7aToxO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvdXBsb2FkOnZpZXciO2k6MTtzOjE5OiJyZXBvc2l0b3J5L3VybDp2aWV3IjtpOjE7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO2k6MTtzOjI1OiJyZXBvc2l0b3J5L3dpa2ltZWRpYTp2aWV3IjtpOjE7czoyMzoicmVwb3NpdG9yeS95b3V0dWJlOnZpZXciO2k6MTt9czo0OiIvMTo4IjthOjM6e3M6MTg6Im1vZC9kYXRhOnZpZXdlbnRyeSI7aToxO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO2k6MTt9fXM6MTA6InJkZWZfY291bnQiO2k6MztzOjg6InJkZWZfbGNjIjtpOjM7czo2OiJsb2FkZWQiO2E6MDp7fXM6NDoidGltZSI7aToxMzM3NzYzMjE4O3M6MzoicnN3IjthOjE6e3M6ODoiLzEvMjYvMjciO2k6Mzt9fX0=', 1337757422, 1337763724, '127.0.0.1', '127.0.0.1'),
(37, 0, 'eo9kmumalelih9jse601rfc0p6', 3, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo3OntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YToyOntzOjE2OiJ1c2VyYmxvZ29wdGlvbnMzIjthOjM6e2k6MDtpOjEzMzc3NjE1Mzk7aToxO3M6MToiMyI7aToyO3M6NzA5OiJhOjI6e3M6NDoidmlldyI7YToyOntzOjY6InN0cmluZyI7czoyMjoiVmlldyBhbGwgb2YgbXkgZW50cmllcyI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6MTQ6Ind3dy5tb3Rlc3QuY29tIjtzOjc6IgAqAHBvcnQiO2k6ODA4MDtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MjI6Ii9zZ2VpdncvYmxvZy9pbmRleC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6InVzZXJpZCI7czoxOiIzIjt9fX1zOjM6ImFkZCI7YToyOntzOjY6InN0cmluZyI7czoxNToiQWRkIGEgbmV3IGVudHJ5IjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czoxNDoid3d3Lm1vdGVzdC5jb20iO3M6NzoiACoAcG9ydCI7aTo4MDgwO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoyMToiL3NnZWl2dy9ibG9nL2VkaXQucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJhY3Rpb24iO3M6MzoiYWRkIjt9fX19Ijt9czoxNzoiY29udGV4dGhhc3JlcG9zMTkiO2E6Mzp7aTowO2k6MTMzNzc2MTUzOTtpOjE7czoxOiIzIjtpOjI7czo0OiJiOjA7Ijt9fX1zOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MDtzOjE0OiJmcm9tZGlzY3Vzc2lvbiI7czo1NDoiaHR0cDovL3d3dy5tb3Rlc3QuY29tOjgwODAvc2dlaXZ3L2NvdXJzZS92aWV3LnBocD9pZD0zIjtzOjE1OiJjb21wbGV0aW9uY2FjaGUiO2E6MTp7aTozO2E6Mzp7aToyO086ODoic3RkQ2xhc3MiOjY6e3M6MjoiaWQiO2k6MDtzOjE0OiJjb3Vyc2Vtb2R1bGVpZCI7czoxOiIyIjtzOjY6InVzZXJpZCI7czoxOiIzIjtzOjE1OiJjb21wbGV0aW9uc3RhdGUiO2k6MDtzOjY6InZpZXdlZCI7aTowO3M6MTI6InRpbWVtb2RpZmllZCI7aTowO31pOjQ7Tzo4OiJzdGRDbGFzcyI6Njp7czoyOiJpZCI7czoxOiIyIjtzOjE0OiJjb3Vyc2Vtb2R1bGVpZCI7czoxOiI0IjtzOjY6InVzZXJpZCI7czoxOiIzIjtzOjE1OiJjb21wbGV0aW9uc3RhdGUiO3M6MToiMSI7czo2OiJ2aWV3ZWQiO3M6MToiMSI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxMzM3NzU5NDI2Ijt9czo3OiJ1cGRhdGVkIjtpOjEzMzc3NjMyNDY7fX1zOjIxOiJjb21wbGV0aW9uY2FjaGV1c2VyaWQiO3M6MToiMyI7czoxNToiZ3JhZGVzY29yZWNhY2hlIjtOO31VU0VSfE86ODoic3RkQ2xhc3MiOjYzOntzOjI6ImlkIjtzOjE6IjMiO3M6NDoiYXV0aCI7czoxMjoiZ29vZ2xlb2F1dGgyIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czoxMzoic29jaWFsX3VzZXJfMSI7czo4OiJwYXNzd29yZCI7czoxMDoibm90IGNhY2hlZCI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjc6IkppbmdsdWUiO3M6ODoibGFzdG5hbWUiO3M6MjoiTGkiO3M6NToiZW1haWwiO3M6MTg6ImxpamluZ2x1ZUBsaXZlLmNvbSI7czo5OiJlbWFpbHN0b3AiO3M6MToiMCI7czozOiJpY3EiO3M6MDoiIjtzOjU6InNreXBlIjtzOjA6IiI7czo1OiJ5YWhvbyI7czowOiIiO3M6MzoiYWltIjtzOjA6IiI7czozOiJtc24iO3M6MDoiIjtzOjY6InBob25lMSI7czowOiIiO3M6NjoicGhvbmUyIjtzOjA6IiI7czoxMToiaW5zdGl0dXRpb24iO3M6MDoiIjtzOjEwOiJkZXBhcnRtZW50IjtzOjA6IiI7czo3OiJhZGRyZXNzIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjU6InRoZW1lIjtzOjA6IiI7czo4OiJ0aW1lem9uZSI7czoyOiI5OSI7czoxMToiZmlyc3RhY2Nlc3MiO3M6MTA6IjEzMzc1OTM0MDkiO3M6MTA6Imxhc3RhY2Nlc3MiO2k6MTMzNzc2MzI0NTtzOjk6Imxhc3Rsb2dpbiI7czoxMDoiMTMzNzc1OTMxNiI7czoxMjoiY3VycmVudGxvZ2luIjtpOjEzMzc3NTkzMjE7czo2OiJsYXN0aXAiO3M6OToiMTI3LjAuMC4xIjtzOjY6InNlY3JldCI7czowOiIiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6NDoiYWpheCI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjEwOiIxMzM3NTkzNDA5IjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MTA6IjEzMzc1OTM0MDkiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjtzOjY6Imd1aWRlZCI7czoxOiIxIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjA6e31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjE6e2k6MztpOjEzMzc3NjMyNDU7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6MDp7fXM6Nzoic2Vzc2tleSI7czoxMDoiTWNsaFNYVGhsUiI7czoxMDoicHJlZmVyZW5jZSI7YToxOntzOjExOiJfbGFzdGxvYWRlZCI7aToxMzM3NzYzMjQ1O31zOjU6ImVucm9sIjthOjI6e3M6ODoiZW5yb2xsZWQiO2E6MTp7aTozO2k6MjE0NzQ4MzY0Nzt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX1zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6MjU6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xIjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNWhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazNoaWRkZW4iO3M6NDoiYm9vbCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzE4IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzE5IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzIwIjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzIxIjtzOjM6ImludCI7czoxMzoiYmxvY2sxOGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE5aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMjBoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2syMWhpZGRlbiI7czo0OiJib29sIjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNyI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV84IjtzOjM6ImludCI7czoxMjoiYmxvY2s3aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrOGhpZGRlbiI7czo0OiJib29sIjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfOSI7czozOiJpbnQiO3M6MTI6ImJsb2NrOWhpZGRlbiI7czo0OiJib29sIjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMjIiO3M6MzoiaW50IjtzOjEzOiJibG9jazIyaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8yMyI7czozOiJpbnQiO3M6MTM6ImJsb2NrMjNoaWRkZW4iO3M6NDoiYm9vbCI7fXM6NzoiZGlzcGxheSI7YToxOntpOjM7aTowO31zOjc6ImVkaXRpbmciO2k6MDtzOjY6ImFjY2VzcyI7YTo3OntzOjI6InJhIjthOjM6e3M6MjoiLzEiO2E6MTp7aTo3O2k6Nzt9czo0OiIvMS8yIjthOjE6e2k6ODtpOjg7fXM6ODoiLzEvMjYvMjciO2E6MTp7aTo1O2k6NTt9fXM6NDoicmRlZiI7YTozOntzOjQ6Ii8xOjciO2E6NDc6e3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7aToxO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7aToxO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtpOjE7czoxMzoibW9kL3BhZ2U6dmlldyI7aToxO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtpOjE7czoxMjoibW9kL3VybDp2aWV3IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVjb3Vyc2UiO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpjcmVhdGUiO2k6MTtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjMyOiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlb3duZW50cmllcyI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnBvc3QiO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7czoyMToibW9vZGxlL2NvdXJzZTpyZXF1ZXN0IjtpOjE7czoyMjoibW9vZGxlL215Om1hbmFnZWJsb2NrcyI7aToxO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtpOjE7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtpOjE7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YWxsIjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtpOjE7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO2k6MTtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7aToxO3M6MTU6Im1vb2RsZS90YWc6ZWRpdCI7aToxO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtpOjE7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtpOjE7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO2k6MTtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO2k6MTtzOjI2OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25maWxlcyI7aToxO3M6MzU6Im1vb2RsZS93ZWJzZXJ2aWNlOmNyZWF0ZW1vYmlsZXRva2VuIjtpOjE7czoyNDoicmVwb3NpdG9yeS9hbGZyZXNjbzp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9ib3huZXQ6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtpOjE7czoyOToicmVwb3NpdG9yeS9mbGlja3JfcHVibGljOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L2ZsaWNrcjp2aWV3IjtpOjE7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L21lcmxvdDp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvcmVjZW50OnZpZXciO2k6MTtzOjE4OiJyZXBvc2l0b3J5L3MzOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtpOjE7czoxOToicmVwb3NpdG9yeS91cmw6dmlldyI7aToxO3M6MjA6InJlcG9zaXRvcnkvdXNlcjp2aWV3IjtpOjE7czoyNToicmVwb3NpdG9yeS93aWtpbWVkaWE6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtpOjE7fXM6NDoiLzE6NSI7YTo2Njp7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtpOjE7czoyMjoiZW5yb2wvc2VsZjp1bmVucm9sc2VsZiI7aToxO3M6MjU6ImdyYWRlcmVwb3J0L292ZXJ2aWV3OnZpZXciO2k6MTtzOjIxOiJncmFkZXJlcG9ydC91c2VyOnZpZXciO2k6MTtzOjM0OiJtb2QvYXNzaWdubWVudDpleHBvcnRvd25zdWJtaXNzaW9uIjtpOjE7czoyMToibW9kL2Fzc2lnbm1lbnQ6c3VibWl0IjtpOjE7czoxOToibW9kL2Fzc2lnbm1lbnQ6dmlldyI7aToxO3M6MTM6Im1vZC9jaGF0OmNoYXQiO2k6MTtzOjE2OiJtb2QvY2hhdDpyZWFkbG9nIjtpOjE7czoxNzoibW9kL2Nob2ljZTpjaG9vc2UiO2k6MTtzOjE2OiJtb2QvZGF0YTpjb21tZW50IjtpOjE7czoyMzoibW9kL2RhdGE6ZXhwb3J0b3duZW50cnkiO2k6MTtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO2k6MTtzOjE5OiJtb2QvZGF0YTp3cml0ZWVudHJ5IjtpOjE7czoyMToibW9kL2ZlZWRiYWNrOmNvbXBsZXRlIjtpOjE7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO2k6MTtzOjI4OiJtb2QvZmVlZGJhY2s6dmlld2FuYWx5c2VwYWdlIjtpOjE7czoyNjoibW9kL2ZvcnVtOmNyZWF0ZWF0dGFjaG1lbnQiO2k6MTtzOjIzOiJtb2QvZm9ydW06ZGVsZXRlb3ducG9zdCI7aToxO3M6MjM6Im1vZC9mb3J1bTpleHBvcnRvd25wb3N0IjtpOjE7czoxOToibW9kL2ZvcnVtOnJlcGx5cG9zdCI7aToxO3M6MjU6Im1vZC9mb3J1bTpzdGFydGRpc2N1c3Npb24iO2k6MTtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO2k6MTtzOjIwOiJtb2QvZm9ydW06dmlld3JhdGluZyI7aToxO3M6MjA6Im1vZC9nbG9zc2FyeTpjb21tZW50IjtpOjE7czoyNzoibW9kL2dsb3NzYXJ5OmV4cG9ydG93bmVudHJ5IjtpOjE7czoxODoibW9kL2dsb3NzYXJ5OndyaXRlIjtpOjE7czoxMjoibW9kL2x0aTp2aWV3IjtpOjE7czoxNjoibW9kL3F1aXo6YXR0ZW1wdCI7aToxO3M6MjU6Im1vZC9xdWl6OnJldmlld215YXR0ZW1wdHMiO2k6MTtzOjEzOiJtb2QvcXVpejp2aWV3IjtpOjE7czoxOToibW9kL3Njb3JtOnNhdmV0cmFjayI7aToxO3M6MTg6Im1vZC9zY29ybTpza2lwdmlldyI7aToxO3M6MjA6Im1vZC9zY29ybTp2aWV3c2NvcmVzIjtpOjE7czoyMjoibW9kL3N1cnZleTpwYXJ0aWNpcGF0ZSI7aToxO3M6MTk6Im1vZC93aWtpOmNyZWF0ZXBhZ2UiO2k6MTtzOjIwOiJtb2Qvd2lraTplZGl0Y29tbWVudCI7aToxO3M6MTc6Im1vZC93aWtpOmVkaXRwYWdlIjtpOjE7czoyMDoibW9kL3dpa2k6dmlld2NvbW1lbnQiO2k6MTtzOjE3OiJtb2Qvd2lraTp2aWV3cGFnZSI7aToxO3M6MjM6Im1vZC93b3Jrc2hvcDpwZWVyYXNzZXNzIjtpOjE7czoxOToibW9kL3dvcmtzaG9wOnN1Ym1pdCI7aToxO3M6MTc6Im1vZC93b3Jrc2hvcDp2aWV3IjtpOjE7czoyODoibW9kL3dvcmtzaG9wOnZpZXdhdXRob3JuYW1lcyI7aToxO3M6MzI6Im1vZC93b3Jrc2hvcDp2aWV3YXV0aG9ycHVibGlzaGVkIjtpOjE7czozNzoibW9kL3dvcmtzaG9wOnZpZXdwdWJsaXNoZWRzdWJtaXNzaW9ucyI7aToxO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtpOjE7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtpOjE7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlbW9kdWxlIjtpOjE7czoyNjoibW9vZGxlL2Jsb2c6bWFuYWdlZXh0ZXJuYWwiO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO2k6MTtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO2k6MTtzOjMwOiJtb29kbGUvY291cnNlOnZpZXdwYXJ0aWNpcGFudHMiO2k6MTtzOjI0OiJtb29kbGUvY291cnNlOnZpZXdzY2FsZXMiO2k6MTtzOjE3OiJtb29kbGUvZ3JhZGU6dmlldyI7aToxO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtpOjE7czoyMDoibW9vZGxlL3F1ZXN0aW9uOmZsYWciO2k6MTtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO2k6MTtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO2k6MTtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO2k6MTtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO2k6MTtzOjI1OiJtb29kbGUvdXNlcjpyZWFkdXNlcmJsb2dzIjtpOjE7czoyNToibW9vZGxlL3VzZXI6cmVhZHVzZXJwb3N0cyI7aToxO3M6MjM6Im1vb2RsZS91c2VyOnZpZXdkZXRhaWxzIjtpOjE7fXM6NDoiLzE6OCI7YTozOntzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO2k6MTtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7fX1zOjEwOiJyZGVmX2NvdW50IjtpOjM7czo4OiJyZGVmX2xjYyI7aTozO3M6NjoibG9hZGVkIjthOjE6e2k6MztpOjE7fXM6NDoidGltZSI7aToxMzM3NzYzMjQ1O3M6MzoicnN3IjthOjA6e319fQ==', 1337759321, 1337763246, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `template` bigint(10) unsigned NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `survey` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer1` text COLLATE utf8_unicode_ci NOT NULL,
  `answer2` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- 转存表中的数据 `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(4) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) unsigned NOT NULL,
  `correlatedtags` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) unsigned NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `tiuserid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ordering` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rules for calculating local wall clock time for users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) unsigned NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL,
  `timecustomized` bigint(10) unsigned DEFAULT NULL,
  `outdated` smallint(3) unsigned DEFAULT '0',
  `modified` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` text COLLATE utf8_unicode_ci,
  `backtrace` text COLLATE utf8_unicode_ci,
  `userid` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging' AUTO_INCREMENT=789 ;

--
-- 转存表中的数据 `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2011120503', '2011120503', 'Upgrade savepoint reached', NULL, '', 0, 1337328149),
(2, 0, 'core', '2011120503', '2011120503', 'Core installed', NULL, '', 0, 1337328175),
(3, 0, 'qtype_calculated', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328175),
(4, 0, 'qtype_calculated', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328176),
(5, 0, 'qtype_calculated', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328176),
(6, 0, 'qtype_calculatedmulti', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328176),
(7, 0, 'qtype_calculatedmulti', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328177),
(8, 0, 'qtype_calculatedmulti', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328177),
(9, 0, 'qtype_calculatedsimple', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328177),
(10, 0, 'qtype_calculatedsimple', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328177),
(11, 0, 'qtype_calculatedsimple', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328177),
(12, 0, 'qtype_description', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328177),
(13, 0, 'qtype_description', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328177),
(14, 0, 'qtype_description', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328177),
(15, 0, 'qtype_essay', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328177),
(16, 0, 'qtype_essay', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328177),
(17, 0, 'qtype_essay', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328178),
(18, 0, 'qtype_match', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328178),
(19, 0, 'qtype_match', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328178),
(20, 0, 'qtype_match', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328178),
(21, 0, 'qtype_missingtype', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328178),
(22, 0, 'qtype_missingtype', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328178),
(23, 0, 'qtype_missingtype', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328179),
(24, 0, 'qtype_multianswer', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328179),
(25, 0, 'qtype_multianswer', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328179),
(26, 0, 'qtype_multianswer', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328179),
(27, 0, 'qtype_multichoice', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328179),
(28, 0, 'qtype_multichoice', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328180),
(29, 0, 'qtype_multichoice', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328180),
(30, 0, 'qtype_numerical', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328180),
(31, 0, 'qtype_numerical', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328181),
(32, 0, 'qtype_numerical', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328181),
(33, 0, 'qtype_random', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328181),
(34, 0, 'qtype_random', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328181),
(35, 0, 'qtype_random', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328181),
(36, 0, 'qtype_randomsamatch', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1337328181),
(37, 0, 'qtype_randomsamatch', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1337328182),
(38, 0, 'qtype_randomsamatch', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1337328182),
(39, 0, 'qtype_shortanswer', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328182),
(40, 0, 'qtype_shortanswer', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328182),
(41, 0, 'qtype_shortanswer', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328182),
(42, 0, 'qtype_truefalse', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328182),
(43, 0, 'qtype_truefalse', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328183),
(44, 0, 'qtype_truefalse', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328183),
(45, 0, 'mod_assignment', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328183),
(46, 0, 'mod_assignment', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328184),
(47, 0, 'mod_chat', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328184),
(48, 0, 'mod_chat', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328188),
(49, 0, 'mod_choice', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328188),
(50, 0, 'mod_choice', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328189),
(51, 0, 'mod_data', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1337328190),
(52, 0, 'mod_data', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1337328193),
(53, 0, 'mod_feedback', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328193),
(54, 0, 'mod_feedback', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328197),
(55, 0, 'mod_folder', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328198),
(56, 0, 'mod_folder', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328198),
(57, 0, 'mod_forum', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328198),
(58, 0, 'mod_forum', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328204),
(59, 0, 'mod_glossary', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328204),
(60, 0, 'mod_glossary', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328208),
(61, 0, 'mod_imscp', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328208),
(62, 0, 'mod_imscp', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328209),
(63, 0, 'mod_label', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328209),
(64, 0, 'mod_label', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328209),
(65, 0, 'mod_lesson', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328209),
(66, 0, 'mod_lesson', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328212),
(67, 0, 'mod_lti', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328212),
(68, 0, 'mod_lti', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328214),
(69, 0, 'mod_page', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328214),
(70, 0, 'mod_page', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328215),
(71, 0, 'mod_quiz', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1337328215),
(72, 0, 'mod_quiz', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1337328219),
(73, 0, 'mod_resource', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328219),
(74, 0, 'mod_resource', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328220),
(75, 0, 'mod_scorm', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1337328220),
(76, 0, 'mod_scorm', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1337328225),
(77, 0, 'mod_survey', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328225),
(78, 0, 'mod_survey', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328229),
(79, 0, 'mod_url', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328229),
(80, 0, 'mod_url', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328230),
(81, 0, 'mod_wiki', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328230),
(82, 0, 'mod_wiki', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328233),
(83, 0, 'mod_workshop', NULL, '2011112902', 'Starting plugin installation', NULL, '', 0, 1337328233),
(84, 0, 'mod_workshop', '2011112902', '2011112902', 'Plugin installed', NULL, '', 0, 1337328241),
(85, 0, 'auth_cas', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328241),
(86, 0, 'auth_cas', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328241),
(87, 0, 'auth_cas', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328241),
(88, 0, 'auth_db', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328241),
(89, 0, 'auth_db', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328241),
(90, 0, 'auth_db', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328241),
(91, 0, 'auth_email', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328241),
(92, 0, 'auth_email', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328241),
(93, 0, 'auth_email', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328242),
(94, 0, 'auth_fc', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328242),
(95, 0, 'auth_fc', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328242),
(96, 0, 'auth_fc', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328242),
(97, 0, 'auth_imap', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328242),
(98, 0, 'auth_imap', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328242),
(99, 0, 'auth_imap', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328242),
(100, 0, 'auth_ldap', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328242),
(101, 0, 'auth_ldap', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328242),
(102, 0, 'auth_ldap', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328243),
(103, 0, 'auth_manual', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328243),
(104, 0, 'auth_manual', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328243),
(105, 0, 'auth_manual', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328243),
(106, 0, 'auth_mnet', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328243),
(107, 0, 'auth_mnet', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328243),
(108, 0, 'auth_mnet', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328244),
(109, 0, 'auth_nntp', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328244),
(110, 0, 'auth_nntp', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328244),
(111, 0, 'auth_nntp', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328244),
(112, 0, 'auth_nologin', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328244),
(113, 0, 'auth_nologin', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328244),
(114, 0, 'auth_nologin', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328245),
(115, 0, 'auth_none', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328245),
(116, 0, 'auth_none', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328245),
(117, 0, 'auth_none', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328245),
(118, 0, 'auth_pam', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328245),
(119, 0, 'auth_pam', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328245),
(120, 0, 'auth_pam', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328245),
(121, 0, 'auth_pop3', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328245),
(122, 0, 'auth_pop3', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328245),
(123, 0, 'auth_pop3', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328245),
(124, 0, 'auth_radius', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328245),
(125, 0, 'auth_radius', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328246),
(126, 0, 'auth_radius', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328246),
(127, 0, 'auth_shibboleth', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328246),
(128, 0, 'auth_shibboleth', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328246),
(129, 0, 'auth_shibboleth', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328246),
(130, 0, 'auth_webservice', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328246),
(131, 0, 'auth_webservice', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328246),
(132, 0, 'auth_webservice', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328246),
(133, 0, 'enrol_authorize', NULL, '2011112902', 'Starting plugin installation', NULL, '', 0, 1337328246),
(134, 0, 'enrol_authorize', '2011112902', '2011112902', 'Upgrade savepoint reached', NULL, '', 0, 1337328247),
(135, 0, 'enrol_authorize', '2011112902', '2011112902', 'Plugin installed', NULL, '', 0, 1337328248),
(136, 0, 'enrol_category', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328248),
(137, 0, 'enrol_category', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328248),
(138, 0, 'enrol_category', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328249),
(139, 0, 'enrol_cohort', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328249),
(140, 0, 'enrol_cohort', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328249),
(141, 0, 'enrol_cohort', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328249),
(142, 0, 'enrol_database', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328249),
(143, 0, 'enrol_database', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328249),
(144, 0, 'enrol_database', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328249),
(145, 0, 'enrol_flatfile', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1337328249),
(146, 0, 'enrol_flatfile', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1337328251),
(147, 0, 'enrol_flatfile', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1337328251),
(148, 0, 'enrol_guest', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1337328251),
(149, 0, 'enrol_guest', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1337328251),
(150, 0, 'enrol_guest', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1337328252),
(151, 0, 'enrol_imsenterprise', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1337328252),
(152, 0, 'enrol_imsenterprise', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1337328252),
(153, 0, 'enrol_imsenterprise', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1337328252),
(154, 0, 'enrol_ldap', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328252),
(155, 0, 'enrol_ldap', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328252),
(156, 0, 'enrol_ldap', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328252),
(157, 0, 'enrol_manual', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1337328253),
(158, 0, 'enrol_manual', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1337328253),
(159, 0, 'enrol_manual', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1337328253),
(160, 0, 'enrol_meta', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1337328253),
(161, 0, 'enrol_meta', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1337328253),
(162, 0, 'enrol_meta', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1337328254),
(163, 0, 'enrol_mnet', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328254),
(164, 0, 'enrol_mnet', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328254),
(165, 0, 'enrol_mnet', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328255),
(166, 0, 'enrol_paypal', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1337328255),
(167, 0, 'enrol_paypal', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1337328255),
(168, 0, 'enrol_paypal', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1337328256),
(169, 0, 'enrol_self', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328256),
(170, 0, 'enrol_self', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328256),
(171, 0, 'enrol_self', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328256),
(172, 0, 'message_email', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328256),
(173, 0, 'message_email', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328257),
(174, 0, 'message_email', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328257),
(175, 0, 'message_jabber', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328257),
(176, 0, 'message_jabber', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328257),
(177, 0, 'message_jabber', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328257),
(178, 0, 'message_popup', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328257),
(179, 0, 'message_popup', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328257),
(180, 0, 'message_popup', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328258),
(181, 0, 'block_activity_modules', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328258),
(182, 0, 'block_activity_modules', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328258),
(183, 0, 'block_admin_bookmarks', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328258),
(184, 0, 'block_admin_bookmarks', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328258),
(185, 0, 'block_blog_menu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328258),
(186, 0, 'block_blog_menu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328258),
(187, 0, 'block_blog_recent', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328258),
(188, 0, 'block_blog_recent', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328258),
(189, 0, 'block_blog_tags', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328258),
(190, 0, 'block_blog_tags', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328259),
(191, 0, 'block_calendar_month', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328259),
(192, 0, 'block_calendar_month', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328259),
(193, 0, 'block_calendar_upcoming', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328259),
(194, 0, 'block_calendar_upcoming', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328259),
(195, 0, 'block_comments', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328259),
(196, 0, 'block_comments', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328259),
(197, 0, 'block_community', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328259),
(198, 0, 'block_community', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328260),
(199, 0, 'block_completionstatus', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328260),
(200, 0, 'block_completionstatus', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328260),
(201, 0, 'block_course_list', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328260),
(202, 0, 'block_course_list', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328260),
(203, 0, 'block_course_overview', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328260),
(204, 0, 'block_course_overview', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328260),
(205, 0, 'block_course_summary', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328260),
(206, 0, 'block_course_summary', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328261),
(207, 0, 'block_feedback', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328261),
(208, 0, 'block_feedback', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328261),
(209, 0, 'block_glossary_random', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328261),
(210, 0, 'block_glossary_random', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328261),
(211, 0, 'block_html', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328261),
(212, 0, 'block_html', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328261),
(213, 0, 'block_login', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328261),
(214, 0, 'block_login', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328262),
(215, 0, 'block_mentees', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328262),
(216, 0, 'block_mentees', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328262),
(217, 0, 'block_messages', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328262),
(218, 0, 'block_messages', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328262),
(219, 0, 'block_mnet_hosts', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328262),
(220, 0, 'block_mnet_hosts', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328263),
(221, 0, 'block_myprofile', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328263),
(222, 0, 'block_myprofile', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328263),
(223, 0, 'block_navigation', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328263),
(224, 0, 'block_navigation', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328263),
(225, 0, 'block_news_items', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328263),
(226, 0, 'block_news_items', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328263),
(227, 0, 'block_online_users', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328263),
(228, 0, 'block_online_users', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328264),
(229, 0, 'block_participants', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328264),
(230, 0, 'block_participants', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328264),
(231, 0, 'block_private_files', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328264),
(232, 0, 'block_private_files', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328264),
(233, 0, 'block_quiz_results', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328264),
(234, 0, 'block_quiz_results', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328264),
(235, 0, 'block_recent_activity', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328264),
(236, 0, 'block_recent_activity', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328264),
(237, 0, 'block_rss_client', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328264),
(238, 0, 'block_rss_client', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328265),
(239, 0, 'block_search_forums', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328265),
(240, 0, 'block_search_forums', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328265),
(241, 0, 'block_section_links', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328265),
(242, 0, 'block_section_links', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328265),
(243, 0, 'block_selfcompletion', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328265),
(244, 0, 'block_selfcompletion', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328266),
(245, 0, 'block_settings', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328266),
(246, 0, 'block_settings', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328266),
(247, 0, 'block_site_main_menu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328266),
(248, 0, 'block_site_main_menu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328266),
(249, 0, 'block_social_activities', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328266),
(250, 0, 'block_social_activities', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328266),
(251, 0, 'block_tag_flickr', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328266),
(252, 0, 'block_tag_flickr', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328266),
(253, 0, 'block_tag_youtube', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328266),
(254, 0, 'block_tag_youtube', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328267),
(255, 0, 'block_tags', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328267),
(256, 0, 'block_tags', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328267),
(257, 0, 'filter_activitynames', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328267),
(258, 0, 'filter_activitynames', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328268),
(259, 0, 'filter_activitynames', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328268),
(260, 0, 'filter_algebra', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328268),
(261, 0, 'filter_algebra', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328268),
(262, 0, 'filter_algebra', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328268),
(263, 0, 'filter_censor', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328268),
(264, 0, 'filter_censor', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328268),
(265, 0, 'filter_censor', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328268),
(266, 0, 'filter_data', NULL, '2011102800', 'Starting plugin installation', NULL, '', 0, 1337328268),
(267, 0, 'filter_data', '2011102800', '2011102800', 'Upgrade savepoint reached', NULL, '', 0, 1337328268),
(268, 0, 'filter_data', '2011102800', '2011102800', 'Plugin installed', NULL, '', 0, 1337328269),
(269, 0, 'filter_emailprotect', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328269),
(270, 0, 'filter_emailprotect', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328269),
(271, 0, 'filter_emailprotect', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328269),
(272, 0, 'filter_emoticon', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328269),
(273, 0, 'filter_emoticon', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328269),
(274, 0, 'filter_emoticon', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328269),
(275, 0, 'filter_glossary', NULL, '2011102800', 'Starting plugin installation', NULL, '', 0, 1337328269),
(276, 0, 'filter_glossary', '2011102800', '2011102800', 'Upgrade savepoint reached', NULL, '', 0, 1337328269),
(277, 0, 'filter_glossary', '2011102800', '2011102800', 'Plugin installed', NULL, '', 0, 1337328269),
(278, 0, 'filter_mediaplugin', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328270),
(279, 0, 'filter_mediaplugin', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328270),
(280, 0, 'filter_mediaplugin', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328270),
(281, 0, 'filter_multilang', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328270),
(282, 0, 'filter_multilang', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328270),
(283, 0, 'filter_multilang', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328270),
(284, 0, 'filter_tex', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328270),
(285, 0, 'filter_tex', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328270),
(286, 0, 'filter_tex', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328270),
(287, 0, 'filter_tidy', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328270),
(288, 0, 'filter_tidy', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328270),
(289, 0, 'filter_tidy', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328271),
(290, 0, 'filter_urltolink', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328271),
(291, 0, 'filter_urltolink', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328271),
(292, 0, 'filter_urltolink', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328271),
(293, 0, 'editor_textarea', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328271),
(294, 0, 'editor_textarea', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328271),
(295, 0, 'editor_textarea', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328271),
(296, 0, 'editor_tinymce', NULL, '2012030300', 'Starting plugin installation', NULL, '', 0, 1337328271),
(297, 0, 'editor_tinymce', '2012030300', '2012030300', 'Upgrade savepoint reached', NULL, '', 0, 1337328271),
(298, 0, 'editor_tinymce', '2012030300', '2012030300', 'Plugin installed', NULL, '', 0, 1337328271),
(299, 0, 'format_scorm', NULL, '2011120100', 'Starting plugin installation', NULL, '', 0, 1337328271),
(300, 0, 'format_scorm', '2011120100', '2011120100', 'Upgrade savepoint reached', NULL, '', 0, 1337328271),
(301, 0, 'format_scorm', '2011120100', '2011120100', 'Plugin installed', NULL, '', 0, 1337328272),
(302, 0, 'format_social', NULL, '2011120100', 'Starting plugin installation', NULL, '', 0, 1337328272),
(303, 0, 'format_social', '2011120100', '2011120100', 'Upgrade savepoint reached', NULL, '', 0, 1337328272),
(304, 0, 'format_social', '2011120100', '2011120100', 'Plugin installed', NULL, '', 0, 1337328272),
(305, 0, 'format_topics', NULL, '2011120100', 'Starting plugin installation', NULL, '', 0, 1337328272),
(306, 0, 'format_topics', '2011120100', '2011120100', 'Upgrade savepoint reached', NULL, '', 0, 1337328272),
(307, 0, 'format_topics', '2011120100', '2011120100', 'Plugin installed', NULL, '', 0, 1337328272),
(308, 0, 'format_weeks', NULL, '2011120100', 'Starting plugin installation', NULL, '', 0, 1337328272),
(309, 0, 'format_weeks', '2011120100', '2011120100', 'Upgrade savepoint reached', NULL, '', 0, 1337328272),
(310, 0, 'format_weeks', '2011120100', '2011120100', 'Plugin installed', NULL, '', 0, 1337328273),
(311, 0, 'profilefield_checkbox', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328273),
(312, 0, 'profilefield_checkbox', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328273),
(313, 0, 'profilefield_checkbox', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328273),
(314, 0, 'profilefield_datetime', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328273),
(315, 0, 'profilefield_datetime', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328273),
(316, 0, 'profilefield_datetime', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328273),
(317, 0, 'profilefield_menu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328273),
(318, 0, 'profilefield_menu', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328273),
(319, 0, 'profilefield_menu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328274),
(320, 0, 'profilefield_text', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328274),
(321, 0, 'profilefield_text', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328274),
(322, 0, 'profilefield_text', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328274),
(323, 0, 'profilefield_textarea', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328274),
(324, 0, 'profilefield_textarea', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328274),
(325, 0, 'profilefield_textarea', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328274),
(326, 0, 'report_backups', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328274),
(327, 0, 'report_backups', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328274),
(328, 0, 'report_backups', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328274),
(329, 0, 'report_completion', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328274),
(330, 0, 'report_completion', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328274),
(331, 0, 'report_completion', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328275),
(332, 0, 'report_configlog', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328275),
(333, 0, 'report_configlog', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328275),
(334, 0, 'report_configlog', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328275),
(335, 0, 'report_courseoverview', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328275),
(336, 0, 'report_courseoverview', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328275),
(337, 0, 'report_courseoverview', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328275),
(338, 0, 'report_log', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328275),
(339, 0, 'report_log', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328275),
(340, 0, 'report_log', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328276),
(341, 0, 'report_loglive', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328276),
(342, 0, 'report_loglive', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328276),
(343, 0, 'report_loglive', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328276),
(344, 0, 'report_outline', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328276),
(345, 0, 'report_outline', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328276),
(346, 0, 'report_outline', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328277),
(347, 0, 'report_participation', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328277),
(348, 0, 'report_participation', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328277),
(349, 0, 'report_participation', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328277),
(350, 0, 'report_progress', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328277),
(351, 0, 'report_progress', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328277),
(352, 0, 'report_progress', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328278),
(353, 0, 'report_questioninstances', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328278),
(354, 0, 'report_questioninstances', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328278),
(355, 0, 'report_questioninstances', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328278),
(356, 0, 'report_security', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328278),
(357, 0, 'report_security', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328278),
(358, 0, 'report_security', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328278),
(359, 0, 'report_stats', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1337328278),
(360, 0, 'report_stats', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1337328278),
(361, 0, 'report_stats', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1337328279),
(362, 0, 'gradeexport_ods', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328279),
(363, 0, 'gradeexport_ods', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328279),
(364, 0, 'gradeexport_ods', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328279),
(365, 0, 'gradeexport_txt', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328279),
(366, 0, 'gradeexport_txt', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328279),
(367, 0, 'gradeexport_txt', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328280),
(368, 0, 'gradeexport_xls', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328280),
(369, 0, 'gradeexport_xls', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328280),
(370, 0, 'gradeexport_xls', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328280),
(371, 0, 'gradeexport_xml', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328280),
(372, 0, 'gradeexport_xml', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328280),
(373, 0, 'gradeexport_xml', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328280),
(374, 0, 'gradeimport_csv', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328280),
(375, 0, 'gradeimport_csv', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328280),
(376, 0, 'gradeimport_csv', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328281),
(377, 0, 'gradeimport_xml', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328281),
(378, 0, 'gradeimport_xml', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328281),
(379, 0, 'gradeimport_xml', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328281),
(380, 0, 'gradereport_grader', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328281),
(381, 0, 'gradereport_grader', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328281),
(382, 0, 'gradereport_grader', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328281),
(383, 0, 'gradereport_outcomes', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328281),
(384, 0, 'gradereport_outcomes', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328281),
(385, 0, 'gradereport_outcomes', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328282),
(386, 0, 'gradereport_overview', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328282),
(387, 0, 'gradereport_overview', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328282),
(388, 0, 'gradereport_overview', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328282),
(389, 0, 'gradereport_user', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328282),
(390, 0, 'gradereport_user', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328282),
(391, 0, 'gradereport_user', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328282),
(392, 0, 'gradingform_rubric', NULL, '2011110900', 'Starting plugin installation', NULL, '', 0, 1337328282),
(393, 0, 'gradingform_rubric', '2011110900', '2011110900', 'Upgrade savepoint reached', NULL, '', 0, 1337328284),
(394, 0, 'gradingform_rubric', '2011110900', '2011110900', 'Plugin installed', NULL, '', 0, 1337328284),
(395, 0, 'mnetservice_enrol', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328284),
(396, 0, 'mnetservice_enrol', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328285),
(397, 0, 'mnetservice_enrol', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328285),
(398, 0, 'webservice_amf', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328285),
(399, 0, 'webservice_amf', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328285),
(400, 0, 'webservice_amf', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328286),
(401, 0, 'webservice_rest', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328286),
(402, 0, 'webservice_rest', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328286),
(403, 0, 'webservice_rest', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328286),
(404, 0, 'webservice_soap', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328286),
(405, 0, 'webservice_soap', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328286),
(406, 0, 'webservice_soap', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328286),
(407, 0, 'webservice_xmlrpc', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328286),
(408, 0, 'webservice_xmlrpc', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328286),
(409, 0, 'webservice_xmlrpc', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328286),
(410, 0, 'repository_alfresco', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328286),
(411, 0, 'repository_alfresco', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328286),
(412, 0, 'repository_alfresco', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328287),
(413, 0, 'repository_boxnet', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328287),
(414, 0, 'repository_boxnet', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328287),
(415, 0, 'repository_boxnet', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328287),
(416, 0, 'repository_coursefiles', NULL, '2012010100', 'Starting plugin installation', NULL, '', 0, 1337328287),
(417, 0, 'repository_coursefiles', '2012010100', '2012010100', 'Upgrade savepoint reached', NULL, '', 0, 1337328287),
(418, 0, 'repository_coursefiles', '2012010100', '2012010100', 'Plugin installed', NULL, '', 0, 1337328287),
(419, 0, 'repository_dropbox', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328287),
(420, 0, 'repository_dropbox', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328287),
(421, 0, 'repository_dropbox', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328288),
(422, 0, 'repository_filesystem', NULL, '2012010100', 'Starting plugin installation', NULL, '', 0, 1337328288),
(423, 0, 'repository_filesystem', '2012010100', '2012010100', 'Upgrade savepoint reached', NULL, '', 0, 1337328288),
(424, 0, 'repository_filesystem', '2012010100', '2012010100', 'Plugin installed', NULL, '', 0, 1337328288),
(425, 0, 'repository_flickr', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328288),
(426, 0, 'repository_flickr', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328288),
(427, 0, 'repository_flickr', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328288),
(428, 0, 'repository_flickr_public', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328288),
(429, 0, 'repository_flickr_public', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328288),
(430, 0, 'repository_flickr_public', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328289),
(431, 0, 'repository_googledocs', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328289),
(432, 0, 'repository_googledocs', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328289),
(433, 0, 'repository_googledocs', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328289),
(434, 0, 'repository_local', NULL, '2012010100', 'Starting plugin installation', NULL, '', 0, 1337328289),
(435, 0, 'repository_local', '2012010100', '2012010100', 'Upgrade savepoint reached', NULL, '', 0, 1337328289),
(436, 0, 'repository_local', '2012010100', '2012010100', 'Plugin installed', NULL, '', 0, 1337328289),
(437, 0, 'repository_merlot', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328289),
(438, 0, 'repository_merlot', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328289),
(439, 0, 'repository_merlot', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328290),
(440, 0, 'repository_picasa', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328290),
(441, 0, 'repository_picasa', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328290),
(442, 0, 'repository_picasa', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328290),
(443, 0, 'repository_recent', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328290),
(444, 0, 'repository_recent', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328290),
(445, 0, 'repository_recent', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328290),
(446, 0, 'repository_s3', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328290),
(447, 0, 'repository_s3', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328290),
(448, 0, 'repository_s3', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328291),
(449, 0, 'repository_upload', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328291),
(450, 0, 'repository_upload', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328291),
(451, 0, 'repository_upload', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328291),
(452, 0, 'repository_url', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328291),
(453, 0, 'repository_url', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328291),
(454, 0, 'repository_url', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328291),
(455, 0, 'repository_user', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328291),
(456, 0, 'repository_user', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328292),
(457, 0, 'repository_user', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328292),
(458, 0, 'repository_webdav', NULL, '2012010100', 'Starting plugin installation', NULL, '', 0, 1337328292),
(459, 0, 'repository_webdav', '2012010100', '2012010100', 'Upgrade savepoint reached', NULL, '', 0, 1337328292),
(460, 0, 'repository_webdav', '2012010100', '2012010100', 'Plugin installed', NULL, '', 0, 1337328292),
(461, 0, 'repository_wikimedia', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328292),
(462, 0, 'repository_wikimedia', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328292),
(463, 0, 'repository_wikimedia', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328293),
(464, 0, 'repository_youtube', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328293),
(465, 0, 'repository_youtube', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328293),
(466, 0, 'repository_youtube', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328293),
(467, 0, 'portfolio_boxnet', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328293),
(468, 0, 'portfolio_boxnet', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328293),
(469, 0, 'portfolio_boxnet', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328293),
(470, 0, 'portfolio_download', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328293),
(471, 0, 'portfolio_download', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328293),
(472, 0, 'portfolio_download', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328293),
(473, 0, 'portfolio_flickr', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328293),
(474, 0, 'portfolio_flickr', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328294),
(475, 0, 'portfolio_flickr', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328294),
(476, 0, 'portfolio_googledocs', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328294),
(477, 0, 'portfolio_googledocs', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328294),
(478, 0, 'portfolio_googledocs', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328295),
(479, 0, 'portfolio_mahara', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328295),
(480, 0, 'portfolio_mahara', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328295),
(481, 0, 'portfolio_mahara', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328296);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(482, 0, 'portfolio_picasa', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328296),
(483, 0, 'portfolio_picasa', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328296),
(484, 0, 'portfolio_picasa', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328296),
(485, 0, 'qbehaviour_adaptive', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328296),
(486, 0, 'qbehaviour_adaptive', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328296),
(487, 0, 'qbehaviour_adaptive', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328296),
(488, 0, 'qbehaviour_adaptivenopenalty', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328296),
(489, 0, 'qbehaviour_adaptivenopenalty', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328296),
(490, 0, 'qbehaviour_adaptivenopenalty', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328296),
(491, 0, 'qbehaviour_deferredcbm', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328296),
(492, 0, 'qbehaviour_deferredcbm', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328296),
(493, 0, 'qbehaviour_deferredcbm', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328297),
(494, 0, 'qbehaviour_deferredfeedback', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328297),
(495, 0, 'qbehaviour_deferredfeedback', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328297),
(496, 0, 'qbehaviour_deferredfeedback', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328297),
(497, 0, 'qbehaviour_immediatecbm', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328297),
(498, 0, 'qbehaviour_immediatecbm', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328297),
(499, 0, 'qbehaviour_immediatecbm', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328297),
(500, 0, 'qbehaviour_immediatefeedback', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328297),
(501, 0, 'qbehaviour_immediatefeedback', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328297),
(502, 0, 'qbehaviour_immediatefeedback', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328297),
(503, 0, 'qbehaviour_informationitem', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328297),
(504, 0, 'qbehaviour_informationitem', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328297),
(505, 0, 'qbehaviour_informationitem', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328297),
(506, 0, 'qbehaviour_interactive', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328298),
(507, 0, 'qbehaviour_interactive', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328298),
(508, 0, 'qbehaviour_interactive', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328298),
(509, 0, 'qbehaviour_interactivecountback', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328298),
(510, 0, 'qbehaviour_interactivecountback', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328298),
(511, 0, 'qbehaviour_interactivecountback', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328298),
(512, 0, 'qbehaviour_manualgraded', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328298),
(513, 0, 'qbehaviour_manualgraded', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328298),
(514, 0, 'qbehaviour_manualgraded', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328298),
(515, 0, 'qbehaviour_missing', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328298),
(516, 0, 'qbehaviour_missing', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328298),
(517, 0, 'qbehaviour_missing', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328298),
(518, 0, 'qformat_aiken', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328299),
(519, 0, 'qformat_aiken', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328299),
(520, 0, 'qformat_aiken', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328299),
(521, 0, 'qformat_blackboard', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328299),
(522, 0, 'qformat_blackboard', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328299),
(523, 0, 'qformat_blackboard', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328299),
(524, 0, 'qformat_blackboard_six', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328299),
(525, 0, 'qformat_blackboard_six', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328299),
(526, 0, 'qformat_blackboard_six', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328299),
(527, 0, 'qformat_examview', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328299),
(528, 0, 'qformat_examview', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328299),
(529, 0, 'qformat_examview', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328299),
(530, 0, 'qformat_gift', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328299),
(531, 0, 'qformat_gift', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328300),
(532, 0, 'qformat_gift', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328300),
(533, 0, 'qformat_learnwise', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328300),
(534, 0, 'qformat_learnwise', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328300),
(535, 0, 'qformat_learnwise', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328300),
(536, 0, 'qformat_missingword', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328300),
(537, 0, 'qformat_missingword', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328300),
(538, 0, 'qformat_missingword', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328300),
(539, 0, 'qformat_multianswer', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328300),
(540, 0, 'qformat_multianswer', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328300),
(541, 0, 'qformat_multianswer', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328300),
(542, 0, 'qformat_webct', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328301),
(543, 0, 'qformat_webct', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328301),
(544, 0, 'qformat_webct', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328301),
(545, 0, 'qformat_xhtml', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328301),
(546, 0, 'qformat_xhtml', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328301),
(547, 0, 'qformat_xhtml', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328301),
(548, 0, 'qformat_xml', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1337328301),
(549, 0, 'qformat_xml', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1337328301),
(550, 0, 'qformat_xml', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1337328301),
(551, 0, 'tool_bloglevelupgrade', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328301),
(552, 0, 'tool_bloglevelupgrade', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328301),
(553, 0, 'tool_bloglevelupgrade', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328302),
(554, 0, 'tool_capability', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328302),
(555, 0, 'tool_capability', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328302),
(556, 0, 'tool_capability', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328302),
(557, 0, 'tool_customlang', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328302),
(558, 0, 'tool_customlang', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328303),
(559, 0, 'tool_customlang', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328303),
(560, 0, 'tool_dbtransfer', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328303),
(561, 0, 'tool_dbtransfer', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328303),
(562, 0, 'tool_dbtransfer', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328303),
(563, 0, 'tool_generator', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328303),
(564, 0, 'tool_generator', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328304),
(565, 0, 'tool_generator', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328304),
(566, 0, 'tool_health', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328304),
(567, 0, 'tool_health', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328304),
(568, 0, 'tool_health', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328304),
(569, 0, 'tool_innodb', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328304),
(570, 0, 'tool_innodb', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328304),
(571, 0, 'tool_innodb', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328304),
(572, 0, 'tool_langimport', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328304),
(573, 0, 'tool_langimport', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328304),
(574, 0, 'tool_langimport', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328304),
(575, 0, 'tool_multilangupgrade', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328305),
(576, 0, 'tool_multilangupgrade', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328305),
(577, 0, 'tool_multilangupgrade', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328305),
(578, 0, 'tool_profiling', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328305),
(579, 0, 'tool_profiling', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328305),
(580, 0, 'tool_profiling', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328305),
(581, 0, 'tool_qeupgradehelper', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328305),
(582, 0, 'tool_qeupgradehelper', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328306),
(583, 0, 'tool_qeupgradehelper', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328306),
(584, 0, 'tool_replace', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328306),
(585, 0, 'tool_replace', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328306),
(586, 0, 'tool_replace', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328306),
(587, 0, 'tool_spamcleaner', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328306),
(588, 0, 'tool_spamcleaner', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328306),
(589, 0, 'tool_spamcleaner', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328306),
(590, 0, 'tool_timezoneimport', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328306),
(591, 0, 'tool_timezoneimport', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328306),
(592, 0, 'tool_timezoneimport', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328306),
(593, 0, 'tool_unittest', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328306),
(594, 0, 'tool_unittest', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328306),
(595, 0, 'tool_unittest', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328307),
(596, 0, 'tool_unsuproles', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328307),
(597, 0, 'tool_unsuproles', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328307),
(598, 0, 'tool_unsuproles', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328307),
(599, 0, 'tool_uploaduser', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328307),
(600, 0, 'tool_uploaduser', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328307),
(601, 0, 'tool_uploaduser', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328307),
(602, 0, 'tool_xmldb', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1337328307),
(603, 0, 'tool_xmldb', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1337328307),
(604, 0, 'tool_xmldb', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1337328307),
(605, 0, 'theme_afterburner', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328308),
(606, 0, 'theme_afterburner', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328308),
(607, 0, 'theme_afterburner', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328308),
(608, 0, 'theme_anomaly', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328308),
(609, 0, 'theme_anomaly', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328308),
(610, 0, 'theme_anomaly', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328308),
(611, 0, 'theme_arialist', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328308),
(612, 0, 'theme_arialist', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328308),
(613, 0, 'theme_arialist', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328308),
(614, 0, 'theme_base', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328308),
(615, 0, 'theme_base', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328308),
(616, 0, 'theme_base', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328308),
(617, 0, 'theme_binarius', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328308),
(618, 0, 'theme_binarius', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328309),
(619, 0, 'theme_binarius', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328309),
(620, 0, 'theme_boxxie', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328309),
(621, 0, 'theme_boxxie', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328309),
(622, 0, 'theme_boxxie', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328309),
(623, 0, 'theme_brick', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328309),
(624, 0, 'theme_brick', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328309),
(625, 0, 'theme_brick', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328309),
(626, 0, 'theme_canvas', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328309),
(627, 0, 'theme_canvas', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328309),
(628, 0, 'theme_canvas', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328309),
(629, 0, 'theme_formal_white', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328309),
(630, 0, 'theme_formal_white', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328309),
(631, 0, 'theme_formal_white', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328310),
(632, 0, 'theme_formfactor', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328310),
(633, 0, 'theme_formfactor', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328310),
(634, 0, 'theme_formfactor', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328310),
(635, 0, 'theme_fusion', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328310),
(636, 0, 'theme_fusion', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328310),
(637, 0, 'theme_fusion', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328310),
(638, 0, 'theme_leatherbound', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328310),
(639, 0, 'theme_leatherbound', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328310),
(640, 0, 'theme_leatherbound', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328310),
(641, 0, 'theme_magazine', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328310),
(642, 0, 'theme_magazine', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328310),
(643, 0, 'theme_magazine', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328311),
(644, 0, 'theme_mymobile', NULL, '2011101801', 'Starting plugin installation', NULL, '', 0, 1337328311),
(645, 0, 'theme_mymobile', '2011101801', '2011101801', 'Upgrade savepoint reached', NULL, '', 0, 1337328311),
(646, 0, 'theme_mymobile', '2011101801', '2011101801', 'Plugin installed', NULL, '', 0, 1337328311),
(647, 0, 'theme_nimble', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328311),
(648, 0, 'theme_nimble', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328311),
(649, 0, 'theme_nimble', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328311),
(650, 0, 'theme_nonzero', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328311),
(651, 0, 'theme_nonzero', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328311),
(652, 0, 'theme_nonzero', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328311),
(653, 0, 'theme_overlay', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328312),
(654, 0, 'theme_overlay', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328312),
(655, 0, 'theme_overlay', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328312),
(656, 0, 'theme_serenity', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328312),
(657, 0, 'theme_serenity', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328312),
(658, 0, 'theme_serenity', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328312),
(659, 0, 'theme_sky_high', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328312),
(660, 0, 'theme_sky_high', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328312),
(661, 0, 'theme_sky_high', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328312),
(662, 0, 'theme_splash', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328312),
(663, 0, 'theme_splash', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328312),
(664, 0, 'theme_splash', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328313),
(665, 0, 'theme_standard', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328313),
(666, 0, 'theme_standard', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328313),
(667, 0, 'theme_standard', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328313),
(668, 0, 'theme_standardold', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1337328313),
(669, 0, 'theme_standardold', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1337328313),
(670, 0, 'theme_standardold', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1337328313),
(671, 0, 'assignment_offline', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328313),
(672, 0, 'assignment_offline', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328313),
(673, 0, 'assignment_offline', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328313),
(674, 0, 'assignment_online', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328313),
(675, 0, 'assignment_online', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328313),
(676, 0, 'assignment_online', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328314),
(677, 0, 'assignment_upload', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328314),
(678, 0, 'assignment_upload', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328314),
(679, 0, 'assignment_upload', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328314),
(680, 0, 'assignment_uploadsingle', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328314),
(681, 0, 'assignment_uploadsingle', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328314),
(682, 0, 'assignment_uploadsingle', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328314),
(683, 0, 'datafield_checkbox', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328314),
(684, 0, 'datafield_checkbox', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328314),
(685, 0, 'datafield_checkbox', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328314),
(686, 0, 'datafield_date', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328314),
(687, 0, 'datafield_date', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328314),
(688, 0, 'datafield_date', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328314),
(689, 0, 'datafield_file', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328315),
(690, 0, 'datafield_file', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328315),
(691, 0, 'datafield_file', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328315),
(692, 0, 'datafield_latlong', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328315),
(693, 0, 'datafield_latlong', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328315),
(694, 0, 'datafield_latlong', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328315),
(695, 0, 'datafield_menu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328315),
(696, 0, 'datafield_menu', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328315),
(697, 0, 'datafield_menu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328316),
(698, 0, 'datafield_multimenu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328316),
(699, 0, 'datafield_multimenu', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328316),
(700, 0, 'datafield_multimenu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328316),
(701, 0, 'datafield_number', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328316),
(702, 0, 'datafield_number', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328316),
(703, 0, 'datafield_number', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328317),
(704, 0, 'datafield_picture', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328317),
(705, 0, 'datafield_picture', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328317),
(706, 0, 'datafield_picture', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328317),
(707, 0, 'datafield_radiobutton', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328317),
(708, 0, 'datafield_radiobutton', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328317),
(709, 0, 'datafield_radiobutton', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328317),
(710, 0, 'datafield_text', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328317),
(711, 0, 'datafield_text', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328317),
(712, 0, 'datafield_text', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328317),
(713, 0, 'datafield_textarea', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328317),
(714, 0, 'datafield_textarea', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328317),
(715, 0, 'datafield_textarea', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328318),
(716, 0, 'datafield_url', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328318),
(717, 0, 'datafield_url', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328318),
(718, 0, 'datafield_url', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328318),
(719, 0, 'datapreset_imagegallery', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1337328318),
(720, 0, 'datapreset_imagegallery', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1337328318),
(721, 0, 'datapreset_imagegallery', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1337328318),
(722, 0, 'quiz_grading', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1337328318),
(723, 0, 'quiz_grading', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1337328318),
(724, 0, 'quiz_grading', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1337328319),
(725, 0, 'quiz_overview', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1337328319),
(726, 0, 'quiz_overview', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1337328319),
(727, 0, 'quiz_overview', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1337328319),
(728, 0, 'quiz_responses', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1337328319),
(729, 0, 'quiz_responses', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1337328319),
(730, 0, 'quiz_responses', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1337328319),
(731, 0, 'quiz_statistics', NULL, '2011122300', 'Starting plugin installation', NULL, '', 0, 1337328319),
(732, 0, 'quiz_statistics', '2011122300', '2011122300', 'Upgrade savepoint reached', NULL, '', 0, 1337328320),
(733, 0, 'quiz_statistics', '2011122300', '2011122300', 'Plugin installed', NULL, '', 0, 1337328321),
(734, 0, 'quizaccess_delaybetweenattempts', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1337328321),
(735, 0, 'quizaccess_delaybetweenattempts', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1337328321),
(736, 0, 'quizaccess_delaybetweenattempts', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1337328321),
(737, 0, 'quizaccess_ipaddress', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1337328321),
(738, 0, 'quizaccess_ipaddress', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1337328321),
(739, 0, 'quizaccess_ipaddress', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1337328321),
(740, 0, 'quizaccess_numattempts', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1337328321),
(741, 0, 'quizaccess_numattempts', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1337328321),
(742, 0, 'quizaccess_numattempts', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1337328321),
(743, 0, 'quizaccess_openclosedate', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1337328321),
(744, 0, 'quizaccess_openclosedate', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1337328321),
(745, 0, 'quizaccess_openclosedate', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1337328322),
(746, 0, 'quizaccess_password', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1337328322),
(747, 0, 'quizaccess_password', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1337328322),
(748, 0, 'quizaccess_password', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1337328322),
(749, 0, 'quizaccess_safebrowser', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1337328322),
(750, 0, 'quizaccess_safebrowser', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1337328322),
(751, 0, 'quizaccess_safebrowser', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1337328322),
(752, 0, 'quizaccess_securewindow', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1337328322),
(753, 0, 'quizaccess_securewindow', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1337328322),
(754, 0, 'quizaccess_securewindow', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1337328322),
(755, 0, 'quizaccess_timelimit', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1337328322),
(756, 0, 'quizaccess_timelimit', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1337328322),
(757, 0, 'quizaccess_timelimit', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1337328323),
(758, 0, 'scormreport_basic', NULL, '2011071100', 'Starting plugin installation', NULL, '', 0, 1337328323),
(759, 0, 'scormreport_basic', '2011071100', '2011071100', 'Upgrade savepoint reached', NULL, '', 0, 1337328323),
(760, 0, 'scormreport_basic', '2011071100', '2011071100', 'Plugin installed', NULL, '', 0, 1337328323),
(761, 0, 'scormreport_interactions', NULL, '2011110100', 'Starting plugin installation', NULL, '', 0, 1337328323),
(762, 0, 'scormreport_interactions', '2011110100', '2011110100', 'Upgrade savepoint reached', NULL, '', 0, 1337328323),
(763, 0, 'scormreport_interactions', '2011110100', '2011110100', 'Plugin installed', NULL, '', 0, 1337328323),
(764, 0, 'workshopform_accumulative', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1337328323),
(765, 0, 'workshopform_accumulative', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1337328324),
(766, 0, 'workshopform_accumulative', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1337328324),
(767, 0, 'workshopform_comments', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1337328324),
(768, 0, 'workshopform_comments', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1337328324),
(769, 0, 'workshopform_comments', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1337328325),
(770, 0, 'workshopform_numerrors', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1337328325),
(771, 0, 'workshopform_numerrors', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1337328325),
(772, 0, 'workshopform_numerrors', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1337328326),
(773, 0, 'workshopform_rubric', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1337328326),
(774, 0, 'workshopform_rubric', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1337328327),
(775, 0, 'workshopform_rubric', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1337328327),
(776, 0, 'workshopallocation_manual', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1337328327),
(777, 0, 'workshopallocation_manual', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1337328327),
(778, 0, 'workshopallocation_manual', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1337328328),
(779, 0, 'workshopallocation_random', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1337328328),
(780, 0, 'workshopallocation_random', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1337328328),
(781, 0, 'workshopallocation_random', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1337328328),
(782, 0, 'workshopeval_best', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1337328328),
(783, 0, 'workshopeval_best', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1337328328),
(784, 0, 'workshopeval_best', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1337328329),
(785, 0, 'auth_googleoauth2', NULL, '2012010900', 'Starting plugin installation', NULL, '', 2, 1337590615),
(786, 0, 'auth_googleoauth2', '2012010900', '2012010900', 'Upgrade savepoint reached', NULL, '', 2, 1337590615),
(787, 0, 'auth_googleoauth2', '2012010900', '2012010900', 'Plugin installed', NULL, '', 2, 1337590616),
(788, 2, 'core', '2011120503', '2011120503', 'Exception: plugin_defective_exception', 'Plugin "block/sgblock_mycourses" is defective or outdated, can not continue, sorry.', '* line 612 of \\lib\\upgradelib.php: plugin_defective_exception thrown\n* line 273 of \\lib\\upgradelib.php: call to upgrade_plugins_blocks()\n* line 1437 of \\lib\\upgradelib.php: call to upgrade_plugins()\n* line 269 of \\admin\\index.php: call to upgrade_noncore()\n', 2, 1337590616);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `externalurl` text COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text COLLATE utf8_unicode_ci,
  `parameters` text COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(70) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mailformat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `htmleditor` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ajax` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autosubscribe` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) unsigned NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenreader` tinyint(1) NOT NULL DEFAULT '0',
  `guided` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `htmleditor`, `ajax`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `screenreader`, `guided`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '0fc7706ebbe08b1b49efa0a21bb57631', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', '', '99', 1337328136, 1337668123, 1337595088, 1337668122, '127.0.0.1', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 0, 1, 0, 2, 1, 1, 1, 0, 0, 1337328136, 0, NULL, 0, 1),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '2008c23ecd98e8df65c96b520b5eaf11', '', 'Admin', 'User', 'admin@admin.com', 0, '', '', '', '', '', '', '', '', '', '', 'HongKong', 'HK', 'en', '', '99', 1337328450, 1337763718, 1337590513, 1337757422, '127.0.0.1', '', 0, '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1337328450, 0, NULL, 0, 1),
(3, 'googleoauth2', 1, 0, 0, 0, 1, 'social_user_1', 'not cached', '', 'Jinglue', 'Li', 'lijinglue@live.com', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', '', '99', 1337593409, 1337763245, 1337759316, 1337759321, '127.0.0.1', '', 0, '', NULL, 0, 1, 0, 2, 1, 1, 1, 0, 1337593409, 1337593409, 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `enrolid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(2, 0, 4, 3, 1337731200, 0, 2, 1337758292, 1337758292),
(3, 0, 4, 2, 1337731200, 0, 2, 1337763215, 1337763215);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fieldid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `categoryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `visible` smallint(4) unsigned NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `signup` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(2, 2, 3, 1337763718),
(3, 3, 3, 1337763245);

-- --------------------------------------------------------

--
-- 表的结构 `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(2, 2, 'email_bounce_count', '1'),
(3, 2, 'email_send_count', '1'),
(4, 2, 'docked_block_instance_4', '0'),
(5, 2, 'docked_block_instance_5', '0');

-- --------------------------------------------------------

--
-- 表的结构 `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL,
  `instance` bigint(10) unsigned DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expiry` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `recursive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` mediumtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `editbegin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `editend` bigint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `frompageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `topageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lockedat` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timerendered` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageviews` bigint(10) unsigned NOT NULL DEFAULT '0',
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL,
  `phase` smallint(3) unsigned DEFAULT '0',
  `useexamples` tinyint(2) unsigned DEFAULT '0',
  `usepeerassessment` tinyint(2) unsigned DEFAULT '0',
  `useselfassessment` tinyint(2) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) unsigned DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) unsigned DEFAULT '0',
  `nattachments` smallint(3) unsigned DEFAULT '0',
  `latesubmissions` tinyint(2) unsigned DEFAULT '0',
  `maxbytes` bigint(10) unsigned DEFAULT '100000',
  `examplesmode` smallint(3) unsigned DEFAULT '0',
  `submissionstart` bigint(10) unsigned DEFAULT '0',
  `submissionend` bigint(10) unsigned DEFAULT '0',
  `assessmentstart` bigint(10) unsigned DEFAULT '0',
  `assessmentend` bigint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `comparison` smallint(3) unsigned DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  `descriptiontrust` bigint(10) unsigned DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `nonegative` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `gradinggrade` decimal(10,5) unsigned DEFAULT NULL,
  `timegraded` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) unsigned NOT NULL,
  `reviewerid` bigint(10) unsigned NOT NULL,
  `weight` bigint(10) unsigned NOT NULL DEFAULT '1',
  `timecreated` bigint(10) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggrade` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggradeover` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggradeoverby` bigint(10) unsigned DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) unsigned DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `submissionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timegraded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) unsigned NOT NULL DEFAULT '0',
  `mailed` smallint(3) unsigned NOT NULL DEFAULT '0',
  `resubmission` smallint(3) unsigned NOT NULL DEFAULT '0',
  `donotuse` smallint(3) unsigned NOT NULL DEFAULT '0',
  `generalcomment` text COLLATE utf8_unicode_ci,
  `teachercomment` text COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` smallint(3) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxscore` smallint(3) unsigned NOT NULL DEFAULT '1',
  `weight` smallint(3) unsigned NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) unsigned NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` text COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nelements` smallint(3) unsigned NOT NULL DEFAULT '1',
  `nattachments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `phase` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `format` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `includeself` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `submissionend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) unsigned NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `overallocation` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) unsigned NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usepassword` smallint(3) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rubricno` smallint(3) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `example` tinyint(2) unsigned DEFAULT '0',
  `authorid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) unsigned NOT NULL DEFAULT '0',
  `attachment` tinyint(2) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT NULL,
  `gradeover` decimal(10,5) unsigned DEFAULT NULL,
  `gradeoverby` bigint(10) unsigned DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) unsigned DEFAULT '0',
  `timegraded` bigint(10) unsigned DEFAULT NULL,
  `published` tinyint(2) unsigned DEFAULT '0',
  `late` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) unsigned NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) unsigned NOT NULL DEFAULT '0',
  `late` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nassessments` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
