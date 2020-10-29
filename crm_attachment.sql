/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : tb_stu

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-10-08 21:15:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `crm_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `crm_attachment`;
CREATE TABLE `crm_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `att_type` varchar(20) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mo4u1f5i9c0uq531tkeqaw5kd` (`file_path`),
  KEY `FKmkoq53o6qwxpmiyerl1vm7vus` (`member_id`),
  CONSTRAINT `FKmkoq53o6qwxpmiyerl1vm7vus` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_member`
-- ----------------------------
DROP TABLE IF EXISTS `crm_member`;
CREATE TABLE `crm_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `real_name` varchar(64) NOT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3w4x463xehrckku45kvs911ml` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_member
-- ----------------------------
INSERT INTO `crm_member` VALUES ('1', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'admin', '', '768870379@qq.com', 'GIRL', '2017-06-30 00:00:00', '管理员', '18676037292', null);
INSERT INTO `crm_member` VALUES ('41', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'gadmin', '', '2024235725@qq.com', 'BOY', '2020-10-07 00:00:00', 'gadmin', '13022778111', null);
INSERT INTO `crm_member` VALUES ('44', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'register', '', '2024235726@qq.com', 'BOY', '2020-10-07 00:00:00', 'register', '13022778112', null);
INSERT INTO `crm_member` VALUES ('45', '3ea87a56da3844b420ec2925ae922bc731ec16a4fc44dcbeafdad49b0e61d39c', '121212', '', '121212@qq.com', 'BOY', '2020-10-08 20:09:25', 'qian', '121212', null);

-- ----------------------------
-- Table structure for `crm_member_role`
-- ----------------------------
DROP TABLE IF EXISTS `crm_member_role`;
CREATE TABLE `crm_member_role` (
  `member_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKb17jj8ou6rp2lkxb5xen5tixe` (`role_id`),
  KEY `FK76a8mc5mub4tu1gndxph4ypls` (`member_id`),
  CONSTRAINT `FK76a8mc5mub4tu1gndxph4ypls` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`),
  CONSTRAINT `FKb17jj8ou6rp2lkxb5xen5tixe` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_member_role
-- ----------------------------
INSERT INTO `crm_member_role` VALUES ('41', '1');
INSERT INTO `crm_member_role` VALUES ('44', '6');

-- ----------------------------
-- Table structure for `crm_resource`
-- ----------------------------
DROP TABLE IF EXISTS `crm_resource`;
CREATE TABLE `crm_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fun_urls` varchar(1024) DEFAULT NULL,
  `menu_url` varchar(128) DEFAULT NULL,
  `res_key` varchar(128) NOT NULL,
  `res_name` varchar(128) NOT NULL,
  `res_type` varchar(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ic22mdco0hjpt8qjosdnyhxcx` (`res_key`),
  KEY `FKo4megp72bdlng5bpjmo56v1wk` (`parent_id`),
  CONSTRAINT `FKo4megp72bdlng5bpjmo56v1wk` FOREIGN KEY (`parent_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_resource
-- ----------------------------
INSERT INTO `crm_resource` VALUES ('1', '', '', 'system', '系统管理', 'MENU', '', null, '0');
INSERT INTO `crm_resource` VALUES ('3', '/system/member/list', '/system/member', 'system-member', '用户管理', 'MENU', '', '1', null);
INSERT INTO `crm_resource` VALUES ('10', '/system/role/list,/system/role/resource/tree', '/system/role', 'system-role', '角色管理', 'MENU', '', '1', null);
INSERT INTO `crm_resource` VALUES ('11', '/system/resource/list', '/system/resource', 'system-resource', '资源管理', 'MENU', '', '1', null);
INSERT INTO `crm_resource` VALUES ('12', '', '', 'role-create', '创建角色', 'FUNCTION', '', '10', null);
INSERT INTO `crm_resource` VALUES ('13', '', '/system/role/delete', 'role-delete', '删除角色', 'FUNCTION', '', '10', null);
INSERT INTO `crm_resource` VALUES ('14', '/system/role/update,/system/role/save', '', 'role-save', '保存编辑', 'FUNCTION', '', '10', null);
INSERT INTO `crm_resource` VALUES ('17', '/system/role/resource/save', '', 'reole-resource-save', '分配资源', 'FUNCTION', '', '10', null);
INSERT INTO `crm_resource` VALUES ('18', '/system/resource/form,/system/resource/parent/tree,/system/resource/save', '', 'resource-create', '创建资源', 'FUNCTION', '', '11', null);
INSERT INTO `crm_resource` VALUES ('19', '/system/resource/form,/system/resource/parent/tree,/system/resource/save', '', 'resource-edit', '编辑', 'FUNCTION', '', '11', null);
INSERT INTO `crm_resource` VALUES ('20', '/system/resource/delete', '', 'resource-delete', '删除', 'FUNCTION', '', '11', null);
INSERT INTO `crm_resource` VALUES ('21', '/system/member/form,/system/member/save', '', 'member-create', '创建用户', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('22', '/system/member/delete', '', 'member-delete', '删除用户', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('23', '/system/member/form,/system/member/update', '', 'member-edit', '编辑用户', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('26', '/system/member/password/reset', '', 'member-reset-password', '重置密码', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('46', '', '', 'applicant-inquery', '问卷管理', 'MENU', '', null, null);
INSERT INTO `crm_resource` VALUES ('47', '', '', 'applicant-create', '创建调查问卷内容', 'MENU', '', '46', null);
INSERT INTO `crm_resource` VALUES ('49', '', '', 'applicant-check', '我的问卷', 'MENU', '', '46', null);
INSERT INTO `crm_resource` VALUES ('50', '', '', 'admin-verify', '审核发布问卷', 'MENU', '', null, null);
INSERT INTO `crm_resource` VALUES ('51', '', '', 'admin-examine', '审核问卷内容', 'MENU', '', '50', null);
INSERT INTO `crm_resource` VALUES ('53', '', '', 'interviewee-inquery', '填写问卷', 'MENU', '', null, null);
INSERT INTO `crm_resource` VALUES ('54', '', '', 'interviewee-fill', '填写问卷', 'MENU', '', '53', null);
INSERT INTO `crm_resource` VALUES ('55', '', '', 'intervieww-inquery', '查看填写问卷历史', 'MENU', '', '53', null);

-- ----------------------------
-- Table structure for `crm_role`
-- ----------------------------
DROP TABLE IF EXISTS `crm_role`;
CREATE TABLE `crm_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(512) DEFAULT NULL,
  `role_name` varchar(30) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r0jsnwb00o0n376ghyuahuqfg` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_role
-- ----------------------------
INSERT INTO `crm_role` VALUES ('1', '拥有用户信息管理的权限，以及审核发布问卷的权限', '管理员', '');
INSERT INTO `crm_role` VALUES ('5', '拥有所有权限', '超级管理员', '');
INSERT INTO `crm_role` VALUES ('6', '拥有问卷管理和填写问卷的权限', '注册用户', '');

-- ----------------------------
-- Table structure for `crm_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `crm_role_resource`;
CREATE TABLE `crm_role_resource` (
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  KEY `FKjwyt61kixx52wper9y0li38c2` (`resource_id`),
  KEY `FKasi3s87a7p562cyw0jt3m0isf` (`role_id`),
  CONSTRAINT `FKasi3s87a7p562cyw0jt3m0isf` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`),
  CONSTRAINT `FKjwyt61kixx52wper9y0li38c2` FOREIGN KEY (`resource_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_role_resource
-- ----------------------------
INSERT INTO `crm_role_resource` VALUES ('1', '1');
INSERT INTO `crm_role_resource` VALUES ('1', '3');
INSERT INTO `crm_role_resource` VALUES ('1', '21');
INSERT INTO `crm_role_resource` VALUES ('1', '22');
INSERT INTO `crm_role_resource` VALUES ('1', '23');
INSERT INTO `crm_role_resource` VALUES ('1', '26');
INSERT INTO `crm_role_resource` VALUES ('1', '50');
INSERT INTO `crm_role_resource` VALUES ('1', '51');
INSERT INTO `crm_role_resource` VALUES ('6', '46');
INSERT INTO `crm_role_resource` VALUES ('6', '47');
INSERT INTO `crm_role_resource` VALUES ('6', '49');
INSERT INTO `crm_role_resource` VALUES ('6', '53');
INSERT INTO `crm_role_resource` VALUES ('6', '54');
INSERT INTO `crm_role_resource` VALUES ('6', '55');

-- ----------------------------
-- Table structure for `t_answer`
-- ----------------------------
DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer` (
  `note_id` int(11) NOT NULL,
  `par_time` datetime DEFAULT NULL,
  `voter` varchar(50) DEFAULT NULL,
  `anon` int(1) NOT NULL,
  `ans` varchar(50) DEFAULT NULL,
  `que_id` int(11) DEFAULT NULL,
  KEY `que_id` (`que_id`),
  KEY `note_id` (`note_id`),
  CONSTRAINT `t_answer_ibfk_3` FOREIGN KEY (`que_id`) REFERENCES `t_question` (`req_id`),
  CONSTRAINT `t_answer_ibfk_4` FOREIGN KEY (`note_id`) REFERENCES `t_note` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `t_note`
-- ----------------------------
DROP TABLE IF EXISTS `t_note`;
CREATE TABLE `t_note` (
  `note_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `state` varchar(50) NOT NULL,
  `anon` int(1) NOT NULL,
  `creator` varchar(64) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '问卷表',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_note
-- ----------------------------
INSERT INTO `t_note` VALUES ('1', '经济调查', '1', '2020-10-08 17:00:33', '2020-10-08 17:00:37', '1', '1', '1', '2020-10-08 17:00:49');

-- ----------------------------
-- Table structure for `t_option`
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `opt_id` int(11) NOT NULL,
  `new_name` int(50) NOT NULL,
  `new_con` varchar(50) NOT NULL,
  `que_id` int(11) DEFAULT NULL,
  KEY `题号` (`new_name`),
  KEY `问题ID` (`que_id`),
  CONSTRAINT `问题ID` FOREIGN KEY (`que_id`) REFERENCES `t_question` (`req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_option
-- ----------------------------

-- ----------------------------
-- Table structure for `t_question`
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `required` int(1) NOT NULL,
  `type` varchar(20) NOT NULL,
  `note_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `number` (`note_id`),
  CONSTRAINT `问卷ID` FOREIGN KEY (`note_id`) REFERENCES `t_note` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '问卷1', '1', '经济', '1');
