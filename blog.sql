create database juiblog;
use juiblog;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20),
    createDate TIMESTAMP
);
SELECT * FROM user;

-- 블로그 사이트
CREATE TABLE blog(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT null,
    content BLOB, -- 대용량 데이터 타입 blob
	readCount INT DEFAULT 0,
    userId INT,
    FOREIGN KEY(userId) REFERENCES user(id)
);
select * from blog;
-- user : board -> 1:N

-- 댓글 테이블 만들기
CREATE TABLE reply (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(300) NOT NULL,
    createDate TIMESTAMP,
    boardId INT,
    userId INT,
    FOREIGN KEY (boardId) REFERENCES board (id),
    FOREIGN KEY (userId) REFERENCES board (id)
    );
select * from reply;
-- user : reply -> 1:N
-- board : reply -> 1:N

SELECT now();

-- 회원가입
INSERT INTO user(username, password, email, address, userRole, createDate)
VALUES('김오송', '1414', 'osdscc@naver.com', '부산시 사하구', 'USER', now());

DELETE FROM user WHERE username = '김오송' AND password = '1234';
SELECT * FROM user;


-- username과 password가 일치하는 사용자 찾아보기
SELECT *
FROM user
WHERE username = '김오송' AND password = '1414';


SELECT * FROM board;

INSERT INTO board(title, content, userId)
VALUES ('첫글','자바는 엉려어',4);

ALTER TABLE board MODIFY content TEXT;

DELETE FROM board WHERE id = 4;
