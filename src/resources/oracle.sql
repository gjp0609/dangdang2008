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
  PARENT_ID INTEGER REFERENCES T_DANGDANG_CATEGORY (ID)
);

INSERT INTO T_DANGDANG_CATEGORY VALUES (10, '小说', NULL);
INSERT INTO T_DANGDANG_CATEGORY VALUES (20, '科技', NULL);
INSERT INTO T_DANGDANG_CATEGORY VALUES (30, '生活', NULL);
INSERT INTO T_DANGDANG_CATEGORY VALUES (60, '青春文学', 10);
INSERT INTO T_DANGDANG_CATEGORY VALUES (100, '中国当代小说', 10);
INSERT INTO T_DANGDANG_CATEGORY VALUES (110, '外国小说', 10);
INSERT INTO T_DANGDANG_CATEGORY VALUES (120, '悬疑', 10);
INSERT INTO T_DANGDANG_CATEGORY VALUES (130, '科幻', 10);
INSERT INTO T_DANGDANG_CATEGORY VALUES (40, '科普', 20);
INSERT INTO T_DANGDANG_CATEGORY VALUES (50, '计算机', 20);
INSERT INTO T_DANGDANG_CATEGORY VALUES (140, '医学', 20);
INSERT INTO T_DANGDANG_CATEGORY VALUES (150, '工业', 20);
INSERT INTO T_DANGDANG_CATEGORY VALUES (160, '科普', 20);
INSERT INTO T_DANGDANG_CATEGORY VALUES (70, '家教', 30);
INSERT INTO T_DANGDANG_CATEGORY VALUES (80, '运动', 30);
INSERT INTO T_DANGDANG_CATEGORY VALUES (90, '美工', 30);

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
   '楚子航真的存在过吗？奥丁之枪为何直指红发巫女？',
   '圣诞夜，楚子航在北冰洋的破冰船上执行任务，误入了开启神秘之门的 “死亡之岛”，',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '楔子 通往世界尽头的航路 第一章 狂欢夜之舞',
   '热销千万的青春热血幻想小说，十年一遇的经典，没有之一！', '楔 子 通往世界尽头的航路 A sea way to the end of the world');

INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族II', 63, 53, '龙族', '江南', 169, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/2.png', 60, 9.8,
   '楚子航真的存在过吗？奥丁之枪为何直指红发巫女？',
   '圣诞夜，楚子航在北冰洋的破冰船上执行任务，误入了开启神秘之门的 “死亡之岛”，',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '楔子 通往世界尽头的航路 第一章 狂欢夜之舞',
   '热销千万的青春热血幻想小说，十年一遇的经典，没有之一！', '楔 子 通往世界尽头的航路 A sea way to the end of the world');
INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族III 上', 45, 36, '龙族', '江南', 945, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/3.1.png', 60, 9.8,
   '楚子航真的存在过吗？奥丁之枪为何直指红发巫女？',
   '圣诞夜，楚子航在北冰洋的破冰船上执行任务，误入了开启神秘之门的 “死亡之岛”，',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '楔子 通往世界尽头的航路 第一章 狂欢夜之舞',
   '热销千万的青春热血幻想小说，十年一遇的经典，没有之一！', '楔 子 通往世界尽头的航路 A sea way to the end of the world');
INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族III 中', 45, 27, '龙族', '江南', 234, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/3.2.png', 60, 9.8,
   '楚子航真的存在过吗？奥丁之枪为何直指红发巫女？',
   '圣诞夜，楚子航在北冰洋的破冰船上执行任务，误入了开启神秘之门的 “死亡之岛”，',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '楔子 通往世界尽头的航路 第一章 狂欢夜之舞',
   '热销千万的青春热血幻想小说，十年一遇的经典，没有之一！', '楔 子 通往世界尽头的航路 A sea way to the end of the world');
INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族III 下', 39, 38, '龙族', '江南', 632, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/3.3.png', 60, 9.8,
   '楚子航真的存在过吗？奥丁之枪为何直指红发巫女？',
   '圣诞夜，楚子航在北冰洋的破冰船上执行任务，误入了开启神秘之门的 “死亡之岛”，',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '楔子 通往世界尽头的航路 第一章 狂欢夜之舞',
   '热销千万的青春热血幻想小说，十年一遇的经典，没有之一！', '楔 子 通往世界尽头的航路 A sea way to the end of the world');
INSERT INTO T_DANGDANG_PRODUCT VALUES
  (T_DANGDANG_PRODUCT_SEQ.nextval,
    '龙族IV', 52, 49, '龙族', '江南', 213, '知音漫客', sysdate, 1, sysdate,
    2, '435345223', 20, 300, 8, '胶版纸', '精装', 'productImages/4.png', 60, 9.8,
   '楚子航真的存在过吗？奥丁之枪为何直指红发巫女？',
   '圣诞夜，楚子航在北冰洋的破冰船上执行任务，误入了开启神秘之门的 “死亡之岛”，',
   '江南，男，巨蟹座，现居北京，中国著名青春小说作家。',
   '楔子 通往世界尽头的航路 第一章 狂欢夜之舞',
   '热销千万的青春热血幻想小说，十年一遇的经典，没有之一！', '楔 子 通往世界尽头的航路 A sea way to the end of the world');

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

SELECT * FROM T_DANGDANG_PRODUCT;



SELECT *
FROM (
  SELECT EE.*, ROWNUM rn2 FROM (
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
      ROWNUM         rn
    FROM T_DANGDANG_PRODUCT P LEFT JOIN T_DANGDANG_CATEGORY C ON P.CATEGORY_ID = C.ID
) EE
)