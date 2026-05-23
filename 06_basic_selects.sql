select * from customers
where status='ACTIVE';

select * from branches
where status='CLOSED';

select * from accounts
where balance > 1000;

select 
c.*,
currency
from customers c join accounts a
on c.cif = a.cif
where a.currency = 'USD';

select * from transactions
where txn_date >= sysdate - 7;

select * from loans
where status='OVERDUE';

select * from cards
where status='BLOCKED';

select * from customers
where email is null;

select * from accounts
where balance = 0;

select * from accounts
where trunc(opened_date, 'MM') = trunc(sysdate, 'MM');
