show databases
create database sales;
use sales;
select database()

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

show tables ;
desc SALES1;
select * from sales1;
######################
SET SESSION sql_mode = ''
SET SQL_SAFE_UPDATES = 0;
##########################################################################################
LOAD DATA  infile 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_data_final.csv"
into table sales1
FIELDS	TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

##############################################################################################
LOAD DATA infile 
"C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\sales_data_final.csv"
into table sales1
FIELDS	TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW GLOBAL VARIABLES LIKE 'local_infile'; 
set global local_infile = 1;

load data infile
"C:\Users\supri\Downloads\sales_data_final.csv"
into table sales_data_final
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

##################

########################

show tables;
select * from sales1;
select str_to_date(order_date, '%m %d %y') from sales_data_final;

desc sales_data_final;

select * from sales_data_final;

select str_to_date(ship_date '%m %d %y') from sales_data_final;

alter table sales_data_final
drop column new_new3 

alter table sales_data_final
drop column oder_date_new

alter table sales_data_final
drop column new3

alter table sales_data_final
add column suri varchar(30) after order_id;

show tables;
select *  from sales1 limit 10;
desc sales1;


select str_to_date(order_date, '%m %d %y') from sales1;
select str_to_date(ship_date, '%m%d%Y') from sales1;

alter table sales1
add column oder_date_new date after order_date;

alter table sales1
add column ship_date_new date after ship_date;

select * from sales1;

update sales1
set oder_date_new = str_to_date(order_date, '%m%d%y') 









