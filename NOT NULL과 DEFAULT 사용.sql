
-- NOT NULL과 DEFAULT 값 사용

DROP TABLE student;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) DEFAULT '미정' NOT NULL
);
desc student;

-- 디폴트 제약을 사용했을 때 값을 넣는 방법 1
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1, 'John', 3, '경영학과'),
    (2, 'Jane', 2, '경영학과'),
    (3, 'Mike', 1, DEFAULT),
    (4, 'David', 2, DEFAULT);
    
SELECT * FROM student;
-- 디폴트 제약을 사용했을 때 값을 넣는 방법 2
INSERT INTO student(student_id, name, grade)
VALUES
	(5, '홍길동1', 2),
    (6, '홍길동2', 3),
    (7, '홍길동3', 1),
    (8, '홍길동4', 3);
    
-- professor 컬럼 제약 사항을 DEFAULT로 추가하고 값은 빈 문자열로 만들어라
CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL, 
    credit INT NOT NULL, 
    department VARCHAR(50) NOT NULL, 
    professor VARCHAR(50) NOT NULL
); 

-- 테이블이 생성되어 있을 때 제약 변경 DEFAULT 구문 추가
ALTER TABLE subject MODIFY professor VARCHAR(30) DEFAULT '' NOT NULL;
desc subject;
