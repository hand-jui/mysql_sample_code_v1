CREATE TABLE school(
	school_id INT PRIMARY KEY,
    school_name VARCHAR(20) NOT NULL,
    city VARCHAR(20)
);

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    grade VARCHAR(3) NOT NULL,
    school_id INT,
    FOREIGN KEY(school_id) REFERENCES school(school_id)
);

INSERT INTO school(school_id, school_name, city)
VALUES  (1,'서울대학교','서울'),
		(2,'고려대학교','서울'),
		(3,'연세대학교','서울'),
		(4,'한양대학교','서울');
        
SELECT * FROM school;

INSERT INTO student(student_id, student_name, grade, school_id)
VALUES
	(1,'홍길동', '1학년', 1),
	(2,'김유신', '2학년', 2),
	(3,'이순신', '1학년', 3),
	(4,'유관순', '3학년', 1),
	(5,'안중근', '2학년', 4);
    
-- 제약 키(FK)를 사용하게 된다면 여러가지 제약 사항이 생기게 된다.
SELECT * FROM student;

INSERT INTO student(student_id, student_name, grade, school_id)
VALUE (6, '야수오', '1학년', 10);

-- 야구 팀과 야구 선수 관계 1:N

CREATE TABLE team(
	id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) NOT NULL
);

CREATE TABLE player(
	player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(50) NOT NULL,
    team_id INT,
    FOREIGN KEY(team_id) REFERENCES team(id)
);

INSERT INTO team(team_name)
VALUES
	('LG 트윈스'),
	('NC 다이노스'),
	('두산 베어스');
SELECT * FROM team;

INSERT INTO player(player_name, team_id)
VALUES
	('허경민', 1),
	('김하성', 2),
	('최원준', 3);
SELECT * FROM player;

CREATE TABLE department(
	id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employee2(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES department(id)
);

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE `order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES product(id)
);

desc school;
desc student;
desc team;
