
use bank;
-- 1 단계 조인, 서브쿼리 사용할 필요 없어요 !! 
-- 문제 1. history_tb 에서 계좌 id 1번인 입금 내역 만드시오
SELECT * FROM history_tb where d_account_id =1;

-- 문제 2. history_tb 에서 계좌 id 1번인 출금 내역 만드시오
SELECT * FROM history_tb where w_account_id =1;

-- 문제 3. history_tb 에서 계좌 id 1번인 입출금 쿼리를 만드시오
SELECT * FROM history_tb where w_account_id =1 OR d_account_id=1;


SELECT * FROM user_tb;
SELECT * FROM history_tb;
-- fullname 애기공룡의 계좌id를 뽑아 계좌 입출금 내역을 출력해주세요. 
-- 서브쿼리 사용
SELECT *
FROM history_tb
WHERE d_account_id IN (
	SELECT id
    FROM user_tb
    WHERE fullname = '애기공룡')
OR w_account_id IN (
	SELECT id
    FROM user_tb
    WHERE fullname = '애기공룡');

 
 
