CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    professor VARCHAR(50) NOT NULL
);
-- Error Code: 3734. Failed to add the foreign key constraint. Missing column 'student_id' for constraint 'enrollment_ibfk_1' in the referenced table 'student'

CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(subject_id ) REFERENCES subject(subject_id)
);

drop table student;
drop table subject;
drop table enrollment;

-- 한 사람이 여러 개의 도시에서 여러 번 여행을 다녀온 경우를 테이블로 구축
-- 여기서 사람, 도시의 관계를 관계차수로 표현
-- 한 사람이 여러 도시를 방문하고, 한 도시에 여러 사람이 방문
-- person, city, travel

CREATE TABLE person(
	person_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE city(
	city_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 중간 테이블 만들기
CREATE TABLE travel (
    person_id INT,
    city_id INT,
    trip_date DATE,
    PRIMARY KEY(person_id, city_id, trip_date),
    FOREIGN KEY(person_id) REFERENCES person(person_id),
    FOREIGN KEY(city_id) REFERENCES city(city_id)
);

INSERT INTO person VALUES
	(1, '김영희'),
	(2, '박철수'),
	(3, '이민호'),
	(4, '한지민'),
	(5, '송혜교');
    
INSERT INTO city VALUES
	(1, '서울'),
	(2, '부산'),
	(3, '제주'),
	(4, '홍콩'),
	(5, '도쿄');
    
INSERT INTO travel VALUES
	(1, 1, 20220710),
	(1, 2, 20220710),
	(2, 5, 20220710),
	(2, 4, 20220710),
	(3, 3, 20220710),
	(4, 5, 20220710),
	(1, 4, 20220710);
    
SELECT * FROM travel;

-- 문제 join 구문을 활용해서 누가 어디 방문했는지 뮨제 2개

-- 1. 도쿄를 여행한 사람은
SELECT person.name
FROM travel
INNER JOIN person
ON travel.person_id = person.person_id
INNER JOIN city 
ON city.city_id = travel.city_id
where city.name = '도쿄';

-- 송혜교가 여행한 나라는
SELECT city.name
FROM travel
INNER JOIN person
ON travel.person_id = person.person_id
INNER JOIN city 
ON city.city_id = travel.city_id
where person.name = '송혜교';


