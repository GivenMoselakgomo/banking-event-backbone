CREATE TABLE accounts (
    account_id      SERIAL PRIMARY KEY,
    customer_name   TEXT NOT NULL,
    account_type    TEXT NOT NULL CHECK (account_type IN ('checking', 'savings')),
    balance         NUMERIC(14,2) NOT NULL DEFAULT 0,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE transactions (
    transaction_id  BIGSERIAL PRIMARY KEY,
    account_id      INT NOT NULL REFERENCES accounts(account_id),
    txn_type        TEXT NOT NULL CHECK (txn_type IN ('deposit', 'withdrawal', 'transfer_in', 'transfer_out')),
    amount          NUMERIC(14,2) NOT NULL,
    counterparty    TEXT,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE transactions REPLICA IDENTITY FULL;
ALTER TABLE accounts REPLICA IDENTITY FULL;

INSERT INTO accounts (customer_name, account_type, balance) VALUES
    ('Thandiwe Nkosi',   'checking', 15000.00),
    ('Sipho Dlamini',    'savings',  42000.00),
    ('Aisha Patel',      'checking', 8000.00),
    ('Johan van der Merwe','checking', 23000.00),
    ('Lerato Mokoena',   'savings',  60000.00);
    