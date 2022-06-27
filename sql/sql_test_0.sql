show tables;

drop table usertbl1;

-- groupby -> 데이터를 그룹으로 묶어서 그룹 단위로 데이터를 연산
-- 1. 그룹화 > 2. 그룹별 연산(집계함수)  

use sqldb;

select * from usertbl;
select * from buytbl;

select userid from buytbl

-- 총 구매액 sum
select userid from buytbl group by userid;
select userid, sum(amount) from buytbl group by userid;
select userid, sum(amount) as total_amount from buytbl group by userid;

-- 평균 구매액 avg
select userid, avg(amount) as total_amount as '총 구매금액' from buytbl group by userid order by '평균 구매금액';

-- 구매 횟수 count
select userid, count(amount) as '구매횟수' from buytbl group by userid;

-- 사용자별 총 구매금액이 1000이상인 고객데이터 출력
-- group by에서 조건을 지정하는 경우 : having (o), where (x) 
select * sum(amount) > '1000' from buytbl group by userid;
select userid, sum(price * amount) as '총구매금액' from buytbl group by userid having'총구매금액' >= 1000;

-- 구매 횟수가 2회 이상인 고객정보를 출력 
select userid, count(amount) as '구매횟수' from buytbl group by userid having '구매횟수' >= 2;  -- ??
select * from buytbl group by userid having count(amount) >=2;

-- usertbl 에서 가장 키가 큰 사람과 작은 사람 출력  max(), min()
select max(height) from usertbl;
select min(height) from usertbl;

select name, height from usertbl where height in ((select max(height) from usertbl), (select min(height) from usertbl));
select name, max(height) from usertbl;
select name, min(height) from usertbl;

use employees;
select * from employees;

create table testtbl1(id int, fname varchar(50), lname varchar(50));
use sqldb;
insert into testtbl1 select emp_no, first_name, last_name from employees.employees; 
select * from testtbl1;

-- data 수정 : update ~ set ~ ;
select * from testtbl1 where fname='Aamer';
update testtbl1 set lname= '없음' where fname = 'Aamer';

-- buytbl 가격을 1.5배 올리겠다 
select * from buytbl;
update buytbl set price = price * 1.5;
select * from buytbl;

-- buytbl에서 모니터 가격을 50% 할인하라
update buytbl set price = price*0.5 where prodname ='모니터';  
select * from buytbl;

-- 데이터 삭제 : delete ~ (where) 그냥 딜리트하면 다 날아감
-- frame이 'Aamer'인 데이터들을 삭제  
select * from testtbl1 where fname = 'Aamer';
-- delete * from testtbl1; 
delete from testtbl1 where fname = 'Aamer';

-- join 
select * from usertbl;
select * from buytbl;

-- inner join 
select * from buytbl inner join usertbl 
	on buytbl.userid = usertbl.userid;

select * from buytbl b inner join usertbl u
	on b.userid = u.userid;
    
select * from buytbl, usertbl 
	where buytbl.userid = usertbl.userid;
    
select * from buytbl b, usertbl u
	where b.userid = u.userid;
    
-- 조용필이 구매한 제품의 이름과 조용필의 주소를 출력
select name, prodname, addr from buytbl, usertbl where name = '조용필';
	
select prodname, addr from buytbl inner join usertbl 
	on buytbl.userid = usertbl.userid;
    where name = '조용필';

-- 모니터구매한 사람 이름 출력 
select name from buytbl inner join usertbl
	on buytbl.userid = usertbl.userid
    where prodname = '모니터';

-- 전화번호가 없는 고객의 이름, 주소, 구매제품을 출력
select name, addr, prodname from buytbl b inner join usertbl u
	on b.userid = u.userid
    where mobile1= null or mobile2 = null;
    
-- 총 구매금액이 가장 큰 고객정보
select name,sum(amount*price) '총구매금액'
	from buytbl b inner join usertbl u
	on b.userid = u.userid
    group by b.userid
    order by sum(price*amount) desc
    limit 1;
    
-- left join 
select * from buytbl b left join usertbl u
	on b.userid = u.userid;
    
-- right join
select * from buytbl b right join usertbl u
	on b.userid = u.userid;

-- table 3개 join 
create table stdtbl(
	stdname varchar(10) not null primary key,
    addr char(4) not null);
insert into stdtbl values('김범수', '경남'),('성시경','서울'),('조용필','경기'),('은지원','경북'),('바비킴','서울');

select * from stdtbl;

create table clubtbl (
	clubname varchar(10) not null primary key,
    roomno char(4) not null);
    
insert into clubtbl values ('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');
select * from clubtbl; 

create table stdclubtbl ( 
	num int auto_increment not null primary key,
    stdname varchar(10) not null, 
    clubname varchar(10) not null);
insert into stdclubtbl values(null, '김범수','바둑'),(null,'김범수','축구'),(null,'조용필','축구'),(null,'은지원','축구'),(null,'바비킴','봉사');
select * from stdclubtbl;

select * from stdtbl;
select * from clubtbl;
select * from stdclubtbl;

select * from stdtbl inner join stdclubtbl on stdtbl.stdname = stdclubtbl.stdname
					 inner join clubtbl on clubtbl.clubname = stdclubtbl.clubname;

select * from stdtbl s inner join stdclubtbl sc on s.stdname = sc.stdname
					 inner join clubtbl c on c.clubname = sc.clubname;
                     
-- inner join 안쓰고 from 으로도 합칠 수는 있음 
select * from stdtbl, stdclubtbl, clubtbl
	where stdtbl.stdname = stdclubtbl.stdname
	and clubtbl.clubname = stdclubtbl.clubname;
    
select * from stdtbl s, stdclubtbl sc, clubtbl c
	where s.stdname = sc.stdname
	and c.clubname = sc.clubname;

-- 축구부에 가입한 학생의 주소 출력
select addr from stdtbl s, stdclubtbl sc, clubtbl c
	where s.stdname = sc.stdname
	and c.clubname = sc.clubname
    and c.clubname = '축구';  -- merge를 했을 때는 똑같은 컬럼이 두개 합쳐진 것이기 때문에 clubname앞에 어느 테이블에서 가져올지 명시해줘야 함 
    
-- select addr from stdtbl inner join stdclubtbl on stdtbl.stdname = stdclubtbl.stdname
-- 					 	   inner join clubtbl on clubtbl.clubname = stdclubtbl.clubname
--                         c.clubname = '축구';

-- if 구문 / case when 구문
-- procedure() : 함수

drop procedure if exists ifproc3;
-- 있으면 삭제하겠다 
delimiter $$
-- 구분 문자를 $$로 바꿈

create procedure ifproc3() 

begin 
	declare point int;
    declare credit char(1);
    set point = 77;
    
    if point >= 90 then 
		set credit = 'A';
	elseif point >= 80 then
		set credit = 'B';
	elseif point >= 70 then
		set credit = 'C';
	else
		set credit = 'D';
	end if;
        
	select concat('취득학점 : ',point), concat('학점: ', credit);
end $$ 


delimiter ;

call ifproc3(); 
create procedure ifproc3() 

begin 
	declare point int;
    declare credit char(1);
    set point = 77;
    
    case
		when point >= 90 then
			set credit = 'A';
		when point >= 80 then
			set credit = 'B';
		when point >= 70 then
			set credit = 'C';
		else 
			set credit = 'D';
	end case;
        
	select concat('취득학점 : ',point), concat('학점: ', credit);
end $$ 

create procedure ifproc2()
delimiter ;
call ifproc2(); 

select u.userid, u.username, sum(price*amount) as 'total_amount'
	from buytbl b right join usertbl u 
    on b.userid = u.userid
    group by u.userid
    order by total_amount;

-- sql 기본 함수 -- 

-- cast : 데이터 타입 변환 함수 
select cast ('2020-10-16 12:25:29:123' as date) as 'date';
select cast ('2020-10-16 12:25:29:123' as time) as 'Time';
select cast ('2020-10-16 12:25:29:123' as datetime) as 'DateTime';  -- 날짜와 시간이 함께 

-- concat : 이어주는 함수 (주로 문자열) 
use sqldb;
show tables;
select num, concat(cast(price as char(10)),'x',cast(amount as char(10)), '=') as '가격*구매량',
			-- 다 문자열로 바꾼 뒤 이어붙여라 
            price*amount as '총구매금액'
			from buytbl;

select concat('100','200');
-- ws : 첫번재 인자를 구분자로 해서 이어주는 함수 
select concat_ws('/','2020','01','01') as '날짜'; 

-- ifnull(요소1,요소2) : 요소1이 null이면 요소2를 리턴, 요소1이 null이 아니면 요소1을 리턴
-- 모든 값이 null이 아니라고 확신할 수 없을 때 사용 

select ifnull(null, 100);
select ifnull(100,200);

-- insert('문자열1',index, length, '문자열2') : 문자열1의 index위치에 length 길이만큼의 인덱스에 문자열2를 입력
select insert('abcdefghijk', 3, 4, '@@@');

-- left ('문자열', num) : 문자열 왼쪽으로부터 num갯수 만큼 요소 출력
-- right ('문자열', num) : 문자열 오른쪽으로부터 num갯수 만큼 요소 출력
select left ('abcdefghijk', 3);
select right ('abcdefghijk', 3);

-- repeat('문자열',10) : 문자열을 n회 반복
select repeat('abc', 10);

-- lower() : 소문자 변환
select lower('abcdEFG');
select upper('abcdEFG'); -- 대문자

-- lpad('문자열1', num, '@'): 문자열 1을 num크기만큼 자리수를 늘리고 빈 자리를 '@'로 채워라
select lpad('abc', 7, '@'); 
select rpad('abc', 7, '@'); -- right

-- ltrim, rtrim : 좌우 공백제거 
select ltrim('     abc'); -- 왼쪽 공백 제거 
select rtrim('abc     ');

-- replace ('문자열1', '문자열2', '문자열3'): 문자열1에서 문자열2를 찾아서 문자열3으로 변경
select replace('hello mysql', 'mysql', 'python');

-- abs
select abs(-3);

-- ceiling(): 올림, floor(): 내림, round(): 반올림 
select ceiling(4.7);
select floor(4.7);
select round(4.7); 

-- mod : 나머지 계산 modulo
select mod(11,2);

-- sqrt : 제곱근 square root
select sqrt(9);

-- pow :승 - 지수를 뜻하는 단어가 power이기 때문
select pow(2,3);

-- length : 길이
select length('abd');
select length('가나다라'); -- 12byte















