/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : furn_ssm

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 11/05/2024 09:55:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for furn
-- ----------------------------
DROP TABLE IF EXISTS `furn`;
CREATE TABLE `furn`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `maker` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` decimal(11, 2) NOT NULL,
  `sales` int NOT NULL,
  `stock` int NOT NULL,
  `img_path` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of furn
-- ----------------------------
INSERT INTO `furn` VALUES (1, '大床', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (5, '北欧风格沙发~~~', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (6, '北欧风格沙发~', '顺平家居', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (9, '小凳子9', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (10, '小凳子10', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (11, '北欧风格沙发', '顺平家居', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (12, '北欧风格沙发1', '顺平家居', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (13, '大床1', '租客', 100.00, 10, 30, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (14, '大床2', '租客', 11.00, 11, 11, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (15, '大床3', '租客', 1.00, 1, 1, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (16, '大床4', '租客', 1.00, 1, 1, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (17, '大床5', '租客', 1.00, 1, 1, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (18, '大床6', '租客', 1.00, 1, 1, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (19, '大床7', '租客', 1.00, 1, 1, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (20, '大床8', '租客', 1.00, 1, 1, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (21, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (22, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (23, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (24, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (25, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (26, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (27, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (28, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (29, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (30, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (31, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (32, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (33, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (34, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (35, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (36, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (37, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (38, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (39, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (40, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (41, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (42, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (43, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (44, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (45, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (46, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (47, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (48, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (49, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (50, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (51, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (52, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (53, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (54, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (55, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (56, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (57, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (58, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (59, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (60, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (61, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (62, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (63, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (64, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (65, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (66, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (67, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (68, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (69, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (70, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (71, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (72, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (73, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (74, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (75, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (76, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (77, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (78, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (79, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (80, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (81, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (82, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (83, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (84, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (85, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (86, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (87, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (88, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (89, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (90, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (91, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');
INSERT INTO `furn` VALUES (92, '小凳子', 'JD', 180.00, 666, 7, 'assets/images/product-image/1.jpg');

SET FOREIGN_KEY_CHECKS = 1;
