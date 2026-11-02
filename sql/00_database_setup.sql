CREATE TABLE customer_churn (
    cif BIGINT PRIMARY KEY,
    customername TEXT,
    custsex TEXT,
    age INTEGER,
    custmaritalstatus TEXT,
    custlimit NUMERIC(20, 2),
    totalactivecard INTEGER,
    custvisacard INTEGER,
    custmastercardcard INTEGER,
    firstdteopen TEXT,
    lastdteopen TEXT,
    firstexpdate TEXT,
    lastexpdate TEXT,
    totalactivemonths NUMERIC,
    activeyears NUMERIC,
    trx2022 INTEGER,
    trx2023 INTEGER,
    trx2024 INTEGER,
    trx2025 INTEGER,
    counttrx INTEGER,
    avgtrxpermonth NUMERIC,
    totalbillingamount NUMERIC(20, 2),
    avgbillingamount NUMERIC(20, 2),
    lasttrxdate TIMESTAMP,
    monthssincelasttrx INTEGER,
    usagepercent NUMERIC(15, 2),
    churn INTEGER
);
SELECT COUNT(*) AS total_customers
FROM customer_churn;

SELECT *
FROM customer_churn
LIMIT 10;

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'customer_churn'
ORDER BY ordinal_position;
