/*
 Navicat Premium Data Transfer

 Source Server         : my_aliyun
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 101.200.164.127:3306
 Source Schema         : xueliedu_acl

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 31/08/2020 14:47:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('1', '0', '全部数据', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195268474480156673', '1', '权限管理', 1, NULL, '/acl', 'Layout', 'tree-table', NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1195268474480156673', '用户管理', 1, NULL, 'user/list', '/acl/user/list', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1195268474480156673', '角色管理', 1, NULL, 'role/list', '/acl/role/list', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1195268474480156673', '菜单管理', 1, NULL, 'menu/list', '/acl/menu/list', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', 2, 'user.list', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', 2, 'user.add', 'user/add', '/acl/user/form', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', 2, 'user.update', 'user/update/:id', '/acl/user/form', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', 2, 'user.remove', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', 2, 'role.update', 'role/update/:id', '/acl/role/form', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', 2, 'role.list', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', 2, 'role.add', 'role/add', '/acl/role/form', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', 2, 'role.remove', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', 2, 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', 2, 'permission.list', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', 2, 'permission.add', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', 2, 'permission.update', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', 2, 'permission.remove', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195349439240048642', '1', '讲师管理', 1, NULL, '/teacher', 'Layout', 'users', NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195349699995734017', '1195349439240048642', '讲师列表', 1, NULL, 'table', '/edu/teacher/list', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195349810561781761', '1195349439240048642', '添加讲师', 1, NULL, 'save', '/edu/teacher/save', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195349876252971010', '1195349810561781761', '添加', 2, 'teacher.add', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195349979797753857', '1195349699995734017', '查看', 2, 'teacher.list', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195350117270261762', '1195349699995734017', '修改', 2, 'teacher.update', 'edit/:id', '/edu/teacher/save', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195350188359520258', '1195349699995734017', '删除', 2, 'teacher.remove', '', '', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195350299365969922', '1', '学科管理', 1, NULL, '/subject', 'Layout', 'education', NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195350397751758850', '1195350299365969922', '学科列表', 1, NULL, 'list', '/edu/subject/list', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195350500512206850', '1195350299365969922', '学科创编', 1, NULL, 'import', '/edu/subject/save', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195350831744782337', '1', '课程管理', 1, 'Course', '/course', 'Layout', 'task', NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195350919074385921', '1195350831744782337', '课程列表', 1, 'CourseList', 'list', '/edu/course/list', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195351020463296513', '1195350831744782337', '课程发布', 1, 'CourseInfo', 'info', '/edu/course/form', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195351326706208770', '1195350919074385921', '课程编辑', 2, 'CourseEditInfo', 'info/:id', '/edu/course/form', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195351566221938690', '1195350919074385921', '课程大纲', 2, 'CourseChapterEdit', 'chapter/:id', '/edu/course/form', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195351862889254913', '1', 'Banner管理', 1, NULL, '/banner', 'Layout', 'component', NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195351968841568257', '1195351862889254913', 'Banner列表', 1, NULL, 'table', '/edu/banner/list', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195352054917074946', '1195351862889254913', 'Banner编辑', 1, NULL, 'save', '/edu/banner/save', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195352127734386690', '1195351968841568257', 'Banner编辑', 2, 'banner.update', 'edit/:id', '/edu/banner/save', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195352547621965825', '1', '统计管理', 1, NULL, '/statistics', 'Layout', 'chart', NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195352856645701633', '1195352547621965825', '统计生成', 1, '', 'create', '/edu/statistics/create', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195352909401657346', '1195352547621965825', '统计图表', 1, '', 'chart', '/edu/statistics/chart', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195353051395624961', '1', '考试管理', 1, '', '/exam', 'Layout', 'exam', NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195353513549205505', '1195353051395624961', '试卷列表', 1, NULL, 'table', '/ems/exam/list', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195353672110673921', '1195353051395624961', '试卷创编', 1, '', 'save', '/ems/exam/save', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195354076890370050', '1195353513549205505', '试卷编辑', 2, 'exam.update', 'edit/:id', '/ems/exam/save', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195354153482555393', '1', '题库管理', 1, NULL, '/question', 'Layout', 'question', NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1195354315093282817', '1195354153482555393', '题目列表', 1, '', 'table', '/ems/question/list', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195354153482555393', '题目创编', 1, '', 'save', '/ems/question/save', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');
INSERT INTO `acl_permission` VALUES ('1282921728302515656', '1195268616021139457', '分配角色', 2, 'user.assgin', 'user/role/:id', '/acl/user/roleForm', NULL, NULL, 0, '2020-08-31 09:56:24', '2020-08-31 09:56:27');
INSERT INTO `acl_permission` VALUES ('1282923230251728898', '1195354315093282817', '修改题目', 2, 'question.update', 'edit/:questionType/:id', '/ems/question/save', NULL, NULL, 0, '2020-08-30 20:59:06', '2020-08-30 20:59:06');

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES ('1300052815783145473', '权限管理员', NULL, NULL, 0, '2020-08-30 20:48:40', '2020-08-30 20:49:35');
INSERT INTO `acl_role` VALUES ('1300252341416607745', '试卷管理员', NULL, NULL, 0, '2020-08-31 10:01:30', '2020-08-31 10:01:30');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `permission_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES ('1300052903507013634', '1300052815783145473', '1', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903515402241', '1300052815783145473', '1195268474480156673', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903515402242', '1300052815783145473', '1195268616021139457', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903523790849', '1300052815783145473', '1195269143060602882', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903523790850', '1300052815783145473', '1195269295926206466', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903523790851', '1300052815783145473', '1195269473479483394', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903523790852', '1300052815783145473', '1195269547269873666', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903532179457', '1300052815783145473', '1195268788138598401', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903532179458', '1300052815783145473', '1195269821262782465', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903532179459', '1300052815783145473', '1195269903542444034', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903532179460', '1300052815783145473', '1195270037005197313', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903532179461', '1300052815783145473', '1195270442602782721', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903532179462', '1300052815783145473', '1195270621548568578', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903532179463', '1300052815783145473', '1195268893830864898', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903532179464', '1300052815783145473', '1195270744097742849', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903540568065', '1300052815783145473', '1195270810560684034', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903540568066', '1300052815783145473', '1195270862100291586', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300052903540568067', '1300052815783145473', '1195270887933009922', 0, '2020-08-30 20:49:01', '2020-08-30 20:49:01');
INSERT INTO `acl_role_permission` VALUES ('1300073633732898818', '1300071744962310146', '1', 0, '2020-08-30 22:11:23', '2020-08-30 22:11:23');
INSERT INTO `acl_role_permission` VALUES ('1300073633741287426', '1300071744962310146', '1195353051395624961', 0, '2020-08-30 22:11:23', '2020-08-30 22:11:23');
INSERT INTO `acl_role_permission` VALUES ('1300073633741287427', '1300071744962310146', '1195353513549205505', 0, '2020-08-30 22:11:23', '2020-08-30 22:11:23');
INSERT INTO `acl_role_permission` VALUES ('1300073633741287428', '1300071744962310146', '1195354076890370050', 0, '2020-08-30 22:11:23', '2020-08-30 22:11:23');
INSERT INTO `acl_role_permission` VALUES ('1300073633741287429', '1300071744962310146', '1195353672110673921', 0, '2020-08-30 22:11:23', '2020-08-30 22:11:23');
INSERT INTO `acl_role_permission` VALUES ('1300252406055026690', '1300252341416607745', '1', 0, '2020-08-31 10:01:46', '2020-08-31 10:01:46');
INSERT INTO `acl_role_permission` VALUES ('1300252406071803906', '1300252341416607745', '1195353051395624961', 0, '2020-08-31 10:01:46', '2020-08-31 10:01:46');
INSERT INTO `acl_role_permission` VALUES ('1300252406080192514', '1300252341416607745', '1195353513549205505', 0, '2020-08-31 10:01:46', '2020-08-31 10:01:46');
INSERT INTO `acl_role_permission` VALUES ('1300252406080192515', '1300252341416607745', '1195354076890370050', 0, '2020-08-31 10:01:46', '2020-08-31 10:01:46');
INSERT INTO `acl_role_permission` VALUES ('1300252406080192516', '1300252341416607745', '1195353672110673921', 0, '2020-08-31 10:01:46', '2020-08-31 10:01:46');
INSERT INTO `acl_role_permission` VALUES ('1300252406088581121', '1300252341416607745', '1195354153482555393', 0, '2020-08-31 10:01:46', '2020-08-31 10:01:46');
INSERT INTO `acl_role_permission` VALUES ('1300252406088581122', '1300252341416607745', '1195354315093282817', 0, '2020-08-31 10:01:46', '2020-08-31 10:01:46');
INSERT INTO `acl_role_permission` VALUES ('1300252406096969730', '1300252341416607745', '1282923230251728898', 0, '2020-08-31 10:01:46', '2020-08-31 10:01:46');
INSERT INTO `acl_role_permission` VALUES ('1300252406101164033', '1300252341416607745', '1196301740985311234', 0, '2020-08-31 10:01:46', '2020-08-31 10:01:46');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户头像',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'token',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', NULL, NULL, 0, '2020-08-30 15:31:56', '2020-08-30 15:32:00');
INSERT INTO `acl_user` VALUES ('1300054211601379330', 'tom', '96e79218965eb72c92a549dd5a330112', 'tom', NULL, NULL, 0, '2020-08-30 20:54:13', '2020-08-30 20:54:13');
INSERT INTO `acl_user` VALUES ('1300252454306299905', 'andy', '96e79218965eb72c92a549dd5a330112', 'andy', NULL, NULL, 0, '2020-08-31 10:01:57', '2020-08-31 10:01:57');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES ('1300054533765869569', '1300052815783145473', '1300054211601379330', 0, '2020-08-30 20:55:29', '2020-08-30 20:55:29');
INSERT INTO `acl_user_role` VALUES ('1300252478444519425', '1300252341416607745', '1300252454306299905', 0, '2020-08-31 10:02:03', '2020-08-31 10:02:03');

SET FOREIGN_KEY_CHECKS = 1;
