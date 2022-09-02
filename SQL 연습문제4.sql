#날짜 : 2022/09/02
#이름 : 구홍모
#내용 : SQL 연습문제4

#실습4-1

#실습4-2
create table `customer` (
	`cusid`		int auto_increment primary key,
    `name`		varchar(10) not null,
    `address`	varchar(20),
    `phone`		varchar(13)
    
);

create table `book`(
	`bookId`	int primary key,
    `bookname`	varchar(20) not null,
    `publisher`	varchar(20) not null,
    `price`		int
);

create table `order`(
	`orderid`	int auto_increment primary key,
    `cusid`		int not null,
    `bookid`	int not null,
    `saleprice` int not null,
    `orderdate`	date not null
);
#실습4-3
insert into `customer` values (1,'박지성','영국 멘체스터','010-5000-0001');
insert into `customer` values (2,'김연아','대한민국 서울','010-6000-0001');
insert into `customer` values (3,'장미란','대한민국 강원도','010-7000-0001');
insert into `customer` values (4,'추신수','미국 클리블랜드','010-8000-0001');
insert into `customer` values (5,'박세리','대한민국 대전',null);

insert into `book` values (1,'축구의 역사','굿스포츠',7000);
insert into `book` values (2,'축구아는 여자','나무수',13000);
insert into `book` values (3,'축구의 이해','대한미디어',22000);
insert into `book` values (4,'골프 바이블','대한미디어',35000);
insert into `book` values (5,'피겨 교본','굿스포츠',8000);
insert into `book` values (6,'역도 단계별기술','굿스포츠',6000);
insert into `book` values (7,'야구의 추억','이상미디어',20000);
insert into `book` values (8,'야구를 부탁해','이상미디어',13000);
insert into `book` values (9,'올림픽 이야기','삼성당',7500);
insert into `book` values (10,'olympic champions','pearson',13000);

insert into `order` values (1, 1, 1, 6000, 20140701);
insert into `order` values (2, 1, 3, 21000, 20140703);
insert into `order` values (3, 2, 5, 8000, 20140703);
insert into `order` values (4, 3, 6, 6000, 20140704);
insert into `order` values (5, 4, 7, 20000, 20140705);
insert into `order` values (6, 1, 2, 12000, 20140707);
insert into `order` values (7, 4, 8, 13000, 20140707);
insert into `order` values (8, 3, 10, 12000, 20140708);
insert into `order` values (9, 2, 10, 7000, 20140709);
insert into `order` values (10, 3, 8, 13000, 20140710);


#실습4-4
select `cusid`,`name`,`address` from `customer`;

#실습4-5
select `bookname`,`price` from `book`;

#실습4-6
select `price`,`bookname` from `book`;

#실습4-7
select `bookid`,`bookname`,`publisher`,`price` from `book`;

#실습4-8
select `publisher` from `book`;

#실습4-9
select distinct `publisher` from `book`;

#실습4-10
select * from `book` where `price`>=20000;

#실습4-11
select * from `book` where `price`<=20000;

#실습4-12
select `bookid`,`bookname`,`price` from `book` where `price`>=10000 &&`price`<=20000;

#실습4-13
select `bookid`,`bookname`,`price` from `book` where `price`>=15000 &&`price`<=30000;

#실습4-14
select * from `book` where `bookid`in(2,3,5);

#실습4-15
select * from `book` where `bookid`%2=0;

#실습4-16
select * from `customer` where `name` like '박%';

#실습4-17
select * from `customer` where `address` like '대한민국%';

#실습4-18
select * from `customer` where `phone` is not null;

#실습4-19
select * from `book` where `publisher` in ('굿스포츠') or `publisher` in ('대한미디어');

#실습4-20
select `publisher` from `book` where `bookname` in ('축구의 역사');

#실습4-21
select `publisher` from `book` where `bookname` like ('축구%');

#실습4-22
select * from `book` where `bookname` like '_구%';

#실습4-23
select * from `book` where `bookname` like ('축구%') and `price`>=20000;

#실습4-24
select * from `book` order by `bookname`;

#실습4-25
select * from `book` order by `price`,`bookname`;

#실습4-26
select * from `book` order by `price` desc,`publisher`;

#실습4-27
select * from `book` order by `price` desc limit 3;

#실습4-28
select * from `book` order by `price` limit 3;

#실습4-29
select sum(`saleprice`) as `총판매액` from `order`;

#실습4-30
select sum(`saleprice`)as `총판매액`, avg(`saleprice`)as `평균값`, min(`saleprice`)as `최저가`, max(`saleprice`)as `최고가` from `order`;

#실습4-31
select count(`orderid`) as `판매건수` from `order`;

#실습4-32
select 
	`bookid`,
    replace(`bookname`,'야구','농구') as `bookname`,
    `publisher`,
    `price` from `book`;

update `book` set `bookname`='야구의 추억' where `bookname`='농구의 추억';
update `book` set `bookname`='야구를 부탁해' where `bookname`='농구를 부탁해';

#실습4-33
select `cusid`,count(`bookid`) as`수량` from `order` where `saleprice` >= 8000 group by `cusid` having `수량`>=2;

#실습4-34
select * from `customer` as a
join `order` as b
on a.cusid=b.cusid;

#실습4-35
select * from `customer` as a
join `order` as b
on a.cusid=b.cusid order by a.cusid;

#실습4-36
select a.name, b.saleprice from `customer` as a
join `order` as b
on a.cusid=b.cusid order by a.cusid;

#실습4-37
select a.name, sum(b.saleprice) from `customer` as a
join `order` as b
on a.cusid=b.cusid group by a.name;

#실습4-38
select a.name,c.bookname from `customer` as a
join `order` as b
on a.cusid=b.cusid
join `book` as c
on b.bookid=c.bookId;

#실습4-39
select a.name,c.bookname from `customer` as a
join `order` as b
on a.cusid=b.cusid
join `book` as c
on b.bookid=c.bookId where b.saleprice=20000;

#실습4-40
select a.name,b.saleprice from `customer` as a
left join `order` as b
on a.cusid=b.cusid;

#실습4-41
select `bookname` from `book` where `price`=(select max(`price`) from `book`); 
select `bookname` from `book` order by `price` desc limit 1;

#실습4-42
select `name` from `customer` where `cusid` not in (select distinct `cusid` from `order`);
select a.name from `customer` as a
left join `order` as b
on a.cusid=b.cusid where `saleprice` is null;

#실습4-43
select sum(`saleprice`) as `총매출` from `order` where `cusid`=(select `cusid` from `customer` where `name`='김연아');
select sum(`saleprice`) as `총매출` from `customer` as a
left join `order` as b
on a.cusid=b.cusid where `name`='김연아';

#실습4-44
insert into `book` values (11,'스포츠 의학','한솔의학서적',null);

#실습4-45
update `customer` set `address` = '대한민국 부산' where `cusid`=5;

#실습4-46
delete from `customer` where `cusid`=5;