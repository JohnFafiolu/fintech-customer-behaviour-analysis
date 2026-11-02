/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Customer Classification Distribution
OBJECTIVE: Calculate the number and percentage of customers
in each classification supplied by the dataset.
*/

SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM customer_churn
GROUP BY churn
ORDER BY churn;
