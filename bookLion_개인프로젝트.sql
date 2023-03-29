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