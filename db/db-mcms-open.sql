/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : db-mcms-open

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-09-22 17:30:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `app_name` varchar(60) NOT NULL COMMENT '站点名称',
  `app_url` varchar(200) NOT NULL COMMENT '站点域名，多个回车换行显示',
  `app_logo` varchar(120) DEFAULT NULL COMMENT '网站logo',
  `app_keyword` varchar(500) DEFAULT NULL COMMENT '站点关键字',
  `app_copyright` varchar(500) DEFAULT NULL COMMENT '站点版权信息',
  `app_style` varchar(50) DEFAULT NULL COMMENT '站点风格',
  `app_managerid` int(11) DEFAULT NULL COMMENT '站点对于管理员编号',
  `app_description` varchar(500) DEFAULT NULL COMMENT '描述',
  `app_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `app_mobile_style` varchar(11) DEFAULT NULL COMMENT '移动端风格',
  `app_pay_date` datetime DEFAULT NULL COMMENT '应用续费时间',
  `app_pay` varchar(300) DEFAULT NULL COMMENT '费用清单',
  `app_state` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0运行中 1已停止  ',
  `app_mobile_state` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0启用 1停用',
  PRIMARY KEY (`app_id`),
  KEY `fk_app_manager_1` (`app_managerid`) USING BTREE,
  CONSTRAINT `app_ibfk_1` FOREIGN KEY (`app_managerid`) REFERENCES `manager` (`manager_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES ('1', '心理咨询室', 'http://101.200.33.98:8080\r\n', '/upload/1/app/1506063556747.png', '', '', 'psychological', '50', '', null, '', null, '', '0', '0');

-- ----------------------------
-- Table structure for basic
-- ----------------------------
DROP TABLE IF EXISTS `basic`;
CREATE TABLE `basic` (
  `basic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `basic_title` varchar(300) DEFAULT NULL COMMENT '标题',
  `basic_description` text COMMENT '描述',
  `basic_thumbnails` varchar(1000) DEFAULT NULL COMMENT '缩略图',
  `basic_hit` bigint(22) DEFAULT NULL COMMENT '点击次数',
  `basic_sort` int(11) DEFAULT NULL COMMENT '排序',
  `basic_datetime` datetime DEFAULT NULL COMMENT ' 发布时间',
  `basic_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `basic_peopleid` int(22) DEFAULT NULL COMMENT '用户编号',
  `basic_categoryid` int(22) DEFAULT NULL COMMENT '所属分类编号',
  `basic_appid` int(11) NOT NULL COMMENT '应用编号',
  `basic_modelid` int(11) DEFAULT NULL COMMENT '模块编号',
  `basic_comment` int(11) DEFAULT NULL COMMENT '评论次数',
  `basic_collect` int(11) DEFAULT NULL COMMENT '收藏次数',
  `basic_share` int(11) DEFAULT NULL COMMENT '分享次数',
  `basic_type` varchar(255) DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`basic_id`),
  UNIQUE KEY `basic_id` (`basic_id`) USING BTREE,
  KEY `basic_title` (`basic_title`(255)) USING BTREE,
  KEY `basic_appid` (`basic_appid`) USING BTREE,
  KEY `basic_modelid` (`basic_modelid`) USING BTREE,
  KEY `basic_categoryid` (`basic_categoryid`) USING BTREE,
  CONSTRAINT `basic_ibfk_1` FOREIGN KEY (`basic_appid`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `basic_ibfk_2` FOREIGN KEY (`basic_categoryid`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COMMENT='基础表';

-- ----------------------------
-- Records of basic
-- ----------------------------
INSERT INTO `basic` VALUES ('221', '李四', '心理专家', '/upload/1/article/1505896621073.jpg', '0', '0', '2017-09-08 10:29:59', '2017-09-20 16:37:03', '0', '155', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('222', '10月1日-10月7日放假', '', '', '0', '0', '2017-09-11 15:47:14', '2017-09-13 10:47:15', '0', '152', '1', '7', null, null, null, null);
INSERT INTO `basic` VALUES ('223', '张三', '情感专家', '/upload/1/article/1505896548137.jpg', '0', '0', '2017-09-12 09:21:05', '2017-09-21 14:13:23', '0', '159', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('230', '中心简介', '', '', '0', '0', '2017-09-19 09:35:13', '2017-09-19 11:03:57', '0', '151', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('231', '河北省2018年硕士研究生招生考试网上报名须知 ', '', '', '0', '0', '2017-09-19 14:14:07', '2017-09-19 14:14:07', '0', '152', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('232', '对我省中小学教师资格考试笔试有关事项的公告 ', '', '', '0', '0', '2017-09-19 14:15:16', '2017-09-19 14:15:16', '0', '152', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('233', '2018年河北省成人高考重要提示 ', '', '', '0', '0', '2017-09-19 14:15:44', '2017-09-19 14:15:44', '0', '152', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('234', '河北普通高校招生录取咨询电话', '', '', '0', '0', '2017-09-19 14:16:07', '2017-09-19 14:16:07', '0', '152', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('241', '王五', '爱情顾问', '/upload/1/article/1505896528209.jpg', '0', '0', '2017-09-19 15:32:05', '2017-09-20 16:35:30', '0', '159', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('242', '赵六', '心理顾问', '/upload/1/article/1505896507028.jpg', '0', '0', '2017-09-19 15:32:50', '2017-09-20 16:35:09', '0', '155', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('243', '123', '', '/upload/1/article/1505890349133.jpg', '0', '0', '2017-09-20 14:52:35', '2017-09-20 14:52:35', '0', '160', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('244', '456', '', '/upload/1/article/1505890423073.jpg', '0', '0', '2017-09-20 14:53:45', '2017-09-20 14:53:45', '0', '160', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('245', '789', '', '/upload/1/article/1505890435694.jpg', '0', '0', '2017-09-20 14:53:59', '2017-09-20 14:53:59', '0', '160', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('246', '女人一定要有四样东西', '', '/upload/1/article/1505895193323.jpg', '0', '0', '2017-09-20 16:15:13', '2017-09-20 16:15:13', '0', '158', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('247', '风靡国外的16个超实用心理学小技巧，值得收藏！', '', '/upload/1/article/1505895355255.jpg', '0', '0', '2017-09-20 16:16:37', '2017-09-20 16:16:37', '0', '158', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('248', '海灵格：伴侣关系中你不知的思维陷阱', '', '/upload/1/article/1505895431753.jpg', '0', '0', '2017-09-20 16:17:46', '2017-09-20 16:17:46', '0', '154', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('249', '婚姻：想象VS现实10大对比，说得太精辟了', '', '/upload/1/article/1505895794769.jpg', '1', '0', '2017-09-20 16:18:40', '2017-09-20 16:23:16', '0', '154', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('250', '时间观暴露性格：爱迟到的人都挺固执', '', '/upload/1/article/1505895544427.jpg', '1', '0', '2017-09-20 16:19:44', '2017-09-20 16:21:10', '0', '158', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('251', '虚荣心是上进心的代名词', '', '/upload/1/article/1505895598137.jpg', '1', '0', '2017-09-20 16:20:49', '2017-09-20 16:20:49', '0', '158', '1', '8', null, null, null, null);
INSERT INTO `basic` VALUES ('252', '版权说明', '', '', '0', '0', '2017-09-22 15:11:37', '2017-09-22 15:11:37', '0', '161', '1', '8', null, null, null, null);

-- ----------------------------
-- Table structure for basic_attention
-- ----------------------------
DROP TABLE IF EXISTS `basic_attention`;
CREATE TABLE `basic_attention` (
  `ba_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `ba_people_id` int(11) DEFAULT NULL COMMENT '用户id',
  `ba_app_id` int(11) DEFAULT NULL COMMENT '用户应用id',
  `ba_basic_id` int(11) DEFAULT NULL COMMENT '用户收藏关联的基础id',
  `ba_type` int(11) DEFAULT NULL COMMENT '收藏类型 1： 收藏  2：顶',
  `ba_datetime` datetime DEFAULT NULL COMMENT '用户收藏文章，帖子或商品时的时间',
  `ba_url` varchar(200) DEFAULT NULL COMMENT '收藏的文章,帖子，商品的链接地址',
  PRIMARY KEY (`ba_id`),
  KEY `ba_peopleid` (`ba_people_id`) USING BTREE,
  KEY `fk_basic_attention_basic_1` (`ba_basic_id`) USING BTREE,
  CONSTRAINT `basic_attention_ibfk_1` FOREIGN KEY (`ba_basic_id`) REFERENCES `basic` (`basic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of basic_attention
-- ----------------------------

-- ----------------------------
-- Table structure for basic_column
-- ----------------------------
DROP TABLE IF EXISTS `basic_column`;
CREATE TABLE `basic_column` (
  `column_category_id` int(11) NOT NULL COMMENT '关联category表（类别表ID）',
  `column_keyword` varchar(300) DEFAULT NULL COMMENT '栏目简介',
  `column_descrip` varchar(500) DEFAULT NULL COMMENT '栏目关键字的扩展',
  `column_type` int(2) DEFAULT NULL COMMENT '1,代表最终列表栏目。2，代表频道封面。3，带表外部链接',
  `column_url` varchar(50) DEFAULT NULL COMMENT '如果是外部链接，则保持外部链接地址。如果为最终列表栏目，就保存文章显示列表',
  `column_listurl` varchar(50) DEFAULT NULL COMMENT '最终列表栏目的列表模板地址',
  `column_path` varchar(150) DEFAULT NULL COMMENT '栏目路径',
  `column_cm_id` int(11) DEFAULT NULL COMMENT '栏目管理的内容模型id',
  `column_is_doctor` int(11) DEFAULT '0',
  PRIMARY KEY (`column_category_id`),
  KEY `fk_basic_column_1` (`column_cm_id`) USING BTREE,
  CONSTRAINT `basic_column_ibfk_1` FOREIGN KEY (`column_category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `basic_column_ibfk_2` FOREIGN KEY (`column_cm_id`) REFERENCES `mdiy_content_model` (`cm_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of basic_column
-- ----------------------------
INSERT INTO `basic_column` VALUES ('151', '中心简介', '', '2', 'intro-content.htm', '', '/151', null, '0');
INSERT INTO `basic_column` VALUES ('152', '通知', '通知', '1', 'notice-content.htm', 'notice-list.htm', '/152', null, '0');
INSERT INTO `basic_column` VALUES ('153', '精品文章', '精品文章', '1', 'article-content.htm', 'article-list.htm', '/153', null, '0');
INSERT INTO `basic_column` VALUES ('154', '婚恋', '', '1', 'article-content.htm', 'article-list.htm', '/153/154', null, '0');
INSERT INTO `basic_column` VALUES ('155', '', '', '1', 'doctor-content.htm', 'doctor-list.htm', '/155', '5', '1');
INSERT INTO `basic_column` VALUES ('158', '性格', '', '1', 'article-content.htm', 'article-list.htm', '/153/158', null, '0');
INSERT INTO `basic_column` VALUES ('159', '婚恋专家', '', '1', 'doctor-content.htm', 'doctor-list.htm', '/155/159', '5', '1');
INSERT INTO `basic_column` VALUES ('160', '', '', '1', 'index.htm', 'index.htm', '/160', null, '0');
INSERT INTO `basic_column` VALUES ('161', '', '', '2', 'intro-content.htm', '', '/161', null, '0');
INSERT INTO `basic_column` VALUES ('163', '', '', '2', 'about.htm', '', '/163', null, '0');

-- ----------------------------
-- Table structure for basic_log
-- ----------------------------
DROP TABLE IF EXISTS `basic_log`;
CREATE TABLE `basic_log` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `bl_basic_id` int(11) NOT NULL COMMENT '引用编号',
  `bl_ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `bl_datetime` datetime NOT NULL COMMENT '记录时间',
  `bl_is_mobile` int(1) NOT NULL DEFAULT '0' COMMENT '1移动端 0默认pc',
  PRIMARY KEY (`bl_id`),
  KEY `fk_basic_log_basic_1` (`bl_basic_id`) USING BTREE,
  CONSTRAINT `basic_log_ibfk_1` FOREIGN KEY (`bl_basic_id`) REFERENCES `basic` (`basic_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信息访问日志';

-- ----------------------------
-- Records of basic_log
-- ----------------------------
INSERT INTO `basic_log` VALUES ('1', '251', '0:0:0:0:0:0:0:1', '2017-09-21 11:54:20', '0');
INSERT INTO `basic_log` VALUES ('2', '250', '0:0:0:0:0:0:0:1', '2017-09-21 11:54:40', '0');
INSERT INTO `basic_log` VALUES ('3', '249', '0:0:0:0:0:0:0:1', '2017-09-21 11:54:48', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `category_title` varchar(50) DEFAULT NULL COMMENT '类别标题',
  `category_sort` int(10) DEFAULT NULL COMMENT '类别排序',
  `category_datetime` datetime DEFAULT NULL COMMENT '类别发布时间',
  `category_managerid` int(22) DEFAULT NULL COMMENT '发布用户id',
  `category_modelid` int(11) DEFAULT NULL COMMENT '所属模块id',
  `category_categoryid` int(11) DEFAULT NULL COMMENT '父类别编号',
  `category_smallimg` varchar(2000) DEFAULT NULL COMMENT '略缩图',
  `category_appid` int(11) DEFAULT NULL COMMENT '应用编号',
  `category_description` varchar(45) DEFAULT NULL COMMENT '栏目描述',
  `category_parent_id` varchar(255) DEFAULT NULL COMMENT '父类型编号',
  `category_dict_id` int(11) DEFAULT '0' COMMENT '字典对应编号',
  `create_by` int(11) DEFAULT '0' COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(11) DEFAULT '0' COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del` int(11) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`category_id`),
  KEY `category_appid` (`category_appid`) USING BTREE,
  KEY `category_managerid` (`category_managerid`) USING BTREE,
  KEY `category_modelid` (`category_modelid`) USING BTREE,
  KEY `category_categoryid` (`category_categoryid`) USING BTREE,
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`category_categoryid`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `category_ibfk_2` FOREIGN KEY (`category_appid`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('151', '中心简介', '0', '2017-09-08 10:01:20', '50', '7', null, '', '1', null, null, '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('152', '通知公告', '0', '2017-09-08 10:08:07', '50', '7', null, '', '1', null, null, '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('153', '精品文章', '0', '2017-09-08 10:08:33', '50', '7', null, '', '1', null, null, '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('154', '婚恋', '0', '2017-09-08 10:09:13', '50', '7', '153', '', '1', null, '153', '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('155', '专家', '0', '2017-09-08 10:12:12', '50', '7', null, '', '1', null, null, '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('156', '全部', '0', '2017-09-08 10:12:47', '50', '7', '155', '', '1', null, '155', '0', '0', null, '0', null, '1');
INSERT INTO `category` VALUES ('157', '婚恋', '0', '2017-09-08 10:13:14', '50', '7', '155', '', '1', null, '155', '0', '0', null, '0', null, '1');
INSERT INTO `category` VALUES ('158', '性格', '0', '2017-09-13 09:42:25', '50', '7', '153', '', '1', null, '153', '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('159', '婚恋', '0', '2017-09-13 10:54:33', '50', '7', '155', '', '1', null, '155', '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('160', '首页幻灯片', '100', '2017-09-13 11:04:32', '50', '7', null, '', '1', null, null, '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('161', '版权说明', '0', '2017-09-22 15:10:45', '50', '7', null, '', '1', null, null, '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('162', '性格1', '0', '2017-09-22 16:12:25', '50', '7', '153', '', '1', null, '153', '0', '0', null, '0', null, '0');
INSERT INTO `category` VALUES ('163', '关于我们', '0', '2017-09-22 16:43:48', '50', '7', null, '', '1', null, null, '0', '0', null, '0', null, '0');

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `article_basicid` int(20) NOT NULL DEFAULT '0' COMMENT '文章id',
  `article_author` varchar(20) DEFAULT NULL COMMENT '文章作者',
  `article_content` longtext COMMENT '文章内容',
  `article_type` varchar(100) DEFAULT NULL COMMENT '文章类型',
  `article_source` varchar(300) DEFAULT NULL COMMENT '文章来源',
  `article_url` varchar(200) DEFAULT NULL COMMENT '文章跳转链接地址',
  `article_keyword` varchar(300) DEFAULT NULL COMMENT '文章关键字',
  `article_freeorder` int(255) DEFAULT NULL COMMENT '文章自定义显示顺序',
  `article_webid` int(11) DEFAULT NULL COMMENT '文章管理的应用id',
  PRIMARY KEY (`article_basicid`),
  UNIQUE KEY `article_basicid` (`article_basicid`) USING BTREE,
  KEY `article_webid` (`article_webid`) USING BTREE,
  CONSTRAINT `cms_article_ibfk_1` FOREIGN KEY (`article_basicid`) REFERENCES `basic` (`basic_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('221', '1', '<p>曲曲折折的荷塘上面，弥望的是田的叶子。叶子出水很高，像亭亭的舞女的裙。层层的叶子中间，零星地点缀着些白花，有袅娜地开着的，有羞涩地打着朵儿的；正如一粒粒的明珠，又如碧天里的星星，又如刚出浴的美人。微风过处，送来缕缕清香，仿佛远处高楼上渺茫的歌声似的。这时候叶子与花也有一丝的颤动，像闪电般，霎时传过荷塘的那边去了。叶子本是肩并肩密密地挨着，这便宛然有了一道凝碧的波痕。叶子底下是脉脉的流水，遮住了，不能见一些颜色；而叶子却更见风致了</p>', '', '1', '/155\\221.html', '1', '0', '1');
INSERT INTO `cms_article` VALUES ('222', '', '<p>放假通知<br/></p>', '', '', '/152\\222.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('223', '2', '<p>曲曲折折的荷塘上面，弥望的是田的叶子。叶子出水很高，像亭亭的舞女的裙。层层的叶子中间，零星地点缀着些白花，有袅娜地开着的，有羞涩地打着朵儿的；正如一粒粒的明珠，又如碧天里的星星，又如刚出浴的美人。微风过处，送来缕缕清香，仿佛远处高楼上渺茫的歌声似的。这时候叶子与花也有一丝的颤动，像闪电般，霎时传过荷塘的那边去了。叶子本是肩并肩密密地挨着，这便宛然有了一道凝碧的波痕。叶子底下是脉脉的流水，遮住了，不能见一些颜色；而叶子却更见风致了</p>', '', '2', '/155\\223.html', '123', '0', '1');
INSERT INTO `cms_article` VALUES ('230', '', '<p>曲曲折折的荷塘上面，弥望的是田的叶子。叶子出水很高，像亭亭的舞女的裙。层层的叶子中间，零星地点缀着些白花，有袅娜地开着的，有羞涩地打着朵儿的；正如一粒粒的明珠，又如碧天里的星星，又如刚出浴的美人。微风过处，送来缕缕清香，仿佛远处高楼上渺茫的歌声似的。这时候叶子与花也有一丝的颤动，像闪电般，霎时传过荷塘的那边去了。叶子本是肩并肩密密地挨着，这便宛然有了一道凝碧的波痕。叶子底下是脉脉的流水，遮住了，不能见一些颜色；而叶子却更见风致了</p>', '', '', '/151\\index.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('231', '', '<p>河北省2018年硕士研究生招生考试网上报名须知</p>', '', '', '/152\\231.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('232', '', '<p>对我省中小学教师资格考试笔试有关事项的公告</p>', '', '', '/152\\232.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('233', '', '<p>2018年河北省成人高考重要提示&nbsp;</p>', '', '', '/152\\233.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('234', '', '<p>河北普通高校招生录取咨询电话</p>', '', '', '/152\\234.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('241', '3', '<p>曲曲折折的荷塘上面，弥望的是田的叶子。叶子出水很高，像亭亭的舞女的裙。层层的叶子中间，零星地点缀着些白花，有袅娜地开着的，有羞涩地打着朵儿的；正如一粒粒的明珠，又如碧天里的星星，又如刚出浴的美人。微风过处，送来缕缕清香，仿佛远处高楼上渺茫的歌声似的。这时候叶子与花也有一丝的颤动，像闪电般，霎时传过荷塘的那边去了。叶子本是肩并肩密密地挨着，这便宛然有了一道凝碧的波痕。叶子底下是脉脉的流水，遮住了，不能见一些颜色；而叶子却更见风致了</p>', '', '', '/155/159\\241.html', '123', '0', '1');
INSERT INTO `cms_article` VALUES ('242', '4', '<p>曲曲折折的荷塘上面，弥望的是田的叶子。叶子出水很高，像亭亭的舞女的裙。层层的叶子中间，零星地点缀着些白花，有袅娜地开着的，有羞涩地打着朵儿的；正如一粒粒的明珠，又如碧天里的星星，又如刚出浴的美人。微风过处，送来缕缕清香，仿佛远处高楼上渺茫的歌声似的。这时候叶子与花也有一丝的颤动，像闪电般，霎时传过荷塘的那边去了。叶子本是肩并肩密密地挨着，这便宛然有了一道凝碧的波痕。叶子底下是脉脉的流水，遮住了，不能见一些颜色；而叶子却更见风致了</p>', '', '', '/155\\242.html', '123', '0', '1');
INSERT INTO `cms_article` VALUES ('243', '', null, '', '', '/160\\243.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('244', '', null, '', '', '/160\\244.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('245', '', null, '', '', '/160\\245.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('246', '夏德琴', '<p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>女人一定要有四样东西:</strong><br/></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>扬在脸上的自信,</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>长在心底的善良,</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>融进血里的骨气,</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>刻进命里的坚强。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><br/></strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">穿得起上千的大衣,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">也不嫌弃几十元的T恤,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">可以小鸟依人,也可以自力更生。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">有你,我可以坐拥天下,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">没你,我的世界依然伟大!</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">送给天下所有的独立而善良,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">平凡而美丽的女人!</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果你是一个女人,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">你的丈夫不优秀,那你必须成长,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">因为你没有依靠!</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果你是一个女人,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">你的丈夫很优秀,你也必须成长,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">否则你无法跟上他前进的脚步!</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果你是一个女人,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">你的孩子不优秀,那你必须成长,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">因为你要引领她的思想!</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果你是一个女人,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">你的孩子很优秀,你也必须成长,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">因为你不能成为他的绊脚石!</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果你是一个女人,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">你必须成长,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">因为你要活得精彩,才不负此生!</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果你是一个女人,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">你必须成长,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">女人赚钱不一定是责任,</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">但一定是尊严!</p><p><br/></p>', '', '百度', '/153/158\\246.html', '性格', '0', '1');
INSERT INTO `cms_article` VALUES ('247', '胡光秀', '<p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">风靡国外的16个超实用心理学小技巧,<br/></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">像生活中的小捷径,会让你和周围的世界,相处的更轻松、更友好。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">心理学小技巧能让我们更好地了解自己、了解他人,与他人更好的相处。换句话说,能帮助你超越他人。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">有时或许是一个姿势,有时候是一个意识,有时则像每次都在脸上挂着笑容一样简单。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">快来看看下面这些心理技巧吧!</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 01 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>赞美是万金油</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">人们非常愿意帮助赞美自己的人,即使这种赞美带有一定的目的性。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">当然,更准确、走心的赞美,收到的效果会更大,而且,此方法对任何人都有效。所谓“千穿万穿,马屁不穿”是有科学道理的。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 02 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>心情不好?就停在当下!</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果你心情不好,一定不要立刻就工作或者与人交流,给自己一点点的独处时间,哪怕只有2分钟,可以帮助你迅速冷静下来,恢复理智与一个正常的心情。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 03 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>等待是最好的聆听方式</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果你问了别人一个问题,然后他们回答了一半,你等着,他们会说完的。只要等着,保持眼神接触,最终,他们会开口讲完的。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 04 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>觉得紧张?嚼起来!</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">公开讲话或者蹦极之前这种会紧张的时刻,嚼口香糖就好了。据说人类在危险的时候会自动停止咀嚼(吃东西),所以吃东西的时候就是安全的,大脑就是这么告诉你的。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 05 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>他人无缘无故对你发火时,啥都别做</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">下回有人朝你大吼大叫时,保持冷静就好。这会让他们更生气。最终,他们的怒火会燃烧殆尽,然后为自己的行为感到羞愧。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 06 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>倾诉是最接地气的疗愈</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">一定有一两个可以听你倾诉的朋友,不要畏惧谈论自己的创伤和问题,如果你愿意敞开心扉,对方也会与你交换秘密。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">倾诉,也是很好的疗愈。找一个互相疗愈的对象吧(注:谈论心事不意味着吐槽抱怨负能量)。倾诉,并且互相提供帮助。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 07 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>觉得压力大?换个姿势</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">当你感觉压力很大的时候,记着调整一下身体的姿势,让自己更加的舒展——这是消除压力最有效的方式。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">为啥?因为身体形态可重要了。当你重新摆姿势时,你一部分精神上的压力会随着你的舒展而释放转移出去。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 08 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>想知道谁跟谁关系好?</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">当一群人在一起时,大家谈论、聊天、欢笑,每个人都会跟他们觉得最亲近的人进行眼神交流。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">所以,想知道谁跟谁关系更好?那就好好看看每一个人吧,看看他们在笑的时候望向的是谁?</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 09 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>他人是否真的欢迎你?</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">注意别人的脚。当你加入别人的谈话时,发现别人只是把上半身转过来了,脚还是维持原来的方向,那就说明他们不欢迎你的加入。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 10 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>商量事情与合作的技巧</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果你想跟人协商、合作或者商议事情,尽量不要在会议室,办公室等正式的场合。你可以选择咖啡店之类的地方,如此一来可以减少对方的防卫心。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">另外在时间上,可以选择在下午2-4点之间,人们在这个时间段精神更放松哦。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 11 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>想了解一个人真实的内心?</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">想了解一个人内心真实的状态,想知道一个人的内心缺少什么,不用费尽心机的去分析去猜,就看这个人在炫耀什么;想知道一个人自卑什么,不看别的,就看其掩饰什么。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 12 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>6个生活细节年轻大脑</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">1,每天大笑1次:具有缓解压力抗击心理衰老功效;</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">2,睡够7小时:充足睡眠有助大脑强化记忆;</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">3,坐2小时后起身活动一下;</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">4,经常拿手按摩一下头皮,挠挠;</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">5,散步的时候活动脖颈;</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">6,坚持健身4个月:锻炼有助于加强记忆。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 13 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>发怒,男女大不同</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">男性发怒的原因常常是由于权利受到威胁,比如想做某事却被禁止;而女性则是因为别人的行为不符合自己的意愿,尤其是感到被拒绝、被忽视和嫉妒时。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">心理专家认为:“女性常常希望某人或某事有所改变,但自己却无能为力,又看不到出路,于是发怒。”</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 14 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>抛硬币帮你确定心意</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">当面对两个选择时,抛硬币总能奏效,并不是因为它总能给出对的答案,而是在你把它抛在空中的那一秒里,你突然知道你希望它是什么...</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 15 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>感觉到焦虑?收拾屋子!</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">焦虑的时候,觉得烦乱的时候,收拾一下家里。整理房间和清理会让你的心越来越轻松。你会比之前更开心、更有感觉。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>- 16 -</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>成为你自己</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">你生命的前半辈子或许属于别人,活在别人的认为里。那把后半辈子还给你自己,去追随你内在的声音。</p><p><br/></p>', '', '', '/153/158\\247.html', '性格', '0', '1');
INSERT INTO `cms_article` VALUES ('248', '周瑞玲', '<p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">绝大多在亲密关系中的人并不知道该怎么样经营亲密关系,更不知道该怎样为自己的生命负责,在这里整理出在伴侣关系中的九个思维陷阱,大家不要往里面跳!<br/></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">1、必须找对人</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">其实跟谁结婚都一样,最后你需要面对的还是你自己。对方只是你爱自己的能力的一种反映。当你自己真正进步了,现有婚姻就是最好的。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">2、下一个伴侣会全然不同</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">离异和更换伴侣并不是问题的解决办法,它只不过是把问题延迟了。“更换”或许能带来一时的新鲜感和轻松感,但是摆脱的只是问题的诱因,而不是问题的本身。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">3、我必须挽救这段婚姻</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">抛开各种各样挽救关系的做法,先照顾好你自己吧。当你的生活改变了,婚姻自然也会改变。婚姻状况只是反映了你对待生活的态度。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">4、责任在他/她</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">对于你的幸福,该负责任的只有你自己。只有接受了自己,才能接受对方的爱。对方做得不好,其实是因为你不珍视你自己。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">5、我需要刺激</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">当你的婚姻显得空洞无聊时,你其实不需要刺激,而是勇气。你需要有勇气去审视现有的轨道,摆脱安逸感,走出死水一般的舒适区,本着内心的需求去冒点险。这样,你的生活会立即鲜活起来,而用不着来自外部的刺激。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">6、真爱终会到来</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">当你梦想着真爱时,其实是期待一个完美的伴侣来弥补你的不足。因为完美伴侣是不存在的,所以真爱的梦想只会给你添堵。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">7、我需要和谐</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">男人最爱以此为借口来避免深入探讨问题。若是把所有不满都掩盖在和谐的外衣下,人就得压抑自己。只有善于宣泄负面情绪的人,才懂得享受惬意和活力。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">8、说真话很伤人</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">说真话的确伤人,但也是疗伤的唯一方式。说真话是走出灰暗日常生活、建立美满关系的转折点。保留秘密或许听起来很浪漫,但是在现实中却毫不适用。打开天窗说亮话吧。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">9、我得顺着他/她</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">你这样做是因为害怕对抗。大多数婚姻不是死于两人的激战,而是在退让中变得疲弱和僵化。要适时说“不”,这对婚姻至关重要。</p><p><br/></p>', '', '', '/153/154\\248.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('249', '心理网', '<p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>一、想象中的婚姻:结婚后,就不会对任何人心动。</strong><br/></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:这属于幻想。科学研究表明多巴胺的浓度高峰平均不到30个月,你和你的伴侣依然会遇到让自己心动的人。如果要放弃这种诱惑,只能依靠平时的积累。你们对于彼此相互的关怀与帮助,增加了放弃婚姻关系的难度。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>二、想象中的婚姻:结婚后,女孩子终于有了依靠。我生气了,他会哄我。我孤独了,他会陪我。我烦恼,他也会听我倾诉。我不工作,他也可以养我。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:每个人在一段关系中都是独立的个体。夫妻、父子、兄妹、朋友都一样。譬如,你遇到烦恼的时候,他正好在工作,你打个电话说个没完。这会让双方的情绪更坏。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">最好的选择是,遇到烦恼先自我消化,等到对方有心情有时间听你倾诉,你再说。你要明白一个道理,即使两个人白头偕老,也有一个人要先离开人世,剩下的一个人依然要独自面对生活。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>三、想象中的婚姻:结婚后,尽快生小孩。早生早好,反正都是要生的。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:如果你跟你的另一半还没有做好要小孩的准备,请不要为了父母的意见就着急要孩子,也不要因为年龄的关系匆忙怀孕。请相信一个新生命的到来绝对是人生当中最大的一件事!绝不是添一双筷子那么简单的事。问问自己即便是没有财力的保障也能把他/她教育成一个优秀的人吗?</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>四、想象中的婚姻:结婚后,可以接受和对方的父母住在一起。爱他就要爱他的家人,包容对方的一切。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:社会关系应该是以夫妻关系为本位的,两人结婚之后是一个独立的小家庭,夫妻二人才是彼此的依靠和保障,而不是父母或孩子。基于这个情况上的夫妻感情和大家庭关系才是健康有序的,才不会出现婆媳交恶,翁婿交战这些不可思议的问题。切记一个家只能有一个女主人。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>五、想象中的婚姻:嫁个有钱人,少吃十年苦。娶个白富美,少奋斗十年。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:如果你需要钱,你可以嫁/娶一个富有的人,但不要把财富当做唯一的标准。还要记得他/她的钱只有他/她才有支配权,想想《昼颜》里的丽佳子。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>六、想象中的婚姻:老婆会照顾好家里的一切,会做好饭,洗干净碗,熨好衬衣,把房间打扫的明朗整洁。时不时的还会切个水果,送到我的电脑旁。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:你找的是老婆,不是妈,也不是保姆。都什么年代了,扪心自问一下,她的工作比你轻松吗?她面对社会的压力比你小吗?没有她的工资你们的家可以正常运转吗?</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">如果都是否定的答案,她为什么回来还要一个独自扛下家务事呢?要知道,她和你结婚的时候,你一定说过这辈子要好好照顾她的话。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>七、想象中的婚姻:我看上了一条价值半个月工资的裙子,他就会偷偷买下来给我惊喜。我们每年都要出过旅行,每个周末都要去高级餐厅吃烛光晚餐。所有的节日,我都会收到珍贵礼物。他会把工资卡给我,我想怎么花,就怎么花。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:婚姻关系从某种程度上来说,更像是合伙人关系,家庭是你们的项目,如何让这个项目收获大于支出是首先考虑的。你们必须有一个家庭账户,以防不备之需,一个家庭要面对的开支会比一个人更多。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">想怎么花就怎么花的观念只能让你们喝西北风。如果一个男人跟你说剩下100元给你买90元的衣服,还剩10元吃饭,那么这个男人没脑子。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>八、想象中的婚姻:天啊,想到以后和可人儿在一起就感到幸福。身材好到爆,穿衣服也很潮,说话也很有趣,不管他做什么都觉得很可爱。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:呵呵。婚后你会发现,他也是会放屁拉屎打嗝打呼噜的人。百分之九十的梗,都是用了又用的。李敖说看到胡因梦坐在马桶上呲牙咧嘴,完美被打破了。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">这是一个很平常生活场景。你也会一睁眼,发现他有眼屎和口气。所以,婚姻是会让你的爱人褪去光环的,你准备好了吗?</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>九、想象中的婚姻:我生气了想说什么就说什么,反正夫妻都是床头吵架床尾和。吵架解决不了问题的话,就冷静一下,来一场冷战好了。看谁敌得过谁。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:讲狠话确实很过瘾,但是真的很伤感情,不会说完就完了。你说一句狠话,对方会有一句更狠的话回敬你。如此恶性循环,几乎不可能理清对错。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">冷战是更恶劣的选择,因为冷着冷着可能就真的冷了。冷到最后,会分开吃饭,分开睡觉,分开消遣。没有任何一段感情,经得起面对面的冷漠。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>十、想象中的婚姻:每个人都有不完美,如果他爱我,结婚后他自然会为我改变。不是说,婚姻是两个人的磨合吗?也就是说,必须有改变。</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">现实:你先问一下自己,能不能为了他改变自己的某些习惯。比如,他喜欢周末在家吃饭,然后一起爬山,然后回家一起做简单的晚餐。吃完饭,他可能想玩一下游戏。而你希望的是周末出去吃一顿,然后逛街,逛完街再挑个有情趣的小店吃一餐,接下来是一场电影。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">谁来做妥协?谁来磨合谁?不要想着去改变一个人,只能思考如何愉悦的求同存异。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">综上所述,婚姻不是坟墓,也绝不是天堂,婚姻是铁打的家长里短流水的日子。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255);\">且行且珍惜!!</p><p><br/></p>', '', '', '/153/154\\249.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('250', '胡光秀', '<p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; text-indent: 0em; white-space: normal; background-color: rgb(255, 255, 255);\">“我堵在路上了”、“我出门晚了”……生活中,我们常常听到各种迟到的借口。事实上,一个人的时间观影响着他的行为,也暴露着他的性格特点。<br/></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; text-indent: 0em; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>有的人不仅从来不迟到,而且总是提前一点到达约会地点。</strong>这样的人对生活抱有敬畏、尊重的态度。爱惜自己的时间,也尊重别人的时间,宁愿自己等,也不愿让大家等。他们做起事情来小心谨慎、计划性强。还有一些人则习惯踩着点到达,他们习惯严格掌控自己的生活,喜欢有条不紊的完成事情,是典型的“完美主义者”。生活一旦发生突发状况,会显得有些焦虑不安。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; text-indent: 0em; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>另有一些人,则是大家眼中的“迟到大王”,没有几次能按点出现的。</strong>在心理学家皮埃尔·温特看来,这实际上表达出一种强烈渴望关注的态度,他们希望得到别人的重视、成为人群焦点。生活中,这类人通常比较自我,就像长不大的孩子一样,有些任性固执,难以接受他人的意见。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; text-indent: 0em; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>还有一部分人,不喜欢迟到,但也不会为了守时拼命赶时间。</strong>这样的人通常生活比较随意,喜欢自由自在,不轻易勉强自己。为人坦诚,不擅伪装。另有一些人,喜欢一边等人、一边不停地看时间。这类人不仅时间观念强,而且对他人也有着严格的要求,做事希望拿出“证据”,用事实说话。</p><p><br/></p>', '', '', '/153/158\\250.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('251', '张兰欣', '<p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">过分的虚荣心已成为人性中根深蒂固、难以根除的心理弱点,那么有什么方法能够趋利避害,发挥它对人有利的一面呢?心理学家告诉我们:“完全可以!”对于虚荣心,不要单纯地拒绝或者破坏它,而应该去改善它、诱导它为自己的人生加分。<br/></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>为你想要的职位穿</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">为你想要的职位穿衣,而不是你目前的职位。只有为了理想的目标穿衣打扮,给别人留下如此鲜明的印象,才会在老板的心目中留下根深蒂固的想法——她是我们的同类,她就是做这个职位最恰当的人选。这样你就能够在芸芸众生之中脱颖而出,一旦有升职机会的时候,人们脑子里首先跳出你的形象。所以为了想要的职位,你需要与这个职位相称的外套、手袋等等道具。但需要注意的是你的行头不要比老板的还要高档。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>为你理想的社交住</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">为了你理想的职业穿,也要为了你的前途选择居住。当年孟母择邻而居,选的就是一个社交圈。人们现在都知道社交为事业和生活带来的巨大影响,你住什么样的房子,与什么人做邻居,你的孩子有什么样家庭背景的玩伴,都是衡量一个家庭社会地位的硬指标。选对了适合自己社交圈的居住环境,不仅可以为自己营造理想的生活空间,交到生活和生意的伙伴,也会为孩子建立最早的社交圈,为孩子将来的成功打下坚实的基础。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>虚荣有一颗上进的心</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">对那些安于现状、不思进取的人来说,似乎他们可以淡泊名利并且有相当的理由来指责虚荣心。可是他们偷换了概念,安于现状不思进取的懒惰和淡泊名利完全是两回事,只有一个成功了的人才可以明白自己是不是淡泊名利,如果你连成功的边都没有沾到,怎么可以有权利说自己淡泊名利呢?相反,拥有恰到好处的虚荣心的人,无论是工作还是生活就会有一个明确目标,也会努力去实现它。所以只要不过分,人总是该有点虚荣心的。</p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>只有爱面子的人面子才会爱你</strong></p><p style=\"padding: 0.6em 0px; margin-top: 0px; margin-bottom: 0px; word-break: break-all; word-wrap: break-word; line-height: 1.7em; font-size: 18.2px; color: rgb(76, 76, 76); font-family: Arial; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">女人天生爱面子,喜欢漂亮,喜欢攀比,女人小小的虚荣心其实无伤大雅。哪个女人不希望自己更美丽,更让人羡慕呢?只有爱面子的人,才会促使她更注意自己的仪表和姿态,以优美的外表给别人留下好印象。从另外的角度说,爱面子也是一个人自尊心的一种表现,你只有自尊了,才会得到别人的尊重,同样的,面子是需要你自己来维护的,只有你爱面子,面子才会爱你,别人才会给你面子。</p><p><br/></p>', '', '', '/153/158\\251.html', '', '0', '1');
INSERT INTO `cms_article` VALUES ('252', '', '<p>&nbsp; <strong>版权说明</strong><br/></p>', '', '', '/161\\index.html', '', '0', '1');

-- ----------------------------
-- Table structure for cms_class_50
-- ----------------------------
DROP TABLE IF EXISTS `cms_class_50`;
CREATE TABLE `cms_class_50` (
  `basicid` int(11) NOT NULL,
  `school` varchar(220) DEFAULT NULL,
  `platform` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`basicid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_class_50
-- ----------------------------
INSERT INTO `cms_class_50` VALUES ('2', '1', '2');
INSERT INTO `cms_class_50` VALUES ('3', '3', '2');
INSERT INTO `cms_class_50` VALUES ('4', '1', '4');
INSERT INTO `cms_class_50` VALUES ('5', '2', '1');
INSERT INTO `cms_class_50` VALUES ('6', '2', '1');
INSERT INTO `cms_class_50` VALUES ('7', '1', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id（主键）',
  `comment_commentid` int(11) NOT NULL COMMENT '父评论id',
  `comment_content` varchar(2000) DEFAULT NULL COMMENT '评论的内容',
  `comment_picture` varchar(300) DEFAULT NULL COMMENT '评论时发布的图片，可上传多张图片',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `comment_type` int(11) NOT NULL DEFAULT '2' COMMENT '评论的类型：1 匿名，2 公开，默认为公开',
  `comment_peopleid` int(11) DEFAULT '0' COMMENT '评论者id，默认为非会员用户（即游客）',
  `comment_points` int(11) DEFAULT '0' COMMENT '评价打分（-1至5分）',
  `comment_basicid` int(11) NOT NULL COMMENT '（文章、商品...）绑定basicid（外键）',
  `comment_appid` int(11) DEFAULT NULL COMMENT '(文章、商品）绑定的应用编号',
  `comment_file_name` varchar(255) DEFAULT NULL COMMENT '附件文件名称',
  `comment_file_path` varchar(255) DEFAULT NULL COMMENT '附件文件路径',
  `comment_is_anonymous` int(11) DEFAULT '0' COMMENT '是否匿名',
  `comment_audit` int(1) DEFAULT '0' COMMENT '0默认显示 1:审核不通过',
  PRIMARY KEY (`comment_id`),
  KEY `index2` (`comment_basicid`) USING BTREE,
  KEY `fk_comment_people_1` (`comment_peopleid`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_basicid`) REFERENCES `basic` (`basic_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comment_peopleid`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for doctor_appointment_records
-- ----------------------------
DROP TABLE IF EXISTS `doctor_appointment_records`;
CREATE TABLE `doctor_appointment_records` (
  `rec_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `consulting_name` varchar(255) DEFAULT NULL,
  `consulting_qq` varchar(255) DEFAULT NULL,
  `consulting_phone` varchar(255) DEFAULT NULL,
  `doctor_id` int(255) NOT NULL COMMENT '医生id',
  `appointment_begin_time` varchar(255) DEFAULT NULL COMMENT '预约开始时间  ',
  `appointment_end_time` varchar(255) DEFAULT NULL COMMENT '预约结束时间',
  `description` varchar(255) DEFAULT '' COMMENT '预约详情',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作者id',
  `operate_time` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of doctor_appointment_records
-- ----------------------------
INSERT INTO `doctor_appointment_records` VALUES ('6', '1', '1', '1', '221', '2017-09-20 11:22:00', '2017-09-20 11:22:00', '1', '50', '2017-09-20 11:22:47');
INSERT INTO `doctor_appointment_records` VALUES ('7', '1', '1', '1', '221', '2017-09-20 11:23:00', '2017-09-20 11:23:00', '1', '50', '2017-09-20 11:23:56');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id(主键)',
  `manager_name` varchar(15) DEFAULT NULL COMMENT '管理员用户名',
  `manager_nickname` varchar(15) DEFAULT NULL COMMENT '管理员昵称',
  `manager_password` varchar(45) DEFAULT NULL COMMENT '管理员密码',
  `manager_roleid` int(11) DEFAULT NULL COMMENT '角色编号',
  `manager_peopleid` bigint(22) DEFAULT '0' COMMENT '用户编号即商家编号',
  `manager_time` datetime DEFAULT NULL COMMENT '管理员创建时间',
  `manager_system_skin_id` int(11) DEFAULT '0' COMMENT '管理员主界面样式',
  PRIMARY KEY (`manager_id`),
  KEY `fk_manager_role_1` (`manager_roleid`) USING BTREE,
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`manager_roleid`) REFERENCES `role` (`role_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('50', 'msopen', 'msopen', '9d8622060de5f24937b60585c3f4d66b', '48', '0', '2015-09-18 11:54:36', '0');
INSERT INTO `manager` VALUES ('51', 'edit', 'editor', 'de95b43bceeb4b998aed4aed5cef1ae7', '49', '0', '2017-09-13 14:17:49', '0');

-- ----------------------------
-- Table structure for manager_model_page
-- ----------------------------
DROP TABLE IF EXISTS `manager_model_page`;
CREATE TABLE `manager_model_page` (
  `mmp_manager_id` int(11) DEFAULT NULL COMMENT '自增长id',
  `mmp_model_id` int(11) DEFAULT NULL COMMENT '模块编号',
  `mmp_url` varchar(255) DEFAULT NULL COMMENT '默认后台显示的主界面',
  KEY `fk_manager_model_page_manager_1` (`mmp_manager_id`) USING BTREE,
  KEY `fk_manager_model_page_model_1` (`mmp_model_id`) USING BTREE,
  CONSTRAINT `manager_model_page_ibfk_1` FOREIGN KEY (`mmp_manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `manager_model_page_ibfk_2` FOREIGN KEY (`mmp_model_id`) REFERENCES `model` (`model_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员对应的每个模块的主界面自定义';

-- ----------------------------
-- Records of manager_model_page
-- ----------------------------

-- ----------------------------
-- Table structure for mdiy_arctype_50
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_arctype_50`;
CREATE TABLE `mdiy_arctype_50` (
  `basicId` int(11) NOT NULL,
  `doctype` varchar(1000) DEFAULT ' ,1,2,3',
  PRIMARY KEY (`basicId`),
  CONSTRAINT `mdiy_arctype_50_ibfk_1` FOREIGN KEY (`basicId`) REFERENCES `basic` (`basic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mdiy_arctype_50
-- ----------------------------
INSERT INTO `mdiy_arctype_50` VALUES ('221', '3');

-- ----------------------------
-- Table structure for mdiy_content_model
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_content_model`;
CREATE TABLE `mdiy_content_model` (
  `cm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `cm_tips_name` varchar(30) NOT NULL COMMENT '表单提示文字',
  `cm_table_name` varchar(20) NOT NULL COMMENT '表单名称',
  `cm_model_id` int(11) DEFAULT NULL COMMENT '模块编号',
  `cm_app_id` int(11) DEFAULT NULL COMMENT '应用编号',
  `create_by` int(11) DEFAULT NULL,
  `creaet_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cm_id`),
  KEY `fk_mdiy_content_model` (`cm_app_id`) USING BTREE,
  CONSTRAINT `mdiy_content_model_ibfk_1` FOREIGN KEY (`cm_app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='自定义模型表';

-- ----------------------------
-- Records of mdiy_content_model
-- ----------------------------
INSERT INTO `mdiy_content_model` VALUES ('5', '医生', 'mdiy_doctor_50', '0', '1', null, null, null, null);

-- ----------------------------
-- Table structure for mdiy_content_mode_field
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_content_mode_field`;
CREATE TABLE `mdiy_content_mode_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段自增长id',
  `field_tipsname` varchar(30) DEFAULT NULL COMMENT '字段提示文字',
  `field_fieldname` varchar(20) DEFAULT NULL COMMENT '字段名称',
  `field_type` int(11) DEFAULT NULL COMMENT '字段类型（如1.单行，2.多行，3.图片，等）',
  `field_default` varchar(250) DEFAULT NULL COMMENT '字段默认值',
  `field_isnull` int(11) DEFAULT NULL COMMENT '字段是否为空 0:必填 1:可选',
  `field_cmid` int(11) DEFAULT NULL COMMENT '关联内容模型表id',
  `field_sort` int(11) DEFAULT NULL COMMENT '字段排序',
  `field_issearch` int(255) DEFAULT NULL COMMENT '字段是否支持后台搜索0：不支持，1：支持',
  `field_length` int(11) DEFAULT '1' COMMENT '字段长度',
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del` int(1) DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  KEY `fk_mdiy_content_mode_field_mdiy_content_model_1` (`field_cmid`) USING BTREE,
  CONSTRAINT `mdiy_content_mode_field_ibfk_1` FOREIGN KEY (`field_cmid`) REFERENCES `mdiy_content_model` (`cm_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='自定义内容模型关联字段表';

-- ----------------------------
-- Records of mdiy_content_mode_field
-- ----------------------------
INSERT INTO `mdiy_content_mode_field` VALUES ('16', '收费标准(元/小时)', 'docprice', '4', null, '0', '5', null, '0', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for mdiy_dict
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_dict`;
CREATE TABLE `mdiy_dict` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `app_id` int(11) DEFAULT NULL COMMENT '应用编号',
  `dict_value` varchar(100) NOT NULL COMMENT '数据值',
  `dict_label` varchar(100) NOT NULL COMMENT '标签名',
  `dict_type` varchar(100) NOT NULL COMMENT '类型',
  `dict_description` varchar(100) NOT NULL COMMENT '描述',
  `dict_sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（升序）',
  `dict_parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `dict_remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_by` int(64) DEFAULT '0' COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(64) DEFAULT '0' COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`dict_id`),
  KEY `fk_mdiy_dict` (`app_id`) USING BTREE,
  CONSTRAINT `mdiy_dict_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of mdiy_dict
-- ----------------------------

-- ----------------------------
-- Table structure for mdiy_doctor_50
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_doctor_50`;
CREATE TABLE `mdiy_doctor_50` (
  `basicId` int(11) NOT NULL,
  `docprice` int(11) DEFAULT NULL,
  PRIMARY KEY (`basicId`),
  CONSTRAINT `mdiy_doctor_50_ibfk_1` FOREIGN KEY (`basicId`) REFERENCES `basic` (`basic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mdiy_doctor_50
-- ----------------------------
INSERT INTO `mdiy_doctor_50` VALUES ('221', '50');
INSERT INTO `mdiy_doctor_50` VALUES ('223', '80');
INSERT INTO `mdiy_doctor_50` VALUES ('241', '40');
INSERT INTO `mdiy_doctor_50` VALUES ('242', '50');

-- ----------------------------
-- Table structure for mdiy_form
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_form`;
CREATE TABLE `mdiy_form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `form_tips_name` varchar(30) NOT NULL COMMENT '自定义表单提示文字',
  `form_table_name` varchar(20) NOT NULL COMMENT '自定义表单表名',
  `form_app_id` int(11) NOT NULL COMMENT '自定义表单关联的应用编号',
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`form_id`),
  KEY `fk_mdiy_form` (`form_app_id`) USING BTREE,
  CONSTRAINT `mdiy_form_ibfk_1` FOREIGN KEY (`form_app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义表单表';

-- ----------------------------
-- Records of mdiy_form
-- ----------------------------

-- ----------------------------
-- Table structure for mdiy_form_field
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_form_field`;
CREATE TABLE `mdiy_form_field` (
  `ff_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段自增长id',
  `ff_tipsname` varchar(30) DEFAULT NULL COMMENT '字段提示文字',
  `ff_fieldname` varchar(20) DEFAULT NULL COMMENT '字段名称',
  `ff_type` int(11) DEFAULT NULL COMMENT '字段类型（如1.单行，2.多行，3.图片，等）',
  `ff_default` varchar(250) DEFAULT NULL COMMENT '字段的默认值',
  `ff_isnull` int(11) DEFAULT NULL COMMENT '字段是否为空',
  `ff_sort` int(11) DEFAULT NULL COMMENT '自定义表单的排序',
  `ff_formid` int(11) DEFAULT NULL COMMENT '字段管理的表单id',
  PRIMARY KEY (`ff_id`),
  KEY `fk_mdiy_form_field` (`ff_formid`) USING BTREE,
  CONSTRAINT `mdiy_form_field_ibfk_1` FOREIGN KEY (`ff_formid`) REFERENCES `mdiy_form` (`form_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义表单字段表';

-- ----------------------------
-- Records of mdiy_form_field
-- ----------------------------

-- ----------------------------
-- Table structure for mdiy_mooc_50
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_mooc_50`;
CREATE TABLE `mdiy_mooc_50` (
  `basicid` int(11) NOT NULL,
  `images` varchar(225) DEFAULT NULL,
  `descripone` varchar(225) DEFAULT NULL,
  `descriptwo` varchar(225) DEFAULT NULL,
  `descripth` varchar(225) DEFAULT NULL,
  `descripfo` varchar(225) DEFAULT NULL,
  `descripfi` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`basicid`),
  CONSTRAINT `mdiy_mooc_50_ibfk_1` FOREIGN KEY (`basicid`) REFERENCES `basic` (`basic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mdiy_mooc_50
-- ----------------------------

-- ----------------------------
-- Table structure for mdiy_page
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_page`;
CREATE TABLE `mdiy_page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `page_app_id` int(11) NOT NULL COMMENT '应用id',
  `page_model_id` int(11) DEFAULT NULL COMMENT '模块id',
  `page_path` varchar(255) DEFAULT NULL COMMENT '自定义页面绑定模板的路径',
  `page_title` varchar(255) DEFAULT NULL COMMENT '自定义页面标题',
  `page_key` varchar(255) DEFAULT NULL COMMENT '自定义页面访问路径',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `index_page_key` (`page_key`) USING BTREE,
  KEY `index_page_app_id` (`page_app_id`) USING BTREE,
  KEY `index_page_model_id` (`page_model_id`) USING BTREE,
  CONSTRAINT `mdiy_page_ibfk_1` FOREIGN KEY (`page_app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='自定义页面表';

-- ----------------------------
-- Records of mdiy_page
-- ----------------------------
INSERT INTO `mdiy_page` VALUES ('1', '1', null, 'article-content.htm', 'ff', '/reg', null);

-- ----------------------------
-- Table structure for mdiy_search
-- ----------------------------
DROP TABLE IF EXISTS `mdiy_search`;
CREATE TABLE `mdiy_search` (
  `search_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `search_name` varchar(20) NOT NULL COMMENT '搜索名称',
  `search_templets` varchar(50) NOT NULL COMMENT '搜索结果模版',
  `search_app_id` int(11) NOT NULL COMMENT '搜索管理的应用id',
  `search_type` varchar(20) NOT NULL DEFAULT 'cms' COMMENT '搜索类型',
  PRIMARY KEY (`search_id`),
  KEY `fk_mdiy_search` (`search_app_id`) USING BTREE,
  CONSTRAINT `mdiy_search_ibfk_1` FOREIGN KEY (`search_app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='自定义搜索表';

-- ----------------------------
-- Records of mdiy_search
-- ----------------------------
INSERT INTO `mdiy_search` VALUES ('1', '头部', 'search.htm', '1', 'cms');
INSERT INTO `mdiy_search` VALUES ('9', '列表页面搜索', 'search-list.htm', '1', 'cms');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块自增长id',
  `model_title` varchar(150) DEFAULT NULL COMMENT '模块标题',
  `model_code` varchar(255) DEFAULT NULL COMMENT '模块编码',
  `model_modelid` int(22) DEFAULT NULL COMMENT '模块的父模块id',
  `model_url` varchar(255) DEFAULT NULL COMMENT '模块连接地址',
  `model_datetime` datetime DEFAULT NULL,
  `model_icon` varchar(120) DEFAULT NULL COMMENT '模块图标',
  `model_modelmanagerid` int(11) DEFAULT NULL COMMENT '模块关联的关联员id',
  `model_sort` int(11) DEFAULT NULL COMMENT '模块的排序',
  `model_ismenu` int(1) DEFAULT NULL COMMENT '模块是否是菜单',
  `model_parent_ids` varchar(300) DEFAULT NULL COMMENT '父级编号集合，从小到大排序',
  PRIMARY KEY (`model_id`) USING BTREE,
  UNIQUE KEY `sys_c009201` (`model_id`) USING BTREE,
  KEY `model_modelid` (`model_modelid`) USING BTREE,
  KEY `model_code` (`model_code`) USING BTREE,
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`model_modelid`) REFERENCES `model` (`model_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块表';

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('1', '内容管理', '02000000', null, '', '2014-08-01 16:19:50', '&#xe77a;', '0', '0', '1', null);
INSERT INTO `model` VALUES ('4', '管理员管理', '01020000', '23', 'basic/manager/index.do', '2014-08-03 09:15:02', '', '0', null, '1', null);
INSERT INTO `model` VALUES ('5', '角色管理', '01010000', '23', 'basic/role/index.do', '2014-08-03 09:15:14', '', '0', null, '1', null);
INSERT INTO `model` VALUES ('7', '栏目管理', '02990000', '1', 'cms/column/index.do', '2014-08-03 09:16:29', '', '0', '0', '1', '1');
INSERT INTO `model` VALUES ('8', '文章管理', '02980000', '1', 'cms/article/index.do', '2014-08-03 09:17:10', '', '0', '0', '1', '1');
INSERT INTO `model` VALUES ('23', '权限管理', '01000000', null, '', '2014-09-08 08:12:22', '&#xe950;', '0', '3', '1', null);
INSERT INTO `model` VALUES ('80', '静态化', '02020000', '1', 'cms/generate/index.do', '2014-12-18 11:37:15', '', '0', '0', '1', '1');
INSERT INTO `model` VALUES ('84', '系统管理', '12000000', null, '', '2014-12-18 18:30:24', '&#xe71f;', '0', '4', '1', null);
INSERT INTO `model` VALUES ('86', '应用设置', '12010000', '84', 'app/-1/edit.do', '2014-12-18 18:31:59', '', '0', '0', '1', '84');
INSERT INTO `model` VALUES ('91', '模板管理', '12020000', '84', 'template/queryTemplateSkin.do', null, '', '0', '0', '1', '84');
INSERT INTO `model` VALUES ('92', '查看', '02990001', '7', 'cms:column:view', '2017-09-04 11:05:24', null, '0', '0', '0', '7');
INSERT INTO `model` VALUES ('93', '查看', '02980001', '8', 'article:view', '2017-09-04 11:05:58', null, '0', '0', '0', '8');
INSERT INTO `model` VALUES ('94', '查看', '02020001', '80', 'cms:generate:view', '2017-09-04 11:07:50', null, '0', '0', '0', '1,80');
INSERT INTO `model` VALUES ('96', '菜单管理', '01030000', '23', 'model/index.do', '2017-09-04 11:09:26', null, '0', '0', '1', '23');
INSERT INTO `model` VALUES ('97', '查看', '01020001', '4', 'manager:view', '2017-09-04 11:09:58', '', '0', '0', '0', '4');
INSERT INTO `model` VALUES ('98', '查看', '01010001', '5', 'role:view', '2017-09-04 11:10:20', '', '0', '0', '0', '5');
INSERT INTO `model` VALUES ('99', '查看', '01030001', '96', 'model:view', '2017-09-04 11:10:43', '', '0', '0', '0', '23,96');
INSERT INTO `model` VALUES ('100', '查看', '12020001', '91', 'template:view', '2017-09-04 11:12:02', '', '0', '0', '0', '84,91');
INSERT INTO `model` VALUES ('101', '查看', '12010001', '86', 'app:view', '2017-09-04 11:12:46', '', '0', '0', '0', '84,86');
INSERT INTO `model` VALUES ('115', '删除', '02980003', '8', 'article:del', '2017-09-04 13:24:41', '', '0', '0', '0', '8');
INSERT INTO `model` VALUES ('116', '修改', '02980004', '8', 'article:update', '2017-09-04 13:24:58', '', '0', '0', '0', '8');
INSERT INTO `model` VALUES ('117', '新增', '02980002', '8', 'article:save', '2017-09-04 13:25:37', null, '0', '0', '0', '8');
INSERT INTO `model` VALUES ('118', '生成主页', '02020002', '80', 'cms:generate:index', '2017-09-04 13:31:16', null, '0', '0', '0', '1,80');
INSERT INTO `model` VALUES ('119', '生成栏目', '02020003', '80', 'cms:generate:column', '2017-09-04 13:31:47', null, '0', '0', '0', '1,80');
INSERT INTO `model` VALUES ('120', '生成文章', '02020004', '80', 'cms:generate:article', '2017-09-04 13:32:14', null, '0', '0', '0', '1,80');
INSERT INTO `model` VALUES ('124', '删除', '01020003', '4', 'manager:del', '2017-09-04 14:08:52', null, '0', '0', '0', '4');
INSERT INTO `model` VALUES ('125', '修改', '01020004', '4', 'manager:update', '2017-09-04 14:09:24', null, '0', '0', '0', '4');
INSERT INTO `model` VALUES ('126', '新增', '01020002', '4', 'manager:save', '2017-09-04 14:09:45', null, '0', '0', '0', '4');
INSERT INTO `model` VALUES ('127', '删除', '01010003', '5', 'role:del', '2017-09-04 14:10:56', null, '0', '0', '0', '5');
INSERT INTO `model` VALUES ('128', '修改', '01010004', '5', 'role:update', '2017-09-04 14:11:36', null, '0', '0', '0', '5');
INSERT INTO `model` VALUES ('129', '新增', '01010002', '5', 'role:save', '2017-09-04 14:12:09', null, '0', '0', '0', '5');
INSERT INTO `model` VALUES ('130', '删除', '01030003', '96', 'model:del', '2017-09-04 14:13:05', null, '0', '0', '0', '23,96');
INSERT INTO `model` VALUES ('131', '修改', '01030004', '96', 'model:update', '2017-09-04 14:13:34', null, '0', '0', '0', '23,96');
INSERT INTO `model` VALUES ('132', '新增', '01030002', '96', 'model:save', '2017-09-04 14:14:03', null, '0', '0', '0', '23,96');
INSERT INTO `model` VALUES ('133', '修改', '12010004', '86', 'app:update', '2017-09-04 14:14:42', null, '0', '0', '0', '84,86');
INSERT INTO `model` VALUES ('134', '删除', '12020003', '91', 'template:del', '2017-09-04 14:16:25', null, '0', '0', '0', '84,91');
INSERT INTO `model` VALUES ('135', '修改', '12020004', '91', 'template:update', '2017-09-04 14:16:54', null, '0', '0', '0', '84,91');
INSERT INTO `model` VALUES ('136', '上传', '12020002', '91', 'template:upload', '2017-09-04 14:18:20', null, '0', '0', '0', '84,91');
INSERT INTO `model` VALUES ('152', '预约管理', '03000000', null, '', '2017-09-18 10:42:18', '', '0', '2', '1', null);
INSERT INTO `model` VALUES ('153', '预约管理', '03010000', '152', 'cms/doctorAppointment/index.do', '2017-09-18 10:43:05', '', '0', '0', '1', '152');
INSERT INTO `model` VALUES ('154', '查看', '03010100', '153', 'cms:doctorAppointment:view', '2017-09-18 10:46:08', null, '0', '0', '0', '152,153');
INSERT INTO `model` VALUES ('155', '专家管理', '04000000', null, '', '2017-09-20 16:13:39', '', '0', '1', '1', null);
INSERT INTO `model` VALUES ('156', '专家类别管理', '04010000', '155', 'cms/column/index.do?isDoctor=true', '2017-09-20 16:16:24', '', '0', '0', '1', '155');
INSERT INTO `model` VALUES ('157', '专家管理', '04020000', '155', 'cms/article/index.do?isDoctor=true', '2017-09-20 16:17:36', '', '0', '0', '1', '155');
INSERT INTO `model` VALUES ('158', '查看', '04010100', '156', 'cms:column:view', '2017-09-20 16:18:55', '', '0', '0', '0', '155,156');
INSERT INTO `model` VALUES ('159', '查看', '04020100', '157', null, '2017-09-20 16:19:12', null, '0', '0', '0', '155,157');

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `people_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '增长自id',
  `people_phone` varchar(30) DEFAULT NULL COMMENT '手机号码',
  `people_name` varchar(30) DEFAULT NULL COMMENT '陆登账号',
  `people_password` varchar(50) DEFAULT NULL COMMENT '陆登密码',
  `people_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `people_app_id` int(11) NOT NULL COMMENT '应用编号',
  `people_mail` varchar(120) DEFAULT NULL COMMENT '用户邮箱',
  `people_state` int(2) DEFAULT '0' COMMENT '用户状态',
  `people_code` varchar(15) DEFAULT NULL COMMENT '随机验证码',
  `people_codesenddate` datetime DEFAULT NULL COMMENT '发送验证码时间',
  `people_phonecheck` int(1) DEFAULT '0' COMMENT '1手机验证通过',
  `people_maillcheck` int(1) DEFAULT '0' COMMENT '1邮箱验证通过',
  PRIMARY KEY (`people_id`),
  KEY `fk_people` (`people_app_id`) USING BTREE,
  CONSTRAINT `people_ibfk_1` FOREIGN KEY (`people_app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='户用基础表';

-- ----------------------------
-- Records of people
-- ----------------------------

-- ----------------------------
-- Table structure for people_user
-- ----------------------------
DROP TABLE IF EXISTS `people_user`;
CREATE TABLE `people_user` (
  `pu_people_id` int(11) NOT NULL COMMENT '用户id关联people表的（people_id）',
  `pu_real_name` varchar(50) DEFAULT NULL COMMENT '用户真实名称',
  `pu_address` varchar(200) DEFAULT NULL COMMENT '用户地址',
  `pu_icon` varchar(200) DEFAULT NULL COMMENT '用户头像图标地址',
  `pu_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `pu_sex` int(2) DEFAULT NULL COMMENT '用户性别(0.未知、1.男、2.女)',
  `pu_birthday` date DEFAULT NULL COMMENT '用户出生年月日',
  `pu_card` varchar(255) DEFAULT NULL COMMENT '身份证',
  `pu_province` int(11) DEFAULT '0' COMMENT '省',
  `pu_city` int(11) DEFAULT '0' COMMENT '城市',
  `pu_district` int(11) DEFAULT '0' COMMENT '区',
  `pu_street` int(11) DEFAULT '0' COMMENT '街道',
  PRIMARY KEY (`pu_people_id`),
  KEY `pu_people_id` (`pu_people_id`) USING BTREE,
  CONSTRAINT `people_user_ibfk_1` FOREIGN KEY (`pu_people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基础信息表';

-- ----------------------------
-- Records of people_user
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id，自增长',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名',
  `role_managerid` int(11) DEFAULT '0' COMMENT '角色管理员编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('48', '超级管理员', '50');
INSERT INTO `role` VALUES ('49', '内容编辑角色', '50');

-- ----------------------------
-- Table structure for role_model
-- ----------------------------
DROP TABLE IF EXISTS `role_model`;
CREATE TABLE `role_model` (
  `rm_modelid` int(22) DEFAULT NULL COMMENT '模块编号',
  `rm_roleid` int(22) DEFAULT NULL COMMENT '角色编号',
  UNIQUE KEY `index` (`rm_modelid`,`rm_roleid`) USING BTREE,
  KEY `rm_modelid` (`rm_modelid`) USING BTREE,
  KEY `fk_role_model_role_1` (`rm_roleid`) USING BTREE,
  CONSTRAINT `fk_role_model_role_1` FOREIGN KEY (`rm_roleid`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `role_model_ibfk_1` FOREIGN KEY (`rm_modelid`) REFERENCES `model` (`model_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色模块关联表';

-- ----------------------------
-- Records of role_model
-- ----------------------------
INSERT INTO `role_model` VALUES ('1', '48');
INSERT INTO `role_model` VALUES ('1', '49');
INSERT INTO `role_model` VALUES ('4', '48');
INSERT INTO `role_model` VALUES ('5', '48');
INSERT INTO `role_model` VALUES ('7', '48');
INSERT INTO `role_model` VALUES ('7', '49');
INSERT INTO `role_model` VALUES ('8', '48');
INSERT INTO `role_model` VALUES ('8', '49');
INSERT INTO `role_model` VALUES ('23', '48');
INSERT INTO `role_model` VALUES ('80', '48');
INSERT INTO `role_model` VALUES ('80', '49');
INSERT INTO `role_model` VALUES ('84', '48');
INSERT INTO `role_model` VALUES ('86', '48');
INSERT INTO `role_model` VALUES ('91', '48');
INSERT INTO `role_model` VALUES ('92', '48');
INSERT INTO `role_model` VALUES ('92', '49');
INSERT INTO `role_model` VALUES ('93', '48');
INSERT INTO `role_model` VALUES ('93', '49');
INSERT INTO `role_model` VALUES ('94', '48');
INSERT INTO `role_model` VALUES ('94', '49');
INSERT INTO `role_model` VALUES ('96', '48');
INSERT INTO `role_model` VALUES ('97', '48');
INSERT INTO `role_model` VALUES ('98', '48');
INSERT INTO `role_model` VALUES ('99', '48');
INSERT INTO `role_model` VALUES ('100', '48');
INSERT INTO `role_model` VALUES ('101', '48');
INSERT INTO `role_model` VALUES ('115', '48');
INSERT INTO `role_model` VALUES ('115', '49');
INSERT INTO `role_model` VALUES ('116', '48');
INSERT INTO `role_model` VALUES ('116', '49');
INSERT INTO `role_model` VALUES ('117', '48');
INSERT INTO `role_model` VALUES ('117', '49');
INSERT INTO `role_model` VALUES ('118', '48');
INSERT INTO `role_model` VALUES ('118', '49');
INSERT INTO `role_model` VALUES ('119', '48');
INSERT INTO `role_model` VALUES ('119', '49');
INSERT INTO `role_model` VALUES ('120', '48');
INSERT INTO `role_model` VALUES ('120', '49');
INSERT INTO `role_model` VALUES ('124', '48');
INSERT INTO `role_model` VALUES ('125', '48');
INSERT INTO `role_model` VALUES ('126', '48');
INSERT INTO `role_model` VALUES ('127', '48');
INSERT INTO `role_model` VALUES ('128', '48');
INSERT INTO `role_model` VALUES ('129', '48');
INSERT INTO `role_model` VALUES ('130', '48');
INSERT INTO `role_model` VALUES ('131', '48');
INSERT INTO `role_model` VALUES ('132', '48');
INSERT INTO `role_model` VALUES ('133', '48');
INSERT INTO `role_model` VALUES ('134', '48');
INSERT INTO `role_model` VALUES ('136', '48');
INSERT INTO `role_model` VALUES ('152', '48');
INSERT INTO `role_model` VALUES ('153', '48');
INSERT INTO `role_model` VALUES ('154', '48');
INSERT INTO `role_model` VALUES ('155', '48');
INSERT INTO `role_model` VALUES ('156', '48');
INSERT INTO `role_model` VALUES ('157', '48');
INSERT INTO `role_model` VALUES ('158', '48');
INSERT INTO `role_model` VALUES ('159', '48');

-- ----------------------------
-- Table structure for system_skin
-- ----------------------------
DROP TABLE IF EXISTS `system_skin`;
CREATE TABLE `system_skin` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `ss_backgroundimg` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `ss_color` varchar(255) DEFAULT NULL COMMENT '字体颜色',
  `ss_css` varchar(255) DEFAULT NULL COMMENT '样式',
  `ss_datetime` datetime DEFAULT NULL COMMENT '生成时间',
  `ss_app_id` int(11) DEFAULT NULL COMMENT '0后台发布大于０表示是应用自定义',
  `ss_category_id` int(11) DEFAULT NULL COMMENT '主题分类',
  PRIMARY KEY (`ss_id`),
  KEY `fk_system_skin_app_1` (`ss_app_id`) USING BTREE,
  CONSTRAINT `system_skin_ibfk_1` FOREIGN KEY (`ss_app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台皮肤管理表';

-- ----------------------------
-- Records of system_skin
-- ----------------------------
