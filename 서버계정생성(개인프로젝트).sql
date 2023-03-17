-- 서버 프로그램 구현 -MySQL <-- 서버

-- blog
CREATE DATABASE noticedb;
USE noticedb;

-- 사용자 생성
CREATE USER 'juispro'@'%' IDENTIFIED BY '14148288';
--  사용자 기본 권한 조회
-- DB를 선택
use mysql;
SELECT user, host from user;

-- '%' 어디서든지 접근 가능한 권한(IP주소 개념)
SELECT * FROM user where user = 'juispro';
GRANT ALL PRIVILEGES ON *.* TO 'juispro'@'%';
-- 방금 권한 변경을 즉시 적용하려면 한가지 명령어를 더 해야 한다.
FLUSH PRIVILEGES;

