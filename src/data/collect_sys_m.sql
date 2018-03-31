/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : collect_sys_m

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 03/31/2018 22:02:38 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '商品名称',
  `price` float(10,1) NOT NULL COMMENT '商品定价',
  `detail` text COMMENT '商品描述',
  `pic` varchar(64) DEFAULT NULL COMMENT '商品图片',
  `createtime` datetime NOT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `items`
-- ----------------------------
BEGIN;
INSERT INTO `items` VALUES ('1', '台式机', '3000.0', '该电脑质量非常好！！！！', null, '2015-02-03 13:22:53'), ('2', '笔记本', '6000.0', '笔记本性能好，质量好！！！！！', null, '2015-02-09 13:22:57'), ('3', '背包', '200.0', '名牌背包，容量大质量好！！！！', null, '2015-02-06 13:23:02');
COMMIT;

-- ----------------------------
--  Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '订单id',
  `items_id` int(11) NOT NULL COMMENT '商品id',
  `items_num` int(11) DEFAULT NULL COMMENT '商品购买数量',
  PRIMARY KEY (`id`),
  KEY `FK_orderdetail_1` (`orders_id`),
  KEY `FK_orderdetail_2` (`items_id`),
  CONSTRAINT `FK_orderdetail_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orderdetail_2` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `orderdetail`
-- ----------------------------
BEGIN;
INSERT INTO `orderdetail` VALUES ('1', '3', '1', '1'), ('2', '3', '2', '3'), ('3', '4', '3', '4'), ('4', '4', '2', '3');
COMMIT;

-- ----------------------------
--  Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '下单用户id',
  `number` varchar(32) NOT NULL COMMENT '订单号',
  `createtime` datetime NOT NULL COMMENT '创建订单时间',
  `note` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `FK_orders_1` (`user_id`),
  CONSTRAINT `FK_orders_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `orders`
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES ('3', '1', '1000010', '2015-02-04 13:22:35', null), ('4', '1', '1000011', '2015-02-03 13:22:41', null), ('5', '10', '1000012', '2015-02-12 16:13:23', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_permission`
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES ('1', '权限', '', '', null, '0', '0/', '0', '1'), ('11', '商品管理', 'menu', '/item/queryItem.action', null, '1', '0/1/', '1.', '1'), ('12', '商品新增', 'permission', '/item/add.action', 'item:create', '11', '0/1/11/', '', '1'), ('13', '商品修改', 'permission', '/item/editItem.action', 'item:update', '11', '0/1/11/', '', '1'), ('14', '商品删除', 'permission', '', 'item:delete', '11', '0/1/11/', '', '1'), ('15', '商品查询', 'permission', '/item/queryItem.action', 'item:query', '11', '0/1/15/', null, '1'), ('21', '用户管理', 'menu', '/user/query.action', 'user:query', '1', '0/1/', '2.', '1'), ('22', '用户新增', 'permission', '', 'user:create', '21', '0/1/21/', '', '1'), ('23', '用户修改', 'permission', '', 'user:update', '21', '0/1/21/', '', '1'), ('24', '用户删除', 'permission', '', 'user:delete', '21', '0/1/21/', '', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f28', '商品管理员', '1'), ('ebc9d647-c6f9-11e4-b137-0adc305c3f28', '用户管理员', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` varchar(36) NOT NULL,
  `sys_role_id` varchar(32) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(32) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_role_permission`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f21', 'ebc8a441-c6f9-11e4-b137-0adc305c', '12'), ('ebc8a441-c6f9-11e4-b137-0adc305c3f22', 'ebc8a441-c6f9-11e4-b137-0adc305c', '11'), ('ebc8a441-c6f9-11e4-b137-0adc305c3f24', 'ebc9d647-c6f9-11e4-b137-0adc305c', '21'), ('ebc8a441-c6f9-11e4-b137-0adc305c3f25', 'ebc8a441-c6f9-11e4-b137-0adc305c', '15'), ('ebc9d647-c6f9-11e4-b137-0adc305c3f23', 'ebc9d647-c6f9-11e4-b137-0adc305c', '22'), ('ebc9d647-c6f9-11e4-b137-0adc305c3f26', 'ebc8a441-c6f9-11e4-b137-0adc305c', '13');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `usercode` varchar(32) NOT NULL COMMENT '账号',
  `username` varchar(64) NOT NULL COMMENT '姓名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐',
  `locked` char(1) DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('lisi', 'lisi', '李四', 'bf07fd8bbc73b6f70b8319f2ebb87483', 'uiwueylm', '0'), ('zhangsan', 'zhangsan', '张三', '48e1a118a99e59fb09254e42a0335bc8', 'eteokues', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `sys_user_id` varchar(32) NOT NULL,
  `sys_role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f28', 'zhangsan', 'ebc8a441-c6f9-11e4-b137-0adc305c'), ('ebc9d647-c6f9-11e4-b137-0adc305c3f28', 'lisi', 'ebc9d647-c6f9-11e4-b137-0adc305c');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名称',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '王五', null, '2', null), ('10', '张三', '2014-07-10', '1', '北京市'), ('16', '张小明', null, '1', '河南郑州'), ('22', '陈小明', null, '1', '河南郑州'), ('24', '张三丰', null, '1', '河南郑州'), ('25', '陈小明', null, '1', '河南郑州'), ('26', '王五', null, null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
