
-- 1. 학생 테이블 생성
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    grade INT NOT NULL,
	email VARCHAR(50),
    address VARCHAR(100) NOT NULL
);
desc student;

-- 2. 상품 테이블 생성 하고 데이터 입력 쿼리 구문 작성  
CREATE TABLE product(
	number INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(20) NOT NULL,
    price INT NOT NULL
);

INSERT INTO product(product_name, price)
VALUES 
	('텀블러', 33000),
	('핸드크림', 5000),
    ('마스크', 3000),
    ('이어폰', 25000);

SELECT * FROM product;

-- 3. 상품 테이블과 1:N 관계를 가지는 구매 테이블을 생성
CREATE TABLE purchase(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	product_number INT NOT NULL,
	quantity INT,
    FOREIGN KEY(product_number) REFERENCES product(number)
);
desc product;
desc purchase;

-- 4. 구매 테이블에 데이터를 입력
INSERT INTO purchase(name, product_number, quantity)
VALUES
	('홍길동', 1, 3),
    ('홍길동', 3, 2),
    ('이순신', 2, 4),
    ('유관순', 4, 1),
    ('이순신', 1, 1);
    
SELECT * from product;
SELECT * from purchase;

-- 5. Inner join 구문을 사용해서 결과 집합 출력하기
select *, (product.price * purchase.quantity) as '총금액'
from purchase
inner join product
on product.number = purchase.product_number;

drop table product;
drop table purchase;
