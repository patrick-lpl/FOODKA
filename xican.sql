SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名称', 
  `us_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `us_age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `us_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `us_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`us_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'gst', '男', 18, '18969144960', '2022-06-29 21:43:26', 'MTIz');


-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` varchar(255) NOT NULL,
  `us_id` int(11) NULL DEFAULT NULL,  
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1649396504550',1, '1000', '2022-06-30 13:41:44');
INSERT INTO `order` VALUES ('1649420880859', 1, '100',  '2022-06-30 20:28:00');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `dish_id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dish_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dish_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1, '牛逼汉堡', '18');



-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID\r\n',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `admin_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `admin_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `photo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'MTIz', 'gst', '2222', '123@qq.com', 'data:image/jpeg;base64,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', '2021-11-26 07:10:24', '2021-11-26 07:10:27');

SET FOREIGN_KEY_CHECKS = 1;
