/*
 Navicat Premium Data Transfer

 Source Server         : my_aliyun
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 101.200.164.127:3306
 Source Schema         : xueliedu_edu

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 31/08/2020 14:48:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_banner
-- ----------------------------
DROP TABLE IF EXISTS `edu_banner`;
CREATE TABLE `edu_banner`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '链接地址',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首页banner表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_banner
-- ----------------------------
INSERT INTO `edu_banner` VALUES ('1294601000308514817', 'banner1', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/15/a1ed50b7515d440cbd1dff2add9aa9e81.jpeg', '', 0, 0, '2020-08-15 19:45:06', '2020-08-15 19:45:06');
INSERT INTO `edu_banner` VALUES ('1294601686928662529', 'banner2', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/15/496ac394a2a34d2e9771526309d62cef2.jpg', '', 0, 0, '2020-08-15 19:47:49', '2020-08-15 19:47:49');
INSERT INTO `edu_banner` VALUES ('1294601777831813121', 'banner3', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/15/72f815b553ab4f40bfea949636ac6a3b3.jpg', '', 0, 0, '2020-08-15 19:48:11', '2020-08-15 19:48:11');
INSERT INTO `edu_banner` VALUES ('1294601833704136706', 'banner4', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/20/9166f6e436a244d5ad756df358bc677d4.jpg', '', 0, 0, '2020-08-15 19:48:24', '2020-08-20 22:01:10');
INSERT INTO `edu_banner` VALUES ('1295965819813011458', 'banner5', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/1294596c61c14e798ce7b9d564fd7afbv-play-bg.jpg', '', 0, 0, '2020-08-19 14:08:24', '2020-08-19 14:08:24');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `exam_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '考试id, 表示单元测试',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程章节' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1295959138454482945', '1295958589541724162', NULL, '01 走进Java世界', 0, '2020-08-19 13:41:51', '2020-08-19 13:41:51');
INSERT INTO `edu_chapter` VALUES ('1295959167458095105', '1295958589541724162', NULL, '02 数据类型与变量', 0, '2020-08-19 13:41:58', '2020-08-19 13:41:58');
INSERT INTO `edu_chapter` VALUES ('1295959186219216898', '1295958589541724162', NULL, '03 流程控制', 0, '2020-08-19 13:42:02', '2020-08-19 13:42:02');
INSERT INTO `edu_chapter` VALUES ('1295959207568224257', '1295958589541724162', NULL, '04 数组', 0, '2020-08-19 13:42:07', '2020-08-19 13:42:07');
INSERT INTO `edu_chapter` VALUES ('1295959226778136578', '1295958589541724162', NULL, '05 方法', 0, '2020-08-19 13:42:12', '2020-08-19 13:42:12');
INSERT INTO `edu_chapter` VALUES ('1295959253831397377', '1295958589541724162', NULL, '06 面向对象', 0, '2020-08-19 13:42:19', '2020-08-19 13:42:19');
INSERT INTO `edu_chapter` VALUES ('1295959277755707393', '1295958589541724162', NULL, '07 字符串', 0, '2020-08-19 13:42:24', '2020-08-19 13:42:24');
INSERT INTO `edu_chapter` VALUES ('1295962793240993793', '1295962761318146050', NULL, '01 常用类', 0, '2020-08-19 13:56:22', '2020-08-19 13:56:22');
INSERT INTO `edu_chapter` VALUES ('1295962818750750721', '1295962761318146050', NULL, '02 异常', 0, '2020-08-19 13:56:28', '2020-08-19 13:56:28');
INSERT INTO `edu_chapter` VALUES ('1295962847653699586', '1295962761318146050', NULL, '03 输入与输出', 0, '2020-08-19 13:56:35', '2020-08-19 13:56:35');
INSERT INTO `edu_chapter` VALUES ('1295962872098103297', '1295962761318146050', NULL, '04 集合框架', 0, '2020-08-19 13:56:41', '2020-08-19 13:56:41');
INSERT INTO `edu_chapter` VALUES ('1295962902167068674', '1295962761318146050', NULL, '05 多线程', 0, '2020-08-19 13:56:48', '2020-08-19 13:56:48');
INSERT INTO `edu_chapter` VALUES ('1295962923587379202', '1295962761318146050', NULL, '06 网络编程', 0, '2020-08-19 13:56:53', '2020-08-19 13:56:53');
INSERT INTO `edu_chapter` VALUES ('1295962950011494402', '1295962761318146050', NULL, '07 数据库', 0, '2020-08-19 13:57:00', '2020-08-19 13:57:00');
INSERT INTO `edu_chapter` VALUES ('1295962973138886658', '1295962761318146050', NULL, '08 反射', 0, '2020-08-19 13:57:05', '2020-08-19 13:57:05');
INSERT INTO `edu_chapter` VALUES ('1295971667830415362', '1295971643939659777', NULL, '第一章 绪论', 0, '2020-08-19 14:31:38', '2020-08-19 14:31:38');
INSERT INTO `edu_chapter` VALUES ('1295971686981607426', '1295971643939659777', NULL, '第二章 顺序和分支程序应用', 0, '2020-08-19 14:31:43', '2020-08-19 14:31:43');
INSERT INTO `edu_chapter` VALUES ('1295971708842319874', '1295971643939659777', NULL, '第三章 循环程序与应用', 0, '2020-08-19 14:31:48', '2020-08-19 14:31:48');
INSERT INTO `edu_chapter` VALUES ('1295971733307695106', '1295971643939659777', NULL, '第四章 数据类型和应用', 0, '2020-08-19 14:31:54', '2020-08-19 14:31:54');
INSERT INTO `edu_chapter` VALUES ('1295971755134853122', '1295971643939659777', NULL, '第五章 函数与应用', 0, '2020-08-19 14:31:59', '2020-08-19 14:31:59');
INSERT INTO `edu_chapter` VALUES ('1295971775141683202', '1295971643939659777', NULL, '第六章 文件', 0, '2020-08-19 14:32:04', '2020-08-19 14:32:04');
INSERT INTO `edu_chapter` VALUES ('1295971792720011266', '1295971643939659777', NULL, '第七章 异常处理', 0, '2020-08-19 14:32:08', '2020-08-19 14:32:08');
INSERT INTO `edu_chapter` VALUES ('1295971817281855489', '1295971643939659777', NULL, '第 八章 拓展与应用', 0, '2020-08-19 14:32:14', '2020-08-19 14:32:14');
INSERT INTO `edu_chapter` VALUES ('1295974225017872385', '1295974194441396225', NULL, '01 导言', 0, '2020-08-19 14:41:48', '2020-08-19 14:41:48');
INSERT INTO `edu_chapter` VALUES ('1295974241686036482', '1295974194441396225', NULL, '02 认识数据', 0, '2020-08-19 14:41:52', '2020-08-19 14:41:52');
INSERT INTO `edu_chapter` VALUES ('1295974260262608898', '1295974194441396225', NULL, '03 数据预处理', 0, '2020-08-19 14:41:56', '2020-08-19 14:41:56');
INSERT INTO `edu_chapter` VALUES ('1295974280886001665', '1295974194441396225', NULL, '04 关联规则挖掘', 0, '2020-08-19 14:42:01', '2020-08-19 14:42:01');
INSERT INTO `edu_chapter` VALUES ('1295974300611813378', '1295974194441396225', NULL, '05 分类', 0, '2020-08-19 14:42:06', '2020-08-19 14:42:06');
INSERT INTO `edu_chapter` VALUES ('1295974319037390849', '1295974194441396225', NULL, '06 数值预测', 0, '2020-08-19 14:42:10', '2020-08-19 14:42:10');
INSERT INTO `edu_chapter` VALUES ('1295974341523054594', '1295974194441396225', NULL, '07 聚类分析', 0, '2020-08-19 14:42:16', '2020-08-19 14:42:16');
INSERT INTO `edu_chapter` VALUES ('1295974364998574081', '1295974194441396225', NULL, '08 复杂数据的挖掘', 0, '2020-08-19 14:42:21', '2020-08-19 14:42:21');
INSERT INTO `edu_chapter` VALUES ('1295979724698312706', '1295979692880322562', NULL, '01 初识HTML5', 0, '2020-08-19 15:03:39', '2020-08-19 15:03:39');
INSERT INTO `edu_chapter` VALUES ('1295979743908225025', '1295979692880322562', NULL, '02 HTML5网页文档结构', 0, '2020-08-19 15:03:44', '2020-08-19 15:03:44');
INSERT INTO `edu_chapter` VALUES ('1295979760937099266', '1295979692880322562', NULL, '03 HTML5与HTML4的区别', 0, '2020-08-19 15:03:48', '2020-08-19 15:03:48');
INSERT INTO `edu_chapter` VALUES ('1295979788812443650', '1295979692880322562', NULL, '04 设计网页文本的内容', 0, '2020-08-19 15:03:54', '2020-08-19 15:03:54');
INSERT INTO `edu_chapter` VALUES ('1295979814045376513', '1295979692880322562', NULL, '05 网页文本列表设计', 0, '2020-08-19 15:04:00', '2020-08-19 15:04:00');
INSERT INTO `edu_chapter` VALUES ('1295979834882678786', '1295979692880322562', NULL, '06 HTML5网页中的图像', 0, '2020-08-19 15:04:05', '2020-08-19 15:04:05');
INSERT INTO `edu_chapter` VALUES ('1295979860988026882', '1295979692880322562', NULL, '07 使用HTML5建立超链接', 0, '2020-08-19 15:04:12', '2020-08-19 15:04:12');
INSERT INTO `edu_chapter` VALUES ('1295979878838984705', '1295979692880322562', NULL, '08 使用HTML5创建表单', 0, '2020-08-19 15:04:16', '2020-08-19 15:04:16');
INSERT INTO `edu_chapter` VALUES ('1295979904873029633', '1295979692880322562', NULL, '09 使用HTML5创建表格', 0, '2020-08-19 15:04:22', '2020-08-19 15:04:22');
INSERT INTO `edu_chapter` VALUES ('1295991182828003329', '1295991115257765890', NULL, '第一章 简介', 0, '2020-08-19 15:49:11', '2020-08-19 15:51:26');
INSERT INTO `edu_chapter` VALUES ('1295992044749086722', '1295991115257765890', NULL, '第二章 文本字体', 0, '2020-08-19 15:52:36', '2020-08-19 15:52:36');
INSERT INTO `edu_chapter` VALUES ('1295992314421862401', '1295991115257765890', NULL, '第三章 动画界面', 0, '2020-08-19 15:53:41', '2020-08-19 15:53:41');
INSERT INTO `edu_chapter` VALUES ('1295992594404237314', '1295991115257765890', NULL, '第四章 分页盒子多媒体', 0, '2020-08-19 15:54:48', '2020-08-19 15:54:48');
INSERT INTO `edu_chapter` VALUES ('1295996876721512449', '1295996835592167426', NULL, '第1章 JavaScript初探', 0, '2020-08-19 16:11:49', '2020-08-19 16:11:49');
INSERT INTO `edu_chapter` VALUES ('1295997391941427201', '1295996835592167426', NULL, '第2章 JavaScript语言基础', 0, '2020-08-19 16:13:51', '2020-08-19 16:13:51');
INSERT INTO `edu_chapter` VALUES ('1295998202553589762', '1295996835592167426', NULL, '第3章 常用内置对象', 0, '2020-08-19 16:17:05', '2020-08-19 16:17:05');
INSERT INTO `edu_chapter` VALUES ('1295998696344805378', '1295996835592167426', NULL, '第四章 BOM和DOM', 0, '2020-08-19 16:19:02', '2020-08-19 16:19:02');
INSERT INTO `edu_chapter` VALUES ('1296002835887972354', '1296002590860926978', NULL, '01 Vue 简介', 0, '2020-08-19 16:35:29', '2020-08-19 16:36:53');
INSERT INTO `edu_chapter` VALUES ('1296003294249902082', '1296002590860926978', NULL, '02 Vue 基础语法', 0, '2020-08-19 16:37:19', '2020-08-19 16:37:27');
INSERT INTO `edu_chapter` VALUES ('1296003837286440962', '1296002590860926978', NULL, '03 Vue 组件', 0, '2020-08-19 16:39:28', '2020-08-19 16:39:28');
INSERT INTO `edu_chapter` VALUES ('1296068107260940290', '1296068074708946946', NULL, '01 数据库概述', 0, '2020-08-19 20:54:51', '2020-08-19 20:54:51');
INSERT INTO `edu_chapter` VALUES ('1296068151498264578', '1296068074708946946', NULL, '02 MySQL入门', 0, '2020-08-19 20:55:02', '2020-08-19 20:55:02');
INSERT INTO `edu_chapter` VALUES ('1296068173203787777', '1296068074708946946', NULL, '03 数据库、数据表、记录、索引的操作', 0, '2020-08-19 20:55:07', '2020-08-19 20:55:07');
INSERT INTO `edu_chapter` VALUES ('1296068205449596930', '1296068074708946946', NULL, '04 数据查询、视图', 0, '2020-08-19 20:55:15', '2020-08-19 20:55:15');
INSERT INTO `edu_chapter` VALUES ('1296068225410289666', '1296068074708946946', NULL, '05 MySQL编程基础', 0, '2020-08-19 20:55:19', '2020-08-19 20:55:19');
INSERT INTO `edu_chapter` VALUES ('1296068254573285377', '1296068074708946946', NULL, '06 存储程序', 0, '2020-08-19 20:55:26', '2020-08-19 20:55:26');
INSERT INTO `edu_chapter` VALUES ('1296068273598648321', '1296068074708946946', NULL, '07 访问控制', 0, '2020-08-19 20:55:31', '2020-08-19 20:55:31');
INSERT INTO `edu_chapter` VALUES ('1296070853259186178', '1296070682475515905', NULL, '第一章 Redis简介及安装', 0, '2020-08-19 21:05:46', '2020-08-19 21:05:46');
INSERT INTO `edu_chapter` VALUES ('1296070945865224194', '1296070682475515905', NULL, '第二章 Redis命令及数据类型', 0, '2020-08-19 21:06:08', '2020-08-19 21:06:08');
INSERT INTO `edu_chapter` VALUES ('1296071015390007297', '1296070682475515905', NULL, '第三章 Redis事务', 0, '2020-08-19 21:06:25', '2020-08-19 21:08:58');
INSERT INTO `edu_chapter` VALUES ('1296071705378181121', '1296070682475515905', NULL, '第四章 Redis持久化', 0, '2020-08-19 21:09:09', '2020-08-19 21:09:09');
INSERT INTO `edu_chapter` VALUES ('1296075268988882945', '1296075223002533889', NULL, '第1章  计算机系统概述', 0, '2020-08-19 21:23:19', '2020-08-19 21:23:19');
INSERT INTO `edu_chapter` VALUES ('1296075296771952641', '1296075223002533889', NULL, '第2章  数据的表示、运算与校验', 0, '2020-08-19 21:23:25', '2020-08-19 21:23:25');
INSERT INTO `edu_chapter` VALUES ('1296075317709918209', '1296075223002533889', NULL, '第3章  CPU子系统', 0, '2020-08-19 21:23:30', '2020-08-19 21:23:30');
INSERT INTO `edu_chapter` VALUES ('1296075341139300353', '1296075223002533889', NULL, '第4章  存储子系统', 0, '2020-08-19 21:23:36', '2020-08-19 21:23:36');
INSERT INTO `edu_chapter` VALUES ('1296075365768253442', '1296075223002533889', NULL, '第5章  总线与I/O子系统', 0, '2020-08-19 21:23:42', '2020-08-19 21:23:42');
INSERT INTO `edu_chapter` VALUES ('1296075382763573249', '1296075223002533889', NULL, '第6章  I/O设备及其接口', 0, '2020-08-19 21:23:46', '2020-08-19 21:23:46');
INSERT INTO `edu_chapter` VALUES ('1296078404315009026', '1296078367702929410', NULL, '01 云计算概论', 0, '2020-08-19 21:35:46', '2020-08-19 21:35:46');
INSERT INTO `edu_chapter` VALUES ('1296078421931085825', '1296078367702929410', NULL, '02 云计算关键技术', 0, '2020-08-19 21:35:50', '2020-08-19 21:35:50');
INSERT INTO `edu_chapter` VALUES ('1296078437508730882', '1296078367702929410', NULL, '03 云服务', 0, '2020-08-19 21:35:54', '2020-08-19 21:35:54');
INSERT INTO `edu_chapter` VALUES ('1296078453568720897', '1296078367702929410', NULL, '04 开源云计算管理平台', 0, '2020-08-19 21:35:58', '2020-08-19 21:35:58');
INSERT INTO `edu_chapter` VALUES ('1296078469788094465', '1296078367702929410', NULL, '05 云计算企业解决方案', 0, '2020-08-19 21:36:02', '2020-08-19 21:36:02');
INSERT INTO `edu_chapter` VALUES ('1296078486921826306', '1296078367702929410', NULL, '06 开源大数据处理云平台', 0, '2020-08-19 21:36:06', '2020-08-19 21:36:06');
INSERT INTO `edu_chapter` VALUES ('1296466751826968577', '1296081833624096769', NULL, '测试视频', 0, '2020-08-20 23:18:55', '2020-08-20 23:18:55');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程标题',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '课程简介',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1295958589541724162', '1295957488608227329', '1295951803136880641', '1295951801295581186', 'Java程序设计 (一)', '<p>Java程序设计是计算机相关专业的一门学科基础必修课程。对计算机专业而言，本课程是进一步学习其他专业知识的第一步阶梯；对于非计算机专业而言，本课程的学习有助于更好的利用计算机解决本专业领域内的问题。</p>\n<p>本课程知识内容涵盖Java语言基础知识、面向对象技术、基本输入输出、图形用户界面、容器与集合、多线程、网络编程和数据库编程等内容。通过该课程的学习，学生可以掌握以Java语言为基础的面向对象编程的思想和技术，掌握面向对象程序设计方法，提高程序设计能力。</p>\n<p>课程内容丰富、新颖，能反映技术的新进展。主讲讲师以随堂编程的形式将理论与实践相结合，具有趣味性和启发性，有助于学生算法设计能力和分析、解决问题能力的培养。</p>', 0.00, 38, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/e17ea9cd3529495dabdd5647c964c117Java程序设计（一）.jpg', 0, 334, 1, 'Normal', 0, '2020-08-19 13:39:40', '2020-08-31 11:24:59');
INSERT INTO `edu_course` VALUES ('1295962761318146050', '1295957488608227329', '1295951803136880641', '1295951801295581186', 'Java程序设计 (二)', '<p>Java程序设计是计算机相关专业的一门学科基础必修课程。对计算机专业而言，本课程是进一步学习其他专业知识的第一步阶梯；对于非计算机专业而言，本课程的学习有助于更好的利用计算机解决本专业领域内的问题。</p>\n<p>本课程知识内容涵盖Java语言基础知识、面向对象技术、基本输入输出、图形用户界面、容器与集合、多线程、网络编程和数据库编程等内容。通过该课程的学习，学生可以掌握以Java语言为基础的面向对象编程的思想和技术，掌握面向对象程序设计方法，提高程序设计能力。</p>\n<p>课程内容丰富、新颖，能反映技术的新进展。主讲讲师以随堂编程的形式将理论与实践相结合，具有趣味性和启发性，有助于学生算法设计能力和分析、解决问题能力的培养。</p>', 0.00, 46, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/f046404beb8e4d89a1208fc710988ba7Java程序设计（一）.jpg', 0, 18, 1, 'Normal', 0, '2020-08-19 13:56:15', '2020-08-20 12:08:39');
INSERT INTO `edu_course` VALUES ('1295971643939659777', '1295722488713572354', '1295951801660485633', '1295951801295581186', 'Python程序设计', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本课程向学生介绍程序设计的基本思想、方法和技能。通过本课程的学习，让学生掌握一定的程序设计能力、分析问题和解决问题的能力，让学生掌握Python程序设计语言，掌握Python程序结构，Python程序设计过程和技巧，能够编写Python程序解决实际计算问题，掌握计算机科学领域的一些基本算法，掌握一定的程序调试方法和技巧，养成良好的编程习惯。</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 通过本课程的学习，为后续课程(面向对象程序设计、数据结构等)提供必要的专业基础知识，培养学生的程序设计思维模式和方法。通过设计一系列的实验，达到理论联系实际，巩固所学理论知识，培养学生初步的程序设计能力和程序实现技能。</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本课程以案例为主线，融合语法与算法，深入浅出分析并解决实际问题。</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 开拓计算思维、解决科学问题、探究前沿技术。</p>', 0.00, 32, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/941cb1064e054497a6b124dc8b4bddbdPython程序设计.jpg', 0, 12, 1, 'Normal', 0, '2020-08-19 14:31:33', '2020-08-20 12:10:08');
INSERT INTO `edu_course` VALUES ('1295974194441396225', '1295722488713572354', '1295951801660485633', '1295951801295581186', '数据挖掘与python实践', '<p>《数据挖掘与Python实践》课程主要讲授数据挖掘的基本理论、各个分支及应用。课程涵盖DM的定义、流程、数据预处理、数据可视化、关联分析、聚类、分类、数值预测等内容。通过课程学习，你将会掌握数据挖掘的基本理论、思想和方法，并通过简单易用的软件来解决相关的问题。</p>', 0.01, 43, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/adfa83058b25426eb1f0ee66e7cd0cfa数据挖掘与python实践.jpg', 0, 11, 1, 'Normal', 0, '2020-08-19 14:41:41', '2020-08-20 22:55:08');
INSERT INTO `edu_course` VALUES ('1295979692880322562', '1295732573565218817', '1295951793313820673', '1295951792927944706', 'HTML5网页设计', '<p>&nbsp;&nbsp;&nbsp;随着新一轮科技革命与信息技术革命的到来，推动了产业机构调整与经济转型升级发展新业态的出现。从PC端到移动端，再到新显示技术、智能机器人等新兴领域，都需要使用Web前端开发技术，Web前端开发人员人才需求量巨大。&nbsp;&nbsp;</p>\n<p>&nbsp; &nbsp;HTML5是目前主流的Web前端语言。《HTML5网页前端设计》课程在Web前端开发（群）（网页设计与制作、移动网页制作与设计、HTML5开发、JS开发）职业能力分析基础上选取教学内容，全面覆盖Web前端初级岗位所需技能，按照&ldquo;搭建网页结构&mdash;&mdash;美化网页效果&mdash;&mdash;添加网页交互&rdquo;的网站设计工作过程，精心设计 &ldquo;HTML5、CSS3、javaScript和jQuery\"3个教学模块，涵盖&ldquo;网页设计、移动端响应式网页制作、CSS3高级应用、jQuery页面交互&rdquo;这些实用技能知识。</p>', 0.00, 36, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/6cc05f0b451a4430aa3c0af4e1eb5447HTML5网页设计.jpg', 0, 13, 1, 'Normal', 0, '2020-08-19 15:03:32', '2020-08-20 12:12:24');
INSERT INTO `edu_course` VALUES ('1295991115257765890', '1295732573565218817', '1295951793825525761', '1295951792927944706', 'CSS3 网页设计', '<p>CSS 用于控制网页的样式和布局。CSS3 是最新的 CSS 标准。</p>', 0.00, 20, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/72e931c58b784a49ae306bf6409a6ac2CSS3 网页设计.jpg', 0, 11, 1, 'Normal', 0, '2020-08-19 15:48:55', '2020-08-20 12:13:05');
INSERT INTO `edu_course` VALUES ('1295996835592167426', '1295723232816656386', '1295951796044312577', '1295951795687796737', 'JavaScript', '<p>&nbsp;&nbsp;&nbsp;掌握JavaScrip及框架基本语法；常用对象的使用，贯彻事件驱动的程序设计思想。网页设计布局合理，色彩搭配合理，网页操作方便。熟悉JavaScript的调试方法，同时充分利用能够得到的软硬件资源，搜索材料，自主学习，课程实施应成为学生在教师的指导下构建知识、活跃思维、展现个性和拓展视野的过程。同时注重学生的自主学习、提高学生的动手能力，并形成良好的编程习惯，初步培养学生网站开发的意识和能力。</p>', 0.00, 24, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/b959ffa58de943e89ceb59bed4c80d8aJavaScript.jpg', 0, 10, 1, 'Normal', 0, '2020-08-19 16:11:39', '2020-08-20 12:13:39');
INSERT INTO `edu_course` VALUES ('1296002590860926978', '1295723232816656386', '1295951798028218369', '1295951795687796737', 'Vue', '<div class=\"tutintro\">\n<p>&nbsp;&nbsp;&nbsp;Vue.js（读音 /vjuː/, 类似于 view） 是一套构建用户界面的渐进式框架。Vue 只关注视图层， 采用自底向上增量开发的设计。Vue 的目标是通过尽可能简单的 API 实现响应的数据绑定和组合的视图组件。Vue 学习起来非常简单.通过课程你能学习到模板、数据绑定、声明式渲染、计算属性、事件处理、过渡动画、指令、自定义Vue插件、组件化开发、组件间通信、Ajax前后台交互、Vue-Router 等. 对数据代理、模板解析、数据劫持等知识点。</p>\n</div>', 0.00, 18, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/8b36d273249f4728a2f01a5c705785f7vue.jpg', 0, 10, 1, 'Normal', 0, '2020-08-19 16:34:31', '2020-08-20 12:14:13');
INSERT INTO `edu_course` VALUES ('1296068074708946946', '1295726581611884545', '1295951806743982082', '1295951805900926977', 'MySQL数据库', '<p>本课程主要介绍关系数据库设计、MySQL基础知识、编程知识：</p>\n<p>A．了解关系数据库的发展历程，认识到数据库对社会发展的重要性。</p>\n<p>B．理解概念模型和关系模型，掌握概念模型到关系模型的转化；掌握用E-R图设计数据库的方法。</p>\n<p>C．了解MySQL数据库的由来。熟练掌握MySQL数据库、表、索引、视图对象的管理，熟练掌握和运用SQL查询语句。了解SQL语言的由来和发展。</p>\n<p>D．掌握MySQL程序结构，理解存储程序的机制和特点，掌握存储程序的运用。理解和掌握存储过程、存储函数、触发器、事件对象的管理。</p>\n<p>E.了解安全管理、备份和恢复。掌握MySQL数据库的安全管理、备份和恢复管理与维护技术，认识到数据库安全的重要性。</p>', 0.00, 42, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/20/a84c5974043b48fd9d081ffb5e1baaaeMySQL.jpg', 0, 11, 1, 'Normal', 0, '2020-08-19 20:54:43', '2020-08-20 12:25:33');
INSERT INTO `edu_course` VALUES ('1296070682475515905', '1295726581611884545', '1295951808669167618', '1295951805900926977', 'Redis', '<p>REmote DIctionary Server(Redis) 是一个由Salvatore Sanfilippo写的key-value存储系统。Redis是一个开源的使用ANSI C语言编写、遵守BSD协议、支持网络、可基于内存亦可持久化的日志型、Key-Value数据库，并提供多种语言的API。它通常被称为数据结构服务器，因为值（value）可以是 字符串(String), 哈希(Hash), 列表(list), 集合(sets) 和 有序集合(sorted sets)等类型。</p>', 0.00, 25, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/9e6b5483f3e54b46af45839c133c8740Redis.jpg', 0, 11, 1, 'Normal', 0, '2020-08-19 21:05:05', '2020-08-20 12:15:56');
INSERT INTO `edu_course` VALUES ('1296075223002533889', '1296074867258445825', '1295951813467451394', '1295951812154634242', '计算机组成原理', '<p>通过本课程的学习，使学生了解计算机的发展历史和未来发展趋势，掌握数字逻辑设计的基本理论和技术，如数制、码制、逻辑代数、逻辑化简技术。掌握数字电路中的基本逻辑器件的基本工作原理和使用中应注意的各方面问题，掌握各种逻辑部件和逻辑单元的基本逻辑功能，初步掌握运用逻辑器件和逻辑部件实现简单的数字电子系统设计的能力。掌握计算机系统的基本知识，掌握计算机内部的各种信息编码、基本运算的操作原理、基本部件的构造和组织方式、部件和单元电路的设计方法，建立一个完整的整机概念，并深刻理解计算机各子系统之间的相互联系以及各自在计算机整机中的地位和作用。</p>', 0.01, 34, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/aae6834be9094d08888b5fcbe768fda5计算机组成原理.jpg', 0, 11, 1, 'Normal', 0, '2020-08-19 21:23:08', '2020-08-20 12:16:20');
INSERT INTO `edu_course` VALUES ('1296078367702929410', '1295730208116174850', '1295951815623323650', '1295951815275196417', '大数据之Hadoop', '<p>云计算是继1980年代大型计算机到客户端-服务器的大转变之后信息技术领域又一次巨变。从技术上看,大数据与云计算的关系就像一枚硬币的正反面一样密不可分。大数据的特色在于对海量数据的挖掘, 但它必须依托云计算的分布式处理、分布式数据库、云存储和虚拟化技术。&ldquo;云计算技术与应用&rdquo;课程在介绍云计算历史、发展及趋势的基础上，重点介绍云计算关键技术、基础架构及各种主流解决方案。课程主要内容包括：云计算概述、云计算关键技术、云服务体系、云计算主流解决方案（Google云计算、Amazon云计算、IBM云计算等）、开源云计算与大数据处理平台（OpenStack、Hadoop等）。由于云计算是近年来计算机科学技术中的研究和应用热点，技术平台更新快，因此本课程会紧密跟踪主流云计算技术及发展，拓宽学生知识面。</p>', 0.01, 20, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/00d9ae6e843f413e8284f28d4d36ddec大数据之Hadoop.jpg', 0, 12, 1, 'Normal', 0, '2020-08-19 21:35:37', '2020-08-20 12:17:35');
INSERT INTO `edu_course` VALUES ('1296081833624096769', '1295729331598913538', '1295951803619225601', '1295951801295581186', 'C语言程序设计', '<p>C语言是一种高级程序设计语言，具有简洁、紧凑、高效等特点。它既可用于编写应用软件，也可用于编写系统软件。自1973年问世以来，C语言迅速发展并成为最受欢迎的编程语言之一。大多数软件开发商会优先选择C语言开发系统软件、应用程序、编译器和相关产品。这样的状态一直保持了20年，直到C语言的超集C++问世，许多开发商开始使用C++来开发一些复杂的、规模较大的项目，因此C语言进入了一个冷落时期。这个冷落时期并没有持续太长时间，随着嵌入式产品的增多，C语言因简洁高效的特点又被重视起来，被广泛地应用于手机、游戏机、机顶盒、平板电脑、高清电视、电子词典、可视电话等现代化设备的微处理器编程。随着信息化、智能化、网络化进程的发展，嵌入式系统技术的发展空间还会逐渐加大，C语言的应用范围会更加广泛。</p>', 0.00, 0, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/2a341a2db7744a8794ff50a4a7e155aaC语言程序设计.jpg', 0, 66, 1, 'Normal', 0, '2020-08-19 21:49:24', '2020-08-21 16:51:39');
INSERT INTO `edu_course` VALUES ('1296084859717963778', '1295729331598913538', '1295951804101570561', '1295951801295581186', 'C++程序设计', '<p>做人工智能研究，想要深入底层；比如TensorFlow的核心是用C++写的；做游戏开发，包括端游和网游后台，以发挥计算机的全部性能，需要C++；做智能硬件、嵌入式或硬件驱动开发；C++会提供更多工具，生产效率更高；</p>', 0.00, 0, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/1b8642bf4d024a29a22d4f19b122078dC艹程序设计.jpg', 0, 1, 1, 'Normal', 0, '2020-08-19 22:01:25', '2020-08-20 00:23:13');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `member_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程收藏' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES ('1296109093336928257', '1295979692880322562', '1289543825605283843', 0, '2020-08-19 23:37:43', '2020-08-19 23:37:43');
INSERT INTO `edu_course_collect` VALUES ('1296112146421141505', '1295962761318146050', '1296102077461794818', 0, '2020-08-19 23:49:51', '2020-08-19 23:49:51');
INSERT INTO `edu_course_collect` VALUES ('1296112181716209665', '1295958589541724162', '1296102077461794818', 0, '2020-08-19 23:49:59', '2020-08-19 23:49:59');
INSERT INTO `edu_course_collect` VALUES ('1296112440253108226', '1295971643939659777', '1296102077461794818', 0, '2020-08-19 23:51:01', '2020-08-19 23:51:01');

-- ----------------------------
-- Table structure for edu_course_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_comment`;
CREATE TABLE `edu_course_comment`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论ID',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评论内容',
  `score` int(5) DEFAULT NULL COMMENT '课程评分',
  `support_num` int(66) DEFAULT 0 COMMENT '点赞数',
  `status` int(5) DEFAULT 0 COMMENT '点赞的状态, 1为已点赞, 0为没有点赞',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_course_comment
-- ----------------------------
INSERT INTO `edu_course_comment` VALUES ('1296107055593050114', '1295958589541724162', '1295957488608227329', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '我要说：学习完这门课的学生是有能力在以后自学java的。 在课程概述里有一句\"本课程将以java语言为背景来介绍面向对象程序设计的知识、理念和手段\"。就结果来看，课程是达到了目的——带学生领略java的魅力，让学生见识有关面向对象的内容。总得来说，这门课程与其说是在教会学生怎么用写出一些程序，到不如说是在带学生广泛预览一遍java的功能，让学生见识到java这门编程语言与其他语言不同的内部思想，进而激发学生真正动手深入学习的兴趣。 至于继续深入学习就要靠你...', 5, 88, 0, 0, '2020-08-19 23:29:37', '2020-08-20 11:26:48');
INSERT INTO `edu_course_comment` VALUES ('1296107696797274114', '1295962761318146050', '1295957488608227329', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '好！ （此回复虽有且仅有一 个字，却深刻的表达了回复人的深深祝福与刻骨的情感，可谓言简意骇，一字千金，字字扣人心弦，字字催人泪下，足可见回复人扎实的文字功底和信手拈来的写作技巧以及惨绝人寰的创新能力。实是佩服佩服！再加上以感叹号收尾，点睛之笔，妙笔生花，意境深远，照应前文，升华主题，把回复人的感情表达的淋漓尽致，给人以无限的感动和惆怅，有浑然天成之感，实乃回复中之极品，祝福中之绝笔。）..', 5, 66, 0, 0, '2020-08-19 23:32:10', '2020-08-20 00:19:27');
INSERT INTO `edu_course_comment` VALUES ('1296108090856329217', '1295971643939659777', '1295722488713572354', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '每一小节时间控制很好，学习效果真的不错，不过我个人习惯一看就看半天的那种所以我学的很快，我想我需要不断的回顾与看我自己所做的笔记来稳固Python的学习。', 5, 1, 1, 0, '2020-08-19 23:33:44', '2020-08-20 00:14:15');
INSERT INTO `edu_course_comment` VALUES ('1296108358125768706', '1295974194441396225', '1295722488713572354', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '老师们非常尽心尽力，感觉收获了很多，很好的课程！', 5, 2, 0, 0, '2020-08-19 23:34:48', '2020-08-20 00:07:59');
INSERT INTO `edu_course_comment` VALUES ('1296109039414956034', '1295979692880322562', '1295732573565218817', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '听了老师讲的HTML5，真的是受益匪浅，让我对网页有了新的理解，俗话说得好，师傅领进门，修行看个人，老苏我会加油的<(*￣▽￣*)/', 5, 2, 0, 0, '2020-08-19 23:37:30', '2020-08-19 23:54:10');
INSERT INTO `edu_course_comment` VALUES ('1296109678266175490', '1295991115257765890', '1295732573565218817', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '学习为了了老苏的HTML5, 接着来学习老苏的CSS3, 给我的感觉就是HTML是骨架是基石，而CSS则是色彩，用来描绘一幅蓝图，让我沉浸其中，无法自拔，棒棒哒', 5, 0, 0, 0, '2020-08-19 23:40:03', '2020-08-19 23:55:42');
INSERT INTO `edu_course_comment` VALUES ('1296110162116890625', '1295996835592167426', '1295723232816656386', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '许老师讲的JavaScript生动形象，老师讲课的风格也非常的有趣，很幽默，让复杂的课程变得轻松愉快起来，讲的非常好~', 5, 2, 0, 0, '2020-08-19 23:41:58', '2020-08-20 00:09:29');
INSERT INTO `edu_course_comment` VALUES ('1296110377796390914', '1296002590860926978', '1295723232816656386', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '学到了很多专业知识，实践与理论相结合，课程讲解细致，非常好，收获很大', 5, 0, 0, 0, '2020-08-19 23:42:49', '2020-08-19 23:58:47');
INSERT INTO `edu_course_comment` VALUES ('1296110679857582082', '1296068074708946946', '1295726581611884545', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '课程内容组织合理，讲解与操作相结合，有一定的难度和深度，特别是有些作业和讨论，必须要跳一跳才能完成，不是水课。大家在学习过程中能发现错误，说明不是走马观花，而是在认真地学（赞）。团队老师很敬业，回答问题很有耐心，如NULL、having、视图等都做一一解答。老师不但能解知识上的疑惑，还能化解学生的畏难情绪（哈哈），真是良师益友啊！不完美之处就是与等考结合度不够深，我们已经在准备了', 5, 2, 0, 0, '2020-08-19 23:44:01', '2020-08-20 11:21:04');
INSERT INTO `edu_course_comment` VALUES ('1296110797633638401', '1296070682475515905', '1295726581611884545', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '很好 ，没有照书长读的枯燥，能够简单说明知识内容后就立刻上机实操教学，内容也安排得有序渐进，我比较喜欢这种教学。 如果必须提出改进意见，我觉得可以在讲知识点内容的时候加上一些黑板图画什么的来讲解，这样会更具体和入脑。 (我打分比较苛刻，也按照打分提示：棒！实属上乘)', 5, 0, 0, 0, '2020-08-19 23:44:29', '2020-08-20 00:11:11');
INSERT INTO `edu_course_comment` VALUES ('1296110928860827650', '1296075223002533889', '1296074867258445825', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '刚开始学这门课程，感觉老师讲课讲的很好，知识点讲的很全面呀~而且讲课有点四川口音真的是听起来好萌O(∩_∩)O~~~', 5, 2, 0, 0, '2020-08-19 23:45:01', '2020-08-20 00:11:42');
INSERT INTO `edu_course_comment` VALUES ('1296111094623916033', '1296078367702929410', '1295730208116174850', '1289543825605283843', 'Andy', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Andy.jpg', '之前对云计算方面没怎么接触过，通过观看这个视频，对云计算技术有了个很好的了解，对hadoop的也有了一些基本的了解，很快的了解Docker的安装和简单使用，对一些常用的命令都讲解的很详细，老师们都非常认真，是一个比较好的课程，很赞。期待几位老师的其他课程。', 5, 2, 0, 0, '2020-08-19 23:45:40', '2020-08-20 11:23:35');
INSERT INTO `edu_course_comment` VALUES ('1296111756183097346', '1295958589541724162', '1295957488608227329', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '老师讲课的内容条理清晰、科学、有根有据，让我很容易就理解了原来很深奥的问题！', 4, 2, 0, 0, '2020-08-19 23:48:18', '2020-08-20 00:12:44');
INSERT INTO `edu_course_comment` VALUES ('1296112052703612929', '1295962761318146050', '1295957488608227329', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '听了好几门java的课，这门课是最棒的。不一接受反驳。嘻嘻O(∩_∩)O', 4, 1, 1, 0, '2020-08-19 23:49:29', '2020-08-19 23:49:41');
INSERT INTO `edu_course_comment` VALUES ('1296112416634982402', '1295971643939659777', '1295722488713572354', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '许老师的课真心不错，难易适中，内容循序渐进，条理清晰，案例详实，很适合python初学者，很值得多听几遍。', 4, 2, 0, 0, '2020-08-19 23:50:55', '2020-08-20 00:07:09');
INSERT INTO `edu_course_comment` VALUES ('1296112763164184578', '1295974194441396225', '1295722488713572354', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '老师讲的通俗易懂，将困难的知识讲的很生动有趣，不错，是个好课程~', 4, 0, 0, 0, '2020-08-19 23:52:18', '2020-08-20 00:08:01');
INSERT INTO `edu_course_comment` VALUES ('1296113225070301186', '1295979692880322562', '1295732573565218817', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '老师讲的网页设计，真的超级棒(๑•̀ㅂ•́)و✧', 4, 1, 1, 0, '2020-08-19 23:54:08', '2020-08-19 23:54:09');
INSERT INTO `edu_course_comment` VALUES ('1296113579866476546', '1295991115257765890', '1295732573565218817', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '学完苏老师HTML来的，好的课程不用多说，点赞o(￣▽￣)ｄ', 4, 2, 0, 0, '2020-08-19 23:55:33', '2020-08-20 00:09:15');
INSERT INTO `edu_course_comment` VALUES ('1296113933567938562', '1295996835592167426', '1295723232816656386', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '老师上课很有趣，总是会引导我们自己思考这个问题，理论加实践，完美！', 4, 2, 0, 0, '2020-08-19 23:56:57', '2020-08-20 00:09:30');
INSERT INTO `edu_course_comment` VALUES ('1296114359382069250', '1296002590860926978', '1295723232816656386', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', 'Vus这门课程，这个老师是我心目中将的最好的，但是...老师总是喜欢说，“啊，同学们，啊，啊”', 4, 2, 0, 0, '2020-08-19 23:58:39', '2020-08-20 11:20:26');
INSERT INTO `edu_course_comment` VALUES ('1296114593751388161', '1296068074708946946', '1295726581611884545', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '第一次见女老师，讲的属实，老师声音很好听，是女神的那种，好喜欢呀\\(^o^)/~', 4, 0, 0, 0, '2020-08-19 23:59:34', '2020-08-19 23:59:34');
INSERT INTO `edu_course_comment` VALUES ('1296114782537011202', '1296070682475515905', '1295726581611884545', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '老师的实力很强，内力很深，让我打开了新世界的大门，超级好的课程', 4, 0, 0, 0, '2020-08-20 00:00:19', '2020-08-20 00:11:13');
INSERT INTO `edu_course_comment` VALUES ('1296115064117415938', '1296075223002533889', '1296074867258445825', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '喜欢这种方便的授课方式，很享受老师讲的这门课，看似简单，其实是粗中带细', 4, 0, 0, 0, '2020-08-20 00:01:27', '2020-08-20 00:01:27');
INSERT INTO `edu_course_comment` VALUES ('1296115297224249346', '1296078367702929410', '1295730208116174850', '1296102077461794818', 'Ashley', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Ashley.png', '老师讲的概念性的东西，，真的好难理解啊...专业名词太多了.我觉得我还是要回去补补基础，然后再来刷一遍', 4, 2, 0, 0, '2020-08-20 00:02:22', '2020-08-20 00:17:51');
INSERT INTO `edu_course_comment` VALUES ('1296115864625500161', '1295958589541724162', '1295957488608227329', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '这门课程很适合入门...基础不牢，地动山摇', 4, 2, 0, 0, '2020-08-20 00:04:37', '2020-08-20 11:13:06');
INSERT INTO `edu_course_comment` VALUES ('1296116075481550850', '1295962761318146050', '1295957488608227329', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '接着上一课程来的，赞(⊙o⊙)…', 4, 0, 0, 0, '2020-08-20 00:05:28', '2020-08-20 11:15:43');
INSERT INTO `edu_course_comment` VALUES ('1296116471558066178', '1295971643939659777', '1295722488713572354', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '厉害了。我听了这么多人的课，只有您才让我感觉到一下就懂了', 4, 2, 0, 0, '2020-08-20 00:07:02', '2020-08-20 00:14:17');
INSERT INTO `edu_course_comment` VALUES ('1296116693587742722', '1295974194441396225', '1295722488713572354', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '授课的内容感觉还是很有吸引力，有我刚入门觉得很有意思的基础概念，也有几个基本算法介绍，教授的内容起码是新知识。 但是听不懂，很少结合实例来讲，但是知道要讲什么后可以去网上对这个概念查一下，毕竟都是基础的知识，网上图文讲解很多。 ', 4, 1, 1, 0, '2020-08-20 00:07:55', '2020-08-20 00:07:57');
INSERT INTO `edu_course_comment` VALUES ('1296116922336694274', '1295979692880322562', '1295732573565218817', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '课程都很棒，适合在校学生按照学期课程进度进行学习，对于在职的人来说时间跨度有点大。', 4, 0, 0, 0, '2020-08-20 00:08:50', '2020-08-20 00:08:50');
INSERT INTO `edu_course_comment` VALUES ('1296117016217800705', '1295991115257765890', '1295732573565218817', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '不知不觉都追好几个月了，这应该就是知识的魅力吧！通过这几个月的学习，了解到了网页设计大有学问，真正理解透，还是没那么容易，日常练习中遇到的问题就是对自己最好的帮助.', 4, 0, 0, 0, '2020-08-20 00:09:12', '2020-08-20 00:09:12');
INSERT INTO `edu_course_comment` VALUES ('1296117202008690690', '1295996835592167426', '1295723232816656386', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '课程的资源很丰富，内容讲解由浅入深，与案例结合紧密，注重实践动手能力的培养。在授课过程中，教师通过课程平台与学生有较好的互动和讨论。通过课程的学习，学生具备使用交互式JavaScript语言、jQuery框架等技术设计功能强大、丰富多彩、生动活泼的高质量网页的能力。赞！', 4, 0, 0, 0, '2020-08-20 00:09:56', '2020-08-20 00:09:56');
INSERT INTO `edu_course_comment` VALUES ('1296117269486653441', '1296002590860926978', '1295723232816656386', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '课程内容还挺好，里面包含的知识点很广阔。扩大了自己的见解和能力', 4, 0, 0, 0, '2020-08-20 00:10:12', '2020-08-20 11:20:38');
INSERT INTO `edu_course_comment` VALUES ('1296117386277048322', '1296068074708946946', '1295726581611884545', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '专门讲 MySQL 的课程，还是挺不错的，不过最后有点小遗憾，不是 Java 搭配 MySQL', 4, 0, 0, 0, '2020-08-20 00:10:40', '2020-08-20 00:10:40');
INSERT INTO `edu_course_comment` VALUES ('1296117492984336385', '1296070682475515905', '1295726581611884545', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '讲得非常好，很详细，很前卫', 4, 1, 1, 0, '2020-08-20 00:11:06', '2020-08-20 00:11:14');
INSERT INTO `edu_course_comment` VALUES ('1296117624857448450', '1296075223002533889', '1296074867258445825', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '我是一个非计算机专业的爱好者，通过第一章的学习，对计算机的组成有了更深的了解，但是我本人在理解能力上还是不太好，相信通过一学期的坚持，自己能学到好多有用的知识，让自己的计算机理论水平有所提高。', 4, 1, 1, 0, '2020-08-20 00:11:37', '2020-08-20 12:16:59');
INSERT INTO `edu_course_comment` VALUES ('1296117747159158785', '1296078367702929410', '1295730208116174850', '1296103100985135105', 'Bruce', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Bruce.jpg', '我只想说三个字，高、大、尚', 4, 2, 0, 0, '2020-08-20 00:12:06', '2020-08-20 00:17:52');
INSERT INTO `edu_course_comment` VALUES ('1296118092639784962', '1295958589541724162', '1295957488608227329', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '非常不错的课程！5星了~~~', 5, 1, 1, 0, '2020-08-20 00:13:29', '2020-08-20 12:07:40');
INSERT INTO `edu_course_comment` VALUES ('1296118147203485697', '1295962761318146050', '1295957488608227329', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '非常不错的课程！', 5, 0, 0, 0, '2020-08-20 00:13:42', '2020-08-20 11:15:41');
INSERT INTO `edu_course_comment` VALUES ('1296118277394681857', '1295971643939659777', '1295722488713572354', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '老师讲得挺不错的，测验覆盖的知识点也很全面，可以查漏补缺~~', 5, 1, 1, 0, '2020-08-20 00:14:13', '2020-08-20 00:14:18');
INSERT INTO `edu_course_comment` VALUES ('1296118403563540481', '1295974194441396225', '1295722488713572354', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '老师讲课很细致，值得学习...', 5, 0, 0, 0, '2020-08-20 00:14:43', '2020-08-20 00:14:43');
INSERT INTO `edu_course_comment` VALUES ('1296118462946496513', '1295979692880322562', '1295732573565218817', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '超赞！！！', 5, 0, 0, 0, '2020-08-20 00:14:57', '2020-08-20 00:14:57');
INSERT INTO `edu_course_comment` VALUES ('1296118589585117186', '1295991115257765890', '1295732573565218817', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '讲的很细致，感觉很有趣...', 5, 0, 0, 0, '2020-08-20 00:15:27', '2020-08-20 00:15:27');
INSERT INTO `edu_course_comment` VALUES ('1296118668798742530', '1295996835592167426', '1295723232816656386', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '超级好的一门课程，推荐学习！~~', 5, 0, 0, 0, '2020-08-20 00:15:46', '2020-08-20 00:15:46');
INSERT INTO `edu_course_comment` VALUES ('1296118750373761025', '1296002590860926978', '1295723232816656386', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '内容丰富，老师讲课生动有趣。', 5, 2, 0, 0, '2020-08-20 00:16:05', '2020-08-20 11:20:32');
INSERT INTO `edu_course_comment` VALUES ('1296118906540281857', '1296068074708946946', '1295726581611884545', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '内容丰富，非常适合大学生学习，我学到了很多，受益匪浅。', 5, 0, 0, 0, '2020-08-20 00:16:43', '2020-08-20 00:16:43');
INSERT INTO `edu_course_comment` VALUES ('1296118969282875394', '1296070682475515905', '1295726581611884545', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '简单易懂 对以后学习数据库有很大帮助', 5, 0, 0, 0, '2020-08-20 00:16:58', '2020-08-20 00:16:58');
INSERT INTO `edu_course_comment` VALUES ('1296119104716951553', '1296075223002533889', '1296074867258445825', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', '内容丰富，课程有趣。对计算机有了新的理解，好棒', 5, 0, 0, 0, '2020-08-20 00:17:30', '2020-08-20 00:17:30');
INSERT INTO `edu_course_comment` VALUES ('1296119158030749697', '1296078367702929410', '1295730208116174850', '1296103490354958338', 'Colin', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Colin.jpg', 'nice!', 5, 1, 1, 0, '2020-08-20 00:17:43', '2020-08-20 00:17:44');
INSERT INTO `edu_course_comment` VALUES ('1296119431226740738', '1295958589541724162', '1295957488608227329', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '我爱Java，Java天下第一！！！', 5, 1, 1, 0, '2020-08-20 00:18:48', '2020-08-20 12:07:39');
INSERT INTO `edu_course_comment` VALUES ('1296119581990998017', '1295962761318146050', '1295957488608227329', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '老师讲的好，受益匪浅', 5, 1, 1, 0, '2020-08-20 00:19:24', '2020-08-20 00:19:29');
INSERT INTO `edu_course_comment` VALUES ('1296119737113137153', '1295971643939659777', '1295722488713572354', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '讲的属实好，学的挺开心.', 5, 0, 0, 0, '2020-08-20 00:20:01', '2020-08-20 00:20:01');
INSERT INTO `edu_course_comment` VALUES ('1296119868948500482', '1295979692880322562', '1295732573565218817', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '感觉有点无聊了...可能是我不适合学前端，我要去学后端！！！', 4, 1, 1, 0, '2020-08-20 00:20:32', '2020-08-20 00:20:37');
INSERT INTO `edu_course_comment` VALUES ('1296119969477578754', '1295991115257765890', '1295732573565218817', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '我...觉得棒棒哒，讲解和题库结合，学习的效率比较高', 5, 0, 0, 0, '2020-08-20 00:20:56', '2020-08-20 00:20:56');
INSERT INTO `edu_course_comment` VALUES ('1296120034573176833', '1295996835592167426', '1295723232816656386', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '老师讲的很棒，基础的内容，我可以听懂，真开心(*^_^*)', 5, 0, 0, 0, '2020-08-20 00:21:12', '2020-08-20 00:21:12');
INSERT INTO `edu_course_comment` VALUES ('1296120084569280514', '1296002590860926978', '1295723232816656386', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '很棒的课程，对我帮助很大', 5, 0, 0, 0, '2020-08-20 00:21:24', '2020-08-20 00:21:24');
INSERT INTO `edu_course_comment` VALUES ('1296120225766330369', '1296068074708946946', '1295726581611884545', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '基础的东西很容易就能学的会挺不错的，讲解简单、易懂，666', 5, 0, 0, 0, '2020-08-20 00:21:57', '2020-08-20 00:21:57');
INSERT INTO `edu_course_comment` VALUES ('1296120322872856577', '1296070682475515905', '1295726581611884545', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '这个课程很详细，适合新手入门...', 5, 0, 0, 0, '2020-08-20 00:22:20', '2020-08-20 00:22:20');
INSERT INTO `edu_course_comment` VALUES ('1296120403269275649', '1296075223002533889', '1296074867258445825', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '很好很棒就是有时候比较难理解.', 5, 0, 0, 0, '2020-08-20 00:22:40', '2020-08-20 00:22:40');
INSERT INTO `edu_course_comment` VALUES ('1296120528087568386', '1296078367702929410', '1295730208116174850', '1296103723897999361', 'Dick', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Dick.jpg', '内容充实明确、对于初学者还是比较容易理解的', 5, 0, 0, 0, '2020-08-20 00:23:09', '2020-08-20 00:23:09');
INSERT INTO `edu_course_comment` VALUES ('1296284354212913154', '1295958589541724162', '1295957488608227329', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '老师讲的相当不错！！！！为老师疯狂点赞！！！！', 5, 1, 1, 0, '2020-08-20 11:14:09', '2020-08-20 12:07:38');
INSERT INTO `edu_course_comment` VALUES ('1296284715464122370', '1295962761318146050', '1295957488608227329', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '感谢老师能讲得如此细致入微，超级生动形象。异常判断图的画出与实际的代码一一对应，很是佩服。小细节例如：问题0；extends、throws为什么加s呀，throw问什么没s呀成功get到了笑点。最后一节课没道别就没了，桑心。一心学好编程也超级喜欢老师坚持看完了所有的视频，也用心地去实现了一遍代码，基础杠杠的。再次感谢❤️', 5, 1, 1, 0, '2020-08-20 11:15:35', '2020-08-20 11:15:38');
INSERT INTO `edu_course_comment` VALUES ('1296284954237460481', '1295971643939659777', '1295722488713572354', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '课程内容较为适合，进度刚刚好', 4, 1, 1, 0, '2020-08-20 11:16:32', '2020-08-20 11:16:33');
INSERT INTO `edu_course_comment` VALUES ('1296285231594201089', '1295974194441396225', '1295722488713572354', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '老师讲的通俗易懂，学习来很容易。数据挖掘技术对我很多触动', 5, 1, 1, 0, '2020-08-20 11:17:38', '2020-08-20 11:17:41');
INSERT INTO `edu_course_comment` VALUES ('1296285522091696129', '1295979692880322562', '1295732573565218817', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '解的课程比较详细，内容十分丰富，对于初学者来说可以看懂，而且还能由浅到深的学到很多知识', 5, 0, 0, 0, '2020-08-20 11:18:47', '2020-08-20 11:18:47');
INSERT INTO `edu_course_comment` VALUES ('1296285603628965889', '1295991115257765890', '1295732573565218817', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '非常喜欢这们课程。给我的提升很大。一会可能会从事这们工作。', 5, 0, 0, 0, '2020-08-20 11:19:06', '2020-08-20 11:19:06');
INSERT INTO `edu_course_comment` VALUES ('1296285767672389633', '1295996835592167426', '1295723232816656386', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '跟着老师做每一个的案例，感觉对知识的掌握好多了，但是有时候就是看完自己在做案例的时候，可能还是需要看看老师做的，可能是我做的太少的原因', 5, 0, 0, 0, '2020-08-20 11:19:45', '2020-08-20 11:19:45');
INSERT INTO `edu_course_comment` VALUES ('1296285914061987842', '1296002590860926978', '1295723232816656386', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '内容简洁易懂，老师讲课也很清晰。', 4, 0, 0, 0, '2020-08-20 11:20:20', '2020-08-20 11:20:34');
INSERT INTO `edu_course_comment` VALUES ('1296286219860303873', '1296068074708946946', '1295726581611884545', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', 'MySQL是目前最流行的关系数据库之一，goole、腾讯等大型网站都在使用，通过学习，相信会给大家带来收获。', 5, 0, 0, 0, '2020-08-20 11:21:33', '2020-08-20 11:21:33');
INSERT INTO `edu_course_comment` VALUES ('1296286468574142465', '1296070682475515905', '1295726581611884545', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '老师讲的很清楚，还可以反复观看', 4, 0, 0, 0, '2020-08-20 11:22:33', '2020-08-20 11:22:33');
INSERT INTO `edu_course_comment` VALUES ('1296286586580885505', '1296075223002533889', '1296074867258445825', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '从今天的课程，我学到了很多东西，老师也从各个方面扩展，让我学到了很多课外的东西', 5, 0, 0, 0, '2020-08-20 11:23:01', '2020-08-20 11:23:01');
INSERT INTO `edu_course_comment` VALUES ('1296286707305537538', '1296078367702929410', '1295730208116174850', '1296104041192902658', 'Edward', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Edward.jpg', '将较难理解的大数据技术，讲的比较通俗，让人很容易理解', 5, 1, 1, 0, '2020-08-20 11:23:30', '2020-08-20 11:23:31');
INSERT INTO `edu_course_comment` VALUES ('1296287506840543233', '1295958589541724162', '1295957488608227329', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '学习中收获很大', 5, 1, 1, 0, '2020-08-20 11:26:40', '2020-08-20 12:07:36');
INSERT INTO `edu_course_comment` VALUES ('1296287674507845634', '1295962761318146050', '1295957488608227329', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '希望能在老师的指导下，完成JAVA游刃有余的使用', 5, 0, 0, 0, '2020-08-20 11:27:20', '2020-08-20 11:27:20');
INSERT INTO `edu_course_comment` VALUES ('1296287762760196097', '1295971643939659777', '1295722488713572354', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '挺好的，就是感觉老师讲的精炼，自己要看的、要查的内容挺多，哈哈哈', 5, 0, 0, 0, '2020-08-20 11:27:41', '2020-08-20 11:47:26');
INSERT INTO `edu_course_comment` VALUES ('1296287945870925825', '1295974194441396225', '1295722488713572354', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '老师讲解的简单易懂，很棒，希望可以保持这样的水准继续更新！感谢老师！', 5, 0, 0, 0, '2020-08-20 11:28:25', '2020-08-20 11:28:25');
INSERT INTO `edu_course_comment` VALUES ('1296288220610420738', '1295979692880322562', '1295732573565218817', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '学了这门课程，让我打开了新世界大门，超赞', 5, 0, 0, 0, '2020-08-20 11:29:30', '2020-08-20 11:29:30');
INSERT INTO `edu_course_comment` VALUES ('1296288336540983298', '1295991115257765890', '1295732573565218817', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', 'Very Very Very Good 好就完事了昂~', 5, 0, 0, 0, '2020-08-20 11:29:58', '2020-08-20 11:29:58');
INSERT INTO `edu_course_comment` VALUES ('1296288685175726082', '1295996835592167426', '1295723232816656386', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '感觉老师讲的有点快了，我学习起来有点慢了...中评4星', 4, 0, 0, 0, '2020-08-20 11:31:21', '2020-08-20 11:31:21');
INSERT INTO `edu_course_comment` VALUES ('1296288879724322817', '1296002590860926978', '1295723232816656386', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '老师讲的有点让人捉摸不透...可能是我基础不过关，我下次还会再来学习的~', 3, 0, 0, 0, '2020-08-20 11:32:07', '2020-08-20 11:32:07');
INSERT INTO `edu_course_comment` VALUES ('1296289018371235841', '1296068074708946946', '1295726581611884545', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '这们课程真的棒，让我一知半解的东西全部都懂了', 4, 0, 0, 0, '2020-08-20 11:32:41', '2020-08-20 11:32:41');
INSERT INTO `edu_course_comment` VALUES ('1296289164496592898', '1296070682475515905', '1295726581611884545', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '要说redis哪家强，还是看我倩老师.', 5, 0, 0, 0, '2020-08-20 11:33:15', '2020-08-20 11:33:15');
INSERT INTO `edu_course_comment` VALUES ('1296289571188891649', '1296075223002533889', '1296074867258445825', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '讲得好，讲得妙...属实让我受益匪浅，要是能给老师打赏，那我第一个来...', 5, 0, 0, 0, '2020-08-20 11:34:52', '2020-08-20 11:34:52');
INSERT INTO `edu_course_comment` VALUES ('1296289904019496961', '1296078367702929410', '1295730208116174850', '1296104297263550466', 'George', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/George.jpg', '让我曾经那些似懂非懂的问题都变得清晰了起来，好像自己真的掌握了...还需加油', 5, 1, 1, 0, '2020-08-20 11:36:12', '2020-08-20 11:36:15');
INSERT INTO `edu_course_comment` VALUES ('1296292495679938562', '1295958589541724162', '1295957488608227329', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '真的是棒，新手入门首选.', 5, 0, 0, 0, '2020-08-20 11:46:30', '2020-08-20 11:55:05');
INSERT INTO `edu_course_comment` VALUES ('1296292679226875906', '1295962761318146050', '1295957488608227329', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '老师讲的真的很棒...受益匪浅...收获颇多', 5, 0, 0, 0, '2020-08-20 11:47:13', '2020-08-20 11:47:13');
INSERT INTO `edu_course_comment` VALUES ('1296292887797030914', '1295971643939659777', '1295722488713572354', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '真的是一门好课程...开启了我计算机世界的大门..', 5, 0, 0, 0, '2020-08-20 11:48:03', '2020-08-20 11:48:03');
INSERT INTO `edu_course_comment` VALUES ('1296292942658527233', '1295974194441396225', '1295722488713572354', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '哇..好评', 5, 0, 0, 0, '2020-08-20 11:48:16', '2020-08-20 11:48:16');
INSERT INTO `edu_course_comment` VALUES ('1296293150964441089', '1295979692880322562', '1295732573565218817', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '好喜欢老师讲的这门课程啊，真的是好...细致入微', 5, 0, 0, 0, '2020-08-20 11:49:06', '2020-08-20 11:49:06');
INSERT INTO `edu_course_comment` VALUES ('1296293401569910786', '1295991115257765890', '1295732573565218817', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '老师的CSS让人眼睛一亮....真的是一门very good的课程，推荐...', 5, 0, 0, 0, '2020-08-20 11:50:06', '2020-08-20 11:50:06');
INSERT INTO `edu_course_comment` VALUES ('1296293504166780930', '1295996835592167426', '1295723232816656386', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '有点难...还需努力', 4, 0, 0, 0, '2020-08-20 11:50:30', '2020-08-20 11:50:30');
INSERT INTO `edu_course_comment` VALUES ('1296293660555599874', '1296002590860926978', '1295723232816656386', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '老师讲课的声音太小了，让我听的很难受..', 4, 0, 0, 0, '2020-08-20 11:51:07', '2020-08-20 11:51:07');
INSERT INTO `edu_course_comment` VALUES ('1296293839677546498', '1296068074708946946', '1295726581611884545', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '这门课程特点很多、让人爱上了学习QAQ(⊙o⊙)…', 5, 0, 0, 0, '2020-08-20 11:51:50', '2020-08-20 11:51:50');
INSERT INTO `edu_course_comment` VALUES ('1296294092837347330', '1296070682475515905', '1295726581611884545', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '真棒...学完后、很容易上手', 4, 0, 0, 0, '2020-08-20 11:52:50', '2020-08-20 11:52:50');
INSERT INTO `edu_course_comment` VALUES ('1296294243597410306', '1296075223002533889', '1296074867258445825', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '好课程啊、早点发现就好了，这样我的基础也不会不扎实了、再学一遍', 5, 0, 0, 0, '2020-08-20 11:53:26', '2020-08-20 11:53:26');
INSERT INTO `edu_course_comment` VALUES ('1296294421452677121', '1296078367702929410', '1295730208116174850', '1296104574465101825', 'Jessica', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Jessica.jpg', '云计算、大数据、人工智能未来的主流，我要好好学习，能成为一个king', 5, 0, 0, 0, '2020-08-20 11:54:09', '2020-08-20 11:54:09');
INSERT INTO `edu_course_comment` VALUES ('1296294839993884673', '1295958589541724162', '1295957488608227329', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '讲的不错、让人不禁陷入其中，无法自拔，可能这就是编程的快乐把', 5, 0, 0, 0, '2020-08-20 11:55:49', '2020-08-20 12:07:50');
INSERT INTO `edu_course_comment` VALUES ('1296295180147744770', '1295962761318146050', '1295957488608227329', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '我觉得这门课程非常好，对我的帮助超大，这让我为以后走的路，打造了完美的地基', 5, 11, 0, 0, '2020-08-20 11:57:10', '2020-08-20 11:57:10');
INSERT INTO `edu_course_comment` VALUES ('1296295336897273858', '1295971643939659777', '1295722488713572354', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '这门课程我刷了3遍了，基础不牢，地动山摇，受益匪浅', 5, 0, 0, 0, '2020-08-20 11:57:47', '2020-08-20 11:57:47');
INSERT INTO `edu_course_comment` VALUES ('1296295490010341378', '1295974194441396225', '1295722488713572354', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '老师的数据挖掘，堪称一流，买买买', 5, 0, 0, 0, '2020-08-20 11:58:23', '2020-08-20 11:58:23');
INSERT INTO `edu_course_comment` VALUES ('1296295640141258753', '1295979692880322562', '1295732573565218817', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '网页无处不在，我会好好学习网页的骨架HTML的\n', 5, 0, 0, 0, '2020-08-20 11:58:59', '2020-08-20 11:58:59');
INSERT INTO `edu_course_comment` VALUES ('1296295841866309633', '1295991115257765890', '1295732573565218817', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '老师的课程别具一格，就是声音太小了，我听得很费劲', 3, 0, 1, 0, '2020-08-20 11:59:47', '2020-08-20 11:59:50');
INSERT INTO `edu_course_comment` VALUES ('1296296200261197826', '1295996835592167426', '1295723232816656386', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '这个课程有点枯燥了，我更喜欢网页css和html，但是我知道这个才是网页的灵魂，，，我会沉浸下来，认真的学习..老师讲的真的好', 5, 1, 1, 0, '2020-08-20 12:01:13', '2020-08-20 12:01:16');
INSERT INTO `edu_course_comment` VALUES ('1296296619221835778', '1296002590860926978', '1295723232816656386', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '这个作为js的框架，出来的那一刻，就是前端新的盛世', 5, 1, 1, 0, '2020-08-20 12:02:53', '2020-08-20 12:02:55');
INSERT INTO `edu_course_comment` VALUES ('1296296881114177538', '1296068074708946946', '1295726581611884545', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '老师声音好听，可以让人静下心来学习在这门课程，这门我给5星', 5, 1, 1, 0, '2020-08-20 12:03:55', '2020-08-20 12:03:57');
INSERT INTO `edu_course_comment` VALUES ('1296297018079174657', '1296070682475515905', '1295726581611884545', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '学完了MySQL来的，还是5星好评', 5, 1, 1, 0, '2020-08-20 12:04:28', '2020-08-20 12:04:30');
INSERT INTO `edu_course_comment` VALUES ('1296297255111876610', '1296075223002533889', '1296074867258445825', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '这门课程，真的是让人对计算机世界充满的向往，超级棒(๑•̀ㅂ•́)و✧', 5, 1, 1, 0, '2020-08-20 12:05:24', '2020-08-20 12:05:26');
INSERT INTO `edu_course_comment` VALUES ('1296297436473581570', '1296078367702929410', '1295730208116174850', '1296104733647327233', 'Sarah', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/Sarah.jpg', '未来的主流，都能感觉到王者的气息，好，很好，非常好', 5, 0, 0, 0, '2020-08-20 12:06:08', '2020-08-20 12:06:08');
INSERT INTO `edu_course_comment` VALUES ('1296297782990200833', '1295958589541724162', '1295957488608227329', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '老师的课程，让我都大吃一惊，让我这个不爱学习的孩子，也爱上了学习...', 5, 1, 1, 0, '2020-08-20 12:07:30', '2020-08-20 12:07:45');
INSERT INTO `edu_course_comment` VALUES ('1296298021696430082', '1295958589541724162', '1295957488608227329', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '发现宝藏了，推荐学习.', 5, 0, 0, 0, '2020-08-20 12:08:27', '2020-08-20 12:08:27');
INSERT INTO `edu_course_comment` VALUES ('1296298374659694594', '1295962761318146050', '1295957488608227329', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '我爱Java，Java爱我，哈哈哈', 5, 0, 0, 0, '2020-08-20 12:09:51', '2020-08-20 12:09:51');
INSERT INTO `edu_course_comment` VALUES ('1296298425863757825', '1295962761318146050', '1295957488608227329', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '赞！', 5, 0, 0, 0, '2020-08-20 12:10:03', '2020-08-20 12:10:03');
INSERT INTO `edu_course_comment` VALUES ('1296298569636110338', '1295971643939659777', '1295722488713572354', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '讲的真的很好，让人不得不点赞', 5, 0, 0, 0, '2020-08-20 12:10:38', '2020-08-20 12:10:38');
INSERT INTO `edu_course_comment` VALUES ('1296298658458886146', '1295971643939659777', '1295722488713572354', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '我是小猪佩奇，我来自外太空', 5, 0, 0, 0, '2020-08-20 12:10:59', '2020-08-20 12:10:59');
INSERT INTO `edu_course_comment` VALUES ('1296298783751135234', '1295974194441396225', '1295722488713572354', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', 'Good Good Good 重要的事情要说三遍哦', 5, 16, 0, 0, '2020-08-20 12:11:29', '2020-08-20 12:11:29');
INSERT INTO `edu_course_comment` VALUES ('1296298998570803202', '1295974194441396225', '1295722488713572354', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '老师声音超好听，让复杂的课程变得不那么硬核', 5, 0, 0, 0, '2020-08-20 12:12:20', '2020-08-20 12:12:20');
INSERT INTO `edu_course_comment` VALUES ('1296299136508878849', '1295979692880322562', '1295732573565218817', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '课程例题丰富，讲解清晰，内容安排合理', 5, 0, 0, 0, '2020-08-20 12:12:53', '2020-08-20 12:12:53');
INSERT INTO `edu_course_comment` VALUES ('1296299168855351297', '1295979692880322562', '1295732573565218817', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '不错，很好，学到了东西', 5, 0, 0, 0, '2020-08-20 12:13:01', '2020-08-20 12:13:01');
INSERT INTO `edu_course_comment` VALUES ('1296299255761330177', '1295991115257765890', '1295732573565218817', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '讲得很好，受益匪浅', 5, 0, 0, 0, '2020-08-20 12:13:21', '2020-08-20 12:13:21');
INSERT INTO `edu_course_comment` VALUES ('1296299287562543105', '1295991115257765890', '1295732573565218817', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '讲的不错，值得学习', 5, 0, 0, 0, '2020-08-20 12:13:29', '2020-08-20 12:13:29');
INSERT INTO `edu_course_comment` VALUES ('1296299426855378945', '1295996835592167426', '1295723232816656386', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '通过这门课的学习，收获到了很多以前不知道的知识，以后会更加努力的学习这门课。', 0, 0, 0, 0, '2020-08-20 12:14:02', '2020-08-20 12:14:02');
INSERT INTO `edu_course_comment` VALUES ('1296299455682830338', '1295996835592167426', '1295723232816656386', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '很好的一个课程，内容清晰易懂，经过学习收获颇多。', 5, 0, 0, 0, '2020-08-20 12:14:09', '2020-08-20 12:14:09');
INSERT INTO `edu_course_comment` VALUES ('1296299491682541569', '1296002590860926978', '1295723232816656386', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '很好的一个课程，内容清晰易懂，经过学习收获颇多。', 4, 0, 0, 0, '2020-08-20 12:14:18', '2020-08-20 12:14:18');
INSERT INTO `edu_course_comment` VALUES ('1296299601103544321', '1296002590860926978', '1295723232816656386', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '非常有价值，非常好用！', 5, 0, 0, 0, '2020-08-20 12:14:44', '2020-08-20 12:14:44');
INSERT INTO `edu_course_comment` VALUES ('1296299756766748674', '1296068074708946946', '1295726581611884545', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '老师对知识点非常熟悉，理论功底很深，讲授清晰明了，但希望能够在讲授一些数据库基本概念及理论的时候，能够更加通俗一点，多举例。', 4, 0, 0, 0, '2020-08-20 12:15:21', '2020-08-20 12:15:21');
INSERT INTO `edu_course_comment` VALUES ('1296299812534214657', '1296068074708946946', '1295726581611884545', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '挺好的，就是概念太多分不清', 4, 0, 0, 0, '2020-08-20 12:15:34', '2020-08-20 12:15:34');
INSERT INTO `edu_course_comment` VALUES ('1296299956948295682', '1296070682475515905', '1295726581611884545', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '我觉得挺好的，自己认真听就行', 5, 0, 0, 0, '2020-08-20 12:16:08', '2020-08-20 12:16:08');
INSERT INTO `edu_course_comment` VALUES ('1296299988325883905', '1296070682475515905', '1295726581611884545', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '很充实，收获也很多', 4, 0, 0, 0, '2020-08-20 12:16:16', '2020-08-20 12:16:16');
INSERT INTO `edu_course_comment` VALUES ('1296300037747367938', '1296075223002533889', '1296074867258445825', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '老师讲的很清楚，还可以反复观看', 5, 1, 1, 0, '2020-08-20 12:16:28', '2020-08-20 12:16:54');
INSERT INTO `edu_course_comment` VALUES ('1296300243377315842', '1296075223002533889', '1296074867258445825', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '非常好，学到了好多知识', 5, 0, 0, 0, '2020-08-20 12:17:17', '2020-08-20 12:17:17');
INSERT INTO `edu_course_comment` VALUES ('1296300430065786881', '1296078367702929410', '1295730208116174850', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '可视化部分讲的有点复杂', 4, 0, 0, 0, '2020-08-20 12:18:01', '2020-08-20 12:18:01');
INSERT INTO `edu_course_comment` VALUES ('1296300475632705538', '1296078367702929410', '1295730208116174850', '1296104907216015361', 'peiqi', 'https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/peiqi.jpg', '老师讲的还不错，少给一颗星是因为画面处理不好，有卡顿，降低了观看视频的体验感', 4, 1, 1, 0, '2020-08-20 12:18:12', '2020-08-20 12:18:17');

-- ----------------------------
-- Table structure for edu_statistics
-- ----------------------------
DROP TABLE IF EXISTS `edu_statistics`;
CREATE TABLE `edu_statistics`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `date_calculated` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计日期',
  `register_num` int(11) NOT NULL DEFAULT 0 COMMENT '注册人数',
  `login_num` int(11) NOT NULL DEFAULT 0 COMMENT '登录人数',
  `video_view_num` int(11) NOT NULL DEFAULT 0 COMMENT '每日播放视频数',
  `course_num` int(11) NOT NULL DEFAULT 0 COMMENT '每日新增课程数',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date_calculated`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_statistics
-- ----------------------------
INSERT INTO `edu_statistics` VALUES ('1290644502452744194', '2020-08-02', 5, 150, 194, 137, '2020-08-04 21:43:23', '2020-08-04 21:43:23');
INSERT INTO `edu_statistics` VALUES ('1290653893725835265', '2020-08-03', 6, 157, 173, 128, '2020-08-04 22:20:42', '2020-08-04 22:20:42');
INSERT INTO `edu_statistics` VALUES ('1290653945340940290', '2020-08-04', 7, 154, 156, 111, '2020-08-04 22:20:54', '2020-08-04 22:20:54');
INSERT INTO `edu_statistics` VALUES ('1295966590084358145', '2020-08-19', 0, 129, 149, 166, '2020-08-19 14:11:28', '2020-08-19 14:11:28');
INSERT INTO `edu_statistics` VALUES ('1296106158028771329', '2020-08-16', 0, 139, 197, 197, '2020-08-19 23:26:03', '2020-08-19 23:26:03');
INSERT INTO `edu_statistics` VALUES ('1296106167549841409', '2020-08-15', 0, 165, 191, 116, '2020-08-19 23:26:05', '2020-08-19 23:26:05');
INSERT INTO `edu_statistics` VALUES ('1296106176060084225', '2020-08-14', 0, 192, 155, 196, '2020-08-19 23:26:08', '2020-08-19 23:26:08');
INSERT INTO `edu_statistics` VALUES ('1300071600615329794', '2020-08-01', 1, 185, 132, 120, '2020-08-30 22:03:18', '2020-08-30 22:03:18');
INSERT INTO `edu_statistics` VALUES ('1300071616432050177', '2020-08-21', 0, 198, 173, 129, '2020-08-30 22:03:22', '2020-08-30 22:03:22');
INSERT INTO `edu_statistics` VALUES ('1300071625693073409', '2020-08-29', 0, 124, 174, 176, '2020-08-30 22:03:24', '2020-08-30 22:03:24');
INSERT INTO `edu_statistics` VALUES ('1300071634807296001', '2020-08-30', 0, 118, 113, 121, '2020-08-30 22:03:27', '2020-08-30 22:03:27');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程类别ID',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程科目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1295951792927944706', 'HTML/CSS', '0', 0, 0, '2020-08-19 13:12:40', '2020-08-19 13:12:40');
INSERT INTO `edu_subject` VALUES ('1295951793313820673', 'HTML5', '1295951792927944706', 0, 0, '2020-08-19 13:12:40', '2020-08-19 13:12:40');
INSERT INTO `edu_subject` VALUES ('1295951793825525761', 'CSS3', '1295951792927944706', 0, 0, '2020-08-19 13:12:40', '2020-08-19 13:12:40');
INSERT INTO `edu_subject` VALUES ('1295951794320453633', 'Bootstrap4', '1295951792927944706', 0, 0, '2020-08-19 13:12:40', '2020-08-19 13:12:40');
INSERT INTO `edu_subject` VALUES ('1295951794819575810', 'Font Awesome', '1295951792927944706', 0, 0, '2020-08-19 13:12:40', '2020-08-19 13:12:40');
INSERT INTO `edu_subject` VALUES ('1295951795318697985', 'Foundation', '1295951792927944706', 0, 0, '2020-08-19 13:12:40', '2020-08-19 13:12:40');
INSERT INTO `edu_subject` VALUES ('1295951795687796737', 'JavaScript', '0', 0, 0, '2020-08-19 13:12:40', '2020-08-19 13:12:40');
INSERT INTO `edu_subject` VALUES ('1295951796044312577', 'JavaScript', '1295951795687796737', 0, 0, '2020-08-19 13:12:40', '2020-08-19 13:12:40');
INSERT INTO `edu_subject` VALUES ('1295951796539240449', 'HTML DOM', '1295951795687796737', 0, 0, '2020-08-19 13:12:41', '2020-08-19 13:12:41');
INSERT INTO `edu_subject` VALUES ('1295951797021585409', 'JQuery', '1295951795687796737', 0, 0, '2020-08-19 13:12:41', '2020-08-19 13:12:41');
INSERT INTO `edu_subject` VALUES ('1295951797529096193', 'AngularJS', '1295951795687796737', 0, 0, '2020-08-19 13:12:41', '2020-08-19 13:12:41');
INSERT INTO `edu_subject` VALUES ('1295951798028218369', 'Vue.js', '1295951795687796737', 0, 0, '2020-08-19 13:12:41', '2020-08-19 13:12:41');
INSERT INTO `edu_subject` VALUES ('1295951798506369025', 'React', '1295951795687796737', 0, 0, '2020-08-19 13:12:41', '2020-08-19 13:12:41');
INSERT INTO `edu_subject` VALUES ('1295951798984519682', 'TypeScript', '1295951795687796737', 0, 0, '2020-08-19 13:12:41', '2020-08-19 13:12:41');
INSERT INTO `edu_subject` VALUES ('1295951799466864641', 'Node.js', '1295951795687796737', 0, 0, '2020-08-19 13:12:41', '2020-08-19 13:12:41');
INSERT INTO `edu_subject` VALUES ('1295951799945015297', 'AJAX', '1295951795687796737', 0, 0, '2020-08-19 13:12:41', '2020-08-19 13:12:41');
INSERT INTO `edu_subject` VALUES ('1295951800435748865', 'JSON', '1295951795687796737', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951800926482434', 'Echarts', '1295951795687796737', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951801295581186', '服务端', '0', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951801660485633', 'Python', '1295951801295581186', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951802142830593', 'Linux', '1295951801295581186', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951802654535682', 'Docker', '1295951801295581186', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951803136880641', 'Java', '1295951801295581186', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951803619225601', 'C', '1295951801295581186', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951804101570561', 'C++', '1295951801295581186', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951804579721217', 'Lua', '1295951801295581186', 0, 0, '2020-08-19 13:12:42', '2020-08-19 13:12:42');
INSERT INTO `edu_subject` VALUES ('1295951805062066178', 'Go', '1295951801295581186', 0, 0, '2020-08-19 13:12:43', '2020-08-19 13:12:43');
INSERT INTO `edu_subject` VALUES ('1295951805536022529', 'PHP', '1295951801295581186', 0, 0, '2020-08-19 13:12:43', '2020-08-19 13:12:43');
INSERT INTO `edu_subject` VALUES ('1295951805900926977', '数据库', '0', 0, 0, '2020-08-19 13:12:43', '2020-08-19 13:12:43');
INSERT INTO `edu_subject` VALUES ('1295951806270025730', 'SQL', '1295951805900926977', 0, 0, '2020-08-19 13:12:43', '2020-08-19 13:12:43');
INSERT INTO `edu_subject` VALUES ('1295951806743982082', 'MySql', '1295951805900926977', 0, 0, '2020-08-19 13:12:43', '2020-08-19 13:12:43');
INSERT INTO `edu_subject` VALUES ('1295951807217938433', 'PostgreSQL', '1295951805900926977', 0, 0, '2020-08-19 13:12:43', '2020-08-19 13:12:43');
INSERT INTO `edu_subject` VALUES ('1295951807708672001', 'SQLite', '1295951805900926977', 0, 0, '2020-08-19 13:12:43', '2020-08-19 13:12:43');
INSERT INTO `edu_subject` VALUES ('1295951808191016961', 'MongoDB', '1295951805900926977', 0, 0, '2020-08-19 13:12:43', '2020-08-19 13:12:43');
INSERT INTO `edu_subject` VALUES ('1295951808669167618', 'Redis', '1295951805900926977', 0, 0, '2020-08-19 13:12:43', '2020-08-19 13:12:43');
INSERT INTO `edu_subject` VALUES ('1295951809147318273', 'Memcached', '1295951805900926977', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951809508028417', '移动端', '0', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951809868738562', 'Android', '1295951809508028417', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951810342694914', 'Swift', '1295951809508028417', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951810820845569', 'jQuery Mobile', '1295951809508028417', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951811311579137', 'ionic', '1295951809508028417', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951811785535489', 'Kotlin', '1295951809508028417', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951812154634242', '计算机基础与应用', '0', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951812515344386', '计算机应用基础', '1295951812154634242', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951812993495042', '数字图像处理', '1295951812154634242', 0, 0, '2020-08-19 13:12:44', '2020-08-19 13:12:44');
INSERT INTO `edu_subject` VALUES ('1295951813467451394', '计算机组成原理', '1295951812154634242', 0, 0, '2020-08-19 13:12:45', '2020-08-19 13:12:45');
INSERT INTO `edu_subject` VALUES ('1295951813949796353', '数据结构和算法', '1295951812154634242', 0, 0, '2020-08-19 13:12:45', '2020-08-19 13:12:45');
INSERT INTO `edu_subject` VALUES ('1295951814457307137', '操作系统原理', '1295951812154634242', 0, 0, '2020-08-19 13:12:45', '2020-08-19 13:12:45');
INSERT INTO `edu_subject` VALUES ('1295951814922874881', '计算机网络', '1295951812154634242', 0, 0, '2020-08-19 13:12:45', '2020-08-19 13:12:45');
INSERT INTO `edu_subject` VALUES ('1295951815275196417', '大数据', '0', 0, 0, '2020-08-19 13:12:45', '2020-08-19 13:12:45');
INSERT INTO `edu_subject` VALUES ('1295951815623323650', 'Hadoop', '1295951815275196417', 0, 0, '2020-08-19 13:12:45', '2020-08-19 13:12:45');
INSERT INTO `edu_subject` VALUES ('1295951816105668609', 'Zookeeper', '1295951815275196417', 0, 0, '2020-08-19 13:12:45', '2020-08-19 13:12:45');
INSERT INTO `edu_subject` VALUES ('1295951816571236354', 'Hive', '1295951815275196417', 0, 0, '2020-08-19 13:12:45', '2020-08-19 13:12:45');
INSERT INTO `edu_subject` VALUES ('1295951817053581314', 'Flume', '1295951815275196417', 0, 0, '2020-08-19 13:12:45', '2020-08-19 13:12:45');
INSERT INTO `edu_subject` VALUES ('1295951817548509186', 'Kafka', '1295951815275196417', 0, 0, '2020-08-19 13:12:46', '2020-08-19 13:12:46');
INSERT INTO `edu_subject` VALUES ('1295951818030854146', 'Spark', '1295951815275196417', 0, 0, '2020-08-19 13:12:46', '2020-08-19 13:12:46');
INSERT INTO `edu_subject` VALUES ('1295951818517393409', 'HBase', '1295951815275196417', 0, 0, '2020-08-19 13:12:46', '2020-08-19 13:12:46');
INSERT INTO `edu_subject` VALUES ('1295951819008126977', 'Scala', '1295951815275196417', 0, 0, '2020-08-19 13:12:46', '2020-08-19 13:12:46');
INSERT INTO `edu_subject` VALUES ('1295951819368837122', 'XML', '0', 0, 0, '2020-08-19 13:12:46', '2020-08-19 13:12:46');
INSERT INTO `edu_subject` VALUES ('1295951819729547265', 'XML', '1295951819368837122', 0, 0, '2020-08-19 13:12:46', '2020-08-19 13:12:46');
INSERT INTO `edu_subject` VALUES ('1295951820203503617', 'DTD', '1295951819368837122', 0, 0, '2020-08-19 13:12:46', '2020-08-19 13:12:46');
INSERT INTO `edu_subject` VALUES ('1295951820706820098', 'XML DOM', '1295951819368837122', 0, 0, '2020-08-19 13:12:46', '2020-08-19 13:12:46');
INSERT INTO `edu_subject` VALUES ('1295951821184970753', 'XSTL', '1295951819368837122', 0, 0, '2020-08-19 13:12:46', '2020-08-19 13:12:46');
INSERT INTO `edu_subject` VALUES ('1295951821671510018', 'XPath', '1295951819368837122', 0, 0, '2020-08-19 13:12:47', '2020-08-19 13:12:47');
INSERT INTO `edu_subject` VALUES ('1295951822187409409', 'XQuery', '1295951819368837122', 0, 0, '2020-08-19 13:12:47', '2020-08-19 13:12:47');
INSERT INTO `edu_subject` VALUES ('1295951822661365761', 'XLink', '1295951819368837122', 0, 0, '2020-08-19 13:12:47', '2020-08-19 13:12:47');
INSERT INTO `edu_subject` VALUES ('1295951823147905025', 'XPointer', '1295951819368837122', 0, 0, '2020-08-19 13:12:47', '2020-08-19 13:12:47');
INSERT INTO `edu_subject` VALUES ('1295951823634444289', 'XML Schena', '1295951819368837122', 0, 0, '2020-08-19 13:12:47', '2020-08-19 13:12:47');
INSERT INTO `edu_subject` VALUES ('1295951824100012033', 'XSL-FO', '1295951819368837122', 0, 0, '2020-08-19 13:12:47', '2020-08-19 13:12:47');
INSERT INTO `edu_subject` VALUES ('1295951824569774082', 'SVG', '1295951819368837122', 0, 0, '2020-08-19 13:12:47', '2020-08-19 13:12:47');
INSERT INTO `edu_subject` VALUES ('1295951824964038658', 'ASP.NET', '0', 0, 0, '2020-08-19 13:12:47', '2020-08-19 13:12:47');
INSERT INTO `edu_subject` VALUES ('1295951825328943105', 'ASP.NET', '1295951824964038658', 0, 0, '2020-08-19 13:12:47', '2020-08-19 13:12:47');
INSERT INTO `edu_subject` VALUES ('1295951825819676673', 'C#', '1295951824964038658', 0, 0, '2020-08-19 13:12:48', '2020-08-19 13:12:48');
INSERT INTO `edu_subject` VALUES ('1295951826302021634', 'Web Pages', '1295951824964038658', 0, 0, '2020-08-19 13:12:48', '2020-08-19 13:12:48');
INSERT INTO `edu_subject` VALUES ('1295951826775977985', 'Razor', '1295951824964038658', 0, 0, '2020-08-19 13:12:48', '2020-08-19 13:12:48');
INSERT INTO `edu_subject` VALUES ('1295951827249934338', 'MVC', '1295951824964038658', 0, 0, '2020-08-19 13:12:48', '2020-08-19 13:12:48');
INSERT INTO `edu_subject` VALUES ('1295951827736473601', 'Web Forms', '1295951824964038658', 0, 0, '2020-08-19 13:12:48', '2020-08-19 13:12:48');
INSERT INTO `edu_subject` VALUES ('1295951828109766658', 'Web Service', '0', 0, 0, '2020-08-19 13:12:48', '2020-08-19 13:12:48');
INSERT INTO `edu_subject` VALUES ('1295951828478865409', 'Web Service', '1295951828109766658', 0, 0, '2020-08-19 13:12:48', '2020-08-19 13:12:48');
INSERT INTO `edu_subject` VALUES ('1295951828957016065', 'WSDL', '1295951828109766658', 0, 0, '2020-08-19 13:12:48', '2020-08-19 13:12:48');
INSERT INTO `edu_subject` VALUES ('1295951829447749633', 'SOAP', '1295951828109766658', 0, 0, '2020-08-19 13:12:48', '2020-08-19 13:12:48');
INSERT INTO `edu_subject` VALUES ('1295951829930094594', 'RSS', '1295951828109766658', 0, 0, '2020-08-19 13:12:49', '2020-08-19 13:12:49');
INSERT INTO `edu_subject` VALUES ('1295951830433411074', 'RDF', '1295951828109766658', 0, 0, '2020-08-19 13:12:49', '2020-08-19 13:12:49');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '讲师ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '讲师姓名',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(10) UNSIGNED NOT NULL COMMENT '头衔 1首席讲师 2高级讲师 3中级讲师 4初级讲师 5见习讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '讲师头像',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '讲师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1295711022593732610', '张瑞正', '原北京六六八八项目经理，主导大型电商项目E动商网的研发。后曾在多家软件企业担任系统架构师、技术负责人。2014年在大唐高鸿某事业部担任技术总监，主导“敲敲运营平台”的开发。 精通dubbo 、spring cloud等分布式架构技术以及vue.js等前端框架。', '硕士研究生', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/85ece979821a46678c5bf81723b17098file.png', 0, 0, '2020-08-18 21:15:56', '2020-08-18 21:15:56');
INSERT INTO `edu_teacher` VALUES ('1295711612388372482', '测试', '测试', '测试', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/e878c77033474b7f9537890932695cf9file.png', 0, 0, '2020-08-18 21:18:16', '2020-08-18 21:18:16');
INSERT INTO `edu_teacher` VALUES ('1295716150897930241', '陈泊怡', '毕业于哈尔滨工程大学，GIS行业工程实战专家，在图像分割、检测、追踪等方面有多年从业经历，参与多项国家级/部委级重大项目，具备丰富的工程落地经验。', '本科', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/045b86bfbb6b4c78babbb97556dd109afile.png', 2, 0, '2020-08-18 21:36:18', '2020-08-18 21:36:18');
INSERT INTO `edu_teacher` VALUES ('1295716832552022017', '陈书坦', '具有多年企业级CV项目开发经验， 对计算机视觉领域的分类、检测等任务有深入研究； 精通CV不同任务的性能提升和工程落地解决方案。', '博士研究生', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/11c4adb9d7a44bcd92e97ab077b8645afile.png', 0, 0, '2020-08-18 21:39:01', '2020-08-18 21:39:01');
INSERT INTO `edu_teacher` VALUES ('1295717662629949441', '陈来君', '8年以上软件开发经验，精通Java、PHP、ASP等编程语言。曾负责国家计算机安全中心的531和242等课题的研究,信息产业部号码携带运维系统，中国移动的<上海世博国漫综合业务平台>等多个电信领域的软件项目的设计及研发。', '本科', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/711f94c67e5a42189a780ce96cc1534bfile.png', 3, 0, '2020-08-18 21:42:19', '2020-08-18 21:42:19');
INSERT INTO `edu_teacher` VALUES ('1295718404103204866', '李彦龙', '8年软件开发及教学经验，先后在360、亚信、众信旅游担任高级软件工程师，技术经理等职位。精通spring、springboot、springcloud、docker微服务开发等。', '本科', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/7361f6356b7b46dd8a980a245d9f13b0file.png', 0, 0, '2020-08-18 21:45:15', '2020-08-18 21:45:15');
INSERT INTO `edu_teacher` VALUES ('1295718872481132546', '李文博', '精通canvas，精通常用算法，尤其善长动效制作，后期主要担任前端架构师，曾主导多个大型项目前端项目开发工作，如：中国电信大数据、东风日产官网、农业银行智能营销平台等。这期间制作过h5游戏、门户网站、、直播app、小程序等涉及多领域，精通前端各主流技术。', '硕士研究生', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/854b645b37924602822f285289f0fee7file.png', 0, 0, '2020-08-18 21:47:07', '2020-08-18 21:47:07');
INSERT INTO `edu_teacher` VALUES ('1295721475877236737', '柴波光', '8年软件开发经验. 原用友高级架构师,开发装配式的移动开发平台,移动界面设计器,采用Reactjs为基础技术栈,对所有的组件进行动态渲染和拖拽式设计,针对不懂前端的后端工程师,实现几分钟配置一个移动界面的开发需求. 对配置化、零编码的开发平台有较强的技术和架构能力。', '本科', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/78576484fa0f4c63b7328f5cd7e9e3b5file.png', 0, 0, '2020-08-18 21:57:28', '2020-08-18 21:57:28');
INSERT INTO `edu_teacher` VALUES ('1295722013767364609', '柴成荫', '负责永辉生活+小程序，蓝月亮至尊洗衣在线服务预约项目。熟悉小程序、NodeJS、Html、CSS、JS、Vue、Nuxt.js、单元测试、敏捷开发管理。同时后台有超3年Java开发经验。', '本科', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/e1e4e2b3cf9a4f54858816e65f7bc8d0file.png', 1, 0, '2020-08-18 21:59:36', '2020-08-18 21:59:36');
INSERT INTO `edu_teacher` VALUES ('1295722488713572354', '许安翔', '多年机器学习, 人工智能相关领域算法分析,研发经验。熟悉C++, Python语言, 对框架Tensorflow, Pytorch有熟练掌握,对机器学习, 自然语言处理相关理论和工程实践有深入研究。', '博士研究生', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/1ac2ff82bb4942e489956a8cb1b964ccfile.png', 0, 0, '2020-08-18 22:01:29', '2020-08-18 22:01:29');
INSERT INTO `edu_teacher` VALUES ('1295723232816656386', '许昂雄', '曾供职于京东商城，先后参加多个大型管理系统开发，负责前端技术架构，公共业务组件封装 精通前端技术体系，熟练使用CSS3、ES6，typescript、Vue、React、Node.js、mysql等前后端技术。擅长将工作经验融入教学实践，授课清晰，认真负责，热衷于传播实战开发技能，深受学员认可。', '本科', 5, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/4c06aa9580674ef688c2002ab0178edafile.png', 0, 0, '2020-08-18 22:04:27', '2020-08-18 22:04:27');
INSERT INTO `edu_teacher` VALUES ('1295723740021256194', '程星云', '15年软件开发与教学经验。先后在中科富星、Radvision、河北恒信等企业担任高级工程师、架构师等职务。主导和参与的项目有吉林长春市公民信息查询与核查系统、iContact、iCM等视频会议产品的研发维护、恒信卡包项目、恒信pbox内容分发系统等。', '硕士研究生', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/33620558fd64454aa15a1f21a6ac0c5cfile.png', 1, 0, '2020-08-18 22:06:28', '2020-08-18 22:06:28');
INSERT INTO `edu_teacher` VALUES ('1295724292461424642', '程一芸', '微软AI课程导师，曾访学德国汉诺威大学（德国工业大学TU9），阿根廷国家科学技术委员会； 曾任职于世界500强公司霍尼韦尔及大疆创新研发部； 曾于江南大学，南京信息工程大学等“211”及“双一流”高校讲授人工智能课程。', '博士研究生', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/d23803dd51b5400d90c8da0c2a88f9b8file.png', 4, 0, '2020-08-18 22:08:39', '2020-08-18 22:08:39');
INSERT INTO `edu_teacher` VALUES ('1295725210712010754', '秦玉龙', '7年研发经验，先后在 中科软、开元金融、蜂网供应链等公司，任职TL、研发经理等职位，擅长企业信息化、供应链、互联网金融等系统的研发管理。', '硕士研究生', 4, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/342a7a2508fa4268b266dcf4f3cae853file.png', 1, 0, '2020-08-18 22:12:18', '2020-08-18 22:12:18');
INSERT INTO `edu_teacher` VALUES ('1295726581611884545', '秦失倩', '多年开发和教学经验, 精通前后端全栈开发, 掌握Java, Spring, MyBatis, JSP, Servlet, MySQL, Oracle等技术, 对算法和设计模式有深入研究和实践应用, 曾参与研发互联网停车平台，旅游出行平台，大型电商等项目。', '本科', 5, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/89533934cebd4d76924e36ba0de4b9f1file.png', 1, 0, '2020-08-18 22:17:45', '2020-08-18 22:17:45');
INSERT INTO `edu_teacher` VALUES ('1295727115169296385', '姚远', '6年软件开发及教学经验。先后入职过中国移动和平安保险公司，担任软件开发工程师。参与过人工智能家居系统开发，机票预习系统开发等。', '本科', 4, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/29559c2cde894029b268c0ee2463e66ffile.png', 0, 0, '2020-08-18 22:19:52', '2020-08-18 22:19:52');
INSERT INTO `edu_teacher` VALUES ('1295727755513688066', '易浩鹏', '多年一线的运维工作经验，擅长linux运维、Web集群架构、云计算。作为中国区DevOps master,对自动化运维、Docker+kubernetes集群、云计算等主流的运维知识都有深入的研究。以轻松快乐的课堂气氛深受学员的青睐。', '博士研究生', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/508b9c57e095401da1ade9ff895ac892file.png', 1, 0, '2020-08-18 22:22:25', '2020-08-18 22:22:25');
INSERT INTO `edu_teacher` VALUES ('1295728326408794114', '顾晨西', '11年互联网产品设计经验，3年教学管理经验，熟悉IT教育模式、经营管理与市场运作。擅长项目制作，产品设计、交互设计、UI设计，可独立完成课程体系建设等工作。曾主导参与《京东金融app》《喵咔app》《逛购B端APP》《逛购C端APP》等大型互联网项目。', '博士研究生', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/d22206545a7d47e78e50156dc29560e6file.png', 1, 0, '2020-08-18 22:24:41', '2020-08-18 22:24:41');
INSERT INTO `edu_teacher` VALUES ('1295729331598913538', '龙剑华', '毕业于郑州轻工业大学 多年的软件开发与IT教学经验,精通C/C++,Python、Java等开发语言.多套网络视频课程录制，授课风格风趣幽默，知识讲解结构层次分明。', '本科', 3, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/09aa299d8ab34f3d95d941634d74f562file.png', 2, 0, '2020-08-18 22:28:41', '2020-08-18 22:28:41');
INSERT INTO `edu_teacher` VALUES ('1295729775289167874', '单卫军', '10年软件开发经验，曾任开发经理和架构师等职务。曾参与和主导日活用户数百万移动互联网项目的分布式架构升级改造，完成无损迁移。主要擅长分布式系统设计、DevOps、容器化技术和搜索引擎技术。', '硕士研究生', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/92d03f3b2a514086849d087987d0df2ffile.png', 0, 0, '2020-08-18 22:30:27', '2020-08-18 22:30:27');
INSERT INTO `edu_teacher` VALUES ('1295730208116174850', '白逸凡', '专注于亿级用户规模的大数据平台研发建设和研发，历任项目经理、高级专家、技术总监等职务，主导设计游戏一体化运营平台、通用大数据任务调度平台实现公司各部门集群资源共享、离线任务数据分析平台构建等，精通 C/C++、C#、Hadoop、Scala、Spark、Flink等有深入研究。', '博士研究生', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/34ffdec03dde436083244e21f48878e9file.png', 3, 0, '2020-08-18 22:32:10', '2020-08-18 22:32:10');
INSERT INTO `edu_teacher` VALUES ('1295730711986302978', '姜鹤', '多年资深大数据开发工程师经验，先后涉足Java、大数据、云计算等领域，熟悉大数据服务开发与云计算平台开发，专注于互联网APP后台数据统计、分析、建模等流程；熟悉车辆网领域云计算平台开发，拥有丰富的企业级大数据应用架构及开发经验。', '本科', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/e45c3290c504459ca59d8869f4d716d3file.png', 0, 0, '2020-08-18 22:34:10', '2020-08-18 22:34:10');
INSERT INTO `edu_teacher` VALUES ('1295731404528807938', '夏天', '曾经在美团负责IM通讯系统的研发；在大型电商公司负责后台系统的研发和测试平台的搭建工作；在好未来培优事业部担任高级测试开发工程师，负责自动化测试和性能测试；拥有丰富的项目开发、性能测试、自动化测试及测试平台的开发经验。', '本科', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/b16afcce1b8d4e6b95687bf6d5f280bdfile.png', 0, 0, '2020-08-18 22:36:55', '2020-08-18 22:36:55');
INSERT INTO `edu_teacher` VALUES ('1295732072396222465', '周小飞', 'Sklearn机器学习工具源码贡献者；Google Tensorflow中文社区开发者；具有多年企业级AI项目开发经验，对推荐系统，NLP，知识图谱，问答系统有较深入研究。', '硕士研究生', 1, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/c291437981264606bec32e5793e01c86file.png', 0, 0, '2020-08-18 22:39:34', '2020-08-18 22:39:34');
INSERT INTO `edu_teacher` VALUES ('1295732573565218817', '苏宇轩', '精通 CSS、JavaScript 以及语言衍生框架，熟悉 React 架构体系，NodeJS 等技术。负责过多个大型前端中后台项目，主要包括 SPA 云平台，可视化页面搭建工具等复杂前端应用。', '专科', 5, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/3c7b4048d59344b6984fc65643762027file.png', 0, 0, '2020-08-18 22:41:34', '2020-08-18 22:41:34');
INSERT INTO `edu_teacher` VALUES ('1295733604051185665', '金淦', '5年以上开发和教育经验,授课风格：风趣幽默,深入浅出，善于与学生互动，注重实战。 先后在华宇信息以及立联立动等多家大型公司担任高级开发工程师。', '本科', 4, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/40be989190d34a21bc233f1fc4fe51fafile.png', 0, 0, '2020-08-18 22:45:39', '2020-08-18 22:45:39');
INSERT INTO `edu_teacher` VALUES ('1295734409059758082', '史果果', '曾参与国家开放大学module教育平台，环球影视(中国)等多个大型项目。拥有丰富的前端教学经验，擅长设计课程与教学。课程内容是第一位，但是让学生学得开心，听得懂也很重要；pink，拼死也要克服前端。', '本科', 4, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/6be04b58a288480d87210ff15b5c8746file.png', 0, 0, '2020-08-18 22:48:51', '2020-08-18 22:48:51');
INSERT INTO `edu_teacher` VALUES ('1295735339402522626', '钱涛', '北京大学计算机与科学专业毕业，对传统JavaEE技术体系、云计算、大数据等技术都具有深厚的技术功底。“细心，耐心，用心”是一贯坚持的工作态度。', '本科', 3, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/18/e4d29af8c9154e25a82f264dd48c3567file.png', 0, 0, '2020-08-18 22:52:33', '2020-08-18 22:52:33');
INSERT INTO `edu_teacher` VALUES ('1295957488608227329', '齐圣奇', '先后在国内IT名企担任高级软件开发工程师、开发组长、项目经理等职务。精通Java EE(JSPServlet、 JDBC、Struts2、Spring、Hibernate、mybaits)，以及 WebService,Ajax，Oracle，DB2，MySQL，NoSql、分布式RPC框架Dubbo、Spring Boot、SpringCloud等微服务体系。', '本科', 3, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/e981b33e8fdb4b32a4e019e2aff8fdacfile.png', 0, 0, '2020-08-19 13:35:18', '2020-08-19 13:35:18');
INSERT INTO `edu_teacher` VALUES ('1296074867258445825', '王维', '10多年IT从业经验，曾在中科软从事系统分析与架构工作，精通OOM、PD、DDD建模；对计算机原理、体系结构、常用算法有深入研究；熟练分布式和微服务环境下的主流技术架构。', '硕士研究生', 2, 'https://xueliedu.oss-cn-beijing.aliyuncs.com/2020/08/19/95cfd216b9ee48339dd473083ffe362bfile.png', 0, 0, '2020-08-19 21:21:43', '2020-08-19 21:21:43');

-- ----------------------------
-- Table structure for edu_video_section
-- ----------------------------
DROP TABLE IF EXISTS `edu_video_section`;
CREATE TABLE `edu_video_section`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '小节视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程小节视频' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_video_section
-- ----------------------------
INSERT INTO `edu_video_section` VALUES ('1295959395288494081', '1295958589541724162', '1295959138454482945', '1.1 Java概述', '1eeb729dd3ae4dc28b3a38ee51f8403d', '1.0.1计算机与编程语言', 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 13:42:52', '2020-08-20 20:44:31');
INSERT INTO `edu_video_section` VALUES ('1295959540986032129', '1295958589541724162', '1295959138454482945', '1.2 第一个Java程序', 'cbcf89bca5594a9286a531d97ce367e8', '1.1.2第一个JAVA程序.mp4', 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:43:27', '2020-08-20 20:45:52');
INSERT INTO `edu_video_section` VALUES ('1295959573189898241', '1295958589541724162', '1295959167458095105', '2.1 标识符与关键字', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:43:35', '2020-08-19 13:43:57');
INSERT INTO `edu_video_section` VALUES ('1295959594304024578', '1295958589541724162', '1295959167458095105', '2.2 常量与变量', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:43:40', '2020-08-19 13:43:59');
INSERT INTO `edu_video_section` VALUES ('1295959623840313346', '1295958589541724162', '1295959167458095105', '2.3 类型转换', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:43:47', '2020-08-19 13:43:47');
INSERT INTO `edu_video_section` VALUES ('1295959715632656386', '1295958589541724162', '1295959167458095105', '2.4 运算符与表达式', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:44:09', '2020-08-19 13:44:09');
INSERT INTO `edu_video_section` VALUES ('1295959748146900994', '1295958589541724162', '1295959186219216898', '3.1 控制结构概述', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:44:16', '2020-08-19 13:44:16');
INSERT INTO `edu_video_section` VALUES ('1295959771697917953', '1295958589541724162', '1295959186219216898', '3.2 选择结构', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:44:22', '2020-08-19 13:44:22');
INSERT INTO `edu_video_section` VALUES ('1295959802802876418', '1295958589541724162', '1295959186219216898', '3.3 多分支结构', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:44:29', '2020-08-19 13:44:29');
INSERT INTO `edu_video_section` VALUES ('1295959826156761090', '1295958589541724162', '1295959186219216898', '3.4 循环结构', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:44:35', '2020-08-19 13:44:35');
INSERT INTO `edu_video_section` VALUES ('1295959847333801985', '1295958589541724162', '1295959186219216898', '3.5 跳转控制', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:44:40', '2020-08-19 13:44:40');
INSERT INTO `edu_video_section` VALUES ('1295959897271185410', '1295958589541724162', '1295959207568224257', '4.1 一维数组', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:44:52', '2020-08-19 13:44:52');
INSERT INTO `edu_video_section` VALUES ('1295959919316447233', '1295958589541724162', '1295959207568224257', '4.2 二维数组', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:44:57', '2020-08-19 13:44:57');
INSERT INTO `edu_video_section` VALUES ('1295959944142532610', '1295958589541724162', '1295959226778136578', '5.1 方法定义', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:45:03', '2020-08-19 13:45:03');
INSERT INTO `edu_video_section` VALUES ('1295959970851860482', '1295958589541724162', '1295959226778136578', '5.2 方法调用', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:45:09', '2020-08-19 13:45:09');
INSERT INTO `edu_video_section` VALUES ('1295959992997785602', '1295958589541724162', '1295959226778136578', '5.3 方法重载', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:45:15', '2020-08-19 13:45:15');
INSERT INTO `edu_video_section` VALUES ('1295960017928728578', '1295958589541724162', '1295959226778136578', '5.4 局部变量与方法举例', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:45:21', '2020-08-19 13:45:21');
INSERT INTO `edu_video_section` VALUES ('1295960042696093698', '1295958589541724162', '1295959253831397377', '6.1类与对象', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:45:27', '2020-08-19 13:45:27');
INSERT INTO `edu_video_section` VALUES ('1295960074430197762', '1295958589541724162', '1295959253831397377', '6.2构造方法', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:45:34', '2020-08-19 13:45:34');
INSERT INTO `edu_video_section` VALUES ('1295960118315200513', '1295958589541724162', '1295959253831397377', '6.3 this关键字', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:45:45', '2020-08-19 13:45:45');
INSERT INTO `edu_video_section` VALUES ('1295960148287696898', '1295958589541724162', '1295959253831397377', '6.4对象的存储', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:45:52', '2020-08-19 13:45:52');
INSERT INTO `edu_video_section` VALUES ('1295960170941132802', '1295958589541724162', '1295959253831397377', '6.5包', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:45:57', '2020-08-19 13:46:07');
INSERT INTO `edu_video_section` VALUES ('1295960225232203777', '1295958589541724162', '1295959253831397377', '6.6访问权限', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:46:10', '2020-08-19 13:46:10');
INSERT INTO `edu_video_section` VALUES ('1295960247306825730', '1295958589541724162', '1295959253831397377', '6.7static关键字', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:46:15', '2020-08-19 13:46:15');
INSERT INTO `edu_video_section` VALUES ('1295960270094479362', '1295958589541724162', '1295959253831397377', '6.8继承', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:46:21', '2020-08-19 13:46:21');
INSERT INTO `edu_video_section` VALUES ('1295960293641302018', '1295958589541724162', '1295959253831397377', '6.9super关键字', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:46:26', '2020-08-19 13:46:26');
INSERT INTO `edu_video_section` VALUES ('1295960321227239426', '1295958589541724162', '1295959253831397377', '6.10继承关系下的访问控制权限', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:46:33', '2020-08-19 13:46:33');
INSERT INTO `edu_video_section` VALUES ('1295960348339220481', '1295958589541724162', '1295959253831397377', '6.11方法覆盖', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:46:39', '2020-08-19 13:46:39');
INSERT INTO `edu_video_section` VALUES ('1295960383407796225', '1295958589541724162', '1295959253831397377', '6.12final关键字', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:46:48', '2020-08-19 13:46:48');
INSERT INTO `edu_video_section` VALUES ('1295960411488661505', '1295958589541724162', '1295959253831397377', '6.13 对象转型', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:46:55', '2020-08-19 13:46:55');
INSERT INTO `edu_video_section` VALUES ('1295960434876100610', '1295958589541724162', '1295959253831397377', '6.14Object类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:47:00', '2020-08-19 13:47:00');
INSERT INTO `edu_video_section` VALUES ('1295960456317382658', '1295958589541724162', '1295959253831397377', '6.15多态', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:47:05', '2020-08-19 13:47:05');
INSERT INTO `edu_video_section` VALUES ('1295960482322067457', '1295958589541724162', '1295959253831397377', '6.16 抽象类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:47:11', '2020-08-19 13:47:11');
INSERT INTO `edu_video_section` VALUES ('1295960510176440321', '1295958589541724162', '1295959253831397377', '6.17接口', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:47:18', '2020-08-19 13:47:18');
INSERT INTO `edu_video_section` VALUES ('1295960546608164865', '1295958589541724162', '1295959277755707393', '7.1 字符串定义', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:47:27', '2020-08-19 13:47:27');
INSERT INTO `edu_video_section` VALUES ('1295960570406645762', '1295958589541724162', '1295959277755707393', '7.2 字符串的不可变性', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:47:32', '2020-08-19 13:47:32');
INSERT INTO `edu_video_section` VALUES ('1295960593861193730', '1295958589541724162', '1295959277755707393', '7.3 String类的常用方法', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:47:38', '2020-08-19 13:47:38');
INSERT INTO `edu_video_section` VALUES ('1295960621405188098', '1295958589541724162', '1295959277755707393', '7.4 可变字符串', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:47:45', '2020-08-19 13:47:45');
INSERT INTO `edu_video_section` VALUES ('1295963113731956737', '1295962761318146050', '1295962793240993793', '1.1Math类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:57:39', '2020-08-19 13:57:39');
INSERT INTO `edu_video_section` VALUES ('1295963155570139137', '1295962761318146050', '1295962793240993793', '1.2Date和Calender类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:57:49', '2020-08-19 13:57:49');
INSERT INTO `edu_video_section` VALUES ('1295963188084383745', '1295962761318146050', '1295962793240993793', '1.3Format类及其子类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:57:57', '2020-08-19 13:57:57');
INSERT INTO `edu_video_section` VALUES ('1295963223144570881', '1295962761318146050', '1295962793240993793', '1.4Scanner类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:58:05', '2020-08-19 13:58:05');
INSERT INTO `edu_video_section` VALUES ('1295963254123700225', '1295962761318146050', '1295962793240993793', '1.5System类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:58:12', '2020-08-19 13:58:12');
INSERT INTO `edu_video_section` VALUES ('1295963301334786049', '1295962761318146050', '1295962818750750721', '2.1 异常的基本概念', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:58:24', '2020-08-19 13:58:24');
INSERT INTO `edu_video_section` VALUES ('1295963334381707266', '1295962761318146050', '1295962818750750721', '2.2 异常处理（1）', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:58:31', '2020-08-19 13:58:31');
INSERT INTO `edu_video_section` VALUES ('1295963358448623617', '1295962761318146050', '1295962818750750721', '2.2 异常处理（2）', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:58:37', '2020-08-19 13:58:37');
INSERT INTO `edu_video_section` VALUES ('1295963392166633474', '1295962761318146050', '1295962847653699586', '3.1 IO概述', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:58:45', '2020-08-19 13:58:45');
INSERT INTO `edu_video_section` VALUES ('1295963413565972482', '1295962761318146050', '1295962847653699586', '3.2 File类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:58:50', '2020-08-19 13:58:50');
INSERT INTO `edu_video_section` VALUES ('1295963440849920002', '1295962761318146050', '1295962847653699586', '3.3 字节流', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:58:57', '2020-08-19 13:58:57');
INSERT INTO `edu_video_section` VALUES ('1295963469207609345', '1295962761318146050', '1295962847653699586', '3.4 字符流', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:59:04', '2020-08-19 13:59:04');
INSERT INTO `edu_video_section` VALUES ('1295963497150062593', '1295962761318146050', '1295962847653699586', '3.5 缓冲流', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:59:10', '2020-08-19 13:59:10');
INSERT INTO `edu_video_section` VALUES ('1295963521820958722', '1295962761318146050', '1295962847653699586', '3.6 数据流', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:59:16', '2020-08-19 13:59:16');
INSERT INTO `edu_video_section` VALUES ('1295963547414601729', '1295962761318146050', '1295962847653699586', '3.7 标准输入输出', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 13:59:22', '2020-08-19 13:59:51');
INSERT INTO `edu_video_section` VALUES ('1295963749210955777', '1295962761318146050', '1295962872098103297', '4.1 集合概述', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:00:10', '2020-08-19 14:00:10');
INSERT INTO `edu_video_section` VALUES ('1295963772262850561', '1295962761318146050', '1295962872098103297', '4.2 Collection', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:00:16', '2020-08-19 14:00:16');
INSERT INTO `edu_video_section` VALUES ('1295963908770668545', '1295962761318146050', '1295962872098103297', '4.3 Map接口讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:00:48', '2020-08-19 14:00:48');
INSERT INTO `edu_video_section` VALUES ('1295963934846656514', '1295962761318146050', '1295962872098103297', '4.4 List接口讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:00:55', '2020-08-19 14:00:55');
INSERT INTO `edu_video_section` VALUES ('1295963959463026690', '1295962761318146050', '1295962872098103297', '4.5 ArrayList类讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:01:00', '2020-08-19 14:01:00');
INSERT INTO `edu_video_section` VALUES ('1295963987611000834', '1295962761318146050', '1295962872098103297', '4.6 LinkedList类讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:01:07', '2020-08-19 14:01:07');
INSERT INTO `edu_video_section` VALUES ('1295964013024288770', '1295962761318146050', '1295962872098103297', '4.7 Set接口中方法讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:01:13', '2020-08-19 14:01:13');
INSERT INTO `edu_video_section` VALUES ('1295964041415532545', '1295962761318146050', '1295962872098103297', '4.8 HashSet类讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:01:20', '2020-08-19 14:01:20');
INSERT INTO `edu_video_section` VALUES ('1295964068447821826', '1295962761318146050', '1295962872098103297', '4.9 TreeSet类讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:01:26', '2020-08-19 14:01:26');
INSERT INTO `edu_video_section` VALUES ('1295964104455921665', '1295962761318146050', '1295962872098103297', '4.10 HashMap类讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:01:35', '2020-08-19 14:01:35');
INSERT INTO `edu_video_section` VALUES ('1295964140761817089', '1295962761318146050', '1295962872098103297', '4.11 TreeMap讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:01:44', '2020-08-19 14:01:44');
INSERT INTO `edu_video_section` VALUES ('1295964175691980802', '1295962761318146050', '1295962872098103297', '4.12 Iterator接口讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:01:52', '2020-08-19 14:01:52');
INSERT INTO `edu_video_section` VALUES ('1295964204544598018', '1295962761318146050', '1295962872098103297', '4.13 ListIterator类讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:01:59', '2020-08-19 14:01:59');
INSERT INTO `edu_video_section` VALUES ('1295964244201742337', '1295962761318146050', '1295962872098103297', '4.14 Collections类讲解', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:02:08', '2020-08-19 14:02:08');
INSERT INTO `edu_video_section` VALUES ('1295964279412924418', '1295962761318146050', '1295962872098103297', '4.15 foreach的使用', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:02:17', '2020-08-19 14:02:17');
INSERT INTO `edu_video_section` VALUES ('1295964314737352705', '1295962761318146050', '1295962902167068674', '5.1 线程创建于运行', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:02:25', '2020-08-19 14:02:25');
INSERT INTO `edu_video_section` VALUES ('1295964339538272258', '1295962761318146050', '1295962902167068674', '5.2 线程安全与同步', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:02:31', '2020-08-19 14:02:31');
INSERT INTO `edu_video_section` VALUES ('1295964365337436162', '1295962761318146050', '1295962902167068674', '5.3 线程调度与状态变迁', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:02:37', '2020-08-19 14:02:37');
INSERT INTO `edu_video_section` VALUES ('1295964391275012097', '1295962761318146050', '1295962902167068674', '5.4 线程中断与异常处理', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:02:43', '2020-08-19 14:02:43');
INSERT INTO `edu_video_section` VALUES ('1295964419662061569', '1295962761318146050', '1295962923587379202', '6.1 网络编程基础', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:02:50', '2020-08-19 14:02:50');
INSERT INTO `edu_video_section` VALUES ('1295964448552427521', '1295962761318146050', '1295962923587379202', '6.2 Inetaddress类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:02:57', '2020-08-19 14:02:57');
INSERT INTO `edu_video_section` VALUES ('1295964479992930306', '1295962761318146050', '1295962923587379202', '6.3 URL类和URLConnection类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:03:05', '2020-08-19 14:03:05');
INSERT INTO `edu_video_section` VALUES ('1295964508249956353', '1295962761318146050', '1295962923587379202', '6.4 TCP程序设计', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:03:11', '2020-08-19 14:03:11');
INSERT INTO `edu_video_section` VALUES ('1295964534695043074', '1295962761318146050', '1295962923587379202', '6.5 网络编程案例', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:03:18', '2020-08-19 14:03:18');
INSERT INTO `edu_video_section` VALUES ('1295964975302483969', '1295962761318146050', '1295962950011494402', '7.1 JDBC简介', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:05:03', '2020-08-19 14:05:03');
INSERT INTO `edu_video_section` VALUES ('1295964995447726082', '1295962761318146050', '1295962950011494402', '7.2 JDBC进阶', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:05:07', '2020-08-19 14:05:07');
INSERT INTO `edu_video_section` VALUES ('1295965024044490753', '1295962761318146050', '1295962973138886658', '8.1 类的定义', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:05:14', '2020-08-19 14:05:14');
INSERT INTO `edu_video_section` VALUES ('1295965059452805122', '1295962761318146050', '1295962973138886658', '8.2 如何获取类的Class对象', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:05:23', '2020-08-19 14:05:23');
INSERT INTO `edu_video_section` VALUES ('1295965091329515521', '1295962761318146050', '1295962973138886658', '8.3 如何获取类的构造方法对象', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:05:30', '2020-08-19 14:05:30');
INSERT INTO `edu_video_section` VALUES ('1295965115039916033', '1295962761318146050', '1295962973138886658', '8.4 如何获取类的属性对象', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:05:36', '2020-08-19 14:05:36');
INSERT INTO `edu_video_section` VALUES ('1295965143162724353', '1295962761318146050', '1295962973138886658', '8.5 如何获取类的方法属性对象', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:05:43', '2020-08-19 14:05:43');
INSERT INTO `edu_video_section` VALUES ('1295971858922905602', '1295971643939659777', '1295971667830415362', '1.1 Python概述', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:32:24', '2020-08-19 14:32:24');
INSERT INTO `edu_video_section` VALUES ('1295971884155838466', '1295971643939659777', '1295971667830415362', '1.2 开发环境安装和配置', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:32:30', '2020-08-19 14:32:30');
INSERT INTO `edu_video_section` VALUES ('1295971946361561090', '1295971643939659777', '1295971667830415362', '1.3 基本数据类型、常量和变量', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:32:45', '2020-08-19 14:32:45');
INSERT INTO `edu_video_section` VALUES ('1295971995527192577', '1295971643939659777', '1295971686981607426', '2.1 找零和简单贪心', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:32:56', '2020-08-19 14:32:56');
INSERT INTO `edu_video_section` VALUES ('1295972022601424898', '1295971643939659777', '1295971686981607426', '2.2 求身高体重指数', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:33:03', '2020-08-19 14:33:03');
INSERT INTO `edu_video_section` VALUES ('1295972050782953473', '1295971643939659777', '1295971686981607426', '2.3是否是合法的日期', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:33:10', '2020-08-19 14:33:10');
INSERT INTO `edu_video_section` VALUES ('1295972079438438402', '1295971643939659777', '1295971708842319874', '3.1 猜数字与二分法', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:33:16', '2020-08-19 14:33:16');
INSERT INTO `edu_video_section` VALUES ('1295972112795738114', '1295971643939659777', '1295971708842319874', '3.2 X年X月X日是星期几', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:33:24', '2020-08-19 14:33:24');
INSERT INTO `edu_video_section` VALUES ('1295972136921374721', '1295971643939659777', '1295971708842319874', '3.3谁是罪犯？-简单逻辑分析', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:33:30', '2020-08-19 14:33:30');
INSERT INTO `edu_video_section` VALUES ('1295972164687667202', '1295971643939659777', '1295971708842319874', '3.4 打印9*9乘法表', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:33:37', '2020-08-19 14:33:37');
INSERT INTO `edu_video_section` VALUES ('1295972189845102593', '1295971643939659777', '1295971708842319874', '3.5 百钱百鸡与代码优化', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:33:43', '2020-08-19 14:33:43');
INSERT INTO `edu_video_section` VALUES ('1295972216680259586', '1295971643939659777', '1295971733307695106', '4.1统计字符的使用频率', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:33:49', '2020-08-19 14:33:49');
INSERT INTO `edu_video_section` VALUES ('1295972243595108353', '1295971643939659777', '1295971733307695106', ' 4.2利用正则表达式提取电话号码', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:33:56', '2020-08-19 14:33:56');
INSERT INTO `edu_video_section` VALUES ('1295972268362473473', '1295971643939659777', '1295971733307695106', '4.3 列表与复杂排序', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:34:01', '2020-08-19 14:34:01');
INSERT INTO `edu_video_section` VALUES ('1295972293054341122', '1295971643939659777', '1295971733307695106', '4.4 二分检索', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:34:07', '2020-08-19 14:34:07');
INSERT INTO `edu_video_section` VALUES ('1295972324696170498', '1295971643939659777', '1295971755134853122', '5.1 函数与问题分而治之', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:34:15', '2020-08-19 14:34:15');
INSERT INTO `edu_video_section` VALUES ('1295972437334204418', '1295971643939659777', '1295971755134853122', '5.2基于函数验证哥德巴赫猜想', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:34:42', '2020-08-19 14:34:42');
INSERT INTO `edu_video_section` VALUES ('1295972463741542402', '1295971643939659777', '1295971755134853122', '5.3 多种方法实现十进制转二进制', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:34:48', '2020-08-19 14:34:48');
INSERT INTO `edu_video_section` VALUES ('1295972487498080257', '1295971643939659777', '1295971755134853122', '5.4 多种方法求圆周率', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:34:54', '2020-08-19 14:34:54');
INSERT INTO `edu_video_section` VALUES ('1295972512898785282', '1295971643939659777', '1295971755134853122', '5.5 Base64编码', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:00', '2020-08-19 14:35:00');
INSERT INTO `edu_video_section` VALUES ('1295972536923758594', '1295971643939659777', '1295971755134853122', '5.6递归思想和递归函数', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:05', '2020-08-19 14:35:05');
INSERT INTO `edu_video_section` VALUES ('1295972560659324929', '1295971643939659777', '1295971755134853122', '5.7车队的公共钥匙盒', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:11', '2020-08-19 14:35:11');
INSERT INTO `edu_video_section` VALUES ('1295972586823393281', '1295971643939659777', '1295971775141683202', '6.1 文件操作与英汉字典', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:17', '2020-08-19 14:35:17');
INSERT INTO `edu_video_section` VALUES ('1295972609439080450', '1295971643939659777', '1295971775141683202', '6.2 文件加密解密实例', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:23', '2020-08-19 14:35:23');
INSERT INTO `edu_video_section` VALUES ('1295972641651335170', '1295971643939659777', '1295971792720011266', '7.1 异常处理与程序健壮性', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:30', '2020-08-19 14:35:30');
INSERT INTO `edu_video_section` VALUES ('1295972671447670786', '1295971643939659777', '1295971792720011266', '7.2 异常处理实际使用', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:38', '2020-08-19 14:35:38');
INSERT INTO `edu_video_section` VALUES ('1295972705941626881', '1295971643939659777', '1295971817281855489', '8.1 Python与KNN分类', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:46', '2020-08-19 14:35:46');
INSERT INTO `edu_video_section` VALUES ('1295972730306338818', '1295971643939659777', '1295971817281855489', '8.2 汉语分词实例', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:52', '2020-08-19 14:35:52');
INSERT INTO `edu_video_section` VALUES ('1295972757380571137', '1295971643939659777', '1295971817281855489', '8.3 骆驼祥子用字分析', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:35:58', '2020-08-19 14:35:58');
INSERT INTO `edu_video_section` VALUES ('1295972782340874241', '1295971643939659777', '1295971817281855489', '8.4 Numpy简介', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:36:04', '2020-08-19 14:36:04');
INSERT INTO `edu_video_section` VALUES ('1295972807104045058', '1295971643939659777', '1295971817281855489', '8.5 Pandas简介', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:36:10', '2020-08-19 14:36:10');
INSERT INTO `edu_video_section` VALUES ('1295972831569420289', '1295971643939659777', '1295971817281855489', '8.6  Python与数据可视化', NULL, NULL, 0, 0, 1, 0, 'Empty', 0, 1, '2020-08-19 14:36:16', '2020-08-19 14:36:16');
INSERT INTO `edu_video_section` VALUES ('1295974417528037377', '1295974194441396225', '1295974225017872385', '1.1 数据挖据的产生、定义和流程', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:42:34', '2020-08-19 14:42:34');
INSERT INTO `edu_video_section` VALUES ('1295974454932840450', '1295974194441396225', '1295974225017872385', '1.2 数据挖掘的方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:42:43', '2020-08-19 14:42:43');
INSERT INTO `edu_video_section` VALUES ('1295974543818530818', '1295974194441396225', '1295974225017872385', '1.3 数据挖掘的应用', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:43:04', '2020-08-19 14:43:04');
INSERT INTO `edu_video_section` VALUES ('1295974572847308801', '1295974194441396225', '1295974225017872385', '1.4 python介绍', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:43:11', '2020-08-19 14:43:11');
INSERT INTO `edu_video_section` VALUES ('1295974615335608321', '1295974194441396225', '1295974241686036482', '2.1 数据对象与属性类型', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:43:21', '2020-08-19 14:43:21');
INSERT INTO `edu_video_section` VALUES ('1295974641986215938', '1295974194441396225', '1295974241686036482', '2.2 数据的基本统计描述', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:43:27', '2020-08-19 14:43:27');
INSERT INTO `edu_video_section` VALUES ('1295974680921939970', '1295974194441396225', '1295974241686036482', '2.3 数据可视化', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:43:37', '2020-08-19 14:43:37');
INSERT INTO `edu_video_section` VALUES ('1295974707874537474', '1295974194441396225', '1295974241686036482', '2.4 数据的相似性与相异性度量', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:43:43', '2020-08-19 14:43:43');
INSERT INTO `edu_video_section` VALUES ('1295974740384587777', '1295974194441396225', '1295974241686036482', '2.5 python操作：认识数据（一）', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:43:51', '2020-08-19 14:43:51');
INSERT INTO `edu_video_section` VALUES ('1295974781618790401', '1295974194441396225', '1295974241686036482', '2.6 python操作：认识数据（二）', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:44:01', '2020-08-19 14:44:01');
INSERT INTO `edu_video_section` VALUES ('1295974952989663234', '1295974194441396225', '1295974260262608898', '3.1 数据预处理的基本思想', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:44:42', '2020-08-19 14:44:42');
INSERT INTO `edu_video_section` VALUES ('1295975036699582466', '1295974194441396225', '1295974260262608898', '3.2 数据离散化', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:01', '2020-08-19 14:45:01');
INSERT INTO `edu_video_section` VALUES ('1295975062767181826', '1295974194441396225', '1295974260262608898', '3.3 数据清洗', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:08', '2020-08-19 14:45:08');
INSERT INTO `edu_video_section` VALUES ('1295975086997676034', '1295974194441396225', '1295974260262608898', '3.4 特征提取与特征选择', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:13', '2020-08-19 14:45:13');
INSERT INTO `edu_video_section` VALUES ('1295975115695104001', '1295974194441396225', '1295974280886001665', '4.1 引言', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:20', '2020-08-19 14:45:20');
INSERT INTO `edu_video_section` VALUES ('1295975140080787458', '1295974194441396225', '1295974280886001665', '4.2 频繁模式与关联规则', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:26', '2020-08-19 14:45:26');
INSERT INTO `edu_video_section` VALUES ('1295975164441305090', '1295974194441396225', '1295974280886001665', '4.3 频繁项集的典型挖掘方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:32', '2020-08-19 14:45:32');
INSERT INTO `edu_video_section` VALUES ('1295975192429895682', '1295974194441396225', '1295974280886001665', '4.4 关联规则的生成方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:39', '2020-08-19 14:45:39');
INSERT INTO `edu_video_section` VALUES ('1295975219516710914', '1295974194441396225', '1295974280886001665', '4.5 关联规则的其他类型', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:45', '2020-08-19 14:45:45');
INSERT INTO `edu_video_section` VALUES ('1295975246314119170', '1295974194441396225', '1295974280886001665', '4.6 关联规则的兴趣度的其他度量', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:51', '2020-08-19 14:45:51');
INSERT INTO `edu_video_section` VALUES ('1295975274864746498', '1295974194441396225', '1295974280886001665', '4.7 python操作：关联规则挖掘', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:45:58', '2020-08-19 14:45:58');
INSERT INTO `edu_video_section` VALUES ('1295975300735213569', '1295974194441396225', '1295974300611813378', '5.1 分类的概念', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:46:04', '2020-08-19 14:46:04');
INSERT INTO `edu_video_section` VALUES ('1295975337682837506', '1295974194441396225', '1295974300611813378', '5.2 决策树', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:46:13', '2020-08-19 14:46:13');
INSERT INTO `edu_video_section` VALUES ('1295975387511169026', '1295974194441396225', '1295974300611813378', '5.3 朴素贝叶斯分类', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:46:25', '2020-08-19 14:46:25');
INSERT INTO `edu_video_section` VALUES ('1295975421103349762', '1295974194441396225', '1295974300611813378', '5.4 k近邻分类', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:46:33', '2020-08-19 14:46:33');
INSERT INTO `edu_video_section` VALUES ('1295975451226841090', '1295974194441396225', '1295974300611813378', '5.5 分类性能的度量方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:46:40', '2020-08-19 14:46:40');
INSERT INTO `edu_video_section` VALUES ('1295975486438023170', '1295974194441396225', '1295974300611813378', '5.6 python操作：分类（一）', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:46:49', '2020-08-19 14:46:49');
INSERT INTO `edu_video_section` VALUES ('1295975513411592193', '1295974194441396225', '1295974300611813378', '5.7 python操作：分类（二）', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:46:55', '2020-08-19 14:46:55');
INSERT INTO `edu_video_section` VALUES ('1295976605201489922', '1295974194441396225', '1295974319037390849', '6.1 数值预测概念', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:51:15', '2020-08-19 14:51:26');
INSERT INTO `edu_video_section` VALUES ('1295976634268016641', '1295974194441396225', '1295974319037390849', '6.2 回归方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:51:22', '2020-08-19 14:51:29');
INSERT INTO `edu_video_section` VALUES ('1295976707760611330', '1295974194441396225', '1295974319037390849', '6.3 回归树与模型树', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:51:40', '2020-08-19 14:51:40');
INSERT INTO `edu_video_section` VALUES ('1295976739901562881', '1295974194441396225', '1295974319037390849', '6.4 K近邻数值预测和预测误差的度量', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:51:48', '2020-08-19 14:51:48');
INSERT INTO `edu_video_section` VALUES ('1295976773753790466', '1295974194441396225', '1295974319037390849', '6.5 python操作：数值预测', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:51:56', '2020-08-19 14:51:56');
INSERT INTO `edu_video_section` VALUES ('1295976808314855426', '1295974194441396225', '1295974341523054594', '7.1 概述', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:52:04', '2020-08-19 14:52:04');
INSERT INTO `edu_video_section` VALUES ('1295976834818662402', '1295974194441396225', '1295974341523054594', '7.2 相似度度量方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:52:10', '2020-08-19 14:52:10');
INSERT INTO `edu_video_section` VALUES ('1295976863365095425', '1295974194441396225', '1295974341523054594', '7.3 k均值聚类法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:52:17', '2020-08-19 14:52:17');
INSERT INTO `edu_video_section` VALUES ('1295976885380997122', '1295974194441396225', '1295974341523054594', '7.4 层次聚类方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:52:22', '2020-08-19 14:52:22');
INSERT INTO `edu_video_section` VALUES ('1295976919178698754', '1295974194441396225', '1295974341523054594', '7.5 DBSCAN方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:52:30', '2020-08-19 14:52:30');
INSERT INTO `edu_video_section` VALUES ('1295976945820917761', '1295974194441396225', '1295974341523054594', ' 7.6 聚类效果衡量方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:52:37', '2020-08-19 14:52:37');
INSERT INTO `edu_video_section` VALUES ('1295976979232743425', '1295974194441396225', '1295974341523054594', '7.7python操作：聚类分析（一）', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:52:45', '2020-08-19 14:52:45');
INSERT INTO `edu_video_section` VALUES ('1295977001991036929', '1295974194441396225', '1295974341523054594', '7.8python操作：聚类分析（二）', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:52:50', '2020-08-19 14:52:50');
INSERT INTO `edu_video_section` VALUES ('1295977064565858305', '1295974194441396225', '1295974364998574081', '8.1 挖掘复杂的数据类型-序列与网络', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:53:05', '2020-08-19 14:53:05');
INSERT INTO `edu_video_section` VALUES ('1295977096799084545', '1295974194441396225', '1295974364998574081', '8.2 挖掘复杂的数据类型-其他类型', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 14:53:13', '2020-08-19 14:53:13');
INSERT INTO `edu_video_section` VALUES ('1295979972254523393', '1295979692880322562', '1295979724698312706', '1.1 HTML5简介', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:04:38', '2020-08-19 15:04:38');
INSERT INTO `edu_video_section` VALUES ('1295979995872649217', '1295979692880322562', '1295979724698312706', '1.2 HTML5文件的编写方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:04:44', '2020-08-19 15:04:44');
INSERT INTO `edu_video_section` VALUES ('1295980026310713345', '1295979692880322562', '1295979743908225025', '2.1 Web标准', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:04:51', '2020-08-19 15:04:51');
INSERT INTO `edu_video_section` VALUES ('1295980049492631553', '1295979692880322562', '1295979743908225025', '2.2 HTML5文档的基本结构', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:04:57', '2020-08-19 15:04:57');
INSERT INTO `edu_video_section` VALUES ('1295980072137678850', '1295979692880322562', '1295979743908225025', '2.3 综合案例――制作符合W3C标准的网页', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:05:02', '2020-08-19 15:05:02');
INSERT INTO `edu_video_section` VALUES ('1295980101946597378', '1295979692880322562', '1295979760937099266', '3.1新增的主体结构元素', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:05:09', '2020-08-19 15:05:09');
INSERT INTO `edu_video_section` VALUES ('1295980120200208386', '1295979692880322562', '1295979760937099266', '3.2新增的非主体结构元素', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:05:13', '2020-08-19 15:05:13');
INSERT INTO `edu_video_section` VALUES ('1295980145298923522', '1295979692880322562', '1295979760937099266', '3.3新增其他常用元素', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:05:19', '2020-08-19 15:05:19');
INSERT INTO `edu_video_section` VALUES ('1295980173757276161', '1295979692880322562', '1295979760937099266', '3.4新增全局属性', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:05:26', '2020-08-19 15:05:26');
INSERT INTO `edu_video_section` VALUES ('1295980195693486081', '1295979692880322562', '1295979760937099266', '3.5新增的其他属性', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:05:31', '2020-08-19 15:05:31');
INSERT INTO `edu_video_section` VALUES ('1295980222801272834', '1295979692880322562', '1295979788812443650', '4.1 标题文本', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:05:38', '2020-08-19 15:05:38');
INSERT INTO `edu_video_section` VALUES ('1295980243844096002', '1295979692880322562', '1295979788812443650', '4.2 文字格式', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:05:43', '2020-08-19 15:05:43');
INSERT INTO `edu_video_section` VALUES ('1295980279856390145', '1295979692880322562', '1295979788812443650', '4.3 设置文本风格', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:05:52', '2020-08-19 15:06:00');
INSERT INTO `edu_video_section` VALUES ('1295980355685212161', '1295979692880322562', '1295979788812443650', '4.4 设置文本的阴影', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:06:10', '2020-08-19 15:06:14');
INSERT INTO `edu_video_section` VALUES ('1295980413122011137', '1295979692880322562', '1295979788812443650', '4.5 控制换行', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:06:23', '2020-08-19 15:06:23');
INSERT INTO `edu_video_section` VALUES ('1295980451843825665', '1295979692880322562', '1295979814045376513', '5.1 页文字列表设计', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:06:33', '2020-08-19 15:06:33');
INSERT INTO `edu_video_section` VALUES ('1295980478360215553', '1295979692880322562', '1295979814045376513', '5.2 网页段落格式设计', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:06:39', '2020-08-19 15:06:39');
INSERT INTO `edu_video_section` VALUES ('1295980515840516097', '1295979692880322562', '1295979834882678786', '6.1 网页中的图像', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:06:48', '2020-08-19 15:06:48');
INSERT INTO `edu_video_section` VALUES ('1295980554323255297', '1295979692880322562', '1295979834882678786', '6.2 在网页中插入图像', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:06:57', '2020-08-19 15:06:57');
INSERT INTO `edu_video_section` VALUES ('1295980575563210754', '1295979692880322562', '1295979834882678786', '6.3 网页图片的编辑', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:07:02', '2020-08-19 15:07:02');
INSERT INTO `edu_video_section` VALUES ('1295980604491325441', '1295979692880322562', '1295979834882678786', '6.4 将图片设置为网页背景', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:07:09', '2020-08-19 15:07:09');
INSERT INTO `edu_video_section` VALUES ('1295980628751179778', '1295979692880322562', '1295979834882678786', '6.5 制作图片滑动动画', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:07:15', '2020-08-19 15:07:15');
INSERT INTO `edu_video_section` VALUES ('1295980655355650050', '1295979692880322562', '1295979860988026882', '7.1 网页超链接的概念', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:07:21', '2020-08-19 15:07:21');
INSERT INTO `edu_video_section` VALUES ('1295980689472118786', '1295979692880322562', '1295979860988026882', '7.2 超链接的类型及URL', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:07:29', '2020-08-19 15:07:29');
INSERT INTO `edu_video_section` VALUES ('1295980714856046593', '1295979692880322562', '1295979860988026882', '7.3 创建锚点超链接', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:07:35', '2020-08-19 15:07:35');
INSERT INTO `edu_video_section` VALUES ('1295980739480805378', '1295979692880322562', '1295979860988026882', '7.4 创建图片热区超链接', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:07:41', '2020-08-19 15:07:41');
INSERT INTO `edu_video_section` VALUES ('1295980768228564994', '1295979692880322562', '1295979860988026882', '7.5 综合案例 制作简易电子书网页', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:07:48', '2020-08-19 15:07:48');
INSERT INTO `edu_video_section` VALUES ('1295980790441598977', '1295979692880322562', '1295979878838984705', '8.1 认识表单', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:07:53', '2020-08-19 15:07:59');
INSERT INTO `edu_video_section` VALUES ('1295980854299877377', '1295979692880322562', '1295979878838984705', '8.2 nput表单元素的创建', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:08:08', '2020-08-19 15:08:08');
INSERT INTO `edu_video_section` VALUES ('1295980884565975041', '1295979692880322562', '1295979878838984705', '8.3 input表单元素的属性', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:08:16', '2020-08-19 15:08:16');
INSERT INTO `edu_video_section` VALUES ('1295980912181272578', '1295979692880322562', '1295979878838984705', '8.4 正则表达式编辑', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:08:22', '2020-08-19 15:08:22');
INSERT INTO `edu_video_section` VALUES ('1295980936801837057', '1295979692880322562', '1295979904873029633', '9.1 表格的基本结构', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:08:28', '2020-08-19 15:08:28');
INSERT INTO `edu_video_section` VALUES ('1295980969861341186', '1295979692880322562', '1295979904873029633', '9.2 表格的合并与拆分', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:08:36', '2020-08-19 15:08:36');
INSERT INTO `edu_video_section` VALUES ('1295980994054086657', '1295979692880322562', '1295979904873029633', '9.3 制作推荐表', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:08:42', '2020-08-19 15:08:42');
INSERT INTO `edu_video_section` VALUES ('1295981020125880322', '1295979692880322562', '1295979904873029633', '9.4 带标题与表头的表格', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:08:48', '2020-08-19 15:08:48');
INSERT INTO `edu_video_section` VALUES ('1295981048013807618', '1295979692880322562', '1295979904873029633', '9.5 结构化表格制作', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:08:55', '2020-08-19 15:08:55');
INSERT INTO `edu_video_section` VALUES ('1295991541130616833', '1295991115257765890', '1295991182828003329', '1.1 CSS3 简介', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:50:36', '2020-08-19 15:50:36');
INSERT INTO `edu_video_section` VALUES ('1295991619614433281', '1295991115257765890', '1295991182828003329', '1.2 CSS3 边框', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:50:55', '2020-08-19 15:50:55');
INSERT INTO `edu_video_section` VALUES ('1295991790968528898', '1295991115257765890', '1295991182828003329', '1.3 CSS3 圆角', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:51:36', '2020-08-19 15:51:36');
INSERT INTO `edu_video_section` VALUES ('1295991829115723778', '1295991115257765890', '1295991182828003329', '1.4 CSS3 背景', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:51:45', '2020-08-19 15:51:45');
INSERT INTO `edu_video_section` VALUES ('1295991868647038977', '1295991115257765890', '1295991182828003329', '1.5 CSS3 渐变（Gradients）', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:51:55', '2020-08-19 15:51:55');
INSERT INTO `edu_video_section` VALUES ('1295992091687542785', '1295991115257765890', '1295992044749086722', '2.1 CSS3 文本效果', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:52:48', '2020-08-19 15:52:48');
INSERT INTO `edu_video_section` VALUES ('1295992146179940353', '1295991115257765890', '1295992044749086722', '2.2 CSS3 字体', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:53:01', '2020-08-19 15:53:01');
INSERT INTO `edu_video_section` VALUES ('1295992181579866113', '1295991115257765890', '1295992044749086722', '2.3 CSS3 2D 转换', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:53:09', '2020-08-19 15:53:09');
INSERT INTO `edu_video_section` VALUES ('1295992224298852354', '1295991115257765890', '1295992044749086722', '2.4 CSS3 3D 转换', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:53:19', '2020-08-19 15:53:19');
INSERT INTO `edu_video_section` VALUES ('1295992260730576897', '1295991115257765890', '1295992044749086722', '2.5 CSS3 过渡', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:53:28', '2020-08-19 15:53:28');
INSERT INTO `edu_video_section` VALUES ('1295992348072763394', '1295991115257765890', '1295992314421862401', '3.1 CSS3 动画', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:53:49', '2020-08-19 15:53:49');
INSERT INTO `edu_video_section` VALUES ('1295992406461669378', '1295991115257765890', '1295992314421862401', '3.2 CSS3 多列', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:54:03', '2020-08-19 15:54:03');
INSERT INTO `edu_video_section` VALUES ('1295992444579504130', '1295991115257765890', '1295992314421862401', '3.3 CSS3 用户界面', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:54:12', '2020-08-19 15:54:12');
INSERT INTO `edu_video_section` VALUES ('1295992483263569921', '1295991115257765890', '1295992314421862401', '3.4 CSS 图片', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:54:21', '2020-08-19 15:54:21');
INSERT INTO `edu_video_section` VALUES ('1295992530772451330', '1295991115257765890', '1295992314421862401', '3.5 CSS 按钮', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:54:32', '2020-08-19 15:54:32');
INSERT INTO `edu_video_section` VALUES ('1295992641451745282', '1295991115257765890', '1295992594404237314', '4.1 CSS 分页实例', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:54:59', '2020-08-19 15:54:59');
INSERT INTO `edu_video_section` VALUES ('1295992690965504002', '1295991115257765890', '1295992594404237314', '4.2 CSS3 框大小', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:55:11', '2020-08-19 15:55:11');
INSERT INTO `edu_video_section` VALUES ('1295992772913815554', '1295991115257765890', '1295992594404237314', '4.3 CSS3 弹性盒子(Flex Box)', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:55:30', '2020-08-19 15:55:30');
INSERT INTO `edu_video_section` VALUES ('1295992806422110209', '1295991115257765890', '1295992594404237314', '4.4 CSS3 多媒体查询', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:55:38', '2020-08-19 15:55:38');
INSERT INTO `edu_video_section` VALUES ('1295992837090861058', '1295991115257765890', '1295992594404237314', '4.5 CSS3 多媒体查询实例', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 15:55:45', '2020-08-19 15:55:45');
INSERT INTO `edu_video_section` VALUES ('1295997162273923073', '1295996835592167426', '1295996876721512449', '1.1 JavaScript简介', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:12:57', '2020-08-19 16:12:57');
INSERT INTO `edu_video_section` VALUES ('1295997223535927297', '1295996835592167426', '1295996876721512449', '1.2 HBuilder的快速开发', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:13:11', '2020-08-19 16:13:11');
INSERT INTO `edu_video_section` VALUES ('1295997251927171074', '1295996835592167426', '1295996876721512449', '1.3 JavaScript的使用方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:13:18', '2020-08-19 16:13:18');
INSERT INTO `edu_video_section` VALUES ('1295997278233845762', '1295996835592167426', '1295996876721512449', '1.4 JavaScript实现商品详情展示', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:13:24', '2020-08-19 16:13:24');
INSERT INTO `edu_video_section` VALUES ('1295997643566112769', '1295996835592167426', '1295997391941427201', '2.1 JavaScript 数据类型', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:14:51', '2020-08-19 16:14:51');
INSERT INTO `edu_video_section` VALUES ('1295997701862744066', '1295996835592167426', '1295997391941427201', '2.2 复合数据类型-json 的遍历', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:15:05', '2020-08-19 16:15:05');
INSERT INTO `edu_video_section` VALUES ('1295997756288032769', '1295996835592167426', '1295997391941427201', '2.3 数据类型的自动转换', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:15:18', '2020-08-19 16:15:18');
INSERT INTO `edu_video_section` VALUES ('1295997819026432001', '1295996835592167426', '1295997391941427201', '2.4 JavaScript 变量', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:15:33', '2020-08-19 16:15:33');
INSERT INTO `edu_video_section` VALUES ('1295997847975518210', '1295996835592167426', '1295997391941427201', '2.5 JavaScript 函数', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:15:40', '2020-08-19 16:15:40');
INSERT INTO `edu_video_section` VALUES ('1295997899158609921', '1295996835592167426', '1295997391941427201', '2.6 函数的使用实现点亮灯泡', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:15:52', '2020-08-19 16:15:52');
INSERT INTO `edu_video_section` VALUES ('1295997938383740930', '1295996835592167426', '1295997391941427201', '2.7 if...else...语句', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:16:02', '2020-08-19 16:16:02');
INSERT INTO `edu_video_section` VALUES ('1295997970528886786', '1295996835592167426', '1295997391941427201', '2.8 switch.语句', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:16:09', '2020-08-19 16:16:09');
INSERT INTO `edu_video_section` VALUES ('1295998033678327809', '1295996835592167426', '1295997391941427201', '2.9 循环语句', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:16:24', '2020-08-19 16:16:24');
INSERT INTO `edu_video_section` VALUES ('1295998249903087617', '1295996835592167426', '1295998202553589762', '3.1 新建 JavaScript 数组', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:17:16', '2020-08-19 16:17:16');
INSERT INTO `edu_video_section` VALUES ('1295998312746344449', '1295996835592167426', '1295998202553589762', '3.2 数组对象的常用属性与方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:17:31', '2020-08-19 16:17:31');
INSERT INTO `edu_video_section` VALUES ('1295998367280685058', '1295996835592167426', '1295998202553589762', '3.3 随机点名器的实现', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:17:44', '2020-08-19 16:17:44');
INSERT INTO `edu_video_section` VALUES ('1295998400994500610', '1295996835592167426', '1295998202553589762', '3.4 字符串对象常用的属性与方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:17:52', '2020-08-19 16:17:52');
INSERT INTO `edu_video_section` VALUES ('1295998449115750401', '1295996835592167426', '1295998202553589762', '3.5 input 控件常用方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:18:03', '2020-08-19 16:18:03');
INSERT INTO `edu_video_section` VALUES ('1295998476391309314', '1295996835592167426', '1295998202553589762', '3.6 正则表达式实现表单严谨验证', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:18:10', '2020-08-19 16:18:10');
INSERT INTO `edu_video_section` VALUES ('1295998738891825154', '1295996835592167426', '1295998696344805378', '4.1 认识浏览器对象模型及窗口操作', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:19:13', '2020-08-19 16:19:13');
INSERT INTO `edu_video_section` VALUES ('1295998771171188738', '1295996835592167426', '1295998696344805378', '4.2 window子对象', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:19:20', '2020-08-19 16:19:20');
INSERT INTO `edu_video_section` VALUES ('1295998800271269889', '1295996835592167426', '1295998696344805378', '4.3 初识文档对象模型及DOM节点访问', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:19:27', '2020-08-19 16:19:27');
INSERT INTO `edu_video_section` VALUES ('1295998834333212673', '1295996835592167426', '1295998696344805378', '4.4 DOM 优化及DOM 事件处理', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:19:35', '2020-08-19 16:19:35');
INSERT INTO `edu_video_section` VALUES ('1295998866964897794', '1295996835592167426', '1295998696344805378', '4.5 DOM拓展', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:19:43', '2020-08-19 16:19:43');
INSERT INTO `edu_video_section` VALUES ('1296002880347594754', '1296002590860926978', '1296002835887972354', '1.1 Vue.js 安装', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:35:40', '2020-08-19 16:35:40');
INSERT INTO `edu_video_section` VALUES ('1296002920780685313', '1296002590860926978', '1296002835887972354', '1.2 Vue.js 目录结构', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:35:50', '2020-08-19 16:35:50');
INSERT INTO `edu_video_section` VALUES ('1296003134769881089', '1296002590860926978', '1296002835887972354', '1.3 Vue.js 起步', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:36:41', '2020-08-19 16:36:41');
INSERT INTO `edu_video_section` VALUES ('1296003358229815298', '1296002590860926978', '1296003294249902082', '2.1 Vue.js 模板语法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:37:34', '2020-08-19 16:37:34');
INSERT INTO `edu_video_section` VALUES ('1296003424327852034', '1296002590860926978', '1296003294249902082', '2.2 Vue.js 条件与循环', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:37:50', '2020-08-19 16:37:50');
INSERT INTO `edu_video_section` VALUES ('1296003474261041154', '1296002590860926978', '1296003294249902082', '2.3 Vue.js 循环语句', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:38:02', '2020-08-19 16:38:08');
INSERT INTO `edu_video_section` VALUES ('1296003635288760321', '1296002590860926978', '1296003294249902082', '2.4 Vue.js 计算属性', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:38:40', '2020-08-19 16:38:40');
INSERT INTO `edu_video_section` VALUES ('1296003666033008641', '1296002590860926978', '1296003294249902082', '2.5 Vue.js 监听属性', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:38:47', '2020-08-19 16:38:47');
INSERT INTO `edu_video_section` VALUES ('1296003699583246337', '1296002590860926978', '1296003294249902082', '2.6 Vue.js 样式绑定', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:38:55', '2020-08-19 16:38:55');
INSERT INTO `edu_video_section` VALUES ('1296003736585396226', '1296002590860926978', '1296003294249902082', '2.7 Vue.js 事件处理器', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:39:04', '2020-08-19 16:39:04');
INSERT INTO `edu_video_section` VALUES ('1296003778205474817', '1296002590860926978', '1296003294249902082', '2.8 Vue.js 表单', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:39:14', '2020-08-19 16:39:14');
INSERT INTO `edu_video_section` VALUES ('1296003879598579713', '1296002590860926978', '1296003837286440962', '3.1 Vue.js 组件', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:39:38', '2020-08-19 16:39:38');
INSERT INTO `edu_video_section` VALUES ('1296003917175349249', '1296002590860926978', '1296003837286440962', '3.2 Vue.js 组件 - 自定义事件', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:39:47', '2020-08-19 16:39:47');
INSERT INTO `edu_video_section` VALUES ('1296003951736414209', '1296002590860926978', '1296003837286440962', '3.3 Vue.js 自定义指令', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:39:55', '2020-08-19 16:39:55');
INSERT INTO `edu_video_section` VALUES ('1296003984191938562', '1296002590860926978', '1296003837286440962', '3.4 Vue.js 路由', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:40:03', '2020-08-19 16:40:03');
INSERT INTO `edu_video_section` VALUES ('1296004027640733697', '1296002590860926978', '1296003837286440962', '3.5 Vue.js 过渡 & 动画', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:40:13', '2020-08-19 16:40:13');
INSERT INTO `edu_video_section` VALUES ('1296004073253789697', '1296002590860926978', '1296003837286440962', '3.6 Vue.js 混入', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:40:24', '2020-08-19 16:40:24');
INSERT INTO `edu_video_section` VALUES ('1296004113649131522', '1296002590860926978', '1296003837286440962', '3.6 Vue.js Ajax(axios)', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:40:34', '2020-08-19 16:40:34');
INSERT INTO `edu_video_section` VALUES ('1296004164916109313', '1296002590860926978', '1296003837286440962', '3.7 Vue.js 响应接口', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 16:40:46', '2020-08-19 16:40:46');
INSERT INTO `edu_video_section` VALUES ('1296068308063244289', '1296068074708946946', '1296068107260940290', '1.1 一头扎进MySQL-数据库系统概述', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:55:39', '2020-08-19 20:55:39');
INSERT INTO `edu_video_section` VALUES ('1296068327235407874', '1296068074708946946', '1296068107260940290', '1.2 风陵渡口见数模-数据模型', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:55:44', '2020-08-19 20:55:44');
INSERT INTO `edu_video_section` VALUES ('1296068343328952321', '1296068074708946946', '1296068107260940290', '1.3 如何成功撩到关系模型？-关系模型', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:55:47', '2020-08-19 20:55:47');
INSERT INTO `edu_video_section` VALUES ('1296068364703125506', '1296068074708946946', '1296068107260940290', '1.4 来自关系数据库的自我介绍-关系数据库设计', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:55:53', '2020-08-19 20:55:53');
INSERT INTO `edu_video_section` VALUES ('1296068386844856322', '1296068074708946946', '1296068151498264578', '2.1 一见MySQL“悟”终身-MySQL数据库简介', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:55:58', '2020-08-19 20:55:58');
INSERT INTO `edu_video_section` VALUES ('1296068404351881217', '1296068074708946946', '1296068151498264578', '2.2 WAMPServer最佳配置-WAMPServer软件包的安装与配置', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:02', '2020-08-19 20:56:02');
INSERT INTO `edu_video_section` VALUES ('1296068423716982786', '1296068074708946946', '1296068151498264578', '2.3 MySQL内心小秘密-MySQL的配置与管理', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:07', '2020-08-19 20:56:07');
INSERT INTO `edu_video_section` VALUES ('1296068442436161537', '1296068074708946946', '1296068151498264578', '2.4 MySQL实用Tip-MySQL客户端使用', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:11', '2020-08-19 20:56:11');
INSERT INTO `edu_video_section` VALUES ('1296068457585987585', '1296068074708946946', '1296068151498264578', '2.5 窥一例见全系-数据库设计案例', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:15', '2020-08-19 20:56:15');
INSERT INTO `edu_video_section` VALUES ('1296068477433434113', '1296068074708946946', '1296068173203787777', '3.1 实力Solo数据库- MySQL数据库操作', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:19', '2020-08-19 20:56:19');
INSERT INTO `edu_video_section` VALUES ('1296068494315507714', '1296068074708946946', '1296068173203787777', '3.2 数据特征的认识-数据类型', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:23', '2020-08-19 20:56:23');
INSERT INTO `edu_video_section` VALUES ('1296068521062584321', '1296068074708946946', '1296068173203787777', '3.3 测试你的数据库APM有多少-数据表操作', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:30', '2020-08-19 20:56:30');
INSERT INTO `edu_video_section` VALUES ('1296068542604529665', '1296068074708946946', '1296068173203787777', '3.4 数据表操作扎实基本功-修改数据表', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:35', '2020-08-19 20:56:35');
INSERT INTO `edu_video_section` VALUES ('1296068562561028097', '1296068074708946946', '1296068173203787777', '3.5 数据表操作深层武艺-记录操作', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:40', '2020-08-19 20:56:40');
INSERT INTO `edu_video_section` VALUES ('1296068587496165378', '1296068074708946946', '1296068173203787777', '3.6 数据表的目录-索引概念及操作', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:46', '2020-08-19 20:56:46');
INSERT INTO `edu_video_section` VALUES ('1296068612762652674', '1296068074708946946', '1296068173203787777', '3.7 “一例一课”-数据库及数据表案例', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:52', '2020-08-19 20:56:52');
INSERT INTO `edu_video_section` VALUES ('1296068634078105601', '1296068074708946946', '1296068205449596930', '4.1 使用Select的正确姿势-简单查询', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:56:57', '2020-08-19 20:57:05');
INSERT INTO `edu_video_section` VALUES ('1296068655066402817', '1296068074708946946', '1296068205449596930', '4.2 沙漠捞金-条件查询', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:02', '2020-08-19 20:57:02');
INSERT INTO `edu_video_section` VALUES ('1296068688159461377', '1296068074708946946', '1296068205449596930', '4.3“FBI式”多表链接查询-连接查询', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:10', '2020-08-19 20:57:10');
INSERT INTO `edu_video_section` VALUES ('1296068710141808642', '1296068074708946946', '1296068205449596930', '4.4 轻松搞定MySQL函数-MySQL常用函数', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:15', '2020-08-19 20:57:15');
INSERT INTO `edu_video_section` VALUES ('1296068733218869250', '1296068074708946946', '1296068205449596930', '4.5 排序及分组数据', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:20', '2020-08-19 20:57:20');
INSERT INTO `edu_video_section` VALUES ('1296068753213116418', '1296068074708946946', '1296068205449596930', '4.6 子查询', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:25', '2020-08-19 20:57:25');
INSERT INTO `edu_video_section` VALUES ('1296068774453071873', '1296068074708946946', '1296068205449596930', '4.7 认识优美的“句”-Limit和Union的用法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:30', '2020-08-19 20:57:30');
INSERT INTO `edu_video_section` VALUES ('1296068799220436993', '1296068074708946946', '1296068205449596930', '4.8 视图', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:36', '2020-08-19 20:57:36');
INSERT INTO `edu_video_section` VALUES ('1296068824151379970', '1296068074708946946', '1296068225410289666', '5.1 数据库“双雄”之常量变量-常量和变量', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:42', '2020-08-19 20:57:42');
INSERT INTO `edu_video_section` VALUES ('1296068845697519617', '1296068074708946946', '1296068225410289666', '5.2 把握运算符表达式诀窍-运算符与表达式', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:47', '2020-08-19 20:57:47');
INSERT INTO `edu_video_section` VALUES ('1296068883752439809', '1296068074708946946', '1296068225410289666', '5.3  If、case结构-条件结构', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:57:56', '2020-08-19 20:57:56');
INSERT INTO `edu_video_section` VALUES ('1296068903767658498', '1296068074708946946', '1296068225410289666', '5.4 循环结构', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:01', '2020-08-19 20:58:01');
INSERT INTO `edu_video_section` VALUES ('1296068923275366402', '1296068074708946946', '1296068225410289666', '5.5 “一例一成长”-循环操作数据库实例', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:06', '2020-08-19 20:58:06');
INSERT INTO `edu_video_section` VALUES ('1296068945761030145', '1296068074708946946', '1296068254573285377', '6.1 “小金库”的自述-存储程序介绍', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:11', '2020-08-19 20:58:11');
INSERT INTO `edu_video_section` VALUES ('1296068964073361410', '1296068074708946946', '1296068254573285377', '6.2 初识“小金库”-创建和调用存储过程', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:15', '2020-08-19 20:58:15');
INSERT INTO `edu_video_section` VALUES ('1296068982876426242', '1296068074708946946', '1296068254573285377', '6.3 再识“小金库”-创建和调用存储函数', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:20', '2020-08-19 20:58:20');
INSERT INTO `edu_video_section` VALUES ('1296069005844434946', '1296068074708946946', '1296068254573285377', '6.4 “小金库”也需要维护-管理存储例程', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:25', '2020-08-19 20:58:25');
INSERT INTO `edu_video_section` VALUES ('1296069025784156162', '1296068074708946946', '1296068254573285377', '6.5 “攒钱”途中趣事-在存储过程中使用游标和事务', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:30', '2020-08-19 20:58:30');
INSERT INTO `edu_video_section` VALUES ('1296069069371363330', '1296068074708946946', '1296068254573285377', '6.6 Biu, Biu, Biu-触发器', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:41', '2020-08-19 20:58:41');
INSERT INTO `edu_video_section` VALUES ('1296069093908041730', '1296068074708946946', '1296068254573285377', '6.7 任务好助手事件定时-用事件定时执行任务', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:46', '2020-08-19 20:58:46');
INSERT INTO `edu_video_section` VALUES ('1296069114904727554', '1296068074708946946', '1296068254573285377', '6.8 实战补缺-课程管理系统中的存储程序', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:58:51', '2020-08-19 20:58:51');
INSERT INTO `edu_video_section` VALUES ('1296069159909609473', '1296068074708946946', '1296068273598648321', '7.1 制作自己的“身份证”-用户管理', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:59:02', '2020-08-19 20:59:20');
INSERT INTO `edu_video_section` VALUES ('1296069177907367938', '1296068074708946946', '1296068273598648321', '7.2 禁止偷窥他人秘密-权限管理', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:59:06', '2020-08-19 20:59:17');
INSERT INTO `edu_video_section` VALUES ('1296069207926001665', '1296068074708946946', '1296068273598648321', '7.3 数据保障与后悔药-备份与恢复', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:59:14', '2020-08-19 20:59:14');
INSERT INTO `edu_video_section` VALUES ('1296069265232777217', '1296068074708946946', '1296068273598648321', '7.4 万事有记录可查-日志文件管理', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:59:27', '2020-08-19 20:59:27');
INSERT INTO `edu_video_section` VALUES ('1296069287949127682', '1296068074708946946', '1296068273598648321', '7.5 基本活动-事务处理', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 20:59:33', '2020-08-19 20:59:33');
INSERT INTO `edu_video_section` VALUES ('1296071105823395842', '1296070682475515905', '1296070853259186178', '1.1 Redis 简介', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:06:46', '2020-08-19 21:06:46');
INSERT INTO `edu_video_section` VALUES ('1296071140648701953', '1296070682475515905', '1296070853259186178', '1.2 Redis 安装', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:06:54', '2020-08-19 21:06:54');
INSERT INTO `edu_video_section` VALUES ('1296071171858518018', '1296070682475515905', '1296070853259186178', '1.3 Redis 配置', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:07:02', '2020-08-19 21:07:02');
INSERT INTO `edu_video_section` VALUES ('1296071207002591233', '1296070682475515905', '1296070853259186178', '1.4 Redis 数据类型', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:07:10', '2020-08-19 21:07:10');
INSERT INTO `edu_video_section` VALUES ('1296071241752399873', '1296070682475515905', '1296070945865224194', '2.1 Redis 命令', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:07:19', '2020-08-19 21:07:19');
INSERT INTO `edu_video_section` VALUES ('1296071286476263425', '1296070682475515905', '1296070945865224194', '2.2 Redis 键(key)', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:07:29', '2020-08-19 21:07:29');
INSERT INTO `edu_video_section` VALUES ('1296071326418620417', '1296070682475515905', '1296070945865224194', '2.3 Redis 字符串(String)', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:07:39', '2020-08-19 21:07:39');
INSERT INTO `edu_video_section` VALUES ('1296071362074398722', '1296070682475515905', '1296070945865224194', '2.4 Redis 哈希(Hash)', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:07:47', '2020-08-19 21:07:47');
INSERT INTO `edu_video_section` VALUES ('1296071393053528066', '1296070682475515905', '1296070945865224194', '2.5 Redis 列表(List)', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:07:55', '2020-08-19 21:07:55');
INSERT INTO `edu_video_section` VALUES ('1296071423416094721', '1296070682475515905', '1296070945865224194', '2.6 Redis 集合(Set)', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:08:02', '2020-08-19 21:08:02');
INSERT INTO `edu_video_section` VALUES ('1296071465560461314', '1296070682475515905', '1296070945865224194', '2.7 Redis 有序集合(sorted set)', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:08:12', '2020-08-19 21:08:12');
INSERT INTO `edu_video_section` VALUES ('1296071497437171713', '1296070682475515905', '1296070945865224194', '2.8 Redis HyperLogLog', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:08:19', '2020-08-19 21:08:19');
INSERT INTO `edu_video_section` VALUES ('1296071761976119297', '1296070682475515905', '1296071015390007297', '3.1 Redis 发布订阅', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:09:23', '2020-08-19 21:09:23');
INSERT INTO `edu_video_section` VALUES ('1296071800257531906', '1296070682475515905', '1296071015390007297', '3.2 Redis 事务', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:09:32', '2020-08-19 21:09:32');
INSERT INTO `edu_video_section` VALUES ('1296071842510950402', '1296070682475515905', '1296071015390007297', '3.3 Redis 脚本', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:09:42', '2020-08-19 21:09:42');
INSERT INTO `edu_video_section` VALUES ('1296071885687115777', '1296070682475515905', '1296071015390007297', '3.4 Redis 连接', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:09:52', '2020-08-19 21:09:52');
INSERT INTO `edu_video_section` VALUES ('1296071927403663362', '1296070682475515905', '1296071015390007297', '3.5 Redis 服务器', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:10:02', '2020-08-19 21:10:02');
INSERT INTO `edu_video_section` VALUES ('1296071966670737410', '1296070682475515905', '1296071015390007297', '3.6 Redis GEO', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:10:11', '2020-08-19 21:10:11');
INSERT INTO `edu_video_section` VALUES ('1296072014116704257', '1296070682475515905', '1296071705378181121', '4.1 Redis 数据备份与恢复', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:10:23', '2020-08-19 21:10:23');
INSERT INTO `edu_video_section` VALUES ('1296072060723810306', '1296070682475515905', '1296071705378181121', '4.2 Redis 安全', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:10:34', '2020-08-19 21:10:34');
INSERT INTO `edu_video_section` VALUES ('1296072111210647553', '1296070682475515905', '1296071705378181121', '4.3 Redis 性能测试', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:10:46', '2020-08-19 21:10:46');
INSERT INTO `edu_video_section` VALUES ('1296072177782640642', '1296070682475515905', '1296071705378181121', '4.4 Redis 客户端连接', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:11:02', '2020-08-19 21:11:02');
INSERT INTO `edu_video_section` VALUES ('1296072209663545345', '1296070682475515905', '1296071705378181121', '4.5 Redis 管道技术', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:11:09', '2020-08-19 21:11:09');
INSERT INTO `edu_video_section` VALUES ('1296072241414426626', '1296070682475515905', '1296071705378181121', '4.6 Redis 分区', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:11:17', '2020-08-19 21:11:17');
INSERT INTO `edu_video_section` VALUES ('1296072289019777026', '1296070682475515905', '1296071705378181121', '4.7 Java 使用 Redis', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:11:28', '2020-08-19 21:11:28');
INSERT INTO `edu_video_section` VALUES ('1296075407442857985', '1296075223002533889', '1296075268988882945', '1.1 计算机的概念和类型', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:23:52', '2020-08-19 21:23:52');
INSERT INTO `edu_video_section` VALUES ('1296075425214124034', '1296075223002533889', '1296075268988882945', '1.2 计算机的诞生与发展', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:23:56', '2020-08-19 21:23:56');
INSERT INTO `edu_video_section` VALUES ('1296075448266018817', '1296075223002533889', '1296075268988882945', '1.3 计算机系统的层次结构', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:01', '2020-08-19 21:24:01');
INSERT INTO `edu_video_section` VALUES ('1296075464502169601', '1296075223002533889', '1296075268988882945', '1.4 计算机的性能评价指标', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:05', '2020-08-19 21:24:05');
INSERT INTO `edu_video_section` VALUES ('1296075483531726850', '1296075223002533889', '1296075296771952641', '2.1 数值型数据的表示', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:10', '2020-08-19 21:24:10');
INSERT INTO `edu_video_section` VALUES ('1296075499637854210', '1296075223002533889', '1296075296771952641', '2.2 字符型数据的表示', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:14', '2020-08-19 21:24:14');
INSERT INTO `edu_video_section` VALUES ('1296075516578648066', '1296075223002533889', '1296075296771952641', '2.3 数据处理与存储', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:18', '2020-08-19 21:24:18');
INSERT INTO `edu_video_section` VALUES ('1296075532550557697', '1296075223002533889', '1296075296771952641', '2.4 基本运算方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:22', '2020-08-19 21:24:22');
INSERT INTO `edu_video_section` VALUES ('1296075549432631297', '1296075223002533889', '1296075296771952641', '2.5 常用的数据校验方法', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:26', '2020-08-19 21:24:26');
INSERT INTO `edu_video_section` VALUES ('1296075579266715650', '1296075223002533889', '1296075317709918209', '3.1 CPU基本情况概述', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:33', '2020-08-19 21:24:33');
INSERT INTO `edu_video_section` VALUES ('1296075593556709377', '1296075223002533889', '1296075317709918209', '3.2 指令系统', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:36', '2020-08-19 21:24:36');
INSERT INTO `edu_video_section` VALUES ('1296075609436344321', '1296075223002533889', '1296075317709918209', '3.3 运算部件与运算器组织', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:40', '2020-08-19 21:24:40');
INSERT INTO `edu_video_section` VALUES ('1296075627249553409', '1296075223002533889', '1296075317709918209', '3.5.1 MIPS32架构CPU设计 - MIPS32指令架构', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:44', '2020-08-19 21:24:44');
INSERT INTO `edu_video_section` VALUES ('1296075650909622273', '1296075223002533889', '1296075317709918209', '3.5.2 MIPS32架构CPU设计 - 基本部件分析', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:50', '2020-08-19 21:24:50');
INSERT INTO `edu_video_section` VALUES ('1296075679657381890', '1296075223002533889', '1296075317709918209', '3.5.3 MIPS32架构CPU设计 - 单周期处理器设计', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:24:57', '2020-08-19 21:24:57');
INSERT INTO `edu_video_section` VALUES ('1296075701098663937', '1296075223002533889', '1296075317709918209', '3.5.5 MIPS32架构CPU设计 - 指令的时间特性分析', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:02', '2020-08-19 21:25:02');
INSERT INTO `edu_video_section` VALUES ('1296075718546968578', '1296075223002533889', '1296075317709918209', '3.6 提升CPU性能的高级技术', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:06', '2020-08-19 21:25:06');
INSERT INTO `edu_video_section` VALUES ('1296075747068235777', '1296075223002533889', '1296075341139300353', '4.1 存储系统概述', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:13', '2020-08-19 21:25:13');
INSERT INTO `edu_video_section` VALUES ('1296075766194262017', '1296075223002533889', '1296075341139300353', '4.2 半导体存储原理与芯片', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:17', '2020-08-19 21:25:17');
INSERT INTO `edu_video_section` VALUES ('1296075782975672322', '1296075223002533889', '1296075341139300353', '4.3 半导体存储器的组织逻辑', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:21', '2020-08-19 21:25:21');
INSERT INTO `edu_video_section` VALUES ('1296075802261082113', '1296075223002533889', '1296075341139300353', '4.4 磁存储原理与磁盘', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:26', '2020-08-19 21:25:26');
INSERT INTO `edu_video_section` VALUES ('1296075820426612737', '1296075223002533889', '1296075341139300353', '4.5 光存储原理与光盘', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:30', '2020-08-19 21:25:30');
INSERT INTO `edu_video_section` VALUES ('1296075841456852993', '1296075223002533889', '1296075341139300353', '4.6 计算机三级存储管理体系', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:35', '2020-08-19 21:25:35');
INSERT INTO `edu_video_section` VALUES ('1296075857697198081', '1296075223002533889', '1296075341139300353', '4.7 其它高性能存储系统介绍', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:39', '2020-08-19 21:25:39');
INSERT INTO `edu_video_section` VALUES ('1296075876961636354', '1296075223002533889', '1296075365768253442', '5.1 I/O子系统概述', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:44', '2020-08-19 21:25:44');
INSERT INTO `edu_video_section` VALUES ('1296075896045719554', '1296075223002533889', '1296075365768253442', '5.2 总线', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:48', '2020-08-19 21:25:48');
INSERT INTO `edu_video_section` VALUES ('1296075916627169282', '1296075223002533889', '1296075365768253442', '5.3 程序传送模式(PIO)', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:53', '2020-08-19 21:25:53');
INSERT INTO `edu_video_section` VALUES ('1296075934197108738', '1296075223002533889', '1296075365768253442', '5.4 中断模式', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:25:57', '2020-08-19 21:25:57');
INSERT INTO `edu_video_section` VALUES ('1296075952660434945', '1296075223002533889', '1296075365768253442', '5.5 DMA模式', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:26:02', '2020-08-19 21:26:02');
INSERT INTO `edu_video_section` VALUES ('1296075970003881986', '1296075223002533889', '1296075365768253442', '5.6 IOP与PPU模式', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:26:06', '2020-08-19 21:26:06');
INSERT INTO `edu_video_section` VALUES ('1296075990413365249', '1296075223002533889', '1296075382763573249', '6.1 输入/输出设备概述', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:26:11', '2020-08-19 21:26:11');
INSERT INTO `edu_video_section` VALUES ('1296076010936094721', '1296075223002533889', '1296075382763573249', '6.2 键盘及其工作原理', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:26:16', '2020-08-19 21:26:16');
INSERT INTO `edu_video_section` VALUES ('1296076033161711617', '1296075223002533889', '1296075382763573249', '6.3 显示器件', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:26:21', '2020-08-19 21:26:21');
INSERT INTO `edu_video_section` VALUES ('1296076051197218817', '1296075223002533889', '1296075382763573249', '6.4 打印设备', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:26:25', '2020-08-19 21:26:25');
INSERT INTO `edu_video_section` VALUES ('1296078520417538049', '1296078367702929410', '1296078404315009026', '1.1 云计算概述', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:14', '2020-08-19 21:36:14');
INSERT INTO `edu_video_section` VALUES ('1296078536544636930', '1296078367702929410', '1296078404315009026', '1.2 云计算数据中心', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:18', '2020-08-19 21:36:18');
INSERT INTO `edu_video_section` VALUES ('1296078557327413249', '1296078367702929410', '1296078421931085825', '2.1 虚拟化技术', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:23', '2020-08-19 21:36:23');
INSERT INTO `edu_video_section` VALUES ('1296078573731336193', '1296078367702929410', '1296078421931085825', '2.2 虚拟化实验', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:27', '2020-08-19 21:36:27');
INSERT INTO `edu_video_section` VALUES ('1296078586951782401', '1296078367702929410', '1296078421931085825', '2.3 云安全', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:30', '2020-08-19 21:36:30');
INSERT INTO `edu_video_section` VALUES ('1296078605272502273', '1296078367702929410', '1296078437508730882', '3.1 云服务概述', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:34', '2020-08-19 21:36:34');
INSERT INTO `edu_video_section` VALUES ('1296078622460760066', '1296078367702929410', '1296078437508730882', '3.2 IaaS及案例分析', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:38', '2020-08-19 21:36:38');
INSERT INTO `edu_video_section` VALUES ('1296078648054403074', '1296078367702929410', '1296078437508730882', '3.3 PaaS及案例分析', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:44', '2020-08-19 21:36:44');
INSERT INTO `edu_video_section` VALUES ('1296078665569816578', '1296078367702929410', '1296078437508730882', '3.4 SaaS及案例分析', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:49', '2020-08-19 21:36:49');
INSERT INTO `edu_video_section` VALUES ('1296078681642389505', '1296078367702929410', '1296078437508730882', '3.5 主流云平台人工智能服务', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:52', '2020-08-19 21:36:52');
INSERT INTO `edu_video_section` VALUES ('1296078700399316993', '1296078367702929410', '1296078453568720897', '4.1 OpenStack云计算管理平台', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:36:57', '2020-08-19 21:36:57');
INSERT INTO `edu_video_section` VALUES ('1296078720305483778', '1296078367702929410', '1296078453568720897', '4.2 OpenStack实验', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:37:02', '2020-08-19 21:37:02');
INSERT INTO `edu_video_section` VALUES ('1296078737015590913', '1296078367702929410', '1296078453568720897', '4.3 Docker容器技术', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:37:06', '2020-08-19 21:37:06');
INSERT INTO `edu_video_section` VALUES ('1296078753285296129', '1296078367702929410', '1296078453568720897', '4.4 Docker实验', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:37:09', '2020-08-19 21:37:09');
INSERT INTO `edu_video_section` VALUES ('1296078772671369217', '1296078367702929410', '1296078469788094465', '5.1 Google云计算', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:37:14', '2020-08-19 21:37:14');
INSERT INTO `edu_video_section` VALUES ('1296078790224531458', '1296078367702929410', '1296078469788094465', '5.2 Amazon云计算', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:37:18', '2020-08-19 21:37:18');
INSERT INTO `edu_video_section` VALUES ('1296078807769305090', '1296078367702929410', '1296078469788094465', '5.3 微软云计算', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:37:22', '2020-08-19 21:37:22');
INSERT INTO `edu_video_section` VALUES ('1296078823753797634', '1296078367702929410', '1296078469788094465', '5.4 国内云计算', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:37:26', '2020-08-19 21:37:26');
INSERT INTO `edu_video_section` VALUES ('1296078841025941506', '1296078367702929410', '1296078486921826306', '6.1 Hadoop 2.0 平台', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:37:30', '2020-08-19 21:37:30');
INSERT INTO `edu_video_section` VALUES ('1296078862874071041', '1296078367702929410', '1296078486921826306', '6.2 Spark分布式计算框架', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-19 21:37:36', '2020-08-19 21:37:36');
INSERT INTO `edu_video_section` VALUES ('1296466835813711873', '1296081833624096769', '1296466751826968577', 'video', 'b186fb51bc9a44459b8bd7a2ebd1bcd5', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-08-20 23:19:16', '2020-08-20 23:19:16');

SET FOREIGN_KEY_CHECKS = 1;
