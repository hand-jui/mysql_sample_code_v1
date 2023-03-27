
-- DDL(Data Definition Language)
CREATE DATABASE todo;
USE todo;

-- 1:N 관계(카테고리 : 할일목록)
-- 할일 목록 테이블(자식 테이블)
-- id, 제목, 내용, 우선순위, 완료 여부, 생성일
CREATE TABLE TodoList (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    priority INT NOT NULL DEFAULT 0,
    completed TINYINT NOT NULL DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 카테고리 테이블(부모 테이블)
-- id, 이름
CREATE TABLE Category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- 제약 변경하기
ALTER TABLE TodoList ADD COLUMN category_id INT,
ADD CONSTRAINT fk_category FOREIGN KEY(category_id) REFERENCES Category(id)
ON UPDATE CASCADE
ON DELETE CASCADE;



