
-- 1단계

select * from history_tb;
-- 1 -> 1111
-- 1번 계좌의 출금 내역
select * from history_tb where w_account_id = 1;

-- 1번 계좌의 입금 내역
select * from history_tb where d_account_id = 1;

-- 1번 계좌 입금 내역 + 계좌 번호 정보까지 결과 집합 만들기
select h.id, h.amount, h.d_balance, a.number, h.created_at
from history_tb as h
inner join account_tb as a
on h.d_account_id = a.id
where h.d_account_id = 1;

-- 1번 계좌의 출금 내역
SELECT h.id, h.amount, h.w_balance, a.number, h.created_at
from history_tb as h
inner join account_tb as a
on h.w_account_id = a.id
where h.w_account_id = 1;






