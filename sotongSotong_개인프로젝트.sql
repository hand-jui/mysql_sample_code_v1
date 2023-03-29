CREATE DATABASE board;

use noticedb;

CREATE TABLE noticeBoard(
	no INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    nickname VARCHAR(15) NOT NULL,
    password VARCHAR(10)
);

SELECT * FROM noticeboard where no = ?;

SELECT no, title, nickname
FROM noticeBoard;

INSERT INTO noticeBoard(title, content, nickname, password)
VALUE ("" ,"","","");

UPDATE noticeBoard
SET title = "" , content=""
WHERE nickname = "" AND password ="" ;

DELETE FROM noticeBoard WHERE nickname="" AND password = "";

drop DATABASE noticedb;