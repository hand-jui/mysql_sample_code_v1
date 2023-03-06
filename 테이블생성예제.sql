-- 데이터 베이스 생성
-- create database <데이터베이스 이름>
CREATE DATABASE mydb;

-- DB를 사용하려면 사용한다고 명령어를 실행해야 한다. 
use mydb;
-- 테이블 생성시, SQL 작성시 어떤 DB 사용해야 하는지 선택해야 한다.

-- 테이블 생성
CREATE TABLE student (
    student_id INT,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL
);

select * from student;
desc student;

-- 과목 테이블 생성하기
CREATE TABLE subject (
    subject_id INT,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(50),
    professor VARCHAR(50) NOT NULL
);

SELECT * FROM subject;
desc subject;

desc student;
-- 이미 생성된 테이블에 기본 키 추가 하는 쿼리 사용방법
ALTER TABLE student ADD PRIMARY KEY(student_id);
-- 사전기반지식 : 특정 컬럼을 기본키로 만들게 되면 중복된 데이터를 허용 못하고
-- NULL 값이 있어서는 안됨

-- 먼저 쿼리구문 작성해보기
-- subject 테이블에 PK 추가 대상 - subject_id
-- 제약 확인
ALTER TABLE subject ADD PRIMARY KEY(subject_id);
desc subject;

-- 생성될 시점에 테이블 생성 명령어를 보여줘
SHOW CREATE TABLE student;

-- 테이블을 삭제하는 명령어 확인
DROP TABLE student;
DROP TABLE subject;

-- 학생 테이블 생성 PK 추가
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL
);
desc student;

CREATE TABLE subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(10) NOT NULL,
    professor VARCHAR(20) NOT NULL
);
desc subject;

-- 도전과제1
CREATE TABLE employee (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    age INT,
    department VARCHAR(20) NOT NULL
);
desc employee;

-- 도전과제2
CREATE TABLE customer (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(30),
    address VARCHAR(50) NOT NULL
);
desc customer;

-- 실습1
-- data type : TEXT, DECIMAL에 대해 이해
CREATE TABLE product (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10 , 2 ) NOT NULL,
    description TEXT
);
desc product;

-- 'order' 예약어로 테이블 이름을 선점할 수 없다.
-- 하지만 강제적으로 ``작은 따옴표를 사용해서 테이블 이름이라고 명시할 수 있다.
CREATE TABLE `order` (
    id INT PRIMARY KEY,
    customer_order VARCHAR(50),
    product_name VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);

-- 도전과제3
CREATE TABLE beverage (
    name VARCHAR(20) PRIMARY KEY,
    price DECIMAL(5 , 2 ) NOT NULL,
    ingredients TEXT NOT NULL,
    flavor VARCHAR(50),
    use_by_date DATE NOT NULL
);
desc beverage;

