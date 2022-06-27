

-- 제약 조건 constraints
/*
primary key : not null, unique한 데이터로 구성 - 모든 데이터를 구분할 수 있는 칼럼 값(id...)
not null : 해당 칼럼에 null값이 없어야 함. null - null 값 허용 (초기값)
default 값 : 해당 칼럼에 default값을 지정 해당 칼럼에 값을 입력하지 않으면 default값이 자동 입력됨 
unique : 해당 칼럼의 값들은 중복 값을 가지지 못한다
foreign key(외래키) : 두 개의 테이블을 연결해서 데이터의 일치성을 유지 
*/

drop database if exists tabledb;
create database tabledb;
use tabledb;

drop table if exists usertbl, buytbl;

create table usertbl(
	userid char(8) not null primary key, 
    username varchar(10) not null,
    birthyear int not null,
    addr char(2) not null,
    mobile1 char(3),
    mobile2 char(8),
    height smallint,
    mdate date,
    constraint primary key pk_userid (userid));
    
drop table if exists buytbl;    
create table buytbl(
	num int not null primary key,
    userid char(8) not null, 
    prodname char(6) not null,
    groupName char(4) null,
    price int not null,
    amount smallint not null,  
    foreign key(userid) references usertbl(userid)); -- usertbl usesrid를 참조해서 외래키 생성 
    
insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-07-07');
insert into usertbl values('KBS', '김범수', 1979, '경남', '011', '11111111', 173, '2008-07-07');
insert into usertbl values('KKH', '김경호', 1971, '전남', '011', '11111111', 177, '2008-07-07');

select * from usertbl;
desc usertbl;
select * from usertbl;

insert into buytbl values(null, 'JYP', '모니터', '전자', 200, 1);
insert into buytbl values(null, 'KBS', '노트북', '전자', 1000, 1);
insert into buytbl values(null, 'KBS', '운동화', '스포츠', 30, 2);

desc buytbl;
select * from buytbl;















