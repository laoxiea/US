/*
Navicat MySQL Data Transfer

Source Server         : wo+
Source Server Version : 50719
Source Host           : 120.52.96.172:3306
Source Database       : wo_plus

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-04-02 11:07:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wo_access_token
-- ----------------------------
DROP TABLE IF EXISTS `wo_access_token`;
CREATE TABLE `wo_access_token` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `PARTNER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作伙伴ID',
  `SCOPE` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '使用范围',
  `TOKEN` char(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '签名',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `INVALIDE_TIME` datetime DEFAULT NULL COMMENT '失效时间',
  `USE_COUNT` int(11) NOT NULL COMMENT '使用次数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_channel
-- ----------------------------
DROP TABLE IF EXISTS `wo_channel`;
CREATE TABLE `wo_channel` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `CATEGORY` tinyint(2) NOT NULL COMMENT '分类(0：集团互联网运营部 1:百度 2:淘宝 3:支付宝 4:微信 5:QQ 6:京东 9999:其他)',
  `PROVINCE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份ID',
  `PROVINCE_NAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份名称',
  `CITY_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地市ID',
  `CITY_NAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地市名称',
  `SCOPE` tinyint(2) NOT NULL COMMENT '使用范围(1:CB 2:B 3:CB+B)',
  `CHANNEL_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地市ID',
  `CHANNEL_TYPE` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '渠道类型',
  `OPERATOR_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作员ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_cityInfos
-- ----------------------------
DROP TABLE IF EXISTS `wo_cityInfos`;
CREATE TABLE `wo_cityInfos` (
  `ID` varchar(255) DEFAULT NULL,
  `CATEGORY` varchar(255) DEFAULT NULL,
  `PROVINCE_ID` varchar(255) DEFAULT NULL,
  `PROVINCE_NAME` varchar(255) DEFAULT NULL,
  `CITY_ID` varchar(255) DEFAULT NULL,
  `CITY_NAME` varchar(255) DEFAULT NULL,
  `SCOPE` varchar(255) DEFAULT NULL,
  `CHANNEL_ID` varchar(255) DEFAULT NULL,
  `CHANNEL_TYPE` varchar(255) DEFAULT NULL,
  `OPERATOR_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wo_interface
-- ----------------------------
DROP TABLE IF EXISTS `wo_interface`;
CREATE TABLE `wo_interface` (
  `ID` char(16) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `INTERFACE_NAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '接口名称',
  `INTERFACE_CODE` char(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '接口编码',
  `INTERFACE_URL` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '接口地址',
  `STATUS` tinyint(1) NOT NULL COMMENT '状态（1 正常 0：不可用）',
  `USER_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_number_segment
-- ----------------------------
DROP TABLE IF EXISTS `wo_number_segment`;
CREATE TABLE `wo_number_segment` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `NUMBER` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '号段',
  `AREA_CODE` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '区号',
  `PROVINCE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份ID',
  `PROVINCE_NAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份名称',
  `CITY_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地市ID',
  `CITY_NAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地市名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_offer
-- ----------------------------
DROP TABLE IF EXISTS `wo_offer`;
CREATE TABLE `wo_offer` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT '商品ID',
  `OFFER_NAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `OFFER_DESC` text COLLATE utf8mb4_bin COMMENT '商品描述',
  `USER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `STATUS` tinyint(2) NOT NULL COMMENT '状态',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `RESOURCE_COUNT` int(11) DEFAULT '0' COMMENT '资源量',
  `DOMESTIC_RESOURCE_COUNT` int(11) DEFAULT '0' COMMENT '国内流量',
  `PROVINCIAL_RESOURCE_COUNT` int(11) DEFAULT '0' COMMENT '省内流量',
  `UNIT` tinyint(2) DEFAULT '0' COMMENT '单位',
  `MONEY` int(11) DEFAULT '0' COMMENT '金额',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `EFFECTIVE_FLAG` tinyint(2) NOT NULL COMMENT '生效标识',
  `TYPE` tinyint(2) DEFAULT NULL COMMENT '类型 1：月非加油包2：月加油包 3：日报  4：假日包 5：SP定向包',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_offer_product
-- ----------------------------
DROP TABLE IF EXISTS `wo_offer_product`;
CREATE TABLE `wo_offer_product` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `PROVINCE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份ID',
  `OFFER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品ID',
  `PRODUCT_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_order
-- ----------------------------
DROP TABLE IF EXISTS `wo_order`;
CREATE TABLE `wo_order` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `REQ_ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT '流水号',
  `ORDER_ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT '总部订单ID',
  `PROVINCE_ORDER_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省分订单ID',
  `SERIAL_NUMBER` char(16) COLLATE utf8mb4_bin NOT NULL COMMENT '服务号码',
  `SUBSCRIBE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单号',
  `TRADE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '业务流水',
  `AREA_CODE` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '区号',
  `OPERATION_TYPE` tinyint(2) NOT NULL COMMENT '操作类型',
  `CHANNEL_TYPE` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '渠道类型',
  `OPERATOR_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作员ID',
  `CHANNEL_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地市ID',
  `PRODUCT_NAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品ID',
  `USER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `STATUS` tinyint(2) NOT NULL COMMENT '状态（1:成功 0：失败）',
  `IS_COUSTOM` tinyint(2) NOT NULL COMMENT '是否自定义产品(1:是 0:否)',
  `SUBSC_TYPE` tinyint(2) DEFAULT NULL COMMENT '订购类型（1：后付费 2：预付费）',
  `SYS_TYPE` tinyint(2) NOT NULL COMMENT '系统类型（1:CB 2:B 3:OCS）',
  `PROVINCE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份ID',
  `PRODUCT_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品ID',
  `PACKAGE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '包ID',
  `COMPONENT_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '构成ID',
  `FINANCE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资费ID',
  `ELEMENT_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '元素ID',
  `BUSI_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '业务ID',
  `RESOURCE_COUNT` int(11) DEFAULT '0' COMMENT '资源量',
  `DOMESTIC_RESOURCE_COUNT` int(11) DEFAULT '0' COMMENT '国内流量',
  `PROVINCIAL_RESOURCE_COUNT` int(11) DEFAULT '0' COMMENT '省内流量',
  `UNIT` tinyint(2) NOT NULL COMMENT '单位',
  `MONEY` int(11) DEFAULT '0' COMMENT '金额',
  `DISCOUNT` float(6,2) DEFAULT '0.00' COMMENT '折扣(0.5:折 0.7:折 0.9:折 1：全价)',
  `DEAL_FEE` float(6,2) DEFAULT '0.00' COMMENT '成交价',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `RESOURCE_TYPE` char(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源类型',
  `SCORE_VALUE` int(11) NOT NULL COMMENT '积分值',
  `PACKAGE_TYPE` tinyint(2) NOT NULL COMMENT '包类型(1:月非加油包 2:月加油包 3:日报 4:假日包)',
  `PAY_TYPE` tinyint(2) NOT NULL COMMENT '付费类型（1:前向付费即话费支付 2:后向付费即第三方支付）',
  `VALID_TIME` int(11) NOT NULL COMMENT '当前资源有效时长',
  `VALID_TIME_UNIT` tinyint(2) NOT NULL COMMENT '有效时间单位（0:月）',
  `VALID_CALCULATE_TYPE` tinyint(2) NOT NULL COMMENT '有效期计算方式（0：按自然月顺延1：日期顺延）',
  `EFFECTIVE_FLAG` tinyint(2) NOT NULL COMMENT '生效标识(0:立即生效 1:下月生效 2:顺延生效)',
  `REPEAT_COUNT` int(11) NOT NULL COMMENT '叠加次数',
  `PARTNER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作伙伴ID',
  `INTERFACE_CODE` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '业务服务编码',
  `IS_SP_PRODUCT` tinyint(2) DEFAULT '0' COMMENT '是否是SP产品 0：否 1:是',
  `SP_PARTY_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SP合作伙伴标识',
  `SP_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SP业务标识',
  `SP_SERVICE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SP唯一标识',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_partner
-- ----------------------------
DROP TABLE IF EXISTS `wo_partner`;
CREATE TABLE `wo_partner` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT '合作伙伴ID',
  `PARTNER_NAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作伙伴名称',
  `DEV_KEY` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '开发KEY',
  `DEV_SECRET` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '开发密钥',
  `STATUS` tinyint(2) NOT NULL COMMENT '状态（1 正常 0：不可用）',
  `USER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_partner_interface
-- ----------------------------
DROP TABLE IF EXISTS `wo_partner_interface`;
CREATE TABLE `wo_partner_interface` (
  `ID` char(16) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `PARTNER_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作伙伴ID',
  `INTERFACE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '接口ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_partner_offer
-- ----------------------------
DROP TABLE IF EXISTS `wo_partner_offer`;
CREATE TABLE `wo_partner_offer` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `PARTNER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合作伙伴ID',
  `OFFER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内部商品ID',
  `PROVINCE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份ID',
  `MIN_DISCOUNT` float(6,2) DEFAULT '0.00' COMMENT '最低折扣',
  `DISCOUNT` float(6,2) DEFAULT NULL COMMENT '指定折扣',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_product
-- ----------------------------
DROP TABLE IF EXISTS `wo_product`;
CREATE TABLE `wo_product` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `PRODUCT_NAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品名称', 1
  `USER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',  1
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',  无创建结束时间
  `STATUS` tinyint(2) NOT NULL COMMENT '状态(0:测试 1:有效 -1:失效)',   无
  `IS_COUSTOM` tinyint(2) NOT NULL COMMENT '是否自定义产品(1:是 0:否)',  无
  `SUBSC_TYPE` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订购类型（1:后付费 2:预付费）',  无
  `PROVINCE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份ID',  1
  `PRODUCT_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品ID',1
  `PACKAGE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '包ID',1
  `COMPONENT_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '构成ID',1
  `FINANCE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资费ID',1
  `ELEMENT_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '元素ID',
  `BUSI_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '业务ID',1
   
   缺叠加产品id
  
  `RESOURCE_COUNT` int(11) DEFAULT '0' COMMENT '资源量',1
  `DOMESTIC_RESOURCE_COUNT` int(11) DEFAULT '0' COMMENT '国内流量', 1
  `PROVINCIAL_RESOURCE_COUNT` int(11) DEFAULT '0' COMMENT '省内流量',1
  `UNIT` tinyint(2) NOT NULL COMMENT '单位',1
  `MONEY` int(11) DEFAULT '0' COMMENT '金额',1
  `DISCOUNT` float(6,2) DEFAULT '0.00' COMMENT '折扣(0.5:折 0.7:折 0.9:折 1：全价)',1
  `DEAL_FEE` float(6,2) DEFAULT '0.00' COMMENT '成交价',1
    
   这个时间是??
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',1
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',1
  

  `RESOURCE_TYPE` char(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源类型',  无
  0：全国流量
1：全国语音
2：全国短信
3: 省内流量
8：混合流量
9：混合假日流量
A：赠送长期有效省内流量
B：共享长期有效省内流量
C：长期有效省内流量
D：赠送长期有效国内流量
E：共享长期有效国内流量
F：长期有效国内流量
G：流量银行叠加流量（省内）
H：流量银行叠加流量（国内）（A-F适用于福建V网平台）
L：手厅任意值国内流量红包
O: 手厅任意日省内流量
P: 手厅任意日全国流量
Q: 手厅任意月省份流量
R: 手厅任意月全国流量
  `SCORE_VALUE` int(11) NOT NULL COMMENT '积分值',1
  `PACKAGE_TYPE` tinyint(2) NOT NULL COMMENT '包类型(1:月非加油包 2:月加油包 3:日报 4:假日包)',  1
  `PAY_TYPE` tinyint(2) NOT NULL COMMENT '付费类型（1:前向付费即话费支付 2:后向付费即第三方支付）',1
  `VALID_TIME` int(11) NOT NULL COMMENT '当前资源有效时长',1
  `VALID_TIME_UNIT` tinyint(2) NOT NULL COMMENT '有效时间单位（0:月）',1
  `VALID_CALCULATE_TYPE` tinyint(2) NOT NULL COMMENT '有效期计算方式（0：按自然月顺延1：日期顺延）',1
  `EFFECTIVE_FLAG` tinyint(2) NOT NULL COMMENT '生效标识(0:立即生效 1:下月生效 2:顺延生效)',1
  `REPEAT_COUNT` int(11) NOT NULL COMMENT '叠加次数',  无
  `INTERFACE_CODE` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '业务服务编码',   无
  
    缺少电信业务类型,业务类型编码
	
  

  `IS_SP_PRODUCT` tinyint(2) DEFAULT '0' COMMENT '是否是SP产品 0：否 1:是',
  `SP_PARTY_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SP合作伙伴标识',
  `SP_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SP业务标识',
  `SP_SERVICE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SP唯一标识',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_role
-- ----------------------------
DROP TABLE IF EXISTS `wo_role`;
CREATE TABLE `wo_role` (
  `ID` char(16) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `ROLENAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `CODE` char(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色编号',
  `PRIVILEGE` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限',
  `USER_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for wo_user
-- ----------------------------
DROP TABLE IF EXISTS `wo_user`;
CREATE TABLE `wo_user` (
  `ID` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ID',
  `USERNAME` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名称',
  `ACCOUNT` char(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '账号',
  `PASSWD` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `ROLE` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色',
  `PROVINCE_ID` char(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份ID',
  `STATUS` tinyint(1) NOT NULL COMMENT '状态（0:未激活 1:正常 -1:已冻结）',
  `USER_ID` char(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最后一次登陆时间',
  `LOGIN_TIMES` int(11) NOT NULL COMMENT '登陆次数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
