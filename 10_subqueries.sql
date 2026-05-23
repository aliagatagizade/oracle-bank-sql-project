select *
from customers c
where not exists (
select 1
from accounts a
where a.cif = c.cif
);

select *
from accounts a
where not exists (
select 1
from transactions t
where t.account_no = a.account_no
);

select *
from customers c
where exists (
select 1
from loans l
where l.cif = c.cif
);

select *
from accounts a
where not exists (
select 1
from cards c
where c.account_no = a.account_no
);

select *
from accounts
where balance > (
select avg(balance)
from accounts
);

select 
c.full_name,
l.loan_amount
from customers c
join loans l
on c.cif = l.cif
where l.loan_amount = (
select max(loan_amount)
from loans
);

select *
from accounts a
where balance = (
select max(balance)
from accounts x
where x.branch_code = a.branch_code
);

select *
from accounts a
where a.status = 'active'
and a.cif in (
select cif
from loans
where status = 'overdue'
);

select 
c.*
from customers c join accounts a
on c.cif = a.cif
join cards cd
on a.account_no = cd.account_no
where a.status = 'active'
and cd.status = 'blocked';

select 
c.*
from customers c join accounts a
on c.cif = a.cif
join cards cd
on a.account_no = cd.account_no
where not exists (
select 1
from loans l
where l.cif = c.cif
);
