/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : tb_stu

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-10-29 21:08:26
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_member
-- ----------------------------
INSERT INTO `crm_member` VALUES ('1', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'admin', '', '768870379@qq.com', 'GIRL', '2017-06-30 00:00:00', '管理员', '18676037292', null);
INSERT INTO `crm_member` VALUES ('41', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'gadmin', '', '2024235725@qq.com', 'BOY', '2020-10-07 00:00:00', 'gadmin', '13022778111', null);
INSERT INTO `crm_member` VALUES ('44', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'register', '', '2024235726@qq.com', 'BOY', '2020-10-07 00:00:00', 'register', '13022778112', null);
INSERT INTO `crm_member` VALUES ('45', '3ea87a56da3844b420ec2925ae922bc731ec16a4fc44dcbeafdad49b0e61d39c', '121212', '', '121212@qq.com', 'BOY', '2020-10-08 20:09:25', 'qian', '121212', null);
INSERT INTO `crm_member` VALUES ('46', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'fxrfxr', '', '123456@qq.com', 'GIRL', '2020-10-09 00:00:00', 'fxr', '1234567', null);
INSERT INTO `crm_member` VALUES ('47', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'feixin', '', 'feixin@qq.com', 'BOY', '2020-10-23 14:06:56', 'fei', 'feixin', null);
INSERT INTO `crm_member` VALUES ('48', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'fxinr', '', 'fxinr@qq.com', 'BOY', '2020-10-23 14:40:54', 'ruirui', 'fxinr', null);
INSERT INTO `crm_member` VALUES ('49', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'aaaaa', '', 'aaaaa@qq.com', 'BOY', '2020-10-23 14:42:19', '嗷嗷', 'aaaaa', null);

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
INSERT INTO `crm_member_role` VALUES ('46', '6');
INSERT INTO `crm_member_role` VALUES ('48', '6');
INSERT INTO `crm_member_role` VALUES ('49', '6');

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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

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
INSERT INTO `crm_resource` VALUES ('23', '/system/member/form,/system/member/update,/system/member/roles', '', 'member-edit', '编辑用户', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('26', '/system/member/password/reset', '', 'member-reset-password', '重置密码', 'FUNCTION', '', '3', null);
INSERT INTO `crm_resource` VALUES ('46', '', '', 'applicant-inquery', '问卷管理', 'MENU', '', null, null);
INSERT INTO `crm_resource` VALUES ('47', '/system/wenjuansq/sqbiao,/system/wenjuansq/question,/system/wenjuansq/option,/system/wenjuansq/shanchu,,/system/wenjuansq/tijiao', '/system/wenjuansq', 'applicant-create', '创建调查问卷内容', 'MENU', '', '46', null);
INSERT INTO `crm_resource` VALUES ('50', '', '', 'admin-verify', '审核发布问卷', 'MENU', '', null, null);
INSERT INTO `crm_resource` VALUES ('51', '/admin/noteList/getNote,/admin/noteList/quetion,/admin/noteList/noteUpdatePass,/admin/noteList/noteUpdateNotPass', '/admin/noteList', 'admin-examine', '审核问卷内容', 'MENU', '', '50', null);
INSERT INTO `crm_resource` VALUES ('53', '', '', 'interviewee-inquery', '填写问卷', 'MENU', '', null, null);
INSERT INTO `crm_resource` VALUES ('54', '/register/notePassList/getPassNote,/register/notePassList/quetion', '/register/notePassList', 'interviewee-fill', '填写问卷', 'MENU', '', '53', null);
INSERT INTO `crm_resource` VALUES ('58', '/admin/noteOtherList/getOtherNote', '/admin/noteOtherList', 'admin-examined', '已审核问卷', 'MENU', '', '50', null);
INSERT INTO `crm_resource` VALUES ('67', '/system/feedback/note,/system/feedback/getNoteDetails', '/system/feedback', 'applicant-check', '我的问卷', 'MENU', '', '46', null);

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
INSERT INTO `crm_role_resource` VALUES ('1', '58');
INSERT INTO `crm_role_resource` VALUES ('6', '46');
INSERT INTO `crm_role_resource` VALUES ('6', '47');
INSERT INTO `crm_role_resource` VALUES ('6', '67');
INSERT INTO `crm_role_resource` VALUES ('6', '53');
INSERT INTO `crm_role_resource` VALUES ('6', '54');

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
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `shuoming` varchar(255) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `anon` int(11) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_note
-- ----------------------------
INSERT INTO `t_note` VALUES ('1', '新闻', null, null, null, null, null, null, null);
INSERT INTO `t_note` VALUES ('20', '兴趣爱好', '调查兴趣爱好', '2020-10-26', '2020-10-30', '2', '0', '1', '2020-10-23');
INSERT INTO `t_note` VALUES ('21', '人员调查', '人口普查', '2020-10-26', '2020-10-30', '2', '1', '44', '2020-10-23');
INSERT INTO `t_note` VALUES ('22', '人员调查', '人口普查', '2020-10-26', '2020-10-30', '2', '1', '44', '2020-10-23');
INSERT INTO `t_note` VALUES ('23', '新闻', '66', '2020-10-26', '2020-10-27', '2', '0', '1', '2020-10-23');
INSERT INTO `t_note` VALUES ('24', '新闻', '99', '2020-10-26', '2020-10-30', '1', '0', '44', '2020-10-23');
INSERT INTO `t_note` VALUES ('25', '学校调查', '调查学校的各种情况', '2020-10-29', '2020-10-31', '0', '0', '1', '2020-10-25');
INSERT INTO `t_note` VALUES ('26', '婚姻状况调查', '旨在调查婚姻和年龄的关系', '2020-10-29', '2020-10-31', '2', '0', '1', '2020-10-26');
INSERT INTO `t_note` VALUES ('27', 'liu', '旨在调查婚姻和年龄的关系', '2020-10-29', '2020-10-30', '1', '0', '44', '2020-10-26');
INSERT INTO `t_note` VALUES ('28', 'haha', '旨在调查婚姻和年龄的关系', '2020-10-29', '2020-10-31', '0', '0', 'admin', '2020-10-26');
INSERT INTO `t_note` VALUES ('29', '住房调查', '旨在调查住房和学历的关系', '2020-10-30', '2020-10-31', '1', '0', 'register', '2020-10-26');

-- ----------------------------
-- Table structure for `t_option`
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `opt_id` int(11) NOT NULL AUTO_INCREMENT,
  `new_name` varchar(50) NOT NULL,
  `new_con` varchar(50) NOT NULL,
  `que_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`opt_id`),
  KEY `题号` (`new_name`),
  KEY `问题ID` (`que_id`),
  CONSTRAINT `问题ID` FOREIGN KEY (`que_id`) REFERENCES `t_question` (`req_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_option
-- ----------------------------
INSERT INTO `t_option` VALUES ('2', 'A', '【单选】运动类', '15');
INSERT INTO `t_option` VALUES ('3', 'B', '【单选】文艺类', '15');
INSERT INTO `t_option` VALUES ('4', 'C', '【单选】休闲类', '15');
INSERT INTO `t_option` VALUES ('5', 'A', '【多选】读书', '16');
INSERT INTO `t_option` VALUES ('6', 'B', '【多选】排球', '16');
INSERT INTO `t_option` VALUES ('7', 'C', '【多选】篮球', '16');
INSERT INTO `t_option` VALUES ('8', 'D', '【多选】足球', '16');
INSERT INTO `t_option` VALUES ('9', 'E', '【多选】手工', '16');
INSERT INTO `t_option` VALUES ('10', 'F', '【多选】唱歌', '16');
INSERT INTO `t_option` VALUES ('11', 'A', '【单选】1', '18');
INSERT INTO `t_option` VALUES ('12', 'B', '【单选】2', '18');
INSERT INTO `t_option` VALUES ('13', 'C', '【单选】3', '18');
INSERT INTO `t_option` VALUES ('14', 'D', '【单选】4', '18');
INSERT INTO `t_option` VALUES ('15', 'E', '【单选】5', '18');
INSERT INTO `t_option` VALUES ('16', 'A', '【单选】1', '19');
INSERT INTO `t_option` VALUES ('17', 'B', '【单选】2', '19');
INSERT INTO `t_option` VALUES ('18', 'C', '【单选】3', '19');
INSERT INTO `t_option` VALUES ('19', 'D', '【单选】4', '19');
INSERT INTO `t_option` VALUES ('20', 'E', '【单选】5', '19');
INSERT INTO `t_option` VALUES ('21', 'A', '【单选】33', '20');
INSERT INTO `t_option` VALUES ('22', 'A', '【单选】34', '21');
INSERT INTO `t_option` VALUES ('23', 'B', '【单选】56', '21');
INSERT INTO `t_option` VALUES ('24', 'A', '【单选】非常干净', '22');
INSERT INTO `t_option` VALUES ('25', 'B', '【单选】一般', '22');
INSERT INTO `t_option` VALUES ('26', 'C', '【单选】不干净', '22');
INSERT INTO `t_option` VALUES ('27', 'D', '【单选】很脏', '22');
INSERT INTO `t_option` VALUES ('28', 'A', '【单选】很团结', '23');
INSERT INTO `t_option` VALUES ('29', 'B', '【单选】不团结', '23');
INSERT INTO `t_option` VALUES ('30', 'C', '【单选】无法共处', '23');
INSERT INTO `t_option` VALUES ('31', 'A', '【单选】很好', '24');
INSERT INTO `t_option` VALUES ('32', 'B', '【单选】一般', '24');
INSERT INTO `t_option` VALUES ('33', 'C', '【单选】差', '24');
INSERT INTO `t_option` VALUES ('34', 'D', '【单选】很差', '24');
INSERT INTO `t_option` VALUES ('35', 'A', '【单选】1', '25');
INSERT INTO `t_option` VALUES ('36', 'A', '【单选】2', '26');
INSERT INTO `t_option` VALUES ('37', 'A', '【单选】男', '27');
INSERT INTO `t_option` VALUES ('38', 'B', '【单选】女', '27');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '问卷1', '1', '经济', '1');
INSERT INTO `t_question` VALUES ('15', '爱好类型', '1', '单选', '20');
INSERT INTO `t_question` VALUES ('16', '爱好有', '1', '多选', '20');
INSERT INTO `t_question` VALUES ('17', '为什么喜欢这个爱好', '1', '问答', '20');
INSERT INTO `t_question` VALUES ('18', '人数', '1', '单选', '21');
INSERT INTO `t_question` VALUES ('19', '人数', '1', '单选', '22');
INSERT INTO `t_question` VALUES ('20', '22', '1', '单选', '23');
INSERT INTO `t_question` VALUES ('21', '12', '1', '单选', '24');
INSERT INTO `t_question` VALUES ('22', '食堂情况', '1', '单选', '25');
INSERT INTO `t_question` VALUES ('23', '宿舍关系状况', '1', '单选', '25');
INSERT INTO `t_question` VALUES ('24', '你对你的婚姻预期怎么样？', '1', '单选', '26');
INSERT INTO `t_question` VALUES ('25', '11', '1', '单选', '27');
INSERT INTO `t_question` VALUES ('26', '22', '1', '单选', '28');
INSERT INTO `t_question` VALUES ('27', '你的性别', '1', '单选', '29');
