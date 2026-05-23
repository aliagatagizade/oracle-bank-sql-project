select c.full_name, a.account_no, a.currency, a.balance
from CUSTOMERS c join ACCOUNTS a 
on c.cif = a.cif;

select a.account_no, b.branch_name, b.city
from ACCOUNTS a join BRANCHES b 
on a.branch_code = b.branch_code;

select c.full_name, l.loan_amount, l.status
from CUSTOMERS c join LOANS l 
on c.cif = l.cif;

select a.account_no, t.txn_type, t.amount, t.txn_date
from ACCOUNTS a join TRANSACTIONS t 
on a.account_no = t.account_no;

select card.card_no, c.full_name
from CARDS card join ACCOUNTS a 
on card.account_no = a.account_no
join CUSTOMERS c 
on a.cif = c.cif;

select b.branch_name, count(a.cif) customer_count
from BRANCHES b join ACCOUNTS a 
on b.branch_code = a.branch_code
group by b.branch_name;

select b.branch_name, count(a.account_no) account_count
from BRANCHES b join ACCOUNTS a 
on b.branch_code = a.branch_code
group by b.branch_name;

select c.full_name, sum(a.balance) total_balance
from CUSTOMERS c join ACCOUNTS a 
on c.cif = a.cif
group by c.full_name;

select c.full_name, c.cif, l.loan_amount
from CUSTOMERS c
join LOANS l on c.cif = l.cif;

select c.full_name,l.loan_id
from CUSTOMERS c join ACCOUNTS a 
on c.cif = a.cif
join CARDS ca 
on a.account_no = ca.account_no
left join LOANS l 
on c.cif = l.cif
where l.loan_id is null;
