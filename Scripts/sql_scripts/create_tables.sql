
--table deletion if exists 
DROP TABLE IF EXISTS web_events CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS accounts CASCADE;
DROP TABLE IF EXISTS sales_reps CASCADE;
DROP TABLE IF EXISTS region CASCADE;


--table creation statements
CREATE TABLE region (
    id INTEGER,
    name TEXT
);

CREATE TABLE sales_reps (
    id INTEGER,
    name TEXT,
    region_id INTEGER
);

CREATE TABLE accounts (
    id INTEGER,
    name TEXT,
    website TEXT,
    lat TEXT,
    long TEXT,
    primary_poc TEXT,
    sales_rep_id INTEGER
);

CREATE TABLE orders (
    id INTEGER,
    account_id INTEGER,
    occurred_at TEXT,
    standard_qty INTEGER,
    gloss_qty INTEGER,
    poster_qty INTEGER,
    total INTEGER,
    standard_amt_usd TEXT,
    gloss_amt_usd TEXT,
    poster_amt_usd TEXT,
    total_amt_usd TEXT
);

CREATE TABLE web_events (
    id INTEGER,
    account_id INTEGER,
    occurred_at TEXT,
    channel TEXT
);