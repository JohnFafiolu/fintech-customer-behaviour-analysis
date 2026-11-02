/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Customer Age Profile
OBJECTIVE: Compare the age distribution across the supplied
customer classifications.
*/

SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(age), 2) AS average_age,
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) AS median_age
FROM customer_churn
GROUP BY churn
ORDER BY churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Customer Age-Band Distribution
OBJECTIVE: Compare customer counts across age groups by classification.
*/

WITH age_groups AS (
    SELECT
        churn,
        CASE
            WHEN age BETWEEN 20 AND 29 THEN '20-29'
            WHEN age BETWEEN 30 AND 39 THEN '30-39'
            WHEN age BETWEEN 40 AND 49 THEN '40-49'
            ELSE '50+'
        END AS age_band
    FROM customer_churn
)

SELECT
    churn,
    age_band,
    COUNT(*) AS customer_count
FROM age_groups
GROUP BY churn, age_band
ORDER BY churn, age_band;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Classification Proportion by Age Band
OBJECTIVE: Calculate the percentage of customers in each classification
within each age group.
*/

WITH age_groups AS (
    SELECT
        churn,
        CASE
            WHEN age BETWEEN 20 AND 29 THEN '20-29'
            WHEN age BETWEEN 30 AND 39 THEN '30-39'
            WHEN age BETWEEN 40 AND 49 THEN '40-49'
            ELSE '50+'
        END AS age_band
    FROM customer_churn
),

age_counts AS (
    SELECT
        age_band,
        churn,
        COUNT(*) AS customer_count
    FROM age_groups
    GROUP BY age_band, churn
)

SELECT
    age_band,
    churn,
    customer_count,
    ROUND(
        customer_count * 100.0 /
        SUM(customer_count) OVER (PARTITION BY age_band),
        2
    ) AS percentage
FROM age_counts
ORDER BY age_band, churn;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Age Band Contingency Table
OBJECTIVE: Prepare observed frequencies for a chi-square test
of independence between age band and customer classification.
*/

WITH age_groups AS (
    SELECT
        churn,
        CASE
            WHEN age BETWEEN 20 AND 29 THEN '20-29'
            WHEN age BETWEEN 30 AND 39 THEN '30-39'
            WHEN age BETWEEN 40 AND 49 THEN '40-49'
            ELSE '50+'
        END AS age_band
    FROM customer_churn
)

SELECT
    age_band,
    COUNT(CASE WHEN churn = 0 THEN 1 END) AS classification_0,
    COUNT(CASE WHEN churn = 1 THEN 1 END) AS classification_1
FROM age_groups
GROUP BY age_band
ORDER BY age_band;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Gender and Customer Classification
OBJECTIVE: Compare observed customer classifications across gender categories.
*/

SELECT
    custsex,
    COUNT(CASE WHEN churn = 0 THEN 1 END) AS classification_0,
    COUNT(CASE WHEN churn = 1 THEN 1 END) AS classification_1,
    COUNT(*) AS total_customers
FROM customer_churn
WHERE custsex IS NOT NULL
GROUP BY custsex
ORDER BY custsex;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Classification Proportion by Gender
OBJECTIVE: Calculate the proportion of each gender category
assigned to classification 1.
*/

SELECT
    custsex,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN churn = 1 THEN 1 END) AS classification_1_count,
    ROUND(
        COUNT(CASE WHEN churn = 1 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS classification_1_percentage
FROM customer_churn
WHERE custsex IS NOT NULL
GROUP BY custsex
ORDER BY custsex;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Marital Status and Customer Classification
OBJECTIVE: Compare observed customer classifications across marital status categories.
*/

SELECT
    custmaritalstatus,
    COUNT(CASE WHEN churn = 0 THEN 1 END) AS classification_0,
    COUNT(CASE WHEN churn = 1 THEN 1 END) AS classification_1,
    COUNT(*) AS total_customers
FROM customer_churn
WHERE custmaritalstatus IS NOT NULL
GROUP BY custmaritalstatus
ORDER BY custmaritalstatus;


/*
PROJECT: Fintech Customer Behaviour & Classification Analysis
ANALYSIS: Classification Proportion by Marital Status
OBJECTIVE: Calculate the proportion of each marital status category
assigned to classification 1.
*/

SELECT
    custmaritalstatus,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN churn = 1 THEN 1 END) AS classification_1_count,
    ROUND(
        COUNT(CASE WHEN churn = 1 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS classification_1_percentage
FROM customer_churn
WHERE custmaritalstatus IS NOT NULL
GROUP BY custmaritalstatus
ORDER BY custmaritalstatus;
