DROP DATABASE IF EXISTS cz;
CREATE DATABASE cz;
USE cz;
-- Это проект приложения по торговле ценными бумагами.
-- Основная цель проекта - соединить клиента со списком акций и их свойств с бановким счетом.
-- В проекте также ставилась цель осуществить включение всех показателей акций для 
-- возможности анализа и прогнозирования. 
DROP TABLE IF EXISTS customer; #Клиентская таблица
CREATE TABLE customer (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
    INDEX users_phone_idx(phone),
    INDEX users_firstname_lastname_idx(firstname, lastname)
);
INSERT INTO customer VALUES ('1','Javonte','Jakubowski','trey62@example.net','89676723604'),
('2','Aurelia','Ratke','rrolfson@example.org','89339101296'),
('3','Jacey','Fritsch','stone96@example.com','89802518644'),
('4','Whitney','Jerde','jonathon.feil@example.com','89397268208'),
('5','Axel','Lynch','ckuhic@example.org','89585747656'),
('6','Karlee','Kunde','syost@example.org','89125986482'),
('7','Ryann','Prosacco','malvina.toy@example.net', '89334895548'),
('8','Ona','Schumm','adelia91@example.com', '89838377175'),
('9','Kennith','Gaylord','alphonso71@example.com', '89777246849'),
('10','Alexandre','Rowe','esipes@example.net', '89230775666');

DROP TABLE IF EXISTS `stock_customers`; # акции клиента
CREATE TABLE `stock_customers` (
	stock_id BIGINT UNSIGNED NOT NULL UNIQUE,
	user_id BIGINT UNSIGNED NOT NULL unique,
    created_stok_acc DATETIME DEFAULT NOW(),
    tiker VARCHAR(255),
    price_stock FLOAT,
    stock_discription VARCHAR(255),
    FOREIGN KEY (stock_id) REFERENCES customer(id) ON UPDATE CASCADE ON DELETE restrict
    );
INSERT INTO `stock_customers` VALUES 
('1', '1','1993-02-06 02:07:09','officiis','74155700','Facilis dolores quaerat voluptatem et enim ullam rerum.'),
('2', '2','2006-09-23 10:36:00','et','22594200','Adipisci in at laudantium consequatur facilis.'),
('3', '3','2013-03-30 04:16:40','et', '218976000','Dolores tempora nisi temporibus quibusdam.'),
('4', '4','2006-09-22 17:21:25','similique', '140.297','Cumque voluptates numquam sunt ad sint vero.'),
('5', '5','2020-10-05 03:48:13','qui', '866187','Qui harum enim porro et quam iure ut.'),
('6', '6','2001-03-17 13:03:02','accusantium','0','Consequuntur et aliquid voluptatem officia blanditiis libero rerum sit.'),
('7','7','1993-05-25 09:58:24','voluptatem', '1240050','Enim animi et beatae ut.'),
('8','8','1993-05-25 09:58:24','voluptatem', '1240050','Enim animi et beatae ut.'),
('9','9','1993-05-25 09:58:24','voluptatem', '1240050','Enim animi et beatae ut.'),
('10','10','1993-05-25 09:58:24','voluptatem', '1240050','Enim animi et beatae ut.');
--  INSERT INTO customer VALUES ('1','1','2015-04-25','tmxd','234'),
-- ('2','2','1974-02-07', 'DFKC', '231'),
-- ('3','3','1980-03-15', 'MOMO'),
-- ('4','4','1992-05-05', 'APPL'),
-- ('5','5','1995-10-05', 'GOOGLX'),
-- ('6','6','1993-05-22', 'MJDW'),
-- ('7','7','1991-03-13', 'JSA'),
-- ('8','8','2005-02-15', 'DLCS'),
-- ('9','9','2075-05-02', 'WQE'),
-- ('10','10','2013-02-11', 'SAFA');  
   
DROP TABLE IF EXISTS bank_account; # банковский счет, аффелированный с аккаунтом брокерского счета
CREATE TABLE bank_account(
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	account_id BIGINT UNSIGNED NOT NULL UNIQUE,
    created_bank_acount DATETIME DEFAULT NOW(),
    bank_acount BIGINT UNSIGNED NULL,
    balance_account FLOAT,
    status VARCHAR(255),
    last_activitity DATETIME DEFAULT NOW(),
    product_acc VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES customer(id) ON UPDATE CASCADE ON DELETE restrict,
    FOREIGN KEY (account_id) REFERENCES stock_customers(stock_id)
);
INSERT INTO `bank_account` 
VALUES ('1','1','1992-04-03 09:04:57','1906','245242','Dolores quas nisi sit voluptatibus et. Nihil ut eum et ullam eum.','1991-05-20 21:20:54','rerum'),
('2','2','1993-02-01 03:04:57','23906','2536345345','Dolw jwej. Perspiciatis temporibus ipsam.','1992-03-20 21:20:54','rwqum'),
('3','3','1995-01-03 02:04:57','23223','3536361','Dolwefef qeewej. Peqreqsrrpiqrciatis tqremporibus ipsam.','1991-05-20 21:20:54','rwqquwdqm'),
('4','4','1995-02-01 02:04:57','23223','35366366','Bdhwk wjew. Wrn jrei, jrjw. Dfggge qreq srrpiqrciatis tqremporibus ipsam.','2001-05-21 20:21:54','ewquwdqm'),
('5','5','1997-01-03 02:03:00','34525','353553553','Pisdhwn qeewdwej. Deqreqsrrpiqrciatis tqrweemporibus ipsam.','2003-02-02 21:21:54','wewqddfaa'),
('6','6','1993-08-04 08:01:57','34525','74212347','Pisdhwn qeewdwej. Eeqreqsrrpiqrciatis kjwhrbg ipsam.','2007-03-02 20:21:54','wrewqda'),
('7','7','1992-07-04 05:02:57','34525','74212347','Pisdhwn qeewdwej. Weqreqsrrpiqrciatis wrwrw ipsam.','2007-03-02 20:21:54','wrewqda'),
('8','8','1999-04-04 07:05:57','34525','74212347','Jhfeiin ehr Qeqreqsrrpiqrciatis  ipsam.','2007-03-02 20:21:54','uiopda'),
('9','9','1989-01-04 09:08:57','34525','74212347','Pisdhwn qeewdwej. Aeqreqswrwratis tqrweemporibus ipsam.','2009-03-02 14:21:54','wrcww'),
('10','10','1993-02-04 02:03:57','34525','74212347','Skmefj wjrhw. Qeeen qsrrpiqrciatis tqrweedfeefs ipsam.','2010-06-02 13:30:54','tradewwr')
;

DROP TABLE IF EXISTS `profiles`; #профайл клиента
CREATE TABLE `profiles` (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    gender CHAR(1),
    birthday DATE,
    tarif ENUM('investor', 'trader', 'premium'),
	created_at DATETIME DEFAULT NOW(),
    bank_acount BIGINT UNSIGNED NULL,
    FOREIGN KEY (user_id) REFERENCES customer(id) ON UPDATE CASCADE ON DELETE restrict,
	FOREIGN KEY (bank_acount) REFERENCES bank_account(account_id)
);

INSERT INTO `profiles` VALUES 
('1','f','1976-11-08','investor','1970-01-18 03:54:01','1'),
('2','f','2011-12-20','trader','1994-11-06 23:56:10','2'),
('3','m','1994-06-15','premium','1975-11-27 02:27:11','3'),
('4','f','1979-11-07', 'premium','1994-04-12 04:31:49','4'),
('5','f','1976-04-19','trader','1976-07-05 02:25:30','5'),
('6','f','1983-09-07','premium','1981-06-20 15:54:43','6'),
('7','m','2014-07-31','investor','1997-06-21 07:52:05','7'),
('8','f','1975-03-26','investor','2008-08-18 18:23:25','8'),
('9','f','1982-11-01','investor','2014-09-29 01:22:26','9'),
('10','m','1977-05-14','investor','1980-03-17 18:17:45','10');

DROP TABLE IF EXISTS `stock_index`; # оценка стоимости и финансовые показатели
CREATE TABLE `stock_index` (
	indexes_id BIGINT UNSIGNED NOT NULL UNIQUE,
	market_cup FLOAT,
	ebitda FLOAT,
	p_s FLOAT,
	diluted_eps FLOAT,
	user_id BIGINT UNSIGNED NOT NULL unique,
    created_stok_acc DATETIME DEFAULT NOW(),
    tiker VARCHAR(255),
    price_stock FLOAT,
    rate ENUM('A', 'AA', 'AAA'),
    stock_discription VARCHAR(255),
	INDEX trade (price_stock),
    FOREIGN KEY (indexes_id) REFERENCES stock_customers(stock_id) ON UPDATE CASCADE ON DELETE restrict,
    FOREIGN KEY (user_id) REFERENCES customer(id)
);
INSERT INTO `stock_index` VALUES ('1','30186.8','5103.64','6567790','2335.54','1','1979-11-13 15:55:12','doloribus','39.9','A','sed'),
('2','101413','0.123','1.3','1.649','2','1988-06-14 09:09:33','doloribus','56.74','AAA','fuga'),
('3','10675.2','0.131','0.837','188.616','3','2019-03-31 10:51:33','quibusdam','1223','A','nostrum'),
('4','174591','2746.68','363434','42306.7','4','1983-02-27 14:45:19','inventore','9','AA','totam'),
('5','36156','353.986','112.537','0.342','5','1998-04-16 07:21:45','voluptatum','242.3','A','in'),
('6','157356','8199030','159272','19.5002','6','1979-10-25 03:33:47','voluptatem','24.13','AA','delectus'),
('7','417266000', '2324','3168.83','6024940','7','1995-11-28 04:48:48','et','2421.13','AAA','labore'),
('8','1.35478','4769950','0.143','3188.94','8','1991-06-21 11:59:34','non','4060520','A','est'),
('9','113388','142.15','24593900','269393','9','1971-02-03 08:31:21','consequatur','3685610','AAA','saepe'),
('10','662415','285390','956.85','2881.42','10','1991-04-02 08:22:48','ab','131.131','AAA','reprehenderit');

DROP TABLE IF EXISTS `profitability`; # показатели рентабельности
CREATE TABLE `profitability` (
	id_profit BIGINT UNSIGNED NOT NULL unique,
	ROE FLOAT,
	ROA FLOAT,
	ROI FLOAT,
	debt_equity FLOAT,
	net_profit_margin FLOAT,

    FOREIGN KEY (id_profit) REFERENCES customer(id)
);

INSERT INTO `profitability` VALUES 
('1','0.23','0.3','0.1','0.312','3'),
('2','0.31','0.321','0.3','0.725','3112'),
('3','0.234','0.211','0.12','0.5','3'),
('4','0.123','0.11','0.123','0.21','123'),
('5','0.314','0.2113','0.1213','0.311','531'),
('6','0.313','0.214','0.1123','0.112','123'),
('7','0.76','0.112','0.145','0.53','0.12'),
('8','0.324','0.87','0.541','0.53','0.1213'),
('9','0.3413','0.321','0.331','0.1211','0.131'),
('10','0.11','0.76','0.1123','0.3121','0.121');

DROP TABLE IF EXISTS trade; #торговля
CREATE TABLE `trade` (
	open_price FLOAT, # цена открытия
	moment_price FLOAT, #актуальная цена
	close_price FLOAT, #цена закрытия
	year_high FLOAT, #годовой максимум
	year_low FLOAT, #годовой минимум
	PRIMARY KEY (moment_price),
	FOREIGN KEY (moment_price) REFERENCES stock_index(price_stock) ON UPDATE CASCADE ON DELETE restrict
 );


INSERT INTO `trade` VALUES 
('10177.5','39.9','639318','1993','1977'),
('12431.8','56.74','1976','2002','1212'),
('57.39','1223','258.7','1998','1976'),
('280.979','9','131','1983','1988'),
('0.1407100','242.3','8670.86','1986','1978'),
('390878.2','24.13','141.63','2016','1970'),
('33.16023','2421.13','15.1534','2007','2003'),
('44655600','4060520','344.243','1982','1998'),
('2231.09','3685610','103291','1992','1975'),
('14386.6','131.131','1959190.0','2006','1987');


DROP TABLE IF EXISTS `block of shares`; # суммарные показатели
CREATE TABLE `block of shares` (
	count_id BIGINT UNSIGNED NOT NULL,
	customer_count FLOAT,
	PRIMARY KEY (`count_id`)
);

INSERT INTO `block of shares` VALUES 
('1','32324'),
('2','564224.7424'),
('3','56424.74'),
('4','52426.74'),
('5','562424.74'),
('6','562424.74'),
('7','562424.74'),
('8','562424.74'),
('9','56242.74'),
('10','562424.74');
	


DROP TABLE IF exists `pay`; # блок оплаты и внесения денег на счет
CREATE TABLE `pay` (
  payment_id BIGINT UNSIGNED NOT NULL,
  customer_id BIGINT UNSIGNED NOT NULL,
  staff_id tinyint unsigned NOT NULL,
  rental_id int DEFAULT NULL,
  amount decimal(5,2) NOT NULL,
  payment_date datetime NOT NULL,
  FOREIGN KEY (payment_id) REFERENCES customer(id) ON DELETE RESTRICT ON UPDATE cascade,
  INDEX acc_transaction (amount)
    );
   
 INSERT INTO `pay` VALUES 
('1','1','1','1','213.18','1979-06-09 05:42:37'),
('2','2','2','2','215.18','1993-12-29 10:37:47'),
('3','3','3','3', '155.58','1987-03-13 06:28:03'),
('4','4','4','4', '242','2014-02-07 22:40:05'),
('5','5','5','5','223.18','2013-12-26 19:01:33'),
('6','6','6','6','222.18','2015-06-13 09:19:16'),
('7','7','7','7', '222.248','1974-11-04 03:46:33'),
('8','8','8','8', '212.248','1977-09-11 01:26:28'),
('9','9','9','9','232.13','1986-11-01 23:07:58'),
('10','10','10','10','211.00','2014-04-23 16:15:00');  
   
   
DROP TABLE IF EXISTS acc_transaction; # блок транзакций
CREATE TABLE acc_transaction (
	id SERIAL,
	amount decimal(5,2) NOT NULL,
    tnx_date DATETIME,
    tnx_type VARCHAR(50),
    created_at DATETIME DEFAULT NOW(),

    PRIMARY KEY (amount),
	FOREIGN KEY (amount) REFERENCES pay(amount) 
   );

  INSERT INTO `acc_transaction` VALUES 
 ('1','213.18','2006-11-17 18:15:06','fugiat','1982-04-19 18:12:01'),
('2','215.18','1974-12-24 10:04:37','magnam','2000-01-30 11:09:39'),
('3','155.58','1983-09-15 09:59:42','excepturi','1976-02-10 15:22:31'),
('4','242','2018-08-21 06:15:40','nam','2000-10-15 00:25:24'),
('5','223.18','1975-12-05 16:12:49','consequatur','2017-12-14 14:16:54'),
('6','222.18','2013-05-08 13:51:50','aspernatur','1975-11-05 05:48:57'),
('7','222.248','1987-12-11 17:08:21','saepe','2020-01-23 11:41:54'),
('8','212.248','1978-06-18 23:45:05','et','2019-07-16 13:43:41'),
('9','232.13','2013-07-16 21:00:09','sit','1970-01-14 00:25:53'),
('10','211.00','1996-09-06 16:45:37','est','2012-06-23 16:13:01');
  
  
 
  #  Сколько людей с тарифом "инвестор"
 SELECT tarif, COUNT(*) 
FROM profiles
JOIN customer  on profiles.tarif = customer.id
WHERE customer.id = 1 
GROUP BY id;
#соответсвие имен клиентов и статуса тарифа
 SELECT tarif, firstname, lastname 
FROM profiles
JOIN customer  on profiles.tarif = customer.id
GROUP BY user_id;
# Соответствие имени и цены накций
SELECT 
	firstname,
	lastname,
	email,
	id,
	(SELECT price_stock  FROM stock_customers where user_id = 1) as 'price',
	(SELECT user_id FROM stock_customers where user_id = 1) as 'ip'
FROM customer
where id = 1;

#Выделение в таблице двух столбцов
 SELECT 
 price_stock,
 stock_id
 FROM stock_customers;

#представления
DROP view IF EXISTS cust;
create view cust as select * from customer order by firstname;
select * from cust;

show tables;

create view customers_id (firstname, cutm_id) as select firstname, id from customer;
select * from customers_id;

#триггеры
DROP trigger IF EXISTS bank_new;
delimiter //
create trigger bank_new after insert on `block of shares`
for each row
begin
		select count(*) into @total from `block of shares`;
end //

insert into `block of shares` values ('11','962424.74');

select * from `block of shares`

select @total;

DROP trigger IF EXISTS last_row;
delimiter //
create trigger last_row before delete on `block of shares`
for each row begin
	declare total int;
	select count(*) into total from `block of shares`;
	if total <= 1 then signal sqlstate '45000' set message_text = 'delete canceled';
	end if;
end //