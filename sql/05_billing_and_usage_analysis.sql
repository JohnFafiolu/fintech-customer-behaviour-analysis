/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Total Billing Amount
OBJECTIVE: Compare recorded customer billing amounts across
the two supplied customer classifications.
*/

SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(totalbillingamount), 2) AS average_billing_amount,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY totalbillingamount
    ) AS median_billing_amount,
    MIN(totalbillingamount) AS minimum_billing_amount,
    MAX(totalbillingamount) AS maximum_billing_amount
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Customer Credit Limit
OBJECTIVE: Compare recorded customer credit limits across
the two supplied customer classifications.
*/

SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(custlimit), 2) AS average_credit_limit,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY custlimit
    ) AS median_credit_limit,
    MIN(custlimit) AS minimum_credit_limit,
    MAX(custlimit) AS maximum_credit_limit
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Recorded Usage Percentage
OBJECTIVE: Compare recorded usage percentage values across
the two supplied customer classifications.
*/

SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(usagepercent), 2) AS average_usage_percentage,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY usagepercent
    ) AS median_usage_percentage,
    MIN(usagepercent) AS minimum_usage_percentage,
    MAX(usagepercent) AS maximum_usage_percentage
FROM customer_churn
GROUP BY churn
ORDER BY churn;
