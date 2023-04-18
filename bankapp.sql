CREATE DATABASE bank;
use bank;

-- user 테이블 설계해 보기
CREATE TABLE user_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) not null UNIQUE,
    password VARCHAR(30) not null,
    fullname VARCHAR(50) not null,
    created_at TIMESTAMP not null DEFAULT NOW()
);

-- 사용자의 계좌 정보 테이블 설계
CREATE TABLE account_tb(
	id int AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(30) not null UNIQUE,
    password VARCHAR(20) not null,
    balance BIGINT not null COMMENT '계좌 잔액',
    user_id int,
    created_at TIMESTAMP not null DEFAULT now()    
);

-- 입금 내역 저장
-- 출금 내역 저장
-- 사용자 간의 이체 내역 저장

-- 사용자들 history 테이블 설계
-- bigint -> 8바이트 크기의 정수형
-- 조(10의 12승)  -- 경(10의 16승)  -- 해(10의 20승)
-- 자(10의 24승)  -- 양(10의 28승)
CREATE TABLE history_tb(
	id  int AUTO_INCREMENT PRIMARY KEY COMMENT '거래 내역 ID',
    amount BIGINT not null comment '거래 금액',
    w_account_id int comment '출금 계좌 ID',
    d_account_id int comment '입금 계좌 ID',
    w_balance BIGINT comment '출금 요청된 계좌의 잔액',
    d_balance BIGINT comment '입금 요청된 계좌의 잔액',
    created_at TIMESTAMP not null DEFAULT now()
);

-- user 샘플 데이터 
INSERT INTO user_tb(username, password, fullname, created_at)
values('길동', '1234', '고', now());
INSERT INTO user_tb(username, password, fullname, created_at)
values('둘리', '1234', '애기공룡', now());
INSERT INTO user_tb(username, password, fullname, created_at)
values('콜', '1234', '마이', now());

SELECT * from user_tb;

-- 계좌 테이블 샘플 데이터 
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('1111', '1234', 900, 1, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('2222', '1234', 1100, 2, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('333', '1234', 0, 3, now());

SELECT * from account_tb;

-- history 추적 내용 (이체, 입금, 출금)
-- history 테이블에 이체 내역을 기록 (1번 계좌가 2번 계좌에 100원을 이체 한다)
INSERT INTO history_tb(amount, w_balance, d_balance, w_account_id, d_account_id, created_at)
values(100, 900, 1100, 1, 2, now());

-- 출금 내역(1번계좌에서 100원을 출금 처리)
INSERT INTO history_tb(amount, w_balance, d_balance, w_account_id, d_account_id, created_at)
values(100, 800, null, 1, null, now());

-- 입금 내역(1번계좌에 500원 입금 처리)
INSERT INTO history_tb(amount, w_balance, d_balance, w_account_id, d_account_id, created_at)
values(500, null, 700, null, 1, now());

-- 3번 마이콜 0원
-- 출금 내역(3번이  1000원 출금, 잔액 0원인 상태를 거래내역 기록)
INSERT INTO history_tb(amount, w_balance, d_balance, w_account_id, d_account_id, created_at)
values(1000, 1000, null, 3, null, now());


SELECT * from history_tb;

DELETE FROM history_tb;
-- 1부터 다시 시작
ALTER TABLE history_tb AUTO_INCREMENT = 1;