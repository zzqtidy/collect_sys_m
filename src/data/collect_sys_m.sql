/*
 Navicat Premium Data Transfer

 Source Server         : 本地Mysql
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : collect_sys_m

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 05/07/2018 18:25:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `keywords` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `keyname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型（属于那个板块）',
  `createtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `edittime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '编辑时间',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clickcount` int(8) UNSIGNED NULL DEFAULT 0 COMMENT '点击次数',
  `isurl` bit(1) NULL DEFAULT NULL,
  `src` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank` int(8) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` float(10, 1) NOT NULL COMMENT '商品定价',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `pic` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `createtime` datetime(0) NOT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, '台式机', 3000.0, '该电脑质量非常好！！！！', NULL, '2015-02-03 13:22:53');
INSERT INTO `items` VALUES (2, '笔记本', 6000.0, '笔记本性能好，质量好！！！！！', NULL, '2015-02-09 13:22:57');
INSERT INTO `items` VALUES (3, '背包', 200.0, '名牌背包，容量大质量好！！！！', NULL, '2015-02-06 13:23:02');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '订单id',
  `items_id` int(11) NOT NULL COMMENT '商品id',
  `items_num` int(11) NULL DEFAULT NULL COMMENT '商品购买数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orderdetail_1`(`orders_id`) USING BTREE,
  INDEX `FK_orderdetail_2`(`items_id`) USING BTREE,
  CONSTRAINT `FK_orderdetail_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_orderdetail_2` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (1, 3, 1, 1);
INSERT INTO `orderdetail` VALUES (2, 3, 2, 3);
INSERT INTO `orderdetail` VALUES (3, 4, 3, 4);
INSERT INTO `orderdetail` VALUES (4, 4, 2, 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '下单用户id',
  `number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `createtime` datetime(0) NOT NULL COMMENT '创建订单时间',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orders_1`(`user_id`) USING BTREE,
  CONSTRAINT `FK_orders_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (3, 1, '1000010', '2015-02-04 13:22:35', NULL);
INSERT INTO `orders` VALUES (4, 1, '1000011', '2015-02-03 13:22:41', NULL);
INSERT INTO `orders` VALUES (5, 10, '1000012', '2015-02-12 16:13:23', NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) NULL DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序号',
  `available` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  `iconclass` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'font_anwsome matched class',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '权限', '', '', NULL, 0, '0/', '0', '1', NULL);
INSERT INTO `sys_permission` VALUES (11, '商品管理', 'menu', '/item/list', NULL, 1, '0/1/', '1', '1', 'fa fa-shopping-cart');
INSERT INTO `sys_permission` VALUES (12, '商品新增', 'permission', '/item/add', 'item:create', 11, '0/1/11/', '1-1', '1', NULL);
INSERT INTO `sys_permission` VALUES (13, '商品修改', 'permission', '/item/edit', 'item:update', 11, '0/1/11/', '1-2', '1', NULL);
INSERT INTO `sys_permission` VALUES (14, '商品删除', 'permission', '/item/delete', 'item:delete', 11, '0/1/11/', '1-3', '1', NULL);
INSERT INTO `sys_permission` VALUES (15, '商品查询', 'permission', '/item/list', 'item:query', 11, '0/1/15/', '1-4', '1', NULL);
INSERT INTO `sys_permission` VALUES (21, '用户管理', 'menu', '/user/list', 'user:query', 1, '0/1/', '2', '1', 'fa fa-user-circle');
INSERT INTO `sys_permission` VALUES (22, '用户新增', 'permission', '/user/add', 'user:create', 21, '0/1/21/', '2-1', '1', NULL);
INSERT INTO `sys_permission` VALUES (23, '用户修改', 'permission', '/user/edit', 'user:update', 21, '0/1/21/', '2-2', '1', NULL);
INSERT INTO `sys_permission` VALUES (24, '用户删除', 'permission', '/user/delete', 'user:delete', 21, '0/1/21/', '2-3', '1', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `available` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '商品管理员', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '1');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sys_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '2', '11');
INSERT INTO `sys_role_permission` VALUES ('2', '2', '21');
INSERT INTO `sys_role_permission` VALUES ('3', '2', '15');
INSERT INTO `sys_role_permission` VALUES ('4', '2', '22');
INSERT INTO `sys_role_permission` VALUES ('5', '2', '13');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `usercode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `locked` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('lisi', 'lisi', '李四', 'bf07fd8bbc73b6f70b8319f2ebb87483', 'uiwueylm', '0');
INSERT INTO `sys_user` VALUES ('zhangsan', 'zhangsan', '张三', '48e1a118a99e59fb09254e42a0335bc8', 'eteokues', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sys_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sys_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', 'lisi', '1');
INSERT INTO `sys_user_role` VALUES ('2', 'zhangsan', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王五', NULL, '2', NULL);
INSERT INTO `user` VALUES (10, '张三', '2014-07-10', '1', '北京市');
INSERT INTO `user` VALUES (16, '张小明', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (22, '陈小明', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (24, '张三丰', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (25, '陈小明', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (26, '王五', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
