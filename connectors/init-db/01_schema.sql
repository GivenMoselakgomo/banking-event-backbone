CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_name TEXT NOT NULL,
    account_type TEXT NOT NULL CHECK (account_type IN ('savings', 'checking', 'credit')),
    balance NUMERIC(14, 2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT now()  
);