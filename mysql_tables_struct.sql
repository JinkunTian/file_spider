/*
Navicat MySQL Data Transfer

Source Server         : file_search
Source Server Version : 50557
Source Host           : 10.10.10.10:3306
Source Database       : file_search

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2019-05-21 17:19:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for search_config
-- ----------------------------
DROP TABLE IF EXISTS `search_config`;
CREATE TABLE `search_config` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(255) NOT NULL,
  `config_value` text NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for search_file_info
-- ----------------------------
DROP TABLE IF EXISTS `search_file_info`;
CREATE TABLE `search_file_info` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件记录ID',
  `absolute_path` text NOT NULL COMMENT '服务器内绝对路径',
  `web_path` text NOT NULL COMMENT '相对于网站的运行路径',
  `web_full_path` text NOT NULL,
  `name` text NOT NULL COMMENT '文件/文件夹名称',
  `classify` varchar(255) NOT NULL COMMENT '分类',
  `type` varchar(255) NOT NULL COMMENT '文件类型',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=16803 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for search_index_file_type
-- ----------------------------
DROP TABLE IF EXISTS `search_index_file_type`;
CREATE TABLE `search_index_file_type` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT '文件类型',
  `icon_path` text NOT NULL COMMENT '文件图标路径',
  `en_index` int(11) NOT NULL DEFAULT '1' COMMENT '开启索引该类型文件',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_index_file_type
-- ----------------------------
INSERT INTO `search_index_file_type` VALUES ('1', '.txt', '', '1');
INSERT INTO `search_index_file_type` VALUES ('2', '.exe', '', '1');
INSERT INTO `search_index_file_type` VALUES ('3', '.zip', '', '1');
INSERT INTO `search_index_file_type` VALUES ('4', '.avi', '', '1');
INSERT INTO `search_index_file_type` VALUES ('5', '.mp4', '', '1');
INSERT INTO `search_index_file_type` VALUES ('6', '.mp3', '', '1');
INSERT INTO `search_index_file_type` VALUES ('7', '.jpg', '', '1');
INSERT INTO `search_index_file_type` VALUES ('8', '.png', '', '1');
INSERT INTO `search_index_file_type` VALUES ('9', '.psd', '', '1');
INSERT INTO `search_index_file_type` VALUES ('10', '.ai', '', '1');
INSERT INTO `search_index_file_type` VALUES ('11', '.bmp', '', '1');
INSERT INTO `search_index_file_type` VALUES ('12', '.html', '', '1');
INSERT INTO `search_index_file_type` VALUES ('13', '.htm', '', '1');
INSERT INTO `search_index_file_type` VALUES ('14', '.pdf', '', '1');
INSERT INTO `search_index_file_type` VALUES ('15', '.doc', '', '1');
INSERT INTO `search_index_file_type` VALUES ('16', '.docx', '', '1');
INSERT INTO `search_index_file_type` VALUES ('17', '.bat', '', '1');
INSERT INTO `search_index_file_type` VALUES ('18', '.7z', '', '1');
INSERT INTO `search_index_file_type` VALUES ('19', '.tar', '', '1');
INSERT INTO `search_index_file_type` VALUES ('20', '.rar', '', '1');
INSERT INTO `search_index_file_type` VALUES ('21', '.gz', '', '1');
INSERT INTO `search_index_file_type` VALUES ('22', '.bz', '', '1');
INSERT INTO `search_index_file_type` VALUES ('23', '.img', '', '1');
INSERT INTO `search_index_file_type` VALUES ('24', '.iso', '', '1');
INSERT INTO `search_index_file_type` VALUES ('25', '.msi', '', '1');
INSERT INTO `search_index_file_type` VALUES ('26', '.jar', '', '1');

-- ----------------------------
-- Table structure for search_key_mapping
-- ----------------------------
DROP TABLE IF EXISTS `search_key_mapping`;
CREATE TABLE `search_key_mapping` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `short_key` varchar(255) NOT NULL,
  `full_key` varchar(255) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search_key_mapping
-- ----------------------------
INSERT INTO `search_key_mapping` VALUES ('1', 'AE', 'After Effects');
INSERT INTO `search_key_mapping` VALUES ('2', 'AE', 'AfterEffects');
INSERT INTO `search_key_mapping` VALUES ('3', 'AE', 'Effects');
INSERT INTO `search_key_mapping` VALUES ('4', 'An', 'Animate');
INSERT INTO `search_key_mapping` VALUES ('5', 'Au', 'Audition');
INSERT INTO `search_key_mapping` VALUES ('6', 'PS', 'Photoshop');
INSERT INTO `search_key_mapping` VALUES ('7', 'DW', 'Dreamweaver');
INSERT INTO `search_key_mapping` VALUES ('8', 'Ai', 'Illustrator');
INSERT INTO `search_key_mapping` VALUES ('9', 'Pr', 'Premiere');

-- ----------------------------
-- Table structure for search_keywords_logs
-- ----------------------------
DROP TABLE IF EXISTS `search_keywords_logs`;
CREATE TABLE `search_keywords_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
