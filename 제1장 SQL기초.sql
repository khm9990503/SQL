#날짜 : 2022/08/22
#이름 : 구홍모
#내용 : 제1장 SQL 기초

#실습 1-1 데이터베이스 생성 및 제거
CREATE DATABASE `UserDB`;
DROP DATABASE `UserDB`;

#실습 1-2 테이블 생성 및 제거
CREATE TABLE `User1` (
	`uid`	VARCHAR(10),
	`name`	VARCHAR(10),
	`hp`	CHAR(13),
	`age`	INT
);
DROP TABLE `User1`;

#실습 1-3 테이블에 데이터 추가
INSERT INTO `User1` VALUES ('A101','김유신','010-1234-1111',25);
INSERT INTO `User1` VALUES ('A102','김춘추','010-1234-2222',23);
INSERT INTO `User1` VALUES ('A103','장보고','010-1234-3333',32);
INSERT INTO `User1` (`uid`,`name`,`age`) VALUES ('A104','강감찬',45);
INSERT INTO `User1` SET
						`uid`='A105',
                        `name`='이순신',
                        `hp`='010-1234-5555';
#실습 1-4 테이블 데이터 조회
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT `uid`, `name`,`age` FROM `User1`;

#실습 1-5 테이블에 데이터 수정
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';

#실습 1-6 테이블에 데이터 삭제
DELETE FROM `User1` WHERE `uid`='A101';
DELETE FROM `User1` WHERE `uid`='A102' AND `age`=23;
DELETE FROM `User1` WHERE `age`>=30;

#실습 1-7 연습문제
CREATE TABLE `Tb1User` (
				`userId`	VARCHAR(10),
                `userName`	VARCHAR(10),
                `userHp`	CHAR(13),
                `userAge`	TINYINT,
                `userAddr`	VARCHAR(20)
                );
CREATE TABLE `Tb1Product` (
				`prdCode`		INT,
                `prdName`		VARCHAR(10),
                `prdPrice`		INT,
                `prdAmount`		INT,
                `prdCompany`	VARCHAR(10),
                `prdMakedate`	DATE
                );
#실습 1-8
INSERT INTO `Tb1User` VALUES ('p101','김유신','010-1234-1001',25,'서울시 중구') ;
INSERT INTO `Tb1USer` VALUES ('p102','김춘추','010-1234-1002',23,'부산시 금정구');
INSERT INTO `Tb1USer` (`userId`,`userName`,`UserAge`,`UserAddr`) VALUES ('p103','장보고',31,'경기도 광주군');
INSERT INTO `Tb1USer` (`userId`,`userName`,`UserAddr`) VALUES ('p104','강감찬','경남 창원시');
INSERT INTO `Tb1USer` SET
				`userId`='p105',
                `userName`='이순신',
                `userHp`='010-1234-1005',
                `userAge`=50;
INSERT INTO `Tb1Product` VALUES (1,'냉장고',800,10,'LG',20220106);
INSERT INTO `Tb1Product` VALUES (2,'노트북',1200,20,'삼성',20220106);
INSERT INTO `Tb1Product` VALUES (3,'TV',1400,6,'LG',20220106);
INSERT INTO `Tb1Product` VALUES (4,'세탁기',1000,8,'LG',20220106);
INSERT INTO `Tb1Product` VALUES (5,'컴퓨터',1100,0,null,null);
INSERT INTO `Tb1Product` VALUES (6,'휴대폰',900,102,'삼성',20220106);

#실습 1-9
SELECT * FROM `tb1user`;
SELECT `userName` FROM `tb1user`;
SELECT `userName`,`userHp` FROM `tb1user`;
SELECT * FROM `Tb1user` WHERE `userid`='p102';
SELECT * FROM `Tb1user` WHERE `userId`='p104' OR `userId`='p105';
SELECT * FROM `Tb1User` WHERE `userAddr`='신라';
SELECT * FROM `Tb1User` WHERE `userAge` > 30;
SELECT * FROM `Tb1User` WHERE `userHp` IS NULL;
UPDATE `tb1User` SET `userAge`=42 WHERE `UserId`='p104';
UPDATE `Tb1User` SET `userAddr`='경남 김해시' WHERE `userId`='p105';
DELETE FROM `Tb1user` WHERE `userid`='p103';

SELECT * FROM `tb1Product`;
SELECT `prdNAME` FROM `tb1
