select *
from (
select t.*,
row_number() over (partition by account_no order by txn_date desc) rn
from transactions t)
where rn = 1;

select *
from (
select a.*,
row_number() over (partition by branch_code order by balance desc) rn
from accounts a)
where rn <= 3;

select
currency,
balance,
rank() over (partition by currency order by balance desc) balance_rank
from accounts a;

select a.*,
row_number() over (partition by cif order by balance desc) rn
from accounts a;

select t.*,
sum(amount) over (partition by account_no order by txn_date) running_total
from transactions t;

select 
txn_month,
total_amount,
lag(total_amount) over (order by txn_month) previous_month_amount
from (
select 
trunc(txn_date, 'MM') txn_month,
sum(amount) total_amount
from transactions
group by trunc(txn_date, 'MM')
);

select *
from (
select a.*,
row_number() over (partition by cif order by balance desc) rn
from accounts a
)
where rn = 1;

select 
l.*,
dense_rank() over (order by interest_rate desc) interest_rank
from loans l;

select 
a.branch_code,
c.full_name,
a.balance,
rank() over (partition by a.branch_code order by a.balance desc) balance_rank
from accounts a join customers c
on a.cif = c.cif;

select 
account_no,
max(txn_date) last_txn_date,
trunc(sysdate - max(txn_date)) days_passed
from transactions
group by account_no;
