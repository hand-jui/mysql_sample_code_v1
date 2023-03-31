CREATE DATABASE BookLion;
use BookLion;

CREATE TABLE user(
	no INT PRIMARY KEY AUTO_INCREMENT,
    id VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(200),
	phone VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    birth DATE,
    account VARCHAR(20) NOT NULL
);
drop table user;

SELECT * FROM user;

INSERT INTO user(id, password, name, address, phone, email, birth, account)
VALUE("jui", "8282", "손주이", "부산시 사상구", "010-6812-3812", "jui@hand.com",19950806,3333095857531);

UPDATE user SET password = '9586', address = '부산시 사상구', phone='',email='',account='' WHERE id = '' AND password = '';

DELETE FROM user WHERE id = '' AND password = '';

drop table booklist;
CREATE TABLE booklist(
	id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(10) NOT NULL,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(10) NOT NULL,
    publisher VARCHAR(10) NOT NULL,
    pubdate DATE NOT NULL,
    price INT NOT NULL,
    sale INT NOT NULL,
    quantity INT NOT NULL
);
SELECT * FROM booklist;

INSERT INTO booklist(category, title, author, publisher, pubdate, price, sale, quantity)
VALUE ("","이노의 가르침", "세이노", "데이원", 20230302, 6480, 1,20);

UPDATE booklist SET sale = '', quantity = '' WHERE title = '';
