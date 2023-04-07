
/*
	서브 쿼리란 - 쿼리 안에 쿼리가 있다.
    : 서브쿼리는 쿼리의 위치가 어디에 있느냐에 따라 세가지 종류로 나눌 수 있다.
    
    1. 중첩 서브쿼리(Nested Subquery) : WHERE 절에 사용하는 서브 쿼리
    2. 인라인 뷰(Inline View) : FROM 절에 사용하는 서브 쿼리
	3. 스칼라 서브쿼리(Scalar Subquery) : SELECT 절에 사용하는 서브 쿼리
    
    : 내부쿼리는 괄호로 반드시 감싸져 있어야 한다.
*/

-- db 생성 
create database reservationdb;
use reservationdb;

-- 예약 테이블 생성 
create table reservation(
	id int auto_increment, 
    name varchar(20) not null, 
    reserveDate date not null, 
    roomNum varchar(5) not null,
    primary key(id)
);

-- 고객 테이블 
create table customer(
	id int auto_increment, 
    name varchar(20) not null, 
    age int not null, 
    address varchar(10), 
    primary key(id)
);



-- 예약 테이블 데이터 생성 
insert into reservation values(1, '홍길동', '2020-04-01 00:00:00', 1);
insert into reservation values(2, '임꺽정', '2020-04-02 00:00:00', 2);
insert into reservation values(3, '장길산', '2020-04-03 00:00:00', 3);
insert into reservation values(4, '홍길동', '2020-04-04 00:00:00', 4);

-- 데이터 확인 
select * from reservation;

-- 데이터 수정 
update reservation set roomNum = '1001' where id = 1; 
update reservation set roomNum = '1002' where id = 2; 
update reservation set roomNum = '1003' where id = 3; 
update reservation set roomNum = '1004' where id = 4; 

-- 고객 테이블 데이터 생성 
select * from customer;

-- 고객 테이블 데이터 생성
insert into customer values(1, '홍길동', 20, '서울');
insert into customer values(2, '임꺽정', 30, '서울');
insert into customer values(3, '장길산', 24, '서울');
insert into customer values(4, '전우치', 33, '서울');


-- 고객 테이블 데이터 수정 
update customer set address = '인천' where id = 2;
update customer set address = '서울' where id = 3;
update customer set address = '수원' where id = 4;

select * from customer;

