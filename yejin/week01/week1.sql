-- 7장
select mem_id, mem_name, debut_date
from member
order by debut_date;

select mem_id, mem_name, debut_date
from member
order by debut_date desc;

select mem_id, mem_name, debut_date, height
from member
where height>=164
order by height desc;

select mem_id, mem_name, debut_date, height
from member
where height >= 164
order by height desc, debut_date asc;

select *
from member
limit 3;

select mem_name, debut_date
from member
order by debut_date
limit 3;

select mem_name, height
from member
order by height desc
limit 3,2;

select addr from member;

select addr from member order by addr;

select distinct addr from member;

select mem_id, amount from buy order by mem_id;

select mem_id "회원 아이디", sum(price*amount) "총 구매 개수"
from buy
group by mem_id;

select avg(amount) "평균 구매 개수" from buy;

select mem_id, avg(amount) "평균 구매 개수"
from buy 
group by mem_id;

select count(*) from member;

select count(phone1) "연락처가 있는 회원" from member;

select mem_id "회원 아이디", sum(price*amount) "총 구매 개수"
from buy
group by mem_id;

select mem_id "회원 아이디", sum(price*amount) "총 구매 금액"
from buy 
group by mem_id
having sum(price*amount) > 1000;

select mem_id "회원 아이디", sum(price*amount) "총 구매 금액"
from buy
group by mem_id
having sum(price*amount) > 1000
order by sum(price*amount) desc;


-- 8장
create table hongong2(
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int);
    
insert into hongong2 values(null,'V',25);
insert into hongong2 values(null,'수빈',23);
select * from hongong2;

select last_insert_id();

alter table hongong2 auto_increment=100;
insert into hongong2 values(null,'선우',22);

create table hongong3(
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int);
alter table hongong3 auto_increment=1000;
set @@auto_increment_increment=3;

insert into hongong3 values(null,'진',25);
insert into hongong3 values(null,'휴닝카이',23);
select * from hongong3;

select count(*) from world.city;

desc world.city;

create table city_popul(city_name char(35), population int);

insert into city_popul
	select name, population from world.city;

select * from city_popul;

update city_popul set city_name='서울' where city_name='Seoul';
select * from city_popul where city_name = '서울';

update city_popul set population = population / 10000;
select * from city_popul limit 5;

delete from city_popul
where city_name like 'New%'
limit 5;


-- 10장
select * from buy
inner join member
on buy.mem_id = member.mem_id
where buy.mem_id = 'GRL';

select *
from buy
inner join member
on buy.mem_id = member.mem_id;

select buy.mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) as '연락처'
from buy
inner join member
on buy.mem_id = member.mem_id;

select M.mem_id, M.mem_name, B.prod_name, M.addr
from member M
left outer join buy B
on M.mem_id = B.mem_id
order by M.mem_id;

select M.mem_id, M.mem_name, B.prod_name, M.addr
from buy B
right outer join member M
on M.mem_id = B.mem_id
order by M.mem_id;

select *
from buy
cross join member;

select count(*) "데이터 개수"
from sakila.inventory
cross join world.city;

create table cross_table
select count(*)
from sakila.actor
cross join world.country;

select * from cross_table limit 5;

select A.emp "직원", B.emp "직속상관", B.phone "직속상관연착처"
from emp_table A
inner join emp_table B
on A.manager = B.emp
where A.emp = "경리부장";

-- 12장
create database naver_db;

-- 14장
create view v_member as
select mem_id, mem_name, addr from member;

select * from v_member;

select mem_name, addr from v_member
where addr in('서울','경기');

create view v_viewtest1 as
select B.mem_id 'Member ID', M.mem_name as 'Member Name',
B.prod_name "Product Name", CONCAT(M.phone1, M.phone2) as "Office Phone"
from buy B
inner join member M
ON B.mem_id = M.mem_id;

select distinct `Member ID`, `Member Name` from v_viewtest1;

create or replace view v_viewtest2 as
select mem_id, mem_name, addr from member;

describe v_viewtest2;
describe member;

show create view v_viewtest2;

create view v_height167 as
select * from member where height >= 167;

delete from v_height167 where height < 167;

insert into v_height167 values('TRA','티아라',6,'서울',null,null,159,'2005-01-01');

select * from v_height167;

alter view v_height167 as 
select * from member where height >= 167
with check option;

drop table if exists buy, member;

select * from v_height167;

check table v_height167;