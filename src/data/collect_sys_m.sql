/*
 Navicat Premium Data Transfer

 Source Server         : 本地Mysql
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : collect_sys_m

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 18/07/2018 18:28:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `keywords` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `keyname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型（属于那个板块）',
  `createtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `edittime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '编辑时间',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clickcount` int(8) UNSIGNED NULL DEFAULT 0 COMMENT '点击次数',
  `isurl` bit(1) NULL DEFAULT NULL,
  `src` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank` int(8) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES (29, '成都暴雨预警仍未解除 18日天气转好阳光回归', '成都 洪水', '成都2018年大雨不断', '\n\n                                15日上午10点40分，成都市气象台发布了暴雨橙色预警信号，正当市民担心大雨再次造成路面积水时，雨水在中午时分却戛然而止，阳光拨开云层露脸了，气温也略有回升。\n<p>　　不过暴雨的警报还未解除，15日下午4点，成都市气象台将7月15日07时00分发布的暴雨蓝色预警升级为黄色预警：受高原低值系统和偏南暖湿气流共同影响，预计15日20时到16日20时还将有明显的降雨天气过程，雨量大雨，部分地方暴雨，局部地方雨量可达100毫米以上，暴雨主要集中在我市的中西部地区，降雨时伴有雷电和短时阵性大风。</p>\n<p>　　同时，四川省气象台也于15日15时30分发布暴雨黄色预警：15日20时～16日20时，广元、绵阳、德阳、成都、雅安、眉山、乐山7市的部分地方及阿坝州漩映地区有暴雨（雨量60～90毫米），局部地方有大暴雨（雨量180～220毫米）。</p>\n<p>　　根据成都市气象台预计，16日白天成都阴云密布，大雨倾盆，中西部部分地方暴雨，个别地方甚至雨量将达大暴雨，气温22～27℃；16日晚上到17日白天降雨稍稍减弱，雨量中到大雨，西部局部地方暴雨，气温22～27℃；17日晚上到18日白天天空状况转好，太阳回归主场，雨水虽有，不过零零散散，气温22～32℃。（记者\n 逯望一）</p>', NULL, '新闻', '2018-07-16 17:30:20', '2018-07-16 17:30:20', '成都商报', NULL, NULL, 0, b'0', NULL, 0);
INSERT INTO `cms_article` VALUES (30, 'jQuery插件的几种写法', 'jQuery', 'jQuery插件的几种写法', '\n\n                                <p>之前在一篇求职的帖子上看过，前端面试的景点题目：jquery插件的几种写法。</p>\n<p>这是看到的一篇总结。比较到位。详尽且简单易懂。如果之前看过jquery的源码，应该特别好理解了。</p>\n\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n插件编写的目的是给已经有的一系列方法或函数做一个封装，以便在其他地方重复使用，方便后期维护。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span>一、jQuery插件开发方式</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n1、通过$.extend()来扩展jQuery</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n2、通过$.fn 向jQuery添加新的方法</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n3、通过$.widget()应用jQuery UI的部件工厂方式创建</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span>二、三种jQuery插件开发方式说明</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n1、$.extend()相对简单，一般很少能够独立开发复杂插件，仅仅是在jQuery命名空间或者理解成jQuery身上添加了一个静态方法而以。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n2、我们调用通过$.extend()添加的函数时直接通过$符号调用（$.myfunction()），而不需要选中DOM元素($(\'#example\').myfunction())。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n3、$.widget()是一种高级的开发模式，该模式开发出来的部件带有很多jQuery内建的特性，比如插件的状态信息自动保存，各种关于插件的常用方法等</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n4、$.fn则是一般插件开发用到的方式，可以利用jQuery强大的选择器带来的便利，以及将插件更好地运用于所选择的元素身上，使用的插件也大多是通过此种方式开发。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span>三、$.extend()扩展jQuery的实例</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<div style=\"color:rgb(70,70,70);font-size:14px;line-height:16px;background-color:rgb(253,253,252);\">\n<div>\n<div style=\"font-weight:bold;font-size:12px;line-height:normal;font-family:arial;text-indent:12px;\">\n&nbsp;</div>\n</div>\n<div>\n<div id=\"2487937147230699286\" style=\"border:1pt solid rgb(204,204,204);background:rgb(245,245,245);\">\n<pre><span><span style=\"color:rgb(0,0,0);\">\n$.extend(</span><span id=\"Highlighter_10_111_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n    sayHello: </span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">(name) </span><span id=\"Highlighter_41_109_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n        console.log(</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">Hello,</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,0);\">+</span><span style=\"color:rgb(0,0,0);\"> (name </span><span style=\"color:rgb(0,0,0);\">?</span><span style=\"color:rgb(0,0,0);\"> name : </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">aaa</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">) </span><span style=\"color:rgb(0,0,0);\">+</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">!</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">);\n    }</span></span><span style=\"color:rgb(0,0,0);\">\n}</span></span><span style=\"color:rgb(0,0,0);\">)\n$.sayHello(); </span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">Hello,aaa</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">$.sayHello(</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">bbb</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">); </span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">Hello,bbb</span><span style=\"color:rgb(0,128,0);\">\n</span></span></pre>\n</div>\n</div>\n</div>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n说明：上面代码中，通过$.extend()向jQuery添加了一个sayHello函数，然后通过$直接调用。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span>四、$.fn方式插件开发</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">1、定义</span></p>\n<div style=\"color:rgb(70,70,70);font-size:14px;line-height:16px;background-color:rgb(253,253,252);\">\n<div>\n<div id=\"5379426089840105907\" style=\"border:1pt solid rgb(204,204,204);background:rgb(245,245,245);\">\n<pre><span><span style=\"color:rgb(0,0,0);\">\n$.fn.pluginName </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> function() </span><span id=\"Highlighter_30_54_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">your code here</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">}</span></span><span style=\"color:rgb(0,0,0);\">\n</span></span></pre>\n</div>\n</div>\n</div>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">2、定义说明</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n基本上就是往$.fn上面添加一个方法，名字是我们的插件名称。然后我们的插件代码在这个方法里面展开。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">3、简单实例</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n将页面上所有链接颜色转成红色，则可以这样写这个插件</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<div style=\"color:rgb(70,70,70);font-size:14px;line-height:16px;background-color:rgb(253,253,252);\">\n<div>\n<div style=\"font-weight:bold;font-size:12px;line-height:normal;font-family:arial;text-indent:12px;\">\n&nbsp;</div>\n</div>\n<div>\n<div id=\"736868317292439663\" style=\"border:1pt solid rgb(204,204,204);background:rgb(245,245,245);\">\n<pre><span><span style=\"color:rgb(0,0,0);\">\n$.fn.myPlugin </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">() </span><span id=\"Highlighter_28_127_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">在这里面,this指的是用jQuery选中的元素</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">    </span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">example :$(\'a\'),则this=$(\'a\')</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">    </span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">.css(</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">color</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">, </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">red</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">);\n}</span></span><span style=\"color:rgb(0,0,0);\">\n</span></span></pre>\n</div>\n</div>\n</div>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">4、实例说明</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(1)、在插件名字定义的这个函数内部，this指代的是我们在调用该插件时，用jQuery选择器选中的元素，一般是一个jQuery类型的集合。在插件名字定义的这个函数内部，this指代的是我们在调用该插件时，用jQuery选择器选中的元素，一般是一个jQuery类型的集合。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(2)、如果通过调用jQuery的.each()方法处理集合中的每个元素时要注意的是，在each方法内部，this指带的是普通的DOM元素了，如果需要调用jQuery的方法那就需要用$来重新包装一下。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<div style=\"color:rgb(70,70,70);font-size:14px;line-height:16px;background-color:rgb(253,253,252);\">\n<div>&nbsp;</div>\n<div>\n<div id=\"50549955515517096492\" style=\"border:1pt solid rgb(204,204,204);background:rgb(245,245,245);\">\n<pre><span><span style=\"color:rgb(0,0,0);\">\n$.fn.myPlugin </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">() </span><span id=\"Highlighter_28_199_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">在这里面,this指的是用jQuery选中的元素</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">    </span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">.css(</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">color</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">, </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">red</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">);\n</span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">.each(</span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">() </span><span id=\"Highlighter_116_195_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">对每个元素进行操作</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">        $(</span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">).append(</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,0);\">+</span><span style=\"color:rgb(0,0,0);\"> $(</span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">).attr(</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">href</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">));\n    }</span></span><span style=\"color:rgb(0,0,0);\">))\n}</span></span><span style=\"color:rgb(0,0,0);\">\n</span></span></pre>\n</div>\n</div>\n</div>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">5、实例插件的使用</span></p>\n<div style=\"color:rgb(70,70,70);font-size:14px;line-height:16px;background-color:rgb(253,253,252);\">\n<div>\n<div style=\"font-weight:bold;font-size:12px;line-height:normal;font-family:arial;text-indent:12px;\">\n&nbsp;</div>\n</div>\n<div>\n<div id=\"27129935143000795453\" style=\"border:1pt solid rgb(204,204,204);background:rgb(245,245,245);\">\n<pre><span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">ul</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">li</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">a href</span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(128,0,0);\">#</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">aaa</span><span style=\"color:rgb(0,0,0);\">&lt;/</span><span style=\"color:rgb(0,0,0);\">a</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;/</span><span style=\"color:rgb(0,0,0);\">li</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">li</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">a href</span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(128,0,0);\">#</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">bbb</span><span style=\"color:rgb(0,0,0);\">&lt;/</span><span style=\"color:rgb(0,0,0);\">a</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;/</span><span style=\"color:rgb(0,0,0);\">li</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">li</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">a href</span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(128,0,0);\">#</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">ccc</span><span style=\"color:rgb(0,0,0);\">&lt;/</span><span style=\"color:rgb(0,0,0);\">a</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;/</span><span style=\"color:rgb(0,0,0);\">li</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;/</span><span style=\"color:rgb(0,0,0);\">ul</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">p</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">这是p标签不是a标签，我不会受影响</span><span style=\"color:rgb(0,0,0);\">&lt;/</span><span style=\"color:rgb(0,0,0);\">p</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">script src</span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(128,0,0);\">jquery-1.11.0.min.js</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(0,0,0);\">&gt;&lt;/</span><span style=\"color:rgb(0,0,0);\">script</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">script src</span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(128,0,0);\">jquery.myplugin.js</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(0,0,0);\">&gt;&lt;/</span><span style=\"color:rgb(0,0,0);\">script</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span><span style=\"color:rgb(0,0,0);\">&lt;</span><span style=\"color:rgb(0,0,0);\">script type</span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(128,0,0);\">text/javascript</span><span style=\"color:rgb(128,0,0);\">\"</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n    $(function()</span><span id=\"Highlighter_275_300_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n        $(</span><span style=\"color:rgb(128,0,0);\">\'</span><span style=\"color:rgb(128,0,0);\">a</span><span style=\"color:rgb(128,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">).myPlugin();\n    }</span></span><span style=\"color:rgb(0,0,0);\">)\n</span><span style=\"color:rgb(0,0,0);\">&lt;/</span><span style=\"color:rgb(0,0,0);\">script</span><span style=\"color:rgb(0,0,0);\">&gt;</span><span style=\"color:rgb(0,0,0);\">\n</span></span></pre>\n</div>\n</div>\n</div>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">6、让插件支持链式调用</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\njQuery一个时常优雅的特性是支持链式调用，选择好DOM元素后可以不断地调用其他方法。要让插件不打破这种链式调用，只需return一下即可。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<div style=\"color:rgb(70,70,70);font-size:14px;line-height:16px;background-color:rgb(253,253,252);\">\n<div>\n<div style=\"font-weight:bold;font-size:12px;line-height:normal;font-family:arial;text-indent:12px;\">\n&nbsp;</div>\n</div>\n<div>\n<div id=\"47251486690072406299\" style=\"border:1pt solid rgb(204,204,204);background:rgb(245,245,245);\">\n<pre><span><span style=\"color:rgb(0,0,0);\">\n$.fn.myPlugin </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">() </span><span id=\"Highlighter_28_206_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">在这里面,this指的是用jQuery选中的元素</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">    </span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">.css(</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">color</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">, </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">red</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">);\n</span><span style=\"color:rgb(0,0,255);\">return</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">.each(</span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">() </span><span id=\"Highlighter_123_202_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">对每个元素进行操作</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">        $(</span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">).append(</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,0);\">+</span><span style=\"color:rgb(0,0,0);\"> $(</span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">).attr(</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">href</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">));\n    }</span></span><span style=\"color:rgb(0,0,0);\">))\n}</span></span><span style=\"color:rgb(0,0,0);\">\n</span></span></pre>\n</div>\n</div>\n</div>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">7、让插件接收参数</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(1)、一个强劲的插件是可以让使用者随意定制的，这要求我们提供在编写插件时就要考虑得全面些，尽量提供合适的参数。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(2)、比如现在我们不想让链接只变成红色，我们让插件的使用者自己定义显示什么颜色，要做到这一点很方便，只需要使用者在调用的时候传入一个参数即可。同时我们在插件的代码里面接收。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(3)、为了灵活，使用者可以不传递参数，插件里面会给出参数的默认值。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(4)、在处理插件参数的接收上，通常使用jQuery的extend方法，当给extend方法传递一个以上的参数时，它会将所有参数对象合并到第一个里。同时，如果对象中有同名属性时，合并的时候后面的会覆盖前面的。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(5)、可以在插件里定义一个保存插件参数默认值的对象，同时将接收来的参数对象合并到默认对象上，最后就实现了用户指定了值的参数使用指定的值，未指定的参数使用插件默认值。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(6)、保护好默认参数：做法是将一个新的空对象做为$.extend的第一个参数，defaults和用户传递的参数对象紧随其后，这样做的好处是所有值被合并到这个空对象上，保护了插件里面的默认值。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(0,0,255);\">(7)、实例</span></p>\n<div style=\"color:rgb(70,70,70);font-size:14px;line-height:16px;background-color:rgb(253,253,252);\">\n<div>\n<div style=\"font-weight:bold;font-size:12px;line-height:normal;font-family:arial;text-indent:12px;\">\n&nbsp;</div>\n</div>\n<div>\n<div id=\"3077846793797099967\" style=\"border:1pt solid rgb(204,204,204);background:rgb(245,245,245);\">\n<pre><span><span style=\"color:rgb(0,0,0);\">\n$.fn.myPlugin </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">(options) </span><span id=\"Highlighter_35_266_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,0,255);\">var</span><span style=\"color:rgb(0,0,0);\"> defaults </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> </span><span id=\"Highlighter_56_114_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">color</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">: </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">red</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">,\n</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">fontSize</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">: </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">12px</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">\n    }</span></span><span style=\"color:rgb(0,0,0);\">;\n</span><span style=\"color:rgb(0,0,255);\">var</span><span style=\"color:rgb(0,0,0);\"> settings </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> $.extend({}, defaults, options);\n</span><span style=\"color:rgb(0,0,255);\">return</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">.css(</span><span id=\"Highlighter_184_262_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">color</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">: settings.color,\n</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">fontSize</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">: settings.fontSize\n    }</span></span><span style=\"color:rgb(0,0,0);\">);\n}</span></span><span style=\"color:rgb(0,0,0);\">\n</span></span></pre>\n</div>\n</div>\n</div>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">8、插件开发中的命名空间</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(1)、不仅仅是jQuery插件的开发，我们在写任何JS代码时都应该注意的一点是不要污染全局命名空间。因为随着你代码的增多，如果有意无意在全局范围内定义一些变量的话，最后很难维护，也容易跟别人写的代码有冲突。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(2)、比如你在代码中向全局window对象添加了一个变量status用于存放状态，同时页面中引用了另一个别人写的库，也向全局添加了这样一个同名变量，最后的结果肯定不是你想要的。所以不到万不得已，一般我们不会将变量定义成全局的。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n(3)、可以使用<span style=\"color:#FF0000;\">自调用匿名函数</span>包裹插件代码</p>\n<div style=\"color:rgb(70,70,70);font-size:14px;line-height:16px;background-color:rgb(253,253,252);\">\n<div>\n<div style=\"font-weight:bold;font-size:12px;line-height:normal;font-family:arial;text-indent:12px;\">\n&nbsp;</div>\n</div>\n<div>\n<div id=\"10960674695664685403\" style=\"border:1pt solid rgb(204,204,204);background:rgb(245,245,245);\">\n<pre><span><span style=\"color:rgb(0,0,0);\">\n(</span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">() </span><span id=\"Highlighter_13_302_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n $.fn.myPlugin </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">(options) </span><span id=\"Highlighter_50_300_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,0,255);\">var</span><span style=\"color:rgb(0,0,0);\"> defaults </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> </span><span id=\"Highlighter_71_129_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">color</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">: </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">red</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">,\n</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">fontSize</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">: </span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">12px</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">\n    }</span></span><span style=\"color:rgb(0,0,0);\">;\n</span><span style=\"color:rgb(0,0,255);\">var</span><span style=\"color:rgb(0,0,0);\"> settings </span><span style=\"color:rgb(0,0,0);\">=</span><span style=\"color:rgb(0,0,0);\"> $.extend(</span><span id=\"Highlighter_159_161_Open_Text\"><span style=\"color:rgb(0,0,0);\">{}</span></span><span style=\"color:rgb(0,0,0);\">,defaults, options);</span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">将一个空对象做为第一个参数</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">    </span><span style=\"color:rgb(0,0,255);\">return</span><span style=\"color:rgb(0,0,0);\"> </span><span style=\"color:rgb(0,0,255);\">this</span><span style=\"color:rgb(0,0,0);\">.css(</span><span id=\"Highlighter_217_295_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">color</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">: settings.color,\n</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">fontSize</span><span style=\"color:rgb(0,0,0);\">\'</span><span style=\"color:rgb(0,0,0);\">: settings.fontSize\n    }</span></span><span style=\"color:rgb(0,0,0);\">);\n }</span></span><span style=\"color:rgb(0,0,0);\">\n}</span></span><span style=\"color:rgb(0,0,0);\">)();\n</span></span></pre>\n</div>\n</div>\n</div>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">9、尽量在插件的最前面加上分号</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n这样可以避免我们将这段代码放到页面后，前面别人写的代码没有用分号结尾，这样，这个插件代码就会报错。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span style=\"color:rgb(178,34,34);\">10、可以将系统变量以变量形式传递到插件内部</span></p>\n<div style=\"color:rgb(70,70,70);font-size:14px;line-height:16px;background-color:rgb(253,253,252);\">\n<div>\n<div style=\"font-weight:bold;font-size:12px;line-height:normal;font-family:arial;text-indent:12px;\">\n&nbsp;</div>\n</div>\n<div>\n<div id=\"90638801778483676\" style=\"border:1pt solid rgb(204,204,204);background:rgb(245,245,245);\">\n<pre><span><span style=\"color:rgb(0,0,0);\">\n;(</span><span style=\"color:rgb(0,0,255);\">function</span><span style=\"color:rgb(0,0,0);\">($,window,document,undefined)</span><span id=\"Highlighter_40_67_Open_Text\"><span style=\"color:rgb(0,0,0);\">{\n</span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">我们的代码。。</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">    </span><span style=\"color:rgb(0,128,0);\">//</span><span style=\"color:rgb(0,128,0);\">...</span><span style=\"color:rgb(0,128,0);\">\n</span><span style=\"color:rgb(0,0,0);\">}</span></span><span style=\"color:rgb(0,0,0);\">)(jQuery,window,document);\n</span></span></pre>\n</div>\n</div>\n</div>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n&nbsp;</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n<span>五、将插件代码混淆与压缩的方法</span></p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n1、我们下载的插件里面，一般都会提供一个压缩的版本一般在文件名里带个\'min\'字样。也就是minified的意思，压缩浓缩后的版本。例如，并且平时我们使用的jQuery也是官网提供的压缩版本，jquery.min.js。</p>\n<p style=\"color:rgb(70,70,70);font-size:14px;line-height:24px;background-color:rgb(253,253,252);\">\n2、这里的压缩不是指代码进行功能上的压缩，而是通过将代码里面的变量名，方法函数名等等用更短的名称来替换，并且删除注释（如果有的话）删除代码间的空白及换行所得到的浓缩版本。同时由于代码里面的各种名称都已经被替代，别人无法阅读和分清其逻辑，也起到了混淆代码的作用。&nbsp;</p>\n', NULL, 'web 前段杂 ', '2018-07-17 12:30:26', '2018-07-17 12:30:26', '网摘', NULL, NULL, 0, b'0', NULL, 0);

-- ----------------------------
-- Table structure for cms_codes
-- ----------------------------
DROP TABLE IF EXISTS `cms_codes`;
CREATE TABLE `cms_codes`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID，自动增长',
  `typename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名描述',
  `addtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `edittime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '编辑时间',
  `addwho` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人',
  `editwho` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `version` int(6) NOT NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_codesdetail
-- ----------------------------
DROP TABLE IF EXISTS `cms_codesdetail`;
CREATE TABLE `cms_codesdetail`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID，自动增长',
  `typename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名',
  `codename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'CODE',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'CODE描述',
  `short_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短值',
  `long_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长值',
  `isactive` int(6) NOT NULL DEFAULT 1 COMMENT '是否激活，默认激活',
  `addtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `edittime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '编辑时间',
  `addwho` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人',
  `editwho` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `version` int(6) NOT NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` float(10, 1) NOT NULL COMMENT '商品定价',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `pic` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `createtime` datetime(0) NOT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, '台式机', 3000.0, '该电脑质量非常好！！！！', NULL, '2015-02-03 13:22:53');
INSERT INTO `items` VALUES (2, '笔记本', 6000.0, '笔记本性能好，质量好！！！！！', NULL, '2015-02-09 13:22:57');
INSERT INTO `items` VALUES (3, '背包', 200.0, '名牌背包，容量大质量好！！！！', NULL, '2015-02-06 13:23:02');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '订单id',
  `items_id` int(11) NOT NULL COMMENT '商品id',
  `items_num` int(11) NULL DEFAULT NULL COMMENT '商品购买数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orderdetail_1`(`orders_id`) USING BTREE,
  INDEX `FK_orderdetail_2`(`items_id`) USING BTREE,
  CONSTRAINT `FK_orderdetail_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_orderdetail_2` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (1, 3, 1, 1);
INSERT INTO `orderdetail` VALUES (2, 3, 2, 3);
INSERT INTO `orderdetail` VALUES (3, 4, 3, 4);
INSERT INTO `orderdetail` VALUES (4, 4, 2, 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '下单用户id',
  `number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `createtime` datetime(0) NOT NULL COMMENT '创建订单时间',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orders_1`(`user_id`) USING BTREE,
  CONSTRAINT `FK_orders_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (3, 1, '1000010', '2015-02-04 13:22:35', NULL);
INSERT INTO `orders` VALUES (4, 1, '1000011', '2015-02-03 13:22:41', NULL);
INSERT INTO `orders` VALUES (5, 10, '1000012', '2015-02-12 16:13:23', NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) NULL DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序号',
  `available` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  `iconclass` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'font_anwsome matched class',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '权限', '', '', NULL, 0, '0/', '0', '1', NULL);
INSERT INTO `sys_permission` VALUES (11, '商品管理', 'menu', '/item/list', NULL, 1, '0/1/', '1', '1', 'fa fa-shopping-cart');
INSERT INTO `sys_permission` VALUES (12, '商品新增', 'permission', '/item/add', 'item:create', 11, '0/1/11/', '1-1', '1', NULL);
INSERT INTO `sys_permission` VALUES (13, '商品修改', 'permission', '/item/edit', 'item:update', 11, '0/1/11/', '1-2', '1', NULL);
INSERT INTO `sys_permission` VALUES (14, '商品删除', 'permission', '/item/delete', 'item:delete', 11, '0/1/11/', '1-3', '1', NULL);
INSERT INTO `sys_permission` VALUES (15, '商品查询', 'permission', '/item/list', 'item:query', 11, '0/1/15/', '1-4', '1', NULL);
INSERT INTO `sys_permission` VALUES (21, '用户管理', 'menu', '/user/list', 'user:query', 1, '0/1/', '2', '1', 'fa fa-user-circle');
INSERT INTO `sys_permission` VALUES (22, '用户新增', 'permission', '/user/add', 'user:create', 21, '0/1/21/', '2-1', '1', NULL);
INSERT INTO `sys_permission` VALUES (23, '用户修改', 'permission', '/user/edit', 'user:update', 21, '0/1/21/', '2-2', '1', NULL);
INSERT INTO `sys_permission` VALUES (24, '用户删除', 'permission', '/user/delete', 'user:delete', 21, '0/1/21/', '2-3', '1', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `available` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '商品管理员', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '1');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sys_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '2', '11');
INSERT INTO `sys_role_permission` VALUES ('2', '2', '21');
INSERT INTO `sys_role_permission` VALUES ('3', '2', '15');
INSERT INTO `sys_role_permission` VALUES ('4', '2', '22');
INSERT INTO `sys_role_permission` VALUES ('5', '2', '13');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `usercode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `locked` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('lisi', 'lisi', '李四', 'bf07fd8bbc73b6f70b8319f2ebb87483', 'uiwueylm', '0');
INSERT INTO `sys_user` VALUES ('zhangsan', 'zhangsan', '张三', '48e1a118a99e59fb09254e42a0335bc8', 'eteokues', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sys_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sys_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', 'lisi', '1');
INSERT INTO `sys_user_role` VALUES ('2', 'zhangsan', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王五', NULL, '2', NULL);
INSERT INTO `user` VALUES (10, '张三', '2014-07-10', '1', '北京市');
INSERT INTO `user` VALUES (16, '张小明', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (22, '陈小明', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (24, '张三丰', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (25, '陈小明', NULL, '1', '河南郑州');
INSERT INTO `user` VALUES (26, '王五', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
