create index idx_accounts_cif
on ACCOUNTS(cif);

create index idx_accounts_branch_code
on ACCOUNTS(branch_code);

create index idx_transactions_account_no
on TRANSACTIONS(account_no);

create index idx_transactions_txn_date
on TRANSACTIONS(txn_date);

create index idx_loans_cif
on LOANS(cif);

create index idx_loans_account_no
on LOANS(account_no);

create index idx_cards_account_no
on CARDS(account_no);
