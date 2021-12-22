/*
 Navicat Premium Data Transfer

 Source Server         : bendi
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : 360shop

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 22/12/2021 11:03:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(10, 0) NOT NULL,
  `num` int(0) NOT NULL,
  INDEX `cart_user`(`id`) USING BTREE,
  CONSTRAINT `cart_user` FOREIGN KEY (`id`) REFERENCES `user` (`userName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('userName', '10114', 'det1.jpg', '360手机奇酷青春版移动联通双4G辰光银', '阳光白', 999, 1);
INSERT INTO `cart` VALUES ('admin', '10101', 'det9.jpg', '360手机N4S全网通版（7天之内发货）', '阳光白', 888, 1);
INSERT INTO `cart` VALUES ('admin', '10102', 'det13.jpg', '360手机Q5 全网通', '阳光白', 999, 1);
INSERT INTO `cart` VALUES ('admin', '10105', 'det5.jpg', '360手机N4全网通阳光白', 'golden', 666, 1);
INSERT INTO `cart` VALUES ('csyx', '10105', 'det5.jpg', '360手机N7全网通', '阳光白', 1099, 1);
INSERT INTO `cart` VALUES ('zyzu', '10105', 'det5.jpg', '360手机N7全网通', '阳光白', 1099, 1);

-- ----------------------------
-- Table structure for deal
-- ----------------------------
DROP TABLE IF EXISTS `deal`;
CREATE TABLE `deal`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(10, 2) NOT NULL,
  `num` int(0) NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `deal-1`(`id`) USING BTREE,
  CONSTRAINT `deal-1` FOREIGN KEY (`id`) REFERENCES `user` (`userName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deal
-- ----------------------------
INSERT INTO `deal` VALUES ('zyzu', '10105', 'det5.jpg', '360手机N7全网通', '阳光白', 1099.00, 1, '2021-12-21 19:12:43');
INSERT INTO `deal` VALUES ('zyzu', '10101', 'det9.jpg', '360手机N7pro', '阳光白', 1999.00, 1, '2021-12-21 19:16:44');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(8, 2) NULL DEFAULT NULL,
  `stock` int(0) NOT NULL,
  `img1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('10101', '360手机N7pro', 1999.00, 18, 'det9.jpg', 'det10.jpg', 'det11.jpg', 'det12.jpg');
INSERT INTO `goods` VALUES ('10102', '360手机Q5 全网通', 999.00, 999, 'det13.jpg', 'det14.jpg', 'det15.jpg', 'det16.jpg');
INSERT INTO `goods` VALUES ('10103', '360手机f4标准版全网通', 999.00, 44, 'det1.jpg', 'det6.jpg', 'det2.jpg', 'det4.jpg');
INSERT INTO `goods` VALUES ('10104', '360手机奇酷青春版移动联通双4G辰光银', 997.00, 99, 'det1.jpg', 'det2.jpg', 'det3.jpg', 'det4.jpg');
INSERT INTO `goods` VALUES ('10105', '360手机N7全网通', 1099.00, 88, 'det5.jpg', 'det6.jpg', 'det7.jpg', 'det8.jpg');
INSERT INTO `goods` VALUES ('10106', '360闪充闪放双涡轮引擎快充移动电源20000mAh', 99.00, 65, 'det17.png', 'det18.png', 'det19.png', 'det20.png');
INSERT INTO `goods` VALUES ('10107', '360 环音耳机立体声效', 88.00, 100, 'det21.png', 'det22.png', 'det23.png', 'det24.png');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cellphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('a', '123', '12345318315', 'webcsbox@163.com');
INSERT INTO `user` VALUES ('admin', '123456', '13023046077', 'webcsbox@163.com');
INSERT INTO `user` VALUES ('csyx', '123123', '12312312315', 'webcsbox@163.com');
INSERT INTO `user` VALUES ('dams', 'dams987', '12345678958', 'webcsbox@163.com');
INSERT INTO `user` VALUES ('userName', 'password', '13023046077', 'webcsbox@163.com');
INSERT INTO `user` VALUES ('wode ', 'jdsjjasfaf', '13023046077', 'webcsbox@163.com');
INSERT INTO `user` VALUES ('zhangs', 'sss', '34834321383', 'webcsbox@163.com');
INSERT INTO `user` VALUES ('zyzu', '123123', '12345679812', 'webcsbox@163.com');

SET FOREIGN_KEY_CHECKS = 1;
