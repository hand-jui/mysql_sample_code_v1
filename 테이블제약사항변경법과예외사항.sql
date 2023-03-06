
desc student;


CREATE TABLE student(
	student_id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	grade INT NOT NULL,
	major VARCHAR(50)
);
-- 이미 생성된 테이블 제약 사항 변경하기
ALTER TABLE student MODIFY grade INT NULL;
desc student;

INSERT INTO student(student_id, name, major)
VALUES (1, '홍길동', '검술학과');

-- grade 제약을 NOT NULL로 변경
-- 테이블 값이 NULL로 하나 들어가 있는 상태  --> 무결성 위배
ALTER TABLE student MODIFY grade INT NOT NULL;

SELECT * FROM student;
-- 하나의 행을 삭제하는 쿼리 - WHERE절(조건절)
DELETE FROM student WHERE student_id = 1;

-- major 컬럼 제약을 NOT NULL로 변경
ALTER TABLE student MODIFY major VARCHAR(50) NOT NULL;

-- 컬럼 선언 부분은 생략 가능. 단, 값을 전부 넣으려고 하는 상황일 때
INSERT INTO student VALUES(2, '홍길동2', 3, '검술학과');
SELECT * FROM student;

-- insert 구문 컬럼명 선언 방식
-- 1. 전부 작성하는 방법
-- 2. 제약 사항이 null인 열이 있다면 넣고 싶은 열만 지정해서 구문을 작성할 수 있다.
-- 3. 전부 데이터를 넣는 상황이라면 컬럼 선언부분을 생략 가능하다.
