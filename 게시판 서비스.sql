#날짜 : 2022/10/18
#이름 : 구홍모
#내용 : 게시판 서비스 테이블 설계

#데이터베이스 생성
CREATE DATABASE `java1_kmarket1`;
CREATE USER 'java1_board'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `java1_board`.* TO 'java1_board'@'%';
FLUSH PRIVILEGES;
#회원 테이블 생성
create TABLE `board_user`(
	`uid`		VARCHAR(20) PRIMARY KEY,
	`pass`	VARCHAR(255) NOT NULL, #pass는 암호화로 데이터가 많기에  넉넉하게 해줘야한다.
	`name`	VARCHAR(20) NOT NULL,
	`nick`	VARCHAR(20) UNIQUE,
	`email`	VARCHAR(100) UNIQUE,
	`hp`		CHAR(13) UNIQUE,
	`grade`	TINYINT DEFAULT 2,
	`zip`		CHAR(5),
	`addr1`	VARCHAR(255),
	`addr2`	VARCHAR(255),
	`regip`	VARCHAR(100),
	`rdate`	DATETIME
);
#약관 테이블 생성
create TABLE `board_terms`(
	`terms`		TEXT,
	`privacy`	TEXT
);
create TABLE `ebook_cate1`(
	`c1`		TINYINT,
	`c1Name`	VARCHAR(20)
);
create TABLE `ebook_cate2`(
	`c1`		TINYINT,
	`c2`		TINYINT,
	`c2Name`	VARCHAR(20)
);
# 쿠폰 테이블
create TABLE `km_member_coupon`(
	`no`			INT PRIMARY KEY AUTO_INCREMENT,
	`uid`			VARCHAR(20)	NOT NULL,
	`name`		VARCHAR(20) NOT NULL,
	`discount`	TINYINT NOT NULL,
	`limit`		VARCHAR(100) NOT NULL,
	`exDate`		DATETIME NOT NULL,
	`state`		TINYINT NOT NULL,
	FOREIGN KEY (`uid`) REFERENCES `km_member`(`uid`)
);
# 배너 테이블
create TABLE `km_banner`(
	`no`			INT PRIMARY KEY AUTO_INCREMENT,
	`bName`		VARCHAR(20) NOT NULL,
	`bSize`		VARCHAR(20) NOT NULL,
	`bColor`		VARCHAR(20) NOT NULL,
	`bLink`		VARCHAR(20) NOT NULL,
	`bLocate`	VARCHAR(200) NOT NULL,
	`beginDate`	DATE NOT NULL,
	`endDate`	DATE NOT NULL,
	`beginTime`	TIME NOT NULL,
	`endTime`	TIME NOT NULL
);
INSERT INTO `km_banner` VALUES (1,'테스트','180X180','#f0f0f0','href','locate','2023-05-03','2023-05-04','11:00','12:00');
INSERT INTO `ebook_cate1` VALUES (10,'유아/어린이');
INSERT INTO `ebook_cate1` VALUES (11,'컴퓨터/ IT');
INSERT INTO `ebook_cate1` VALUES (12,'기타');
INSERT INTO `ebook_cate1` VALUES (13,'인문/교양');
INSERT INTO `ebook_cate1` VALUES (14,'철학/종교');
INSERT INTO `ebook_cate1` VALUES (15,'사회');
INSERT INTO `ebook_cate1` VALUES (16,'자연/과학');

INSERT INTO `ebook_cate2` VALUES (10,10,'유아');
INSERT INTO `ebook_cate2` VALUES (10,11,'어린이');
INSERT INTO `ebook_cate2` VALUES (10,12,'외국어');
INSERT INTO `ebook_cate2` VALUES (11,10,'컴퓨터/IT');
INSERT INTO `ebook_cate2` VALUES (12,10,'기타');
INSERT INTO `ebook_cate2` VALUES (13,10,'교양/상식');
INSERT INTO `ebook_cate2` VALUES (13,11,'독서/독서법');
INSERT INTO `ebook_cate2` VALUES (13,12,'심리');
INSERT INTO `ebook_cate2` VALUES (13,13,'인문/사회');
INSERT INTO `ebook_cate2` VALUES (13,14,'인문학');
INSERT INTO `ebook_cate2` VALUES (14,10,'철학/종교');
INSERT INTO `ebook_cate2` VALUES (15,10,'경제/경영');
INSERT INTO `ebook_cate2` VALUES (15,11,'마케팅');
INSERT INTO `ebook_cate2` VALUES (15,12,'법');
INSERT INTO `ebook_cate2` VALUES (15,13,'사회문제/사회학');
INSERT INTO `ebook_cate2` VALUES (15,14,'언론/신문/방송');
INSERT INTO `ebook_cate2` VALUES (15,15,'자기계발/학습');
INSERT INTO `ebook_cate2` VALUES (15,16,'제테크/투자');
INSERT INTO `ebook_cate2` VALUES (15,17,'정치/외교');
INSERT INTO `ebook_cate2` VALUES (15,18,'창업/취업');
INSERT INTO `ebook_cate2` VALUES (15,19,'행정/정책');
INSERT INTO `ebook_cate2` VALUES (16,10,'공학');
INSERT INTO `ebook_cate2` VALUES (16,11,'기계');
INSERT INTO `ebook_cate2` VALUES (16,12,'의학/한의학');
INSERT INTO `ebook_cate2` VALUES (16,13,'자연/기술과학');
#게시물 테이블 생성
create TABLE `ebook_article`(
	`no`			INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT DEFAULT 0,
	`comment`	INT DEFAULT 0,
	`cate`		VARCHAR(20) DEFAULT 'free',
	`title`		VARCHAR(255), #댓글인 경우 제목이 없다.
	`content`	TEXT NOT NULL,
	`file`		TINYINT DEFAULT 0, #file 첨부 여부
	`hit`			INT DEFAULT 0,
	`uid`			VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(100) NOT NULL ,
	`rdate`		DATETIME NOT NULL
);
#파일 테이블 생성 : 파일 경로가 저장
CREATE TABLE `ebook_file`(
	`fno`			INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		VARCHAR(20),
	`newName`	VARCHAR(255),
	`oriName`	VARCHAR(255),
	`download`	INT DEFAULT 0, 
	`rdate`		DATETIME
);

select COUNT(*) from `ebook` where `cate1`=10 and `cate2`=10; 

select * from `ebook` order by `rdate` DESC LIMIT 10;
select * from `mylib` where `state`=1 and `uid`='test' order BY `no` limit 10;
	insert into `mylib` set 
						`uid`='test', 
						`bookId`='ISBN-978-10-10-3', 
						`state`=1, 
						`loanDate`=now(),
						`returnDate`= date_add(now(), INTERVAL 14 DAY);
		SELECT a.*, b.title,b.author,b.publisher,b.belong,b.applier,b.thumb FROM `mylib` AS a 
													JOIN `ebook` AS b
													ON a.`bookId`=b.`bookId`
													where a.uid='test'; 
													
																	
select a.*,b.c1Name,c.c2Name from `ebook` as a
						JOIN `ebook_cate1` AS b 
						ON a.`cate1`=b.`c1`
						JOIN `ebook_cate2` AS c
						ON a.`cate1`=c.`c1` AND  a.`cate2`=c.`c2`
						where `bookId`='ISBN-978-10-10-1';

SELECT a.*, b.`name` FROM `ebook_article` AS a 
													JOIN `member` AS b 
													ON a.uid = b.uid 
													where `parent`=0 
													order by `no` desc 
													LIMIT 0,10;

SELECT a.*, b.`name` FROM `ebook_article` AS a 
													JOIN `member` AS b 
													ON a.uid = b.uid 
													where `cate`='notice' 
													order by `no` desc 
													limit 3;

#비밀번호 암호화(해쉬함수)
SELECT SHA('1234');
SELECT SHA2('1234',256);
SELECT a.*,b.`nick` FROM `board_article` AS a JOIN `board_user` AS b ON a.uid = b.uid ORDER BY `no` DESC
LIMIT 0, 10;

SELECT COUNT(`no`) FROM `board_article`;

INSERT INTO `board_article` (`title`,`content`,`uid`,`regip`,`rdate`);

ALTER TABLE `km_product_cate1` DROP PRIMARY KEY keep INDEX;

SELECT `title`,`content`,`uid`,`regip`,`rdate` FROM `board_article`;

SELECT a.`name`, b.*, c.`prodName` FROM `customer` AS a
JOIN `order` AS b
ON a.cusId = b.orderId
JOIN `product` AS c
ON b.orderProduct = c.prodNo;

SELECT a.*, b.fno, b.oriName, b.download 
FROM `board_article` AS a
left JOIN `board_file` AS b
ON a.`no`=b.`parent`
WHERE `no`=2;

update `board_article` set `hit` = `hit` + 1 where `no`=1;

SELECT a.*,b.`nick` from `board_article` AS a
JOIN `board_user` AS b USING (`uid`)
where `parent`=31 order by `no` ASC;

SELECT a.*,b.nick FROM `board_article` AS a
JOIN `board_user` AS b USING(`uid`)
WHERE `parent`!=0 ORDER BY `no` DESC LIMIT 1;

UPDATE `board_article` SET `content`='댓글 수정', `rdate`=NOW() WHERE `no`=42;
DELETE FROM `board_article` WHERE `no`='40';

UPDATE `board_article` SET `comment`=`comment`+1 WHERE `no`=?;
UPDATE `board_article` SET `comment`=`comment`-1 WHERE `no`=26;

SELECT a.*, b.stdname, c.lecname FROM `register` AS a
JOIN `student` AS b
ON a.regstdno = b.stdno
JOIN `lecture` AS c
ON a.reglecno = c.lecno
WHERE `regstdno`='20201126';

select a.lecname from `lecture` AS a;

(SELECT `no`,`title`,`rdate` FROM `board_article` WHERE `cate`='notice' ORDER BY `no` DESC LIMIT 3) 
UNION 
(SELECT `no`,`title`,`rdate` FROM `board_article` WHERE `cate`='one' ORDER BY `no` DESC LIMIT 3)
UNION
(SELECT `no`,`title`,`rdate` FROM `board_article` WHERE `cate`='question' ORDER BY `no` DESC LIMIT 3);


ALTER TABLE `board_user` ADD COLUMN `sessId` VARCHAR(100) UNIQUE;
ALTER TABLE `board_user` ADD COLUMN `sessLimitDate` DATETIME;
ALTER TABLE `board_user` ADD COLUMN `wdate` DATETIME;
ALTER TABLE `board_user` DROP COLUMN `sessId`;
ALTER TABLE `km_product` DROP COLUMN `sessLimitDate`;
ALTER TABLE `km_member_coupon` auto_increment = 10000;
ALTER TABLE `km_article_cate` ADD COLUMN `c2Name` VARCHAR(100);

UPDATE `board_user` SET `sessId`='a12321431xxx', `sessLimitDate`=DATE_ADD(NOW(),INTERVAL 3 DAY) WHERE `uid`='a108';
UPDATE `board_user` SET `sessId`=null, `sessLimitDate`=null WHERE `uid`='a108';
SELECT * FROM `board_user` WHERE `sessId`=? AND `sessLimitDate`> NOW();

SELECT a.*, b.`nick` FROM `board_article` AS a JOIN `board_user` AS b ON a.uid = b.uid
where `parent`=0 AND (`nick` LIKE '%공지%' OR `title` LIKE '%공지%')
order by `no` DESC
LIMIT 1,10;

SELECT `no`,`title`,`rdate` FROM `board_article` WHERE `cate`='story' ORDER BY `no` DESC LIMIT 5

#//////////////////////////////////////////////////////////
insert into `km_product_cate2` VALUES ('18','10','여행/항공권');
insert into `km_product_cate2` VALUES ('18','11','도서/음반/e교육');
insert into `km_product_cate2` VALUES ('18','12','공연티켓');
insert into `km_product_cate2` VALUES ('18','13','e쿠폰');
insert into `km_product_cate2` VALUES ('18','14','상품권');
insert into `km_product_cate2` VALUES ('16','15','캠핑/낚시');
insert into `km_product_cate2` VALUES ('16','16','등산/아웃도어');
insert into `km_product_cate2` VALUES ('16','17','건강/의료용품');
insert into `km_product_cate2` VALUES ('16','18','건강식품');
insert into `km_product_cate2` VALUES ('16','19','렌탈서비스');
insert into `km_product_cate2` VALUES ('16','20','음향가전');
insert into `km_product_cate2` VALUES ('16','21','건강가전');

SELECT `prodNo`,`prodName`,`price`,`discount`,`thumb1`,`delivery` FROM `km_product` ORDER BY `sold` DESC LIMIT 5;

insert into `km_article`(`parent`,`comment`,`cate`,`title`,`content`,`file`,`hit`,`uid`,`regip`,`rdate`) VALUES ('0','0','notice','fdsaf','fdsafds','0','1','a108','1321431',NOW());

select * from `km_article` where `group`='notice' AND `cate`='service' ORDER BY `no` DESC LIMIT 10;

update `km_product` set `sold`=CEILING(RAND()*100);
update `km_product` set `hit`=CEILING(RAND()*100);
update `km_product` set `score`=CEILING(RAND()*5);
update `km_product` set `review`=CEILING(RAND()*100);

select * from `km_product` where `prodNo` in (1000288,1000290);
select MAX(`ordNo`) from `km_product_order`;

SELECT * FROM `km_product` WHERE `seller`='홈플러스' ORDER BY `prodNo` DESC LIMIT 0,10;

SELECT * FROM `km_product` WHERE `seller`='스마일배송' AND `prodName` LIKE '%가구%' ORDER BY `prodNo` DESC LIMIT 10;

ALTER TABLE `user2` ADD COLUMN `rdate` DATETIME;

SELECT SHA2('1234',256);

insert into `km_member_coupon` set `uid`='admin123',`name`='첫회원가입 500천원 할인 쿠폰',`discount`=5000,`limit`=5100,`exDate`=DATE_ADD(NOW(),INTERVAL 1 YEAR), state=0;


SELECT b.*,c.prodNo,c.thumb1,c.company,c.prodName,a.`count`, a.total from `km_product_order_item` AS a
													LEFT JOIN `km_product_order` AS b USING(`ordNo`)
													left JOIN `km_product` AS c ON a.prodNo = c.prodNo 
													where `ordUid`='admin123'
													and YEAR(ordDate) = YEAR(NOW()) and MONTH(ordDate) = MONTH(NOW())-1
													ORDER BY `ordDate` DESC LIMIT 0, 10;

SELECT * FROM `km_member_point`
WHERE uid = 'test123' and pointDate BETWEEN '2022-05-03' AND '2023-05-03';
WHERE YEAR(pointDate) = YEAR(NOW()) and MONTH(pointDate) = MONTH(NOW());
WHERE pointDate >= DATE_SUB(NOW(), INTERVAL 1 YEAR);

CREATE TABLE `weather` (

	`col1` VARCHAR(10) COMMENT '지역명',
	`col2` VARCHAR(10) COMMENT '현재일기',
	`col3` VARCHAR(10) COMMENT '시정km',
	`col4` TINYINT COMMENT '운량1/10',
	`col5` TINYINT COMMENT '중하운량',
	`col6` FLOAT COMMENT '현재기온',
	`col7` FLOAT COMMENT '이슬점온도',
	`col8` FLOAT COMMENT '체감온도',
	`col9` FLOAT COMMENT '일강수mm',
	`col10` FLOAT COMMENT '적설cm',
	`col11` TINYINT COMMENT '습도%',
	`col12` VARCHAR(10) COMMENT '풍향',
	`col13` FLOAT COMMENT '풍속m/s',
	`col14` FLOAT COMMENT '해변기압',
	`rdate` DATETIME

);

SELECT a.lecCode,b.lecName,b.lecClass,b.lecLoc,b.beginTime,b.endTime,b.lecGubun,b.credit,d.name AS 'name' FROM `lec_sugang` AS a JOIN `lecture` AS b USING(`lecCode`)
																		JOIN `lec_list` AS c USING(`lecCode`)
																		JOIN `member` AS d ON c.uid = d.uid
																		WHERE a.uid = 'test1';

SELECT 
			a.lecCode, b.lecClass, b.lecName, b.lecGubun, b.credit, 
			b.lecDay, b.beginTime, b.endTime, b.lecLoc, d.`name` 
		FROM lec_sugang AS a 
		JOIN lecture AS b ON a.lecCode = b.lecCode 
		JOIN lec_list AS c ON a.lecCode = c.lecCode
		JOIN member AS d ON c.uid = d.uid
		WHERE a.uid = 'test1'
		
SELECT * FROM `lec_eval_board` WHERE `no`=1
		
SELECT * FROM `lecture` AS a JOIN `lec_list` AS b USING(`lecCode`)
																					WHERE b.uid='profKor1';

SELECT COUNT(*) FROM `ebook` where `title` like CONCAT('%','최은옥','%') or `author` like CONCAT('%','최은옥','%');
select * from `ebook` where `title` like CONCAT('%','최은옥','%') or `author` like CONCAT('%','최은옥','%');

SELECT DATEDIFF(`returnDate`,`loanDate`) FROM `mylib` WHERE `no`='36'; 

select a.*,b.nick from `board_article` as a
												join `board_user` as b using (`uid`)
												where `parent`='132' order by `no` asc;

SELECT b.*,c.prodNo,c.thumb1,c.company,c.prodName,a.`count`, a.total, d.revNo from `km_product_order_item` AS a
													LEFT JOIN `km_product_order` AS b USING(`ordNo`)
													LEFT JOIN `km_product` AS c ON a.prodNo = c.prodNo
													LEFT JOIN `km_product_review` AS d ON a.prodNo = d.prodNo AND b.ordUid = d.uid 
													WHERE `ordUid`='admin123';
													
SELECT a.*,b.prodName from `km_product_review` AS a
										JOIN `km_product` AS b USING(`prodNo`)
										where `uid`='admin123' limit 5;

SELECT a.*, b.`nick` FROM `board_article` AS a 
													JOIN `board_user` AS b
													ON a.uid = b.uid 
													where `parent`=0 and `cate`='story'
													order by `no` desc 
													LIMIT 0,10;
SELECT a.*, b.fno, b.oriName, b.download FROM `board_article` AS a JOIN `board_file` AS b ON a.`no`=b.parent WHERE `no`='240';