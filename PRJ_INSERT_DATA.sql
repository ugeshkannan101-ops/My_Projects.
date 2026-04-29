USE SQL_PROJECT_1;

LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\SQL - Retail Sales Analysis.csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select' Retail_sales Table Import Done';

LOAD DATA LOCAL INFILE 'E:\\project\\PRJ_SQL_besent\\PRJ_2\\Library-System-Management---P2-main\\source file\\books.csv'
INTO TABLE books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select' Books Table Import Done';

LOAD DATA LOCAL INFILE 'E:\\project\\PRJ_SQL_besent\\PRJ_2\\Library-System-Management---P2-main\\source file\\branch.csv'
INTO TABLE branch
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select' Branch Table Import Done';

LOAD DATA LOCAL INFILE 'E:\\project\\PRJ_SQL_besent\\PRJ_2\\Library-System-Management---P2-main\\source file\\employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select' Employees Table Import Done';

LOAD DATA LOCAL INFILE 'E:\\project\\PRJ_SQL_besent\\PRJ_2\\Library-System-Management---P2-main\\source file\\issued_status.csv'
INTO TABLE issued_status
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select' Issued_status Table Import Done';

LOAD DATA LOCAL INFILE 'E:\\project\\PRJ_SQL_besent\\PRJ_2\\Library-System-Management---P2-main\\source file\\members.csv'
INTO TABLE members
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select' Members Table Import Done';

LOAD DATA LOCAL INFILE 'E:\\project\\PRJ_SQL_besent\\PRJ_2\\Library-System-Management---P2-main\\source file\\return_status.csv'
INTO TABLE return_status
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select' Return_status Import Done';
