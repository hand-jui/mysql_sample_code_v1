
select * from customer;
select * from reservation;

-- 주소가 서울인 고객이 예약한 예약 정보만을 뽑아 주세요
SELECT id, reserveDate, roomNum, name
FROM reservation
WHERE name in( SELECT name from customer where address = '서울');

-- JOIN을 사용해서 주소가 서울인 고객이 예약한 예약 정보만을 뽑아 주세요
SELECT reservation.id, reservation.reserveDate, reservation.roomNum, reservation.name
FROM reservation
JOIN customer
ON reservation.name = customer.name
WHERE customer.address = '서울';

-- FROM 절 서브 쿼리
SELECT name, reservedRoom
FROM (
	SELECT name, reserveDate, (roomNum) as reservedRoom
    FROM reservation
    WHERE roomNum > 1001
) as reservationInfo; 

/*
	서브쿼리의 특징
    서브쿼리를 사용하면 다음과 같은 장점을 얻을 수 있다.
    
    1. 서브쿼리를 사용하면 쿼리를 구조화시키므로, 쿼리의 각 부분을 명확히 구분할 수 있게 해준다.
    2. 서브쿼리는 복잡한 join 이나 union 과 같은 동작을 수행할 수 있는 또 다른 방법을 제공한다.
    3. 서브쿼리는 읽기 편하다.
    
    !. 스칼라 서브쿼리는 가능한 사용하지 말자
*/

-- 서브쿼리를 이용해 보자 (중첩)
-- 2020-04-02 예약정보 확인
SELECT *
FROM reservation
WHERE reserveDate = '2020-04-02';

-- 2020-04-02 일자로 예약한 고객의 id와 이름 조회하기
SELECT id, name
FROM (
	SELECT *
	FROM reservation 
	WHERE reserveDate = '2020-04-02') as reserve;


-- 고객테이블에서 실제 예약한 고객 중 30살 이상인 고객 id, 이름, 나이, 주소, 예약일, 예약한 방 정보 출력
SELECT id, name, age, address, reserveDate, roomNum
FROM customer AS c
JOIN reservation
