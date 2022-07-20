/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : Ruiky

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 19/07/2022 17:49:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '收货人',
  `sex` tinyint NOT NULL COMMENT '性别 0 女 1 男',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='地址管理';

-- ----------------------------
-- Records of address_book
-- ----------------------------
BEGIN;
INSERT INTO `address_book` VALUES (1417414526093082626, 1417012167126876162, 'Chris', 1, '13812345678', NULL, NULL, NULL, NULL, NULL, NULL, '2940 University Place', 'Company', 1, '2021-07-20 17:22:12', '2021-07-20 17:26:33', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1417414926166769666, 1417012167126876162, 'Kris', 1, '13512345678', NULL, NULL, NULL, NULL, NULL, NULL, 'Test', 'Home', 0, '2021-07-20 17:23:47', '2021-07-20 17:23:47', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1549171282768760834, 1549117734070042625, '小猫', 1, '15973702639', NULL, NULL, NULL, NULL, NULL, NULL, '湖南省益阳市22', '公司', 0, '2022-07-18 17:16:31', '2022-07-19 15:30:25', 1549117734070042625, 1549117734070042625, 0);
INSERT INTO `address_book` VALUES (1549483936776740865, 1549117734070042625, 'SA', 1, '13812123434', NULL, NULL, NULL, NULL, NULL, NULL, 'adadasd', 'Home', 0, '2022-07-19 13:58:53', '2022-07-19 13:58:53', 1549117734070042625, 1549117734070042625, 0);
INSERT INTO `address_book` VALUES (1549508142864392194, 1549117734070042625, 'Chris', 1, '15973702639', NULL, NULL, NULL, NULL, NULL, NULL, '2940 Univsersity Place', 'Company', 1, '2022-07-19 15:35:04', '2022-07-19 15:39:04', 1549117734070042625, 1549117734070042625, 0);
INSERT INTO `address_book` VALUES (1549530324097146881, 1, 'Chris', 1, '15445521211', NULL, NULL, NULL, NULL, NULL, NULL, '2313', 'Company', 1, '2022-07-19 17:03:13', '2022-07-19 17:03:26', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint NOT NULL COMMENT '主键',
  `type` int DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int DEFAULT '0' COMMENT '0正常，1已被删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='菜品及套餐分类';

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1397844263642378242, 1, 'Hunan Cuisine 湘菜', 1, '2021-05-27 09:16:58', '2021-07-15 20:25:23', 1, 1, 0);
INSERT INTO `category` VALUES (1397844303408574465, 1, 'Szechuan cuisine 川菜', 2, '2021-05-27 09:17:07', '2021-06-02 14:27:22', 1, 1, 0);
INSERT INTO `category` VALUES (1397844391040167938, 1, 'Cantonese cuisine 粤菜', 3, '2021-05-27 09:17:28', '2021-07-09 14:37:13', 1, 1, 0);
INSERT INTO `category` VALUES (1413341197421846529, 1, 'Beverages 饮品', 11, '2021-07-09 11:36:15', '2021-07-09 14:39:15', 1, 1, 0);
INSERT INTO `category` VALUES (1413342269393674242, 2, 'Business Package 商务套餐', 5, '2021-07-09 11:40:30', '2021-07-09 14:43:45', 1, 1, 0);
INSERT INTO `category` VALUES (1413384954989060097, 1, 'Staple 主食', 12, '2021-07-09 14:30:07', '2021-07-09 14:39:19', 1, 1, 0);
INSERT INTO `category` VALUES (1413386191767674881, 2, 'Kids Package 儿童套餐', 6, '2021-07-09 14:35:02', '2021-07-09 14:39:05', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `status` int NOT NULL DEFAULT '1' COMMENT '0 停售 1 起售',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='菜品管理';

-- ----------------------------
-- Records of dish
-- ----------------------------
BEGIN;
INSERT INTO `dish` VALUES (1397849739276890114, 'Spicy Chicken辣子鸡', 1397844263642378242, 7800.00, '222222222', 'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', 'From tender and tasty chicks, worth a try', 1, 0, '2021-05-27 09:38:43', '2021-05-27 09:38:43', 1, 1, 0);
INSERT INTO `dish` VALUES (1397850140982161409, 'Mao Braised Pork毛氏红烧肉', 1397844263642378242, 6800.00, '123412341234', '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', 'Maos braised pork Maos braised pork, sure you dont want one?', 1, 0, '2021-05-27 09:40:19', '2021-05-27 09:40:19', 1, 1, 0);
INSERT INTO `dish` VALUES (1397850392090947585, 'Groupan Shark Fin组庵鱼翅', 1397844263642378242, 4800.00, '123412341234', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', 'Groupan shark fins, look at the picture is enough to show the degree of deliciousness', 1, 0, '2021-05-27 09:41:19', '2021-05-27 09:41:19', 1, 1, 0);
INSERT INTO `dish` VALUES (1397850851245600769, 'Farewell to the King霸王别姬', 1397844263642378242, 12800.00, '123412341234', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', 'Farewell to the King, Tasty Chicken', 1, 0, '2021-05-27 09:43:08', '2021-05-27 09:43:08', 1, 1, 0);
INSERT INTO `dish` VALUES (1397851099502260226, 'Family全家福', 1397844263642378242, 11800.00, '23412341234', 'a53a4e6a-3b83-4044-87f9-9d49b30a8fdc.jpg', 'Port meat', 1, 0, '2021-05-27 09:44:08', '2021-05-27 09:44:08', 1, 1, 0);
INSERT INTO `dish` VALUES (1397851370462687234, 'Shaoyang Pork Blood Balls猪血丸子', 1397844263642378242, 13800.00, '1246812345678', '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', 'Classic Cuisine', 1, 0, '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish` VALUES (1397851668262465537, 'Tasteful Shrimp口味虾', 1397844263642378242, 16800.00, '1234567812345678', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 'Dongxing - flavored shrimp', 1, 0, '2021-05-27 09:46:23', '2021-05-27 09:46:23', 1, 1, 0);
INSERT INTO `dish` VALUES (1397852391150759938, 'Diced Chicken with Spicy Sauce辣子鸡丁', 1397844303408574465, 8800.00, '2346812468', 'ef2b73f2-75d1-4d3a-beea-22da0e1421bd.jpg', 'Diced Chicken with Chili Sauce, Spicy Chicken, Classic Sichuan Cuisine', 1, 0, '2021-05-27 09:49:16', '2021-05-27 09:49:16', 1, 1, 0);
INSERT INTO `dish` VALUES (1397853183287013378, 'Spicy Fish Head麻辣鱼头', 1397844303408574465, 19800.00, '123456787654321', '2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', 'Detailed production of spicy fish head, spicy and fresh aroma, red color, long aftertaste', 1, 0, '2021-05-27 09:52:24', '2021-05-27 09:52:24', 1, 1, 0);
INSERT INTO `dish` VALUES (1397853709101740034, 'White meat with garlic puree蒜泥白肉', 1397844303408574465, 9800.00, '1234321234321', 'd2f61d70-ac85-4529-9b74-6d9a2255c6d7.jpg', 'White meat with garlic paste', 1, 0, '2021-05-27 09:54:30', '2021-05-27 09:54:30', 1, 1, 0);
INSERT INTO `dish` VALUES (1397853890262118402, 'Shredded pork with fish spices鱼香肉丝', 1397844303408574465, 3800.00, '1234212321234', '8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', 'Shredded pork with fish is simply a classic dish of our childhood memories', 1, 0, '2021-05-27 09:55:13', '2021-05-27 09:55:13', 1, 1, 0);
INSERT INTO `dish` VALUES (1397854652581064706, 'Spicy Boiled Fish麻辣水煮鱼', 1397844303408574465, 14800.00, '2345312·345321', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', 'Fish fillets are bought cut fish fillets, put a few shrimp, to increase the flavor', 1, 0, '2021-05-27 09:58:15', '2021-05-27 09:58:15', 1, 1, 0);
INSERT INTO `dish` VALUES (1397854865672679425, 'Scrambled eggs with fish spices鱼香炒鸡蛋', 1397844303408574465, 2000.00, '23456431·23456', '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', 'Fish flavored dishes are also a specialty of Sichuan cuisine. No fish inside but fish flavor', 1, 0, '2021-05-27 09:59:06', '2021-05-27 09:59:06', 1, 1, 0);
INSERT INTO `dish` VALUES (1397860242057375745, 'Crispy Roasted Chicken脆皮烧鸡', 1397844391040167938, 12800.00, '123456786543213456', 'e476f679-5c15-436b-87fa-8c4e9644bf33.jpeg', 'Guangdong roast duck is beautiful and fragrant, but better than roast goose said Gugang (now Xinhui).', 1, 0, '2021-05-27 10:20:27', '2021-05-27 10:20:27', 1, 1, 0);
INSERT INTO `dish` VALUES (1397860578738352129, 'White cut chicken白切鸡', 1397844391040167938, 6600.00, '12345678654', '9ec6fc2d-50d2-422e-b954-de87dcd04198.jpeg', 'White cut chicken is a special traditional dish with full color and flavor, also known as white chopped chicken.', 1, 0, '2021-05-27 10:21:48', '2021-05-27 10:21:48', 1, 1, 0);
INSERT INTO `dish` VALUES (1397860792492666881, 'Roasted Suckling Pig烤乳猪', 1397844391040167938, 38800.00, '213456432123456', '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', 'The main ingredient of Canton style roasted suckling pig is small suckling pig, the auxiliary ingredient is garlic, the seasoning is five spice powder, sesame sauce, star anise powder, etc.', 1, 0, '2021-05-27 10:22:39', '2021-05-27 10:22:39', 1, 1, 0);
INSERT INTO `dish` VALUES (1397860963880316929, 'Crispy Suckling Pig脆皮乳猪', 1397844391040167938, 10800.00, '1234563212345', '3fabb83a-1c09-4fd9-892b-4ef7457daafa.jpeg', 'Crispy Suckling Pig\" is a traditional dish in Guangdong cuisine, which belongs to Cantonese cuisine, with crispy skin, tender meat, red color.', 1, 0, '2021-05-27 10:23:19', '2021-05-27 10:23:19', 1, 1, 0);
INSERT INTO `dish` VALUES (1397861683434139649, 'Steamed River Seafood清蒸河鲜海鲜', 1397844391040167938, 38800.00, '1234567876543213456', '1405081e-f545-42e1-86a2-f7559ae2e276.jpeg', 'Fresh seafood, steamed is the best way to handle it. Fresh, appreciate why it is called seafood.', 1, 0, '2021-05-27 10:26:11', '2021-05-27 10:26:11', 1, 1, 0);
INSERT INTO `dish` VALUES (1397862198033297410, 'Old Fire Soup老火靓汤', 1397844391040167938, 49800.00, '123456786532455', '583df4b7-a159-4cfc-9543-4f666120b25f.jpeg', 'Old fire soup, also known as Guangfu soup, is a secret recipe for food and health that has been passed down for thousands of years by the Guangfu people.', 1, 0, '2021-05-27 10:28:14', '2021-05-27 10:28:14', 1, 1, 0);
INSERT INTO `dish` VALUES (1397862477831122945, 'Baked Lobster in Superior Soup上汤焗龙虾', 1397844391040167938, 108800.00, '1234567865432', '5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg', 'Baked lobster in soup is a famous traditional dish with full of color and flavor', 1, 0, '2021-05-27 10:29:20', '2021-05-27 10:29:20', 1, 1, 0);
INSERT INTO `dish` VALUES (1413342036832100354, 'Arctic Ocean北冰洋', 1413341197421846529, 500.00, '', 'c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', '', 1, 0, '2021-07-09 11:39:35', '2021-07-09 15:12:18', 1, 1, 0);
INSERT INTO `dish` VALUES (1413384757047271425, 'Wang Lao Ji王老吉', 1413341197421846529, 500.00, '', '00874a5e-0df2-446b-8f69-a30eb7d88ee8.png', '', 1, 0, '2021-07-09 14:29:20', '2021-07-12 09:09:16', 1, 1, 0);
INSERT INTO `dish` VALUES (1413385247889891330, 'Rice米饭', 1413384954989060097, 200.00, '', 'ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '', 1, 0, '2021-07-09 14:31:17', '2021-07-11 16:35:26', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor` (
  `id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '口味数据list',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='菜品口味关系表';

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
BEGIN;
INSERT INTO `dish_flavor` VALUES (1397849417888346113, 1397849417854791681, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:37:27', '2021-05-27 09:37:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849739297861633, 1397849739276890114, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849739323027458, 1397849739276890114, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849936421761025, 1397849936404983809, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849936438538241, 1397849936404983809, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850141015715841, 1397850140982161409, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850141040881665, 1397850140982161409, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850392120307713, 1397850392090947585, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850392137084929, 1397850392090947585, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850630734262274, 1397850630700707841, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850630755233794, 1397850630700707841, 'Spiciness', '[\"Slightly spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850851274960898, 1397850851245600769, 'Diet', '[ \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850851283349505, 1397850851245600769, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851099523231745, 1397851099502260226, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851099527426050, 1397851099502260226, 'Spiciness', '[\"Not spicy\",\"Slightly spicy\",\"Medium spicy\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851370483658754, 1397851370462687234, 'Temperature', '[\"hot drink\",\"room temperature\",\"de-ice\",\"less ice\",\"more ice\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851370483658755, 1397851370462687234, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851370483658756, 1397851370462687234, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851668283437058, 1397851668262465537, 'Temperature', '[\"hot drink\",\"room temperature\",\"de-ice\",\"less ice\",\"more ice\"]', '2021-05-27 09:46:23', '2021-05-27 09:46:23', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397852391180120065, 1397852391150759938, 'Diet', '[ \"No green onions\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397852391196897281, 1397852391150759938, 'Spiciness', '[\"Not spicy\",\"Slightly spicy\",\"Heavily spicy\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853183307984898, 1397853183287013378, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:52:24', '2021-05-27 09:52:24', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853423486414850, 1397853423461249026, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:53:22', '2021-05-27 09:53:22', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853709126905857, 1397853709101740034, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:54:30', '2021-05-27 09:54:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853890283089922, 1397853890262118402, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:55:13', '2021-05-27 09:55:13', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854133632413697, 1397854133603053569, 'Temperature', '[\"hot drink\",\"room temperature\",\"de-ice\",\"less ice\",\"more ice\"]', '2021-05-27 09:56:11', '2021-05-27 09:56:11', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854652623007745, 1397854652581064706, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854652635590658, 1397854652581064706, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854865735593986, 1397854865672679425, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 09:59:06', '2021-05-27 09:59:06', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397855742303186946, 1397855742273826817, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 10:02:35', '2021-05-27 10:02:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397855906497605633, 1397855906468245506, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 10:03:14', '2021-05-27 10:03:14', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397856190573621250, 1397856190540066818, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 10:04:21', '2021-05-27 10:04:21', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859056709316609, 1397859056684150785, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 10:15:45', '2021-05-27 10:15:45', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859277837217794, 1397859277812051969, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 10:16:37', '2021-05-27 10:16:37', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859487502086146, 1397859487476920321, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 10:17:27', '2021-05-27 10:17:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859757061615618, 1397859757036449794, 'Sweet', '[\"no sugar\",\"less sugar\",\"half lie\",\"more sugar\",\"full sugar\"]', '2021-05-27 10:18:32', '2021-05-27 10:18:32', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397860242086735874, 1397860242057375745, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 10:20:27', '2021-05-27 10:20:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397860963918065665, 1397860963880316929, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 10:23:19', '2021-05-27 10:23:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861135754506242, 1397861135733534722, 'Sweet', '[\"no sugar\",\"less sugar\",\"half lie\",\"more sugar\",\"full sugar\"]', '2021-05-27 10:24:00', '2021-05-27 10:24:00', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861370035744769, 1397861370010578945, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-27 10:24:56', '2021-05-27 10:24:56', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861683459305474, 1397861683434139649, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 10:26:11', '2021-05-27 10:26:11', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861898467717121, 1397861898438356993, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 10:27:02', '2021-05-27 10:27:02', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397862198054268929, 1397862198033297410, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-27 10:28:14', '2021-05-27 10:28:14', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397862477835317250, 1397862477831122945, 'Spiciness', '[\"Not spicy\",\"Slightly spicy\",\"Medium spicy\"]', '2021-05-27 10:29:20', '2021-05-27 10:29:20', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398089545865015297, 1398089545676271617, 'Temperature', '[\"hot drink\",\"room temperature\",\"de-ice\",\"less ice\",\"more ice\"]', '2021-05-28 01:31:38', '2021-05-28 01:31:38', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398089782323097601, 1398089782285348866, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:32:34', '2021-05-28 01:32:34', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090003262255106, 1398090003228700673, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-28 01:33:27', '2021-05-28 01:33:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090264554811394, 1398090264517062657, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-28 01:34:29', '2021-05-28 01:34:29', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090455399837698, 1398090455324340225, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:35:14', '2021-05-28 01:35:14', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090685449023490, 1398090685419663362, 'Temperature', '[\"hot drink\",\"room temperature\",\"de-ice\",\"less ice\",\"more ice\"]', '2021-05-28 01:36:09', '2021-05-28 01:36:09', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090825358422017, 1398090825329061889, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-28 01:36:43', '2021-05-28 01:36:43', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091007051476993, 1398091007017922561, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:37:26', '2021-05-28 01:37:26', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091296164851713, 1398091296131297281, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:38:35', '2021-05-28 01:38:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091546531246081, 1398091546480914433, 'Diet', '[ \"No onion\",  \"No garlic\",  \"No cilantro\",  \"No spice\"]', '2021-05-28 01:39:35', '2021-05-28 01:39:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091729809747969, 1398091729788776450, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:40:18', '2021-05-28 01:40:18', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091889499484161, 1398091889449152513, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:40:56', '2021-05-28 01:40:56', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398092095179763713, 1398092095142014978, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:41:45', '2021-05-28 01:41:45', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398092283877306370, 1398092283847946241, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:42:30', '2021-05-28 01:42:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398094018939236354, 1398094018893099009, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:49:24', '2021-05-28 01:49:24', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398094391494094850, 1398094391456346113, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-05-28 01:50:53', '2021-05-28 01:50:53', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1399574026165727233, 1399305325713600514, 'Spiciness', '[ \"not spicy\", \"slightly spicy\", \"medium spicy\", \"heavy spicy\"]', '2021-06-01 03:50:25', '2021-06-01 03:50:25', 1399309715396669441, 1399309715396669441, 0);
INSERT INTO `dish_flavor` VALUES (1413389540592263169, 1413384757047271425, 'Temperature', '[\"room temperature\",\"refrigerated\"]', '2021-07-12 09:09:16', '2021-07-12 09:09:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1413389684020682754, 1413342036832100354, 'Temperature', '[\"room temperature\",\"refrigerated\"]', '2021-07-09 15:12:18', '2021-07-09 15:12:18', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1548762162212671490, 1548762162028122113, 'Sweet', '[\"No sugar\",\"Less sugar\",\"Half sugar\",\"More sugar\",\"Full sugar\"]', '2022-07-17 14:10:49', '2022-07-17 14:10:49', 1, 1, 1);
INSERT INTO `dish_flavor` VALUES (1548762162258808834, 1548762162028122113, 'Spicy', '[\"Not spicy\",\"Slightly spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2022-07-17 14:10:49', '2022-07-17 14:10:49', 1, 1, 1);
INSERT INTO `dish_flavor` VALUES (1548762389061603330, 1548762389049020418, 'Sweet', '[\"Full sugar\"]', '2022-07-17 15:07:45', '2022-07-17 15:07:45', 1, 1, 1);
INSERT INTO `dish_flavor` VALUES (1548762389061603331, 1548762389049020418, 'Spicy', '[\"Medium spicy\",\"Heavy spicy\"]', '2022-07-17 15:07:45', '2022-07-17 15:07:45', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='员工信息';

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` VALUES (1, 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2021-05-06 17:20:07', '2022-07-19 15:57:56', 1, 1);
INSERT INTO `employee` VALUES (1548420435868778497, 'Chriswang', 'a123456', 'e10adc3949ba59abbe56e057f20f883e', '13412343214', '1', '111222333444555666', 1, '2022-07-16 15:32:55', '2022-07-16 20:49:52', 1, 1);
INSERT INTO `employee` VALUES (1548502038034292738, 'Egon', 'test', 'e10adc3949ba59abbe56e057f20f883e', '15323216543', '1', '111111111111111111', 0, '2022-07-16 20:57:32', '2022-07-19 16:57:24', 1, 1);
INSERT INTO `employee` VALUES (1548509609604501506, 'Alex', 'test02', 'e10adc3949ba59abbe56e057f20f883e', '15675321245', '1', '111111111111111111', 0, '2022-07-16 21:27:16', '2022-07-19 14:29:19', 1, 1);
INSERT INTO `employee` VALUES (1549529317682204673, 'test111', 'test111', 'e10adc3949ba59abbe56e057f20f883e', '13412341234', '1', '111222333444555666', 1, '2022-07-19 16:59:13', '2022-07-19 16:59:13', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='订单明细表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
BEGIN;
INSERT INTO `order_detail` VALUES (1549171500054679553, 'Tasteful Shrimp口味虾', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 1549171499983376386, 1397851668262465537, NULL, 'room temperature', 1, 168.00);
INSERT INTO `order_detail` VALUES (1549171500063068162, 'Shaoyang Pork Blood Balls邵阳猪血丸子', '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', 1549171499983376386, 1397851370462687234, NULL, 'room temperature,No garlic,heavy spicy', 2, 138.00);
INSERT INTO `order_detail` VALUES (1549172088311390209, 'Farewell to the King霸王别姬', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', 1549172088269447170, 1397850851245600769, NULL, 'No cilantro,slightly spicy', 1, 128.00);
INSERT INTO `order_detail` VALUES (1549172088319778817, 'Spicy Fish Head麻辣鱼头', '2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', 1549172088269447170, 1397853183287013378, NULL, 'slightly spicy', 1, 198.00);
INSERT INTO `order_detail` VALUES (1549172088323973121, 'Spicy Boiled Fish麻辣水煮鱼', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', 1549172088269447170, 1397854652581064706, NULL, 'No cilantro,slightly spicy', 1, 148.00);
INSERT INTO `order_detail` VALUES (1549173359265193985, 'Tasteful Shrimp口味虾', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 1549173359223250946, 1397851668262465537, NULL, 'room temperature', 1, 168.00);
INSERT INTO `order_detail` VALUES (1549173359269388290, 'Spicy Boiled Fish麻辣水煮鱼', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', 1549173359223250946, 1397854652581064706, NULL, 'No garlic,slightly spicy', 1, 148.00);
INSERT INTO `order_detail` VALUES (1549173359273582594, 'Roasted Suckling Pig烤乳猪', '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', 1549173359223250946, 1397860792492666881, NULL, NULL, 1, 388.00);
INSERT INTO `order_detail` VALUES (1549173359277776898, 'Crispy Suckling Pig脆皮乳猪', '3fabb83a-1c09-4fd9-892b-4ef7457daafa.jpeg', 1549173359223250946, 1397860963880316929, NULL, 'slightly spicy', 1, 108.00);
INSERT INTO `order_detail` VALUES (1549173359277776899, 'Wang Lao Ji王老吉', '00874a5e-0df2-446b-8f69-a30eb7d88ee8.png', 1549173359223250946, 1413384757047271425, NULL, 'refrigerated', 1, 5.00);
INSERT INTO `order_detail` VALUES (1549173359277776900, 'Rice米饭', 'ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', 1549173359223250946, 1413385247889891330, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (1549175468828139521, 'Tasteful Shrimp口味虾', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 1549175468777807873, 1397851668262465537, NULL, 'room temperature', 1, 168.00);
INSERT INTO `order_detail` VALUES (1549175468836528129, 'Spicy Boiled Fish麻辣水煮鱼', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', 1549175468777807873, 1397854652581064706, NULL, 'No cilantro,heavy spicy', 1, 148.00);
INSERT INTO `order_detail` VALUES (1549175468836528130, 'Baked Lobster in Superior Soup上汤焗龙虾', '5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg', 1549175468777807873, 1397862477831122945, NULL, 'Slightly spicy', 1, 1088.00);
INSERT INTO `order_detail` VALUES (1549175468840722434, 'Wang Lao Ji王老吉', '00874a5e-0df2-446b-8f69-a30eb7d88ee8.png', 1549175468777807873, 1413384757047271425, NULL, 'room temperature', 1, 5.00);
INSERT INTO `order_detail` VALUES (1549175468840722435, 'Rice米饭', 'ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', 1549175468777807873, 1413385247889891330, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (1549503439619346433, 'Shaoyang Pork Blood Balls邵阳猪血丸子', '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', 1549503439535460354, 1397851370462687234, NULL, 'more ice,No cilantro,heavy spicy', 2, 138.00);
INSERT INTO `order_detail` VALUES (1549504537323229186, 'Tasteful Shrimp口味虾', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 1549504537306451970, 1397851668262465537, NULL, 'more ice', 1, 168.00);
INSERT INTO `order_detail` VALUES (1549504537327423490, 'Groupan Shark Fin组庵鱼翅', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', 1549504537306451970, 1397850392090947585, NULL, 'heavy spicy,heavy spicy', 1, 48.00);
INSERT INTO `order_detail` VALUES (1549504537327423491, 'Mao Braised Pork毛氏红烧肉', '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', 1549504537306451970, 1397850140982161409, NULL, 'No cilantro,slightly spicy', 1, 68.00);
INSERT INTO `order_detail` VALUES (1549505653733715969, 'Tasteful Shrimp口味虾', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 1549505653683384322, 1397851668262465537, NULL, 'more ice', 1, 168.00);
INSERT INTO `order_detail` VALUES (1549505653742104578, 'Shaoyang Pork Blood Balls邵阳猪血丸子', '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', 1549505653683384322, 1397851370462687234, NULL, 'more ice,No cilantro,slightly spicy', 1, 138.00);
INSERT INTO `order_detail` VALUES (1549505653742104579, 'Farewell to the King霸王别姬', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', 1549505653683384322, 1397850851245600769, NULL, 'No spice,slightly spicy', 1, 128.00);
INSERT INTO `order_detail` VALUES (1549531214065451010, 'Roasted Suckling Pig烤乳猪', '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', 1549531213968982017, 1397860792492666881, NULL, NULL, 1, 388.00);
INSERT INTO `order_detail` VALUES (1549531214069645313, 'White cut chicken白切鸡', '9ec6fc2d-50d2-422e-b954-de87dcd04198.jpeg', 1549531213968982017, 1397860578738352129, NULL, NULL, 2, 66.00);
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint NOT NULL COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NOT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='订单表';

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (1549171499983376386, '1549171499983376386', 4, 1549117734070042625, 1549171282768760834, '2022-07-18 17:17:22', '2022-07-18 17:17:22', 1, 444.00, '', '15973702639', '湖南省益阳市', NULL, '小猫');
INSERT INTO `orders` VALUES (1549172088269447170, '1549172088269447170', 2, 1549117734070042625, 1549169967490940929, '2022-07-18 17:19:43', '2022-07-18 17:19:43', 1, 474.00, '', '15973702639', '湖南省益阳市', NULL, '小猫');
INSERT INTO `orders` VALUES (1549173359223250946, '1549173359223250946', 2, 1549117734070042625, 1549171282768760834, '2022-07-18 17:24:46', '2022-07-18 17:24:46', 1, 819.00, '', '15973702639', '湖南省益阳市', NULL, '小猫');
INSERT INTO `orders` VALUES (1549175468777807873, '1549175468777807873', 2, 1549117734070042625, 1549169967490940929, '2022-07-18 17:33:09', '2022-07-18 17:33:09', 1, 1411.00, '', '15973702639', '湖南省益阳市', NULL, '小猫');
INSERT INTO `orders` VALUES (1549503439535460354, '1549503439535460354', 2, 1549117734070042625, 1549169967490940929, '2022-07-19 15:16:23', '2022-07-19 15:16:23', 1, 276.00, '', '15973702639', '湖南省益阳市', NULL, '小猫');
INSERT INTO `orders` VALUES (1549504537306451970, '1549504537306451970', 2, 1549117734070042625, 1549169967490940929, '2022-07-19 15:20:45', '2022-07-19 15:20:45', 1, 284.00, '', '15973702639', '湖南省益阳市', NULL, '小猫');
INSERT INTO `orders` VALUES (1549505653683384322, '1549505653683384322', 2, 1549117734070042625, 1549169967490940929, '2022-07-19 15:25:11', '2022-07-19 15:25:11', 1, 434.00, '', '15973702639', '湖南省益阳市', NULL, '小猫');
INSERT INTO `orders` VALUES (1549531213968982017, '1549531213968982017', 2, 1549117734070042625, 1549508142864392194, '2022-07-19 17:06:45', '2022-07-19 17:06:45', 1, 520.00, '', '15973702639', '2940 Univsersity Place', NULL, 'Chris');
COMMIT;

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal` (
  `id` bigint NOT NULL COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `status` int DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='套餐';

-- ----------------------------
-- Records of setmeal
-- ----------------------------
BEGIN;
INSERT INTO `setmeal` VALUES (1415580119015145474, 1413386191767674881, 'Kids Plan', 6000.00, 1, '', '', 'c9dfb182-6ae4-45ad-9f81-3122b0cd8817.png', '2021-07-15 15:52:55', '2022-07-19 16:33:10', 1415576781934608386, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish` (
  `id` bigint NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int NOT NULL COMMENT '份数',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='套餐菜品关系';

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
BEGIN;
INSERT INTO `setmeal_dish` VALUES (1549522764459749378, '1415580119015145474', '1413385247889891330', 'Rice米饭', 200.00, 1, 0, '2022-07-19 16:33:10', '2022-07-19 16:33:10', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1549522764472332289, '1415580119015145474', '1413384757047271425', 'Wang Lao Ji王老吉', 500.00, 1, 0, '2022-07-19 16:33:10', '2022-07-19 16:33:10', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1549522764476526594, '1415580119015145474', '1397860578738352129', 'White cut chicken白切鸡', 6600.00, 1, 0, '2022-07-19 16:33:10', '2022-07-19 16:33:10', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='购物车';

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
BEGIN;
INSERT INTO `shopping_cart` VALUES (1549140967964033025, 'Tasteful Shrimp口味虾', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 1549140764104081409, 1397851668262465537, NULL, 'room temperature', 2, 168.00, NULL);
INSERT INTO `shopping_cart` VALUES (1549143725815418882, 'Tasteful Shrimp口味虾', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 1549143555887386626, 1397851668262465537, NULL, 'more ice', 2, 168.00, '2022-07-18 15:27:01');
INSERT INTO `shopping_cart` VALUES (1549145583762022402, 'Scrambled eggs with fish spices鱼香炒鸡蛋', '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', 1549145459837116417, 1397854865672679425, NULL, 'heavy spicy', 1, 20.00, '2022-07-18 15:34:24');
INSERT INTO `shopping_cart` VALUES (1549145677794123778, 'Shredded pork with fish spices鱼香肉丝', '8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', 1549145459837116417, 1397853890262118402, NULL, 'heavy spicy', 2, 38.00, '2022-07-18 15:34:46');
INSERT INTO `shopping_cart` VALUES (1549500649559846914, 'Tasteful Shrimp口味虾', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 1, 1397851668262465537, NULL, 'more ice', 3, 168.00, '2022-07-19 15:05:18');
INSERT INTO `shopping_cart` VALUES (1549530207147368450, 'White meat with garlic puree蒜泥白肉', 'd2f61d70-ac85-4529-9b74-6d9a2255c6d7.jpg', 1, 1397853709101740034, NULL, 'No cilantro', 1, 98.00, '2022-07-19 17:02:45');
INSERT INTO `shopping_cart` VALUES (1549535548610199554, 'Steamed River Seafood清蒸河鲜海鲜', '1405081e-f545-42e1-86a2-f7559ae2e276.jpeg', 1549117734070042625, 1397861683434139649, NULL, 'No cilantro', 1, 388.00, '2022-07-19 17:23:58');
INSERT INTO `shopping_cart` VALUES (1549535552242466818, 'Roasted Suckling Pig烤乳猪', '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', 1549117734070042625, 1397860792492666881, NULL, NULL, 1, 388.00, '2022-07-19 17:23:59');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `status` int DEFAULT '0' COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='用户信息';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1549117734070042625, NULL, '15973702639', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1549123888967970818, NULL, '15883821923', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1549125465325740034, NULL, '15973702392', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1549125667373744130, NULL, '15838323224', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1549140764104081409, NULL, '15343467764', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1549143555887386626, NULL, '17534329322', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1549144196772831233, NULL, '15872723212', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1549144438121472002, NULL, '15787874543', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1549145459837116417, NULL, '18495445233', NULL, NULL, NULL, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
