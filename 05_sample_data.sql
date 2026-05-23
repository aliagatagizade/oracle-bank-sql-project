INSERT INTO branches VALUES (1,'Nesimi Filiali','Baki',DATE '2010-03-15','ACTIVE','Ali Huseynov');
INSERT INTO branches VALUES (2,'Yasamal Filiali','Baki',DATE '2011-06-20','ACTIVE','Nigar Memmedova');
INSERT INTO branches VALUES (3,'Sabuncu Filiali','Baki',DATE '2012-09-10','ACTIVE','Rauf Eliyev');
INSERT INTO branches VALUES (4,'Gence Merkezi','Gence',DATE '2013-01-05','ACTIVE','Leyla Quliyeva');
INSERT INTO branches VALUES (5,'Sumqayit Filiali','Sumqayit',DATE '2014-04-18','ACTIVE','Kamran Babayev');
INSERT INTO branches VALUES (6,'Lenkaran Filiali','Lenkaran',DATE '2015-07-22','ACTIVE','Turkan Hesenova');
INSERT INTO branches VALUES (7,'Mingecevir Filiali','Mingecevir',DATE '2009-11-30','CLOSED','Elnur Resulov');
INSERT INTO branches VALUES (8,'Sirvan Filiali','Sirvan',DATE '2016-02-14','ACTIVE','Gunel Necefova');
INSERT INTO branches VALUES (9,'Naxcivan Filiali','Naxcivan',DATE '2017-08-09','ACTIVE','Samir Ceferov');
INSERT INTO branches VALUES (10,'Xetai Filiali','Baki',DATE '2008-05-01','CLOSED','Aynur Musayeva');

select * from branches;
commit;


BEGIN
FOR i IN 1..40 LOOP
INSERT INTO CUSTOMERS (cif, full_name, customer_type, pin, voen, phone, email, birth_date, created_at, status)
VALUES (
1000 + i,
'Customer ' || i,
CASE WHEN MOD(i,4) = 0 THEN 'C' ELSE 'I' END,
'PIN' || i,
CASE WHEN MOD(i,4) = 0 THEN 'VOEN' || i ELSE NULL END,
'+99450' || LPAD(i,7,'0'),
CASE WHEN MOD(i,8) = 0 THEN NULL ELSE 'customer' || i || '@mail.com' END,
DATE '1990-01-01' + i,
SYSDATE - i,
CASE
WHEN MOD(i,10) = 0 THEN 'BLOCKED'
WHEN MOD(i,13) = 0 THEN 'CLOSED'
ELSE 'ACTIVE'
END
);
END LOOP;
END;
/

select * from CUSTOMERS;
commit;

BEGIN
FOR i IN 1..70 LOOP
INSERT INTO ACCOUNTS (account_no, cif, branch_code, currency, balance, opened_date, status)
VALUES (
200000 + i,
1000 + MOD(i,40) + 1,
MOD(i,10) + 1,
CASE MOD(i,3)
WHEN 0 THEN 'AZN'
WHEN 1 THEN 'USD'
ELSE 'EUR'
END,
MOD(i,15) * 700,
SYSDATE - i,
CASE
WHEN MOD(i,12) = 0 THEN 'BLOCKED'
WHEN MOD(i,17) = 0 THEN 'CLOSED'
ELSE 'ACTIVE'
END
);
END LOOP;
END;
/

SELECT * FROM ACCOUNTS;
COMMIT;

BEGIN
FOR i IN 1..120 LOOP
INSERT INTO TRANSACTIONS (account_no, txn_type, amount, currency, txn_date, description)
VALUES (200000 + MOD(i,70) + 1,
CASE WHEN MOD(i,3) = 0 THEN 'DEBIT' ELSE 'CREDIT' END,
MOD(i,20) * 50 + 50,
CASE MOD(i,3)
WHEN 0 THEN 'AZN'
WHEN 1 THEN 'USD'
ELSE 'EUR'
END,
SYSDATE - MOD(i,30),
'Transaction ' || i
);
END LOOP;
END;
/

SELECT * FROM TRANSACTIONS;
commit;

BEGIN
FOR i IN 1..15 LOOP
INSERT INTO LOANS (cif, account_no, loan_amount, interest_rate, principal_debt, interest_debt, penalty_debt, start_date, end_date, status)
VALUES (
1000 + i,
200000 + i,
1000 + i * 500,
10 + MOD(i,10),
800 + i * 300,
100 + i * 20,
CASE WHEN MOD(i,5) = 0 THEN 50 ELSE 0 END,
SYSDATE - 300,
SYSDATE + 300,
CASE
WHEN MOD(i,5) = 0 THEN 'OVERDUE'
WHEN MOD(i,7) = 0 THEN 'CLOSED'
ELSE 'ACTIVE'
END
);
END LOOP;
END;
/

SELECT * FROM LOANS;
commit;


BEGIN
FOR i IN 1..20 LOOP
INSERT INTO CARDS (card_no, account_no, card_type, expire_date, status)
VALUES (
4000000000000000 + i,
200000 + i,
CASE WHEN MOD(i,4) = 0 THEN 'CREDIT' ELSE 'DEBIT' END,
ADD_MONTHS(SYSDATE, 24),
CASE
WHEN MOD(i,6) = 0 THEN 'BLOCKED'
WHEN MOD(i,9) = 0 THEN 'EXPIRED'
ELSE 'ACTIVE'
END
);
END LOOP;
END;
/

SELECT * FROM CARDS;
COMMIT;
