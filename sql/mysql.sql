-- 한 줄 주석
# 한 줄 주석

/*
여러 줄 주석
여러 줄 주석
*/

use shopdb;  -- 데이터베이스 선택

-- select 칼럼명 from 테이블명 where 조건;

select * from membertb;

-- ctrl + enter : 한 줄 실행 
-- ctrl + shift + enter : 전체 실행 또는 선택한 블록 실행 

select memberaddress from membertb;
select memberaddress from membertb where membername = '이채림';
select * from producttb;
select productname, amount from producttb where amount < 5;

-- employees 데이터베이스에서 titles 테이블의 모든 데이터를 출력 
use employees ;
select * from titles ; 

use shopdb ;
select * from membertb;
select * from producttb;

-- 삼성 제품만 출력 
use shopdb ;
select productname from producttb where company = '삼성';

-- 세탁기 가격  
select cost from producttb where productname = '세탁기'; 

-- shopdb 데이터베이스의 테이블 목록을 출력
show table;

show databases;

-- employees 데이터베이스에서 종업원 전체 목록을 출력 
use employees;
show tables;
select first_name, last_name from employees;
select count(*) from employees; 

-- 남성 종사자의 목록을 출력하시오 
use employees;
show tables;
select * from employees;
select * from employees where gender = 'M';
select emp_no, first_name, last_name from employees where birth_date < '1960-01-01'; 

-- 연봉 1억 이상인 사람의 번호 출력 
select * from salaries;
select emp_no from salaries where salary > 100000;

-- 몇 명인지 
select count(emp_no) from salaries where salary > 100000;

-- 입사년도가 1990년 07월 07일 이전인 'engineer'의 데이터를 출력 

use employees;
show tables;
select * from employees;
select * from titles;
select * from titles where from_date > '1990-07-07' and title = 'engineer';


-- table을 생성하고 직접 값을 입력하는 sql query 

-- (create database 데이터베이스 이름;)
-- (use 데이터베이스 이름;)
-- create table 테이블 이름 (칼럼명, 데이터타입, 제약약조건);
-- insert into 테이블이름 (칼럼명) values (값1, 값2, ... )

-- varchar : variable character 크기가 변환하는, 입력된 데이터만큼만 축소해서 메모리를 잡아주는 데이터 타입 
create database sqldb;
use sqldb;

create table usertbl (
	userid char(8) not null primary key, 
    namei varchar(10) not null,
    birthyear int not null,
    addr char(2) not null,
    mobile1 char(3),
    mobile2 char(8),
    height smallint,
    mdate date);
    
insert ignore into usertbl values ('LSG', '이승기', 1987, '서울', '001', '11111111', 182, '2008-8-8');
insert ignore into usertbl values ('KBS', '김범수', 1979, '경남', '001', '22222222', 175, '2012-9-8');
insert ignore into usertbl values ('KKH', '김경호', 1984, '인천', '010', '22221111', 177, '2010-8-8');
insert ignore into usertbl values ('JYP', '조용필', 1963, '부산', '001', '33333333', 166, '2009-8-8');
insert ignore into usertbl values ('SSK', '성시경', 1979, '서울', NULL, NULL, 187, '2013-12-12');
insert ignore into usertbl values ('LJB', '임재범', 1969, '서울', '006', '11111111', 182, '2009-8-8');
insert ignore into usertbl values ('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-8-8');
insert ignore into usertbl values ('EJW', '은지원', 1972, '경기', '001', '11111111', 174, '2014-3-3');
insert ignore into usertbl values ('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2010-10-10');
insert ignore into usertbl values ('JWK', '조관우', 1965, '광주', '010', '00000000', 172, '2013-10-10');
    
    select * from userbl;
    
-- auto_increment 넘버가 자동으로 입력 
    
    create table buyTbl
    ( num int null primary key auto_increment,
    userid char(8) not null,
    prodname char(6) not null,
    groupname char(4),
    price int not null,
    amount smallint not null
    );
    

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);

select * from buyTbl;


--김경호라는 가수의 데이터를 출력 
select * from usertbl where name = '김경호' ;







