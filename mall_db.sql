/*
 Navicat Premium Data Transfer

 Source Server         : liaofushen.xyz
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : liaofushen.xyz:3306
 Source Schema         : mall_db

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 12/05/2019 22:04:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Flevel` tinyint(4) NULL DEFAULT NULL,
  `Fcreated` datetime NULL DEFAULT NULL,
  `Fupdated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, '家用电器', 1, '2017-02-21 21:48:56', '2017-02-21 21:48:56');
INSERT INTO `t_category` VALUES (2, '数码3C', 1, '2017-02-14 23:09:29', '2017-02-14 23:09:31');
INSERT INTO `t_category` VALUES (3, '服装鞋子', 1, '2017-02-14 23:10:48', '2017-02-14 23:10:50');
INSERT INTO `t_category` VALUES (4, '食品生鲜', 1, '2017-02-14 23:10:57', '2017-02-14 23:10:51');
INSERT INTO `t_category` VALUES (5, '酒水饮料', 1, '2017-02-14 23:10:59', '2017-02-14 23:10:53');
INSERT INTO `t_category` VALUES (6, '图书文具', 1, '2017-02-14 23:11:03', '2017-02-14 23:10:54');
INSERT INTO `t_category` VALUES (7, '医药保健', 1, '2017-02-14 23:11:03', '2017-02-14 23:10:56');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Forder_id` int(11) NULL DEFAULT NULL,
  `Fcommodity_id` int(11) NOT NULL,
  `Fuser_id` int(11) NOT NULL,
  `Fdesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Fstar_level` tinyint(4) NULL DEFAULT NULL,
  `Fcreated` datetime NULL DEFAULT NULL,
  `Fupdated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `Kcommodity`(`Fcommodity_id`) USING BTREE,
  INDEX `Kcom_userid`(`Fuser_id`) USING BTREE,
  INDEX `Forder_id`(`Forder_id`) USING BTREE,
  CONSTRAINT `Kcommodity` FOREIGN KEY (`Fcommodity_id`) REFERENCES `t_commodity` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Kcom_userid` FOREIGN KEY (`Fuser_id`) REFERENCES `t_user` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`Forder_id`) REFERENCES `t_order` (`Fid`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, NULL, 1, 1, '产品非常棒', 5, '2019-03-09 16:02:00', '2019-03-09 16:02:03');
INSERT INTO `t_comment` VALUES (2, NULL, 1, 1, '一般般吧', 3, '2019-03-10 14:52:38', '2019-03-10 14:52:38');
INSERT INTO `t_comment` VALUES (3, NULL, 5, 3, '还行吧', 3, '2019-03-21 00:50:03', '2019-03-21 00:50:03');
INSERT INTO `t_comment` VALUES (4, 22, 1, 2, '产品非常好', 5, '2019-03-25 10:47:14', '2019-03-25 10:47:14');
INSERT INTO `t_comment` VALUES (5, 17, 5, 3, '不是太好', 3, '2019-04-18 14:25:50', '2019-04-18 14:25:50');
INSERT INTO `t_comment` VALUES (6, 22, 1, 2, '非常棒', 5, '2019-04-20 23:44:29', '2019-04-20 23:44:29');

-- ----------------------------
-- Table structure for t_commodity
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity`;
CREATE TABLE `t_commodity`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id，同时也是商品编号',
  `Fcategory_id` int(11) NOT NULL COMMENT '所属类目，叶子类目',
  `Ftitle` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `Fsell_point` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品卖点',
  `Fdesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Fprice` decimal(10, 2) NULL DEFAULT NULL,
  `Fnum` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `Fbarcode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品条形码',
  `Fimage` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `Fstatus` tinyint(4) NULL DEFAULT 0 COMMENT '商品状态，0-正常，1-下架，2-删除',
  `Fweight` decimal(10, 2) NULL DEFAULT NULL,
  `Fcolour` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `Fsize` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `Fcreated` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `Fupdated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `Kcategory_id`(`Fcategory_id`) USING BTREE,
  CONSTRAINT `Kcategory_id` FOREIGN KEY (`Fcategory_id`) REFERENCES `t_category` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_commodity
-- ----------------------------
INSERT INTO `t_commodity` VALUES (1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'http://www.liaofushen.xyz:8081/images/1-desc1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc4.jpg', 3299.00, 99, NULL, 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 0, 43000.00, '银色', '895*1775*690(mm)', '2019-02-26 10:08:56', '2019-03-04 14:39:18');
INSERT INTO `t_commodity` VALUES (2, 2, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', 'http://www.liaofushen.xyz:8081/images/2-desc1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc5.jpg', 1999.00, 100, NULL, 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 0, 135.00, '银色', '141.2*69.1*7.1(mm)', '2019-02-26 10:25:37', '2019-02-26 10:25:40');
INSERT INTO `t_commodity` VALUES (3, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'http://www.liaofushen.xyz:8081/images/1-desc1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc4.jpg', 3299.00, 100, NULL, 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2616970884/O1CN01Y3mtFG1IOue8eS1HA_!!0-item_pic.jpg_580x580Q90.jpg', 0, 43000.00, '银色', '895*1775*690(mm)', '2019-02-26 10:08:56', '2019-02-26 10:08:59');
INSERT INTO `t_commodity` VALUES (4, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'http://www.liaofushen.xyz:8081/images/1-desc1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc4.jpg', 3299.00, 98, NULL, 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/3937106725/O1CN01aGYmOo1zY647woEIv_!!0-item_pic.jpg_580x580Q90.jpg', 0, 43000.00, '白色', '895*1775*690(mm)', '2019-02-26 10:08:56', '2019-03-06 17:55:20');
INSERT INTO `t_commodity` VALUES (5, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'http://www.liaofushen.xyz:8081/images/1-desc1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/1-desc4.jpg', 3299.00, 100, NULL, 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/201749140/O1CN01KaI9Vc2HOAZC8nHBp_!!2-item_pic.png_580x580Q90.jpg', 0, 43000.00, '黑色', '895*1775*690(mm)', '2019-02-26 10:08:56', '2019-02-26 10:08:59');
INSERT INTO `t_commodity` VALUES (6, 2, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', 'http://www.liaofushen.xyz:8081/images/2-desc1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc4.jpg\r\nhttp://www.liaofushen.xyz:8081/2-desc5.jpg', 1999.00, 98, NULL, 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 0, 135.00, '银色', '141.2*69.1*7.1(mm)', '2019-02-26 10:25:37', '2019-03-12 16:41:14');
INSERT INTO `t_commodity` VALUES (7, 2, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', 'http://www.liaofushen.xyz:8081/images/2-desc1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc4.jpg\r\nhttp://www.liaofushen.xyz:8081/2-desc5.jpg', 1999.00, 99, NULL, 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 0, 135.00, '黑色', '141.2*69.1*7.1(mm)', '2019-02-26 10:25:37', '2019-03-12 17:07:01');
INSERT INTO `t_commodity` VALUES (8, 2, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', 'http://www.liaofushen.xyz:8081/images/2-desc1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/2-desc5.jpg', 1999.00, 97, NULL, 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 0, 135.00, '红色', '141.2*69.1*7.1(mm)', '2019-02-26 10:25:37', '2019-03-12 17:09:51');
INSERT INTO `t_commodity` VALUES (9, 3, '卫衣套装男春秋季三件套韩版潮流服装外套健身休闲运动套装男春款\r\n', '收藏加购 赠运费险 不满意不合适欢迎退货', 'http://www.liaofushen.xyz:8081/images/yf1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf7.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf8.jpg', 178.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/yf1.jpg', 0, 1.00, '黑色', '无', '2019-03-11 13:14:01', '2019-03-12 17:13:46');
INSERT INTO `t_commodity` VALUES (10, 3, '古装服装仙女飘逸广袖舞台装古筝舞蹈演出服古代改良汉服女襦裙春', '送发钗，眉心贴，丝带', 'http://www.liaofushen.xyz:8081/images/nz2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz5.jpg', 188.98, 999, NULL, 'http://www.liaofushen.xyz:8081/images/nz1.jpg', 0, 200.00, '粉红', NULL, '2019-03-25 22:52:24', '2019-03-25 22:52:28');
INSERT INTO `t_commodity` VALUES (11, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '浅灰', '39', '2019-03-25 22:59:54', '2019-03-25 22:59:57');
INSERT INTO `t_commodity` VALUES (12, 4, '英国AHMAD TEA/亚曼进口茶叶伯爵+柠檬红茶45包袋泡茶组合', '柠檬+伯爵的组合', 'http://www.liaofushen.xyz:8081/images/cha1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/cha2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/cha3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/cha4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/cha5.jpg', 36.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/cha1.jpg', 0, 500.00, NULL, NULL, '2019-03-25 23:08:45', '2019-03-25 23:08:48');
INSERT INTO `t_commodity` VALUES (13, 4, '包邮 印尼进口Sedaap喜达（原味）捞面泡面方便面干拌面 91g*10包', '印尼传统捞面 不可多得的捞面', 'http://www.liaofushen.xyz:8081/images/pm1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/pm2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/pm3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/pm4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/pm5.jpg', 25.80, 999, NULL, 'http://www.liaofushen.xyz:8081/images/pm1.jpg', 0, 910.00, NULL, NULL, '2019-03-25 23:12:17', '2019-03-25 23:12:20');
INSERT INTO `t_commodity` VALUES (14, 5, 'RIO伏特加鸡尾酒 锐澳微醺3.8度缤纷6瓶装275ml*6', 'RIO鸡尾酒 缤纷6瓶', 'http://www.liaofushen.xyz:8081/images/rio2.jpg', 79.00, 99, NULL, 'http://www.liaofushen.xyz:8081/images/rio1.jpg', 0, 350.00, NULL, NULL, '2019-03-25 23:21:05', '2019-03-25 23:21:07');
INSERT INTO `t_commodity` VALUES (15, 5, '蒙牛低脂高钙纯牛奶250ml*16盒低脂肪 高钙质', '低脂高钙更健康', 'http://www.liaofushen.xyz:8081/images/milk1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/milk2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/milk3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/milk4.jpg', 46.98, 999, NULL, 'http://www.liaofushen.xyz:8081/images/milk1.jpg', 0, 2600.00, NULL, NULL, '2019-03-25 23:33:46', '2019-03-25 23:33:49');
INSERT INTO `t_commodity` VALUES (17, 6, '人间失格 日本小说家太宰治的自传体 收录作者绝笔之作《Good bye》 畅销小说书籍', '正版书籍', 'http://www.liaofushen.xyz:8081/images/book1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/book2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/book3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/book4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/book5.jpg', 22.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/book1.jpg', 0, 235.00, NULL, NULL, '2019-03-25 23:39:14', '2019-03-25 23:39:17');
INSERT INTO `t_commodity` VALUES (18, 3, '卫衣套装男春秋季三件套韩版潮流服装外套健身休闲运动套装男春款\r\n', '收藏加购 赠运费险 不满意不合适欢迎退货', 'http://www.liaofushen.xyz:8081/images/yf1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf7.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf8.jpg', 178.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/yf1.jpg', 0, 1.00, '灰色', '无', '2019-03-11 13:14:01', '2019-03-12 17:13:46');
INSERT INTO `t_commodity` VALUES (19, 3, '卫衣套装男春秋季三件套韩版潮流服装外套健身休闲运动套装男春款\r\n', '收藏加购 赠运费险 不满意不合适欢迎退货', 'http://www.liaofushen.xyz:8081/images/yf1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf7.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf8.jpg', 178.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/yf1.jpg', 0, 1.00, '白色', '无', '2019-03-11 13:14:01', '2019-03-12 17:13:46');
INSERT INTO `t_commodity` VALUES (20, 3, '卫衣套装男春秋季三件套韩版潮流服装外套健身休闲运动套装男春款\r\n', '收藏加购 赠运费险 不满意不合适欢迎退货', 'http://www.liaofushen.xyz:8081/images/yf1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf7.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf8.jpg', 178.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/yf1.jpg', 0, 1.00, '红色', '无', '2019-03-11 13:14:01', '2019-03-12 17:13:46');
INSERT INTO `t_commodity` VALUES (21, 3, '卫衣套装男春秋季三件套韩版潮流服装外套健身休闲运动套装男春款\r\n', '收藏加购 赠运费险 不满意不合适欢迎退货', 'http://www.liaofushen.xyz:8081/images/yf1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf7.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf8.jpg', 178.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/yf1.jpg', 0, 1.00, '蓝色', '无', '2019-03-11 13:14:01', '2019-03-12 17:13:46');
INSERT INTO `t_commodity` VALUES (22, 3, '卫衣套装男春秋季三件套韩版潮流服装外套健身休闲运动套装男春款\r\n', '收藏加购 赠运费险 不满意不合适欢迎退货', 'http://www.liaofushen.xyz:8081/images/yf1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf7.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf8.jpg', 178.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/yf1.jpg', 0, 1.00, '紫色', '无', '2019-03-11 13:14:01', '2019-03-12 17:13:46');
INSERT INTO `t_commodity` VALUES (23, 3, '卫衣套装男春秋季三件套韩版潮流服装外套健身休闲运动套装男春款\r\n', '收藏加购 赠运费险 不满意不合适欢迎退货', 'http://www.liaofushen.xyz:8081/images/yf1.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf7.jpg\r\nhttp://www.liaofushen.xyz:8081/images/yf8.jpg', 178.00, 999, NULL, 'http://www.liaofushen.xyz:8081/images/yf1.jpg', 0, 1.00, '卡其色', '无', '2019-03-11 13:14:01', '2019-03-12 17:13:46');
INSERT INTO `t_commodity` VALUES (24, 3, '古装服装仙女飘逸广袖舞台装古筝舞蹈演出服古代改良汉服女襦裙春', '送发钗，眉心贴，丝带', 'http://www.liaofushen.xyz:8081/images/nz2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz5.jpg', 188.98, 998, NULL, 'http://www.liaofushen.xyz:8081/images/nz1.jpg', 0, 200.00, '白色', NULL, '2019-03-25 22:52:24', '2019-04-01 00:08:36');
INSERT INTO `t_commodity` VALUES (25, 3, '古装服装仙女飘逸广袖舞台装古筝舞蹈演出服古代改良汉服女襦裙春', '送发钗，眉心贴，丝带', 'http://www.liaofushen.xyz:8081/images/nz2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz5.jpg', 188.98, 998, NULL, 'http://www.liaofushen.xyz:8081/images/nz1.jpg', 0, 200.00, '浅蓝', NULL, '2019-03-25 22:52:24', '2019-04-01 00:13:06');
INSERT INTO `t_commodity` VALUES (26, 3, '古装服装仙女飘逸广袖舞台装古筝舞蹈演出服古代改良汉服女襦裙春', '送发钗，眉心贴，丝带', 'http://www.liaofushen.xyz:8081/images/nz2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz5.jpg', 188.98, 998, NULL, 'http://www.liaofushen.xyz:8081/images/nz1.jpg', 0, 200.00, '米黄', NULL, '2019-03-25 22:52:24', '2019-04-01 00:18:24');
INSERT INTO `t_commodity` VALUES (27, 3, '古装服装仙女飘逸广袖舞台装古筝舞蹈演出服古代改良汉服女襦裙春', '送发钗，眉心贴，丝带', 'http://www.liaofushen.xyz:8081/images/nz2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz5.jpg', 188.98, 998, NULL, 'http://www.liaofushen.xyz:8081/images/nz1.jpg', 0, 200.00, '红色', NULL, '2019-03-25 22:52:24', '2019-04-18 14:54:09');
INSERT INTO `t_commodity` VALUES (28, 3, '古装服装仙女飘逸广袖舞台装古筝舞蹈演出服古代改良汉服女襦裙春', '送发钗，眉心贴，丝带', 'http://www.liaofushen.xyz:8081/images/nz2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz5.jpg', 188.98, 998, NULL, 'http://www.liaofushen.xyz:8081/images/nz1.jpg', 0, 200.00, '蓝色', NULL, '2019-03-25 22:52:24', '2019-04-28 10:21:32');
INSERT INTO `t_commodity` VALUES (29, 3, '古装服装仙女飘逸广袖舞台装古筝舞蹈演出服古代改良汉服女襦裙春', '送发钗，眉心贴，丝带', 'http://www.liaofushen.xyz:8081/images/nz2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/nz5.jpg', 188.98, 998, NULL, 'http://www.liaofushen.xyz:8081/images/nz1.jpg', 0, 200.00, '紫色', NULL, '2019-03-25 22:52:24', '2019-05-08 21:44:22');
INSERT INTO `t_commodity` VALUES (30, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '浅灰', '39', '2019-03-25 22:59:54', '2019-05-08 21:52:50');
INSERT INTO `t_commodity` VALUES (31, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '浅蓝', '39', '2019-03-25 22:59:54', '2019-05-08 21:55:59');
INSERT INTO `t_commodity` VALUES (32, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '白色', '39', '2019-03-25 22:59:54', '2019-05-08 22:39:09');
INSERT INTO `t_commodity` VALUES (33, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '黑色', '39', '2019-03-25 22:59:54', '2019-05-08 23:23:59');
INSERT INTO `t_commodity` VALUES (34, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '红色', '39', '2019-03-25 22:59:54', '2019-05-08 23:25:37');
INSERT INTO `t_commodity` VALUES (35, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '红色', '40', '2019-03-25 22:59:54', '2019-05-08 23:28:19');
INSERT INTO `t_commodity` VALUES (36, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '卡其', '41', '2019-03-25 22:59:54', '2019-05-08 23:29:59');
INSERT INTO `t_commodity` VALUES (37, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '红色', '42', '2019-03-25 22:59:54', '2019-05-08 23:40:07');
INSERT INTO `t_commodity` VALUES (38, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '红色', '43', '2019-03-25 22:59:54', '2019-05-08 23:41:33');
INSERT INTO `t_commodity` VALUES (39, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '红色', '44', '2019-03-25 22:59:54', '2019-05-08 23:42:49');
INSERT INTO `t_commodity` VALUES (40, 3, '马登男鞋春季2019新款男士夏季韩版潮流百搭鞋子男潮鞋休闲鞋板鞋', '当季热销新品 ‖ 百搭休闲范 ‖ 365天可穿', 'http://www.liaofushen.xyz:8081/images/xiezi2.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi3.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi4.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi5.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi6.jpg\r\nhttp://www.liaofushen.xyz:8081/images/xiezi7.jpg', 149.00, 998, NULL, 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg', 0, NULL, '黑白', '45', '2019-03-25 22:59:54', '2019-05-08 23:46:07');
INSERT INTO `t_commodity` VALUES (46, 1, '添加测试商品', '添加测试商品', '', 33.33, 99, NULL, '', 0, 200.00, NULL, '895*1775*690(mm)', '2019-04-22 23:38:10', '2019-04-22 23:38:10');
INSERT INTO `t_commodity` VALUES (47, 1, '添加测试商品', '添加测试商品', '', 33.33, 99, NULL, '', 0, 200.00, NULL, '895*1775*690(mm)', '2019-04-22 23:38:28', '2019-04-22 23:38:28');
INSERT INTO `t_commodity` VALUES (48, 2, '添加测试商品', '添加测试商品', '', 33.33, 99, NULL, '', 0, 200.00, NULL, '895*1775*690(mm)', '2019-04-22 23:38:44', '2019-04-22 23:38:44');
INSERT INTO `t_commodity` VALUES (49, 1, '测试', '测试', '\n', 123.00, 123, NULL, '', 0, 123.00, NULL, '123', '2019-04-22 23:39:11', '2019-04-22 23:39:11');
INSERT INTO `t_commodity` VALUES (50, 2, '1E寸电视机', '超级大', '\n', 9999999.00, 999, NULL, 'http://www.liaofushen.xyz:8080/imghub/1596426f-5374-44fb-b9a8-47ea00f18db7.jpg', 0, 999999.00, NULL, '1E*1E', '2019-04-22 23:46:21', '2019-04-22 23:46:21');
INSERT INTO `t_commodity` VALUES (51, 1, '测试一下', '没有', 'http://www.liaofushen.xyz:8080/imghub/360f2c22-179b-4c89-8aa7-ec33a2455fa8.jpg\n', 123.00, 123, NULL, '', 0, 123.00, NULL, '123', '2019-04-22 23:48:38', '2019-04-22 23:48:38');
INSERT INTO `t_commodity` VALUES (52, 2, '添加测试商品', '添加测试商品', 'http://www.liaofushen.xyz:8080/imghub/3b8ddf6a-454f-43fe-8abf-89506a58a46b.jpg\n', 33.33, 99, NULL, 'http://www.liaofushen.xyz:8080/imghub/4c16c640-cad8-43e9-a562-42fe773c99e7.jpg', 0, 200.00, NULL, '895*1775*690(mm)', '2019-04-22 23:49:01', '2019-04-22 23:49:01');
INSERT INTO `t_commodity` VALUES (53, 1, '再测试一下', '123', 'http://www.liaofushen.xyz:8080/imghub/6f68e726-05a5-4a96-80ba-946a34782958.jpg\n', 123.00, 123, NULL, 'http://www.liaofushen.xyz:8080/imghub/aa486c99-1232-4ae4-a496-0fb9defb08f4.jpg', 0, 123.00, NULL, '123', '2019-04-22 23:49:18', '2019-04-22 23:49:18');

-- ----------------------------
-- Table structure for t_cs_chat_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_cs_chat_logs`;
CREATE TABLE `t_cs_chat_logs`  (
  `Fsender_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Freceiver_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Ftime_stamp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_cs_staff
-- ----------------------------
DROP TABLE IF EXISTS `t_cs_staff`;
CREATE TABLE `t_cs_staff`  (
  `Fnumber` int(11) NOT NULL AUTO_INCREMENT,
  `Fpassword` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Fstatus` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Fnumber`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_cs_staff
-- ----------------------------
INSERT INTO `t_cs_staff` VALUES (1001, '123', 0);

-- ----------------------------
-- Table structure for t_keyword
-- ----------------------------
DROP TABLE IF EXISTS `t_keyword`;
CREATE TABLE `t_keyword`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Fcategory_id` int(11) NULL DEFAULT NULL,
  `Fname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Furl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fimg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `K_key_category_id`(`Fcategory_id`) USING BTREE,
  CONSTRAINT `K_key_category_id` FOREIGN KEY (`Fcategory_id`) REFERENCES `t_category` (`Fid`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 513 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_keyword
-- ----------------------------
INSERT INTO `t_keyword` VALUES (100, 1, '电视', 'http://www.liaofushen.xyz:8080/category?keyword=电视', 'http://liaofushen.xyz:8081/images/category-keyword-tv.jpg');
INSERT INTO `t_keyword` VALUES (101, 1, '空调', 'http://www.liaofushen.xyz:8080/category?keyword=空调', 'http://liaofushen.xyz:8081/images/category-keyword-kt.jpg');
INSERT INTO `t_keyword` VALUES (102, 1, '冰箱', 'http://www.liaofushen.xyz:8080/category?keyword=冰箱', 'http://liaofushen.xyz:8081/images/category-keyword-bx.jpg');
INSERT INTO `t_keyword` VALUES (103, 1, '电热水器', 'http://www.liaofushen.xyz:8080/category?keyword=电热水器', 'http://liaofushen.xyz:8081/images/category-keyword-rsq.jpg');
INSERT INTO `t_keyword` VALUES (200, 2, '电脑', 'http://www.liaofushen.xyz:8080/category?keyword=手机', 'http://liaofushen.xyz:8081/images/category-keyword-dn.jpg');
INSERT INTO `t_keyword` VALUES (201, 2, '手机', 'http://www.liaofushen.xyz:8080/category?keyword=电脑', 'http://liaofushen.xyz:8081/images/category-keyword-shouji.jpg');
INSERT INTO `t_keyword` VALUES (202, 2, '平板', 'http://www.liaofushen.xyz:8080/category?keyword=平板', 'http://liaofushen.xyz:8081/images/category-keyword-pingban.jpg');
INSERT INTO `t_keyword` VALUES (203, 2, '数码相机', 'http://www.liaofushen.xyz:8080/category?keyword=数码相机', 'http://liaofushen.xyz:8081/images/category-keyword-shuma.jpg');
INSERT INTO `t_keyword` VALUES (204, 2, '手机配件', 'http://www.liaofushen.xyz:8080/category?keyword=手机配件', 'http://liaofushen.xyz:8081/images/category-keyword-shouji.jpg');
INSERT INTO `t_keyword` VALUES (301, 3, '服装', 'http://www.liaofushen.xyz:8080/category?keyword=服装', 'http://liaofushen.xyz:8081/images/category-keyword-nvzhuang.jpg');
INSERT INTO `t_keyword` VALUES (302, 3, '鞋子', 'http://www.liaofushen.xyz:8080/category?keyword=鞋子', 'http://www.liaofushen.xyz:8081/images/xiezi1.jpg');
INSERT INTO `t_keyword` VALUES (303, 3, '旅行箱', 'http://www.liaofushen.xyz:8080/category?keyword=手提包', 'http://liaofushen.xyz:8081/images/category-keyword-lvxingbao.jpg');
INSERT INTO `t_keyword` VALUES (304, 3, '手提包', 'http://www.liaofushen.xyz:8080/category?keyword=手提包', 'http://liaofushen.xyz:8081/images/category-keyword-shoutibao.jpg');
INSERT INTO `t_keyword` VALUES (401, 4, '零食', 'http://www.liaofushen.xyz:8080/category?keyword=零食', 'http://liaofushen.xyz:8081/images/category-keyword-lishi.jpg');
INSERT INTO `t_keyword` VALUES (402, 4, '泡面', 'http://www.liaofushen.xyz:8080/category?keyword=泡面', 'http://www.liaofushen.xyz:8081/images/pm1.jpg');
INSERT INTO `t_keyword` VALUES (403, 4, '速冻食品', 'http://www.liaofushen.xyz:8080/category?keyword=速冻食品', 'http://liaofushen.xyz:8081/images/category-keyword-sudong.jpg');
INSERT INTO `t_keyword` VALUES (404, 4, '进口食品', 'http://www.liaofushen.xyz:8080/category?keyword=进口食品', 'http://liaofushen.xyz:8081/images/category-keyword-jingkou.jpg');
INSERT INTO `t_keyword` VALUES (501, 5, '鸡尾酒', 'http://www.liaofushen.xyz:8080/category?keyword=鸡尾酒', 'http://liaofushen.xyz:8081/images/category-keyword-baijiu.jpg');
INSERT INTO `t_keyword` VALUES (502, 5, '红茶', 'http://www.liaofushen.xyz:8080/category?keyword=红茶', 'http://www.liaofushen.xyz:8081/images/cha1.jpg');
INSERT INTO `t_keyword` VALUES (503, 5, '牛奶', 'http://www.liaofushen.xyz:8080/category?keyword=牛奶', 'http://www.liaofushen.xyz:8081/images/milk1.jpg');
INSERT INTO `t_keyword` VALUES (504, 5, '果汁', 'http://www.liaofushen.xyz:8080/category?keyword=果汁', 'http://liaofushen.xyz:8081/images/category-keyword-guozhi.jpg');
INSERT INTO `t_keyword` VALUES (505, 6, '笔', 'http://www.liaofushen.xyz:8080/category?keyword=零食', 'http://liaofushen.xyz:8081/images/default.jpg');
INSERT INTO `t_keyword` VALUES (506, 6, '纸', 'http://www.liaofushen.xyz:8080/category?keyword=纸', 'http://liaofushen.xyz:8081/images/default.jpg');
INSERT INTO `t_keyword` VALUES (507, 6, '书籍', 'http://www.liaofushen.xyz:8080/category?keyword=书籍', 'http://liaofushen.xyz:8081/images/default.jpg');
INSERT INTO `t_keyword` VALUES (508, 6, '墨水', 'http://www.liaofushen.xyz:8080/category?keyword=墨水', 'http://liaofushen.xyz:8081/images/default.jpg');
INSERT INTO `t_keyword` VALUES (509, 7, '感冒药', 'http://www.liaofushen.xyz:8080/category?keyword=感冒药', 'http://liaofushen.xyz:8081/images/default.jpg');
INSERT INTO `t_keyword` VALUES (510, 7, '凉茶', 'http://www.liaofushen.xyz:8080/category?keyword=凉茶', 'http://liaofushen.xyz:8081/images/default.jpg');
INSERT INTO `t_keyword` VALUES (511, 7, '退烧药', 'http://www.liaofushen.xyz:8080/category?keyword=退烧药', 'http://liaofushen.xyz:8081/images/default.jpg');
INSERT INTO `t_keyword` VALUES (512, 7, '止血贴', 'http://www.liaofushen.xyz:8080/category?keyword=果汁', 'http://liaofushen.xyz:8081/images/category-keyword-guozhi.jpg');

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Fmanager_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fpassword` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fcreated` datetime NULL DEFAULT NULL,
  `Fupdated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Fuser_id` int(11) NOT NULL,
  `Freceive_addr_id` int(11) NOT NULL,
  `Fweight_sum` bigint(20) NULL DEFAULT NULL COMMENT '单位: g',
  `Fprice_sum` bigint(20) NULL DEFAULT NULL COMMENT '单位：分',
  `Finstallment` tinyint(4) NULL DEFAULT 1 COMMENT '分期数',
  `Finstallment_have_paid` tinyint(4) NULL DEFAULT 0,
  `Fstatus` tinyint(4) NULL DEFAULT 0 COMMENT '订单状态：0待支付 1待发货 2待收货 3待评价 4已完成',
  `Fcreated` datetime NULL DEFAULT NULL,
  `Fupdated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `Koder_user_id`(`Fuser_id`) USING BTREE,
  INDEX `Koder_receive_addr_id`(`Freceive_addr_id`) USING BTREE,
  CONSTRAINT `Koder_receive_addr_id` FOREIGN KEY (`Freceive_addr_id`) REFERENCES `t_receive_addr` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Koder_user_id` FOREIGN KEY (`Fuser_id`) REFERENCES `t_user` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, 2, 0, 135, 1999, 1, 1, 2, '2019-03-04 14:09:50', '2019-04-28 10:23:11');
INSERT INTO `t_order` VALUES (2, 2, 0, 135, 1999, 1, 1, 2, '2019-03-04 14:09:50', '2019-03-19 00:13:34');
INSERT INTO `t_order` VALUES (11, 2, 0, 43135, 5298, 1, 0, 0, '2019-03-12 17:18:22', '2019-03-12 17:18:22');
INSERT INTO `t_order` VALUES (12, 2, 0, 43135, 5298, 1, 0, 0, '2019-03-12 17:19:13', '2019-03-12 17:19:13');
INSERT INTO `t_order` VALUES (13, 2, 0, 43135, 5298, 1, 0, 0, '2019-03-12 17:19:31', '2019-03-12 17:19:31');
INSERT INTO `t_order` VALUES (14, 1, 0, 43135, 5298, 1, 0, 0, '2019-03-12 17:25:39', '2019-03-12 17:25:39');
INSERT INTO `t_order` VALUES (15, 3, 4, 43000, 3299, 1, 0, 1, '2019-03-12 22:49:16', '2019-04-28 10:22:43');
INSERT INTO `t_order` VALUES (16, 3, 4, 43000, 3299, 1, 0, 0, '2019-03-12 22:49:28', '2019-03-12 22:49:28');
INSERT INTO `t_order` VALUES (17, 3, 4, 43000, 3299, 1, 0, 4, '2019-03-12 22:52:19', '2019-04-18 14:25:50');
INSERT INTO `t_order` VALUES (18, 2, 0, 135, 1999, 1, 0, 2, '2019-03-18 12:46:35', '2019-03-18 13:47:45');
INSERT INTO `t_order` VALUES (19, 2, 1, 135, 1999, 1, 0, 3, '2019-03-18 13:08:36', '2019-03-20 19:43:48');
INSERT INTO `t_order` VALUES (20, 2, 0, 43000, 3375, 1, 0, 0, '2019-03-20 21:30:38', '2019-03-20 21:30:38');
INSERT INTO `t_order` VALUES (21, 2, 0, 43000, 3375, 3, 1, 1, '2019-03-20 21:47:02', '2019-03-20 22:21:51');
INSERT INTO `t_order` VALUES (22, 2, 0, 43000, 3375, 3, 0, 4, '2019-03-20 22:28:41', '2019-04-20 23:44:29');
INSERT INTO `t_order` VALUES (23, 3, 4, 135, 2089, 6, 2, 1, '2019-03-21 22:42:48', '2019-03-21 23:15:48');
INSERT INTO `t_order` VALUES (24, 2, 0, 43000, 3375, 3, 0, 0, '2019-04-01 00:08:36', '2019-04-01 00:08:36');
INSERT INTO `t_order` VALUES (25, 2, 0, 43000, 3375, 3, 0, 0, '2019-04-01 00:13:06', '2019-04-01 00:13:06');
INSERT INTO `t_order` VALUES (26, 2, 0, 43000, 3299, NULL, 0, 0, '2019-04-01 00:18:24', '2019-04-01 00:18:24');
INSERT INTO `t_order` VALUES (27, 12, 6, 43000, 3546, 12, 2, 1, '2019-04-18 14:54:09', '2019-04-18 15:00:42');
INSERT INTO `t_order` VALUES (28, 1, 2, 43000, 3299, NULL, 0, 0, '2019-04-28 10:21:32', '2019-04-28 10:21:32');
INSERT INTO `t_order` VALUES (29, 1, 2, 500, 37, 3, 1, 1, '2019-05-08 21:44:22', '2019-05-08 21:44:26');
INSERT INTO `t_order` VALUES (30, 1, 2, 635, 2035, NULL, 0, 0, '2019-05-08 21:52:50', '2019-05-08 21:52:50');
INSERT INTO `t_order` VALUES (31, 14, 8, 3100, 83, NULL, 0, 0, '2019-05-08 21:55:59', '2019-05-08 21:55:59');
INSERT INTO `t_order` VALUES (32, 1, 2, 43000, 3299, NULL, 0, 0, '2019-05-08 22:39:09', '2019-05-08 22:39:09');
INSERT INTO `t_order` VALUES (33, 1, 2, 43000, 3299, NULL, 0, 0, '2019-05-08 23:23:59', '2019-05-08 23:23:59');
INSERT INTO `t_order` VALUES (34, 1, 2, 43000, 3299, NULL, 0, 0, '2019-05-08 23:25:37', '2019-05-08 23:25:37');
INSERT INTO `t_order` VALUES (35, 1, 2, 43000, 3299, NULL, 0, 0, '2019-05-08 23:28:19', '2019-05-08 23:28:19');
INSERT INTO `t_order` VALUES (36, 3, 5, 43000, 3299, NULL, 0, 0, '2019-05-08 23:29:59', '2019-05-08 23:29:59');
INSERT INTO `t_order` VALUES (37, 1, 2, 43000, 3299, NULL, 0, 0, '2019-05-08 23:40:07', '2019-05-08 23:40:07');
INSERT INTO `t_order` VALUES (38, 1, 2, 43000, 3299, NULL, 0, 0, '2019-05-08 23:41:33', '2019-05-08 23:41:33');
INSERT INTO `t_order` VALUES (39, 1, 2, 43000, 3375, 3, 0, 0, '2019-05-08 23:42:49', '2019-05-08 23:42:49');
INSERT INTO `t_order` VALUES (40, 1, 2, 43000, 3375, 3, 1, 1, '2019-05-08 23:46:06', '2019-05-08 23:46:09');
INSERT INTO `t_order` VALUES (41, 1, 2, 43000, 3546, 12, 1, 1, '2019-05-08 23:49:00', '2019-05-08 23:49:04');
INSERT INTO `t_order` VALUES (42, 1, 2, 43000, 3447, 6, 1, 1, '2019-05-08 23:57:17', '2019-05-08 23:57:21');
INSERT INTO `t_order` VALUES (43, 2, 0, 43000, 3447, 6, 1, 1, '2019-05-10 15:06:39', '2019-05-10 15:06:43');
INSERT INTO `t_order` VALUES (44, 2, 0, 135, 1999, NULL, 0, 0, '2019-05-11 08:47:39', '2019-05-11 08:47:39');

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Forder_id` int(11) NOT NULL,
  `Fcommodity_id` int(11) NOT NULL,
  `Fcommodity_num` int(11) NOT NULL,
  `Fcommodity_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fcommodity_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fcommodity_price` bigint(20) NULL DEFAULT NULL,
  `Fcommodity_weight` bigint(20) NULL DEFAULT NULL,
  `Fcreated` datetime NULL DEFAULT NULL,
  `Fupdated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `Koder_item_commodity_id`(`Fcommodity_id`) USING BTREE,
  INDEX `Korder_item_order_id`(`Forder_id`) USING BTREE,
  CONSTRAINT `Koder_item_commodity_id` FOREIGN KEY (`Fcommodity_id`) REFERENCES `t_commodity` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Korder_item_order_id` FOREIGN KEY (`Forder_id`) REFERENCES `t_order` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_order_item
-- ----------------------------
INSERT INTO `t_order_item` VALUES (1, 1, 2, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-03-04 14:21:39', '2019-03-04 14:21:39');
INSERT INTO `t_order_item` VALUES (2, 2, 6, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-03-04 14:21:39', '2019-03-04 14:21:39');
INSERT INTO `t_order_item` VALUES (21, 11, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-12 17:18:22', '2019-03-12 17:18:22');
INSERT INTO `t_order_item` VALUES (22, 11, 2, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-03-12 17:18:22', '2019-03-12 17:18:22');
INSERT INTO `t_order_item` VALUES (23, 12, 6, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-12 17:19:13', '2019-03-12 17:19:13');
INSERT INTO `t_order_item` VALUES (24, 12, 2, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-03-12 17:19:13', '2019-03-12 17:19:13');
INSERT INTO `t_order_item` VALUES (25, 13, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-12 17:19:32', '2019-03-12 17:19:32');
INSERT INTO `t_order_item` VALUES (26, 13, 2, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-03-12 17:19:32', '2019-03-12 17:19:32');
INSERT INTO `t_order_item` VALUES (27, 14, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-12 17:25:39', '2019-03-12 17:25:39');
INSERT INTO `t_order_item` VALUES (29, 15, 6, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-12 22:49:16', '2019-03-12 22:49:16');
INSERT INTO `t_order_item` VALUES (30, 16, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-12 22:49:28', '2019-03-12 22:49:28');
INSERT INTO `t_order_item` VALUES (31, 17, 5, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-12 22:52:19', '2019-03-12 22:52:19');
INSERT INTO `t_order_item` VALUES (32, 18, 2, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-03-18 12:46:35', '2019-03-18 12:46:35');
INSERT INTO `t_order_item` VALUES (33, 19, 2, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-03-18 13:08:36', '2019-03-18 13:08:36');
INSERT INTO `t_order_item` VALUES (34, 20, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-20 21:30:39', '2019-03-20 21:30:39');
INSERT INTO `t_order_item` VALUES (35, 21, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-20 21:47:02', '2019-03-20 21:47:02');
INSERT INTO `t_order_item` VALUES (36, 22, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-03-20 22:28:43', '2019-03-20 22:28:43');
INSERT INTO `t_order_item` VALUES (37, 23, 6, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-03-21 22:42:48', '2019-03-21 22:42:48');
INSERT INTO `t_order_item` VALUES (38, 24, 3, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-04-01 00:08:36', '2019-04-01 00:08:36');
INSERT INTO `t_order_item` VALUES (39, 25, 5, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-04-01 00:13:06', '2019-04-01 00:13:06');
INSERT INTO `t_order_item` VALUES (40, 26, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-04-01 00:18:24', '2019-04-01 00:18:24');
INSERT INTO `t_order_item` VALUES (41, 27, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-04-18 14:54:09', '2019-04-18 14:54:09');
INSERT INTO `t_order_item` VALUES (42, 28, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-04-28 10:21:32', '2019-04-28 10:21:32');
INSERT INTO `t_order_item` VALUES (43, 29, 12, 1, '英国AHMAD TEA/亚曼进口茶叶伯爵+柠檬红茶45包袋泡茶组合', 'http://www.liaofushen.xyz:8081/images/cha1.jpg', 36, 500, '2019-05-08 21:44:22', '2019-05-08 21:44:22');
INSERT INTO `t_order_item` VALUES (44, 30, 2, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-05-08 21:52:50', '2019-05-08 21:52:50');
INSERT INTO `t_order_item` VALUES (45, 30, 12, 1, '英国AHMAD TEA/亚曼进口茶叶伯爵+柠檬红茶45包袋泡茶组合', 'http://www.liaofushen.xyz:8081/images/cha1.jpg', 36, 500, '2019-05-08 21:52:50', '2019-05-08 21:52:50');
INSERT INTO `t_order_item` VALUES (46, 31, 15, 1, '蒙牛低脂高钙纯牛奶250ml*16盒低脂肪 高钙质', 'http://www.liaofushen.xyz:8081/images/milk1.jpg', 47, 2600, '2019-05-08 21:55:59', '2019-05-08 21:55:59');
INSERT INTO `t_order_item` VALUES (47, 31, 12, 1, '英国AHMAD TEA/亚曼进口茶叶伯爵+柠檬红茶45包袋泡茶组合', 'http://www.liaofushen.xyz:8081/images/cha1.jpg', 36, 500, '2019-05-08 21:55:59', '2019-05-08 21:55:59');
INSERT INTO `t_order_item` VALUES (48, 32, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 22:39:09', '2019-05-08 22:39:09');
INSERT INTO `t_order_item` VALUES (49, 33, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:23:59', '2019-05-08 23:23:59');
INSERT INTO `t_order_item` VALUES (50, 34, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:25:37', '2019-05-08 23:25:37');
INSERT INTO `t_order_item` VALUES (51, 35, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:28:19', '2019-05-08 23:28:19');
INSERT INTO `t_order_item` VALUES (52, 36, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:29:59', '2019-05-08 23:29:59');
INSERT INTO `t_order_item` VALUES (53, 37, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:40:07', '2019-05-08 23:40:07');
INSERT INTO `t_order_item` VALUES (54, 38, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:41:33', '2019-05-08 23:41:33');
INSERT INTO `t_order_item` VALUES (55, 39, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:42:49', '2019-05-08 23:42:49');
INSERT INTO `t_order_item` VALUES (56, 40, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:46:07', '2019-05-08 23:46:07');
INSERT INTO `t_order_item` VALUES (57, 41, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:49:00', '2019-05-08 23:49:00');
INSERT INTO `t_order_item` VALUES (58, 42, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-08 23:57:17', '2019-05-08 23:57:17');
INSERT INTO `t_order_item` VALUES (59, 43, 1, 1, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'http://www.liaofushen.xyz:8081/images/1-image.jpg', 3299, 43000, '2019-05-10 15:06:39', '2019-05-10 15:06:39');
INSERT INTO `t_order_item` VALUES (60, 44, 6, 1, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'http://www.liaofushen.xyz:8081/images/2-image.jpg', 1999, 135, '2019-05-11 08:47:39', '2019-05-11 08:47:39');

-- ----------------------------
-- Table structure for t_receive_addr
-- ----------------------------
DROP TABLE IF EXISTS `t_receive_addr`;
CREATE TABLE `t_receive_addr`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Fuser_id` int(11) NOT NULL,
  `Freceiver_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fphone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fzip_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fprovince` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fcity` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fcounty` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Faddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fcreated` datetime NULL DEFAULT NULL,
  `Fupdated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `Kuser_id`(`Fuser_id`) USING BTREE,
  CONSTRAINT `Kuser_id` FOREIGN KEY (`Fuser_id`) REFERENCES `t_user` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_receive_addr
-- ----------------------------
INSERT INTO `t_receive_addr` VALUES (0, 2, 'aa', '12345678', NULL, '广东', '深圳', '宝安', '西乡113街', '2019-03-04 21:15:37', '2019-03-04 21:15:37');
INSERT INTO `t_receive_addr` VALUES (1, 2, 'aa', '12345678', NULL, '广东', '深圳', '宝安', '西乡13街', '2019-03-04 10:48:28', '2019-03-04 10:48:31');
INSERT INTO `t_receive_addr` VALUES (2, 1, 'lfs', '12345678', NULL, '广东', '深圳', '宝安', '西乡13街', '2019-03-04 15:37:23', '2019-03-04 15:37:23');
INSERT INTO `t_receive_addr` VALUES (4, 3, '不告诉你', '123456', '528400', '广东', '中山', NULL, '不告诉你', '2019-03-08 20:47:32', '2019-03-08 20:47:32');
INSERT INTO `t_receive_addr` VALUES (5, 3, '错错错', '123123', '12312', '广东', '广州', '天河区', '对对对', '2019-03-08 20:50:46', '2019-03-08 20:50:46');
INSERT INTO `t_receive_addr` VALUES (6, 12, 'Jack', '13123456789', '528400', '广东', '中山', '东区街道', '利和广场', '2019-04-18 14:49:38', '2019-04-18 14:49:38');
INSERT INTO `t_receive_addr` VALUES (7, 12, 'Zack', '13123456789', '520000', '广东', '广州', '荔湾区', 'somewhere', '2019-04-18 14:53:16', '2019-04-18 14:53:16');
INSERT INTO `t_receive_addr` VALUES (8, 14, 'abc', '13123238989', '52698', '广东', '深圳', '南山区', '中国储能大厦', '2019-05-08 21:55:31', '2019-05-08 21:55:31');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Fusername` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fpassword` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fhead_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'http://liaofushen.xyz:8081/head-img.jpg',
  `Fsex` bit(1) NULL DEFAULT NULL COMMENT '1:boy  0:girl',
  `Femail` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fphone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fstatus` tinyint(4) NULL DEFAULT 0 COMMENT '0：有效 1：注销',
  `Fcreated` datetime NULL DEFAULT NULL,
  `Fupdated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'lfs', 'lfs', 'http://liaofushen.xyz:8081/images/head-img.jpg', b'1', '876859399@qq.com', '13318425961', 0, '2019-02-13 16:28:09', '2019-02-13 16:28:13');
INSERT INTO `t_user` VALUES (2, 'aa', 'aa', 'http://liaofushen.xyz:8081/images/head-img.jpg', b'1', '876859399@qq.com', '13318425961', 0, '2019-02-13 16:28:09', '2019-03-06 18:45:20');
INSERT INTO `t_user` VALUES (3, '123', '123', 'http://liaofushen.xyz:8081/images/head-img.jpg', b'0', '123', '123', 0, '2019-03-04 16:43:33', '2019-03-13 17:03:07');
INSERT INTO `t_user` VALUES (7, 'ss', 'ss', 'http://liaofushen.xyz:8081/head-img.jpg', NULL, NULL, NULL, 0, '2019-03-16 22:43:24', '2019-03-16 22:43:24');
INSERT INTO `t_user` VALUES (8, 'yy', 'yy', 'http://liaofushen.xyz:8081/head-img.jpg', NULL, NULL, NULL, 0, '2019-03-16 23:45:24', '2019-03-16 23:45:24');
INSERT INTO `t_user` VALUES (9, 'hehe', '123456', 'http://liaofushen.xyz:8081/head-img.jpg', NULL, NULL, NULL, 0, '2019-04-01 09:57:15', '2019-04-01 09:57:15');
INSERT INTO `t_user` VALUES (10, '1234', '1234', 'http://liaofushen.xyz:8081/head-img.jpg', NULL, NULL, NULL, 0, '2019-04-01 16:18:26', '2019-04-01 16:18:26');
INSERT INTO `t_user` VALUES (11, '2015', '2015', 'http://liaofushen.xyz:8081/head-img.jpg', NULL, NULL, NULL, 0, '2019-04-18 14:44:30', '2019-04-18 14:44:30');
INSERT INTO `t_user` VALUES (12, '2016', '2016', 'http://liaofushen.xyz:8081/head-img.jpg', b'0', '', '133', 0, '2019-04-18 14:46:26', '2019-04-18 14:48:08');
INSERT INTO `t_user` VALUES (13, 'bb', 'bb', 'http://liaofushen.xyz:8081/head-img.jpg', NULL, NULL, NULL, 0, '2019-04-18 22:54:02', '2019-04-18 22:54:02');
INSERT INTO `t_user` VALUES (14, 'abc', 'abc', 'http://liaofushen.xyz:8081/head-img.jpg', NULL, NULL, NULL, 0, '2019-05-08 21:53:45', '2019-05-08 21:53:45');

SET FOREIGN_KEY_CHECKS = 1;
