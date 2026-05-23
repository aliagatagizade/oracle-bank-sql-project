--1
CREATE USER BANK
IDENTIFIED BY Bank111
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 200M ON USERS;

SHOW PDBS;

ALTER SESSION SET CONTAINER = XEPDB1;

GRANT CREATE SESSION TO BANK;
GRANT CREATE TABLE TO BANK;
GRANT CREATE VIEW TO BANK;
GRANT CREATE SEQUENCE TO BANK;
GRANT CREATE PROCEDURE TO BANK;
GRANT CREATE TRIGGER TO BANK;
GRANT CREATE SYNONYM TO BANK;

--2
create table BRANCHES(
branch_code number primary key,
branch_name varchar2(100) not null,
city varchar2(50) not null,
opened_date date default sysdate,
status varchar2(10)
check (status in ('ACTIVE','CLOSED')),
director varchar2(100)
);

--3
create table CUSTOMERS(
cif number primary key,
full_name varchar2(100) not null,
customer_type char(1)
check (customer_type in('I','C')),
pin varchar2(20),
voen varchar2(20) unique,
phone varchar2(20),
email varchar2(100) unique,
birth_date date,
created_at date default sysdate,
status varchar2(10)
check (status IN ('ACTIVE', 'CLOSED', 'BLOCKED'))
);

--4
create table ACCOUNTS(
account_no number primary key,
cif number,
constraint fk_acc_cust_cif
foreign key (cif)
references customers(cif),
branch_code number,
constraint fk_acc_bran_brcode
foreign key (branch_code)
references branches(branch_code),
currency varchar2(3)
check (currency in ('AZN','USD','EUR')),
balance number default 0
check (balance >=0),
opened_date date default sysdate,
status varchar2(10)
check (status in ('ACTIVE','CLOSED','BLOCKED'))
);

--5
create table TRANSACTIONS(
txn_id number primary key,
account_no number,
constraint fk_txn_acc_accno
foreign key (account_no)
references accounts(account_no),
txn_type varchar2(10)
check(txn_type in('DEBIT','CREDIT')),
amount number
check (amount >0),
currency varchar2(3)
check (currency in ('AZN','USD','EUR')),
txn_date date default sysdate,
description varchar2(200)
);

--6
create table LOANS (
loan_id number primary key,
cif number,
constraint fk_loan_cust
foreign key (cif)
references customers(cif),
account_no number,
constraint fk_loan_acc
foreign key (account_no)
references accounts(account_no),
loan_amount number 
check (loan_amount > 0),
interest_rate number 
check (interest_rate > 0),
principal_debt number,
interest_debt number,
penalty_debt number,
start_date date,
end_date date,
constraint chk_loan_dates
check (end_date > start_date),
status varchar2(10)
check (status IN ('ACTIVE', 'CLOSED', 'OVERDUE'))
);

--7
create table CARDS (
card_no number primary key,
account_no number not null,
card_type varchar2(10)
check (card_type IN ('DEBIT', 'CREDIT')),
expire_date date not null,
status varchar2(10)
check (status in ('ACTIVE', 'BLOCKED', 'EXPIRED')),

constraint fk_card_account
foreign key (account_no)
references accounts(account_no)
);
