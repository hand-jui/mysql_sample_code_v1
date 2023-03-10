-- 고객 주문 목록  --? 1:N
-- 홍길동 --> 신발, 홍길동
--       --> 컴퓨터, 홍길동

-- 고객, 상품정보, 주문목록 --> N:M --> 중간 테이블 주문 목록
-- 주문  --   1(홍길동),1(신발), '일자'

-- 테이블 설계
-- 고객, 상품, 주문 목록
CREATE TABLE customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE goods(
	goods_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE orderList(
	customer_id INT,
    goods_id INT,
    quantity INT,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(goods_id) REFERENCES goods(goods_id)
);