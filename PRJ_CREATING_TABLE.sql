USE SQL_PROJECT_1;
SET GLOBAL local_infile = 1;
-- Retail_sales 
Drop table retail_sales;
CREATE TABLE retail_sales (transactions_id INT,sale_date DATE,sale_time TIME,customer_id INT,gender VARCHAR(10),age INT,category VARCHAR(50),quantity INT,price_per_unit DECIMAL(10,2),cogs DECIMAL(10,2),total_sale DECIMAL(10,2));
-- select * from retail_sales;

-- Books
Drop table books;
CREATE TABLE books (isbn varchar(30),book_title varchar(100),category varchar(30),rental_price double DEFAULT NULL,
status_ varchar(100),author varchar(100),publisher varchar(100));
-- select * from books;

-- Branch
Drop table branch;
create table branch(branch_id varchar(10),manager_id varchar(10),branch_address varchar(100),contact_no bigint);
-- SELECT * FROM branch;

-- Employee
Drop table employees;
create table employees(emp_id varchar(10),emp_name varchar(100),position varchar(100),salary int,branch_id varchar(10));
-- select * from employees;

-- Issued_status
Drop table issued_status;
create table issued_status(issued_id varchar(10),issued_member_id varchar(50),issued_book_name varchar(200),
issued_date date,issued_book_isbn varchar(100),issued_emp_id varchar(10));
-- select * from issued_status;

-- Member
Drop table members;
create table members(member_id varchar(10),member_name varchar(50),member_address varchar(200),reg_date date);
-- select * from members;

-- Return_status
Drop table return_status;
create table return_status(return_id varchar(10),issued_id varchar(10),return_book_name varchar(200),return_date date,return_book_isbn varchar(10));
-- select * from return_status;

