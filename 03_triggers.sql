create or replace trigger trg_transactions_bi
before insert on TRANSACTIONS
for each row
begin
if :NEW.txn_id is null then
select seq_txn_id.nextval
into :NEW.txn_id
from dual;
end if;
end;
/

create or replace trigger trg_loans_bi
before insert on LOANS
for each row
begin
if :NEW.loan_id is null then
select seq_loan_id.nextval
into :NEW.loan_id
from dual;
end if;
end;
/
