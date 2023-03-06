
-- 데이터 저장 (한줄 주석)
/*
여러줄 주석
*/

-- DROP TABLE student;
-- DROP TABLE subject;
-- DROP TABLE product;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50)
);

-- 기본 문구 모양
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2, ..) VALUES (값1, 값2);
INSERT INTO student(student_id, name, grade, major)
VALUES (1, '홍길동', 3, '컴퓨터공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (2, '김철수', 4, '전자공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (3, '이영희', 2, '경영학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (4, '티모', 1, '롤학과');

-- 테이블의 데이터를 삭제하는 명령어 사용해보기
DELETE FROM student;  -- 테이블 안에 있는 데이터만 삭제하는 명령어이다.

-- 복수형으로 INSERT 쿼리문 작성하기
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1001, '김철수', 2, '컴퓨터공학과'),
    (1002, '이영희', 3, '수학과'),
    (1003, '박만수', 1, '전자공학과');
    
-- 복수형으로 데이터 3행 입력 단 VALUE로 사용
INSERT INTO student(student_id, name, grade, major)
VALUE
	(1004, '김미애', 3, '금융학과'),
    (1005, '이오송', 4, '기계공학과'),
    (1006, '박도손', 4, '전자물리학과');

-- INSERT 구문에서 복수행 쿼리를 실행할 때 하나라도 오류가 있으면
-- 데이터는 정상 저장되지 않는다.    
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1007, '김철수3', 2, '컴퓨터공학과'),
    (1008, '이영희3', 3, '수학과'),
    (1008, '박만수3', 1, '전자공학과');
SELECT * FROM student;

-- 실습 1
desc employee;
INSERT INTO employee(id, name, age, department)
VALUES 
	('1', '김도송', 28, '인사'),
    ('2', '이채체', 29, '경영지원'),
    ('3', '박오손', 29, '마케팅'),
    ('4', '김로즈', 26, '연구'),
    ('5', '윤마리', 31, '마케팅');
SELECT * FROM employee;
desc customer;
INSERT INTO customer(id, name, email, address)
VALUES
	('1234', 'Tim', 'tim12@mail.com', '부산광역시'),
    ('1235', 'Mary', 'maarrry@mail.com', '수원시'),
    ('1236', 'Bob', 'bobbobdirara@mail.com', '전라도 해남'),
    ('1237', 'Glory', 'coolparkyeonjin@mail.com', '세명시'),
    ('1238', 'Ever', 'everland@mail.com', '경기도 용인');
SELECT * FROM customer;