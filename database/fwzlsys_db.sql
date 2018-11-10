-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fwzlsys_db
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_admin` (
  `userId` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` VALUES (1,'admin','admin'),(2,'admin2','admin2');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_catelog`
--

DROP TABLE IF EXISTS `t_catelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_catelog` (
  `catelog_id` int(11) NOT NULL AUTO_INCREMENT,
  `catelog_name` varchar(50) DEFAULT NULL,
  `catelog_miaoshu` text,
  `catelog_del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`catelog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_catelog`
--

LOCK TABLES `t_catelog` WRITE;
/*!40000 ALTER TABLE `t_catelog` DISABLE KEYS */;
INSERT INTO `t_catelog` VALUES (1,'小区短租房','小区短租房','no'),(2,'酒店式公寓短租房','酒店式公寓短租房','no'),(3,'别墅类住宿','别墅类住宿','no'),(4,'其他住宿','其他住宿','no'),(5,'其他住宿','其他住宿','yes');
/*!40000 ALTER TABLE `t_catelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_gonggao`
--

DROP TABLE IF EXISTS `t_gonggao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_gonggao` (
  `gonggao_id` int(11) NOT NULL AUTO_INCREMENT,
  `gonggao_title` varchar(50) DEFAULT NULL,
  `gonggao_content` text,
  `gonggao_data` varchar(50) DEFAULT NULL,
  `gonggao_fabuzhe` varchar(255) DEFAULT NULL,
  `gonggao_del` varchar(50) DEFAULT NULL,
  `gonggao_one1` varchar(50) DEFAULT NULL,
  `gonggao_one2` varchar(50) DEFAULT NULL,
  `gonggao_one3` varchar(50) DEFAULT NULL,
  `gonggao_one4` varchar(50) DEFAULT NULL,
  `gonggao_one5` datetime DEFAULT NULL,
  `gonggao_one6` datetime DEFAULT NULL,
  `gonggao_one7` int(11) DEFAULT NULL,
  `gonggao_one8` int(11) DEFAULT NULL,
  PRIMARY KEY (`gonggao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_gonggao`
--

LOCK TABLES `t_gonggao` WRITE;
/*!40000 ALTER TABLE `t_gonggao` DISABLE KEYS */;
INSERT INTO `t_gonggao` VALUES (1,'华润置地广场：全款98折 贷款99折 ','华润置地广场：全款98折 贷款99折 华润置地广场：全款98折 贷款99折 华润置地广场：全款98折 贷款99折 华润置地广场：全款98折 贷款99折','2014-4-3 12:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'万科蓝山：二期新品加推75平、95平户型','万科蓝山：二期新品加推75平、95平户型万科蓝山：二期新品加推75平、95平户型万科蓝山：二期新品加推75平、95平户型万科蓝山：二期新品加推75平、95平户型','2014-4-3 12:35:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_gonggao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_jingpai`
--

DROP TABLE IF EXISTS `t_jingpai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_jingpai` (
  `jingpai_id` int(11) NOT NULL AUTO_INCREMENT,
  `jingpai_jiage` int(11) DEFAULT NULL,
  `jingpai_objfw_id` int(11) DEFAULT NULL,
  `jingpai_user_id` int(11) DEFAULT NULL,
  `jingpai_shijian` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jingpai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_jingpai`
--

LOCK TABLES `t_jingpai` WRITE;
/*!40000 ALTER TABLE `t_jingpai` DISABLE KEYS */;
INSERT INTO `t_jingpai` VALUES (40,269,8,3,'2018-5-20 1:01:30','no');
/*!40000 ALTER TABLE `t_jingpai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_liuyan`
--

DROP TABLE IF EXISTS `t_liuyan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_liuyan` (
  `liuyan_id` int(11) NOT NULL AUTO_INCREMENT,
  `liuyan_title` varchar(50) DEFAULT NULL,
  `liuyan_content` text,
  `liuyan_date` varchar(50) DEFAULT NULL,
  `liuyan_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`liuyan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_liuyan`
--

LOCK TABLES `t_liuyan` WRITE;
/*!40000 ALTER TABLE `t_liuyan` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_liuyan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_objfw`
--

DROP TABLE IF EXISTS `t_objfw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_objfw` (
  `objfw_id` int(11) NOT NULL AUTO_INCREMENT,
  `objfw_name` varchar(50) DEFAULT NULL,
  `objfw_area` varchar(50) DEFAULT NULL,
  `objfw_miaoshu` text,
  `fujian` varchar(50) DEFAULT NULL,
  `objfw_dijia` int(11) DEFAULT NULL,
  `objfw_catelog_id` int(11) DEFAULT NULL,
  `objfw_user_id` int(11) DEFAULT NULL,
  `objfw_shijian` varchar(50) DEFAULT NULL,
  `objfw_del` varchar(50) DEFAULT NULL,
  `shenhe_flag` varchar(50) DEFAULT '0',
  PRIMARY KEY (`objfw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_objfw`
--

LOCK TABLES `t_objfw` WRITE;
/*!40000 ALTER TABLE `t_objfw` DISABLE KEYS */;
INSERT INTO `t_objfw` VALUES (3,'北京望京海豚湾公寓一居室','北京朝阳区北京海豚湾酒店式公寓','<br class=\"Apple-interchange-newline\" />\r\n<span style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: normal; color: rgb(50,44,39); font-style: normal; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\">位置：楼下超市美食药店，望京中心地段；地铁口步行五分钟；紧临望京SOHO<span class=\"Apple-converted-space\">&nbsp;</span></span><br data-filtered=\"filtered\" style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: normal; color: rgb(50,44,39); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; margin: 0px; orphans: 2; widows: 2; letter-spacing: normal; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\" />\r\n<span style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: normal; color: rgb(50,44,39); font-style: normal; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\">户型：观景阳台；落地窗；一居室；可住两人；</span><br data-filtered=\"filtered\" style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: normal; color: rgb(50,44,39); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; margin: 0px; orphans: 2; widows: 2; letter-spacing: normal; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\" />\r\n<span style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: normal; color: rgb(50,44,39); font-style: normal; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\">装修：房东亲自设计装修；家具由房东亲自挑选；专业设计师设计；<span class=\"Apple-converted-space\">&nbsp;</span></span><br data-filtered=\"filtered\" style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: normal; color: rgb(50,44,39); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; margin: 0px; orphans: 2; widows: 2; letter-spacing: normal; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\" />\r\n<span style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: normal; color: rgb(50,44,39); font-style: normal; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\">设施：家具家电齐全；厨房用品齐全；可洗衣做饭；网速快；暖气给力 ！</span><br data-filtered=\"filtered\" style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: normal; color: rgb(50,44,39); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; margin: 0px; orphans: 2; widows: 2; letter-spacing: normal; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\" />\r\n<span style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: normal; color: rgb(50,44,39); font-style: normal; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\">公寓品质高、价位低、空间大、私密强。自开业以来便深受广大商务及旅游客人的喜爱。</span><br data-filtered=\"filtered\" style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: normal; color: rgb(50,44,39); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; margin: 0px; orphans: 2; widows: 2; letter-spacing: normal; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\" />\r\n<span style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: normal; color: rgb(50,44,39); font-style: normal; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\">公寓房间宽敞舒适，采光良好，落地窗外景色惬意。隔音效果很好，让旅客睡的舒适安心。</span><br data-filtered=\"filtered\" style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: normal; color: rgb(50,44,39); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; margin: 0px; orphans: 2; widows: 2; letter-spacing: normal; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\" />\r\n<span style=\"font-size: 14px; font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: normal; color: rgb(50,44,39); font-style: normal; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\">公寓配备有毛巾、牙具、吹风机、热水壶等，除此之外，房间还提供有免费宽带以及24小时热水。</span>','/upload/1526658376787.jpg',600,2,2,'2018-5-18 23:46:29','no','1'),(4,'【安心】北京近南站西红门宜家200米','北京大兴区世嘉博苑','可住2-4人，经典的两居室，南北通透！<br />\r\n配备全套家具，全套家电<br />\r\n密码锁进入，一客一密码<br />\r\n全天24小时热水<br />\r\n房间50兆宽带，高速上网<br />\r\n专业清洁团队，星级客房标准进行保洁，保证一客一换一扫<br />\r\n紧挨小区北边是兴华公园内有篮球.羽毛球.乒乓球场地','/upload/1526744668737.jpg',263,1,1,'2018-5-19 23:44:48','no','1'),(5,'北京古北水镇精装主题大床洋房','北京密云区京承高速司马台长城','不允许吸烟，带宠物，做饭，聚会<br />\r\n可住2人，不可加人，不可商业拍摄不可加床<br />\r\n房间是开间、一厨一卫、房间配备宽1.8米大床和1.5米沙发床<br />\r\n楼内有电梯，24小时保安，银行、医务室、餐厅、超市等一应俱全！<br />\r\n景区内各种中西餐厅和小吃、吃喝玩乐尽享！','/upload/1526744899711.jpg',360,1,1,'2018-5-19 23:48:26','no','1'),(6,'广州天河区酒店式公寓','广州天河区中山大道西合生骏景广场','整套出租，1室1厅1厨0阳台56m&sup2;<br />\r\n可住2人，共1张床，不可加床<br />\r\n地中海风格，专业设计师设计<br />\r\n家具家电齐全；厨房用品齐全；可洗衣做饭<br />\r\n网速快；周边吃喝玩乐一条街','/upload/1526745105628.jpg',196,2,2,'2018-5-19 23:51:53','no','1'),(7,'国贸百子湾蓝色观景文艺loft','北京朝阳区百子湾沿海赛洛城','<p>1室1厅1厨0阳台&middot;61m&sup2;<br />\r\n可住2人，共1张床，可加床<br />\r\n坐落于百子湾沿海赛洛城，毗邻双井、国贸、大望路等热闹商圈<br />\r\n这是一个艺人明星常出没的小区，环境优美安静<br />\r\n小区附近24小时便利店、餐饮、咖啡馆等比比皆是<br />\r\n吃喝完全不用愁，居住条件非常便利。</p>','/upload/1526745187843.jpg',230,2,2,'2018-5-19 23:53:15','no','1'),(8,'【金玉满堂】解放碑对岸复式三居','重庆江北区北滨路珠江太阳城','可住3-6人，温馨大三室、精致房屋摆设、精品洁具用品<br />\r\n独立厨房，超大阳台，每间卧室配备舒适的大床和床垫<br />\r\n除此之外房间还配备了空调、wifi、衣柜、电视等基础设施<br />\r\n同时厨房厨具齐全，可以自己做饭，24小时常备热水随开随用<br />\r\n客厅南北通透，通风效果极佳<br />\r\n房源位置极佳，下楼即到鎏家码头。景色超美，吃喝玩乐一站式解决','/upload/1526745291657.jpg',269,1,1,'2018-5-19 23:55:01','no','1'),(9,'重庆温馨大一室一厅','重庆渝中区金山大厦','可住2人，共1张床，可加床<br />\r\n整套出租，1室1厅1厨1阳台<br />\r\n不允许吸烟，带宠物，做饭，聚会<br />\r\n周边银行，饭馆，小吃店，24小时便利店，洗衣店，打印店，等配套完善<br />\r\nWIFI全屋覆盖、全套实木餐桌、全套厨具、空调、燃气热水器等<br />\r\n提供洗衣服务;有医药箱;有针线包;额外打扫50.0&yen;/次','/upload/1526745676758.jpg',300,1,1,'2018-5-20 0:01:25','no','1'),(10,'广州番禺区汉溪大道东290号保利大都汇','广州番禺区汉溪大道东290号保利大都汇','整套出租2室1厅1厨0阳台<br />\r\n可住4人，共2张床，不可加床<br />\r\n允许吸烟，不允许带宠物，不允许聚会，不允许加人<br />\r\n不可商业拍摄，不可加床<br />\r\n广州地铁3，7号线地铁站旁边','/upload/1526745737923.jpg',298,1,1,'2018-5-20 0:02:41','yes',NULL),(11,'长隆地铁旁保利大都汇（桃源居','广州番禺区汉溪大道东290号保利大都汇','整套出租2室1厅1厨0阳台<br />\r\n可住4人，共2张床，不可加床<br />\r\n允许吸烟，不允许带宠物，不允许聚会，不允许加人<br />\r\n不可商业拍摄，不可加床<br />\r\n广州地铁3，7号线地铁站旁边','/upload/1526745823354.jpg',296,1,1,'2018-5-20 0:03:49','no','1'),(12,'成都春熙路/太古里商圈','成都锦江区蓝光·郁金香花园广场','整套出租，1室1厅1厨1阳台59m&sup2;<br />\r\n可住2人，共2张床，可加床<br />\r\n房间使用密码锁,一客一换,方便安全<br />\r\n高清电视(可点播)，无线Wi-Fi<br />\r\n所有床上用品和毛巾一客一换,干净卫生','/upload/1526745901846.jpg',308,2,2,'2018-5-20 0:05:11','no','1'),(13,'福建 近鼓浪屿 中山路 靠海边 ','福建省厦门市海沧区嵩屿码头街','3室2厅1厨1阳台&middot;125m&sup2;，免停车费<br />\r\n可住7人，共3张床&middot; 加床￥50/人/天<br />\r\n现代简约装修，内配有免费无线WIFI<br />\r\n提供 厨房用品、一次性洗漱用品<br />\r\n电热水壶、拖鞋、电视、吹风机，空调，冰箱等基础设施齐全<br />\r\n小区对面即是阿罗海城市广场，下楼就是湖边','/upload/1526746028963.jpg',1600,4,4,'2018-5-20 0:07:23','no','1'),(14,'傅家宅，上海特色民宿','上海浦东新区傅家宅','5室1厅0厨2阳台&middot;260m&sup2;<br />\r\n可住9人以上，共5张床&middot; 不可加床<br />\r\n坐落于上海浦东南汇的一幢三层小楼<br />\r\n临近上海迪士尼乐园及上海野生动物园<br />\r\n独幢民宿,共计5个精装修房间,均有独立卫生间<br />\r\n距动物园3公里,迪士尼乐园9公里,均有直达公交车','/upload/1526746179347.jpg',2600,4,4,'2018-5-20 0:09:48','no','1'),(15,'广州温泉度假碧水湾新村桃园四房别墅','广州从化良口镇碧水新村怡乐路b27号','4室1厅1厨1阳台&middot;120m&sup2;<br />\r\n可住8人，共6张床，可加床<br />\r\n别墅是复式设计，内有多种客房房型可供选择<br />\r\n设有家庭影音卡拉OK（专业触屏点播音乐系统设备）<br />\r\n客房卫生干净舒适，价格实惠<br />\r\n可接公司出游或旅行团队','/upload/1526746387749.jpg',3888,3,3,'2018-5-20 0:13:18','no','1'),(16,'广州富力泉天下简欧温馨7房河畔别墅','广州从化温泉街道富力泉天下紫檀二路','整套出租，7室2厅1厨4阳台&middot;600m&sup2;<br />\r\n可住9人以上，共7张床，不可加床<br />\r\n专业独立KTV包房（高清60寸大电视）<br />\r\n2个河畔温泉池（免费送两池温泉水）<br />\r\n高配置电脑1台，2个浴缸，7米高中空大厅<br />\r\n高速光纤WIFI，厨房厨具冰箱','/upload/1526746462100.jpg',2999,3,3,'2018-5-20 0:14:31','no','1'),(17,'长隆地铁旁保利大都汇（桃源居）','广州番禺区汉溪大道东290号保利大都汇','整套出租2室1厅1厨0阳台<br />\r\n可住4人，共2张床，不可加床<br />\r\n允许吸烟，不允许带宠物，不允许聚会，不允许加人<br />\r\n不可商业拍摄，不可加床<br />\r\n广州地铁3，7号线地铁站旁边','/upload/1526746551630.jpg',366,1,1,'2018-5-20 0:15:58','no','1'),(18,'上海青浦国家会展中心近虹桥机场','上海青浦区水都南岸二期','整套出租，1室1厅1厨1阳台，58m&sup2;<br />\r\n可住3人，共2张床，不可加床<br />\r\n安娜家附近有联华超市、农工商超市、沈巷农贸市场<br />\r\n门口即是公交站、紧邻地铁17号线朱家角站、无缝连接地铁2号线<br />\r\n周边有著名景区东方绿洲、淀山湖、奥特莱斯、欢乐谷','/upload/1526746643385.jpg',287,2,2,'2018-5-20 0:17:34','no','1'),(19,'厦门北站附近独栋别墅整栋日租','厦门集美区星海湾','4室1厅1厨3阳台&middot;300m&sup2;<br />\r\n可住9人以上，共7张床&middot; 可加床<br />\r\n欧式风格装修，大花园有沙发，你可以晒太阳<br />\r\n我们免费提供厨房、空调、24小时热水<br />\r\n桌球、KTV、xbox、桌游、火锅、烧烤、麻将<br />\r\n公司团建、生日party、家庭旅游聚会整租','/upload/1526746744947.jpg',3566,3,3,'2018-5-20 0:19:17','no','1'),(20,'三亚豪华实木海景一室房','三亚天涯区三亚湾路兰海·美丽新海岸','位于三亚市三亚湾旅游风景区三亚湾路<br />\r\n公寓的装修风格为复古风格<br />\r\n公寓提供独立的卫浴，高档的厨房，<br />\r\n有空调，电冰箱，全自动洗衣机，有线电视，免费WiFi<br />\r\n乘坐8路，6路，27路等公交到达公寓所在的美丽新海岸小区','/upload/1526746993955.jpg',398,2,2,'2018-5-20 0:23:23','no','1'),(21,'三亚亚龙湾海上别墅船宿','三亚亚龙湾半山半岛游艇帆船俱乐部','3室1厅1厨3阳台&middot;100m&sup2;<br />\r\n可住6人，共4张床&middot; 可加床<br />\r\n顶级住宿体验,为您独家定制超奢华的专属旅程<br />\r\n这里,您能够尽情享受:<br />\r\n世界级港口的无敌海景<br />\r\n24小时管家随时恭候,为您解决各种所需（赠送）','/upload/1526747137199.jpg',4600,4,4,'2018-5-20 0:25:56','no','1'),(22,'三亚海上皇宫游艇体验屋','三亚大东海鹿回头路','1室2厅1厨0阳台&middot;120m&sup2;<br />\r\n可住2人，共1张床&middot; 可加床<br />\r\n360度全海景，坐落在三亚市向南延伸的一座半岛的中部<br />\r\n阳光明媚的海滩、赏心悦目的18洞高尔夫球场<br />\r\n静谧旖旎的热带风光、曲径通幽的园林民居<br />\r\n清澈的海水和沁人心脾的海风<br />\r\n无比尊贵奢华、宛若人间天堂的的首善之区','/upload/1526747207256.jpg',2100,4,4,'2018-5-20 0:26:55','no','1'),(23,'北京辉煌豪华别墅聚会','北京昌平区香堂文化新村别墅区北七区','7室3厅1厨2阳台&middot;560m&sup2;<br />\r\n可住9人以上，共16张床&middot; 可加床<br />\r\n别墅共3层560平米，100多平米大院可烧烤<br />\r\n厨房设备完善，可以烹饪各种美食 <br />\r\n娱乐设备：台球、乒乓球、桌上足球等<br />\r\n位于昌平城区地铁南邵站附近，交通方便','/upload/1526747292438.jpg',3999,3,3,'2018-5-20 0:28:23','no','1'),(24,'上海崇明度假聚会轰趴别墅','上海崇明县三星镇西新村','5室3厅1厨0阳台&middot;380m&sup2;<br />\r\n可住9人以上，共6张床&middot; 不可加床<br />\r\n家门口50米处有公交车站，南牛线-西新村<br />\r\n附近5公里有明珠湖，8公里有国家西沙湿地<br />\r\n全实木床+宜家床垫，提供开放式厨房（配备常用厨具+调料）<br />\r\nKTV设备、麻将桌、烧烤架','/upload/1526747680984.jpg',3669,3,0,'2018-5-20 0:34:55','no','1'),(25,'上海别墅轰趴团建聚会','上海宝山区依安路39弄1-158号飘鹰锦和花园','4室2厅1厨2阳台&middot;300m&sup2;<br />\r\n可住9人以上，共5张床&middot; 可加床<br />\r\n别墅总共四层，开放地下一层和院子可以娱乐聚会烧烤<br />\r\n开放式超大的厨房，厨具齐全，满足您烹饪的需求<br />\r\n卫生间马桶装有电动马桶盖<br />\r\n100M的电信宽带,wifi覆盖了全部房间','/upload/1526747770008.jpg',4166,3,0,'2018-5-20 0:36:21','no','1'),(26,'北京往北-水镇故事双卧双卫叠院','北京密云区龙湖长城源著','2室1厅1厨2阳台&middot;83m&sup2;<br />\r\n可住4人，共2张床&middot; 不可加床<br />\r\n此房是龙湖源著一期精装修叠拼别墅，分上下两层，带小花园<br />\r\n两室两露台两卫带客厅厨房，厨具齐全<br />\r\n无线网络，有线电视，冰箱微波炉洗衣机等家具家电齐全。 <br />\r\n位于水镇入口西侧，观景效果极佳','/upload/1526747867110.jpg',466,4,0,'2018-5-20 0:38:17','no','1'),(27,'御园四合院-前门，大栅栏，前门，故宫欢聚','北京西城区东旧帘子胡同-道路','7室1厅1厨1阳台&middot;300m&sup2;<br />\r\n可住9人以上，共7张床&middot; 不可加床<br />\r\n房间里全部安装有烟感警报器，所以不可抽烟<br />\r\n四合院是平房，会出现尘土和蚊子，洁癖者慎选<br />\r\n可代收快递;有针线包<br />\r\n额外打扫100.0￥/次;额外更换被单100.0￥/次','/upload/1526747951731.jpg',3688,4,0,'2018-5-20 0:39:21','no','1');
/*!40000 ALTER TABLE `t_objfw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pinglun`
--

DROP TABLE IF EXISTS `t_pinglun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pinglun` (
  `id` int(11) NOT NULL,
  `objfw_id` int(11) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pinglun`
--

LOCK TABLES `t_pinglun` WRITE;
/*!40000 ALTER TABLE `t_pinglun` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_pinglun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pw` varchar(50) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_realname` varchar(50) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_sex` varchar(50) DEFAULT NULL,
  `user_tel` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_qq` varchar(50) DEFAULT NULL,
  `user_man` varchar(50) DEFAULT NULL,
  `user_age` varchar(50) DEFAULT NULL,
  `user_birthday` varchar(50) DEFAULT NULL,
  `user_xueli` varchar(50) DEFAULT NULL,
  `user_del` varchar(50) DEFAULT NULL,
  `user_one1` varchar(50) DEFAULT NULL,
  `user_one2` varchar(50) DEFAULT NULL,
  `user_one3` varchar(50) DEFAULT NULL,
  `user_one4` varchar(50) DEFAULT NULL,
  `user_one5` varchar(50) DEFAULT NULL,
  `user_one6` int(11) DEFAULT NULL,
  `user_one7` int(11) DEFAULT NULL,
  `user_one8` int(11) DEFAULT NULL,
  `user_one9` datetime DEFAULT NULL,
  `user_one10` datetime DEFAULT NULL,
  `user_one11` bigint(20) DEFAULT NULL,
  `user_one12` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'user1','123456',0,'唐军','天津','男','1571206737','tangjun@163.com','65975062',NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'wangliu','wangliu',0,'王六','郑州','男','13123123111','1312255232@qq.com','1312255232',NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'ceshi12','111111',0,'李四','北京','男','13245678908','324676@qq.com','324676',NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'liming','123456',0,'李明','郑州','男','15738516555','522685225@qq.com','522685225',NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'xinghai','456789',0,'刘烨','北京市海淀区','女','15623335698','liuye@163.com','236655486',NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'haha','456789',0,'刘烨新','郑州','女','15623335698','liuye@163.com','236655486',NULL,NULL,NULL,NULL,'no',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-26 21:06:30
