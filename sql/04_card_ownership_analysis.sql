/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Active Card Ownership
OBJECTIVE: Compare active card ownership across the two supplied
customer classifications using descriptive statistics.
*/

SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(totalactivecard), 2) AS average_active_cards,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY totalactivecard
    ) AS median_active_cards,
    MIN(totalactivecard) AS minimum_active_cards,
    MAX(totalactivecard) AS maximum_active_cards
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Zero Active Card Ownership
OBJECTIVE: Compare the proportion of customers with no active cards
across the two supplied customer classifications.
*/

SELECT
    churn,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (
        WHERE totalactivecard = 0
    ) AS customers_with_zero_cards,
    ROUND(
        COUNT(*) FILTER (
            WHERE totalactivecard = 0
        ) * 100.0 / COUNT(*),
        2
    ) AS zero_card_percentage
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Visa and Mastercard Ownership
OBJECTIVE: Compare the average and median Visa and Mastercard
card counts across the two supplied customer classifications.
*/

SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(custvisacard), 2) AS average_visa_cards,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY custvisacard
    ) AS median_visa_cards,
    ROUND(AVG(custmastercardcard), 2) AS average_mastercard_cards,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY custmastercardcard
    ) AS median_mastercard_cards
FROM customer_churn
GROUP BY churn
ORDER BY churn;
