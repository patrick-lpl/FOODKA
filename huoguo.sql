/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : huoguo

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 16/05/2022 19:58:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for card_log
-- ----------------------------
DROP TABLE IF EXISTS `card_log`;
CREATE TABLE `card_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡id',
  `before_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `after_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `change_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '改变金额',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of card_log
-- ----------------------------
INSERT INTO `card_log` VALUES (36, '14', '0', '0', '-0', '3', '2022-03-20 21:43:46');
INSERT INTO `card_log` VALUES (37, '15', '0', '22200', '+22200', '1', '2022-03-20 21:43:56');
INSERT INTO `card_log` VALUES (38, '15', '22200', '22199', '-1', '2', '2022-03-20 21:44:02');
INSERT INTO `card_log` VALUES (39, '15', '22199', '22144', '-55', '2', '2022-03-20 21:44:16');
INSERT INTO `card_log` VALUES (40, '15', '22144', '22144', '-0', '2', '2022-04-08 13:34:21');
INSERT INTO `card_log` VALUES (41, '15', '22144', '22144', '-0', '2', '2022-04-08 13:41:44');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ms_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名称',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (17, '17770900091', '男', 12, '17770900091', '2022-03-20 21:43:26', 'MTIz', '32610.0');

-- ----------------------------
-- Table structure for member_card
-- ----------------------------
DROP TABLE IF EXISTS `member_card`;
CREATE TABLE `member_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ms_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钱',
  `card_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员卡号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开卡时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_card
-- ----------------------------
INSERT INTO `member_card` VALUES (14, '17', '0', '0', '1647783823421', '2022-03-20 21:43:43');
INSERT INTO `member_card` VALUES (15, '17', '1', '22144', '1647783829492', '2022-03-20 21:43:49');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID\r\n',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (2, 'erewrew', 'rewrewr', '2022-04-07 21:59:24', '2022-04-07 21:59:24');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint(20) NOT NULL,
  `table_no` int(11) NULL DEFAULT NULL,
  `mid` int(11) NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `sales_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1649396504550, NULL, 17, '0', '0', '1', 'S1649396504550', '1', '2022-04-08 13:41:44');
INSERT INTO `order` VALUES (1649420880859, NULL, 17, '100', '100', '2', 'S1649420880859', '1', '2022-04-08 20:28:00');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (12, '羽毛球', 1, '10', '1647766751897', '2022-03-20 08:59:12');
INSERT INTO `order_detail` VALUES (13, '羽毛球 场地A 8:00-9:00 ', 1, '10', '1647783047732', '2022-03-20 13:30:48');
INSERT INTO `order_detail` VALUES (14, '羽毛球 场地B 8:00-9:00 ', 1, '10', '1647783199531', '2022-03-20 13:33:20');
INSERT INTO `order_detail` VALUES (15, '羽毛球 场地C 8:00-9:00 ', 1, '10', '1647783473398', '2022-03-20 13:37:53');
INSERT INTO `order_detail` VALUES (16, '羽毛球 场地D 8:00-9:00 ', 1, '10', '1647783658732', '2022-03-20 13:40:59');
INSERT INTO `order_detail` VALUES (17, '羽毛球 场地E 8:00-9:00 ', 1, '10', '1647783856360', '2022-03-20 13:44:16');
INSERT INTO `order_detail` VALUES (18, '【ewqe】【2022-04-08】【11:00-12:00】', 1, '0', '1649396061028', '2022-04-08 05:34:21');
INSERT INTO `order_detail` VALUES (19, '【ewqe】【2022-04-08】【11:00-12:00】', 1, '0', '1649396504550', '2022-04-08 05:41:45');
INSERT INTO `order_detail` VALUES (20, '【ewqe】【2022-04-09】【11:00-12:00】', 1, '100', '1649420880859', '2022-04-08 12:28:01');

-- ----------------------------
-- Table structure for point_def
-- ----------------------------
DROP TABLE IF EXISTS `point_def`;
CREATE TABLE `point_def`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point_def
-- ----------------------------
INSERT INTO `point_def` VALUES (1, 'regiser_member', '注册送积分数量', '500');
INSERT INTO `point_def` VALUES (2, 'order_point', '消费送积分比例', '2');
INSERT INTO `point_def` VALUES (3, 'recharge', '充值送积分比例', '1.5');

-- ----------------------------
-- Table structure for point_exchange
-- ----------------------------
DROP TABLE IF EXISTS `point_exchange`;
CREATE TABLE `point_exchange`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL,
  `point_exchange_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `point_log_id` int(11) NULL DEFAULT NULL,
  `point_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point_exchange
-- ----------------------------
INSERT INTO `point_exchange` VALUES (2, 17, 3, '2022-03-20 21:51:08', NULL, 500);
INSERT INTO `point_exchange` VALUES (3, 17, 3, '2022-03-20 21:51:32', NULL, 500);
INSERT INTO `point_exchange` VALUES (4, 17, 3, '2022-03-20 21:52:54', NULL, 500);

-- ----------------------------
-- Table structure for point_exchange_def
-- ----------------------------
DROP TABLE IF EXISTS `point_exchange_def`;
CREATE TABLE `point_exchange_def`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `point` bigint(10) NULL DEFAULT NULL COMMENT '需要积分数量',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point_exchange_def
-- ----------------------------
INSERT INTO `point_exchange_def` VALUES (3, '500积分兑换羽毛球一个', '羽毛球', 500, '2022-03-20 16:15:35', '2022-03-20 16:15:35');

-- ----------------------------
-- Table structure for point_log
-- ----------------------------
DROP TABLE IF EXISTS `point_log`;
CREATE TABLE `point_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分类型',
  `relate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `mid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point_log
-- ----------------------------
INSERT INTO `point_log` VALUES (18, '500', '注册赠送', NULL, '2022-03-20 21:37:32', '2022-03-20 21:37:32', '15');
INSERT INTO `point_log` VALUES (19, '2', '消费赠送', 'S1647783473398', '2022-03-20 21:37:59', '2022-03-20 21:37:59', '15');
INSERT INTO `point_log` VALUES (20, '500', '注册赠送', NULL, '2022-03-20 21:40:12', '2022-03-20 21:40:12', '16');
INSERT INTO `point_log` VALUES (21, '750.0', '充值赠送', NULL, '2022-03-20 21:40:39', '2022-03-20 21:40:39', '16');
INSERT INTO `point_log` VALUES (22, '132', '消费赠送', 'S1647783658732', '2022-03-20 21:40:58', '2022-03-20 21:40:58', '16');
INSERT INTO `point_log` VALUES (23, '500', '注册赠送', NULL, '2022-03-20 21:43:26', '2022-03-20 21:43:26', '17');
INSERT INTO `point_log` VALUES (24, '33300.0', '充值赠送', NULL, '2022-03-20 21:43:56', '2022-03-20 21:43:56', '17');
INSERT INTO `point_log` VALUES (25, '110', '消费赠送', 'S1647783856360', '2022-03-20 21:44:16', '2022-03-20 21:44:16', '17');
INSERT INTO `point_log` VALUES (26, '500', '积分兑换', NULL, '2022-03-20 21:51:08', '2022-03-20 21:51:08', '17');
INSERT INTO `point_log` VALUES (27, '500', '积分兑换', NULL, '2022-03-20 21:51:32', '2022-03-20 21:51:32', '17');
INSERT INTO `point_log` VALUES (28, '500', '积分兑换', NULL, '2022-03-20 21:52:54', '2022-03-20 21:52:54', '17');
INSERT INTO `point_log` VALUES (29, '0', '消费赠送', 'S1649396061028', '2022-04-08 13:34:21', '2022-04-08 13:34:21', '17');
INSERT INTO `point_log` VALUES (30, '0', '消费赠送', 'S1649396504550', '2022-04-08 13:41:44', '2022-04-08 13:41:44', '17');
INSERT INTO `point_log` VALUES (31, '200', '消费赠送', 'S1649420880859', '2022-04-08 20:28:00', '2022-04-08 20:28:00', '17');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID\r\n',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `stu_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户（学生）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'MTIz', NULL, 'zs', NULL, '2222', '123@qq.com', 'data:image/jpeg;base64,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', '2021-11-26 07:10:24', '2021-11-26 07:10:27');

SET FOREIGN_KEY_CHECKS = 1;
