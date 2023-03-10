

SELECT * FROM buyTBL;
SELECT * FROM userTBL;

desc userTBL;
desc buyTBL;

INSERT INTO userTBL(usernamusertble, birthYear, addr, mobile)
VALUES ('티모', '2000', '대구' '010-1234-1234');

INSERT INTO buyTBL(username, prodName, price, amount)
VALUES ('홍길동','텀블러',50,1);

UPDATE buyTBL
SET prodName = '컴퓨터', price = 3, amount = 5
WHERE username = '홍길동' AND prodName = 'sss';


UPDATE userTBL 
SET birthYear = '1995', addr = '천안', mobile = '010-2222-2222'
WHERE username = '야스오2';

DELETE FROM userTBL WHERE username = '티모2';

DELETE FROM buyTBL WHERE username = '홍길동' AND prodName = ' ';