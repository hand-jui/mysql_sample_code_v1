
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
CREATE TABLE category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- 제약 변경하기
ALTER TABLE TodoList ADD COLUMN category_id INT,
ADD CONSTRAINT fk_category FOREIGN KEY(category_id) REFERENCES Category(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

SELECT * FROM category;
DESC category;
-- Category 샘플 데이터
INSERT INTO Category(name) VALUE('운동');
INSERT INTO Category(name) VALUE('공부');
INSERT INTO Category(name) VALUE('연애');
INSERT INTO Category(name) VALUE('집안일');

UPDATE category SET name = '헬스' WHERE id = 1;

DELETE FROM category WHERE id = 6;

SELECT * FROM TodoList;
DESC TodoList;

-- TodoList 샘플 데이터
INSERT INTO TodoList(title, description, priority, completed, category_id) VALUES("자바", "내가 씹어먹음", 1, 0, 7);

UPDATE TodoList SET title = '자바', description = '내가 이김', priority = 1, completed = 0, createdAt = '', category_id = 7 WHERE id = 2;

DELETE FROM TodoList WHERE id = 1;