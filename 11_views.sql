create view v_customer_accounts as
select
c.full_name,
c.cif,
a.account_no,
a.currency,
a.balance,
b.branch_name
from customers c join accounts a
on c.cif = a.cif
join branches b
on a.branch_code = b.branch_code;

select * from v_customer_accounts;

create view v_customer_total_balance as
select
c.cif,
c.full_name,
sum(a.balance)  total_balance
from customers c join accounts a
on c.cif = a.cif
group by c.cif, c.full_name;

select * from v_customer_total_balance;

create view v_overdue_loans as
select * from loans
where status = 'OVERDUE';

select * from v_overdue_loans;

create view v_monthly_transactions as
select
    trunc(txn_date, 'mm') txn_month,
    count(*) transaction_count,
    sum(amount) total_amount
from transactions
group by trunc(txn_date, 'mm');

select * from v_monthly_transactions;
