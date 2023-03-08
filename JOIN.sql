CREATE DATABASE shopdb;
USE shopdb;

CREATE TABLE userTBL (
    username CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(13) NOT NULL,
    PRIMARY KEY (username)
);
ALTER TABLE userTBL MODIFY mobile VARCHAR(13);

CREATE TABLE buyTBL (
    username CHAR(3) NOT NULL,
    prodName CHAR(3) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (username) REFERENCES userTBL (username)
);

INSERT INTO userTBL VALUES('이승기', 1987, '서울', '010-1234-1234');
INSERT INTO userTBL VALUES('홍길동', 1911, '부산', '010-2222-3333');
INSERT INTO userTBL VALUES('이순신', 1999, '대구', '010-3333-4444');

INSERT INTO buyTBL VALUES('이승기', '운동화', 50, 1);
INSERT INTO buyTBL VALUES('이승기', '노트북', 150, 1);
INSERT INTO buyTBL VALUES('홍길동', '책', 10, 5);
INSERT INTO buyTBL VALUES('홍길동', '모니터', 200, 2);
INSERT INTO buyTBL VALUES('이순신', '청바지', 40, 1);
INSERT INTO buyTBL VALUES('이순신', '책', 10, 3);

-- 에러 발생
-- 현재 부모 테이블 userTBL에 야스오의 정보가 없어서 insert 할 수 없음
INSERT INTO buyTBL VALUES('야스오', '책', 10, 3);

SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- inner join
SELECT *
FROM userTBL
INNER JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- left join
SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- 야스오 회원가입
INSERT INTO userTBL(username, birthYear, addr, mobile)
VALUES ('야스오', 2020, '부산', '010-1234-5678');

SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username
WHERE buyTBL.username IS NOT NULL;

-- AS (별칭) 사용해서 다시 inner join
SELECT *
FROM userTBL AS U
INNER JOIN buyTBL AS B
ON U.username = B.username;

-- 별칭 사용 left join, left join is not null 작성해보기
SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username;

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE B.username IS NOT NULL;

-- left join 기준 테이블 선정
-- 기준 테이블 선정에 따라 결과 집합이 다를 수 있다.
-- 기준 테이블 선정 기준은 작은 데이터를 기준으로 하는 것이 좋다.
SELECT *
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.username = u.username;

-- right join
SELECT u.username, b.prodName, b.price, b.amount
FROM userTBL AS u
RIGHT JOIN buyTBL AS b
ON u.username = b.username;
 
-- 문제 3개
SELECT * FROM userTBL;
SELECT * FROM buyTBL;
-- 1. 1999년에 태어난 사람의 구매목록 조회
SELECT b.prodName
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE u.birthYear = 1999;
-- 2. 물건을 사지 않은 사람의 주소를 조회
SELECT u.addr
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username
WHERE b.prodName IS NULL;
-- 3. right join
SELECT *
FROM userTBL AS u
RIGHT JOIN buyTBL AS b
ON u.username = b.username;
-- 함수 사용해 보기
SELECT u.username, b.prodName, b.price, b.amount
FROM userTBL AS u
RIGHT JOIN buyTBL AS b
ON u.username = b.username;

-- 1. 성이 이씨이면서 태어난 년도가 1999년인 구매한 아이템 정보를 표시해주세요!
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE u.username LIKE '이%' AND birthYear = 1999;
-- 2. 기준 테이블은 userTBL로 하고 LEFT JOIN을 사용하여 주문자 이름과, 주소, 전화번호, 상품 이름, 가격, 주문 수량 을 출력해보자 (단, 주문 정보가 없는 경우 출력하지 않는다.)
SELECT u.username, u.addr, u.mobile, b.prodName, b.price, b.amount
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username 
WHERE b.prodName IS NOT NULL;
-- 3. LEFT JOIN 을 사용하여 NULL 값도 확인할 수 있게 출력 
SELECT *
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username;
-- 4. userTBL 기준으로 INNER JOIN하고 buyTBL에서 수량이 3개 이상인 데이터만 조회해라
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE b.amount >=3;
-- 5. buyTBL 기준으로 RIGHT JOIN하고 username이 '이승기'이거나 '야스오'이면서 userTBL의 username이 null이 아닌 데이터를 조회해라
SELECT *
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON u.username = b.username
WHERE u.username = '이승기' OR u.username = '야스오' AND u.username IS NOT NULL;
-- 6. 기준 테이블로 buyTBL을 사용해서 LEFT JOIN을 수행하고, 1999년에 태어난 사람은 총 몇 개의 물품을 구매했는지 구하시오.
SELECT SUM(b.amount) AS '구매한 총 수량'
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON u.username = b.username
WHERE u.birthYear = 1999;
-- 7. 기준 테이블로 userTBL을 사용해서 INNER JOIN을 수행하고, '책'을 구매한 사람들의 이름과 전화번호를 출력하시오.
SELECT u.username, u.mobile
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE b.prodName = '책';
-- 8. 기준 테이블로 buyTBL을 사용해서 RIGHT JOIN을 수행하고, '대구'에 사는 사람이 구매한 물품들을 출력하시오.
SELECT b.prodName
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON u.username = b.username
WHERE u.addr = '대구';

