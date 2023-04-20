
-- 입금 내역 : 쿼리 결정
select h.id, h.amount, h.d_balance as balance, h.created_at,
		ifnull(wa.number, 'ATM') as sender, da.number as receiver
from history_tb as h
left join account_tb as da
on h.d_account_id = da.id
left join account_tb as wa
on h.w_account_id = wa.id
where h.d_account_id = 2;

-- 출금 내역
select h.id, h.amount, h.w_balance as balance, h.created_at,
		ifnull(da.number, 'ATM') as receiver,
        wa.number as sender
from history_tb as h
left join account_tb as wa
on h.w_account_id = wa.id
left join account_tb as da
on h.d_account_id = da.id
where h.w_account_id = 1;

-- CASE WHEN THEN END
-- ----------------------------------------
select h.id, h.amount,
	case when h.w_account_id = 1 then (h.w_balance)
		 when h.d_account_id = 1 then (h.d_balance)
		 end as balance,
		ifnull(wa.number, 'ATM') as sender,
		ifnull(da.number, 'ATM') as receiver,
		h.created_at
from history_tb as h
left join account_tb as da
on h.d_account_id = da.id
left join account_tb as wa
on h.w_account_id = wa.id
where h.d_account_id = 1 or h.w_account_id = 1;

