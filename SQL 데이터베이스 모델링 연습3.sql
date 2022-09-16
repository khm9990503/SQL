#날짜 : 2022/09/08
#이름 : 구홍모
#내용 : SQL 데이터베이스 연습문제3

#Users
insert into `Users` values ('user01','김유신','1976-01-21','M','010-1101-1976','kimys@naver.com',0,1,'서울','2022-01-10 10:50:12');
insert into `Users` values ('user02','계백','1975-06-11','M','010-1102-1975',null,1000,1,'서울','2022-01-10 10:50:12');
insert into `Users` values ('user03','김춘추','1989-05-30','M','010-1103-1989',null,1200,2,'서울','2022-01-10 10:50:12');
insert into `Users` values ('user04','이사부','1979-04-13','M','010-2101-1979','leesabu@gmail.com',2600,1,'서울','2022-01-10 10:50:12');
insert into `Users` values ('user05','장보고','1966-09-12','M','010-2104-1966','jangbg@naver.com',9400,4,'대전','2022-01-10 10:50:12');
insert into `Users` values ('user06','선덕여왕','1979-07-28','M','010-3101-1979','gueen@naver.com',1600,2,'대전','2022-01-10 10:50:12');
insert into `Users` values ('user07','강감찬','1984-06-15','F','010-4101-1984','kang@daum.net',800,0,'대구','2022-01-10 10:50:12');
insert into `Users` values ('user08','신사임당','1965-10-21','M','010-5101-1965','sinsa@gmail.com',1500,1,'대구','2022-01-10 10:50:12');
insert into `Users` values ('user09','이이','1972-11-28','F','010-6101-1972','leelee@nate.com',3400,3,'부산','2022-01-10 10:50:12');
insert into `Users` values ('user10','허난설헌','1992-09-07','F','010-7101-1992',null,4100,3,'광주','2022-01-10 10:50:12');

#Points
insert into `Points` values (1,'user01',1000,'회원가입 1000 적립','2022-01-10 10:50:12');
insert into `Points` values (2,'user01',6000,'상품구매 5% 적립','2022-01-10 10:50:12');
insert into `Points` values (3,'user03',2835,'상품구매 5% 적립','2022-01-10 10:50:12');
insert into `Points` values (4,'user07',3610,'상품구매 5% 적립','2022-01-10 10:50:12');
insert into `Points` values (5,'user05',3000,'이벤트 응모 3000 적립','2022-01-10 10:50:12');
insert into `Points` values (6,'user02',1000,'회원가입 1000 적립','2022-01-10 10:50:12');
insert into `Points` values (7,'user02',2000,'이벤트 응모 2000 적립','2022-01-10 10:50:12');
insert into `Points` values (8,'user02',2615,'상품구매 5% 적립','2022-01-10 10:50:12');
insert into `Points` values (9,'user03',1500,'이벤트 응모 1500 적립','2022-01-10 10:50:12');
insert into `Points` values (10,'user06',15840,'상품구매 2% 적립','2022-01-10 10:50:12');

#Sellers
insert into `Sellers` values (10001,'(주)다팔아','02-201-1976','정우성','서울');
insert into `Sellers` values (10002,'판매의민족','02-102-1975','이정재','서울');
insert into `Sellers` values (10003,'멋남','031-103-1989','원빈','경기');
insert into `Sellers` values (10004,'스타일살아','032-201-1979','이나영','경기');
insert into `Sellers` values (10005,'(주)삼성전자','02-214-1966','장동건','서울');
insert into `Sellers` values (10006,'복실이옷짱','051-301-1979','고소영','부산');
insert into `Sellers` values (10007,'컴퓨존(주)','055-401-1984','유재석','대구');
insert into `Sellers` values (10008,'(주)LG전자','02-511-1965','강호동','서울');
insert into `Sellers` values (10009,'굿바디스포츠','070-6101-1972','조인성','부산');
insert into `Sellers` values (10010,'누리푸드','051-710-1992','강동원','부산');

#Categories
insert into `categories` values (10,'여성의류패션');
insert into `categories` values (11,'남성의류패션');
insert into `categories` values (12,'식품·생필품');
insert into `categories` values (13,'취미·반려견');
insert into `categories` values (14,'홈·문구');
insert into `categories` values (15,'자동차·공구');
insert into `categories` values (16,'스포츠·건강');
insert into `categories` values (17,'컴퓨터·가전·디지털');
insert into `categories` values (18,'여행');
insert into `categories` values (19,'도서');

#products
insert into `products` values (100101,11,10003,'반팔티 L~2XL',869,25000,132,20);
insert into `products` values (100110,10,10004,'트레이닝 통바지',1602,38000,398,15);
insert into `products` values (110101,10,10003,'신상 여성운동화',160,76000,40,5);
insert into `products` values (120101,12,10010,'암소 1등급 구이셋트 1.2kg',null,150000,87,15);
insert into `products` values (120103,12,10010,'바로구이 부채살 250g',null,21000,61,10);
insert into `products` values (130101,13,10006,'[ANF] 식스프리 강아지 사료',58,56000,142,0);
insert into `products` values (130112,13,10006,'중대형 사계절 강아지옷',120,15000,80,0);
insert into `products` values (141001,14,10001,'라떼 2인 소파/방수 패브릭',null,320000,42,0);
insert into `products` values (170115,17,10007,'지포스 3080 그래픽카드',28,900000,12,12);
insert into `products` values (160103,16,10009,'치닝디핑 33BR 철봉',32,120000,28,0);

#orders
insert into `orders` values ('22010210001','user02',52300,'서울시 마포구 121',1,'2022-01-10 10:50:12');
insert into `orders` values ('22010210002','user03',56700,'서울시 강남구 21-1',1,'2022-01-10 10:50:12');
insert into `orders` values ('22010210010','user04',72200,'서울시 강서구 큰대로 38',2,'2022-01-10 10:50:12');
insert into `orders` values ('22010310001','user05',127000,'경기도 광주시 초월로 21',1,'2022-01-10 10:50:12');
insert into `orders` values ('22010310100','user01',120000,'경기도 수원시 120번지',0,'2022-01-10 10:50:12');
insert into `orders` values ('22010410101','user06',792000,'부산시 남구 21-1',2,'2022-01-10 10:50:12');
insert into `orders` values ('22010510021','user07',92200,'부산시 부산진구 56 10층',4,'2022-01-10 10:50:12');
insert into `orders` values ('22010510027','user08',112000,'대구시 팔달로 19',3,'2022-01-10 10:50:12');
insert into `orders` values ('22010510031','user10',792000,'대전시 한밭로 24-1',2,'2022-01-10 10:50:12');
insert into `orders` values ('22010710110','user09',94500,'광주시 충열로 11',1,'2022-01-10 10:50:12');

#orderitems
insert into `orderitems` values (1,'22010210001',100110,38000,15,1);
insert into `orderitems` values (2,'22010210001',100101,25000,20,1);
insert into `orderitems` values (3,'22010210002',120103,21000,10,3);
insert into `orderitems` values (4,'22010310001',130112,15000,0,1);
insert into `orderitems` values (5,'22010310001',130101,56000,0,2);
insert into `orderitems` values (6,'22010210010',110101,76000,5,1);
insert into `orderitems` values (7,'22010310100',160103,120000,0,1);
insert into `orderitems` values (8,'22010410101',170115,900000,12,1);
insert into `orderitems` values (9,'22010510021',110101,76000,5,1);
insert into `orderitems` values (10,'22010510027',130101,56000,0,2);
insert into `orderitems` values (11,'22010510021',100101,25000,20,1);
insert into `orderitems` values (12,'22010510031',170115,900000,12,1);
insert into `orderitems` values (13,'22010710110',120103,21000,10,5);

#carts
insert into `carts` values(1,'user01',100101,1,'2022-01-10 10:50:12');
insert into `carts` values(2,'user01',100110,2,'2022-01-10 10:50:12');
insert into `carts` values(3,'user03',120103,1,'2022-01-10 10:50:12');
insert into `carts` values(4,'user04',130112,1,'2022-01-10 10:50:12');
insert into `carts` values(5,'user05',130101,1,'2022-01-10 10:50:12');
insert into `carts` values(6,'user02',110101,3,'2022-01-10 10:50:12');
insert into `carts` values(7,'user02',160103,1,'2022-01-10 10:50:12');
insert into `carts` values(8,'user02',170115,1,'2022-01-10 10:50:12');
insert into `carts` values(9,'user03',110101,1,'2022-01-10 10:50:12');
insert into `carts` values(10,'user06',130101,1,'2022-01-10 10:50:12');


