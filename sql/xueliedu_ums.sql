/*
 Navicat Premium Data Transfer

 Source Server         : my_aliyun
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 101.200.164.127:3306
 Source Schema         : xueliedu_ums

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 20/09/2020 16:35:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) UNSIGNED DEFAULT NULL COMMENT '性别 1 男，2 女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES ('1289543825605283842', 'o3_SC5yoAkSkwx4Va3tfgTxzoKVI', '13164161170', 'e10adc3949ba59abbe56e057f20f883e', 'We.', 1, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/5rH2olrw2AfPlgfuuiaLCuibjgIgzxNSuiaGWcnUNUQNvOJqWjmwQtYEl0Qsc5F9lw0T4K7BarDlicUUyLxjByNvxg/132', NULL, 0, 0, '2020-08-01 20:49:41', '2020-08-01 20:49:41');
INSERT INTO `ums_member` VALUES ('1289543825605283843', NULL, '13164161180', 'e10adc3949ba59abbe56e057f20f883e', 'Andy', 1, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', NULL, 0, 0, '2020-08-19 22:55:56', '2020-08-19 22:55:58');
INSERT INTO `ums_member` VALUES ('1296102077461794818', NULL, '13164161181', 'e10adc3949ba59abbe56e057f20f883e', 'Ashley', 2, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', NULL, 0, 0, '2020-08-19 23:09:50', '2020-08-19 23:09:50');
INSERT INTO `ums_member` VALUES ('1296103100985135105', NULL, '13164161182', 'e10adc3949ba59abbe56e057f20f883e', 'Bruce', 1, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', NULL, 0, 0, '2020-08-19 23:13:54', '2020-08-19 23:13:54');
INSERT INTO `ums_member` VALUES ('1296103490354958338', NULL, '13164161183', 'e10adc3949ba59abbe56e057f20f883e', 'Colin', 1, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', NULL, 0, 0, '2020-08-19 23:15:27', '2020-08-19 23:15:27');
INSERT INTO `ums_member` VALUES ('1296103723897999361', NULL, '13164161184', 'e10adc3949ba59abbe56e057f20f883e', 'Dick', 1, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', NULL, 0, 0, '2020-08-19 23:16:23', '2020-08-19 23:16:23');
INSERT INTO `ums_member` VALUES ('1296104041192902658', NULL, '13164161185', 'e10adc3949ba59abbe56e057f20f883e', 'Edward', 1, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', NULL, 0, 0, '2020-08-19 23:17:39', '2020-08-19 23:17:39');
INSERT INTO `ums_member` VALUES ('1296104297263550466', NULL, '13164161186', 'e10adc3949ba59abbe56e057f20f883e', 'George', 1, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', NULL, 0, 0, '2020-08-19 23:18:40', '2020-08-19 23:18:40');
INSERT INTO `ums_member` VALUES ('1296104574465101825', NULL, '13164161187', 'e10adc3949ba59abbe56e057f20f883e', 'Jessica', 2, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', NULL, 0, 0, '2020-08-19 23:19:46', '2020-08-19 23:19:46');
INSERT INTO `ums_member` VALUES ('1296104733647327233', NULL, '13164161188', 'e10adc3949ba59abbe56e057f20f883e', 'Sarah', 2, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', NULL, 0, 0, '2020-08-19 23:20:24', '2020-08-19 23:20:24');
INSERT INTO `ums_member` VALUES ('1296104907216015361', NULL, '13164161189', 'e10adc3949ba59abbe56e057f20f883e', 'peiqi', 2, '2020-09-16', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', NULL, 0, 0, '2020-08-19 23:21:05', '2020-08-19 23:21:05');
INSERT INTO `ums_member` VALUES ('1303931480610734081', NULL, '15072459856', 'e10adc3949ba59abbe56e057f20f883e', 'yipeng', 1, '2020-09-01', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/09/17/d60d23b7a6864bf0a338c65764375b331442297927029.jpg', 'my name is yipeng~', 0, 0, '2020-09-10 00:00:00', '2020-09-17 17:30:19');
INSERT INTO `ums_member` VALUES ('1306526271844433922', NULL, '13164161190', 'b2c90e1421f604879e5918bff85285bb', 'ceshi', NULL, NULL, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', NULL, 0, 0, '2020-09-17 00:00:00', '2020-09-17 23:30:35');

-- ----------------------------
-- Table structure for ums_order
-- ----------------------------
DROP TABLE IF EXISTS `ums_order`;
CREATE TABLE `ums_order`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '订单id',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10, 2) DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint(3) DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(3) DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_order
-- ----------------------------
INSERT INTO `ums_order` VALUES ('1303936629743845378', '20200910140133590', '1295974194441396225', '数据挖掘与python实践', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/adfa83058b25426eb1f0ee66e7cd0cfa数据挖掘与python实践.jpg', '许安翔', '1289543825605283843', 'Andy', '13164161180', 1.00, 1, 0, 0, '2020-09-10 14:01:33', '2020-09-10 14:01:33');
INSERT INTO `ums_order` VALUES ('1303936629743845379', '20200910140133589', '1295974194441396225', '数据挖掘与python实践', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/adfa83058b25426eb1f0ee66e7cd0cfa数据挖掘与python实践.jpg', '许安翔', '1289543825605283843', 'Andy', '13164161180', 1.00, 1, 0, 0, '2020-09-10 14:01:33', '2020-09-10 14:01:33');

-- ----------------------------
-- Table structure for ums_pay_order_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_pay_order_info`;
CREATE TABLE `ums_pay_order_info`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '支付订单日志id',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime(0) DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10, 2) DEFAULT 0.01 COMMENT '支付金额（分）',
  `transaction_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '其他属性',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付日志表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
