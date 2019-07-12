DROP TABLE IF EXISTS `backup_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_log` (
  `backup_log_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL DEFAULT '0',
  `backup_time` DATETIME DEFAULT NULL,
  `backup_file` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`backup_log_id`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `biblio` (
  `biblio_id` INT(11) NOT NULL AUTO_INCREMENT,
  `gmd_id` INT(3) DEFAULT NULL,
  `title` TEXT NOT NULL,
  `sor` VARCHAR(200) DEFAULT NULL,
  `edition` VARCHAR(50) DEFAULT NULL,
  `isbn_issn` VARCHAR(20) DEFAULT NULL,
  `publisher_id` INT(11) DEFAULT NULL,
  `publish_year` VARCHAR(20) DEFAULT NULL,
  `collation` VARCHAR(50) DEFAULT NULL,
  `series_title` VARCHAR(200) DEFAULT NULL,
  `call_number` VARCHAR(50) DEFAULT NULL,
  `language_id` CHAR(5) DEFAULT 'en',
  `source` VARCHAR(3) DEFAULT NULL,
  `publish_place_id` INT(11) DEFAULT NULL,
  `classification` VARCHAR(40) DEFAULT NULL,
  `notes` TEXT,
  `image` VARCHAR(100) DEFAULT NULL,
  `file_att` VARCHAR(255) DEFAULT NULL,
  `opac_hide` SMALLINT(1) DEFAULT '0',
  `promoted` SMALLINT(1) DEFAULT '0',
  `labels` TEXT,
  `frequency_id` INT(11) NOT NULL DEFAULT '0',
  `spec_detail_info` TEXT,
  `content_type_id` INT(11) DEFAULT NULL,
  `media_type_id` INT(11) DEFAULT NULL,
  `carrier_type_id` INT(11) DEFAULT NULL,
  `input_date` DATETIME DEFAULT NULL,
  `last_update` DATETIME DEFAULT NULL,
  `uid` INT(11) DEFAULT NULL,
  PRIMARY KEY (`biblio_id`),
  KEY `references_idx` (`gmd_id`,`publisher_id`,`language_id`,`publish_place_id`),
  KEY `classification` (`classification`),
  KEY `biblio_flag_idx` (`opac_hide`,`promoted`),
  KEY `rda_idx` (`content_type_id`,`media_type_id`,`carrier_type_id`),
  KEY `uid` (`uid`),
  FULLTEXT KEY `title_ft_idx` (`title`,`series_title`),
  FULLTEXT KEY `notes_ft_idx` (`notes`),
  FULLTEXT KEY `labels` (`labels`)
) ENGINE=INNODB AUTO_INCREMENT=15282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `biblio_attachment` (
  `biblio_id` INT(11) NOT NULL,
  `file_id` INT(11) NOT NULL,
  `access_type` ENUM('public','private') NOT NULL,
  `access_limit` TEXT,
  KEY `biblio_id` (`biblio_id`),
  KEY `file_id` (`file_id`),
  KEY `biblio_id_2` (`biblio_id`,`file_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `biblio_author` (
  `biblio_id` INT(11) NOT NULL DEFAULT '0',
  `author_id` INT(11) NOT NULL DEFAULT '0',
  `level` INT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`biblio_id`,`author_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `biblio_custom` (
  `biblio_id` INT(11) NOT NULL,
  PRIMARY KEY (`biblio_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='one to one relation with real biblio table';
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `biblio_log` (
  `biblio_log_id` INT(11) NOT NULL AUTO_INCREMENT,
  `biblio_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `realname` VARCHAR(100) NOT NULL,
  `title` TEXT NOT NULL,
  `ip` VARCHAR(200) NOT NULL,
  `action` VARCHAR(50) NOT NULL,
  `affectedrow` VARCHAR(50) NOT NULL,
  `rawdata` TEXT NOT NULL,
  `additional_information` TEXT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`biblio_log_id`),
  KEY `realname` (`realname`),
  KEY `biblio_id` (`biblio_id`),
  KEY `user_id` (`user_id`),
  KEY `ip` (`ip`),
  KEY `action` (`action`),
  KEY `affectedrow` (`affectedrow`),
  KEY `date` (`date`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `rawdata` (`rawdata`),
  FULLTEXT KEY `additional_information` (`additional_information`)
) ENGINE=INNODB AUTO_INCREMENT=28215 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `biblio_relation` (
  `biblio_id` INT(11) NOT NULL DEFAULT '0',
  `rel_biblio_id` INT(11) NOT NULL DEFAULT '0',
  `rel_type` INT(1) DEFAULT '1',
  PRIMARY KEY (`biblio_id`,`rel_biblio_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `biblio_topic` (
  `biblio_id` INT(11) NOT NULL DEFAULT '0',
  `topic_id` INT(11) NOT NULL DEFAULT '0',
  `level` INT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`biblio_id`,`topic_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `comment` (
  `comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `biblio_id` INT(11) NOT NULL,
  `member_id` VARCHAR(20) NOT NULL,
  `comment` TEXT NOT NULL,
  `input_date` DATETIME DEFAULT NULL,
  `last_update` DATETIME DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `content` (
  `content_id` INT(11) NOT NULL AUTO_INCREMENT,
  `content_title` VARCHAR(255) NOT NULL,
  `content_desc` TEXT NOT NULL,
  `content_path` VARCHAR(20) NOT NULL,
  `is_news` SMALLINT(1) DEFAULT NULL,
  `input_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  `content_ownpage` ENUM('1','2') NOT NULL DEFAULT '1',
  PRIMARY KEY (`content_id`),
  UNIQUE KEY `content_path` (`content_path`),
  FULLTEXT KEY `content_title` (`content_title`),
  FULLTEXT KEY `content_desc` (`content_desc`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `ddc_content` (
  `content_id` VARCHAR(10) NOT NULL,
  `content_text` TEXT NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `ddc_db` (
  `clas` VARCHAR(20) NOT NULL,
  `about` TEXT NOT NULL,
  PRIMARY KEY (`clas`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `files` (
  `file_id` INT(11) NOT NULL AUTO_INCREMENT,
  `file_title` TEXT NOT NULL,
  `file_name` TEXT NOT NULL,
  `file_url` TEXT,
  `file_dir` TEXT,
  `mime_type` VARCHAR(100) DEFAULT NULL,
  `file_desc` TEXT,
  `uploader_id` INT(11) NOT NULL,
  `input_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`file_id`),
  FULLTEXT KEY `file_name` (`file_name`),
  FULLTEXT KEY `file_dir` (`file_dir`)
) ENGINE=INNODB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `fines` (
  `fines_id` INT(11) NOT NULL AUTO_INCREMENT,
  `fines_date` DATE NOT NULL,
  `member_id` VARCHAR(20) NOT NULL,
  `debet` INT(11) DEFAULT '0',
  `credit` INT(11) DEFAULT '0',
  `description` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`fines_id`),
  KEY `member_id` (`member_id`)
) ENGINE=INNODB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `group_access` (
  `group_id` INT(11) NOT NULL,
  `module_id` INT(11) NOT NULL,
  `r` INT(1) NOT NULL DEFAULT '0',
  `w` INT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `holiday` (
  `holiday_id` INT(11) NOT NULL AUTO_INCREMENT,
  `holiday_dayname` VARCHAR(20) NOT NULL,
  `holiday_date` DATE DEFAULT NULL,
  `description` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`holiday_id`),
  UNIQUE KEY `holiday_dayname` (`holiday_dayname`,`holiday_date`)
) ENGINE=INNODB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `item` (
  `item_id` INT(11) NOT NULL AUTO_INCREMENT,
  `biblio_id` INT(11) DEFAULT NULL,
  `call_number` VARCHAR(50) DEFAULT NULL,
  `coll_type_id` INT(3) DEFAULT NULL,
  `item_code` VARCHAR(20) DEFAULT NULL,
  `inventory_code` VARCHAR(200) DEFAULT NULL,
  `received_date` DATE DEFAULT NULL,
  `supplier_id` VARCHAR(6) DEFAULT NULL,
  `order_no` VARCHAR(20) DEFAULT NULL,
  `location_id` VARCHAR(3) DEFAULT NULL,
  `order_date` DATE DEFAULT NULL,
  `item_status_id` CHAR(3) DEFAULT NULL,
  `site` VARCHAR(50) DEFAULT NULL,
  `source` INT(1) NOT NULL DEFAULT '0',
  `invoice` VARCHAR(20) DEFAULT NULL,
  `price` INT(11) DEFAULT NULL,
  `price_currency` VARCHAR(10) DEFAULT NULL,
  `invoice_date` DATE DEFAULT NULL,
  `input_date` DATETIME DEFAULT NULL,
  `last_update` DATETIME DEFAULT NULL,
  `uid` INT(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_code` (`item_code`),
  KEY `item_references_idx` (`coll_type_id`,`location_id`,`item_status_id`),
  KEY `biblio_id_idx` (`biblio_id`),
  KEY `uid` (`uid`)
) ENGINE=INNODB AUTO_INCREMENT=22452 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `kardex` (
  `kardex_id` INT(11) NOT NULL AUTO_INCREMENT,
  `date_expected` DATE NOT NULL,
  `date_received` DATE DEFAULT NULL,
  `seq_number` VARCHAR(25) DEFAULT NULL,
  `notes` TEXT,
  `serial_id` INT(11) DEFAULT NULL,
  `input_date` DATE NOT NULL,
  `last_update` DATE NOT NULL,
  PRIMARY KEY (`kardex_id`),
  KEY `fk_serial` (`serial_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `loan` (
  `loan_id` INT(11) NOT NULL AUTO_INCREMENT,
  `item_code` VARCHAR(20) DEFAULT NULL,
  `member_id` VARCHAR(20) DEFAULT NULL,
  `loan_date` DATE NOT NULL,
  `due_date` DATE NOT NULL,
  `renewed` INT(11) NOT NULL DEFAULT '0',
  `loan_rules_id` INT(11) NOT NULL DEFAULT '0',
  `actual` DATE DEFAULT NULL,
  `is_lent` INT(11) NOT NULL DEFAULT '0',
  `is_return` INT(11) NOT NULL DEFAULT '0',
  `return_date` DATE DEFAULT NULL,
  `input_date` DATETIME DEFAULT NULL,
  `last_update` DATETIME DEFAULT NULL,
  `uid` INT(11) DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `item_code` (`item_code`),
  KEY `member_id` (`member_id`),
  KEY `input_date` (`input_date`,`return_date`,`uid`)
) ENGINE=INNODB AUTO_INCREMENT=983 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `member` (
  `member_id` INT(6) NOT NULL AUTO_INCREMENT,
  `sub_idm` VARCHAR(20) DEFAULT NULL,
  `member_name` VARCHAR(100) NOT NULL,
  `gender` INT(1) NOT NULL,
  `birth_date` DATE DEFAULT NULL,
  `member_type_id` INT(6) DEFAULT NULL,
  `member_address` VARCHAR(255) DEFAULT NULL,
  `member_mail_address` VARCHAR(255) DEFAULT NULL,
  `member_email` VARCHAR(100) DEFAULT NULL,
  `postal_code` VARCHAR(20) DEFAULT NULL,
  `inst_name` VARCHAR(100) DEFAULT NULL,
  `is_new` INT(1) DEFAULT NULL,
  `member_image` VARCHAR(200) DEFAULT NULL,
  `pin` VARCHAR(50) DEFAULT NULL,
  `member_phone` VARCHAR(50) DEFAULT NULL,
  `member_fax` VARCHAR(50) DEFAULT NULL,
  `member_since_date` DATE DEFAULT NULL,
  `register_date` DATE DEFAULT NULL,
  `expire_date` DATE NOT NULL,
  `member_notes` TEXT,
  `is_pending` SMALLINT(1) NOT NULL DEFAULT '0',
  `mpasswd` CHAR(128) DEFAULT NULL,
  `last_login` DATETIME DEFAULT NULL,
  `last_login_ip` VARCHAR(20) DEFAULT NULL,
  `input_date` DATE DEFAULT NULL,
  `last_update` DATE DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `member_name` (`member_name`),
  KEY `member_type_id` (`member_type_id`)
) ENGINE=INNODB AUTO_INCREMENT=130636 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `member_custom` (
  `member_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='one to one relation with real member table';
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_author` (
  `author_id` INT(11) NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(100) NOT NULL,
  `author_year` VARCHAR(20) DEFAULT NULL,
  `authority_type` ENUM('p','o','c') DEFAULT 'p',
  `auth_list` VARCHAR(20) DEFAULT NULL,
  `input_date` DATE NOT NULL,
  `last_update` DATE DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_name` (`author_name`,`authority_type`)
) ENGINE=INNODB AUTO_INCREMENT=8786 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_carrier_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `carrier_type` VARCHAR(100) NOT NULL,
  `code` VARCHAR(5) NOT NULL,
  `code2` CHAR(1) NOT NULL,
  `input_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_type` (`carrier_type`),
  KEY `code` (`code`)
) ENGINE=INNODB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_coll_type` (
  `coll_type_id` INT(3) NOT NULL AUTO_INCREMENT,
  `coll_type_name` VARCHAR(30) NOT NULL,
  `input_date` DATE DEFAULT NULL,
  `last_update` DATE DEFAULT NULL,
  PRIMARY KEY (`coll_type_id`),
  UNIQUE KEY `coll_type_name` (`coll_type_name`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_content_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `content_type` VARCHAR(100) NOT NULL,
  `code` VARCHAR(5) NOT NULL,
  `code2` CHAR(1) NOT NULL,
  `input_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type` (`content_type`),
  KEY `code` (`code`)
) ENGINE=INNODB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_frequency` (
  `frequency_id` INT(11) NOT NULL AUTO_INCREMENT,
  `frequency` VARCHAR(25) NOT NULL,
  `language_prefix` VARCHAR(5) DEFAULT NULL,
  `time_increment` SMALLINT(6) DEFAULT NULL,
  `time_unit` ENUM('day','week','month','year') DEFAULT 'day',
  `input_date` DATE NOT NULL,
  `last_update` DATE NOT NULL,
  PRIMARY KEY (`frequency_id`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_gmd` (
  `gmd_id` INT(11) NOT NULL AUTO_INCREMENT,
  `gmd_code` VARCHAR(3) DEFAULT NULL,
  `gmd_name` VARCHAR(30) NOT NULL,
  `icon_image` VARCHAR(100) DEFAULT NULL,
  `input_date` DATE NOT NULL,
  `last_update` DATE DEFAULT NULL,
  PRIMARY KEY (`gmd_id`),
  UNIQUE KEY `gmd_name` (`gmd_name`),
  UNIQUE KEY `gmd_code` (`gmd_code`)
) ENGINE=INNODB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_item_status` (
  `item_status_id` CHAR(3) NOT NULL,
  `item_status_name` VARCHAR(30) NOT NULL,
  `rules` VARCHAR(255) DEFAULT NULL,
  `no_loan` SMALLINT(1) NOT NULL DEFAULT '0',
  `skip_stock_take` SMALLINT(1) NOT NULL DEFAULT '0',
  `input_date` DATE DEFAULT NULL,
  `last_update` DATE DEFAULT NULL,
  PRIMARY KEY (`item_status_id`),
  UNIQUE KEY `item_status_name` (`item_status_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_label` (
  `label_id` INT(11) NOT NULL AUTO_INCREMENT,
  `label_name` VARCHAR(20) NOT NULL,
  `label_desc` VARCHAR(50) DEFAULT NULL,
  `label_image` VARCHAR(200) NOT NULL,
  `input_date` DATE NOT NULL,
  `last_update` DATE NOT NULL,
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `label_name` (`label_name`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_language` (
  `language_id` CHAR(5) NOT NULL,
  `language_name` VARCHAR(20) NOT NULL,
  `input_date` DATE DEFAULT NULL,
  `last_update` DATE DEFAULT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_name` (`language_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_loan_rules` (
  `loan_rules_id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_type_id` INT(11) NOT NULL DEFAULT '0',
  `coll_type_id` INT(11) DEFAULT '0',
  `gmd_id` INT(11) DEFAULT '0',
  `loan_limit` INT(3) DEFAULT '0',
  `loan_periode` INT(3) DEFAULT '0',
  `reborrow_limit` INT(3) DEFAULT '0',
  `fine_each_day` INT(3) DEFAULT '0',
  `grace_periode` INT(2) DEFAULT '0',
  `input_date` DATE DEFAULT NULL,
  `last_update` DATE DEFAULT NULL,
  PRIMARY KEY (`loan_rules_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_location` (
  `location_id` VARCHAR(3) NOT NULL,
  `location_name` VARCHAR(100) DEFAULT NULL,
  `input_date` DATE NOT NULL,
  `last_update` DATE NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_name` (`location_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_media_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `media_type` VARCHAR(100) NOT NULL,
  `code` VARCHAR(5) NOT NULL,
  `code2` CHAR(1) NOT NULL,
  `input_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_type` (`media_type`),
  KEY `code` (`code`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_member_type` (
  `member_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_type_name` VARCHAR(50) NOT NULL,
  `loan_limit` INT(11) NOT NULL,
  `loan_periode` INT(11) NOT NULL,
  `enable_reserve` INT(1) NOT NULL DEFAULT '0',
  `reserve_limit` INT(11) NOT NULL DEFAULT '0',
  `member_periode` INT(11) NOT NULL,
  `reborrow_limit` INT(11) NOT NULL,
  `fine_each_day` INT(11) NOT NULL,
  `grace_periode` INT(2) DEFAULT '0',
  `input_date` DATE NOT NULL,
  `last_update` DATE DEFAULT NULL,
  PRIMARY KEY (`member_type_id`),
  UNIQUE KEY `member_type_name` (`member_type_name`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_module` (
  `module_id` INT(3) NOT NULL AUTO_INCREMENT,
  `module_name` VARCHAR(50) NOT NULL,
  `module_path` VARCHAR(200) DEFAULT NULL,
  `module_desc` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name` (`module_name`,`module_path`)
) ENGINE=INNODB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `mst_place` (
  `place_id` INT(11) NOT NULL AUTO_INCREMENT,
  `place_name` VARCHAR(30) NOT NULL,
  `input_date` DATE DEFAULT NULL,
  `last_update` DATE DEFAULT NULL,
  PRIMARY KEY (`place_id`),
  UNIQUE KEY `place_name` (`place_name`)
) ENGINE=INNODB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;



