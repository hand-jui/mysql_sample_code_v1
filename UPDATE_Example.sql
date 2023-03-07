CREATE TABLE member(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(100) NOT NULL    
);

INSERT INTO member (name, email, phone, address)
VALUES 
	('홍길동', 'hong@test.com', '010-1234-5678', '서울시 강남구'),
	('김영희', 'kim@test.com', '010-2345-6789', '서울시 서초구'),
	('이철수', 'lee@test.com', '010-3456-7890', '서울시 종로구'),
	('박민지', 'park@test.com', '010-4567-8901', '서울시 마포구'),
	('최재영', 'choi@test.com', '010-5678-9012', '서울시 강서구'),
	('강영식', 'kang@test.com', '010-6789-0123', '서울시 송파구');

UPDATE member
SET address = '서울시 중구'
WHERE name = '이철수';

INSERT INTO member (name, email, phone, address)
VALUES 
	('홍길동2', 'hong@test.com', '010-1234-5678', '서울시 강남구');

-- id가 7인 회원의 이름과 전화번호를 각각 '임성준', '010-9876-5432'로 수정
UPDATE member
SET name = '임성준', phone = '010-9876-5432'
where id = 7;
-- id가 9인 회원의 이메일과 주소를 각각 'leejaehyun@test.com', '서울시 강서구'로 수정
SELECT * FROM member;

-- 도전 과제   1 
CREATE TABLE movie(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    director VARCHAR(30) NOT NULL,
    release_date DATE NOT NULL,
    genre VARCHAR(30) NOT NULL,
    rating DECIMAL(3,2) NOT NULL
);

-- 도전 과제   2
INSERT INTO movie(title, director, release_date, genre, rating)
values
	('괴물','봉준호',20060727,'드라마',8.28),
	('극한직업','이병현',20190123,'코미디',9.20),
	('명량','김한민',20140730,'사극',9.17),
	('신과함께-죄와 벌','김용화',20171220,'판타지',7.56),
	('밀양','임권택',20160907,'드라마',7.76),
	('반도','연상호',20200715,'액션',6.71),
	('베테랑','류승완',20150805,'액션',8.49),
	('변호인','양우석',20131218,'드라마',8.41),
	('군함도','류승완',20170726,'사극',8.01),
	('암살','최동훈',20150722,'액션',8.37);
    
-- 도전 과제   3
-- 1. 
    select * from movie;