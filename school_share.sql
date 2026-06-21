/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1-MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80044
 Source Host           : localhost:3306
 Source Schema         : school_share

 Target Server Type    : MySQL
 Target Server Version : 80044
 File Encoding         : 65001

 Date: 19/06/2026 22:46:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (2, 'admin', 'admin', '系统管理员', 'http://localhost:9090/files/download/1768892564951-屏幕截图 2026-01-15 163617.png', '管理员');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  `user_id` int NULL DEFAULT NULL COMMENT '发布人ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'http://localhost:9090/files/download/1768837393130-屏幕截图 2026-01-19 234251.png', '校园好物101”分享会：实用好物碰撞智慧火花，解锁品质校园生活', '4月21日晚7时，由经济管理学院主办的\"素养蓄航\"系列活动之“校园好物101”分享会在校大学生活动中心成功举办。活动以\"pick你最爱的生活/学习好物\"为主题，吸引我院师生的热情参与，共同开启了一场校园生活智慧的交响乐章', '<p><span style=\"color: rgb(50, 50, 50); background-color: rgb(245, 246, 250);\"> &nbsp; &nbsp; &nbsp; 活动伊始，活动发起人高雨欣老师率先垂范，开启好物分享序幕。随后同学们也纷纷介绍了自己的校园好物，从提升学习效率的静音笔、多功能笔记本，到改善宿舍生活的折叠小风扇、创意收纳袋，再到个人护理必备的速干粉扑、痘痘贴，再或者是性价比拉满的电子产品，每一件分享都引发了现场同学的热烈讨论。特别值得一提的是，许多同学不仅展示了物品本身，更分享了独特的使用心得和小技巧，让这些好物的价值得到最大化发挥。</span></p><p><span style=\"color: rgb(50, 50, 50); background-color: rgb(245, 246, 250);\"> &nbsp; &nbsp;本次活动同学们在欢声笑语中分享校园好物，活动气氛轻松愉快。这既是实用好物的展示平台，更是生活智慧的孵化器。活动通过“师生共荐、场景解构、创意延伸”三维联动，既提升校园生活品质，更培养创新思维与实践能力。经济管理学院将持续深耕“素养蓄航”建设，围绕学生多维度发展推出活动，为提升大学生素养注入新动能。 </span></p>', '2026-01-19 23:43:15', 2, '通过', 'ok');
INSERT INTO `article` VALUES (2, 'http://localhost:9090/files/download/1768837632145-thumb.jpeg', '【大学生终极收藏】宿舍装饰及平价实用好物推荐！！！', '又到了每年的开学季，大家宿舍里有什么用了就离不开的好物？我先来分享几个亲测好用的，希望能帮助到大家～', '<h3 style=\"text-align: start;\"> 宿舍装饰类</h3><p style=\"text-align: start;\"><strong> 1.装饰小手办推荐</strong></p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/76e05573a2cd0620e8d82b4d32f33628/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><br></p><h4 style=\"text-align: center;\">喜多川海梦</h4><p><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/2e2a32ceebffa14cbf27f2204b2dbad3/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><h4 style=\"text-align: center;\">雅儿贝德</h4><p><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/3576add92cbe42369d169ae98a2b2268/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">pdd上有很多便宜小手办，这些手办大多数是微瑕，比如这个雅儿贝德，与正版相比就是缺了个底座，但质感超过了很多百元价位的手办了，20块钱要什么自行车！！！</p><p style=\"text-align: start;\"><strong> 2.桌面布置推荐</strong></p><p style=\"text-align: start;\">是否有不少人和我一样，一来到宿舍看见战损版宿舍感觉天都塌了？</p><p style=\"text-align: start;\">是不是有不少人买过这种桌贴用来遮瑕？</p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/3c0bb450564a1d2a0ba7ff8cbb1d338e/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><br></p><p style=\"text-align: start;\">其实遮瑕的办法有很多</p><p style=\"text-align: start;\">相比于桌贴我选择了<strong>桌布</strong></p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/46e0b0e687379dfd13f430ce40eb88d2/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/55839a0c238d782c39d958aaddf22bf2/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><br></p><p style=\"text-align: start;\">桌布这东西和桌贴价格差不多，但我觉得它的耐脏度会好很多，而且看起来会稍微高级点。</p><ul><li style=\"text-align: start;\">还可以为桌壁贴上自己喜欢的海报</li></ul><p style=\"text-align: start;\">我喜欢动漫和篮球，所以买了很多与之相关的海报</p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/e465bf92d3b9c0f9265bd1305307b72f/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/4a706598d2e7ff224e2531c152f11819/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><br></p><p style=\"text-align: start;\"> &nbsp;<strong>3 .移动小茶台</strong></p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/e2d2c89e69a001fe797b03a2d2c688e4/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><br></p><h3 style=\"text-align: start;\"> </h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/725e4d93f0b11485eb437431a5d8451e/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><h3 style=\"text-align: start;\"></h3><p style=\"text-align: start;\"> 我是一个很爱喝茶的人，不知道有没有盒友和我一样，这个茶台不仅满足了我的泡茶需求，同时还装饰了桌面（其实我放在了桌子旁边的行李箱上，这样空间没那么拥挤）可谓是一举两得。</p><h3 style=\"text-align: start;\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 实用好物类</h3><p style=\"text-align: start;\"><strong>1.床帘</strong></p><p style=\"text-align: start;\">床帘这个东西因人而异吧，不装当然也可以。</p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/e14bf1cad8cd0838cb50b3dd51825018/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><br></p><p style=\"text-align: start;\">我是分开买支架和遮光布的，这样能省个几十块钱，支架最好买可以伸缩的，遮光布里面那面最好要是黑色。</p><p style=\"text-align: start;\"><strong>2.宿舍自用锅</strong></p><p style=\"text-align: start;\">学校宿舍限电的敢不敢冒险看自己👀</p><p style=\"text-align: start;\">（这当然是违禁品啊，但锁在柜子里谁又知道呢）</p><p style=\"text-align: start;\">我们宿舍是限800w，实测4台笔记本加台灯全开，再同时使用2台这个锅并没有出现跳闸情况。</p><p style=\"text-align: start;\">这个锅真的很好用，我们宿舍4个人，3个人都买了这一款，平常可以买些面或者预制菜之类的，懒得出门就自己煮，还可以买一板鸡蛋，早上刷个牙🥚就煮好了。</p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/2d6a71b70e96a3320f3f071b747769ca/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><br></p><h4 style=\"text-align: center;\">在宿舍煮小火锅</h4><p><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/dafc34cfb1bc788f92cd7215b60db3b2/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><h4 style=\"text-align: center;\">烤肉</h4><p><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/121a77695a93d5c73ba0b201ef8d57fa/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">24块钱已经用了一年了，质量挺好的。</p><p style=\"text-align: start;\"><strong>2.选择一个合适的椅子</strong></p><p style=\"text-align: start;\">我个人觉得椅子这个东西真的很重要，毕竟在宿舍是要连续坐几年的，选择一把好一点的凳子，对颈椎友好一点，减少腰酸背痛，学习或者打游戏都舒服多了。</p><p style=\"text-align: start;\">很多人想买电竞椅吧，电竞椅建议大家稍微上点预算，100来块钱的气杆托盘还是有一点点炸肛风险的，我买的是这种办公椅，坐垫并不是那种特别特别软的，但是够用了，很舒服。</p><p style=\"text-align: start;\"><img src=\"https://imgheybox.max-c.com/bbs/2025/08/12/4006d1326cbff2d75bb82f5b89abc27b/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p><p style=\"text-align: start;\"><br></p>', '2026-01-19 23:48:01', 3, '拒绝', '涉及广告');
INSERT INTO `article` VALUES (3, 'http://localhost:9090/files/download/1768837791803-e8db10151efca31bd88938b5ccff8141.jpeg', '为什么大家这么鄙视XBOX', 'zsbd', '<p><span style=\"color: rgb(20, 25, 30); background-color: rgb(255, 255, 255); font-size: 16px;\">我选xbox的原因很简单，手感和外貌还有省心。 1 我觉得手感很好，很有分量，用起来很舒服。当然，这个分人，这是我个人的体验 2 外貌很朴素，但我就喜欢这种朴素，我个人觉得国产手柄太花哨了，只要贵一点的就多少带点灯光之类的，我觉得还不如普普通通的好看 3 省心，我不懂那一堆的参数，我的手也没那么敏感，我只知道买xbox会给我一个及格的手柄体验，这就足够了</span></p>', '2026-01-19 23:50:12', 3, '通过', NULL);
INSERT INTO `article` VALUES (4, 'http://localhost:9090/files/download/1768874647437-屏幕截图 2026-01-20 100354.png', '不高于300，只买高性价比！学生党全品类耳机推荐', '往期的推荐文章，我都会针对不同价位段作出相应的推荐。\n\n但这期的主题是开学季，所以我在想，有没有可能把价格控制在300以内，做一期最便宜最有性价比的耳机推荐，让预算比较拘谨的同学也能够买到适合自己的设备。\n\n当然如果你钱包鼓鼓，也可以等之后的双十一推荐。', '<h2 style=\"text-align: start;\"><strong>【有线入耳】</strong></h2><h3 style=\"text-align: start;\">● NiceHCK 原道（推荐评级： <strong>S </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/4a5b2b40fe13b936f4c34444b5ff567d/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">既然提到了性价比，那避不开的品牌必然是原道，七元一条还包邮的售价足以对任何差评立体防御。</p><p style=\"text-align: start;\">更别说这货的声音还真的挺不错的，人声温润贴耳，声场辽阔自然，绝对谈得上是悦耳，最关键是，随便用随便丢毫不心疼，甚至可以宿舍里一人送一条避免室友半夜外放。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\"><strong>●</strong> 原道 弦雪（推荐评级： <strong>A </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/15e808b4948bef4dd3cfe88ce608a594/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">第二款依旧是原道，弦雪作为当前市面上最便宜的DSP耳机，本身的声音素质丝毫不弱于百元左右的竞品。</p><p style=\"text-align: start;\">而且软件框架完善，提供了优秀的可玩性，再加上小巧的腔体，直插式设计以及优秀的佩戴，非常适合当作睡觉塞。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\">● 初耳 gate（推荐评级： <strong>A+ </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/ef3471689cc7fd6264b8a9026203e450/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">百元价位，初耳gate，依旧是我个人的首推，听感中正还原，声场辽阔自然。</p><p style=\"text-align: start;\">声音整体完成度在入门级塞子中可以说是首屈一指。加上优秀的单元性能、所带来同价位佼佼的分离与定位，除了做工稍显廉价，其他方面都让人很难挑出什么毛病。对刚入门HIFI的同学来说，选这款不会错。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\">● CVJ 薇薇安（推荐评级： <strong>A </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/c6fe02eac6f551766491ac3c5aec762f/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">CVJ的薇薇安，算是百元价位的另一个有力新品，入门产品比较经典的两头翘调音。</p><p style=\"text-align: start;\">中高频比较凸出，解析感不错，低频在量大的同时质感也保持的不错，澎湃抓耳，听流行与摇滚曲目非常的讨喜，适合喜欢一耳朵爽的同学。缺点就是声场稍显拥挤，不够规整，整体来讲，我觉得很值得推荐。</p><p style=\"text-align: start;\">——</p><p style=\"text-align: start;\">————————————————————</p><p style=\"text-align: start;\"><strong>两百价位，我会推荐两款没那么热门，但用下来非常惊艳的新品：</strong></p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\"><strong>●</strong> 鸽子 seeds（推荐评级： <strong>A </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/100d07d2eeea2b51b5f7f67cacb4bf88/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">鸽子 seeds，作为传奇入耳式耳塞ER4的复刻，听感非常的平直还原。</p><p style=\"text-align: start;\">单边三个调音开关加上电脑网页端的DSP适配，可玩性也相当不错，而且对于FPS游戏有专门的优化设计，再加上性能出色的麦克风，文能HIFI，武能电竞，无论是发烧友还是游戏玩家都很推荐。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\"><strong>●</strong> 未知作品 op.24（推荐评级： <strong>A+ </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/3da8eb9f8333111d81703fdbe25483f2/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">未知作品的op24，作为一个新品牌的开山之作，无论是外观设计，做工质感，还是声音表现，完成度都高的夸张。我猜应该是某家开的小号，所以这样的表现也在情理之中。</p><p style=\"text-align: start;\">整体是个扎实澎湃且又明亮抓耳的听感，两个挡位提供了差异明显的听感体验，双圈四铁的堆料配置，完全足以让其的素质解析在同价位称王称霸，非常推荐。</p><p style=\"text-align: start;\">——</p><p style=\"text-align: start;\">————————————————————</p><h2 style=\"text-align: start;\"><strong>【蓝牙入耳】</strong></h2><p style=\"text-align: start;\">蓝牙方面，由于物料成本的限制，我就不做过于便宜的推荐了。</p><p style=\"text-align: start;\">之前也买过一些来测试，不是参数虚标、就是品控做工一坨，而且售后没有保障，要不了几个月就报废，真不如买个牌子货能安安心心用一两年。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\"><strong>▲ </strong>摩托罗拉 moto Buds（推荐评级： <strong>A </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/17768e3cd6447bd741d09540f4178761/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">50db降噪深度，LHDC，抗风噪，这款原定价300元的耳机，纸面参数的确对标2，300元的产品。</p><p style=\"text-align: start;\">实测下来虽然达不到标称值，但在这个主动降噪都若有若无的价位上还是可以暴打竞品。唯一缺点就是调音不太行，是一个两头翘的风格。且在开降噪之后，中频还会更加凹陷，</p><p style=\"text-align: start;\">不过这个价格来说，没什么好挑的了。电商平台可能会稍贵，大家可以去闲鱼之类平台看看，120以内就能入手。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\"><strong>◆弱水时砂 琉璃MK2（推荐</strong>评级： <strong>A+ </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/754cb33f9119d82a0ffc8b871e6e209e/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">作为弱水的走量款琉璃的换代，这款就非常的稳扎稳打。</p><p style=\"text-align: start;\">降噪、透传、音质、延迟、续航可以说都是同价位的佼佼水平。虽然没有那种特别能够越级的性能，但胜在综合比较优秀，没有比较明显的缺陷，是典型的小钢炮机型。</p><p style=\"text-align: start;\">唯一问题就是自带的耳机套有点儿太小了，推荐换一个。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\"><strong>◆ </strong>原道 原点（推荐评级： <strong>S </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/577a468957cc77583c5ad42c7b324b1e/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">作为他家首款蓝牙，完全延续了其的超高性价比，把这价位能做到的每一项都给拉满了。</p><p style=\"text-align: start;\">降噪实测55dB的深度，平均降噪也高达30dB。音质优秀，虽然没给上自定义，但默认三种调音就几乎完美贴合了哈曼，阅真，JM1这三条认可度很高的参考曲线，还有特别优化调音的FPS电竞模式。耳机的透传佩戴延迟通话各方面也都非常完善，几乎没有什么可挑剔的点。</p><p style=\"text-align: start;\">同学可以等我之后的单品测评。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\"><strong>◆OPPO Enco Free4（推荐</strong>评级： <strong>S </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/7a9faddb574408f34a90a69d6edea166/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">如果你的预算再高点，那不用说，自然是我今年推过最多，OPPO大人的Enco Free4。</p><p style=\"text-align: start;\">这款可以说是前半年给了我最大惊喜的蓝牙耳机。其的中频降噪，透传，佩戴，声音，续航等各方面的表现。都是同价位最优选，再加上体验极其流畅的APP软件体验，可以说是中低端最值得推荐的蓝牙也不为过。</p><p style=\"text-align: start;\">——</p><p style=\"text-align: start;\">————————————————————</p><h2 style=\"text-align: start;\"><strong>【佩戴类型】</strong></h2><p style=\"text-align: start;\">然后是半入耳式以及开放式，也就是强调佩戴体验的蓝牙耳机，这里就推荐3款吧。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\"><strong>■ </strong>OPPO Enco Air 4轻声版（推荐评级： <strong>A </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/0a16a8324607cf781564d3593320d5bb/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">首先是OPPO Enco Air 4轻声版，续航超长，音质不错，佩戴舒适。</p><p style=\"text-align: start;\">非常适合不太习惯入耳式的同学。</p><p style=\"text-align: start;\">——</p><h3 style=\"text-align: start;\"><strong>■</strong>VIVO TWS Air 3 Pro（推荐评级： <strong>A </strong>）</h3><p><img src=\"https://imgheybox.max-c.com/bbs/2025/09/29/273cf048d1f0da2be88ac231dc3c8462/thumb.png?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p><p><br></p><p style=\"text-align: start;\">然后是VIVO的TWS Air 3 Pro，这款降噪性能非常优秀，有自适应算法加持。甚至在佩戴耦合较好的情况下，可以暴打同价位的入耳式。</p><p style=\"text-align: start;\">缺点嘛，就是音质非常拉胯，而且操作软件bug很多。不过这个价格你就能享受堪比半入耳最强Airpods4的降噪体验，就当买个降噪和佩戴吧。</p><p style=\"text-align: start;\">——</p>', '2026-01-20 10:04:37', 2, '通过', NULL);
INSERT INTO `article` VALUES (5, 'http://localhost:9090/files/download/1769004196477-屏幕截图 2026-01-21 220308.png', '便宜好看的大衣穿搭推荐', '大衣是秋冬衣橱的“定海神针”，不仅能保暖，更能极大地提升气质和时尚感。', '<p style=\"text-align: start;\">第一步：选对大衣是成功的一半</p><p style=\"text-align: start;\">在考虑怎么穿之前，先确保你有一件适合自己、版型优秀的大衣。</p><p style=\"text-align: start;\">1. 看版型（最关键）</p><p style=\"text-align: start;\">· H型（直筒型）： 线条利落，从上到下一样宽。最不挑身材，显高显瘦，能完美修饰各种身形问题，是首选入门款。</p><p style=\"text-align: start;\">· X型（收腰/系带型）： 突出腰线，非常显女人味和优雅。适合沙漏型身材或想突出曲线的女生，小个子穿也很显高。</p><p style=\"text-align: start;\">· A型（伞型）： 上窄下宽，像字母A。优雅复古，能完美遮住臀部和大腿的肉肉，适合梨形身材。但肩宽的人要谨慎选择。</p><p style=\"text-align: start;\">· O型（茧型）： 中间宽、两头窄，像个蚕茧。时尚感强，慵懒随性，但比较挑人，容易显矮或显壮，小个子和微胖身材要小心尝试。</p><p style=\"text-align: start;\">2. 看长度</p><p style=\"text-align: start;\">· 短款（及臀）： 利落精神，适合小个子，搭配灵活。</p><p style=\"text-align: start;\">· 中长款（及膝）： 最经典百搭的长度，既能保暖又不会压身高，适合大多数人。</p><p style=\"text-align: start;\">· 长款（过膝/及踝）： 气场强大，保暖性最佳。搭配好非常显高，但小个子需选择版型修身的H型长款，并注意内搭比例。</p><p style=\"text-align: start;\">3. 看颜色</p><p style=\"text-align: start;\">· 经典中性色： 黑色、灰色、驼色、卡其色、燕麦色。这些是衣橱必备，永不过时，搭配性极强。</p><p style=\"text-align: start;\">· 彩色/格纹： 海军蓝、墨绿色、焦糖色，或者千鸟格、人字纹等，能增加造型的亮点和复古感。</p><p style=\"text-align: start;\"> &nbsp;我是看这个杀手不太冷电影中男主里昂的造型迷上大衣的，太帅了，太man了，和小萝莉站一块满满的安全感。于是在海鲜市场随便整了一件，价格大概两杯奶茶钱。没想到一天就发过来了，质量大大出乎我意料，这北京大哥太银义了！非常厚实，穿到零下没毛病。垫肩非常夸张，给我整成三开门大冰箱了。只可惜长度没到我膝盖，以至于看起来有点太正式了，有点像以前的领导<br><img src=\"https://imgheybox.max-c.com/bbs/2025/10/26/f8e157d546661624a09df3e647dcee5b/thumb.jpeg?imageMogr2/format/webp/quality/50/auto-orient/ignore-error/1\" alt=\"\" data-href=\"\" style=\"width: 50%;\"></p>', '2026-01-21 22:05:16', 5, '通过', '好！');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '物品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '书籍');
INSERT INTO `category` VALUES (2, '日用品');
INSERT INTO `category` VALUES (3, '学习用品');
INSERT INTO `category` VALUES (4, '电子产品');
INSERT INTO `category` VALUES (5, '乐器');
INSERT INTO `category` VALUES (6, '衣服');
INSERT INTO `category` VALUES (7, '箱包');
INSERT INTO `category` VALUES (8, '鞋靴');
INSERT INTO `category` VALUES (9, '运动');
INSERT INTO `category` VALUES (10, '药品');
INSERT INTO `category` VALUES (11, '美妆');

-- ----------------------------
-- Table structure for charge
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_id` int NULL DEFAULT NULL COMMENT '被交换物品ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '交换物品',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '交换理由',
  `user_id` int NULL DEFAULT NULL COMMENT '申请人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核理由',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '交换地点',
  `share_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '交换时间',
  `item_userid` int NULL DEFAULT NULL COMMENT '物品主人ID',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '物品交换信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of charge
-- ----------------------------
INSERT INTO `charge` VALUES (1, 11, '金条', NULL, 1, '2026-01-19 17:28:35', '通过', NULL, '天台', '2026-01-21 23:59:59', 2, NULL);
INSERT INTO `charge` VALUES (2, 5, 'ou', '嘻嘻', 2, '2026-01-19 20:55:07', '通过', NULL, '天台', '2026-01-21 08:00:00', 1, NULL);
INSERT INTO `charge` VALUES (3, 14, '123', '123', 5, '2026-01-20 12:06:48', '通过', NULL, '图书馆', '2026-01-22 12:08:30', 3, NULL);
INSERT INTO `charge` VALUES (4, 10, '鼠标', '123', 1, '2026-01-20 23:45:18', '拒绝', '123333', NULL, NULL, 2, NULL);
INSERT INTO `charge` VALUES (5, 15, '英雄钢笔', '9成新', 1, '2026-01-21 21:42:35', '拒绝', '不行', '', '', 5, NULL);
INSERT INTO `charge` VALUES (6, 15, '1123', '123', 1, '2026-01-22 10:04:23', '通过', NULL, '123', '2026-01-23 00:00:00', 5, NULL);
INSERT INTO `charge` VALUES (10, 13, '98789', '078', 2, '2026-01-23 12:33:08', '待审核', NULL, NULL, NULL, 6, NULL);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_id` int NULL DEFAULT NULL COMMENT '物品',
  `user_id` int NULL DEFAULT NULL COMMENT '收藏人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (2, 8, 1, '2026-01-19 22:28:15');
INSERT INTO `collect` VALUES (5, 10, 1, '2026-01-19 22:38:41');
INSERT INTO `collect` VALUES (6, 6, 2, '2026-01-20 09:26:59');
INSERT INTO `collect` VALUES (7, 4, 2, '2026-01-20 09:26:59');
INSERT INTO `collect` VALUES (8, 13, 3, '2026-01-20 10:42:23');
INSERT INTO `collect` VALUES (9, 7, 3, '2026-01-20 10:42:26');
INSERT INTO `collect` VALUES (10, 14, 5, '2026-01-20 12:07:14');
INSERT INTO `collect` VALUES (12, 15, 1, '2026-01-20 23:49:03');
INSERT INTO `collect` VALUES (13, 13, 1, '2026-01-22 10:09:19');
INSERT INTO `collect` VALUES (15, 9, 2, '2026-01-23 12:25:24');
INSERT INTO `collect` VALUES (16, 8, 2, '2026-01-23 12:27:45');
INSERT INTO `collect` VALUES (17, 13, 2, '2026-01-23 12:33:28');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `article_id` int NULL DEFAULT NULL COMMENT '帖子ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评论信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 1, 3, '对的', '2026-01-20 08:58:21');
INSERT INTO `comments` VALUES (2, 1, 2, '123', '2026-01-20 09:24:37');
INSERT INTO `comments` VALUES (3, 5, 4, '有用！', '2026-01-20 10:53:10');
INSERT INTO `comments` VALUES (4, 5, 4, '哈哈哈', '2026-01-20 10:55:04');
INSERT INTO `comments` VALUES (5, 5, 1, '收到', '2026-01-20 11:00:38');
INSERT INTO `comments` VALUES (6, 3, 4, '牛', '2026-01-20 12:10:26');
INSERT INTO `comments` VALUES (8, 1, 3, 'asfasf', '2026-01-21 00:01:42');
INSERT INTO `comments` VALUES (9, 2, 5, '好看', '2026-01-21 22:08:07');
INSERT INTO `comments` VALUES (10, 5, 3, '123', '2026-01-22 10:08:22');
INSERT INTO `comments` VALUES (11, 2, 5, '234', '2026-01-23 12:25:17');
INSERT INTO `comments` VALUES (12, 2, 4, '354', '2026-01-23 12:27:57');
INSERT INTO `comments` VALUES (13, 2, 5, '234', '2026-01-23 12:33:46');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `requirement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '交换条件',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '上架状态',
  `user_id` int NULL DEFAULT NULL COMMENT '上传人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上传时间',
  `check_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核理由',
  `category_id` int NULL DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '物品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (4, '书籍《1984》', 'http://localhost:9090/files/download/1768542266394-1984.jpg', '好看', '123', 1, 1, '2026-01-16 13:44:34', '通过', '', 1);
INSERT INTO `items` VALUES (5, '球鞋Nike Zoom Kobe 4 CHBL', 'http://localhost:9090/files/download/1768542298563-Nike Zoom Kobe 4 CHBL.jpg', '全新未拆封', 'no', 0, 1, '2026-01-16 13:45:18', '通过', '', 8);
INSERT INTO `items` VALUES (6, '书籍《朝花夕拾》', 'http://localhost:9090/files/download/1768542336301-zhxs.jpg', '经典名著', '123', 1, 1, '2026-01-16 13:45:50', '通过', '', 1);
INSERT INTO `items` VALUES (7, 'Dior新品808绝美锦鲤红！！', 'http://localhost:9090/files/download/1768542389679-Dior新品808绝美锦鲤红！！_1_子玲大大_来自小红书网页版.jpg', '太美丽了', '123', 1, 1, '2026-01-16 13:46:54', '通过', '', 11);
INSERT INTO `items` VALUES (8, '隔离霜', 'http://localhost:9090/files/download/1768542441981-隔离霜.png', '好用', 'dior口红', 1, 1, '2026-01-16 13:47:43', '通过', '', 11);
INSERT INTO `items` VALUES (9, '《百年孤独》', 'http://localhost:9090/files/download/1768542692962-百年孤独.jpg', '名著', '1233123', 1, 1, '2026-01-16 13:51:38', '通过', '', 1);
INSERT INTO `items` VALUES (10, '飓风3游戏耳机', 'http://localhost:9090/files/download/1768806487889-屏幕截图 2026-01-19 150746.png', '脚步清楚，听声辩位强\n简洁无太多功能 （增强版支持3模）', '雷蛇耳机', 1, 2, '2026-01-19 15:08:58', '通过', '', 4);
INSERT INTO `items` VALUES (11, '鼠标ATK F1V2', 'http://localhost:9090/files/download/1768808113853-屏幕截图 2026-01-19 153500.png', '模具真的是相当舒服，17.5的手趴握，手掌填充饱满。没有极致的电竞需求，所以买了最低配。虽然重量是系列里最重的，有五十几克的，从G304转过来的还是觉得轻巧灵活。\n	\n微动虽然不错，但是用习惯了凯隆紫金微动，长期“肌无力”的触感，还是会觉得F1上面这个微动偏硬，后续换个紫金微动应该就完美了', 'gpw鼠标', 1, 2, '2026-01-19 15:10:47', '通过', '有品', 4);
INSERT INTO `items` VALUES (12, '《平凡的世界》', 'http://localhost:9090/files/download/1768874854417-屏幕截图 2026-01-20 100722.png', '《平凡的世界》\n作者：路遥\n接近一个月的时间这套书终于读完了。最后一页字看完之后很久才合上那本书，这里的每一个人的人生都值得我们深思，每一个人面对生活遭遇的那种向上的力量都值得我们学习。\n读第一部的时候在想怎么会有这么悲惨的人生。13岁辍学在家和父亲一起供养弟弟妹妹的少安；只能躲在角落里吃黑面馍馍的少平。悲惨的生活让他们在面对喜欢的人的时候手足无措，只能逃避。幸运的是少安遇到了秀莲。\n第二部渐渐的', '其他名著', 0, 2, '2026-01-20 10:07:57', '待审核', NULL, 1);
INSERT INTO `items` VALUES (13, '没吃完的感康', 'http://localhost:9090/files/download/1768875024815-屏幕截图 2026-01-20 101016.png', '快过期了', '无', 1, 6, '2026-01-20 10:11:06', '通过', NULL, 10);
INSERT INTO `items` VALUES (14, '羽绒服', 'http://localhost:9090/files/download/1768876866914-屏幕截图 2026-01-20 104047.png', '很保暖\n九成新', '冲锋衣', 0, 3, '2026-01-20 10:41:34', '通过', NULL, 6);
INSERT INTO `items` VALUES (15, '世界上最好用的涂改带', 'http://localhost:9090/files/download/1768877040183-屏幕截图 2026-01-20 104326.png', '乐普升是世界上最好用的改正带！！！别看它朴实无华，好用爆了，从初中到现在，依旧稳坐我的No.1', '钢笔', 0, 5, '2026-01-20 10:44:41', '通过', NULL, 3);
INSERT INTO `items` VALUES (16, '篮球', 'http://localhost:9090/files/download/1768923059687-屏幕截图 2025-01-26 171301.png', '123', '123', 0, 1, '2026-01-20 23:31:04', '通过', NULL, 9);

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `article_id` int NULL DEFAULT NULL COMMENT '帖子ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '点赞信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (1, 1, 1);
INSERT INTO `likes` VALUES (4, 1, 3);
INSERT INTO `likes` VALUES (5, 2, 2);
INSERT INTO `likes` VALUES (6, 3, 1);
INSERT INTO `likes` VALUES (7, 2, 4);
INSERT INTO `likes` VALUES (8, 5, 3);
INSERT INTO `likes` VALUES (9, 2, 5);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (2, '大家好！', '祝大家天天开心\n祝大家天天开心', '2026-01-16 10:42:22');
INSERT INTO `notice` VALUES (3, '第一届图书交换会', '第一届图书交换会将于9月6日在操场举行', '2026-01-16 10:55:11');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系方式',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '普通用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '123', '小李', 'http://localhost:9090/files/download/1768872254806-屏幕截图 2026-01-20 092344.png', '普通用户', '12323232323', '123@123.com');
INSERT INTO `user` VALUES (2, '102', '123', '魔法猫咪', 'http://localhost:9090/files/download/1768494684909-1768464670166-屏幕截图 2026-01-15 161100.png', '普通用户', '12345678911', '102@102.com');
INSERT INTO `user` VALUES (3, '222', '123', '狗子', 'http://localhost:9090/files/download/1768525788339-fe5e1b4390084d61058f68c6be94fe38.gif', '普通用户', '19483758493', '222@222.com');
INSERT INTO `user` VALUES (4, '666', '123', '走路鸭', 'http://localhost:9090/files/download/1768526075146-77ddb17556c605c4a04cb8b900992924.gif', '普通用户', '17564538273', 'yaya@yaya.com');
INSERT INTO `user` VALUES (5, '250', '123', '好好学习', 'http://localhost:9090/files/download/1768526139665-2a5c3bcda07711e12866bb2f30a3a222.jpg', '普通用户', '11111111111', '111@dingzhen.com');
INSERT INTO `user` VALUES (6, '333', '123', '玛德琳', 'http://localhost:9090/files/download/1768526204972-d2a24cce915098a5c92fbe52b45ef81d.jpg', '普通用户', '12345363636', '111@madelin.com');
INSERT INTO `user` VALUES (7, '232', '123', '232', 'http://localhost:9090/files/download/1768528604746-e37f355feaaabf5cb08760e95755200d.gif', '普通用户', '99999', '232@yesu.com');

SET FOREIGN_KEY_CHECKS = 1;
