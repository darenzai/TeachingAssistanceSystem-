/*
 Navicat Premium Data Transfer

 Source Server         : my_aliyun
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 101.200.164.127:3306
 Source Schema         : xueliedu_ems

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 31/08/2020 14:48:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ems_answer
-- ----------------------------
DROP TABLE IF EXISTS `ems_answer`;
CREATE TABLE `ems_answer`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '答案id',
  `paper_id` int(19) DEFAULT NULL COMMENT '试卷编号',
  `member_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `question_id` int(9) DEFAULT NULL COMMENT '题目编号',
  `question_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '1是单选2是多选3是判断4是填空5是简答',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '答案',
  `number` int(1) DEFAULT NULL COMMENT '用户答题次数',
  `score` int(4) DEFAULT NULL COMMENT '该题得分',
  `gmt_create` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exam_id`(`paper_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_question_id`(`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ems_answer
-- ----------------------------
INSERT INTO `ems_answer` VALUES (1, 230, '1296102077461794818', 31, '1', 'C', 1, 2, '2020-08-26 22:10:58', '2020-08-26 22:10:58');
INSERT INTO `ems_answer` VALUES (2, 230, '1296102077461794818', 28, '1', 'D', 1, 2, '2020-08-26 22:10:58', '2020-08-26 22:10:58');
INSERT INTO `ems_answer` VALUES (3, 230, '1296102077461794818', 40, '1', 'C', 1, 2, '2020-08-26 22:10:58', '2020-08-26 22:10:58');
INSERT INTO `ems_answer` VALUES (4, 230, '1296102077461794818', 32, '1', 'C', 1, 2, '2020-08-26 22:10:58', '2020-08-26 22:10:58');
INSERT INTO `ems_answer` VALUES (5, 230, '1296102077461794818', 38, '1', 'D', 1, 2, '2020-08-26 22:10:58', '2020-08-26 22:10:58');
INSERT INTO `ems_answer` VALUES (6, 230, '1296102077461794818', 31, '1', 'D', 2, 0, '2020-08-26 22:15:28', '2020-08-26 22:15:28');
INSERT INTO `ems_answer` VALUES (7, 230, '1296102077461794818', 28, '1', 'D', 2, 2, '2020-08-26 22:15:28', '2020-08-26 22:15:28');
INSERT INTO `ems_answer` VALUES (8, 230, '1296102077461794818', 40, '1', 'D', 2, 0, '2020-08-26 22:15:28', '2020-08-26 22:15:28');
INSERT INTO `ems_answer` VALUES (9, 230, '1296102077461794818', 32, '1', 'D', 2, 0, '2020-08-26 22:15:28', '2020-08-26 22:15:28');
INSERT INTO `ems_answer` VALUES (10, 230, '1296102077461794818', 38, '1', 'D', 2, 2, '2020-08-26 22:15:28', '2020-08-26 22:15:28');
INSERT INTO `ems_answer` VALUES (21, 230, '1296102077461794818', 31, '1', 'C', 3, 2, '2020-08-26 22:35:05', '2020-08-26 22:35:05');
INSERT INTO `ems_answer` VALUES (22, 230, '1296102077461794818', 28, '1', 'C', 3, 0, '2020-08-26 22:35:05', '2020-08-26 22:35:05');
INSERT INTO `ems_answer` VALUES (23, 230, '1296102077461794818', 40, '1', 'C', 3, 2, '2020-08-26 22:35:05', '2020-08-26 22:35:05');
INSERT INTO `ems_answer` VALUES (24, 230, '1296102077461794818', 32, '1', 'C', 3, 2, '2020-08-26 22:35:05', '2020-08-26 22:35:05');
INSERT INTO `ems_answer` VALUES (25, 230, '1296102077461794818', 38, '1', 'C', 3, 0, '2020-08-26 22:35:05', '2020-08-26 22:35:05');
INSERT INTO `ems_answer` VALUES (49, 268, '1296102077461794818', 25, '1', 'D', 1, 2, '2020-08-27 11:11:08', '2020-08-27 11:11:08');
INSERT INTO `ems_answer` VALUES (50, 268, '1296102077461794818', 22, '1', 'A', 1, 2, '2020-08-27 11:11:08', '2020-08-27 11:11:08');
INSERT INTO `ems_answer` VALUES (51, 268, '1296102077461794818', 27, '1', 'B', 1, 2, '2020-08-27 11:11:08', '2020-08-27 11:11:08');
INSERT INTO `ems_answer` VALUES (52, 268, '1296102077461794818', 19, '1', 'D', 1, 2, '2020-08-27 11:11:08', '2020-08-27 11:11:08');
INSERT INTO `ems_answer` VALUES (53, 268, '1296102077461794818', 21, '1', 'D', 1, 0, '2020-08-27 11:11:09', '2020-08-27 11:11:09');
INSERT INTO `ems_answer` VALUES (54, 268, '1296102077461794818', 33, '2', 'A,D', 1, 2, '2020-08-27 11:11:09', '2020-08-27 11:11:09');
INSERT INTO `ems_answer` VALUES (55, 268, '1296102077461794818', 30, '2', 'A,D', 1, 2, '2020-08-27 11:11:09', '2020-08-27 11:11:09');
INSERT INTO `ems_answer` VALUES (56, 268, '1296102077461794818', 29, '2', 'B,D', 1, 0, '2020-08-27 11:11:09', '2020-08-27 11:11:09');
INSERT INTO `ems_answer` VALUES (57, 268, '1296102077461794818', 26, '2', 'B,C', 1, 2, '2020-08-27 11:11:09', '2020-08-27 11:11:09');
INSERT INTO `ems_answer` VALUES (58, 268, '1296102077461794818', 24, '2', 'A,B,D', 1, 0, '2020-08-27 11:11:09', '2020-08-27 11:11:09');
INSERT INTO `ems_answer` VALUES (59, 268, '1296102077461794818', 25, '3', '1', 1, 2, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (60, 268, '1296102077461794818', 24, '3', '2', 1, 2, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (61, 268, '1296102077461794818', 23, '3', '1', 1, 2, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (62, 268, '1296102077461794818', 22, '3', '2', 1, 2, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (63, 268, '1296102077461794818', 21, '3', '2', 1, 2, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (64, 268, '1296102077461794818', 9, '4', '面向对象', 1, 2, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (65, 268, '1296102077461794818', 11, '4', '0', 1, 2, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (66, 268, '1296102077461794818', 10, '4', 'true、false', 1, 2, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (67, 268, '1296102077461794818', 8, '4', '类', 1, 2, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (68, 268, '1296102077461794818', 7, '4', '载体、实例', 1, 0, '2020-08-27 11:11:10', '2020-08-27 11:11:10');
INSERT INTO `ems_answer` VALUES (69, 268, '1296102077461794818', 12, '5', '<p>&amp;&amp;更强大</p>', 1, 0, '2020-08-27 11:11:11', '2020-08-27 11:11:11');
INSERT INTO `ems_answer` VALUES (70, 268, '1296102077461794818', 14, '5', '<p>程序、JVM、操作系统</p>', 1, 0, '2020-08-27 11:11:11', '2020-08-27 11:11:11');
INSERT INTO `ems_answer` VALUES (71, 268, '1296102077461794818', 10, '5', '<p>用abstract修饰的类</p>', 1, 0, '2020-08-27 11:11:11', '2020-08-27 11:11:11');
INSERT INTO `ems_answer` VALUES (72, 237, '1296102077461794818', 39, '2', 'A,D', 1, 2, '2020-08-27 11:24:10', '2020-08-27 11:24:10');
INSERT INTO `ems_answer` VALUES (73, 237, '1296102077461794818', 34, '2', 'C,D', 1, 0, '2020-08-27 11:24:10', '2020-08-27 11:24:10');
INSERT INTO `ems_answer` VALUES (74, 237, '1296102077461794818', 37, '2', 'A,B', 1, 0, '2020-08-27 11:24:10', '2020-08-27 11:24:10');
INSERT INTO `ems_answer` VALUES (75, 237, '1296102077461794818', 35, '2', 'D', 1, 0, '2020-08-27 11:24:10', '2020-08-27 11:24:10');
INSERT INTO `ems_answer` VALUES (76, 237, '1296102077461794818', 36, '2', 'A,B', 1, 2, '2020-08-27 11:24:10', '2020-08-27 11:24:10');
INSERT INTO `ems_answer` VALUES (77, 237, '1296102077461794818', 39, '2', 'A,D', 2, 2, '2020-08-27 11:34:35', '2020-08-27 11:34:35');
INSERT INTO `ems_answer` VALUES (78, 237, '1296102077461794818', 34, '2', 'C,D', 2, 0, '2020-08-27 11:34:35', '2020-08-27 11:34:35');
INSERT INTO `ems_answer` VALUES (79, 237, '1296102077461794818', 37, '2', 'B,C', 2, 0, '2020-08-27 11:34:35', '2020-08-27 11:34:35');
INSERT INTO `ems_answer` VALUES (80, 237, '1296102077461794818', 35, '2', 'A,D', 2, 2, '2020-08-27 11:34:35', '2020-08-27 11:34:35');
INSERT INTO `ems_answer` VALUES (81, 237, '1296102077461794818', 36, '2', 'A,B', 2, 2, '2020-08-27 11:34:35', '2020-08-27 11:34:35');

-- ----------------------------
-- Table structure for ems_choice_question
-- ----------------------------
DROP TABLE IF EXISTS `ems_choice_question`;
CREATE TABLE `ems_choice_question`  (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '试题ID',
  `subject_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '二级学科id',
  `subject_parent_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '一级学科id',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '问题题目',
  `answer_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选项A',
  `answer_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选项B',
  `answer_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选项C',
  `answer_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选项D',
  `right_key` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '正确答案',
  `score` int(2) DEFAULT NULL COMMENT '分数',
  `question_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型1为选择题, 2为多选题',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题目解析',
  `level` int(1) DEFAULT NULL COMMENT '难度级别',
  `gmt_create` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ems_choice_question
-- ----------------------------
INSERT INTO `ems_choice_question` VALUES (19, '1295951803136880641', '1295951801295581186', '关于sleep()和wait()，以下描述错误的一项是？', 'sleep是线程类（Thread）的方法，wait是Object类的方法；', 'sleep不释放对象锁，wait放弃对象锁；', 'sleep暂停线程、但监控状态仍然保持，结束后会自动恢复；', 'wait后进入等待锁定池，只有针对此对象发出notify方法后获得对象锁进入运行状态。', 'D', 2, '1', 'sleep是线程类（Thread）的方法，导致此线程暂停执行指定时间，给执行机会给其他线程，但是监控状态依然保持，到时后会自动恢复。调用sleep不会释放对象锁。  wait是Object类的方法，对此对象调用wait方法导致本线程放弃对象锁，进入等待此对象的等待锁定池，只有针对此对象发出notify方法（或notifyAll）后本线程才进入对象锁定池准备获得对象锁进入运行状态。', 3, '2020-08-21 20:52:49', '2020-08-21 20:53:47');
INSERT INTO `ems_choice_question` VALUES (20, '1295951803136880641', '1295951801295581186', '下面能让线程停止执行的有？', 'sleep();', 'stop();', 'notify();', 'synchronized();', 'A,B,D', 2, '2', 'sleep：导致此线程暂停执行指定时间，stop: 这个方法将终止所有未结束的方法，包括run方法。synchronized():对象锁，notify();为唤醒线程进行运行状态', 3, '2020-08-21 21:00:12', '2020-08-21 21:00:12');
INSERT INTO `ems_choice_question` VALUES (21, '1295951803136880641', '1295951801295581186', '下面哪个可以改变容器的布局？', 'setLayout(aLayoutManager);', 'addLayout(aLayoutManager);', 'layout(aLayoutManager);', 'setLayoutManager(aLayoutManager);', 'A', 2, '1', 'Java设置布局管理器setLayout()', 2, '2020-08-21 21:01:43', '2020-08-21 21:01:43');
INSERT INTO `ems_choice_question` VALUES (22, '1295951803136880641', '1295951801295581186', '提供Java存取数据库能力的包是？', 'java.sql', 'java.awt', 'java.lang', 'java.swing', 'A', 2, '1', 'java.sql是JDBC的编程接口  java.awt和java.swing是做图像界面的类库  java.lang: Java 编程语言进行程序设计的基础类', 2, '2020-08-21 21:03:26', '2020-08-21 21:03:26');
INSERT INTO `ems_choice_question` VALUES (23, '1295951803136880641', '1295951801295581186', '不能用来修饰interface的有？', 'private', 'public', 'protected', 'static', 'A,C,D', 2, '2', '修饰接口可以是public和默认', 2, '2020-08-21 21:04:43', '2020-08-21 21:04:43');
INSERT INTO `ems_choice_question` VALUES (24, '1295951803136880641', '1295951801295581186', '下列说法错误的有？', '在类方法中可用this来调用本类的类方法', '在类方法中调用本类的类方法时可直接调用', '在类方法中只能调用本类中的类方法', '在类方法中绝对不能调用实例方法', 'A,C,D', 2, '2', 'A.在类方法中不能使用this关键字  C.在类方法中可以调用其它类中的类方法  D.在类方法中可以通过实例化对象调用实例方法', 2, '2020-08-21 21:07:24', '2020-08-21 21:07:24');
INSERT INTO `ems_choice_question` VALUES (25, '1295951803136880641', '1295951801295581186', '给出如下声明：String s = “Example”;  合法的代码由哪些？', 's>>>=3', 's[3]= “X”', 'int i = s.iength()', 's = s +1', 'D', 2, '1', 'A. 移位运算，要是整数类型。  B．s不是数组  C．String类取长度的方法为：length()  D. 字符串相加', 1, '2020-08-21 21:10:36', '2020-08-21 21:10:36');
INSERT INTO `ems_choice_question` VALUES (26, '1295951803136880641', '1295951801295581186', '如下哪些不是java的关键字？', 'const', 'NULL', 'false', 'this', 'B,C', 2, '2', '虽然null false 还有true不是java的关键字，但是都有特殊用途，不建议作为标识符。', 1, '2020-08-21 21:11:33', '2020-08-21 21:11:33');
INSERT INTO `ems_choice_question` VALUES (27, '1295951803136880641', '1295951801295581186', '已知表达式 int m [ ] = {，1，2，3，4，5，6}；下面哪个表达式的值与数组下标量总数相等？', 'm.length()', 'm.length', 'm.length()+1', 'm.length+1', 'B', 2, '1', '数组下标是从零开始的，但是数据下标的总量和数据长度相同。', 1, '2020-08-21 21:13:04', '2020-08-21 21:13:04');
INSERT INTO `ems_choice_question` VALUES (28, '1295951803136880641', '1295951801295581186', '方法resume()负责恢复哪些线程的执行？', '通过调用stop()方法而停止的线程。', '通过调用sleep()方法而停止的线程。', '通过调用wait()方法而停止的线程。', '过调用suspend()方法而停止的线程。', 'D', 2, '1', 'Suspend可以挂起一个线程，就是把这个线程暂停了，它占着资源，但不运行，用Resume是恢复挂起的线程，  让这个线程继续执行下去。', 3, '2020-08-21 21:14:55', '2020-08-21 21:14:55');
INSERT INTO `ems_choice_question` VALUES (29, '1295951803136880641', '1295951801295581186', '有关线程的哪些叙述是对的？', '一旦一个线程被创建，它就立即开始运行。', '使用start()方法可以使一个线程成为可运行的，但是它不一定立即开始运行。', '当一个线程因为抢先机制而停止运行，它被放在可运行队列的前面。', '一个线程可能因为不同的原因停止并进入就绪状态。', 'B,C,D', 2, '2', '在抢占式线程模型中，操作系统可以在任何时候打断线程。通常会在它运行了一段时间（就是所谓的一个  时间片）后才打断它。这样的结果自然是没有线程能够不公平地长时间霸占处理器。', 3, '2020-08-21 21:18:27', '2020-08-21 21:18:27');
INSERT INTO `ems_choice_question` VALUES (30, '1295951803136880641', '1295951801295581186', '下面的哪些声明是合法的？', 'long 1 = 499', 'int i = 4L', 'float f =1.1', 'double d = 34.4', 'A,D', 2, '2', 'B.4L应该是long类型的写法，  C.1.1是double类型 ，float f=1.1f是正确写法', 1, '2020-08-21 21:24:13', '2020-08-21 21:24:13');
INSERT INTO `ems_choice_question` VALUES (31, '1295951803136880641', '1295951801295581186', '给出如下代码：（ ）  class Test{  private int m;  public static void fun() {  //some code„  }  }  如何使成员变量m被函数fun()直接访问？', '将private int m改为 protected int m', '将private int m改为 public int m', '将private int m改为 static int m', '将private int m改为int m', 'C', 2, '1', '静态的方法中可以直接调用静态数据成员', 1, '2020-08-21 21:25:35', '2020-08-21 21:25:35');
INSERT INTO `ems_choice_question` VALUES (32, '1295951803136880641', '1295951801295581186', '关于运算符>>和>>>描述正确的是？', '>>执行移动', '>>执行翻转', '>>执行有符号左移，>>>执行无符号左移', '>>执行无符号左移，>>>执行有符号左移', 'C', 2, '1', 'xxx', 3, '2020-08-21 21:27:32', '2020-08-21 21:27:32');
INSERT INTO `ems_choice_question` VALUES (33, '1295951803136880641', '1295951801295581186', '选择Java语言中的基本数据类型？', 'byte', 'Integer', 'String', 'char', 'A,D', 2, '2', '基本数据类型总共有8个：byte，short，int，long，char，boolean，float，double', 1, '2020-08-21 21:28:25', '2020-08-21 21:28:38');
INSERT INTO `ems_choice_question` VALUES (34, '1295951803136880641', '1295951801295581186', '从下列选项中选择正确的Java表达式？', 'int k=new String(“aa”)', 'String str=String(“bb”)', 'char c=74;', 'long j=8888;', 'B,C,D', 2, '2', 'A语法错误', 1, '2020-08-21 21:30:03', '2020-08-21 21:30:03');
INSERT INTO `ems_choice_question` VALUES (35, '1295951803136880641', '1295951801295581186', '关于Java语言，下列描述正确的是？', 'switch 不能够作用在String类型上', 'List， Set， Map都继承自Collection接口', 'Java语言支持goto语句', 'GC是垃圾收集器，程序员不用担心内存管理', 'A,D', 2, '2', 'B. Map没有继承Collection接口  C．java不支持goto语句', 2, '2020-08-21 21:32:32', '2020-08-21 21:32:32');
INSERT INTO `ems_choice_question` VALUES (36, '1295951803136880641', '1295951801295581186', '下列描述中，哪些符合Java语言的特征？', '支持跨平台(Windows，Linux，Unix等)', 'GC(自动垃圾回收)，提高了代码安全性', '支持类C的指针运算操作', '不支持与其它语言书写的程序进行通讯', 'A,B', 2, '2', 'xxx', 1, '2020-08-21 21:33:49', '2020-08-21 21:33:49');
INSERT INTO `ems_choice_question` VALUES (37, '1295951803136880641', '1295951801295581186', '关于异常(Exception)，下列描述正确的是？', '异常的基类为Exception，所有异常都必须直接或者间接继承它', '异常可以用try{ . . .}catch(Exception e){ . . .}来捕获并进行处理', '如果某异常继承RuntimeException，则该异常可以不被声明', '异常可以随便处理，而不是抛给外层的程序进行处理', 'A,B,C', 2, '2', 'xxx', 1, '2020-08-21 21:35:09', '2020-08-21 21:35:09');
INSERT INTO `ems_choice_question` VALUES (38, '1295951803136880641', '1295951801295581186', 'MAX_LENGTH 是int 型public 成员变量，变量值保持为常量1，用简短语句定义这个变量？', 'public int MAX_LENGTH=1;', 'final int MAX_LENGTH=1;', 'final public int MAX_LENGTH=1;', 'public final int MAX_LENGTH=1.', 'D', 2, '1', '通过题的描述就是定义常量，在java中常量命名规范是所有字母都大写用下划线分割每个单词', 1, '2020-08-21 21:36:54', '2020-08-21 21:36:54');
INSERT INTO `ems_choice_question` VALUES (39, '1295951803136880641', '1295951801295581186', 'String s=new String(\"hello\");  String t =new String(\"hello\");  char c [ ] ={\'h\'，\'e\'，\'l\'，\'l\'，\'o\'};  下列哪些表达式返回true ?', 's.equals(t);', 't.equals(c);', 's == t；', 't.equals (new String(\"hello\"));', 'A,D', 2, '2', 'AD String类的equals方法已经覆盖了Object类的equals方法，比较的是两个字符串的内容是否  相等，双等号比较的是两个对象的内存地址是否相等', 3, '2020-08-21 21:39:24', '2020-08-21 21:39:24');
INSERT INTO `ems_choice_question` VALUES (40, '1295951803136880641', '1295951801295581186', '关于线程设计，下列描述正确的是？', '线程对象必须实现Runnable接口', '启动一个线程直接调用线程对象的run()方法', 'Java提供对多线程同步提供语言级的支持', '一个线程可以包含多个进程', 'C', 2, '1', '实现线程有3种方法，一个进程可以包含多个线程', 2, '2020-08-21 21:43:07', '2020-08-21 21:43:07');

-- ----------------------------
-- Table structure for ems_exam_manage
-- ----------------------------
DROP TABLE IF EXISTS `ems_exam_manage`;
CREATE TABLE `ems_exam_manage`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试id',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `teacher_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出卷老师ID',
  `paper_id` int(19) DEFAULT NULL COMMENT '试卷id',
  `type` int(4) DEFAULT NULL COMMENT '如果是1表示是期中或者期末考试，如果是2表示是一个章节的测试',
  `course_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '章节ID',
  `total_score` int(4) DEFAULT NULL COMMENT '考试总分',
  `total_time` int(3) DEFAULT NULL COMMENT '考试时长',
  `is_deleted` tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `stop_time` datetime(0) DEFAULT NULL COMMENT '试卷截止时间',
  `gmt_create` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE,
  INDEX `idx_paper_id`(`paper_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ems_exam_manage
-- ----------------------------
INSERT INTO `ems_exam_manage` VALUES ('1297027602317352961', '第一章单元测试', '1295957488608227329', 230, 2, '1295958589541724162', '1295959138454482945', 10, 15, 0, '2020-08-31 00:00:00', '2020-08-22 12:27:33', '2020-08-22 12:27:33');
INSERT INTO `ems_exam_manage` VALUES ('1297027881825771521', '第二章单元测试', '1295957488608227329', 237, 2, '1295958589541724162', '1295959167458095105', 10, 15, 0, '2020-08-31 00:00:00', '2020-08-22 12:28:39', '2020-08-22 12:28:39');
INSERT INTO `ems_exam_manage` VALUES ('1297028269723394050', '第三章单元测试', '1295957488608227329', 244, 2, '1295958589541724162', '1295959186219216898', 10, 15, 0, '2020-08-31 00:00:00', '2020-08-22 12:30:12', '2020-08-22 12:30:12');
INSERT INTO `ems_exam_manage` VALUES ('1297028612007960577', '第四章单元测试', '1295957488608227329', 251, 2, '1295958589541724162', '1295959207568224257', 10, 15, 0, '2020-08-31 00:00:00', '2020-08-22 12:31:33', '2020-08-22 12:31:33');
INSERT INTO `ems_exam_manage` VALUES ('1297028931873972226', '第五章单元测试', '1295957488608227329', 258, 2, '1295958589541724162', '1295959226778136578', 10, 15, 0, '2020-08-31 00:00:00', '2020-08-22 12:32:50', '2020-08-22 12:32:50');
INSERT INTO `ems_exam_manage` VALUES ('1297029730440093698', '期中考试', '1295957488608227329', 268, 1, '1295958589541724162', '', 100, 60, 0, '2020-08-31 00:00:00', '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_exam_manage` VALUES ('1297030534869852161', '期末考试', '1295957488608227329', 297, 1, '1295958589541724162', '', 100, 60, 0, '2020-08-31 00:00:00', '2020-08-22 12:39:12', '2020-08-22 12:39:12');

-- ----------------------------
-- Table structure for ems_fill_question
-- ----------------------------
DROP TABLE IF EXISTS `ems_fill_question`;
CREATE TABLE `ems_fill_question`  (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '试题ID',
  `subject_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '二级学科ID',
  `subject_parent_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '一级学科ID',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '填空题目',
  `question_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题目类型, 填空题该数据为4',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '正确答案',
  `score` int(2) DEFAULT NULL COMMENT '分数',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '解析',
  `level` int(1) DEFAULT NULL COMMENT '难度级别',
  `gmt_create` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ems_fill_question
-- ----------------------------
INSERT INTO `ems_fill_question` VALUES (6, '1295951803136880641', '1295951801295581186', '面向对象程序设计的三个特征是___,___,___?', '4', '封装、多态、继承', 2, '', 2, '2020-08-21 22:12:22', '2020-08-21 22:12:22');
INSERT INTO `ems_fill_question` VALUES (7, '1295951803136880641', '1295951801295581186', 'Java是面向对象语言，类是客观事物的___，而对象是类的___?', '4', '抽象、实例', 2, '', 2, '2020-08-21 22:13:18', '2020-08-21 22:13:18');
INSERT INTO `ems_fill_question` VALUES (8, '1295951803136880641', '1295951801295581186', '___是Java程序中基本的结构单位?', '4', '类', 2, '', 2, '2020-08-21 22:14:04', '2020-08-21 22:14:04');
INSERT INTO `ems_fill_question` VALUES (9, '1295951803136880641', '1295951801295581186', 'Java语言是一种完全的___程序设计语言?', '4', '面向对象', 2, '', 1, '2020-08-21 22:14:30', '2020-08-21 22:14:30');
INSERT INTO `ems_fill_question` VALUES (10, '1295951803136880641', '1295951801295581186', '布尔型常量有两个值，它们分别___和___?', '4', 'true、false', 2, '', 1, '2020-08-21 22:15:04', '2020-08-21 22:15:04');
INSERT INTO `ems_fill_question` VALUES (11, '1295951803136880641', '1295951801295581186', '表达式1/2*9的计算结果是___?', '4', '0', 2, '', 1, '2020-08-21 22:15:39', '2020-08-21 22:15:39');
INSERT INTO `ems_fill_question` VALUES (12, '1295951803136880641', '1295951801295581186', '表达式“b”+10的值为___，‘b\'+10的值为___?', '4', 'b10、108', 2, '', 3, '2020-08-21 22:16:27', '2020-08-21 22:16:27');
INSERT INTO `ems_fill_question` VALUES (13, '1295951803136880641', '1295951801295581186', 'Java中用于定义整形变量的关键字有四个：byte、___、___、long?', '4', 'short、int', 2, '', 4, '2020-08-21 22:17:05', '2020-08-21 22:17:10');
INSERT INTO `ems_fill_question` VALUES (14, '1295951803136880641', '1295951801295581186', '在Java语言中，简单数据类型包括：___、___、___和___?', '4', '整数类型、浮点类型、字符类型、布尔类型。', 2, '', 3, '2020-08-21 22:18:29', '2020-08-21 22:18:29');
INSERT INTO `ems_fill_question` VALUES (15, '1295951803136880641', '1295951801295581186', 'Java源程序文件和字节码文件的扩展名分别为___和___?', '4', '.java、.class', 2, '', 2, '2020-08-21 22:19:11', '2020-08-21 22:19:11');
INSERT INTO `ems_fill_question` VALUES (16, '1295951803136880641', '1295951801295581186', 'this指___，super指___?', '4', '当前对象、父对象', 2, '', 2, '2020-08-21 22:19:36', '2020-08-21 22:19:36');

-- ----------------------------
-- Table structure for ems_judge_question
-- ----------------------------
DROP TABLE IF EXISTS `ems_judge_question`;
CREATE TABLE `ems_judge_question`  (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '二级学科ID',
  `subject_parent_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '一级学科ID',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题目内容',
  `question_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题目类型值为3',
  `answer` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '正确答案T为正确, F为错误',
  `score` int(2) DEFAULT NULL COMMENT '分数',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '解析',
  `level` int(1) DEFAULT NULL COMMENT '难度级别',
  `gmt_create` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ems_judge_question
-- ----------------------------
INSERT INTO `ems_judge_question` VALUES (8, '1295951803136880641', '1295951801295581186', '在Java的方法中定义一个常量要用const关键字？', '3', '2', 2, '在java中定义常量用final。', 1, '2020-08-21 21:51:01', '2020-08-21 21:51:01');
INSERT INTO `ems_judge_question` VALUES (9, '1295951803136880641', '1295951801295581186', '抽象方法必须在抽象类中，所以抽象类中的方法都必须是抽象方法？', '3', '2', 2, '抽象类中必须要有抽象方法，但是同时也可以有非抽象方法。', 1, '2020-08-21 21:51:40', '2020-08-21 21:51:40');
INSERT INTO `ems_judge_question` VALUES (10, '1295951803136880641', '1295951801295581186', '用final修饰的变量叫常量？', '3', '1', 2, '', 1, '2020-08-21 21:52:01', '2020-08-21 21:52:01');
INSERT INTO `ems_judge_question` VALUES (11, '1295951803136880641', '1295951801295581186', '描述对象的两个要素是属性和方法？', '3', '1', 2, '', 1, '2020-08-21 21:52:22', '2020-08-21 21:52:22');
INSERT INTO `ems_judge_question` VALUES (12, '1295951803136880641', '1295951801295581186', '接口是特殊的类，所以接口也可以继承，子接口将继承父接口的所有常量和抽象方法？', '3', '1', 2, '', 1, '2020-08-21 21:56:28', '2020-08-21 21:56:28');
INSERT INTO `ems_judge_question` VALUES (13, '1295951803136880641', '1295951801295581186', 'Java支持多重继承？', '3', '2', 2, '是单继承。一个类最多只能够有一个基类，用extends实现。', 1, '2020-08-21 21:56:57', '2020-08-21 21:56:57');
INSERT INTO `ems_judge_question` VALUES (14, '1295951803136880641', '1295951801295581186', 'final修饰的类能派生子类？', '3', '2', 2, 'Final是最终类，不能再派生。', 1, '2020-08-21 21:57:30', '2020-08-21 21:57:30');
INSERT INTO `ems_judge_question` VALUES (15, '1295951803136880641', '1295951801295581186', '覆盖的同名方法中，子类方法不能比父类方法的访问权限低？', '3', '1', 2, '', 1, '2020-08-21 21:58:02', '2020-08-21 21:58:02');
INSERT INTO `ems_judge_question` VALUES (16, '1295951803136880641', '1295951801295581186', '抽象类中能创建对象？', '3', '2', 2, '抽象类中需要先实现，有继承的父子关系，才能进行对象', 2, '2020-08-21 21:59:18', '2020-08-21 21:59:18');
INSERT INTO `ems_judge_question` VALUES (17, '1295951803136880641', '1295951801295581186', '一个类可以实现多接口？', '3', '1', 2, '', 1, '2020-08-21 21:59:37', '2020-08-21 21:59:37');
INSERT INTO `ems_judge_question` VALUES (18, '1295951803136880641', '1295951801295581186', 'Unicode码与ASCII码相同？', '3', '2', 2, 'ASCII不支持中文字符编码，UNICODE支持中文字符编码', 3, '2020-08-21 22:00:13', '2020-08-21 22:00:13');
INSERT INTO `ems_judge_question` VALUES (19, '1295951803136880641', '1295951801295581186', 'Java语言是编译解释型语言？', '3', '1', 2, '', 1, '2020-08-21 22:00:34', '2020-08-21 22:00:34');
INSERT INTO `ems_judge_question` VALUES (20, '1295951803136880641', '1295951801295581186', 'Java语言支持类的继承,但只支持类的单继承？', '3', '1', 2, '', 1, '2020-08-21 22:00:50', '2020-08-21 22:00:50');
INSERT INTO `ems_judge_question` VALUES (21, '1295951803136880641', '1295951801295581186', '抽象方法没有方法体？', '3', '2', 2, '可以有方法体。', 2, '2020-08-21 22:01:15', '2020-08-21 22:01:15');
INSERT INTO `ems_judge_question` VALUES (22, '1295951803136880641', '1295951801295581186', '方法的重载是指子类和父类具有相同的名字、相同的参数表，但返回类型可以不相同？', '3', '2', 2, '不是子类和父类之间吧。', 3, '2020-08-21 22:02:09', '2020-08-21 22:02:09');
INSERT INTO `ems_judge_question` VALUES (23, '1295951803136880641', '1295951801295581186', '在Java中声明变量时必须指定一个类型？', '3', '1', 2, '', 3, '2020-08-21 22:02:20', '2020-08-21 22:02:20');
INSERT INTO `ems_judge_question` VALUES (24, '1295951803136880641', '1295951801295581186', 'Java中，一个类可以有多个直接父类？', '3', '2', 2, '不可以，是单继承。', 1, '2020-08-21 22:02:35', '2020-08-21 22:02:35');
INSERT INTO `ems_judge_question` VALUES (25, '1295951803136880641', '1295951801295581186', 'package语句必须放在程序的第一句？', '3', '1', 2, '', 1, '2020-08-21 22:02:47', '2020-08-21 22:02:47');
INSERT INTO `ems_judge_question` VALUES (26, '1295951803136880641', '1295951801295581186', '一个Java类可以有一个直接父类，并可以实现多个接口？', '3', '1', 2, '', 1, '2020-08-21 22:03:08', '2020-08-21 22:03:08');
INSERT INTO `ems_judge_question` VALUES (27, '1295951803136880641', '1295951801295581186', '接口中可以包含非静态成员变量？', '3', '2', 2, '接口中的变量默认都是public final 类型的', 3, '2020-08-21 22:03:48', '2020-08-21 22:03:48');
INSERT INTO `ems_judge_question` VALUES (28, '1295951803136880641', '1295951801295581186', '不论是否捕捉到异常try{}catch ){} finaly{}语句中finally块中的代码总要被执行？', '3', '1', 2, '理论上是没问题的，但是要是在catch中终止程序，比如exit就不会执行finally但是这个情况偏少', 2, '2020-08-21 22:05:04', '2020-08-21 22:05:04');
INSERT INTO `ems_judge_question` VALUES (29, '1295951803136880641', '1295951801295581186', 'final类中的属性和方法都必须是final的？', '3', '2', 2, '只是为了说明他不可派生。', 2, '2020-08-21 22:05:29', '2020-08-21 22:05:29');
INSERT INTO `ems_judge_question` VALUES (30, '1295951803136880641', '1295951801295581186', '在方法定义中，可能发生的异常都必须用try{} catch ){}捕捉？', '3', '2', 2, '还可以在方法上使用throws把异常抛出来', 1, '2020-08-21 22:06:13', '2020-08-21 22:06:13');
INSERT INTO `ems_judge_question` VALUES (31, '1295951803136880641', '1295951801295581186', 'Java 程序一般应当含有 main 方法，因为它是所有 Java 程序执行的入口？', '3', '2', 2, 'Java程序也可以是applet程序，如果是applet，不用main方法。。。由init初始化，start启用。', 2, '2020-08-21 22:06:38', '2020-08-21 22:06:38');
INSERT INTO `ems_judge_question` VALUES (32, '1295951803136880641', '1295951801295581186', 'Java 语言的标识符是不区分大小写的？', '3', '1', 2, '', 3, '2020-08-21 22:06:50', '2020-08-21 22:06:50');
INSERT INTO `ems_judge_question` VALUES (33, '1295951803136880641', '1295951801295581186', '有时候为了避免引起混淆，构造方法的方法名可以不与所属类名同名？', '3', '2', 2, '构造方法必须是和类名相同', 2, '2020-08-21 22:07:55', '2020-08-21 22:07:55');
INSERT INTO `ems_judge_question` VALUES (34, '1295951803136880641', '1295951801295581186', '在java继承机制中，父类中的私有 private）成员不能被子类继承？', '3', '2', 2, '可以被继承，但是不能被访问。', 5, '2020-08-21 22:08:22', '2020-08-21 22:08:22');
INSERT INTO `ems_judge_question` VALUES (35, '1295951803136880641', '1295951801295581186', 'Java语言中，类的成员变量在整个类内都有效，其有效性与它在类体中的位置无关，方法中的局部变量的有效性与它在方法体中的位置无关？', '3', '2', 2, '方法体中的变量只在方法中有效，而且和位置有关。', 5, '2020-08-21 22:09:36', '2020-08-21 22:09:36');

-- ----------------------------
-- Table structure for ems_paper_manage
-- ----------------------------
DROP TABLE IF EXISTS `ems_paper_manage`;
CREATE TABLE `ems_paper_manage`  (
  `id` int(19) NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `parent_id` int(19) DEFAULT NULL COMMENT '0表示为父试卷，其他表示为是该试卷的子题目',
  `level` int(5) DEFAULT NULL COMMENT '级别，为1表示是一个总的试卷，为2表示是试卷下的一个标题，为3表示是标题下的题目',
  `name` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `question_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题目类型,0选择，1多选题，2为判断，3为填空，4为简答。',
  `question_id` int(9) DEFAULT NULL COMMENT '题目id',
  `gmt_create` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_question_id`(`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 326 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ems_paper_manage
-- ----------------------------
INSERT INTO `ems_paper_manage` VALUES (230, 0, 1, NULL, NULL, NULL, '2020-08-22 12:27:32', '2020-08-22 12:27:32');
INSERT INTO `ems_paper_manage` VALUES (231, 230, 2, '单选题', NULL, NULL, '2020-08-22 12:27:32', '2020-08-22 12:27:32');
INSERT INTO `ems_paper_manage` VALUES (232, 231, 3, NULL, '1', 31, '2020-08-22 12:27:32', '2020-08-22 12:27:32');
INSERT INTO `ems_paper_manage` VALUES (233, 231, 3, NULL, '1', 28, '2020-08-22 12:27:32', '2020-08-22 12:27:32');
INSERT INTO `ems_paper_manage` VALUES (234, 231, 3, NULL, '1', 40, '2020-08-22 12:27:32', '2020-08-22 12:27:32');
INSERT INTO `ems_paper_manage` VALUES (235, 231, 3, NULL, '1', 32, '2020-08-22 12:27:32', '2020-08-22 12:27:32');
INSERT INTO `ems_paper_manage` VALUES (236, 231, 3, NULL, '1', 38, '2020-08-22 12:27:32', '2020-08-22 12:27:32');
INSERT INTO `ems_paper_manage` VALUES (237, 0, 1, NULL, NULL, NULL, '2020-08-22 12:28:39', '2020-08-22 12:28:39');
INSERT INTO `ems_paper_manage` VALUES (238, 237, 2, '多选题', NULL, NULL, '2020-08-22 12:28:39', '2020-08-22 12:28:39');
INSERT INTO `ems_paper_manage` VALUES (239, 238, 3, NULL, '2', 39, '2020-08-22 12:28:39', '2020-08-22 12:28:39');
INSERT INTO `ems_paper_manage` VALUES (240, 238, 3, NULL, '2', 34, '2020-08-22 12:28:39', '2020-08-22 12:28:39');
INSERT INTO `ems_paper_manage` VALUES (241, 238, 3, NULL, '2', 37, '2020-08-22 12:28:39', '2020-08-22 12:28:39');
INSERT INTO `ems_paper_manage` VALUES (242, 238, 3, NULL, '2', 35, '2020-08-22 12:28:39', '2020-08-22 12:28:39');
INSERT INTO `ems_paper_manage` VALUES (243, 238, 3, NULL, '2', 36, '2020-08-22 12:28:39', '2020-08-22 12:28:39');
INSERT INTO `ems_paper_manage` VALUES (244, 0, 1, NULL, NULL, NULL, '2020-08-22 12:30:11', '2020-08-22 12:30:11');
INSERT INTO `ems_paper_manage` VALUES (245, 244, 2, '判断题', NULL, NULL, '2020-08-22 12:30:11', '2020-08-22 12:30:11');
INSERT INTO `ems_paper_manage` VALUES (246, 245, 3, NULL, '3', 33, '2020-08-22 12:30:11', '2020-08-22 12:30:11');
INSERT INTO `ems_paper_manage` VALUES (247, 245, 3, NULL, '3', 35, '2020-08-22 12:30:12', '2020-08-22 12:30:12');
INSERT INTO `ems_paper_manage` VALUES (248, 245, 3, NULL, '3', 32, '2020-08-22 12:30:12', '2020-08-22 12:30:12');
INSERT INTO `ems_paper_manage` VALUES (249, 245, 3, NULL, '3', 31, '2020-08-22 12:30:12', '2020-08-22 12:30:12');
INSERT INTO `ems_paper_manage` VALUES (250, 245, 3, NULL, '3', 34, '2020-08-22 12:30:12', '2020-08-22 12:30:12');
INSERT INTO `ems_paper_manage` VALUES (251, 0, 1, NULL, NULL, NULL, '2020-08-22 12:31:33', '2020-08-22 12:31:33');
INSERT INTO `ems_paper_manage` VALUES (252, 251, 2, '填空题', NULL, NULL, '2020-08-22 12:31:33', '2020-08-22 12:31:33');
INSERT INTO `ems_paper_manage` VALUES (253, 252, 3, NULL, '4', 13, '2020-08-22 12:31:33', '2020-08-22 12:31:33');
INSERT INTO `ems_paper_manage` VALUES (254, 252, 3, NULL, '4', 14, '2020-08-22 12:31:33', '2020-08-22 12:31:33');
INSERT INTO `ems_paper_manage` VALUES (255, 252, 3, NULL, '4', 16, '2020-08-22 12:31:33', '2020-08-22 12:31:33');
INSERT INTO `ems_paper_manage` VALUES (256, 252, 3, NULL, '4', 12, '2020-08-22 12:31:33', '2020-08-22 12:31:33');
INSERT INTO `ems_paper_manage` VALUES (257, 252, 3, NULL, '4', 15, '2020-08-22 12:31:33', '2020-08-22 12:31:33');
INSERT INTO `ems_paper_manage` VALUES (258, 0, 1, NULL, NULL, NULL, '2020-08-22 12:32:49', '2020-08-22 12:32:49');
INSERT INTO `ems_paper_manage` VALUES (259, 258, 2, '单选题', NULL, NULL, '2020-08-22 12:32:49', '2020-08-22 12:32:49');
INSERT INTO `ems_paper_manage` VALUES (260, 259, 3, NULL, '1', 31, '2020-08-22 12:32:49', '2020-08-22 12:32:49');
INSERT INTO `ems_paper_manage` VALUES (261, 259, 3, NULL, '1', 28, '2020-08-22 12:32:49', '2020-08-22 12:32:49');
INSERT INTO `ems_paper_manage` VALUES (262, 258, 2, '多选题', NULL, NULL, '2020-08-22 12:32:49', '2020-08-22 12:32:49');
INSERT INTO `ems_paper_manage` VALUES (263, 262, 3, NULL, '2', 39, '2020-08-22 12:32:49', '2020-08-22 12:32:49');
INSERT INTO `ems_paper_manage` VALUES (264, 258, 2, '判断题', NULL, NULL, '2020-08-22 12:32:49', '2020-08-22 12:32:49');
INSERT INTO `ems_paper_manage` VALUES (265, 264, 3, NULL, '3', 35, '2020-08-22 12:32:49', '2020-08-22 12:32:49');
INSERT INTO `ems_paper_manage` VALUES (266, 258, 2, '填空题', NULL, NULL, '2020-08-22 12:32:50', '2020-08-22 12:32:50');
INSERT INTO `ems_paper_manage` VALUES (267, 266, 3, NULL, '4', 16, '2020-08-22 12:32:50', '2020-08-22 12:32:50');
INSERT INTO `ems_paper_manage` VALUES (268, 0, 1, NULL, NULL, NULL, '2020-08-22 12:35:58', '2020-08-22 12:35:58');
INSERT INTO `ems_paper_manage` VALUES (269, 268, 2, '选择题', NULL, NULL, '2020-08-22 12:35:58', '2020-08-22 12:35:58');
INSERT INTO `ems_paper_manage` VALUES (270, 269, 3, NULL, '1', 25, '2020-08-22 12:35:58', '2020-08-22 12:35:58');
INSERT INTO `ems_paper_manage` VALUES (271, 269, 3, NULL, '1', 22, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (272, 269, 3, NULL, '1', 27, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (273, 269, 3, NULL, '1', 19, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (274, 269, 3, NULL, '1', 21, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (275, 268, 2, '多选题', NULL, NULL, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (276, 275, 3, NULL, '2', 33, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (277, 275, 3, NULL, '2', 30, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (278, 275, 3, NULL, '2', 29, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (279, 275, 3, NULL, '2', 26, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (280, 275, 3, NULL, '2', 24, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (281, 268, 2, '判断题', NULL, NULL, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (282, 281, 3, NULL, '3', 25, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (283, 281, 3, NULL, '3', 24, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (284, 281, 3, NULL, '3', 23, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (285, 281, 3, NULL, '3', 22, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (286, 281, 3, NULL, '3', 21, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (287, 268, 2, '填空题', NULL, NULL, '2020-08-22 12:35:59', '2020-08-22 12:35:59');
INSERT INTO `ems_paper_manage` VALUES (288, 287, 3, NULL, '4', 9, '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_paper_manage` VALUES (289, 287, 3, NULL, '4', 11, '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_paper_manage` VALUES (290, 287, 3, NULL, '4', 10, '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_paper_manage` VALUES (291, 287, 3, NULL, '4', 8, '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_paper_manage` VALUES (292, 287, 3, NULL, '4', 7, '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_paper_manage` VALUES (293, 268, 2, '简答题', NULL, NULL, '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_paper_manage` VALUES (294, 293, 3, NULL, '5', 12, '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_paper_manage` VALUES (295, 293, 3, NULL, '5', 14, '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_paper_manage` VALUES (296, 293, 3, NULL, '5', 10, '2020-08-22 12:36:00', '2020-08-22 12:36:00');
INSERT INTO `ems_paper_manage` VALUES (297, 0, 1, NULL, NULL, NULL, '2020-08-22 12:39:10', '2020-08-22 12:39:10');
INSERT INTO `ems_paper_manage` VALUES (298, 297, 2, '选择题', NULL, NULL, '2020-08-22 12:39:10', '2020-08-22 12:39:10');
INSERT INTO `ems_paper_manage` VALUES (299, 298, 3, NULL, '1', 32, '2020-08-22 12:39:10', '2020-08-22 12:39:10');
INSERT INTO `ems_paper_manage` VALUES (300, 298, 3, NULL, '1', 38, '2020-08-22 12:39:10', '2020-08-22 12:39:10');
INSERT INTO `ems_paper_manage` VALUES (301, 298, 3, NULL, '1', 21, '2020-08-22 12:39:10', '2020-08-22 12:39:10');
INSERT INTO `ems_paper_manage` VALUES (302, 298, 3, NULL, '1', 22, '2020-08-22 12:39:10', '2020-08-22 12:39:10');
INSERT INTO `ems_paper_manage` VALUES (303, 298, 3, NULL, '1', 27, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (304, 297, 2, '多选题', NULL, NULL, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (305, 304, 3, NULL, '2', 37, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (306, 304, 3, NULL, '2', 36, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (307, 304, 3, NULL, '2', 23, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (308, 304, 3, NULL, '2', 20, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (309, 304, 3, NULL, '2', 24, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (310, 297, 2, '判断题', NULL, NULL, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (311, 310, 3, NULL, '3', 29, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (312, 310, 3, NULL, '3', 30, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (313, 310, 3, NULL, '3', 28, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (314, 310, 3, NULL, '3', 27, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (315, 310, 3, NULL, '3', 26, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (316, 297, 2, '填空题', NULL, NULL, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (317, 316, 3, NULL, '4', 11, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (318, 316, 3, NULL, '4', 10, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (319, 316, 3, NULL, '4', 8, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (320, 316, 3, NULL, '4', 9, '2020-08-22 12:39:11', '2020-08-22 12:39:11');
INSERT INTO `ems_paper_manage` VALUES (321, 316, 3, NULL, '4', 7, '2020-08-22 12:39:12', '2020-08-22 12:39:12');
INSERT INTO `ems_paper_manage` VALUES (322, 297, 2, '简答题', NULL, NULL, '2020-08-22 12:39:12', '2020-08-22 12:39:12');
INSERT INTO `ems_paper_manage` VALUES (323, 322, 3, NULL, '5', 28, '2020-08-22 12:39:12', '2020-08-22 12:39:12');
INSERT INTO `ems_paper_manage` VALUES (324, 322, 3, NULL, '5', 27, '2020-08-22 12:39:12', '2020-08-22 12:39:12');
INSERT INTO `ems_paper_manage` VALUES (325, 322, 3, NULL, '5', 29, '2020-08-22 12:39:12', '2020-08-22 12:39:12');

-- ----------------------------
-- Table structure for ems_score_manage
-- ----------------------------
DROP TABLE IF EXISTS `ems_score_manage`;
CREATE TABLE `ems_score_manage`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '成绩id',
  `exam_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '考试编号',
  `member_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `course_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '课程id',
  `chapter_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '章节ID',
  `number` int(1) DEFAULT 0 COMMENT '考试的有效次数',
  `exam_score` int(5) DEFAULT NULL COMMENT '总成绩',
  `gmt_create` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exam_id`(`exam_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ems_score_manage
-- ----------------------------
INSERT INTO `ems_score_manage` VALUES ('1298623980483117057', '1297027602317352961', '1296102077461794818', '1295958589541724162', '1295959138454482945', 1, 10, '2020-08-26 22:10:59', '2020-08-26 22:10:59');
INSERT INTO `ems_score_manage` VALUES ('1298625111405887490', '1297027602317352961', '1296102077461794818', '1295958589541724162', '1295959138454482945', 2, 4, '2020-08-26 22:15:29', '2020-08-26 22:15:29');
INSERT INTO `ems_score_manage` VALUES ('1298630049330716674', '1297027602317352961', '1296102077461794818', '1295958589541724162', '1295959138454482945', 3, 6, '2020-08-26 22:35:06', '2020-08-26 22:35:06');
INSERT INTO `ems_score_manage` VALUES ('1298820325080883202', '1297029730440093698', '1296102077461794818', '1295958589541724162', '', 1, 32, '2020-08-27 11:11:11', '2020-08-27 11:11:11');
INSERT INTO `ems_score_manage` VALUES ('1298823593429360642', '1297027881825771521', '1296102077461794818', '1295958589541724162', '1295959167458095105', 1, 4, '2020-08-27 11:24:10', '2020-08-27 11:24:10');
INSERT INTO `ems_score_manage` VALUES ('1298826215536254977', '1297027881825771521', '1296102077461794818', '1295958589541724162', '1295959167458095105', 2, 6, '2020-08-27 11:34:35', '2020-08-27 11:34:35');

-- ----------------------------
-- Table structure for ems_short_answer_question
-- ----------------------------
DROP TABLE IF EXISTS `ems_short_answer_question`;
CREATE TABLE `ems_short_answer_question`  (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '二级学科ID',
  `subject_parent_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '一级学科ID',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题目内容',
  `question_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题目类型值为5',
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '答案',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简答题图片',
  `score` int(2) DEFAULT NULL COMMENT '分数',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '解析',
  `level` int(1) DEFAULT NULL COMMENT '难度级别',
  `gmt_create` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ems_short_answer_question
-- ----------------------------
INSERT INTO `ems_short_answer_question` VALUES (6, '1295951803136880641', '1295951801295581186', '包的作用', '5', '1、将功能相近的类放到同一个包中，可以方便查找和使用。2、在一定程度上避免命名冲突。3、在java中，访问权限是可以是以包为单位的。', NULL, 20, '考查Java基础', 4, '2020-08-21 22:22:25', '2020-08-21 22:22:25');
INSERT INTO `ems_short_answer_question` VALUES (7, '1295951803136880641', '1295951801295581186', '简述方法的重写和重载', '5', 'override（重写） 1.方法名、参数、返回值相同。 2、重写方法的访问修饰符一定要大于或等于被重写的方法。 3、重写方法不能抛出新的异常或者抛出比被重写方法更宽泛的异常 4、存在于父类和子类之间。 5、被final修饰的方法不能重写 overload（重载） 1、参数类型、个数、顺序至少有一个不相同。 2、不能重载只有返回值不同的方法名。 3、存在于同类中。', NULL, 20, '', 5, '2020-08-21 22:23:12', '2020-08-21 22:23:12');
INSERT INTO `ems_short_answer_question` VALUES (8, '1295951803136880641', '1295951801295581186', 'java实现多态的机制是什么？', '5', '多态可分为： 1.编译多态：主要是体现在重载，系统在编译时就能确定调用重载函数的哪个版本。 2.运行多态：主要体现在OO设计的继承性上，子类的对象也是父类的对象，即上溯造型，所以子类对象可以作为父类对象使用，父类的对象变量可以指向子类对象。因此通过一个父类发出的方法调用可能执行的是方法在父类中的实现，也可能是某个子类中的实现，它是由运行时刻具体的对象类型决定的。 靠的是父类或接口定义的引用变量可以指向子类或具体实现类的实例对象，而程序调用的方法在运行期才动态绑定，就是引用变量所指向的具体实例对象的方法，也就是内存里正在运行的那个对象的方法，而不是引用变量的类型中定义的方法。', NULL, 20, '', 5, '2020-08-21 22:26:07', '2020-08-21 22:26:07');
INSERT INTO `ems_short_answer_question` VALUES (9, '1295951803136880641', '1295951801295581186', '简述this关键字的用法', '5', '1、this调用本类中的属性，也就是类中的成员变量； 2、this调用本类中的其他方法； 3、this调用本类中的其他构造方法，调用时要放在构造方法的首行。', NULL, 20, '', 5, '2020-08-21 22:27:23', '2020-08-21 22:27:23');
INSERT INTO `ems_short_answer_question` VALUES (10, '1295951803136880641', '1295951801295581186', '什么是抽象类？什么是抽象方法？有什么特点？', '5', '使用abstract关键字修饰的类 特点： 1、不能创建实例，即不能new一个抽象类 2、可以不包含抽象方法，若一旦包含，该类必须作为抽象类 3、若子类没有实现父类所有的抽象方法，那么子类也得作为抽象类（抽象派生类） 4、构造方法不能都定义成私有的，否则不能有子类（创建子类对象前先调用父类构造方法） 5、抽象类不能使用final修饰，因为必须有子类，抽象方法才能得以实现 使用abstract修饰且没有方法体的方法，称为“抽象方法”。 特点： 1、使用abstract修饰，方法没有方法体，留给子类去实现。 2、抽象方法修饰符不能是private、final和static 3、抽象方法必须定义在抽象类或接口中', NULL, 20, '', 5, '2020-08-21 22:27:45', '2020-08-21 22:27:45');
INSERT INTO `ems_short_answer_question` VALUES (11, '1295951803136880641', '1295951801295581186', '请说出作用域public，private，protected，以及不写时的区别', '5', 'private修饰的成员变量和函数只能在类本身和内部类中被访问。 protected 修饰的成员变量和函数能被类本身、子类及同一个包中的类访问。 public修饰的成员变量和函数可以被类、子类、同一个包中的类以及任意其他类访问。 默认情况（不写）下，属于一种包访问，即能被类本身以及同一个包中的类访问。', NULL, 20, '', 5, '2020-08-21 22:29:24', '2020-08-21 22:29:24');
INSERT INTO `ems_short_answer_question` VALUES (12, '1295951803136880641', '1295951801295581186', '&和&&的区别？', '5', '&，&&：（与，短路与）：一样的地方就是二者执行最后的结果是一样的，但是执行的过程有区别， 对于&：无论&左边是否为false，他都会继续检验右边的boolean值。 对于&&:只要检测到左边Boolean值为false时，就会直接判断结果，不会在检验右边的值（因为”与”有一个false最后结果就是false了） 所以&&的执行效率更高，所以一般都是使用&&. |与||之间也是同样的道理，|：无论左边是否为ture，都会检验右边 ，||：则不会。|| 的执行效率会更高', NULL, 20, '', 5, '2020-08-21 22:29:49', '2020-08-21 22:29:49');
INSERT INTO `ems_short_answer_question` VALUES (13, '1295951803136880641', '1295951801295581186', '抽象类（abstract class）和接口（interface）有什么异同？', '5', '相同点： 1、都不能被实例化 2、接口的实现类或者抽象类的子类都必须实现了接口或抽象类中的方法后才可以被实例化 不同点： 1、抽象类可以包含非抽象的方法，而接口中的方法必须是抽象的。 2、继承抽象类在Java语言体系中体现一种继承关系，在合理的继承关系中，父类和派生类比如按存在is-a关系。而实现接口则体现一种has-a关系，实现者仅仅是实现了interface定义的契约而已。 3、抽象类中可以有成员变量，而接口中不能有成员变量。 4、抽象类和接口中都可以包含静态成员变量，抽象类中的静态成员变量的属性可以是任意的，而接口中的静态成员变量默认且必须是public static final。 5、接口中的抽象方法默认且必须都是public的，而抽象类中的抽象方法可以是public、protect或默认。 6、抽象类中可以有构造方法，但是不能实例化。 7、抽象类中可以有静态方法（非抽象的），而接口中不能有静态方法。 8、抽象类中的抽象方法不能用static、synchronized和native连用', NULL, 20, '', 5, '2020-08-21 22:31:57', '2020-08-21 22:31:57');
INSERT INTO `ems_short_answer_question` VALUES (14, '1295951803136880641', '1295951801295581186', '什么是Java虚拟机？为什么Java被称作是“平台无关的编程语言”？', '5', 'Java虚拟机是一个可以执行Java字节码的虚拟机进程。Java源文件被编译成能被Java虚拟机执行的字节码文件。 在不同平台编写的Java源程序（.java文件）被编译器‘翻译’成一个字节码文件（.class文件，是一种中间文件、通用文件、可被所有平台的JVM所识别的文件。 ），而这个字节码文件可被不同平台的JVM所识别，在不同平台对.class文件进行与平台相对应的处理方式。 所以JVM相当于一个翻译官： 由不同平台的.java文件解释生成统一的.class文件，再由对应平台的JVM执行这个.class文件，由此实现Java语言的一大特性：一次编写，处处运行（Write once and run anywhere）。', NULL, 20, '', 5, '2020-08-21 22:32:21', '2020-08-21 22:32:21');
INSERT INTO `ems_short_answer_question` VALUES (15, '1295951803136880641', '1295951801295581186', '是否可以从一个static方法内部发出对非static方法的调用？', '5', '不可以。因为非static方法是要与对象关联在一起的，必须创建一个对象后，才可以在该对象上进行方法调用，而static方法是静态方法，是属于类的方法，调用时不需要创建对象，可以直接调用。也就是说，当一个static方法被调用时，可能还没有创建任何实例对象，如果从一个static方法中发出对非static方法的调用，那个非static方法关联到那个对象上的呢？这个逻辑无法成立，所以，一个static方法内部不能发出对非static方法的调用。', NULL, 20, '', 5, '2020-08-21 22:34:25', '2020-08-21 22:34:25');
INSERT INTO `ems_short_answer_question` VALUES (16, '1295951803136880641', '1295951801295581186', 'Integer与int的区别？', '5', '1、Integer是int的包装类；int是基本数据类型； 2、Integer变量必须实例化后才能使用；int变量不需要； 3、Integer实际是对象的引用，指向此new的Integer对象；int是直接存储数据值 ； 4、Integer的默认值是null；int的默认值是0。', NULL, 20, '', 5, '2020-08-21 22:35:06', '2020-08-21 22:35:06');
INSERT INTO `ems_short_answer_question` VALUES (17, '1295951803136880641', '1295951801295581186', '构造器Constructor是否可被override?', '5', '构造器Constructor不能被继承，因此不能被重写(Override)，但是可以被重载（Overload）', NULL, 20, '', 5, '2020-08-21 22:35:44', '2020-08-21 22:35:44');
INSERT INTO `ems_short_answer_question` VALUES (18, '1295951803136880641', '1295951801295581186', '一个”.java”源文件中是否可以包括多个类（不是内部类）？有什么限制？', '5', '一个.java类中是可以有多个类。 但是，在多个类中，有且只有一个public类，且public类的类名必须与*.java的文件名相一致 JVM虚拟机实例通过调用某个类的main()来执行程序，这个main（）必须是public static void 并接受一个字符串作为参数，但是该类不一定是public类。', NULL, 20, '', 5, '2020-08-21 22:36:37', '2020-08-21 22:36:37');
INSERT INTO `ems_short_answer_question` VALUES (19, '1295951803136880641', '1295951801295581186', 'String,StringBuffer与StringBuilder的区别??', '5', 'String 字符串常量 StringBuffer 字符串变量（线程安全） StringBuilder 字符串变量（非线程安全） String是对象不是原始类型为不可变对象，一旦创建就不能修改它的值 对于已经存在的String的对象的修改都是重新创建一个新的对象，然后把值保存进去（旧的值会被回收）。String是final类，不能被继承 StringBuffer和StringBuilder是一个可变对象，它只能通过构造函数来建立。 1.如果要操作少量的数据用 = String 2.单线程操作字符串缓冲区 下操作大量数据 = StringBuilder 3.多线程操作字符串缓冲区 下操作大量数据 = StringBuffer', NULL, 20, '', 5, '2020-08-21 22:36:55', '2020-08-21 22:36:55');
INSERT INTO `ems_short_answer_question` VALUES (20, '1295951803136880641', '1295951801295581186', 'String s = new String(“xyz”);创建了几个String Object?二者之间有什么区别？', '5', '两个。第一个对象是字符串常量”xyz” 第二个对象是new String(“xyz”)的时候产生的，在堆中分配内存给这个对象，只不过这个对象的内容是指向字符串常量”xyz” 另外还有一个引用s，指向第二个对象。这是一个变量，在栈中分配内存。', NULL, 20, '', 5, '2020-08-21 22:39:05', '2020-08-21 22:39:05');
INSERT INTO `ems_short_answer_question` VALUES (21, '1295951803136880641', '1295951801295581186', '面向对象的特征有哪些方面？', '5', '面向对象的三大特征：1.继承 2.封装 3.多态性 （1）继承：就是保留父类的属性，开扩新的东西。通过子类可以实现继承，子类继承父类的所有状态和行为，同时添加自身的状态和行为。 （2）封装：就是类的私有化。将代码及处理数据绑定在一起的一种编程机制，该机制保证程序和数据不受外部干扰。 （3）多态：是允许将父对象设置成为和一个和多个它的子对象相等的技术。包括重载和重写。重载为编译时多态，重写是运行时多态。', NULL, 20, '', 5, '2020-08-21 22:39:21', '2020-08-21 22:39:21');
INSERT INTO `ems_short_answer_question` VALUES (22, '1295951803136880641', '1295951801295581186', '接口是否可继承接口？抽象类是否可实现（implements）接口？抽象类是否可继承具体类？', '5', '接口可以继承接口。抽象类可以实现(implements)接口，抽象类可继承(extends)实体类，(但前提是实体类必须有明确的构造函数)。', NULL, 20, '', 5, '2020-08-21 22:40:29', '2020-08-21 22:40:29');
INSERT INTO `ems_short_answer_question` VALUES (23, '1295951803136880641', '1295951801295581186', '类和对象的关系？', '5', '1、类是抽象概念，对象是类具体的实例。 2、一个类可以有多个对象，而一个对象只能属于一个类 3、创建对象是类的主要使用方式', NULL, 20, '', 5, '2020-08-21 22:41:06', '2020-08-21 22:41:06');
INSERT INTO `ems_short_answer_question` VALUES (24, '1295951803136880641', '1295951801295581186', '类体中的方法包含哪些分类？', '5', '构造方法 普通方法 静态方法', NULL, 20, '', 5, '2020-08-21 22:41:24', '2020-08-21 22:41:24');
INSERT INTO `ems_short_answer_question` VALUES (25, '1295951803136880641', '1295951801295581186', '类变量与实例变量的区别？', '5', '类变量也叫静态变量，也就是在变量前加了static 的变量； 实例变量也叫对象变量，即没加static 的变量； 区别在于：类变量是所有对象共有，其中一个对象将它值改变，其他对象得到的就是改变后的结果；而实例变量则属对象私有，某一个对象将其值改变，不影响其他对象', NULL, 20, '', 5, '2020-08-21 22:42:07', '2020-08-21 22:42:07');
INSERT INTO `ems_short_answer_question` VALUES (26, '1295951803136880641', '1295951801295581186', '构造函数的作用和特点？', '5', '作用：用来创建对象 特点： 1、使用new空格方法创建（实例化）一个新对象。 2、构造方法方法名必须与类名同名，并且没有返回值。 3、一个类可以有多个构造方法（形参，列表不同） 4、如果一个类中，没有定义任何构造方法，编译器会自动添加无参构造。', NULL, 20, '', 5, '2020-08-21 22:42:30', '2020-08-21 22:42:30');
INSERT INTO `ems_short_answer_question` VALUES (27, '1295951803136880641', '1295951801295581186', 'Java中，请说明final关键字的使用？', '5', '1.用来修饰数据，包括成员变量和局部变量，该变量只能被赋值一次且它的值无法被改变。对于成员变量来讲，我们必须在声明时或者构造方法中对它赋值； 2.用来修饰方法参数，表示在变量的生存期中它的值不能被改变； 3.修饰方法，表示该方法无法被重写； 4.修饰类，表示该类无法被继承。', NULL, 20, '', 5, '2020-08-21 22:43:09', '2020-08-21 22:43:09');
INSERT INTO `ems_short_answer_question` VALUES (28, '1295951803136880641', '1295951801295581186', '简述值类型参数与引用类型参数在传递时的不同？', '5', '值类型参数在传递时直接传递的是数据值本身，在方法体中对形参的修改不会影响到实参的数值 ；引用类型参数传递时传递的是地址，若在方法体中修改形参指向的数据内容，则会对实参变量的数值产生影响，因为形参变量和实参变量共享同一块堆区。当使用引用数据类型作为方法的形参时，若在方法体中修改形参变量的指向，此时不会对实参变量的数值产生影响，因为形参变量和实参变量分别指向不同的堆区；', NULL, 20, '', 5, '2020-08-21 22:44:17', '2020-08-21 22:44:17');
INSERT INTO `ems_short_answer_question` VALUES (29, '1295951803136880641', '1295951801295581186', 'Java内存管理？', '5', '在java中，有java程序、虚拟机、操作系统三个层次，其中java程序与虚拟机交互，而虚拟机与操作系统交互。这也就保证了java的与平台无关性 1.程序运行前：JVM向操作系统请求一定的内存空间，成为初始内存空间！程序执行过程中所需的内存都是由java虚拟机从这片内存空间中划分的 2.程序运行中：java程序一直向java虚拟机申请内存，当程序所需要的内存空间超出初始内存空间时，java虚拟机会再次向操作系统申请更多的内存供程序使用！ 3.内存溢出：程序接着运行，当java虚拟机已申请的内存达到了规定的最大内存空间，但程序还需要跟多的内存，这时会出现内存溢出的错误！ 由此，我们知道java程序所用的内存是有java虚拟机进行管理、分配的', NULL, 20, '', 5, '2020-08-21 22:45:09', '2020-08-21 22:45:09');

SET FOREIGN_KEY_CHECKS = 1;
