-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost:8889
-- 產生時間： 2024 年 06 月 10 日 02:53
-- 伺服器版本： 5.7.39
-- PHP 版本： 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ecommerce_php`
--

-- --------------------------------------------------------

--
-- 資料表結構 `addbook`
--

CREATE TABLE `addbook` (
  `addressid` int(10) NOT NULL COMMENT '地址ID',
  `setdefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT '預設收件人',
  `user_id` int(10) NOT NULL COMMENT '會員編號',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者姓名',
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者電話',
  `myzip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '郵遞區號',
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件地址',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `carousel`
--

CREATE TABLE `carousel` (
  `caro_id` int(3) NOT NULL COMMENT '輪播編號',
  `caro_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '輪播標題',
  `caro_content` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '輪播內容介紹',
  `caro_online` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架',
  `caro_sort` int(3) NOT NULL COMMENT '輪播排序',
  `caro_pic` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '輪播圖檔名稱',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `carousel`
--

INSERT INTO `carousel` (`caro_id`, `caro_title`, `caro_content`, `caro_online`, `caro_sort`, `caro_pic`, `p_id`, `create_date`) VALUES
(1, 'THIS IS A TABLEWARE SELLING ONLINE STORE', 'THIS IS A TABLEWARE SELLING ONLINE STORE', 1, 1, 'carousel00.jpg', 1, '2024-05-16 09:59:29'),
(2, 'THIS IS A KITCHENWARE SELLING ONLINE STORE', 'WE SELL GOOD SHIT', 1, 2, 'carousel01.webp', 2, '2024-05-16 10:05:25'),
(3, 'NO DISCOUNT', 'WE DESERVE IT', 1, 3, 'carousel02.jpg', 3, '2024-05-16 10:06:46'),
(4, 'NO DISCOUNT', 'WE DESERVE IT', 1, 4, 'carousel03.webp', 4, '2024-05-16 10:08:08'),
(5, 'NO DISCOUNT', 'WE DESERVE IT', 1, 5, 'carousel04.webp', 5, '2024-05-16 10:08:56');

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cartid` int(10) NOT NULL COMMENT '購物車編號',
  `user_id` int(10) DEFAULT NULL COMMENT '會員編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `qty` int(3) NOT NULL COMMENT '產品數量',
  `orderid` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '訂單編號',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `ip` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂購者的IP',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入購物車時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `user_id` int(11) NOT NULL COMMENT 'email流水號',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email帳號',
  `pw1` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密碼',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否啟動',
  `cname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '中文姓名',
  `tssn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份證字號',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `imgname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相片檔名',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `multiselect`
--

CREATE TABLE `multiselect` (
  `msid` int(5) NOT NULL COMMENT '多功能選擇ID',
  `mslevel` int(2) NOT NULL COMMENT '多功能選擇層級',
  `msuplink` int(4) NOT NULL COMMENT '上層連結',
  `opcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外掛參數',
  `msname` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '多功能選擇名稱',
  `msort` int(11) DEFAULT NULL COMMENT '各功能列表排序',
  `url1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外掛網址1',
  `url2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外掛網址2',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `multiselect`
--

INSERT INTO `multiselect` (`msid`, `mslevel`, `msuplink`, `opcode`, `msname`, `msort`, `url1`, `url2`, `create_date`, `update_date`) VALUES
(1, 1, 0, NULL, '付款方式', 0, NULL, NULL, '2023-08-11 09:46:53', '2023-08-17 03:42:28'),
(2, 1, 0, NULL, '訂單處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(3, 2, 1, NULL, 'Cash on Delivery', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:37'),
(4, 2, 1, NULL, '信用卡付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:54'),
(5, 2, 1, NULL, '銀行轉帳', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:37'),
(6, 2, 1, NULL, '電子支付', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:51'),
(7, 2, 2, NULL, 'Processing', 1, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:03'),
(8, 2, 2, NULL, '待出貨', 2, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:32'),
(9, 2, 2, NULL, '運送中', 3, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:45'),
(10, 2, 2, NULL, '收貨完成', 4, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:10'),
(11, 2, 2, NULL, '退貨中', 5, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:24'),
(12, 2, 2, NULL, '已關閉訂單', 6, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:35'),
(13, 2, 2, NULL, '無效訂單', 7, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 05:39:26'),
(14, 2, 2, NULL, '訂單確認', 8, NULL, NULL, '2023-08-18 06:13:47', '2023-10-23 12:37:36'),
(15, 2, 2, NULL, '平台出貨', 9, NULL, NULL, '2023-08-18 06:13:47', '2023-10-25 08:29:31'),
(34, 1, 0, NULL, '付款處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(35, 2, 34, NULL, '侍貨到付款', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(36, 2, 34, NULL, '完成付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(37, 2, 34, NULL, '未完成付款', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(38, 2, 34, NULL, '貨到付款已完成', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `p_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '產品名稱',
  `p_intro` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '產品簡介',
  `p_price` int(11) DEFAULT NULL COMMENT '產品單價',
  `p_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上架',
  `p_content` text COLLATE utf8_unicode_ci COMMENT '產品詳細規格',
  `p_spec` text COLLATE utf8_unicode_ci COMMENT '尺寸材質屬性',
  `p_qty` int(10) NOT NULL DEFAULT '1',
  `p_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '產品輸入日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_spec`, `p_qty`, `p_date`) VALUES
(1, 5, 'The Round Bowl', 'As seen in Dwell, Bon Appetit, and more. The Round Bowl is a bowl-eater’s paradise; the perfect anything bowl. Our ceramics are crafted from natural Korean soils and hand-finished, and as such, each p', 45, 1, 'As seen in Dwell, Bon Appetit, and more. The Round Bowl is a bowl-eater’s paradise; the perfect anything bowl. Our ceramics are crafted from natural Korean soils and hand-finished, and as such, each piece is one-of-a-kind and imperfect.', 'Material\r\n\r\nNatural Korean clay blend made by Soil Baker craftsmen, exclusively for us.\r\n\r\nDimensions\r\n\r\n6.5\" wide, 3.5\" tall\r\n\r\nCare\r\n\r\nDishwasher and microwave-safe', 1, '2024-05-17 01:12:27'),
(2, 5, 'The Open Bowl', 'The Open Bowl is ideal for salads, noodles, and saucy meals. Our ceramics are crafted from natural Korean soils and hand-finished, and as such, each piece is one-of-a-kind and imperfect.', 45, 1, 'As seen in Dwell, Bon Appetit, and more. The Round Bowl is a bowl-eater’s paradise; the perfect anything bowl. Our ceramics are crafted from natural Korean soils and hand-finished, and as such, each piece is one-of-a-kind and imperfect.', 'Material\r\n\r\nNatural Korean clay blend made by Soil Baker craftsmen, exclusively for us.\r\n\r\nDimensions\r\n\r\n8.5\" wide, 2\" tall\r\n\r\nCare\r\n\r\nDishwasher and microwave-safe', 1, '2024-05-17 01:20:28'),
(3, 5, 'The Breakfast Bowl', 'The 5\" Breakfast Bowl is for yogurt, granola, cereal (basically all of our favorite breakfast foods). Our ceramics are crafted from natural Korean soils and hand-finished, and as such, each piece is o', 50, 1, 'The 5\" Breakfast Bowl is for yogurt, granola, cereal (basically all of our favorite breakfast foods). Our ceramics are crafted from natural Korean soils and hand-finished, and as such, each piece is one-of-a-kind and imperfect. Yet despite ceramics’ delicate reputation, ours are sturdy enough for everyday use, as well as dishwasher- and microwave-safe.\r\n', 'Material\r\n\r\nNatural Korean clay blend made by Soil Baker craftsmen, exclusively for us.\r\n\r\nDimensions\r\n\r\n5\" wide, 2\" tall\r\n\r\nCare\r\n\r\nDishwasher and microwave-safe', 1, '2024-05-17 01:27:28'),
(4, 4, 'The Half Glass Set', 'Set of 4. Fun fact: this glass was designed around the size of our ideal ice cube. The Half Glass does triple duty as a water glass, weeknight wine glass and rocks glass. Made from ultra-thin (and ult', 30, 1, 'Set of 4. Fun fact: this glass was designed around the size of our ideal ice cube. The Half Glass does triple duty as a water glass, weeknight wine glass and rocks glass. Made from ultra-thin (and ultra-strong) borosilicate glass, it\'s stackable, dishwasher-safe, resistant to thermal shock and made for everyday use.', 'Material\r\n\r\nUltra-thin (and ultra-strong) borosilicate glass\r\n\r\nDimensions\r\n\r\n9 oz, 2.9\" tall, 3.14\" wide\r\n\r\nCare\r\n\r\nDishwasher safe, resistant to thermal shock and made for everyday use.', 1, '2024-05-17 01:34:31'),
(5, 4, 'The Full Glass Set', 'Set of 4. A foot above the rest, this unique cup beautifully holds water, wine, and cocktails. Made from ultra-thin (and ultra-strong) borosilicate glass, it\'s stackable, dishwasher-safe, resistant to', 40, 1, 'Set of 4. A foot above the rest, this unique cup beautifully holds water, wine, and cocktails. Made from ultra-thin (and ultra-strong) borosilicate glass, it\'s stackable, dishwasher-safe, resistant to thermal shock and made for everyday use.', 'Material\r\n\r\nUltra-thin (and ultra-strong) borosilicate glass\r\n\r\nDimensions\r\n\r\n12.6 oz, 4.9\" tall, 3.11\" wide\r\n\r\nCare\r\n\r\nDishwasher safe, resistant to thermal shock and made for everyday use.', 1, '2024-05-17 01:37:28'),
(6, 4, 'The Cloud Pitcher', 'A statement-making vessel for ultra-stylish drink-making. This straight-walled pitcher featuring a wavy handle is perfectly proportioned for smooth stirring, water pouring and cocktail crafting.', 90, 1, 'A statement-making vessel for ultra-stylish drink-making. This straight-walled pitcher featuring a wavy handle is perfectly proportioned for smooth stirring, water pouring and cocktail crafting.', 'Material\r\n\r\nUltra-light (and ultra-strong) borosilicate glass\r\n\r\nDimensions\r\n\r\n45 oz, 8.25\" tall, 3.75\" diameter\r\n\r\nCare\r\n\r\nDishwasher-safe', 1, '2024-05-17 01:40:27'),
(7, 6, 'The Angled Board', 'A cutting board you’ll want to display.', 150, 1, 'Our elegant, hefty board is made with FSC-certified wood, and is thoughtfully built for both serious prep and simple serving. With a smooth side and a grooved-side, it’s ideal for cutting a juicy watermelon, carving a steak, or plating charcuterie.', 'Material\r\n\r\nFSC-certified walnut or ebonized white oak\r\n\r\nDimensions\r\n\r\n17\" long, 12\" wide, 1\" thick\r\n\r\nCare\r\n\r\nHand-wash and regularly apply wood oil to keep your board hydrated. Avoid highly acidic foods on Carbon due to its naturally stained wood.', 1, '2024-05-17 01:48:04'),
(8, 6, 'The reBowl', 'As featured in Architectural Digest and Food Network.', 25, 1, 'The truly all-purpose reBowl is our go-to for mixing, serving, and storing. Buy a set of 3 and nest for easy storage. Plus, it’s BPA-free, dishwasher-safe and made from the same sustainable materials as our award-winning reBoards..', 'Material\r\n\r\n75% recycled plastic, 25% renewable sugarcane\r\n\r\nDimensions\r\n\r\n2.75 qt capacity. 10\" wide, 5\" tall.\r\n\r\nCare\r\n\r\nDishwasher and microwave-safe', 1, '2024-05-17 01:52:06'),
(9, 6, 'The reBoard®', 'As featured in Architectural Digest and Food Network.', 35, 1, 'These colorful BPA-free cutting boards are made entirely of kitchen plastic scraps and renewable sugarcane. One small step for sustainability, one giant leap for kitchen goods.', 'Material\r\n\r\n75% recycled plastic, 25% renewable sugarcane\r\n\r\nDimensions\r\n\r\n14.75\" long, 10.75\" wide, 0.375\" thick\r\n\r\nCare\r\n\r\nDishwasher-safe. If your countertop is slippery, place a cloth or damp paper towel under your board before using.', 1, '2024-05-17 01:55:26'),
(10, 7, 'The Coated Pan', 'As featured in Food & Wine\'s \'Best Nonstick Pans of 2021\'.', 114, 1, 'Copper is the best of the best, and it’s at the core of our pans. Known for its unrivaled mastery of heat, copper heats up quickly and evenly, but is also notoriously expensive and difficult to care for—until now. Ours has all the pros, none of the cons, and has a beautiful non-stick coating, too. Good news —works on induction cook tops as well.', 'Material\r\n\r\n5-ply copper core with aluminum and stainless steel outer and stainless steel alloy coating made without lead, cadmium or PFOAs (In compliance with enacted right-to-know legislation, the linked information provides information for consumers on what ingredients are used in the manufacture or processing of our products: https://materialkitchen.com/pages/california-ab1200-disclosure).\r\n\r\nDimensions\r\n\r\n10.5\" wide, 19\" long, 1.8\" high\r\n\r\nCare\r\n\r\nDishwasher-safe; use with silicone or wood utensils to preserve nonstick', 1, '2024-05-17 02:04:09'),
(11, 7, 'The Sauce Pot', 'As seen in Epicurious and New York Magazine..', 114, 1, '3-quart pot, limitless possibilities. With the same copper core and five-ply construction as our pans, it’s got all the low-maintenance, high-performance heat mastery needed to make everything from an umami-packed pasta sauce to instant noodles.', 'Material\r\n\r\n5-ply copper core with aluminum and stainless steel outer\r\n\r\nDimensions\r\n\r\n3 qt capacity. 8\" wide, 15.6\" long, 4.5\" high.\r\n\r\nCare\r\n\r\nDishwasher-safe', 1, '2024-05-17 02:24:48'),
(12, 7, 'The Saute Pan', 'As featured in Fast Company and Vogue.', 123, 1, 'Minimize mess, maximize flavor. The tall walls on our 10.5” sauté pan safely contain your stews and sauces. Plus, it’s got our signature copper core for rapid, even heating and the perfect sear, every time and for years to come.', 'Material\r\n\r\n5-ply copper core with aluminum and stainless steel outer\r\n\r\nDimensions\r\n\r\n3 qt capacity. 10.5\" wide, 20.4\" long, 2.25\" high.\r\n\r\nCare\r\n\r\nDishwasher-safe', 1, '2024-05-17 02:33:17');

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int(11) NOT NULL COMMENT '圖檔編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `img_file` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖檔名稱',
  `sort` int(2) NOT NULL COMMENT '圖片順序',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product_img`
--

INSERT INTO `product_img` (`img_id`, `p_id`, `img_file`, `sort`, `create_date`) VALUES
(1, 1, 'Round_Bowl_Grotto_960x.webp', 1, '2024-05-17 01:16:15'),
(2, 1, '370e388755a7--7.webp', 2, '2024-05-17 01:18:04'),
(3, 2, 'Open_Bowl_Dune.webp', 1, '2024-05-17 01:24:00'),
(4, 2, 'Open_Bowl_Grotto.webp', 2, '2024-05-17 01:24:00'),
(5, 3, 'BreakfastBowlDune.webp', 1, '2024-05-17 01:29:31'),
(6, 3, 'BreakfastBowlGrotto.webp', 2, '2024-05-17 01:29:31'),
(7, 4, 'HalfGlassMalachite.webp', 1, '2024-05-17 01:35:51'),
(8, 4, 'HalfGlassClear.webp', 2, '2024-05-17 01:35:51'),
(9, 5, 'FullGlassMalachite.webp', 1, '2024-05-17 01:38:30'),
(10, 5, '931fe85cdab7--Prod01-FullGlass-e194a7.webp', 2, '2024-05-17 01:38:30'),
(11, 6, '9_3dbbe2e4-5346-4012-97cb-9e7a05420a77.webp', 1, '2024-05-17 01:42:27'),
(12, 6, 'e6f7193f5e70--3-535a3f.webp', 2, '2024-05-17 01:42:27'),
(13, 7, 'AngledBoard-Carbon_5b458058-6428-4708-a640-40d278beab8f.webp', 1, '2024-05-17 01:49:35'),
(14, 7, '3732202d98b0--angledboard-04-7e6dc8.webp', 2, '2024-05-17 01:49:35'),
(15, 8, '4_455cb517-3702-41b8-9819-e565a9657220.webp', 1, '2024-05-17 01:53:17'),
(16, 8, '9551b375e116--Rectangle-3313-a88f18.webp', 2, '2024-05-17 01:53:17'),
(17, 9, 'reBoard_deep_fd720a4f-36bc-4701-9128-422f32fa6d91.webp', 1, '2024-05-17 01:57:19'),
(18, 9, 'ef9484dcf66a--reBoard-PDP-Hero-Spot-54526d.webp', 2, '2024-05-17 01:57:19'),
(19, 10, 'coatedpanskysite_1.webp', 1, '2024-05-17 02:12:54'),
(20, 10, '2bcd3829aeff--The-Coated-Pan-Sky-by.dust-e429e5.webp', 2, '2024-05-17 02:12:54'),
(21, 11, 'SaucePot1_72c050fe-004b-4803-9a77-9600361c66c5.webp', 1, '2024-05-17 02:26:12'),
(22, 11, 'Rectangle3372.webp', 2, '2024-05-17 02:26:12'),
(23, 12, 'SautePan-1.webp', 1, '2024-05-17 02:34:52'),
(24, 12, 'Rectangle3377.webp', 2, '2024-05-17 02:34:52');

-- --------------------------------------------------------

--
-- 資料表結構 `pyclass`
--

CREATE TABLE `pyclass` (
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `level` int(2) NOT NULL COMMENT '所在層級',
  `fonticon` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '字型圖示',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '類別名稱',
  `sort` int(3) NOT NULL COMMENT '列表排序',
  `uplink` int(3) NOT NULL COMMENT '上層連結',
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '建立時間與更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `pyclass`
--

INSERT INTO `pyclass` (`classid`, `level`, `fonticon`, `cname`, `sort`, `uplink`, `image`, `create_date`) VALUES
(1, 1, 'fa-user', 'Tableware', 1, 0, NULL, '2024-05-16 10:17:22'),
(2, 1, 'fa-user', 'Kitchenware', 2, 0, NULL, '2024-05-16 10:28:43'),
(3, 1, 'fa-user', 'Accesory', 3, 0, NULL, '2024-05-16 10:29:33'),
(4, 2, 'fa-file', 'Glassware', 1, 1, 'glassware.webp', '2024-05-17 03:44:23'),
(5, 2, 'fa-file', 'Ceramics', 2, 1, 'ceramics.webp', '2024-05-17 03:44:09'),
(6, 2, 'fa-file', 'Prepware', 1, 2, 'prepware.webp', '2024-05-17 03:45:21'),
(7, 2, 'fa-file', 'Cookware', 2, 2, 'cookware.webp', '2024-05-17 03:45:55'),
(8, 2, 'fa-file', 'Tools', 3, 2, 'tools.webp', '2024-05-17 03:46:35'),
(9, 2, 'fa-file', 'Sets', 1, 3, 'sets.webp', '2024-05-17 03:47:02'),
(10, 2, 'fa-file', 'Cares', 2, 3, 'cares.webp', '2024-05-17 03:47:21'),
(11, 2, 'fa-file', 'Storage', 3, 3, 'storage.webp', '2024-05-17 03:47:59');

-- --------------------------------------------------------

--
-- 資料表結構 `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `rate` int(3) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `review`
--

INSERT INTO `review` (`id`, `user`, `rate`, `content`, `image`) VALUES
(1, 'user01', 5, 'Very Good Experience', 'person_1.jpg'),
(2, 'user02', 3, 'AN OK EXPERIENCE', 'person_2.jpg'),
(3, 'user03', 2, 'OK', 'person_3.jpg'),
(4, 'user04', 5, 'Excellent Quality', 'person_4.jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `uorder`
--

CREATE TABLE `uorder` (
  `orderid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂單編號',
  `user_id` int(10) NOT NULL COMMENT '會員編號',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` tinyint(4) NOT NULL DEFAULT '1' COMMENT '付款方式',
  `payment_status` int(5) DEFAULT NULL COMMENT '付款狀態',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '訂單時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `addbook`
--
ALTER TABLE `addbook`
  ADD PRIMARY KEY (`addressid`);

--
-- 資料表索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`caro_id`);

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 資料表索引 `multiselect`
--
ALTER TABLE `multiselect`
  ADD PRIMARY KEY (`msid`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`);

--
-- 資料表索引 `pyclass`
--
ALTER TABLE `pyclass`
  ADD PRIMARY KEY (`classid`);

--
-- 資料表索引 `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `uorder`
--
ALTER TABLE `uorder`
  ADD PRIMARY KEY (`orderid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addbook`
--
ALTER TABLE `addbook`
  MODIFY `addressid` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址ID', AUTO_INCREMENT=36;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `carousel`
--
ALTER TABLE `carousel`
  MODIFY `caro_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '輪播編號', AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(10) NOT NULL AUTO_INCREMENT COMMENT '購物車編號', AUTO_INCREMENT=47;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'email流水號', AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `multiselect`
--
ALTER TABLE `multiselect`
  MODIFY `msid` int(5) NOT NULL AUTO_INCREMENT COMMENT '多功能選擇ID', AUTO_INCREMENT=39;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '產品編號', AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '圖檔編號', AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pyclass`
--
ALTER TABLE `pyclass`
  MODIFY `classid` int(3) NOT NULL AUTO_INCREMENT COMMENT '產品類別', AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
