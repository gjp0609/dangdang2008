-- 用户表
CREATE TABLE T_DANGDANG_USER (
  ID          INTEGER PRIMARY KEY,
  EMAIL       VARCHAR2(30),
  NICKNAME    VARCHAR2(20),
  PASSWORD    VARCHAR2(32),
  SALT        VARCHAR2(10),
  STATUS      VARCHAR2(1),
  CREATE_TIME TIMESTAMP
);

CREATE SEQUENCE T_DANGDANG_USER_SEQ START WITH 10010 INCREMENT BY 1;

-- 分类表
CREATE TABLE T_DANGDANG_CATEGORY (
  ID        INTEGER PRIMARY KEY,
  NAME      VARCHAR2(30),
  PARENT_ID INTEGER REFERENCES T_DANGDANG_CATEGORY (ID),
  COUNT     INTEGER
);


INSERT INTO T_DANGDANG_CATEGORY VALUES (10, '小说', NULL, 6);
INSERT INTO T_DANGDANG_CATEGORY VALUES (20, '科技', NULL, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (30, '生活', NULL, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (60, '青春文学', 10, 6);
INSERT INTO T_DANGDANG_CATEGORY VALUES (100, '中国当代小说', 10, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (110, '外国小说', 10, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (120, '悬疑', 10, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (130, '科幻', 10, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (40, '科普', 20, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (50, '计算机', 20, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (140, '医学', 20, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (150, '工业', 20, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (160, '科普', 20, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (70, '家教', 30, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (80, '运动', 30, 0);
INSERT INTO T_DANGDANG_CATEGORY VALUES (90, '美工', 30, 0);

DELETE FROM T_DANGDANG_CATEGORY;

-- 商品表
CREATE TABLE T_DANGDANG_PRODUCT (
  ID             INTEGER PRIMARY KEY,
  TITLE          VARCHAR2(100),
  REAL_PRICE     INTEGER,
  PRICE          INTEGER,
  SERIES         VARCHAR2(100),
  AUTHOR         VARCHAR2(20),
  COUNT          INTEGER, -- 销售量
  PUBLISHER      VARCHAR2(50),
  PUBLISH_TIME   DATE,
  PUBLISH_EDTION INTEGER,
  PRINT_TIME     DATE,
  PRINT_EDTION   INTEGER,
  ISBN           VARCHAR2(20),
  WORD_COUNT     INTEGER,
  PAGE_COUNT     INTEGER,
  BOOK_SIZE      INTEGER,
  PAPER          VARCHAR2(20),
  PACK           VARCHAR2(50),
  IMG_SRC        VARCHAR2(500),
  CATEGORY_ID    INTEGER REFERENCES T_DANGDANG_CATEGORY (ID),
  STAR           INTEGER,
  RECOMMEND      VARCHAR2(500),
  DETAILS        VARCHAR2(3000),
  AUTHOR_DETAILS VARCHAR2(3000),
  CATALOGUE      VARCHAR2(1000),
  COMMEND        VARCHAR2(1000),
  DIGEST         VARCHAR2(1000)
);

DROP TABLE T_DANGDANG_PRODUCT;


INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族I', 49, 29, '龙族', '江南', 568, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/1.png', 60, 9.8,
   '他以为他将这样度过一生，他以为他始终只是个衰小孩。但是，一封来自卡塞尔学院的录取通知书改变了他的一生。',
   '在热血与神秘的呼唤下，在爱与梦想的抉择下，他毅然选择了未知。',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '◎序章　白帝城 BaiDiCheng',
   '由小城市走向大洋彼岸，平凡普通的生活突然变得精彩传奇，蔫小孩受到腰细腿长的御姐召唤，变成了日益成长的屠龙勇士。',
   '1《龙族 · 火之晨曦》 第一部分 楔子白帝城');

INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族II', 63, 53, '龙族', '江南', 169, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/2.png', 60, 9.8,
   '狂舞的长刀，爆裂的流星，无人的高速公路，废柴父亲化身威风的英雄，以命相搏的激战，谁胜？谁负？',
   '路明非和他的伙伴们纷纷潜入北京地铁，开始了新一轮的屠龙历程。',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '序幕 雨落狂流之暗 第一幕 生日蛋糕就是青春的墓碑',
   '相比较《龙族 I》，《龙族 II》在故事技巧上更为成熟。一部青春幻想热血向的小说，却有着非常快的故事节奏与情节密度。',
   '楚子航站在窗前发呆。　　雨噼里啪啦打在窗上，操场上白茫茫一片。');
INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族III 上', 45, 36, '龙族', '江南', 945, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/3.1.png', 60, 9.8,
   '世界上有一种生命，它的每一次死亡，都是为了归来。',
   '谁也不知道，在人类主宰的这个世界里，有一种叫做龙族的存在，同时也有一种神秘的混血种存在，混血种天生的使命就是——屠龙。',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '前传 冰海王座 第一章 钦差大臣',
   '对于一个画漫画的人来说，《龙族》是一部让我很容易看进去的小说。',
   '它又来了，总在月圆之夜。　　雷娜塔趴在禁闭室的铁门上往外张望，瑟瑟发抖，不是因为惊恐，而是满怀期待。');
INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族III 中', 45, 27, '龙族', '江南', 234, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/3.2.png', 60, 9.8,
   '被遗忘的历史，被误读的神话，葬礼与重生…… 皇血圣骸之战，重燃！',
   '日本海沟深处发现龙类遗迹，卡塞尔王牌专员组恺撒、楚子航、路明非在身深潜过程中遭遇龙类袭击。',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '第一章 风与潮之夜 第二章 浩劫的轮回',
   '路明非，在雨夜中奔跑的男孩，内心里的那团火迎着雨在燃烧。我多么希望我就是他，在骄傲中奔跑，在平静时行走，跨越的不仅仅是龙族的世界，跨越的是内心的自我。',
   '高崖之巅矗立着黑色的高墙，落樱从高墙里飞出，飘向黑色的大海。　　今夜相模湾上风平浪静。');
INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族III 下', 39, 38, '龙族', '江南', 632, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/3.3.png', 60, 9.8,
   '我们都是小怪兽，都将被正义的奥特曼，杀死！',
   '逆命者，将被灼热的矛，贯穿在地狱的最深处！',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '第一章 源家次子  第二章 东京爱情故事',
   '远古的神秘降临时尚的现代世界，古老的魔力与先进科技交相辉映，构成了令人惊叹的《龙族》，像初升的朝阳，那么古老，又那么崭新。',
   '他们坐在矿井的屋檐下，绘梨衣不停地写问题，路明非一条条回答。这个女孩似乎是攒了一肚子的问题，这下子全都问了出来。');
INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族IV', 52, 49, '龙族', '江南', 213, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/4.png', 60, 9.8,
   '楚子航真的存在过吗？奥丁之枪为何直指红发巫女？',
   '圣诞夜，楚子航在北冰洋的破冰船上执行任务，误入了开启神秘之门的 “死亡之岛”。',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '楔子 通往世界尽头的航路 第一章 狂欢夜之舞',
   '热销千万的青春热血幻想小说，十年一遇的经典，没有之一！',
   '楔 子 通往世界尽头的航路 A sea way to the end of the world');

DELETE FROM T_DANGDANG_PRODUCT;


CREATE SEQUENCE T_DANGDANG_PRODUCT_SEQ START WITH 10010000 INCREMENT BY 1;

INSERT INTO T_DANGDANG_USER
VALUES (T_DANGDANG_USER_SEQ.nextval, 'gjp0609@qq.com', 'Rainbow', '123456', 'none', 'Y', sysdate);
INSERT INTO T_DANGDANG_USER
VALUES (T_DANGDANG_USER_SEQ.nextval, 'gjp0609@163.com', 'Rainbow', '123456', 'none', 'Y', sysdate);
INSERT INTO T_DANGDANG_USER
VALUES (T_DANGDANG_USER_SEQ.nextval, 'gjp0609@gmial.com', 'Rainbow', '123456', 'none', 'Y', sysdate);


SELECT *
FROM T_DANGDANG_USER;

SELECT
  C.ID,
  C.NAME,
  P.ID   parentId,
  P.NAME parentName
FROM T_DANGDANG_CATEGORY C LEFT JOIN T_DANGDANG_CATEGORY P ON C.PARENT_ID = P.ID;

SELECT *
FROM (
  SELECT
    P.ID,
    TITLE,
    REAL_PRICE     realPrice,
    PRICE,
    SERIES,
    AUTHOR,
    COUNT,
    PUBLISHER,
    PUBLISH_TIME   publishTime,
    PUBLISH_EDTION publishEdtion,
    PRINT_TIME     printTime,
    PRINT_EDTION   printEdtion,
    ISBN,
    WORD_COUNT     wordCount,
    PAGE_COUNT     pageCount,
    BOOK_SIZE      bookSize,
    PAPER,
    PACK,
    IMG_SRC        imgSrc,
    --     CATEGORY_ID    categoryId,
    STAR,
    RECOMMEND,
    DETAILS,
    AUTHOR_DETAILS authorDetails,
    CATALOGUE,
    COMMEND,
    DIGEST,
    C.ID           categoryId,
    C.NAME         categoryName,
    ROWNUM         rn
  FROM T_DANGDANG_PRODUCT P LEFT JOIN T_DANGDANG_CATEGORY C ON P.CATEGORY_ID = C.ID);

SELECT *
FROM T_DANGDANG_PRODUCT;


SELECT *
FROM (
  SELECT
    EE.*,
    ROWNUM rn2
  FROM (
         SELECT
           P.ID,
           TITLE,
           REAL_PRICE     realPrice,
           PRICE,
           SERIES,
           AUTHOR,
           P.COUNT,
           PUBLISHER,
           PUBLISH_TIME   publishTime,
           PUBLISH_EDTION publishEdtion,
           PRINT_TIME     printTime,
           PRINT_EDTION   printEdtion,
           ISBN,
           WORD_COUNT     wordCount,
           PAGE_COUNT     pageCount,
           BOOK_SIZE      bookSize,
           PAPER,
           PACK,
           IMG_SRC        imgSrc,
           CATEGORY_ID    categoryId,
           STAR,
           RECOMMEND,
           DETAILS,
           AUTHOR_DETAILS authorDetails,
           CATALOGUE,
           COMMEND,
           DIGEST,
           -- C.ID categoryId,
           C.NAME         castegoryName,
           C.COUNT        categoryCount,
           ROWNUM         rn
         FROM T_DANGDANG_PRODUCT P LEFT JOIN T_DANGDANG_CATEGORY C ON P.CATEGORY_ID = C.ID
       ) EE
)