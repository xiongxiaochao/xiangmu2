/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : baiji

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-07-13 17:37:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `goodsid` int(255) NOT NULL,
  `num` varchar(255) DEFAULT NULL,
  `allprice` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(255) NOT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('3', '2', '656', '13420109134');
INSERT INTO `cart` VALUES ('1', '1', '38', '13420109135');

-- ----------------------------
-- Table structure for goodsinf
-- ----------------------------
DROP TABLE IF EXISTS `goodsinf`;
CREATE TABLE `goodsinf` (
  `goodsid` int(255) NOT NULL,
  `goodname` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `goodprice` varchar(255) DEFAULT NULL,
  `produce` varchar(255) DEFAULT NULL,
  `approve` varchar(255) DEFAULT NULL,
  `standards` varchar(255) DEFAULT NULL,
  `preferset` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `sale` int(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT '',
  `youhui` varchar(255) DEFAULT NULL,
  `kucun` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsinf
-- ----------------------------
INSERT INTO `goodsinf` VALUES ('1', '锁阳固精丸', '锁阳固精丸 6g*10袋(水蜜丸)', '38', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020553', '6g*10袋(水蜜丸)', '6盒起43元/盒', 'shop1_tab1_img1.jpg', '3', 'id1_1.jpg&id1_2.jpg&id1_3.jpg&id1_4.jpg&id1_5.jpg', '6g', '0', '10');
INSERT INTO `goodsinf` VALUES ('2', '芭克硅胶', '芭克硅胶软膏 15g', '498', '美国先进生物技术有限公司', '国械注进20162640383', '15g', '6支起415元/支', 'shop1_tab2_img1.jpg', '5', 'id2_1.jpg&id2_2.jpg&id2_3.jpg&id2_4.jpg&id2_5.jpg', '15g', '1', '10');
INSERT INTO `goodsinf` VALUES ('3', '莉芙敏片', '莉芙敏片 0.28g*30片', '328', '德国夏菩天然药物制药公司', '注册证号Z20130001', '0.28g*30片', '4盒起320元/盒 两个月疗程', 'shop2_tab1_img1.jpg', '7', 'id3_1.jpg&id3_2.jpg&id3_3.jpg&id3_4.jpg', '0.28g', '2', '10');
INSERT INTO `goodsinf` VALUES ('4', '欧龙马滴剂', '仙璐贝滴剂 50ml', '78', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20160013', '50ml', '4盒起321元/盒 两个月疗程', 'shop2_tab1_img2.jpg', '6', 'id4_1.jpg&id4_2.jpg&id4_3.jpg&id4_4.jpg&id4_5.jpg', '50ml', '3', '10');
INSERT INTO `goodsinf` VALUES ('5', '苯甲酸雌二醇软膏', '意泰丽 1.5g:1.35mg*12支', '298', '北京麦迪海药业有限责任公司', '国药准字H20000701', '1.5g:1.35mg*12支', '2盒起290元/盒', 'shop2_tab1_img3.jpg', '8', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '1.5g', '4', '10');
INSERT INTO `goodsinf` VALUES ('6', '鹿胎膏', '鹿胎膏 10g*5块/盒*2小盒/中盒', '278', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020554', '6g*11袋(水蜜丸)', '6盒起44元/盒', 'shop2_tab1_img4.jpg', '9', 'id6_1.jpg&id6_2.jpg&id6_3.jpg&id6_4.jpg&id6_5.jpg', '6g', '5', '10');
INSERT INTO `goodsinf` VALUES ('7', '万全力太', '万全力太 50mg*24片', '288', '美国先进生物技术有限公司', '国械注进20162640383', '16g', '6支起416元/支', 'shop2_tab2_img1.jpg', '0', 'id7_1.jpg&id7_2.jpg&id7_3.jpg&id7_4.jpg&id7_5.jpg', '16g', '6', '10');
INSERT INTO `goodsinf` VALUES ('8', '七十味珍珠丸', '七十味珍珠丸 1g*6丸', '298', '德国夏菩天然药物制药公司', '注册证号Z20190025', '0.28g*31片', '4盒起322元/盒 两个月疗程', 'shop2_tab2_img2.jpg', '10', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g', '7', '10');
INSERT INTO `goodsinf` VALUES ('9', '思博海', '思博海 5mg*7片', '308', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20220037', '51ml', '4盒起323元/盒 两个月疗程', 'shop2_tab2_img3.jpg', '22', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '51ml', '8', '10');
INSERT INTO `goodsinf` VALUES ('10', '益髓颗粒', '益髓颗粒 15g*2袋*10小盒', '318', '北京麦迪海药业有限责任公司', '国药准字H20000702', '1.5g:1.35mg*13支', '2盒起291元/盒', 'shop2_tab2_img4.jpg', '3', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g', '9', '10');
INSERT INTO `goodsinf` VALUES ('11', '汤臣倍健牌蛋白粉', '汤臣倍健牌蛋白粉（铁罐装）450g/罐', '328', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020555', '6g*12袋(水蜜丸)', '6盒起45元/盒', 'shop2_tab3_img1.jpg', '11', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '6g*12', '9', '10');
INSERT INTO `goodsinf` VALUES ('12', '风定宁', '风定宁 40mg*12片', '338', '美国先进生物技术有限公司', '国械注进20162640383', '17g', '6支起417元/支', 'shop2_tab4_img1.jpg', '22', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '17g', '8', '10');
INSERT INTO `goodsinf` VALUES ('13', '健骨生丸', '健骨生丸 4.5g*9袋', '348', '德国夏菩天然药物制药公司', '注册证号Z20250049', '0.28g*32片', '4盒起324元/盒 两个月疗程', 'shop2_tab4_img2.jpg', '33', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '0.28g*32', '63', '10');
INSERT INTO `goodsinf` VALUES ('14', '大风丸', '大风丸 9g*20袋*3小盒', '358', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20280061', '52ml', '4盒起325元/盒 两个月疗程', 'shop2_tab4_img3.jpg', '77', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '52ml', '23', '10');
INSERT INTO `goodsinf` VALUES ('15', '通络生骨胶囊', '通络生骨胶囊 0.5g*36粒', '368', '北京麦迪海药业有限责任公司', '国药准字H20000703', '1.5g:1.35mg*14支', '2盒起292元/盒', 'shop2_tab4_img4.jpg', '45', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '1.5g', '32', '10');
INSERT INTO `goodsinf` VALUES ('16', '生精片', '生精片 0.42g*24片', '378', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020556', '6g*13袋(水蜜丸)', '6盒起46元/盒', 'shop2_tab5_img1.jpg', '3', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '6g*13', '12', '10');
INSERT INTO `goodsinf` VALUES ('17', '艾力达', '艾力达 20mg*4片', '388', '美国先进生物技术有限公司', '国械注进20162640383', '18g', '6支起418元/支', 'shop2_tab5_img2.jpg', '45', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '18g', '12', '10');
INSERT INTO `goodsinf` VALUES ('18', '补肾填精丸', '补肾填精丸 5.6g*12袋', '398', '德国夏菩天然药物制药公司', '注册证号Z20310073', '0.28g*33片', '4盒起326元/盒 两个月疗程', 'shop2_tab5_img3.jpg', '34', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '0.28g*33', '3', '10');
INSERT INTO `goodsinf` VALUES ('19', '汇仁肾宝片', '汇仁肾宝片 0.7g*126片/瓶', '408', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20340085', '53ml', '4盒起327元/盒 两个月疗程', 'shop2_tab5_img4.jpg', '43', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '53ml', '43', '10');
INSERT INTO `goodsinf` VALUES ('20', '达力士', '达力士 15g:0.75mg', '418', '北京麦迪海药业有限责任公司', '国药准字H20000704', '1.5g:1.35mg*15支', '2盒起293元/盒', 'shop3_tab1_img1.jpg', '43', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g1.5g:1.35mg*15', '2', '10');
INSERT INTO `goodsinf` VALUES ('21', '芭克硅胶软膏', '芭克硅胶软膏 15g', '428', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020557', '6g*14袋(水蜜丸)', '6盒起47元/盒', 'shop3_tab1_img4.jpg', '7', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '6g*14', '1', '10');
INSERT INTO `goodsinf` VALUES ('22', '驱白巴布期片', '驱白巴布期片 0.51g*12片*2板', '438', '美国先进生物技术有限公司', '国械注进20162640383', '19g', '6支起419元/支', 'shop3_tab1_img2.jpg', '8', 'id5_1.jpg&id5_2.jpg&id5_3.jpg&id5_4.jpg&id5_5.jpg', '19g', '32', '10');
INSERT INTO `goodsinf` VALUES ('23', '桃红清血丸', '桃红清血丸 5g（30丸）*3板', '448', '德国夏菩天然药物制药公司', '注册证号Z20370097', '0.28g*34片', '4盒起328元/盒 两个月疗程', 'shop3_tab1_img3.jpg', '9', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*34', '54', '10');
INSERT INTO `goodsinf` VALUES ('24', '优立通', '优立通 40mg*14片', '458', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20400109', '54ml', '4盒起329元/盒 两个月疗程', 'shop3_tab2_img1.jpg', '51', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '54ml', '43', '10');
INSERT INTO `goodsinf` VALUES ('25', '泛福舒', '泛福舒3.5mg（儿童规格）*10粒', '468', '北京麦迪海药业有限责任公司', '国药准字H20000705', '1.5g:1.35mg*16支', '2盒起294元/盒', 'shop3_tab2_img2.jpg', '23', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g:1.35mg*16', '43', '10');
INSERT INTO `goodsinf` VALUES ('26', '威灵骨刺膏', '威灵骨刺膏 12g*1贴', '478', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020558', '6g*15袋(水蜜丸)', '6盒起48元/盒', 'shop3_tab2_img3.jpg', '34', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*15', '43', '10');
INSERT INTO `goodsinf` VALUES ('27', '瑞扬', '瑞扬 40mg*10片', '488', '美国先进生物技术有限公司', '国械注进20162640383', '20g', '6支起420元/支', 'shop3_tab2_img4.jpg', '45', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '20g', '65', '10');
INSERT INTO `goodsinf` VALUES ('28', '西黄丸', '西黄丸 3g*10瓶', '498', '德国夏菩天然药物制药公司', '注册证号Z20430121', '0.28g*35片', '4盒起330元/盒 两个月疗程', 'shop3_tab3_img1.jpg', '12', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*35', '5', '10');
INSERT INTO `goodsinf` VALUES ('29', '仙芝楼牌灵芝孢子油软胶囊', '仙芝楼牌灵芝孢子油软胶囊 500mg*30粒*2瓶', '508', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20460133', '55ml', '4盒起331元/盒 两个月疗程', 'shop3_tab3_img2.jpg', '12', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '55ml', '45', '10');
INSERT INTO `goodsinf` VALUES ('30', '仙芝楼牌破壁灵芝孢子粉', '仙芝楼牌破壁灵芝孢子粉 1g*20袋', '518', '北京麦迪海药业有限责任公司', '国药准字H20000706', '1.5g:1.35mg*17支', '2盒起295元/盒', 'shop3_tab3_img3.jpg', '56', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g:1.35mg*17', '1', '10');
INSERT INTO `goodsinf` VALUES ('31', '五味沙棘散', '五味沙棘散 3g*5袋', '528', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020559', '6g*16袋(水蜜丸)', '6盒起49元/盒', 'shop3_tab3_img4.jpg', '87', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*16', '21', '10');
INSERT INTO `goodsinf` VALUES ('32', '鳖甲煎丸', '鳖甲煎丸 50g', '538', '美国先进生物技术有限公司', '国械注进20162640383', '21g', '6支起421元/支', 'shop3_tab4_img1.jpg', '2', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '21g', '21', '10');
INSERT INTO `goodsinf` VALUES ('33', '扶正化瘀胶囊', '扶正化瘀胶囊 0.3g*60粒', '548', '德国夏菩天然药物制药公司', '注册证号Z20490145', '0.28g*36片', '4盒起332元/盒 两个月疗程', 'shop3_tab4_img2.jpg', '4', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*36', '12', '10');
INSERT INTO `goodsinf` VALUES ('34', '复方鳖甲软肝片', '复方鳖甲软肝片 0.5g*48片', '558', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20520157', '56ml', '4盒起333元/盒 两个月疗程', 'shop3_tab4_img3.jpg', '23', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '56ml', '23', '10');
INSERT INTO `goodsinf` VALUES ('35', '安络化纤丸', '安络化纤丸 6g*10袋', '568', '北京麦迪海药业有限责任公司', '国药准字H20000707', '1.5g:1.35mg*18支', '2盒起296元/盒', 'shop3_tab4_img4.jpg', '65', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g1.5g:1.35mg*18', '34', '10');
INSERT INTO `goodsinf` VALUES ('36', '百适可', '百适可 5mg*21片', '578', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020560', '6g*17袋(水蜜丸)', '6盒起50元/盒', 'shop3_tab5_img1.jpg', '57', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*17', '34', '10');
INSERT INTO `goodsinf` VALUES ('37', '盐酸氟西汀胶囊', '盐酸氟西汀胶囊 20mg*12粒', '588', '美国先进生物技术有限公司', '国械注进20162640383', '22g', '6支起422元/支', 'shop3_tab5_img2.jpg', '56', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '22g', '12', '10');
INSERT INTO `goodsinf` VALUES ('38', '瑞美隆', '瑞美隆 30mg*10片/盒', '598', '德国夏菩天然药物制药公司', '注册证号Z20550169', '0.28g*37片', '4盒起334元/盒 两个月疗程', 'shop3_tab5_img3.jpg', '58', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*37', '31', '10');
INSERT INTO `goodsinf` VALUES ('39', '万全力太', '万全力太 50mg*24片', '608', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20580181', '57ml', '4盒起335元/盒 两个月疗程', 'shop4_tab1_img1.jpg', '59', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '57ml', '3', '10');
INSERT INTO `goodsinf` VALUES ('40', '优普洛', '优普洛 4.5mg/10cm2 (药量释2mg/24h):7贴', '618', '北京麦迪海药业有限责任公司', '国药准字H20000708', '1.5g:1.35mg*19支', '2盒起297元/盒', 'shop4_tab1_img2.jpg', '60', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g', '14', '10');
INSERT INTO `goodsinf` VALUES ('41', '安齐来', '安齐来 1mg*14片', '628', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020561', '6g*18袋(水蜜丸)', '6盒起51元/盒', 'shop4_tab1_img3.jpg', '12', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*18', '13', '10');
INSERT INTO `goodsinf` VALUES ('42', '力备', '力备 2mg*28片', '638', '美国先进生物技术有限公司', '国械注进20162640383', '23g', '6支起423元/支', 'shop4_tab1_img4.jpg', '13', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '23g', '14', '10');
INSERT INTO `goodsinf` VALUES ('43', '芭克硅胶软膏', '芭克硅胶软膏 15g', '648', '德国夏菩天然药物制药公司', '注册证号Z20610193', '0.28g*38片', '4盒起336元/盒 两个月疗程', 'shop4_tab2_img1.jpg', '41', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*38', '24', '10');
INSERT INTO `goodsinf` VALUES ('44', '医护星尖锐克忧', '医护星尖锐克忧 2ml*8瓶', '658', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20640205', '58ml', '4盒起337元/盒 两个月疗程', 'shop4_tab2_img2.jpg', '14', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '58ml', '32', '10');
INSERT INTO `goodsinf` VALUES ('45', '醋酸氢化可的松片', '醋酸氢化可的松片 20mg*100片', '668', '北京麦迪海药业有限责任公司', '国药准字H20000709', '1.5g:1.35mg*20支', '2盒起298元/盒', 'shop4_tab2_img3.jpg', '15', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g:1.35mg*20', '45', '10');
INSERT INTO `goodsinf` VALUES ('46', '阿迈新', '阿迈新 0.6g*3片', '678', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020562', '6g*19袋(水蜜丸)', '6盒起52元/盒', 'shop4_tab2_img4.jpg', '16', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*19', '23', '10');
INSERT INTO `goodsinf` VALUES ('47', '医用冷敷贴Ⅰ型', '医用冷敷贴Ⅰ型（颈肩腰腿型）12cm*9cm*4贴', '688', '美国先进生物技术有限公司', '国械注进20162640383', '24g', '6支起424元/支', 'shop4_tab3_img1.jpg', '14', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '24g', '1', '10');
INSERT INTO `goodsinf` VALUES ('48', '黑骨藤追风活络胶囊', '黑骨藤追风活络胶囊 0.3g*12粒*3板', '698', '德国夏菩天然药物制药公司', '注册证号Z20670217', '0.28g*39片', '4盒起338元/盒 两个月疗程', 'shop4_tab3_img2.jpg', '116', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*39', '12', '10');
INSERT INTO `goodsinf` VALUES ('49', '金刺参九正合剂', '金刺参九正合剂 40ml', '708', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20700229', '59ml', '4盒起339元/盒 两个月疗程', 'shop4_tab4_img1.jpg', '16', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '59ml', '231', '10');
INSERT INTO `goodsinf` VALUES ('50', '仙芝楼牌孢子灵芝提取物粉', '仙芝楼牌孢子灵芝提取物粉 1.6g*15包', '718', '北京麦迪海药业有限责任公司', '国药准字H20000710', '1.5g:1.35mg*21支', '2盒起299元/盒', 'shop4_tab4_img2.jpg', '26', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g1.5g:1.35mg*21', '12', '10');
INSERT INTO `goodsinf` VALUES ('51', '降浊祛瘀颗粒', '降浊祛瘀颗粒 3g *12袋', '728', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020563', '6g*20袋(水蜜丸)', '6盒起53元/盒', 'shop4_tab5_img1.jpg', '25', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*20', '12', '10');
INSERT INTO `goodsinf` VALUES ('52', '首荟通便胶囊', '首荟通便胶囊 0.35g*6粒', '738', '美国先进生物技术有限公司', '国械注进20162640383', '25g', '6支起425元/支', 'shop4_tab5_img2.jpg', '24', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '25g', '1', '10');
INSERT INTO `goodsinf` VALUES ('53', '清胃止痛微丸', '清胃止痛微丸 3.2g*9袋', '748', '德国夏菩天然药物制药公司', '注册证号Z20730241', '0.28g*40片', '4盒起340元/盒 两个月疗程', 'shop4_tab5_img3.jpg', '23', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*40', '1', '10');
INSERT INTO `goodsinf` VALUES ('54', '希笛尼', '希笛尼 1mg*20片', '758', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20760253', '60ml', '4盒起341元/盒 两个月疗程', 'shop4_tab5_img4.jpg', '36', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '60ml', '21', '10');
INSERT INTO `goodsinf` VALUES ('55', '锁阳固精丸', '锁阳固精丸 6g*10袋(水蜜丸)', '38', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020553', '6g*10袋(水蜜丸)', '6盒起43元/盒', 'shop1_tab1_img1.jpg', '53', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*10', '3', '10');
INSERT INTO `goodsinf` VALUES ('56', '芭克硅胶', '芭克硅胶软膏 15g', '498', '美国先进生物技术有限公司', '国械注进20162640383', '15g', '6支起415元/支', 'shop1_tab2_img1.jpg', '35', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '15g', '34', '10');
INSERT INTO `goodsinf` VALUES ('57', '莉芙敏片', '莉芙敏片 0.28g*30片', '328', '德国夏菩天然药物制药公司', '注册证号Z20130001', '0.28g*30片', '4盒起320元/盒 两个月疗程', 'shop2_tab1_img1.jpg', '34', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*30', '2', '10');
INSERT INTO `goodsinf` VALUES ('58', '欧龙马滴剂', '仙璐贝滴剂 50ml', '78', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20160013', '15ml', '4盒起321元/盒 两个月疗程', 'shop2_tab1_img2.jpg', '33', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '15ml', '544', '10');
INSERT INTO `goodsinf` VALUES ('59', '苯甲酸雌二醇软膏', '意泰丽 1.5g:1.35mg*12支', '298', '北京麦迪海药业有限责任公司', '国药准字H20000701', '1.5g:1.35mg*12支', '2盒起290元/盒', 'shop2_tab1_img3.jpg', '32', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g1.5g:1.35mg*12', '221', '10');
INSERT INTO `goodsinf` VALUES ('60', '鹿胎膏', '鹿胎膏 10g*5块/盒*2小盒/中盒', '278', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020554', '6g*11袋(水蜜丸)', '6盒起44元/盒', 'shop2_tab1_img4.jpg', '31', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*11', '3', '10');
INSERT INTO `goodsinf` VALUES ('61', '万全力太', '万全力太 50mg*24片', '288', '美国先进生物技术有限公司', '国械注进20162640383', '16g', '6支起416元/支', 'shop2_tab2_img1.jpg', '30', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '16g', '3', '10');
INSERT INTO `goodsinf` VALUES ('62', '七十味珍珠丸', '七十味珍珠丸 1g*6丸', '298', '德国夏菩天然药物制药公司', '注册证号Z20190025', '0.28g*31片', '4盒起322元/盒 两个月疗程', 'shop2_tab2_img2.jpg', '47', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*31', '23', '10');
INSERT INTO `goodsinf` VALUES ('63', '思博海', '思博海 5mg*7片', '308', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20220037', '51ml', '4盒起323元/盒 两个月疗程', 'shop2_tab2_img3.jpg', '48', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '51ml', '3', '10');
INSERT INTO `goodsinf` VALUES ('64', '益髓颗粒', '益髓颗粒 15g*2袋*10小盒', '318', '北京麦迪海药业有限责任公司', '国药准字H20000702', '1.5g:1.35mg*13支', '2盒起291元/盒', 'shop2_tab2_img4.jpg', '49', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g1.5g:1.35mg*13', '23', '10');
INSERT INTO `goodsinf` VALUES ('65', '汤臣倍健牌蛋白粉', '汤臣倍健牌蛋白粉（铁罐装）450g/罐', '328', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020555', '6g*12袋(水蜜丸)', '6盒起45元/盒', 'shop2_tab3_img1.jpg', '40', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*12', '23', '10');
INSERT INTO `goodsinf` VALUES ('66', '风定宁', '风定宁 40mg*12片', '338', '美国先进生物技术有限公司', '国械注进20162640383', '17g', '6支起417元/支', 'shop2_tab4_img1.jpg', '53', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '17g', '32', '10');
INSERT INTO `goodsinf` VALUES ('67', '健骨生丸', '健骨生丸 4.5g*9袋', '348', '德国夏菩天然药物制药公司', '注册证号Z20250049', '0.28g*32片', '4盒起324元/盒 两个月疗程', 'shop2_tab4_img2.jpg', '52', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*32', '54', '10');
INSERT INTO `goodsinf` VALUES ('68', '大风丸', '大风丸 9g*20袋*3小盒', '358', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20280061', '52ml', '4盒起325元/盒 两个月疗程', 'shop2_tab4_img3.jpg', '39', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '52ml', '76', '10');
INSERT INTO `goodsinf` VALUES ('69', '通络生骨胶囊', '通络生骨胶囊 0.5g*36粒', '368', '北京麦迪海药业有限责任公司', '国药准字H20000703', '1.5g:1.35mg*14支', '2盒起292元/盒', 'shop2_tab4_img4.jpg', '51', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g1.5g:1.35mg*14', '87', '10');
INSERT INTO `goodsinf` VALUES ('70', '生精片', '生精片 0.42g*24片', '378', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020556', '6g*13袋(水蜜丸)', '6盒起46元/盒', 'shop2_tab5_img1.jpg', '1', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*13', '6', '10');
INSERT INTO `goodsinf` VALUES ('71', '艾力达', '艾力达 20mg*4片', '388', '美国先进生物技术有限公司', '国械注进20162640383', '18g', '6支起418元/支', 'shop2_tab5_img2.jpg', '32', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '18g', '8', '10');
INSERT INTO `goodsinf` VALUES ('72', '补肾填精丸', '补肾填精丸 5.6g*12袋', '398', '德国夏菩天然药物制药公司', '注册证号Z20310073', '0.28g*33片', '4盒起326元/盒 两个月疗程', 'shop2_tab5_img3.jpg', '19', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*33', '7', '10');
INSERT INTO `goodsinf` VALUES ('73', '汇仁肾宝片', '汇仁肾宝片 0.7g*126片/瓶', '408', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20340085', '53ml', '4盒起327元/盒 两个月疗程', 'shop2_tab5_img4.jpg', '18', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '53ml', '6', '10');
INSERT INTO `goodsinf` VALUES ('74', '达力士', '达力士 15g:0.75mg', '418', '北京麦迪海药业有限责任公司', '国药准字H20000704', '1.5g:1.35mg*15支', '2盒起293元/盒', 'shop3_tab1_img1.jpg', '17', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpgid11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g1.5g:1.35mg*15', '8', '10');
INSERT INTO `goodsinf` VALUES ('75', '芭克硅胶软膏', '芭克硅胶软膏 15g', '428', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020557', '6g*14袋(水蜜丸)', '6盒起47元/盒', 'shop3_tab1_img2.jpg', '10', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*14', '9', '10');
INSERT INTO `goodsinf` VALUES ('76', '驱白巴布期片', '驱白巴布期片 0.51g*12片*2板', '438', '美国先进生物技术有限公司', '国械注进20162640383', '19g', '6支起419元/支', 'shop3_tab1_img3.jpg', '91', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '19g', '9', '10');
INSERT INTO `goodsinf` VALUES ('77', '桃红清血丸', '桃红清血丸 5g（30丸）*3板', '448', '德国夏菩天然药物制药公司', '注册证号Z20370097', '0.28g*34片', '4盒起328元/盒 两个月疗程', 'shop3_tab1_img4.jpg', '90', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*34', '6', '10');
INSERT INTO `goodsinf` VALUES ('78', '优立通', '优立通 40mg*14片', '458', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20400109', '54ml', '4盒起329元/盒 两个月疗程', 'shop3_tab2_img1.jpg', '92', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '54ml', '3', '10');
INSERT INTO `goodsinf` VALUES ('79', '泛福舒', '泛福舒3.5mg（儿童规格）*10粒', '468', '北京麦迪海药业有限责任公司', '国药准字H20000705', '1.5g:1.35mg*16支', '2盒起294元/盒', 'shop3_tab2_img2.jpg', '93', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g:1.35mg*16', '2', '10');
INSERT INTO `goodsinf` VALUES ('80', '威灵骨刺膏', '威灵骨刺膏 12g*1贴', '478', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020558', '6g*15袋(水蜜丸)', '6盒起48元/盒', 'shop3_tab2_img3.jpg', '94', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*15', '32', '10');
INSERT INTO `goodsinf` VALUES ('81', '瑞扬', '瑞扬 40mg*10片', '488', '美国先进生物技术有限公司', '国械注进20162640383', '20g', '6支起420元/支', 'shop3_tab2_img4.jpg', '22', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '20g', '29', '10');
INSERT INTO `goodsinf` VALUES ('82', '西黄丸', '西黄丸 3g*10瓶', '498', '德国夏菩天然药物制药公司', '注册证号Z20430121', '0.28g*35片', '4盒起330元/盒 两个月疗程', 'shop3_tab3_img1.jpg', '11', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpgid11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g', '18', '10');
INSERT INTO `goodsinf` VALUES ('83', '仙芝楼牌灵芝孢子油软胶囊', '仙芝楼牌灵芝孢子油软胶囊 500mg*30粒*2瓶', '508', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20460133', '55ml', '4盒起331元/盒 两个月疗程', 'shop3_tab3_img2.jpg', '11', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '55ml', '71', '10');
INSERT INTO `goodsinf` VALUES ('84', '仙芝楼牌破壁灵芝孢子粉', '仙芝楼牌破壁灵芝孢子粉 1g*20袋', '518', '北京麦迪海药业有限责任公司', '国药准字H20000706', '1.5g:1.35mg*17支', '2盒起295元/盒', 'shop3_tab3_img3.jpg', '11', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g1.5g:1.35mg*17', '17', '10');
INSERT INTO `goodsinf` VALUES ('85', '五味沙棘散', '五味沙棘散 3g*5袋', '528', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020559', '6g*16袋(水蜜丸)', '6盒起49元/盒', 'shop3_tab3_img4.jpg', '11', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*16', '29', '10');
INSERT INTO `goodsinf` VALUES ('86', '鳖甲煎丸', '鳖甲煎丸 50g', '538', '美国先进生物技术有限公司', '国械注进20162640383', '21g', '6支起421元/支', 'shop3_tab4_img1.jpg', '11', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '21g', '28', '10');
INSERT INTO `goodsinf` VALUES ('87', '扶正化瘀胶囊', '扶正化瘀胶囊 0.3g*60粒', '548', '德国夏菩天然药物制药公司', '注册证号Z20490145', '0.28g*36片', '4盒起332元/盒 两个月疗程', 'shop3_tab4_img2.jpg', '11', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*36', '2', '10');
INSERT INTO `goodsinf` VALUES ('88', '复方鳖甲软肝片', '复方鳖甲软肝片 0.5g*48片', '558', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20520157', '56ml', '4盒起333元/盒 两个月疗程', 'shop3_tab4_img3.jpg', '22', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '56ml', '17', '10');
INSERT INTO `goodsinf` VALUES ('89', '安络化纤丸', '安络化纤丸 6g*10袋', '568', '北京麦迪海药业有限责任公司', '国药准字H20000707', '1.5g:1.35mg*18支', '2盒起296元/盒', 'shop3_tab4_img4.jpg', '22', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g:1.35mg*18', '6', '10');
INSERT INTO `goodsinf` VALUES ('90', '百适可', '百适可 5mg*21片', '578', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020560', '6g*17袋(水蜜丸)', '6盒起50元/盒', 'shop3_tab5_img1.jpg', '22', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*17', '1', '10');
INSERT INTO `goodsinf` VALUES ('91', '盐酸氟西汀胶囊', '盐酸氟西汀胶囊 20mg*12粒', '588', '美国先进生物技术有限公司', '国械注进20162640383', '22g', '6支起422元/支', 'shop3_tab5_img2.jpg', '33', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '22g', '1', '10');
INSERT INTO `goodsinf` VALUES ('92', '瑞美隆', '瑞美隆 30mg*10片/盒', '598', '德国夏菩天然药物制药公司', '注册证号Z20550169', '0.28g*37片', '4盒起334元/盒 两个月疗程', 'shop3_tab5_img3.jpg', '33', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*37', '7', '10');
INSERT INTO `goodsinf` VALUES ('93', '万全力太', '万全力太 50mg*24片', '608', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20580181', '57ml', '4盒起335元/盒 两个月疗程', 'shop4_tab1_img1.jpg', '33', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '57ml', '7', '10');
INSERT INTO `goodsinf` VALUES ('94', '优普洛', '优普洛 4.5mg/10cm2 (药量释2mg/24h):7贴', '618', '北京麦迪海药业有限责任公司', '国药准字H20000708', '1.5g:1.35mg*19支', '2盒起297元/盒', 'shop4_tab1_img2.jpg', '33', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g:1.35mg*19', '6', '10');
INSERT INTO `goodsinf` VALUES ('95', '安齐来', '安齐来 1mg*14片', '628', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020561', '6g*18袋(水蜜丸)', '6盒起51元/盒', 'shop4_tab1_img3.jpg', '33', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*18', '4', '10');
INSERT INTO `goodsinf` VALUES ('96', '力备', '力备 2mg*28片', '638', '美国先进生物技术有限公司', '国械注进20162640383', '23g', '6支起423元/支', 'shop4_tab1_img4.jpg', '33', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '23g', '5', '10');
INSERT INTO `goodsinf` VALUES ('97', '芭克硅胶软膏', '芭克硅胶软膏 15g', '648', '德国夏菩天然药物制药公司', '注册证号Z20610193', '0.28g*38片', '4盒起336元/盒 两个月疗程', 'shop4_tab2_img1.jpg', '44', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*38', '32', '10');
INSERT INTO `goodsinf` VALUES ('98', '医护星尖锐克忧', '医护星尖锐克忧 2ml*8瓶', '658', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20640205', '58ml', '4盒起337元/盒 两个月疗程', 'shop4_tab2_img2.jpg', '44', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '58ml', '2', '10');
INSERT INTO `goodsinf` VALUES ('99', '醋酸氢化可的松片', '醋酸氢化可的松片 20mg*100片', '668', '北京麦迪海药业有限责任公司', '国药准字H20000709', '1.5g:1.35mg*20支', '2盒起298元/盒', 'shop4_tab2_img3.jpg', '44', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g:1.35mg*20', '54', '10');
INSERT INTO `goodsinf` VALUES ('100', '阿迈新', '阿迈新 0.6g*3片', '678', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020562', '6g*19袋(水蜜丸)', '6盒起52元/盒', 'shop4_tab2_img4.jpg', '44', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*19', '5', '10');
INSERT INTO `goodsinf` VALUES ('101', '医用冷敷贴Ⅰ型', '医用冷敷贴Ⅰ型（颈肩腰腿型）12cm*9cm*4贴', '688', '美国先进生物技术有限公司', '国械注进20162640383', '24g', '6支起424元/支', 'shop4_tab3_img1.jpg', '55', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '24g', '8', '10');
INSERT INTO `goodsinf` VALUES ('102', '黑骨藤追风活络胶囊', '黑骨藤追风活络胶囊 0.3g*12粒*3板', '698', '德国夏菩天然药物制药公司', '注册证号Z20670217', '0.28g*39片', '4盒起338元/盒 两个月疗程', 'shop4_tab3_img2.jpg', '55', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*39', '8', '10');
INSERT INTO `goodsinf` VALUES ('103', '金刺参九正合剂', '金刺参九正合剂 40ml', '708', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20700229', '59ml', '4盒起339元/盒 两个月疗程', 'shop4_tab4_img1.jpg', '66', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '59ml', '5', '10');
INSERT INTO `goodsinf` VALUES ('104', '仙芝楼牌孢子灵芝提取物粉', '仙芝楼牌孢子灵芝提取物粉 1.6g*15包', '718', '北京麦迪海药业有限责任公司', '国药准字H20000710', '1.5g:1.35mg*21支', '2盒起299元/盒', 'shop4_tab4_img2.jpg', '66', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '1.5g:1.35mg*21', '65', '10');
INSERT INTO `goodsinf` VALUES ('105', '降浊祛瘀颗粒', '降浊祛瘀颗粒 3g *12袋', '728', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020563', '6g*20袋(水蜜丸)', '6盒起53元/盒', 'shop4_tab5_img1.jpg', '77', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*20', '65', '10');
INSERT INTO `goodsinf` VALUES ('106', '首荟通便胶囊', '首荟通便胶囊 0.35g*6粒', '738', '美国先进生物技术有限公司', '国械注进20162640383', '25g', '6支起425元/支', 'shop4_tab5_img2.jpg', '77', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '25g', '5', '10');
INSERT INTO `goodsinf` VALUES ('107', '清胃止痛微丸', '清胃止痛微丸 3.2g*9袋', '748', '德国夏菩天然药物制药公司', '注册证号Z20730241', '0.28g*40片', '4盒起340元/盒 两个月疗程', 'shop4_tab5_img3.jpg', '77', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '0.28g*40', '4', '10');
INSERT INTO `goodsinf` VALUES ('108', '希笛尼', '希笛尼 1mg*20片', '758', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20760253', '60ml', '4盒起341元/盒 两个月疗程', 'shop4_tab5_img4.jpg', '77', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '60ml', '3', '10');
INSERT INTO `goodsinf` VALUES ('109', '锁阳固精丸', '锁阳固精丸 6g*10袋(水蜜丸)', '38', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020553', '6g*10袋(水蜜丸)', '6盒起43元/盒', 'shop1_tab1_img1.jpg', '77', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_5.jpg', '6g*10', '3', '10');
INSERT INTO `goodsinf` VALUES ('110', '芭克硅胶', '芭克硅胶软膏 15g', '498', '美国先进生物技术有限公司', '国械注进20162640383', '15g', '6支起415元/支', 'shop1_tab2_img1.jpg', '88', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '15g', '2', '10');
INSERT INTO `goodsinf` VALUES ('111', '莉芙敏片', '莉芙敏片 0.28g*30片', '328', '德国夏菩天然药物制药公司', '注册证号Z20130001', '0.28g*30片', '4盒起320元/盒 两个月疗程', 'shop2_tab1_img1.jpg', '88', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*30', '6', '10');
INSERT INTO `goodsinf` VALUES ('112', '欧龙马滴剂', '仙璐贝滴剂 50ml', '78', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20160013', '50ml', '4盒起321元/盒 两个月疗程', 'shop2_tab1_img2.jpg', '88', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '50ml', '76', '10');
INSERT INTO `goodsinf` VALUES ('113', '苯甲酸雌二醇软膏', '意泰丽 1.5g:1.35mg*12支', '298', '北京麦迪海药业有限责任公司', '国药准字H20000701', '1.5g:1.35mg*12支', '2盒起290元/盒', 'shop2_tab1_img3.jpg', '99', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*12', '5', '10');
INSERT INTO `goodsinf` VALUES ('114', '鹿胎膏', '鹿胎膏 10g*5块/盒*2小盒/中盒', '278', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020554', '6g*11袋(水蜜丸)', '6盒起44元/盒', 'shop2_tab1_img4.jpg', '88', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*11', '34', '10');
INSERT INTO `goodsinf` VALUES ('115', '万全力太', '万全力太 50mg*24片', '288', '美国先进生物技术有限公司', '国械注进20162640383', '16g', '6支起416元/支', 'shop2_tab2_img1.jpg', '99', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '16g', '23', '10');
INSERT INTO `goodsinf` VALUES ('116', '七十味珍珠丸', '七十味珍珠丸 1g*6丸', '298', '德国夏菩天然药物制药公司', '注册证号Z20190025', '0.28g*31片', '4盒起322元/盒 两个月疗程', 'shop2_tab2_img2.jpg', '99', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*31', '65', '10');
INSERT INTO `goodsinf` VALUES ('117', '思博海', '思博海 5mg*7片', '308', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20220037', '51ml', '4盒起323元/盒 两个月疗程', 'shop2_tab2_img3.jpg', '90', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '51ml', '87', '10');
INSERT INTO `goodsinf` VALUES ('118', '益髓颗粒', '益髓颗粒 15g*2袋*10小盒', '318', '北京麦迪海药业有限责任公司', '国药准字H20000702', '1.5g:1.35mg*13支', '2盒起291元/盒', 'shop2_tab2_img4.jpg', '90', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*13', '43', '10');
INSERT INTO `goodsinf` VALUES ('119', '汤臣倍健牌蛋白粉', '汤臣倍健牌蛋白粉（铁罐装）450g/罐', '328', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020555', '6g*12袋(水蜜丸)', '6盒起45元/盒', 'shop2_tab3_img1.jpg', '90', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*12', '23', '10');
INSERT INTO `goodsinf` VALUES ('120', '风定宁', '风定宁 40mg*12片', '338', '美国先进生物技术有限公司', '国械注进20162640383', '17g', '6支起417元/支', 'shop2_tab4_img1.jpg', '9', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '17g', '32', '10');
INSERT INTO `goodsinf` VALUES ('121', '健骨生丸', '健骨生丸 4.5g*9袋', '348', '德国夏菩天然药物制药公司', '注册证号Z20250049', '0.28g*32片', '4盒起324元/盒 两个月疗程', 'shop2_tab4_img2.jpg', '80', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*32', '2', '10');
INSERT INTO `goodsinf` VALUES ('122', '大风丸', '大风丸 9g*20袋*3小盒', '358', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20280061', '52ml', '4盒起325元/盒 两个月疗程', 'shop2_tab4_img3.jpg', '80', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '52ml', '4', '10');
INSERT INTO `goodsinf` VALUES ('123', '通络生骨胶囊', '通络生骨胶囊 0.5g*36粒', '368', '北京麦迪海药业有限责任公司', '国药准字H20000703', '1.5g:1.35mg*14支', '2盒起292元/盒', 'shop2_tab4_img4.jpg', '70', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*14', '56', '10');
INSERT INTO `goodsinf` VALUES ('124', '生精片', '生精片 0.42g*24片', '378', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020556', '6g*13袋(水蜜丸)', '6盒起46元/盒', 'shop2_tab5_img1.jpg', '70', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*13', '5', '10');
INSERT INTO `goodsinf` VALUES ('125', '艾力达', '艾力达 20mg*4片', '388', '美国先进生物技术有限公司', '国械注进20162640383', '18g', '6支起418元/支', 'shop2_tab5_img2.jpg', '70', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '18g', '33', '10');
INSERT INTO `goodsinf` VALUES ('126', '补肾填精丸', '补肾填精丸 5.6g*12袋', '398', '德国夏菩天然药物制药公司', '注册证号Z20310073', '0.28g*33片', '4盒起326元/盒 两个月疗程', 'shop2_tab5_img3.jpg', '60', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*33', '54', '10');
INSERT INTO `goodsinf` VALUES ('127', '汇仁肾宝片', '汇仁肾宝片 0.7g*126片/瓶', '408', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20340085', '53ml', '4盒起327元/盒 两个月疗程', 'shop2_tab5_img4.jpg', '60', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '53ml', '54', '10');
INSERT INTO `goodsinf` VALUES ('128', '达力士', '达力士 15g:0.75mg', '418', '北京麦迪海药业有限责任公司', '国药准字H20000704', '1.5g:1.35mg*15支', '2盒起293元/盒', 'shop3_tab1_img1.jpg', '60', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*15', '54', '10');
INSERT INTO `goodsinf` VALUES ('129', '芭克硅胶软膏', '芭克硅胶软膏 15g', '428', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020557', '6g*14袋(水蜜丸)', '6盒起47元/盒', 'shop3_tab1_img2.jpg', '50', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*14', '65', '10');
INSERT INTO `goodsinf` VALUES ('130', '驱白巴布期片', '驱白巴布期片 0.51g*12片*2板', '438', '美国先进生物技术有限公司', '国械注进20162640383', '19g', '6支起419元/支', 'shop3_tab1_img3.jpg', '50', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '19g', '67', '10');
INSERT INTO `goodsinf` VALUES ('131', '桃红清血丸', '桃红清血丸 5g（30丸）*3板', '448', '德国夏菩天然药物制药公司', '注册证号Z20370097', '0.28g*34片', '4盒起328元/盒 两个月疗程', 'shop3_tab1_img4.jpg', '50', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*34', '8', '10');
INSERT INTO `goodsinf` VALUES ('132', '优立通', '优立通 40mg*14片', '458', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20400109', '54ml', '4盒起329元/盒 两个月疗程', 'shop3_tab2_img1.jpg', '40', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '54ml', '8', '10');
INSERT INTO `goodsinf` VALUES ('133', '泛福舒', '泛福舒3.5mg（儿童规格）*10粒', '468', '北京麦迪海药业有限责任公司', '国药准字H20000705', '1.5g:1.35mg*16支', '2盒起294元/盒', 'shop3_tab2_img2.jpg', '94', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*16', '65', '10');
INSERT INTO `goodsinf` VALUES ('134', '威灵骨刺膏', '威灵骨刺膏 12g*1贴', '478', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020558', '6g*15袋(水蜜丸)', '6盒起48元/盒', 'shop3_tab2_img3.jpg', '48', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*15', '64', '10');
INSERT INTO `goodsinf` VALUES ('135', '瑞扬', '瑞扬 40mg*10片', '488', '美国先进生物技术有限公司', '国械注进20162640383', '20g', '6支起420元/支', 'shop3_tab2_img4.jpg', '47', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '20g', '54', '10');
INSERT INTO `goodsinf` VALUES ('136', '西黄丸', '西黄丸 3g*10瓶', '498', '德国夏菩天然药物制药公司', '注册证号Z20430121', '0.28g*35片', '4盒起330元/盒 两个月疗程', 'shop3_tab3_img1.jpg', '46', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*35', '53', '10');
INSERT INTO `goodsinf` VALUES ('137', '仙芝楼牌灵芝孢子油软胶囊', '仙芝楼牌灵芝孢子油软胶囊 500mg*30粒*2瓶', '508', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20460133', '55ml', '4盒起331元/盒 两个月疗程', 'shop3_tab3_img2.jpg', '36', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '55ml', '53', '10');
INSERT INTO `goodsinf` VALUES ('138', '仙芝楼牌破壁灵芝孢子粉', '仙芝楼牌破壁灵芝孢子粉 1g*20袋', '518', '北京麦迪海药业有限责任公司', '国药准字H20000706', '1.5g:1.35mg*17支', '2盒起295元/盒', 'shop3_tab3_img3.jpg', '3', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*17', '64', '10');
INSERT INTO `goodsinf` VALUES ('139', '五味沙棘散', '五味沙棘散 3g*5袋', '528', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020559', '6g*16袋(水蜜丸)', '6盒起49元/盒', 'shop3_tab3_img4.jpg', '63', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*16', '64', '10');
INSERT INTO `goodsinf` VALUES ('140', '鳖甲煎丸', '鳖甲煎丸 50g', '538', '美国先进生物技术有限公司', '国械注进20162640383', '21g', '6支起421元/支', 'shop3_tab4_img1.jpg', '6', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '21g', '64', '10');
INSERT INTO `goodsinf` VALUES ('141', '扶正化瘀胶囊', '扶正化瘀胶囊 0.3g*60粒', '548', '德国夏菩天然药物制药公司', '注册证号Z20490145', '0.28g*36片', '4盒起332元/盒 两个月疗程', 'shop3_tab4_img2.jpg', '6', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*36', '64', '10');
INSERT INTO `goodsinf` VALUES ('142', '复方鳖甲软肝片', '复方鳖甲软肝片 0.5g*48片', '558', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20520157', '56ml', '4盒起333元/盒 两个月疗程', 'shop3_tab4_img3.jpg', '6', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '56ml', '64', '10');
INSERT INTO `goodsinf` VALUES ('143', '安络化纤丸', '安络化纤丸 6g*10袋', '568', '北京麦迪海药业有限责任公司', '国药准字H20000707', '1.5g:1.35mg*18支', '2盒起296元/盒', 'shop3_tab4_img4.jpg', '6', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*18', '5', '10');
INSERT INTO `goodsinf` VALUES ('144', '百适可', '百适可 5mg*21片', '578', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020560', '6g*17袋(水蜜丸)', '6盒起50元/盒', 'shop3_tab5_img1.jpg', '6', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*17', '46', '10');
INSERT INTO `goodsinf` VALUES ('145', '盐酸氟西汀胶囊', '盐酸氟西汀胶囊 20mg*12粒', '588', '美国先进生物技术有限公司', '国械注进20162640383', '22g', '6支起422元/支', 'shop3_tab5_img2.jpg', '6', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '22g', '4', '10');
INSERT INTO `goodsinf` VALUES ('146', '瑞美隆', '瑞美隆 30mg*10片/盒', '598', '德国夏菩天然药物制药公司', '注册证号Z20550169', '0.28g*37片', '4盒起334元/盒 两个月疗程', 'shop3_tab5_img3.jpg', '7', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*37', '4', '10');
INSERT INTO `goodsinf` VALUES ('147', '万全力太', '万全力太 50mg*24片', '608', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20580181', '57ml', '4盒起335元/盒 两个月疗程', 'shop4_tab1_img1.jpg', '7', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '57ml', '4', '10');
INSERT INTO `goodsinf` VALUES ('148', '优普洛', '优普洛 4.5mg/10cm2 (药量释2mg/24h):7贴', '618', '北京麦迪海药业有限责任公司', '国药准字H20000708', '1.5g:1.35mg*19支', '2盒起297元/盒', 'shop4_tab1_img2.jpg', '7', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*19', '4', '10');
INSERT INTO `goodsinf` VALUES ('149', '安齐来', '安齐来 1mg*14片', '628', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020561', '6g*18袋(水蜜丸)', '6盒起51元/盒', 'shop4_tab1_img3.jpg', '7', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*18', '645', '10');
INSERT INTO `goodsinf` VALUES ('150', '力备', '力备 2mg*28片', '638', '美国先进生物技术有限公司', '国械注进20162640383', '23g', '6支起423元/支', 'shop4_tab1_img4.jpg', '8', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '23g', '6', '10');
INSERT INTO `goodsinf` VALUES ('151', '芭克硅胶软膏', '芭克硅胶软膏 15g', '648', '德国夏菩天然药物制药公司', '注册证号Z20610193', '0.28g*89片', '4盒起336元/盒 两个月疗程', 'shop4_tab2_img1.jpg', '8', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*38', '6', '10');
INSERT INTO `goodsinf` VALUES ('152', '医护星尖锐克忧', '医护星尖锐克忧 2ml*8瓶', '658', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20640205', '58ml', '4盒起337元/盒 两个月疗程', 'shop4_tab2_img2.jpg', '8', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '58ml', '6', '10');
INSERT INTO `goodsinf` VALUES ('153', '醋酸氢化可的松片', '醋酸氢化可的松片 20mg*100片', '668', '北京麦迪海药业有限责任公司', '国药准字H20000709', '1.5g:1.35mg*20支', '2盒起298元/盒', 'shop4_tab2_img3.jpg', '8', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*20', '65', '10');
INSERT INTO `goodsinf` VALUES ('154', '阿迈新', '阿迈新 0.6g*3片', '678', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020562', '6g*19袋(水蜜丸)', '6盒起52元/盒', 'shop4_tab2_img4.jpg', '53', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*19', '65', '10');
INSERT INTO `goodsinf` VALUES ('155', '医用冷敷贴Ⅰ型', '医用冷敷贴Ⅰ型（颈肩腰腿型）12cm*9cm*4贴', '688', '美国先进生物技术有限公司', '国械注进20162640383', '24g', '6支起424元/支', 'shop4_tab3_img1.jpg', '5', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '24g', '65', '10');
INSERT INTO `goodsinf` VALUES ('156', '黑骨藤追风活络胶囊', '黑骨藤追风活络胶囊 0.3g*12粒*3板', '698', '德国夏菩天然药物制药公司', '注册证号Z20670217', '0.28g*39片', '4盒起338元/盒 两个月疗程', 'shop4_tab3_img2.jpg', '53', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*39', '665', '10');
INSERT INTO `goodsinf` VALUES ('157', '金刺参九正合剂', '金刺参九正合剂 40ml', '708', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20700229', '59ml', '4盒起339元/盒 两个月疗程', 'shop4_tab4_img1.jpg', '5', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '59ml', '65', '10');
INSERT INTO `goodsinf` VALUES ('158', '仙芝楼牌孢子灵芝提取物粉', '仙芝楼牌孢子灵芝提取物粉 1.6g*15包', '718', '北京麦迪海药业有限责任公司', '国药准字H20000710', '1.5g:1.35mg*21支', '2盒起299元/盒', 'shop4_tab4_img2.jpg', '5', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '1.5g:1.35mg*21', '65', '10');
INSERT INTO `goodsinf` VALUES ('159', '降浊祛瘀颗粒', '降浊祛瘀颗粒 3g *12袋', '728', '太极集团重庆桐君阁药厂有限公司', '国药准字Z50020563', '6g*20袋(水蜜丸)', '6盒起53元/盒', 'shop4_tab5_img1.jpg', '35', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '6g*20', '65', '10');
INSERT INTO `goodsinf` VALUES ('160', '首荟通便胶囊', '首荟通便胶囊 0.35g*6粒', '738', '美国先进生物技术有限公司', '国械注进20162640383', '25g', '6支起425元/支', 'shop4_tab5_img2.jpg', '35', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '25g', '65', '10');
INSERT INTO `goodsinf` VALUES ('161', '清胃止痛微丸', '清胃止痛微丸 3.2g*9袋', '748', '德国夏菩天然药物制药公司', '注册证号Z20730241', '0.28g*40片', '4盒起340元/盒 两个月疗程', 'shop4_tab5_img3.jpg', '42', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '0.28g*40', '65', '10');
INSERT INTO `goodsinf` VALUES ('162', '希笛尼', '希笛尼 1mg*20片', '758', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20760253', '60ml', '4盒起341元/盒 两个月疗程', 'shop4_tab5_img4.jpg', '124', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '60ml', '65', '10');
INSERT INTO `goodsinf` VALUES ('163', '希笛尼', '希笛尼 1mg*20片', '769', '德国比奥罗历加欧洲股份有限公司', '注册证号Z20760253', '60ml', '4盒起32元', 'shop4_tab5_img4.jpg', '33', 'id11_1.jpg&id11_2.jpg&id11_3.jpg&id11_4.jpg&id11_1.jpg', '60ml', '6', '10');

-- ----------------------------
-- Table structure for tabs_img
-- ----------------------------
DROP TABLE IF EXISTS `tabs_img`;
CREATE TABLE `tabs_img` (
  `tabid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) DEFAULT NULL,
  `tabname` varchar(255) DEFAULT NULL,
  `tab` int(11) NOT NULL,
  PRIMARY KEY (`tabid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tabs_img
-- ----------------------------
INSERT INTO `tabs_img` VALUES ('1', null, '泌尿生殖', '1');
INSERT INTO `tabs_img` VALUES ('2', null, '皮肤性病', '1');
INSERT INTO `tabs_img` VALUES ('3', null, '肿瘤', '2');
INSERT INTO `tabs_img` VALUES ('4', null, '妇儿', '2');
INSERT INTO `tabs_img` VALUES ('5', null, '神经', '2');
INSERT INTO `tabs_img` VALUES ('6', null, '保健食品', '2');
INSERT INTO `tabs_img` VALUES ('7', null, '风湿免疫', '2');
INSERT INTO `tabs_img` VALUES ('8', null, '泌尿生殖', '2');
INSERT INTO `tabs_img` VALUES ('9', null, '皮肤性病', '3');
INSERT INTO `tabs_img` VALUES ('10', null, '风湿免疫', '3');
INSERT INTO `tabs_img` VALUES ('11', null, '肿瘤', '3');
INSERT INTO `tabs_img` VALUES ('12', null, '肝病', '3');
INSERT INTO `tabs_img` VALUES ('13', null, '精神', '3');
INSERT INTO `tabs_img` VALUES ('14', null, '神经', '4');
INSERT INTO `tabs_img` VALUES ('15', null, '皮肤性病', '4');
INSERT INTO `tabs_img` VALUES ('16', null, '风湿免疫', '4');
INSERT INTO `tabs_img` VALUES ('17', null, '肿瘤', '4');
INSERT INTO `tabs_img` VALUES ('18', null, '消化', '4');

-- ----------------------------
-- Table structure for userinf
-- ----------------------------
DROP TABLE IF EXISTS `userinf`;
CREATE TABLE `userinf` (
  `userid` int(225) unsigned NOT NULL AUTO_INCREMENT,
  `phoneNum` varchar(225) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinf
-- ----------------------------
INSERT INTO `userinf` VALUES ('1', '13420109135', null, null, '123456aa');
INSERT INTO `userinf` VALUES ('2', '13420109136', null, null, '123456aa');
INSERT INTO `userinf` VALUES ('3', '12345678901', null, null, '123456');
INSERT INTO `userinf` VALUES ('4', '12345678901', null, null, '123456');
INSERT INTO `userinf` VALUES ('5', '13420109134', null, null, '123456aa');
INSERT INTO `userinf` VALUES ('6', '13420109137', null, null, '123456aa');
INSERT INTO `userinf` VALUES ('7', '13420109138', null, null, '123456aa');
INSERT INTO `userinf` VALUES ('8', '13220109132', null, null, '123456aa');
INSERT INTO `userinf` VALUES ('9', '13420101234', null, null, '123456aa');
SET FOREIGN_KEY_CHECKS=1;
