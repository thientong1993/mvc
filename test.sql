# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 103.90.226.121 (MySQL 5.5.57)
# Database: admin_blog
# Generation Time: 2018-01-30 10:12:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`category_id`, `category_name`, `status`)
VALUES
	(2,'Công Nghệ',1),
	(3,'Bóng Đá',1),
	(4,'Tản Mạn',1);

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `FK_post_idx` (`post_id`),
  CONSTRAINT `FK_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `images` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FK_user_idx` (`user_id`),
  KEY `FK_category_idx` (`category_id`),
  CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;

INSERT INTO `post` (`post_id`, `title`, `description`, `content`, `datetime`, `status`, `user_id`, `category_id`, `images`)
VALUES
	(42,'Lê Quang Liêm rộng cửa vô địch SPICE Cup','Tạo ra khoảng cách 0,5 điểm với các đối thủ bám đuổi trước ván đấu cuối cùng, kỳ thủ Lê Quang Liêm đứng trước cơ hội lớn để lên ngôi vô địch giải cờ vua SPICE Cup 2015','<p>Tạo ra khoảng c&aacute;ch 0,5 điểm với c&aacute;c đối thủ b&aacute;m đuổi trước v&aacute;n đấu cuối c&ugrave;ng, kỳ thủ L&ecirc; Quang Li&ecirc;m đứng trước cơ hội lớn để l&ecirc;n ng&ocirc;i v&ocirc; địch giải cờ vua SPICE Cup 2015.</p>\r\n\r\n<p>Ng&agrave;y 21/10 (theo giờ địa phương), L&ecirc; Quang Li&ecirc;m (elo 2.697) thi đấu 2 v&aacute;n. Ở v&aacute;n 7, anh cầm qu&acirc;n trắng h&ograve;a với kỳ thủ Aleksandr Shimanov (Nga, elo 2.593). Kết quả n&agrave;y gi&uacute;p kỳ thủ Việt Nam dẫn đầu bảng xếp hạng với 5,5 điểm.</p>\r\n\r\n<p>Đến v&aacute;n 8, L&ecirc; Quang Li&ecirc;m cầm qu&acirc;n đen (đi sau) chạm tr&aacute;n Samuel Sevian (Mỹ, elo 2.566). D&ugrave; gặp bất lợi, anh vẫn xuất sắc đ&aacute;nh bại đối thủ tạo ra bước ngoặt trong cuộc đua v&ocirc; địch.</p>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Lê Quang Liêm thi đấu thành công tại giải SPICE Cup 2015 sau khi giành ngôi á quân giải cờ triệu phú.\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/AfsSI/2015_10_22/LeQuangLiem211024x684.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>L&ecirc; Quang Li&ecirc;m thi đấu th&agrave;nh c&ocirc;ng tại giải SPICE Cup 2015 sau khi gi&agrave;nh ng&ocirc;i &aacute; qu&acirc;n giải cờ triệu ph&uacute;.</p>\r\n\r\n			<p>Kết quả n&agrave;y c&ugrave;ng với việc Shimanov h&ograve;a với Ray Robson gi&uacute;p L&ecirc; Quang Li&ecirc;m dẫn đầu bảng xếp hạn với 6,5 điểm, hơn hai kỳ thủ b&aacute;m ph&iacute;a sau l&agrave; Shimanov v&agrave; Kayden Troff 0,5 điểm.</p>\r\n\r\n			<p>Ở v&aacute;n cuối c&ugrave;ng, kỳ thủ Việt nam cầm qu&acirc;n đen chạm tr&aacute;n đối thủ kh&aacute; mạnh người Ukraina Illya Nyzhnyk (elo 2.628). Nếu gi&agrave;nh chiến thắng, anh sẽ l&ecirc;n ng&ocirc;i v&ocirc; địch SPICE Cup 2015. Trong trường hợp h&ograve;a anh vẫn c&oacute; cơ hội đăng quang nếu cặp đấu giữa Shimavov &ndash; Kayden Troff bất ph&acirc;n thắng bại.</p>\r\n\r\n			<p>Lần gần nhất L&ecirc; Quang Li&ecirc;m v&ocirc; địch SPICE Cup l&agrave; năm 2011. Anh gi&agrave;nh ng&ocirc;i &aacute; qu&acirc;n ở giải năm 2012 nhưng thi đấu th&agrave;nh c&ocirc;ng hai lần giải sau đ&oacute;. SPICE Cup 2015 l&agrave; cơ hội để L&ecirc; Quang Li&ecirc;m t&iacute;ch lũy th&ecirc;m elo, cải thiện vị tr&iacute; tr&ecirc;n bảng xếp hạng FIDE th&aacute;ng 11. Nhiều khả năng sau giải, kỳ thủ sinh năm 1991 sẽ c&oacute; elo vượt con số 2.717 - mức cao nhất của anh từ trước đến nay.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','2015-10-21 20:46:53',1,3,3,'upload/anhnen4.jpg'),
	(43,'Trợ lý HLV Miura tuyển quân cho U23 Việt Nam','HLV Trần Công Minh có mặt ngay từ đầu để theo dõi các trận đấu của giải U21 báo Thanh Niên, qua đó chọn ra những gương mặt thi đấu tốt đề xuất triệu tập lên đội U23 Việt Nam. ','<p>Cựu danh thủ người Đồng Th&aacute;p l&agrave; trợ l&yacute; đắc lực của HLV Miura thời gian qua. Trần C&ocirc;ng Minh c&oacute; mặt trong cabin huấn luyện tại SEA Games 28 c&ugrave;ng đội U23 Việt Nam v&agrave; v&ograve;ng loại World Cup 2018 với ĐTQG. Sau khi kết th&uacute;c hai trận đấu với Iraq v&agrave; Th&aacute;i Lan, &ocirc;ng c&ugrave;ng một số chuy&ecirc;n gia kh&aacute;c đ&atilde; nhận nhiệm vụ từ LĐBĐ Việt Nam (VFF) về việc tuyển chọn cầu thủ bổ sung l&ecirc;n tuyển.</p>\r\n\r\n<p>C&oacute; mặt tr&ecirc;n kh&aacute;n đ&agrave;i s&acirc;n Thống Nhất, Trần C&ocirc;ng Minh rất chăm ch&uacute; theo d&otilde;i hai trận đấu đầu ti&ecirc;n của giải U21 khi Gia Lai gặp TP HCM v&agrave; Thừa Thi&ecirc;n Huế thi đấu với An Giang. &Ocirc;ng ghi ch&eacute;p kỹ về vị tr&iacute;, c&aacute;ch chơi của những cầu thủ thi đấu ấn tượng. &Ocirc;ng cho biết &nbsp;sẽ theo d&otilde;i tất cả c&aacute;c trận đấu tại giải U21 quốc gia trước khi chờ ph&acirc;n c&ocirc;ng từ VFF.</p>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Trợ lý HLV Miura tuyển quân cho U23 Việt Nam\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/AfsSI/2015_10_22/congminh_zing.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Trợ l&yacute; Trần C&ocirc;ng Minh (cầm giấy) chăm ch&uacute; theo d&otilde;i trận U21 Gia Lai - U21 TP HCM. Ảnh: <em>Ho&agrave;ng T&acirc;m</em></p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>HLV Trần C&ocirc;ng Minh c&oacute; mặt ngay từ đầu để theo d&otilde;i c&aacute;c trận đấu của giải U21 b&aacute;o Thanh Ni&ecirc;n, qua đ&oacute; chọn ra những gương mặt thi đấu tốt đề xuất triệu tập l&ecirc;n đội U23 Việt Nam.</p>\r\n\r\n			<p>Cựu danh thủ người Đồng Th&aacute;p l&agrave; trợ l&yacute; đắc lực của HLV Miura thời gian qua. Trần C&ocirc;ng Minh c&oacute; mặt trong cabin huấn luyện tại SEA Games 28 c&ugrave;ng đội U23 Việt Nam v&agrave; v&ograve;ng loại World Cup 2018 với ĐTQG. Sau khi kết th&uacute;c hai trận đấu với Iraq v&agrave; Th&aacute;i Lan, &ocirc;ng c&ugrave;ng một số chuy&ecirc;n gia kh&aacute;c đ&atilde; nhận nhiệm vụ từ LĐBĐ Việt Nam (VFF) về việc tuyển chọn cầu thủ bổ sung l&ecirc;n tuyển.</p>\r\n\r\n			<p>C&oacute; mặt tr&ecirc;n kh&aacute;n đ&agrave;i s&acirc;n Thống Nhất, Trần C&ocirc;ng Minh rất chăm ch&uacute; theo d&otilde;i hai trận đấu đầu ti&ecirc;n của giải U21 khi Gia Lai gặp TP HCM v&agrave; Thừa Thi&ecirc;n Huế thi đấu với An Giang. &Ocirc;ng ghi ch&eacute;p kỹ về vị tr&iacute;, c&aacute;ch chơi của những cầu thủ thi đấu ấn tượng. &Ocirc;ng cho biết &nbsp;sẽ theo d&otilde;i tất cả c&aacute;c trận đấu tại giải U21 quốc gia trước khi chờ ph&acirc;n c&ocirc;ng từ VFF.</p>\r\n\r\n			<table align=\"center\">\r\n				<tbody>\r\n					<tr>\r\n						<td><img alt=\"Trợ lý HLV Miura tuyển quân cho U23 Việt Nam\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/AfsSI/2015_10_22/congminh_zing.jpg\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td>Trợ l&yacute; Trần C&ocirc;ng Minh (cầm giấy) chăm ch&uacute; theo d&otilde;i trận U21 Gia Lai - U21 TP HCM. Ảnh: <em>Ho&agrave;ng T&acirc;m</em></td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>C&ocirc;ng Minh kh&ocirc;ng phải chuy&ecirc;n gia duy nhất c&oacute; mặt tại s&acirc;n Thống Nhất để chọn cầu thủ, c&ugrave;ng với &ocirc;ng c&ograve;n c&oacute; trợ l&yacute; Ng&ocirc; Quang Sang, cựu gi&aacute;m đốc kỹ thuật (GĐKT) của B.B&igrave;nh Dương Mai Đức Chung v&agrave; cựu HLV ĐTVN Trần Duy Long. &Ocirc;ng Mai Đức Chung - Ủy vi&ecirc;n Hội đồng HLV quốc gia cho biết: &ldquo;Ch&uacute;ng t&ocirc;i c&oacute; đến 10 ti&ecirc;u ch&iacute; để tuyển chọn cầu thủ bổ sung cho c&aacute;c ĐTQG, bao gồm phong độ, &yacute; thức chiến thuật, thể lực, thể h&igrave;nh&hellip;&rdquo;.</p>\r\n\r\n			<p>Theo kế hoạch, đội U23 Việt Nam sẽ tập trung từ ng&agrave;y 5/12 để chuẩn bị cho VCK U23 ch&acirc;u &Aacute; 2016. Giải đấu diễn ra tại Qatar từ ng&agrave;y 12 đến 30/1/2016. Theo kết quả bốc thăm, U23 Việt Nam rơi v&agrave;o bảng D c&ugrave;ng UAE, Jordan v&agrave; Australia. Đ&acirc;y l&agrave; một trong những s&acirc;n chơi quan trọng nhất của b&oacute;ng đ&aacute; Việt Nam trong năm 2016. Đứng trước sức s&eacute;p lớn từ dư luận xung quanh năng lực của HLV Miura, VFF đ&atilde; sớm l&ecirc;n kế hoạch gi&uacute;p đỡ &ocirc;ng thầy người Nhật.</p>\r\n\r\n			<p>Về phần m&igrave;nh, HLV Miura sẽ về Nhật Bản v&agrave;o ng&agrave;y 23/10 v&agrave; nghỉ ngơi một tuần trước khi bắt tay v&agrave;o c&ocirc;ng việc. Những đề xuất từ trợ l&yacute; Trần C&ocirc;ng Minh cũng như HLV Mai Đức Chung, Trần Duy Long chắc chắn sẽ rất hữu &iacute;ch để HLV người Nhật Bản x&acirc;y dựng đội U23 Việt Nam trong thời gian tới.</p>\r\n\r\n			<p>Nguyễn Đăng</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','2015-10-22 17:15:28',1,3,3,'upload/anhnen.jpg'),
	(44,'U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng','Đội U21 An Giang đã có màn lội ngược dòng kịch tính để giành chiến thắng sát nút 4-3 trước U21 Thừa Thiên Huế để giành chiến thắng trong trận ra quân ở VCK U21 QG báo Thanh Niên. ','<p>Đội U21 An Giang đ&atilde; c&oacute; m&agrave;n lội ngược d&ograve;ng kịch t&iacute;nh để gi&agrave;nh chiến thắng s&aacute;t n&uacute;t 4-3 trước U21 Thừa Thi&ecirc;n Huế để gi&agrave;nh chiến thắng trong trận ra qu&acirc;n ở VCK U21 QG b&aacute;o Thanh Ni&ecirc;n.</p>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/Jac_Huo/2015_10_22/1_zing.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chiều 22/10, đội U21 An Giang (&aacute;o trắng) c&oacute; trận đầu ti&ecirc;n gặp đối thủ U21 Thừa Thi&ecirc;n Huế tr&ecirc;n s&acirc;n vận động Thống Nhất ở VCK U21 Quốc gia.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/Jac_Huo/2015_10_22/2_zing.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cả hai đội nhập cuộc với quyết t&acirc;m cao v&agrave; lối chơi đầy cống hiến. U21 Huế l&agrave; đội mở tỷ số bằng b&agrave;n thắng từ pha dứt điểm ngo&agrave;i v&ograve;ng 16m50 ở ng&agrave;y đầu hiệp 1.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/Jac_Huo/2015_10_22/3_zing.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thế trận cởi mở, hai đội b&oacute;ng đều c&oacute; nhiều pha uy hiếp nguy hiểm về ph&iacute;a khung th&agrave;nh đối phương.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/Jac_Huo/2015_10_22/4_zing.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ở những ph&uacute;t cuối hiệp 1, Tiền đạo Thanh Thảo (An Giang) đi b&oacute;ng qua 3 cầu thủ đối phương dứt điểm gọn g&agrave;ng c&acirc;n bằng tỷ số cho đội nh&agrave;.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/Jac_Huo/2015_10_22/12_zing.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sang hiệp 2, U21 Huế tiếp tục l&agrave; đội vượt l&ecirc;n dẫn b&agrave;n sau nhiều pha uy hiếp khung th&agrave;nh đối phương.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/Jac_Huo/2015_10_22/6_zing.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tuy nhi&ecirc;n, lối chơi hợp l&yacute; v&agrave; sự ăn &yacute; gi&uacute;p c&aacute;c cầu thủ An Giang lần lượt ghi b&agrave;n gỡ h&ograve;a v&agrave; vượt l&ecirc;n dẫn 4-3 ở những ph&uacute;t cuối trận đấu.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/Jac_Huo/2015_10_22/5_zing_1.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>U21 An Giang gi&agrave;nh chiến thắng trận đầu ra qu&acirc;n VCK U21 Quốc gia sau m&agrave;n lội ngược d&ograve;ng kịch t&iacute;nh.&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/Jac_Huo/2015_10_22/7_zing.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ở trận đấu mở m&agrave;n giải trước đ&oacute;, U21 HAGL với nhiều cầu thủ đến từ học viện HAGL Arsenal JMJ đ&atilde; phải chia điểm trước chủ nh&agrave; U21 TP HCM.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"U21 An Giang ngược dòng ngoạn mục trong trận cầu 7 bàn thắng\" src=\"http://img.v3.news.zdn.vn/w660/Uploaded/Jac_Huo/2015_10_22/8_zing.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trung vệ Trần Hữu Đ&ocirc;ng Triều, Minh Vương... l&agrave; những cầu thủ được người h&acirc;m mộ kỳ vọng dẫn dắt U21 HAGL tiến s&acirc;u v&agrave;o giải. Nhưng m&agrave;n thể hiện của c&aacute;c cầu thủ tr&ecirc;n s&acirc;n chưa thực sự thuyết phục.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','2015-10-22 17:16:24',1,3,3,'upload/anhnen.jpg');

/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`user_id`, `email`, `password`, `fullname`, `role`, `status`)
VALUES
	(3,'facebookanhnt@gmail.com','25d55ad283aa400af464c76d713c07ad','Anh',1,1);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
