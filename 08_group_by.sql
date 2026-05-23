select
currency,sum(balance) total_balance
from accounts
group by currency;

select
branch_name,sum(balance) total_balance
from accounts a join branches b
on a.branch_code=b.branch_code
group by branch_name;

select
customer_type,count(*) customer_count
from customers
group by customer_type;

select
account_no,count(*) txn_count
from transactions
group by account_no;

select 
account_no,
sum(case when txn_type = 'DEBIT' then amount else 0 end) total_debit,
sum(case when txn_type = 'CREDIT' then amount else 0 end) total_credit
from transactions
group by account_no;

select
account_no,count(*) txn_count
from transactions
group by account_no
having count(*)>3;

select
c.full_name,sum(a.balance) total_balance
from accounts a join customers c
on a.cif=c.cif
group by c.full_name
having sum(a.balance) >5000;

select 
status, count(*) account_count
from accounts
group by status;

select
status,sum(loan_amount) total_loan
from loans
group by status;

select to_char(txn_date, 'MM') txn_month,
count(*) txn_count,
sum(amount) total_amount
from transactions
group by to_char(txn_date, 'MM')
order by txn_month;
