-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.25a - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 visitor 的数据库结构
CREATE DATABASE IF NOT EXISTS `visitor` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `visitor`;

-- 导出  表 visitor.equipment 结构
CREATE TABLE IF NOT EXISTS `equipment` (
  `eqId` varchar(50) NOT NULL COMMENT '设备id',
  `sortName` varchar(255) DEFAULT NULL COMMENT '所属分类',
  `eqName` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `model` varchar(255) DEFAULT NULL COMMENT '型号',
  `unitPrice` double(20,2) DEFAULT NULL COMMENT '单价',
  `placeOfOrigin` varchar(255) DEFAULT NULL COMMENT '产地',
  `supName` varchar(255) DEFAULT NULL COMMENT '供应商',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `isEnd` int(11) DEFAULT NULL COMMENT '是否过期（0正常 1过期 ）',
  `isOk` int(11) DEFAULT NULL COMMENT '是否损坏（0正常 1损坏 ）',
  `isTime` datetime DEFAULT NULL COMMENT '损坏时间',
  `isUser` varchar(50) DEFAULT NULL COMMENT '损坏人',
  `isRes` varchar(255) DEFAULT NULL COMMENT '损坏原因',
  `isType` varchar(255) DEFAULT '3' COMMENT '0出库 1入库 3正常',
  `remakes` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`eqId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  visitor.equipment 的数据：2 rows
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
REPLACE INTO `equipment` (`eqId`, `sortName`, `eqName`, `model`, `unitPrice`, `placeOfOrigin`, `supName`, `createTime`, `isEnd`, `isOk`, `isTime`, `isUser`, `isRes`, `isType`, `remakes`) VALUES
	('e9e63', 'fc7d6', '问问', '223dd', 232.00, '是', '瑟得瑟', '2019-05-26 14:24:46', 1, 0, '2019-05-26 00:00:00', '1', 'ASASA1', '1', '瑟得瑟'),
	('3226e', 'fc7d6', '呆脑', '华硕', 3999.00, '重庆', '华硕', '2019-05-26 19:36:06', 0, 1, '2019-05-07 00:00:00', '2', '啊实打实大大', '0', '垃圾华硕');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;

-- 导出  表 visitor.log_handle 结构
CREATE TABLE IF NOT EXISTS `log_handle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id 引用sys_user id',
  `user_name` varchar(50) NOT NULL COMMENT '用户姓名',
  `op_method` varchar(100) NOT NULL COMMENT '操作具体方法',
  `op_module` varchar(50) DEFAULT NULL COMMENT '操作模块',
  `op_type` int(11) DEFAULT NULL COMMENT '操作类型：1、新增 2、修改 3、删除',
  `op_content` text COMMENT '操作内容',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='日志信息表';

-- 正在导出表  visitor.log_handle 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `log_handle` DISABLE KEYS */;
REPLACE INTO `log_handle` (`id`, `user_id`, `user_name`, `op_method`, `op_module`, `op_type`, `op_content`, `add_time`) VALUES
	(63, 1, '开发者：Mr.L', 'com.dsp.equipment.services.UserServiceImpl > update', '用户模块', 2, '修改的用户为：【Mr.L】', '2019-05-26 08:46:42'),
	(64, 1, '开发者：Mr.L', 'com.dsp.equipment.services.UserServiceImpl > update', '用户模块', 2, '修改的用户为：【Mr.L】', '2019-05-26 08:47:15');
/*!40000 ALTER TABLE `log_handle` ENABLE KEYS */;

-- 导出  表 visitor.log_login 结构
CREATE TABLE IF NOT EXISTS `log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- 正在导出表  visitor.log_login 的数据：53 rows
/*!40000 ALTER TABLE `log_login` DISABLE KEYS */;
REPLACE INTO `log_login` (`id`, `name`, `ip`, `browser`, `time`) VALUES
	(34, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 14:21:21'),
	(35, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 14:21:44'),
	(36, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 14:24:05'),
	(37, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 14:28:09'),
	(38, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 14:39:36'),
	(39, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 16:45:14'),
	(40, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 16:47:44'),
	(41, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 16:58:46'),
	(42, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 17:52:34'),
	(43, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 18:12:46'),
	(44, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 18:17:37'),
	(45, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 18:26:24'),
	(46, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 19:47:41'),
	(47, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 19:55:58'),
	(48, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 20:00:06'),
	(49, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 21:08:22'),
	(50, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 21:11:46'),
	(51, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 21:14:24'),
	(52, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 21:19:43'),
	(53, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 21:23:12'),
	(54, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 21:31:45'),
	(55, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 22:33:11'),
	(56, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 23:12:19'),
	(57, '管理员: admin', '0:0:0:0:0:0:0:1', 'Windows --- Chrome-72.0.3626.119', '2019-05-26 23:16:49');
/*!40000 ALTER TABLE `log_login` ENABLE KEYS */;

-- 导出  表 visitor.purchase 结构
CREATE TABLE IF NOT EXISTS `purchase` (
  `orderId` varchar(50) NOT NULL COMMENT '订单编号',
  `orderTime` datetime NOT NULL COMMENT '订单日期',
  `orderProject` varchar(255) NOT NULL COMMENT '项目名称',
  `supId` varchar(50) NOT NULL COMMENT '供应商编号',
  `userId` varchar(50) NOT NULL COMMENT '采购员编号',
  `eqId` varchar(50) NOT NULL COMMENT '设备编号',
  `orderNum` int(255) NOT NULL COMMENT '订购数量',
  `budget` double(255,0) NOT NULL COMMENT '预算',
  `explainInfo` varchar(255) NOT NULL COMMENT '订单说明',
  `status` varchar(255) DEFAULT NULL COMMENT '订单审核(0审核通过 1审核失败 2未审核)',
  `photo` varchar(255) NOT NULL COMMENT '订单图片',
  `examine` int(2) DEFAULT '2' COMMENT '订单审核(0审核通过 1审核失败 2未审核)',
  PRIMARY KEY (`orderId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- 正在导出表  visitor.purchase 的数据：1 rows
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
REPLACE INTO `purchase` (`orderId`, `orderTime`, `orderProject`, `supId`, `userId`, `eqId`, `orderNum`, `budget`, `explainInfo`, `status`, `photo`, `examine`) VALUES
	('206cf7ca5c', '2019-05-26 18:27:17', '你猜', '74bb1', '2', 'e9e63', 12, 121, '1212无色', '0', 'http://localhost:8090/static/images/20190526/1558866448010_650.jpg', 0);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;

-- 导出  表 visitor.sort 结构
CREATE TABLE IF NOT EXISTS `sort` (
  `sortId` varchar(50) NOT NULL COMMENT '分类id',
  `sortName` varchar(255) NOT NULL COMMENT '分类名称',
  `describeInfo` varchar(255) NOT NULL COMMENT '分类描述',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`sortId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  visitor.sort 的数据：2 rows
/*!40000 ALTER TABLE `sort` DISABLE KEYS */;
REPLACE INTO `sort` (`sortId`, `sortName`, `describeInfo`, `createTime`) VALUES
	('fc7d6', '电子设备', '电子设备电子设备电子设备电子设备', '2019-05-26 13:54:43'),
	('a6866', '你猜', '你猜你猜你猜你猜你猜', '2019-05-26 14:28:40');
/*!40000 ALTER TABLE `sort` ENABLE KEYS */;

-- 导出  表 visitor.supplier 结构
CREATE TABLE IF NOT EXISTS `supplier` (
  `supId` varchar(50) NOT NULL COMMENT '供应商id',
  `supName` varchar(255) NOT NULL COMMENT '供应商名称',
  `product` varchar(255) NOT NULL COMMENT '产品信息',
  `contacts` varchar(255) NOT NULL COMMENT '联系人',
  `contactPhone` varchar(255) NOT NULL COMMENT '联系人电话',
  `address` varchar(255) NOT NULL COMMENT '联系地址',
  `remakes` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`supId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  visitor.supplier 的数据：1 rows
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
REPLACE INTO `supplier` (`supId`, `supName`, `product`, `contacts`, `contactPhone`, `address`, `remakes`) VALUES
	('74bb1', '重庆万达', '重庆', '小可爱', '12321232121', '重庆沙坪坝', '重庆沙坪坝');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

-- 导出  表 visitor.sys_fun 结构
CREATE TABLE IF NOT EXISTS `sys_fun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0' COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='资源信息表';

-- 正在导出表  visitor.sys_fun 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `sys_fun` DISABLE KEYS */;
REPLACE INTO `sys_fun` (`id`, `name`, `url`, `icon`, `pid`, `add_time`) VALUES
	(1, '首页', '/page/index', 'layui-icon-home', 0, '2019-01-28 14:20:50'),
	(2, '系统管理', NULL, 'layui-icon-util', 0, '2019-01-28 14:25:17'),
	(3, '用户管理', '/page/system/user/list', 'layui-icon-username', 2, '2019-01-28 14:27:16'),
	(4, '角色管理', '/page/system/role/list', 'layui-icon-vercode', 2, '2019-01-28 15:00:23'),
	(5, '菜单管理', '/page/system/fun/list', 'layui-icon-website', 2, '2019-01-28 15:01:07'),
	(7, '日志管理', '', 'layui-icon-menu-fill', 0, '2019-01-28 15:55:07'),
	(8, '登录日志', '/page/log/login/list', 'layui-icon-user', 7, '2019-01-28 16:52:36'),
	(13, '设备管理', '/page/equipment/equipmentInfo', 'layui-icon-password', 14, '2019-01-29 16:26:10'),
	(14, '设备管理', '', 'layui-icon-flag', 0, '2019-01-29 16:28:04'),
	(17, '操作日志', '/page/log/handle/list', 'layui-icon-list', 7, '2019-02-18 15:26:07'),
	(19, '设备分类', '/page/equipment/sort', 'layui-icon-rate', 14, '2019-05-26 13:42:32'),
	(20, '供应商信息管理', '/page/equipment/supplier', 'layui-icon-username', 14, '2019-05-26 16:45:54'),
	(21, '过期设备', '/page/equipment/overdueEquipment', 'layui-icon-date', 14, '2019-05-26 17:06:49'),
	(22, '采购管理', '', 'layui-icon-rmb', 0, '2019-05-26 17:11:49'),
	(23, '采购订单', '/page/order/purchaseOrder', 'layui-icon-align-left', 22, '2019-05-26 17:50:48'),
	(24, '订单审核', '/page/order/orderAudit', 'layui-icon-survey', 22, '2019-05-26 19:14:13'),
	(25, '出库管理', '/page/outOfStock/list', 'layui-icon-component', 0, '2019-05-26 20:01:45'),
	(26, '损坏设备', '/page/outOfStock/damagedEquipment', 'layui-icon-engine', 25, '2019-05-26 20:03:09'),
	(27, '出库记录', '/page/outOfStock/outgoingRecord', 'layui-icon-release', 25, '2019-05-26 21:00:04'),
	(28, '入库管理', '/page/warehousing/warehousing', 'layui-icon-log', 0, '2019-05-26 21:06:01'),
	(29, '入库记录', '/page/warehousing/warehousing', 'layui-icon-note', 28, '2019-05-26 21:06:35');
/*!40000 ALTER TABLE `sys_fun` ENABLE KEYS */;

-- 导出  表 visitor.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `funs` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  visitor.sys_role 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
REPLACE INTO `sys_role` (`id`, `name`, `funs`, `remark`, `add_time`) VALUES
	(1, '管理员', '1,2,3,4,5,7,8,17,14,13,19,20,21,22,23,24,25,26,27,28,29', '所有权限', '2019-05-26 21:06:40'),
	(3, '采购员', '1,2,3,4,5,7,8,17,14,13', '采购员所有权限', '2019-05-26 08:49:35');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 visitor.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `trueName` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  visitor.sys_user 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
REPLACE INTO `sys_user` (`id`, `userName`, `password`, `trueName`, `email`, `phone`, `add_time`, `roleId`) VALUES
	(1, 'admin', '112233', 'Mr.L', '2911729767@qq.com', '15200565360', '2019-05-26 08:58:53', 1),
	(2, 'java11', '123456', '小红', '356984523@qq.com', '15265447853', '2019-05-26 08:59:00', 3),
	(6, 'zhangli', '112233', '张力', '12@qq.com', '123365412', '2019-02-14 13:39:34', 2);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 visitor.visitor 结构
CREATE TABLE IF NOT EXISTS `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  visitor.visitor 的数据：0 rows
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;

-- 导出  表 visitor.warehousing 结构
CREATE TABLE IF NOT EXISTS `warehousing` (
  `orderId` varchar(11) NOT NULL COMMENT '订单编号',
  `wareTime` datetime DEFAULT NULL COMMENT '入库时间',
  `warePerson` varchar(255) DEFAULT NULL COMMENT '入库人',
  `type` int(2) DEFAULT NULL COMMENT '类型（0出库 1入库）',
  PRIMARY KEY (`orderId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  visitor.warehousing 的数据：2 rows
/*!40000 ALTER TABLE `warehousing` DISABLE KEYS */;
REPLACE INTO `warehousing` (`orderId`, `wareTime`, `warePerson`, `type`) VALUES
	('3226e', '2019-05-26 23:17:19', NULL, 0),
	('206cf7ca5c', '2019-05-26 23:17:08', '2', 1);
/*!40000 ALTER TABLE `warehousing` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
