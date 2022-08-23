#날짜 : 2022/08/23
#이름 : 구홍모
#내용 : 테이블 제약조건과 수정

#실습 2-1
CREATE TABLE `User2` (
	`uid`		VARCHAR(20) PRIMARY KEY,
    `name`		VARCHAR(10),
    `hp`		CHAR(13),
    `age`		TINYINT
);

#실습 2-2
INSERT INTO `user2` VALUES ('a103','김유신','010-1234-1001', 25);
INSERT INTO `user2` VALUES ('a102','김춘추','010-1234-1002', 23);


#실습 2-3 고유키
CREATE TABLE `User3` (
	`uid`		VARCHAR(20) PRIMARY KEY,
    `name`		VARCHAR(10),
    `hp`		CHAR(13)	unique,
    `age`		TINYINT
);

#실습 2-4
INSERT INTO `user3` VALUES ('a103','김유신','010-1234-1003', 25);
INSERT INTO `user3` VALUES ('a102','김춘추','010-1234-1002', 23);

#실습 2-5 foreign key
CREATE TABLE `Parent` (
	`pid`	varchar(10) primary key,
    `name`	varchar(10),
    `hp`	char(13) 	unique

);
CREATE TABLE `Child` (
	`cid`	varchar(10) primary key,
    `name`	varchar(10),
    `hp`	char(13) 	unique,
	`pid`	varchar(10),
    foreign key (`pid`) references `Parent` (`pid`)
);


#실습 2-6 

insert into `parent` values ('p101','이성계','010-1234-1111');
insert into `child` values ('c101','이방원','010-1234-1001','p101');

#실습 2-7 auto번호 속성
CREATE TABLE `User4`(
	`seq`		int primary key auto_increment,
	`name`		varchar(10),
    `gender`	tinyint,
    `age`		tinyint,
	`addr`		varchar(255)
);



#실습 2-8
insert into `user4` (`name`,`gender`,`age`,`addr`)values ('김유신',1,25,'김해시');
insert into `user4` (`name`,`gender`,`age`,`addr`)values ('김춘추',1,23,'경주시');
insert into `user4` (`name`,`gender`,`age`,`addr`)values ('심사임당',2,27,'강릉시');

delete from `user4` where `name`='심사임당';
#실습 2-9 not null : 중요한거 , default : null 대신 들어감
CREATE TABLE `User5`(
	`name`		varchar(10) NOT NULL,
    `gender`	tinyint,
    `age`		tinyint default 1,
	`addr`		varchar(255)
);
#실습 2-10
insert into `user5` set `name`='김유신';
insert into `user5` set `name`='김춘추', `addr`='부산시';

#실습 2-11
#실습 2-12
#실습 2-13
#실습 2-14
#실습 2-15
#실습 2-16