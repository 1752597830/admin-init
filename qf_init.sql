/*
 Navicat Premium Data Transfer

 Source Server         : minicentos
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 192.168.1.110:3306
 Source Schema         : qf_init

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 19/12/2023 15:34:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category`  (
  `article_id` bigint NOT NULL COMMENT '文章ID',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`article_id`, `category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章分类关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_category
-- ----------------------------

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag`  (
  `article_id` bigint NOT NULL COMMENT '文章ID',
  `tag_id` bigint NOT NULL COMMENT '标签ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章标签关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章标题 不能为空',
  `author_id` int NULL DEFAULT 1 COMMENT '文章作者 不能为空',
  `article_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `article_cover` varchar(1234) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'https://th.bing.com/th/id/OIP.axzKICHueK6uhLIHKQR4wQHaEK?w=296&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7' COMMENT '文章缩略图',
  `is_top` int NULL DEFAULT 2 COMMENT '是否置顶 1 置顶 2 取消置顶',
  `status` int NULL DEFAULT 1 COMMENT '文章状态  1 公开 2 私密 3 草稿箱',
  `type` int NULL DEFAULT 1 COMMENT '文章类型 1 原创 2 转载 3 翻译',
  `origin_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原文链接 是转载或翻译的情况下提供',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `view_times` int NULL DEFAULT 0 COMMENT '文章访问次数',
  `article_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述信息 不能为空',
  `thumbs_up_times` int NULL DEFAULT 0 COMMENT '文章点赞次数',
  `reading_duration` double NULL DEFAULT 0 COMMENT '文章阅读时长',
  `sort` int NOT NULL DEFAULT 2 COMMENT '排序 1 最大 往后越小 用于置顶文章的排序',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识(0:未删除;1:已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, '10011', 1, '0101', '1', 1, 2, 1, NULL, '2023-12-18 10:48:20', '2023-12-18 10:48:20', 0, 'xxx', 0, 0, 2, 0);
INSERT INTO `blog_article` VALUES (2, '1223', 2, '1211', '1', 1, 2, 1, NULL, '2023-12-18 14:14:48', '2023-12-18 14:14:48', 0, 'xxx', 0, 0, 2, 0);
INSERT INTO `blog_article` VALUES (3, '1223', 2, '1211', '1', 1, 2, 1, NULL, '2023-12-18 14:15:48', '2023-12-18 14:15:48', 0, 'xxx', 0, 0, 2, 0);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称 唯一',
  `category_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类图标',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_name`(`category_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, '前端', 'vue', '2023-12-18 15:22:42', '2023-12-18 15:22:42');
INSERT INTO `blog_category` VALUES (2, '后端', 'PHP', '2023-12-18 15:49:42', '2023-12-18 15:49:42');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签名称 不能为空',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典类型编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典项名称',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典项值',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态(0:正常;1:禁用)',
  `defaulted` tinyint NULL DEFAULT 0 COMMENT '是否默认(1:是;0:否)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'gender', '男', '1', 1, 0, 0, '', '2023-12-16 21:05:50', '2023-12-16 21:05:50', 'ADMIN', 'ADMIN');
INSERT INTO `sys_dict` VALUES (2, 'gender', '女', '2', 2, 0, 0, '', '2023-12-16 21:06:29', '2023-12-16 21:06:29', 'ADMIN', 'ADMIN');
INSERT INTO `sys_dict` VALUES (3, 'gender', '未知', '3', 3, 0, 0, '', '2023-12-16 21:06:29', '2023-12-16 21:06:29', 'ADMIN', 'ADMIN');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '类型名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '类型编码',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态(0:正常;1:禁用)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '性别', 'gender', 0, '性别', '2023-12-16 21:02:26', '2023-12-16 21:02:26', 'ADMIN', 'ADMIN');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '父菜单ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由路径(浏览器地址栏路径)',
  `component` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径(vue页面完整路径，省略.vue后缀)',
  `visible` tinyint(1) NOT NULL DEFAULT 1 COMMENT '显示状态(1-显示;0-隐藏)',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单图标',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `redirect` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转路径',
  `type` tinyint(1) NOT NULL COMMENT '菜单类型(1:目录 2:菜单 3:外链)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '/system', 'Layout', 1, 'system', 1, '/system/user', 1, '系统管理目录', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (2, 0, '系统监控', '/monitor', 'Layout', 1, 'monitor', 2, '/monitor/online', 1, '系统监控目录', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (3, 0, '文章管理', '/article', 'Layout', 1, 'article', 3, '/article/list', 1, '文章管理目录', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (4, 0, '日志管理', '/notice', 'Layout', 1, 'notice', 4, '/log/operlog', 1, '日志管理目录', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (101, 1, '用户管理', 'user', 'system/user/index', 1, 'user', 1, NULL, 2, '用户管理菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (102, 1, '角色管理', 'role', 'system/role/index', 1, 'role', 1, NULL, 2, '角色管理菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (103, 1, '菜单管理', 'menu', 'system/menu/index', 1, 'menu', 1, NULL, 2, '菜单管理菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (104, 1, '字典管理', 'dict', 'system/dict/index', 1, 'dict', 1, NULL, 2, '字典管理菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (105, 1, '通知公告', 'notice', 'system/notice/index', 1, 'dict', 1, NULL, 2, '通知公告菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (106, 2, '在线用户', 'online', 'monitor/online/index', 1, 'online', 1, NULL, 2, '在线用户菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (107, 2, '数据监控', 'druid', 'monitor/druid/index', 1, 'druid', 2, NULL, 2, '数据监控菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (108, 2, '服务监控', 'server', 'monitor/server/index', 1, 'server', 3, NULL, 2, '服务监控菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (109, 2, '缓存监控', 'server', 'monitor/server/index', 1, 'server', 4, NULL, 2, '缓存监控菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (110, 2, '缓存列表', 'cacheList', 'monitor/cache/list', 1, 'cacheList', 5, NULL, 2, '缓存列表菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (111, 3, '文章列表', 'articleList', 'article/list/index', 1, 'articleList', 4, NULL, 2, '文章列表菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (112, 3, '发布文章', 'addArticle', 'article/add/index', 1, 'addArticle', 4, NULL, 2, '发布文章菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (113, 3, '标签管理', 'tag', 'article/tag/index', 1, 'tag', 4, NULL, 2, '标签管理菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (114, 3, '分类管理', 'category', 'article/category/index', 1, 'category', 4, NULL, 2, '分类管理菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (115, 4, '操作日志', 'operlog', 'monitor/operlog', 1, 'operlog', 1, NULL, 2, '操作日志菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');
INSERT INTO `sys_menu` VALUES (116, 4, '登录日志', 'logininfor', 'monitor/logininfor', 1, 'logininfor', 2, NULL, 2, '登录日志菜单', '2023-12-12 20:49:43', '2023-12-12 20:49:43', 'ADMIN', 'ADMIN');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `menu_id` int NULL DEFAULT NULL COMMENT '菜单模块ID',
  `url_perm` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URL权限标识',
  `btn_perm` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '按钮权限标识',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC, `name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '查看用户', 101, 'GET:/api/v1/users/*', 'sys:user:list', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (2, '编辑用户', 101, 'PUT:/api/v1/users/*', 'sys:user:edit', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (3, '新增用户', 101, 'POST:/api/v1/users/*', 'sys:user:add', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (4, '删除用户', 101, 'DELETE:/api/v1/users/*', 'sys:user:delete', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (5, '查看角色', 102, 'GET:/api/v1/roles/*', 'sys:role:list', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (6, '编辑角色', 102, 'PUT:/api/v1/roles/*', 'sys:role:edit', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (7, '新增角色', 102, 'POST:/api/v1/roles/*', 'sys:role:add', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (8, '删除角色', 102, 'DELETE:/api/v1/roles/*', 'sys:role:delete', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (9, '查看菜单', 103, 'GET:/api/v1/menus/*', 'sys:menu:list', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (10, '编辑菜单', 103, 'PUT:/api/v1/menus/*', 'sys:menu:edit', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (11, '新增菜单', 103, 'POST:/api/v1/menus/*', 'sys:menu:add', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');
INSERT INTO `sys_permission` VALUES (12, '删除菜单', 103, 'DELETE:/api/v1/menus/*', 'sys:menu:delete', '2023-12-12 20:39:35', '2023-12-12 20:39:35', 'ADMIN', 'ADMIN');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色编码',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '角色状态(1-正常；0-停用)',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识(0-未删除；1-已删除)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'ROOT', 1, 1, 0, '2023-12-12 17:32:41', '2023-12-12 17:32:41', 'ADMIN', 'ADMIN');
INSERT INTO `sys_role` VALUES (2, '系统管理员', 'ADMIN', 1, 1, 0, '2023-12-12 17:32:41', '2023-12-12 17:32:41', 'ADMIN', 'ADMIN');
INSERT INTO `sys_role` VALUES (3, '测试管理员', 'TEST', 1, 1, 0, '2023-12-12 17:32:41', '2023-12-12 17:32:41', 'ADMIN', 'ADMIN');
INSERT INTO `sys_role` VALUES (4, '访问游客', 'GUEST', 1, 1, 0, '2023-12-12 17:32:41', '2023-12-12 17:32:41', 'ADMIN', 'ADMIN');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `permission_id` bigint NOT NULL COMMENT '访问权限ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 2);
INSERT INTO `sys_role_permission` VALUES (1, 3);
INSERT INTO `sys_role_permission` VALUES (1, 4);
INSERT INTO `sys_role_permission` VALUES (1, 5);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (1, 7);
INSERT INTO `sys_role_permission` VALUES (1, 8);
INSERT INTO `sys_role_permission` VALUES (1, 9);
INSERT INTO `sys_role_permission` VALUES (1, 10);
INSERT INTO `sys_role_permission` VALUES (1, 11);
INSERT INTO `sys_role_permission` VALUES (1, 12);
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (2, 2);
INSERT INTO `sys_role_permission` VALUES (2, 5);
INSERT INTO `sys_role_permission` VALUES (2, 6);
INSERT INTO `sys_role_permission` VALUES (2, 7);
INSERT INTO `sys_role_permission` VALUES (2, 8);
INSERT INTO `sys_role_permission` VALUES (2, 9);
INSERT INTO `sys_role_permission` VALUES (2, 10);
INSERT INTO `sys_role_permission` VALUES (2, 1);
INSERT INTO `sys_role_permission` VALUES (2, 3);
INSERT INTO `sys_role_permission` VALUES (2, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(1) NULL DEFAULT 1 COMMENT '性别((1:男;2:女))',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户头像',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '用户状态((0:禁用;1:正常))',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除标识(0:未删除;1:已删除)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'ADMIN' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', '清风', 1, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 'https://picss.sunbangyan.cn/2023/12/15/e3c02fef8b8cb3541703a57ab7f9cd84.jpeg\r\n', '1559211****', 1, '123@qq.com', 0, '2023-12-12 17:36:41', '2023-12-12 17:36:41', 'ADMIN', 'ADMIN');
INSERT INTO `sys_user` VALUES (2, 'admin', '管理员', 1, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 'https://picdl.sunbangyan.cn/2023/12/15/a6fa9f80a1378643f59bffad03c6a018.jpeg\r\n', '1559211****', 1, '123@qq.com', 0, '2023-12-09 17:40:01', '2023-12-09 17:40:01', 'ADMIN', 'ADMIN');
INSERT INTO `sys_user` VALUES (3, 'test', '测试用户', 2, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 'https://picss.sunbangyan.cn/2023/12/15/e3c02fef8b8cb3541703a57ab7f9cd84.jpeg\r\n', '1559211****', 1, '123@qq.com', 0, '2023-12-05 17:40:01', '2023-12-05 17:40:01', 'ADMIN', 'ADMIN');
INSERT INTO `sys_user` VALUES (4, 'guest', '游客', 2, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 'https://picss.sunbangyan.cn/2023/12/15/e3c02fef8b8cb3541703a57ab7f9cd84.jpeg\r\n', '1559211****', 1, '123@qq.com', 0, '2023-12-10 17:40:01', '2023-12-10 17:40:01', 'ADMIN', 'ADMIN');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 4);

SET FOREIGN_KEY_CHECKS = 1;
