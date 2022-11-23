#날짜 : 2022/10/18
#이름 : 구홍모
#내용 : 게시판 서비스 테이블 설계

#데이터베이스 생성
CREATE DATABASE `java1_board`;
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
#게시물 테이블 생성
create TABLE `board_article`(
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
CREATE TABLE `board_file`(
	`fno`			INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT,
	`newName`	VARCHAR(255),
	`oriName`	VARCHAR(255),
	`download`	INT DEFAULT 0, 
	`rdate`		DATETIME
);
#비밀번호 암호화(해쉬함수)
SELECT SHA('1234');
SELECT SHA2('1234',256);
SELECT a.*,b.`nick` FROM `board_article` AS a JOIN `board_user` AS b ON a.uid = b.uid ORDER BY `no` DESC
LIMIT 0, 10;

SELECT COUNT(`no`) FROM `board_article`;

INSERT INTO `board_article` (`title`,`content`,`uid`,`regip`,`rdate`)
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