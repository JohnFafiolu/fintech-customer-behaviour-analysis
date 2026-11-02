/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Transaction Activity by Customer Classification
OBJECTIVE: Compare transaction frequency between the two supplied
customer classifications.
*/

SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(counttrx), 2) AS average_transactions,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY counttrx) AS median_transactions,
    MIN(counttrx) AS minimum_transactions,
    MAX(counttrx) AS maximum_transactions
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Annual Transaction Activity
OBJECTIVE: Compare annual transaction counts across customer classifications.
*/

SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(trx2022), 2) AS avg_trx_2022,
    ROUND(AVG(trx2023), 2) AS avg_trx_2023,
    ROUND(AVG(trx2024), 2) AS avg_trx_2024,
    ROUND(AVG(trx2025), 2) AS avg_trx_2025,
    ROUND(AVG(trx2022 + trx2023 + trx2024 + trx2025), 2) AS avg_annual_total
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Median Annual Transaction Activity
OBJECTIVE: Compare median annual transaction counts across classifications.
*/

SELECT
    churn,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY trx2022) AS median_2022,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY trx2023) AS median_2023,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY trx2024) AS median_2024,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY trx2025) AS median_2025
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Zero-Transaction Proportion by Year
OBJECTIVE: Calculate the number and percentage of customers
with zero annual transactions across customer classifications.
*/

SELECT
    churn,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN trx2022 = 0 THEN 1 END) AS zero_trx_2022,
    ROUND(COUNT(CASE WHEN trx2022 = 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS zero_pct_2022,
    COUNT(CASE WHEN trx2023 = 0 THEN 1 END) AS zero_trx_2023,
    ROUND(COUNT(CASE WHEN trx2023 = 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS zero_pct_2023,
    COUNT(CASE WHEN trx2024 = 0 THEN 1 END) AS zero_trx_2024,
    ROUND(COUNT(CASE WHEN trx2024 = 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS zero_pct_2024,
    COUNT(CASE WHEN trx2025 = 0 THEN 1 END) AS zero_trx_2025,
    ROUND(COUNT(CASE WHEN trx2025 = 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS zero_pct_2025
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Transaction Count Distribution
OBJECTIVE: Compare customer counts and percentages across cumulative
transaction-count bands within each classification.
*/

WITH transaction_bands AS (
    SELECT
        churn,
        CASE
            WHEN counttrx BETWEEN 50 AND 99 THEN '50-99'
            WHEN counttrx BETWEEN 100 AND 199 THEN '100-199'
            WHEN counttrx BETWEEN 200 AND 499 THEN '200-499'
            WHEN counttrx BETWEEN 500 AND 999 THEN '500-999'
            ELSE '1000+'
        END AS transaction_band
    FROM customer_churn
),

band_counts AS (
    SELECT
        churn,
        transaction_band,
        COUNT(*) AS customer_count
    FROM transaction_bands
    GROUP BY churn, transaction_band
)

SELECT
    churn,
    transaction_band,
    customer_count,
    ROUND(
        customer_count * 100.0 /
        SUM(customer_count) OVER (PARTITION BY churn),
        2
    ) AS percentage
FROM band_counts
ORDER BY
    churn,
    CASE transaction_band
        WHEN '50-99' THEN 1
        WHEN '100-199' THEN 2
        WHEN '200-499' THEN 3
        WHEN '500-999' THEN 4
        WHEN '1000+' THEN 5
    END;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Proportion of Customers in the 200-499 Transaction Band
OBJECTIVE: Quantify the proportion of customers in this transaction band
within each supplied classification.
*/

SELECT
    churn,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE counttrx BETWEEN 200 AND 499) AS customers_in_band,
    ROUND(
        COUNT(*) FILTER (WHERE counttrx BETWEEN 200 AND 499) * 100.0 / COUNT(*),
        2
    ) AS percentage_in_band
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Customer Transaction Recency
OBJECTIVE: Compare the recorded time since the last transaction
between the two supplied customer classifications.
*/

SELECT
    churn,
    COUNT(monthssincelasttrx) AS customers_with_recency_data,
    ROUND(AVG(monthssincelasttrx), 2) AS average_months_since_transaction,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY monthssincelasttrx
    ) AS median_months_since_transaction,
    MIN(monthssincelasttrx) AS minimum_months,
    MAX(monthssincelasttrx) AS maximum_months
FROM customer_churn
GROUP BY churn
ORDER BY churn;
