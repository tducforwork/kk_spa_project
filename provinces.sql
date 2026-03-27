/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3307
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : vieclamvietnam

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 02/03/2026 23:35:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `gso_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES (1, 'Tỉnh An Giang', 1, '', '2026-03-02 23:22:47', '2026-03-02 23:22:47');
INSERT INTO `provinces` VALUES (2, 'Tỉnh Bắc Ninh', 1, '', '2026-03-02 23:22:47', '2026-03-02 23:22:47');
INSERT INTO `provinces` VALUES (3, 'Tỉnh Cà Mau', 1, '', '2026-03-02 23:22:47', '2026-03-02 23:22:47');
INSERT INTO `provinces` VALUES (4, 'Thành Phố Cần Thơ', 1, '', '2026-03-02 23:22:47', '2026-03-02 23:22:47');
INSERT INTO `provinces` VALUES (5, 'Tỉnh Cao Bằng', 1, '', '2026-03-02 23:22:48', '2026-03-02 23:22:48');
INSERT INTO `provinces` VALUES (6, 'Tỉnh Đắk Lắk', 1, '', '2026-03-02 23:22:48', '2026-03-02 23:22:48');
INSERT INTO `provinces` VALUES (7, 'Thành Phố Đà Nẵng', 1, '', '2026-03-02 23:22:48', '2026-03-02 23:22:48');
INSERT INTO `provinces` VALUES (8, 'Tỉnh Điện Biên', 1, '', '2026-03-02 23:22:48', '2026-03-02 23:22:48');
INSERT INTO `provinces` VALUES (9, 'Tỉnh Đồng Nai', 1, '', '2026-03-02 23:22:48', '2026-03-02 23:22:48');
INSERT INTO `provinces` VALUES (10, 'Tỉnh Đồng Tháp', 1, '', '2026-03-02 23:22:48', '2026-03-02 23:22:48');
INSERT INTO `provinces` VALUES (11, 'Tỉnh Gia Lai', 1, '', '2026-03-02 23:22:48', '2026-03-02 23:22:48');
INSERT INTO `provinces` VALUES (12, 'Thành Phố Hải Phòng', 1, '', '2026-03-02 23:22:49', '2026-03-02 23:22:49');
INSERT INTO `provinces` VALUES (13, 'Thủ Đô Hà Nội', 1, '', '2026-03-02 23:22:49', '2026-03-02 23:22:49');
INSERT INTO `provinces` VALUES (14, 'Tỉnh Hà Tĩnh', 1, '', '2026-03-02 23:22:49', '2026-03-02 23:22:49');
INSERT INTO `provinces` VALUES (15, 'Thành Phố Huế', 1, '', '2026-03-02 23:22:49', '2026-03-02 23:22:49');
INSERT INTO `provinces` VALUES (16, 'Tỉnh Hưng Yên', 1, '', '2026-03-02 23:22:49', '2026-03-02 23:22:49');
INSERT INTO `provinces` VALUES (17, 'Tỉnh Khánh Hòa', 1, '', '2026-03-02 23:22:49', '2026-03-02 23:22:49');
INSERT INTO `provinces` VALUES (18, 'Tỉnh Lai Châu', 1, '', '2026-03-02 23:22:50', '2026-03-02 23:22:50');
INSERT INTO `provinces` VALUES (19, 'Tỉnh Lâm Đồng', 1, '', '2026-03-02 23:22:50', '2026-03-02 23:22:50');
INSERT INTO `provinces` VALUES (20, 'Tỉnh Lạng Sơn', 1, '', '2026-03-02 23:22:50', '2026-03-02 23:22:50');
INSERT INTO `provinces` VALUES (21, 'Tỉnh Lào Cai', 1, '', '2026-03-02 23:22:50', '2026-03-02 23:22:50');
INSERT INTO `provinces` VALUES (22, 'Tỉnh Nghệ An', 1, '', '2026-03-02 23:22:50', '2026-03-02 23:22:50');
INSERT INTO `provinces` VALUES (23, 'Tỉnh Ninh Bình', 1, '', '2026-03-02 23:22:50', '2026-03-02 23:22:50');
INSERT INTO `provinces` VALUES (24, 'Tỉnh Phú Thọ', 1, '', '2026-03-02 23:22:51', '2026-03-02 23:22:51');
INSERT INTO `provinces` VALUES (25, 'Tỉnh Quảng Ngãi', 1, '', '2026-03-02 23:22:51', '2026-03-02 23:22:51');
INSERT INTO `provinces` VALUES (26, 'Tỉnh Quảng Ninh', 1, '', '2026-03-02 23:22:51', '2026-03-02 23:22:51');
INSERT INTO `provinces` VALUES (27, 'Tỉnh Quảng Trị', 1, '', '2026-03-02 23:22:51', '2026-03-02 23:22:51');
INSERT INTO `provinces` VALUES (28, 'Tỉnh Sơn La', 1, '', '2026-03-02 23:22:51', '2026-03-02 23:22:51');
INSERT INTO `provinces` VALUES (29, 'Tỉnh Tây Ninh', 1, '', '2026-03-02 23:22:51', '2026-03-02 23:22:51');
INSERT INTO `provinces` VALUES (30, 'Tỉnh Thái Nguyên', 1, '', '2026-03-02 23:22:51', '2026-03-02 23:22:51');
INSERT INTO `provinces` VALUES (31, 'Tỉnh Thanh Hóa', 1, '', '2026-03-02 23:22:52', '2026-03-02 23:22:52');
INSERT INTO `provinces` VALUES (32, 'Thành Phố Hồ Chí Minh', 1, '', '2026-03-02 23:22:52', '2026-03-02 23:22:52');
INSERT INTO `provinces` VALUES (33, 'Tỉnh Tuyên Quang', 1, '', '2026-03-02 23:22:52', '2026-03-02 23:22:52');
INSERT INTO `provinces` VALUES (34, 'Tỉnh Vĩnh Long', 1, '', '2026-03-02 23:22:52', '2026-03-02 23:22:52');

SET FOREIGN_KEY_CHECKS = 1;
