select database()
SHOW DATABASES;
USE SALES;
SHOW TABLES;

CREATE TABLE sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);


LOAD DATA  infile 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_data_final.csv"
into table sales2
FIELDS	TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select count(*) from sales1;
select * from sales1;

select ship_date(order_date, '%m%d%Y') from sales1;
select order_date(order_date, '%m%d%Y') FROM SALES1;

select * from sales1 order by date_format(order_date , '%d%m%Y');

select order_date as new from sales2;

select str_to_date(order_date, '%m%d%Y') from sales1;

SELECT * FROM sales1 where order_date = '1/7/2011';
select * from sales1 where ship_date = '2/20/2011';
select * from sales1 where order_date > '2/15/2011';
select * from sales1 where ship_date < '2/15/2011';
select * from sales1 where order_date between '1/12/2011' and '1/12/2011';
select now();
select curdate();
select curtime();
select * from sales1 where ship_date < date_sub(now(), interval 1 week);
select date_sub(now(), interval 1 week);
select date_sub(now(), interval 1 year);
select week(now());
SELECT year(now());
SELECT yearweek(NOW());
select weekofyear(NOW());
SELECT weekday(NOW());
SELECT day(NOW());
SELECT dayname(NOW());
select monthname(now());
SELECT dayofyear(NOW());
SELECT dayofmonth(NOW());
SELECT dayofweek(NOW());
SELECT monthname(NOW());
SELECT month(NOW());
select dayname('1989-04-17');
SELECT DATE(NOW());

alter table sales1
add column current_day varchar(50) after order_date;
select * from sales1;

update sales1
set current_day =  dayofweek(order_date);

alter table sales1
add column flag datetime after order_id;

alter table sales1
add column wday week

update sales1
set flag = now();

select * from sales1;

alter table sales1
drop current_day ;
desc sales1;

alter table sales1
add column flag2 varchar(30) after flag;

update sales1
set flag2 = 'sudheer';

alter table sales1
modify column `year` year;

alter table sales1
add column year_new year after order_date;

alter table sales1
modify column year_new int;

alter table sales1
add column month_new date after order_date;
alter table sales1
modify column day_new int;

alter table sales1
add column day_new date after order_date;
alter table sales1
modify column day_new;

select * from sales1;

select day(flag) from sales1;
select month(flag) from sales1;

update sales1 set year_new = year(flag);
update sales1 set month_new = month(flag);
update sales1 set day_new = day(flag);

select weekday(now());

update sales1
set day_new = day(flag);

select dayname(flag) from sales1;

alter table sales1
add column day_name varchar(30) after flag;

update sales1 set day_name = dayname(flag);

alter table sales1
rename column flag2 to month_name;

update sales1 set month_name = monthname(flag);
select * from sales1;

select avg(sales) from sales1 group by flag;
select avg(sales) from sales1 group by year_new ;
select avg(sales), ship_date from sales1 group by ship_date;
select year_new , sum(sales) from sales1 group by order_date;

update sales1
set year_new = year(order_date);

select (discount+shipping_cost) as CTC from sales1;

select discount, if(discount > 0, 'yes' , 'no' ) as discount_flag from sales1;
select * from sales1;

alter table sales1
add column discount_flag varchar(30) after discount;

select * from sales1;

update sales1 set discount_flag = if(discount > 0 , 'yes' , 'no' );

select str_to_date(order_date,'%m/%d/%y') from sales1;

alter table sales1 
add column order_date_new date ;

update sales1
set oder_date_new = str_to_date(order_date,'%m/%d/%Y');



select * from sales1;

select date(now());

select discount_flag, count(*) from sales1 group by discount_flag;

select count(discount > 0) from sales1;
select count(discount < 0) from sales1;

