/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : SQL Server
 Source Server Version : 11003128
 Source Host           : localhost:1433
 Source Catalog        : JavaWeb
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 11003128
 File Encoding         : 65001

 Date: 18/06/2020 16:07:06
*/


-- ----------------------------
-- Table structure for admin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[admin]') AND type IN ('U'))
	DROP TABLE [dbo].[admin]
GO

CREATE TABLE [dbo].[admin] (
  [adminname] varchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [adminpwd] varchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[admin] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO [dbo].[admin] VALUES (N'zzh', N'123')
GO

INSERT INTO [dbo].[admin] VALUES (N'pmt', N'123')
GO

INSERT INTO [dbo].[admin] VALUES (N'aaa', N'123')
GO

INSERT INTO [dbo].[admin] VALUES (N'bbb', N'123')
GO

INSERT INTO [dbo].[admin] VALUES (N'ccc', N'123')
GO


-- ----------------------------
-- Table structure for notice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[notice]') AND type IN ('U'))
	DROP TABLE [dbo].[notice]
GO

CREATE TABLE [dbo].[notice] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [title] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [content] varchar(500) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [_time] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[notice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of notice
-- ----------------------------
SET IDENTITY_INSERT [dbo].[notice] ON
GO

INSERT INTO [dbo].[notice] ([id], [title], [content], [_time]) VALUES (N'20', N'三只松鼠', N'买一送一，送完为止！先到先得，走过路过，千别错！,拍两件送手机，拍三件送ipad。', N'2020/6/2 20:39')
GO

INSERT INTO [dbo].[notice] ([id], [title], [content], [_time]) VALUES (N'22', N'双11爆卖', N'IHHF返回撒谎的阿松大阿什顿ASDF SDAIFI JASDFO DAS AW AS D ', N'2020/6/5 20:32')
GO

INSERT INTO [dbo].[notice] ([id], [title], [content], [_time]) VALUES (N'23', N'618来喽！！！！！！！！！！！！', N'618来喽！！！！！！！！！！！！水果特价！！榴莲9.9，进直播 送1000份', N'2020/6/8 22:44')
GO

INSERT INTO [dbo].[notice] ([id], [title], [content], [_time]) VALUES (N'24', N'白菜真的白菜价了', N'白菜是我国原产蔬菜，有悠久的栽培历史。据考证，在我国新石器时期的西安半坡原始村落遗址发现的白菜籽距今约有6000年-7000年。明代李时珍引陆佃《埤雅》说：“菘，凌冬晚凋，四时常见，有松之操，故曰菘，今俗谓之白菜', N'2020/6/10 10:27')
GO

SET IDENTITY_INSERT [dbo].[notice] OFF
GO


-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[goodstype]') AND type IN ('U'))
	DROP TABLE [dbo].[goodstype]
GO

CREATE TABLE [dbo].[goodstype] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [gstype] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[goodstype] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of goodstype
-- ----------------------------
SET IDENTITY_INSERT [dbo].[goodstype] ON
GO

INSERT INTO [dbo].[goodstype] ([id], [gstype]) VALUES (N'4', N'水果')
GO

INSERT INTO [dbo].[goodstype] ([id], [gstype]) VALUES (N'5', N'蔬菜')
GO

INSERT INTO [dbo].[goodstype] ([id], [gstype]) VALUES (N'6', N'肉类')
GO

SET IDENTITY_INSERT [dbo].[goodstype] OFF
GO


-- ----------------------------
-- Table structure for goods
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[goods]') AND type IN ('U'))
	DROP TABLE [dbo].[goods]
GO

CREATE TABLE [dbo].[goods] (
  [gid] int  IDENTITY(1,1) NOT NULL,
  [gname] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [goprice] float(53)  NOT NULL,
  [grprice] float(53)  NOT NULL,
  [gstock] int  NOT NULL,
  [gpicture] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [gstype] int  NOT NULL
)
GO

ALTER TABLE [dbo].[goods] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of goods
-- ----------------------------
SET IDENTITY_INSERT [dbo].[goods] ON
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'23', N'西瓜', N'20', N'55', N'200', N'../jquerynavlbt/images/products/28.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'26', N'丝瓜', N'77', N'88', N'200', N'../jquerynavlbt/images/products/30.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'27', N'猪肉', N'20', N'22', N'200', N'../jquerynavlbt/images/products/29.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'28', N'牛肉', N'30', N'40', N'100', N'../jquerynavlbt/images/products/31.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'30', N'哈密瓜', N'35', N'25', N'250', N'../jquerynavlbt/images/products/32.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'32', N'水蜜桃', N'35', N'25', N'250', N'../jquerynavlbt/images/products/33.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'33', N'荔枝', N'35', N'25', N'250', N'../jquerynavlbt/images/products/34.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'34', N'香蕉', N'35', N'25', N'250', N'../jquerynavlbt/images/products/35.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'35', N'樱桃', N'35', N'25', N'250', N'../jquerynavlbt/images/products/36.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'36', N'蟠桃', N'35', N'25', N'250', N'../jquerynavlbt/images/products/6.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'37', N'李子', N'35', N'25', N'250', N'../jquerynavlbt/images/products/37.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'38', N'梨儿', N'35', N'25', N'250', N'../jquerynavlbt/images/products/12.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'39', N'草莓', N'35', N'25', N'250', N'../jquerynavlbt/images/products/38.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'40', N'石榴', N'35', N'25', N'250', N'../jquerynavlbt/images/products/39.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'41', N'白菜', N'35', N'25', N'250', N'../jquerynavlbt/images/products/16.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'42', N'土豆', N'35', N'25', N'250', N'../jquerynavlbt/images/products/40.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'43', N'番茄', N'35', N'25', N'250', N'../jquerynavlbt/images/products/21.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'44', N'青菜', N'35', N'25', N'250', N'../jquerynavlbt/images/products/41.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'45', N'菠菜', N'35', N'25', N'250', N'../jquerynavlbt/images/products/42.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'46', N'牛皮菜', N'35', N'25', N'250', N'../jquerynavlbt/images/products/43.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'47', N'兔肉', N'35', N'25', N'250', N'../jquerynavlbt/images/products/44.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'48', N'狗肉', N'35', N'25', N'250', N'../jquerynavlbt/images/products/45.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'49', N'猫肉', N'35', N'25', N'250', N'../jquerynavlbt/images/products/46.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'50', N'鱼肉', N'35', N'25', N'250', N'../jquerynavlbt/images/products/47.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'51', N'鲫鱼', N'35', N'25', N'250', N'../jquerynavlbt/images/products/48.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'53', N'肥牛', N'55', N'22', N'10', N'../jquerynavlbt/images/products/49.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'54', N'土豆丝', N'12', N'20', N'20', N'../jquerynavlbt/images/products/50.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'55', N'毛东瓜', N'25', N'21', N'22', N'../jquerynavlbt/images/products/51.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'56', N'羊肉', N'88', N'99', N'30', N'../jquerynavlbt/images/products/52.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'57', N'梭边渔', N'22', N'88', N'200', N'../jquerynavlbt/images/products/53.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'58', N'金枪鱼', N'56', N'65', N'300', N'../jquerynavlbt/images/products/54.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'59', N'羊肉汤', N'54', N'45', N'2', N'../jquerynavlbt/images/products/55.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'61', N'苹果', N'18', N'12', N'200', N'../jquerynavlbt/images/products/5.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'62', N'柠檬', N'20', N'22', N'150', N'../jquerynavlbt/images/products/7.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'63', N'甜椒', N'5', N'6', N'25', N'../jquerynavlbt/images/products/8.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'64', N'草莓', N'35', N'32', N'900', N'../jquerynavlbt/images/products/9.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'65', N'苦瓜', N'3', N'4', N'50', N'../jquerynavlbt/images/products/26.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'66', N'芹菜', N'5', N'6', N'10', N'../jquerynavlbt/images/products/10.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'67', N'橙子', N'11', N'13', N'200', N'../jquerynavlbt/images/products/11.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'68', N'黄瓜', N'12', N'2', N'10', N'../jquerynavlbt/images/products/27.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'69', N'菠萝', N'25', N'28', N'400', N'../jquerynavlbt/images/products/14.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'70', N'海椒', N'6', N'6', N'300', N'../jquerynavlbt/images/products/17.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'71', N'花菜', N'23', N'3', N'5', N'../jquerynavlbt/images/products/18.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'72', N'胡萝卜', N'25', N'25', N'20', N'../jquerynavlbt/images/products/19.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'73', N'桃子', N'35', N'36', N'200', N'../jquerynavlbt/images/products/20.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'74', N'圣女果', N'32', N'45', N'123', N'../jquerynavlbt/images/products/13.jpg', N'4')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'75', N'豌豆', N'45', N'45', N'200', N'../jquerynavlbt/images/products/22.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'76', N'玉米', N'36', N'33', N'40', N'../jquerynavlbt/images/products/25.jpg', N'5')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'77', N'青蛙', N'88', N'77', N'156', N'	../jquerynavlbt/images/products/56.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'78', N'黄鳝', N'56', N'66', N'200', N'../jquerynavlbt/images/products/57.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'80', N'泥鳅', N'32', N'20', N'202', N'../jquerynavlbt/images/products/58.jpg', N'6')
GO

INSERT INTO [dbo].[goods] ([gid], [gname], [goprice], [grprice], [gstock], [gpicture], [gstype]) VALUES (N'81', N'毒蛇', N'55', N'66', N'20', N'../jquerynavlbt/images/products/59.jpg', N'6')
GO

SET IDENTITY_INSERT [dbo].[goods] OFF
GO


-- ----------------------------
-- Table structure for cart
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cart]') AND type IN ('U'))
	DROP TABLE [dbo].[cart]
GO

CREATE TABLE [dbo].[cart] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [uid] int  NOT NULL,
  [gid] int  NOT NULL,
  [count] int  NOT NULL
)
GO

ALTER TABLE [dbo].[cart] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of cart
-- ----------------------------
SET IDENTITY_INSERT [dbo].[cart] ON
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'11', N'3', N'45', N'13')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'13', N'3', N'77', N'8')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'14', N'3', N'50', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'15', N'3', N'54', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'16', N'3', N'81', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'17', N'3', N'43', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'19', N'3', N'37', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'20', N'3', N'27', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'21', N'3', N'81', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'22', N'3', N'34', N'1')
GO

INSERT INTO [dbo].[cart] ([id], [uid], [gid], [count]) VALUES (N'23', N'3', N'26', N'1')
GO

SET IDENTITY_INSERT [dbo].[cart] OFF
GO


-- ----------------------------
-- Table structure for consumer
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[consumer]') AND type IN ('U'))
	DROP TABLE [dbo].[consumer]
GO

CREATE TABLE [dbo].[consumer] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [username] varchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [password] varchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[consumer] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of consumer
-- ----------------------------
SET IDENTITY_INSERT [dbo].[consumer] ON
GO

INSERT INTO [dbo].[consumer] ([id], [username], [password]) VALUES (N'1', N'ppp', N'123')
GO

INSERT INTO [dbo].[consumer] ([id], [username], [password]) VALUES (N'3', N'zzh', N'123')
GO

INSERT INTO [dbo].[consumer] ([id], [username], [password]) VALUES (N'4', N'pmt', N'123')
GO

SET IDENTITY_INSERT [dbo].[consumer] OFF
GO


-- ----------------------------
-- Table structure for order
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[order]') AND type IN ('U'))
	DROP TABLE [dbo].[order]
GO

CREATE TABLE [dbo].[order] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [uid] int  NOT NULL,
  [number] int  NOT NULL,
  [img] varchar(500) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [state] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [orderdate] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [money] int  NOT NULL
)
GO

ALTER TABLE [dbo].[order] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of order
-- ----------------------------
SET IDENTITY_INSERT [dbo].[order] ON
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'4', N'3', N'13', N'../jquerynavlbt/images/products/42.jpg', NULL, N'2020/06/11 13:28:44', N'325')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'9', N'3', N'8', N'../jquerynavlbt/images/products/56.jpg', NULL, N'2020/06/11 14:42:17', N'616')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'10', N'4', N'1', N'../jquerynavlbt/images/products/50.jpg', NULL, N'2020/06/11 14:42:43', N'20')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'11', N'4', N'1', N'../jquerynavlbt/images/products/50.jpg', NULL, N'2020/06/11 14:47:24', N'20')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'12', N'4', N'13', N'../jquerynavlbt/images/products/42.jpg', NULL, N'2020/06/11 14:51:26', N'325')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'13', N'4', N'1', N'../jquerynavlbt/images/products/47.jpg', NULL, N'2020/06/11 14:51:34', N'25')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'14', N'3', N'1', N'../jquerynavlbt/images/products/40.jpg', NULL, N'2020/06/11 15:37:09', N'25')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'15', N'3', N'1', N'../jquerynavlbt/images/products/37.jpg', NULL, N'2020/06/12 09:49:04', N'25')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'17', N'3', N'1', N'../jquerynavlbt/images/products/59.jpg', NULL, N'2020/06/15 09:20:18', N'66')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'18', N'3', N'13', N'../jquerynavlbt/images/products/42.jpg', NULL, N'2020/06/18 08:57:40', N'325')
GO

INSERT INTO [dbo].[order] ([id], [uid], [number], [img], [state], [orderdate], [money]) VALUES (N'19', N'3', N'13', N'../jquerynavlbt/images/products/42.jpg', NULL, N'2020/06/18 09:42:38', N'325')
GO

SET IDENTITY_INSERT [dbo].[order] OFF
GO


-- ----------------------------
-- Primary Key structure for table notice
-- ----------------------------
ALTER TABLE [dbo].[notice] ADD CONSTRAINT [PK__notice__3213E83F5E902C2D] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table goodstype
-- ----------------------------
ALTER TABLE [dbo].[goodstype] ADD CONSTRAINT [PK__goodstyp__3213E83FDF36EDA1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table goods
-- ----------------------------
ALTER TABLE [dbo].[goods] ADD CONSTRAINT [PK__goods__DCD80EF83F7D8913] PRIMARY KEY CLUSTERED ([gid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table cart
-- ----------------------------
ALTER TABLE [dbo].[cart] ADD CONSTRAINT [PK__cart__3213E83F3F662B82] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table consumer
-- ----------------------------
ALTER TABLE [dbo].[consumer] ADD CONSTRAINT [PK__consumer__3213E83FE7AEE1AF] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table order
-- ----------------------------
ALTER TABLE [dbo].[order] ADD CONSTRAINT [PK__order__3213E83FE422EDEA] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table goods
-- ----------------------------
ALTER TABLE [dbo].[goods] ADD CONSTRAINT [FK__goods__gstype_id] FOREIGN KEY ([gstype]) REFERENCES [dbo].[goodstype] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table cart
-- ----------------------------
ALTER TABLE [dbo].[cart] ADD CONSTRAINT [FK__cart__gid__160F4887] FOREIGN KEY ([gid]) REFERENCES [dbo].[goods] ([gid]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[cart] ADD CONSTRAINT [FK__cart__uid__17036CC0] FOREIGN KEY ([uid]) REFERENCES [dbo].[consumer] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table order
-- ----------------------------
ALTER TABLE [dbo].[order] ADD CONSTRAINT [FK__order__uid__29221CFB] FOREIGN KEY ([uid]) REFERENCES [dbo].[consumer] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

