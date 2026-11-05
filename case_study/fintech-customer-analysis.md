# Fintech Customer Behaviour & Classification Analysis

**Project Type:** End-to-End Data Analysis  
**Industry:** Financial Technology (Fintech)  
**Dataset:** Churn XYZ v1.0  
**Records Analysed:** 11,314 customers  
**Tools:** PostgreSQL, Python, Excel, Power BI  
**Focus Areas:** Customer Analytics, Statistical Analysis, Hypothesis Testing, Logistic Regression and Data Visualisation

---

## 1. Project Overview

How do customer characteristics and transaction behaviours differ across customer classifications in a fintech dataset?

This project investigates 11,314 customer records to identify patterns in demographics, transaction activity, card ownership, billing and usage behaviour.

I combined SQL-based exploration, statistical hypothesis testing, effect size analysis, logistic regression and interactive Power BI visualisation to examine differences between customers labelled as churned and those labelled as not churned.

The objective was to move beyond simply describing the dataset and investigate which customer characteristics and behavioural patterns were most strongly associated with the supplied classifications.

## 2. Business Problem

Customer behaviour is an important consideration in fintech business decisions. Understanding differences in transaction activity, product ownership and billing patterns can help businesses investigate customer engagement and develop more informed retention strategies.

However, customer classifications alone do not explain the characteristics or behaviours associated with each group.

This analysis therefore examines the differences between customers labelled as churned and those labelled as not churned in the supplied dataset.

An important distinction was maintained throughout the project: the dataset documentation does not establish how churn was defined, when the classifications were assigned or the observation period used. Consequently, the analysis investigates the supplied classifications rather than treating them as independently verified records of real-world churn.

## 3. Research Question

**What customer characteristics and behavioural patterns distinguish customers across the two classifications supplied in the XYZ dataset?**

### Analytical Objectives

1. Examine the distribution of the supplied customer classifications.
2. Investigate demographic differences between the groups.
3. Compare transaction activity and recency patterns.
4. Examine card ownership, billing and usage characteristics.
5. Test whether observed differences are statistically significant.
6. Evaluate logistic regression models for classifying the supplied labels.
7. Translate the findings into potential business recommendations.

## 4. Dataset Description

The analysis used the Churn XYZ v1.0 dataset, obtained from Zenodo.

- **Dataset:** Churn XYZ v1.0
- **Source:** Zenodo
- **Publication date:** 6 October 2025
- **Records:** 11,314
- **Variables:** 27
- **Unit of analysis:** Customer record

The dataset contains information relating to:

- Customer demographics
- Credit limits
- Card ownership
- Transaction counts
- Transaction activity across multiple years
- Billing amounts
- Usage indicators
- Customer classifications

**Original dataset:** https://doi.org/10.5281/zenodo.17214115

The original dataset is referenced rather than republishing customer-level records in this repository.

## 5. Tools and Technologies

| Tool | Application |
|---|---|
| Microsoft Excel | Initial data inspection, quality assessment and preparation |
| PostgreSQL | Data storage, querying and exploratory analysis |
| Python | Statistical testing, modelling and analytical investigation |
| Power BI | Interactive dashboard development |
| GitHub | Version control and project documentation |

## 6. Analytical Methodology

The project followed a structured analytical process.

### 6.1 Data Inspection and Quality Assessment

The initial stage involved examining the dataset's structure, variable types, missing values, duplicates, unusual observations and inconsistencies.

Key checks included:

- Confirming the uniqueness of customer identifiers.
- Identifying missing demographic and transaction information.
- Examining transaction and billing distributions.
- Comparing related variables for internal consistency.
- Investigating unusual values without automatically assuming they were errors.

The customer identifier was unique across all 11,314 records.

Several data quality issues were identified, including:

- Missing values in customer demographic and transaction fields.
- Inconsistencies between total active cards and the sum of Visa and Mastercard counts.
- Differences between transaction frequency measures.
- Unusually large values in credit limits and usage indicators.
- Date fields that did not contain sufficient information to reconstruct complete dates.

Missing values were preserved rather than replaced with arbitrary values. Inconsistencies were documented instead of being silently corrected.

### 6.2 SQL-Based Exploratory Analysis

PostgreSQL was used to investigate the dataset through structured queries.

The SQL analysis covered:

1. Customer classification distribution.
2. Demographic segmentation.
3. Transaction activity.
4. Annual transaction patterns.
5. Card ownership.
6. Billing and usage characteristics.

The analysis used aggregation, conditional filtering, grouping, joins and common table expressions where appropriate.

### 6.3 Statistical Analysis

Python was used to investigate whether observed differences between customer classifications were statistically meaningful.

The statistical methods included:

- Descriptive statistics.
- Chi-square tests of independence.
- Mann–Whitney U tests.
- Cramér's V.
- Rank-biserial correlation.
- Bonferroni adjustment for multiple comparisons.

The analysis considered both statistical significance and effect size.

This distinction was important because a statistically significant result does not necessarily represent a practically meaningful difference.

### 6.4 Logistic Regression

Logistic regression was used to examine how selected customer characteristics were associated with the supplied binary classifications.

The modelling process involved:

- Selecting relevant customer variables.
- Investigating correlations and multicollinearity.
- Assessing variance inflation factors.
- Handling missing values through complete-case analysis.
- Splitting the data into training and testing sets using stratification.
- Standardising predictors using training data only.
- Evaluating model performance on the held-out test set.

The modelling exercise was designed to evaluate classification performance against the supplied labels, not to establish a validated future churn prediction system.

### 6.5 Dashboard Development

Power BI was used to communicate the analysis through four dashboard pages:

1. Customer Overview
2. Customer Behaviour
3. Statistical Evidence
4. Insights and Recommendations

The dashboard combines summary indicators, demographic comparisons, behavioural charts, statistical results and business recommendations.

---

## 7. Key Findings

### 7.1 Customer Classification Distribution

The dataset contained two supplied customer classifications.

| Classification | Customers | Percentage |
|---|---:|---:|
| Not churned (0) | 3,162 | 27.95% |
| Churned (1) | 8,152 | 72.05% |
| Total | 11,314 | 100% |

The dataset was imbalanced, with approximately 72% of customers assigned the churned label.

This imbalance was considered during the interpretation of the classification models.

**Business implication:** Businesses should investigate the underlying definition and assignment process of these classifications before using the distribution as an estimate of actual customer attrition.

### 7.2 Demographic Analysis

#### Age

The average age of customers was relatively similar across the two classifications.

| Measure | Not Churned | Churned |
|---|---:|---:|
| Mean age | 39.86 | 40.69 |
| Median age | 38 | 39 |

The chi-square test across four age groups produced:

- Chi-square statistic: 9.395
- Degrees of freedom: 3
- P-value: 0.02447
- Cramér's V: 0.0288

Although the association was statistically significant at the 5% level, the effect size was negligible.

**Interpretation:** Age groups showed a statistically detectable association with the supplied classifications, but the strength of that association was very small.

#### Gender

The dataset contained 6,075 female customers, 5,236 male customers and 3 records with missing gender information.

The proportion labelled as churned was:

- Female: 72.25%
- Male: 71.85%

The chi-square test returned a p-value of 0.6530, indicating no statistically significant association.

Cramér's V was 0.00423.

**Interpretation:** Gender did not meaningfully distinguish customers across the supplied classifications.

#### Marital Status

The dataset contained 6,640 married customers, 4,445 customers recorded as not married and 229 records with missing marital status.

The proportion labelled as churned was:

- Married: 71.79%
- Not married: 72.31%

The chi-square test returned a p-value of 0.5694, with Cramér's V of 0.00540.

**Interpretation:** Marital status showed no statistically significant association with the supplied classifications.

**Overall demographic finding:** Demographic variables alone provided limited differentiation between the two customer groups.

### 7.3 Transaction Behaviour

Transaction activity showed one of the strongest differences in the dataset.

| Measure | Not Churned | Churned |
|---|---:|---:|
| Mean transaction count | 106.43 | 350.63 |
| Median transaction count | 77 | 262 |

The Mann–Whitney U test indicated a statistically significant difference between the groups.

- U statistic: 1,235,735.5
- P-value: Below the displayed numerical precision
- Rank-biserial correlation: 0.9041

The effect size indicated a very strong difference in transaction-count distributions.

Customers labelled as churned had substantially higher transaction counts than those labelled as not churned.

This was an unexpected result because the conventional interpretation of churn often suggests reduced customer activity.

**Interpretation:** Transaction frequency strongly distinguished the supplied classifications, but the direction of the relationship challenges a straightforward interpretation of the churn label.

The result reinforces the importance of understanding how the dataset's classifications were generated.

#### Annual Transaction Activity

The annual average transaction counts also differed between the groups.

| Year | Not Churned | Churned |
|---|---:|---:|
| 2022 | 55.09 | 83.41 |
| 2023 | 37.23 | 102.00 |
| 2024 | 12.23 | 107.17 |
| 2025 | 1.88 | 58.05 |

The differences were statistically significant across the four annual comparisons after Bonferroni adjustment.

The effect sizes increased considerably in the later years.

However, the dataset documentation does not establish the classification date or observation period. Therefore, these results cannot establish whether the annual activity preceded or followed the classification.

The 2025 figures also require caution because the dataset's extraction date and completeness of the observation period are not documented.

**Interpretation:** Annual transaction patterns provide substantial separation between the supplied classifications, but their temporal relationship with the labels remains uncertain.

### 7.4 Customer Recency

Months since the last transaction produced an unexpected result.

| Measure | Not Churned | Churned |
|---|---:|---:|
| Mean months since last transaction | 19.60 | 7.60 |
| Median months since last transaction | 19 | 7 |

The Mann–Whitney U test indicated a statistically significant difference.

- U statistic: 21,585,032
- Rank-biserial correlation: -0.75898
- Missing records: 297

Customers labelled as not churned had considerably higher values for months since their last transaction.

This is counterintuitive under the conventional understanding of churn.

**Interpretation:** The result raises questions about the operational definition of churn, the timing of the classification and the meaning of the recency variable. It should not be interpreted as evidence that inactive customers are less likely to churn.

### 7.5 Card Ownership

Card ownership showed a substantial difference between the two classifications.

| Measure | Not Churned | Churned |
|---|---:|---:|
| Average active cards | 0.33 | 1.12 |
| Median active cards | 0 | 1 |
| Customers with zero active cards | 66.70% | 5.36% |

The difference in the proportion of customers with zero active cards was approximately 61.34 percentage points.

The chi-square test produced:

- Chi-square statistic: 4,911.641
- Degrees of freedom: 1
- Cramér's V: 0.6589
- P-value: Below displayed numerical precision

This represented a strong association between active card ownership and the supplied classifications.

Visa ownership also showed a statistically significant difference, with a rank-biserial correlation of 0.2181.

Mastercard ownership showed a statistically significant but much smaller effect, with a rank-biserial correlation of 0.0626.

**Interpretation:** Active card ownership was strongly associated with the supplied classifications, particularly when comparing customers with no active cards against those with at least one.

This may provide a useful direction for investigating product adoption and customer engagement.

However, the relationship does not establish that card ownership causes a particular classification.

### 7.6 Billing and Usage Analysis

Billing amounts differed considerably between the groups.

| Measure | Not Churned | Churned |
|---|---:|---:|
| Mean total billing amount | 97.10 million | 254.65 million |
| Median total billing amount | 43.28 million | 135.89 million |
| Mean credit limit | 13.92 million | 21.01 million |
| Median credit limit | 10 million | 13 million |

The Mann–Whitney U tests indicated statistically significant differences in total billing amount, credit limit and usage percentage.

The corresponding rank-biserial effect sizes were:

- Total billing amount: 0.52763
- Credit limit: 0.26436
- Usage percentage: 0.48047

Customers labelled as churned generally had higher billing amounts, credit limits and usage indicators.

However, the dataset does not adequately document the currency, measurement period or operational definition of every billing and usage variable.

In addition, the usage indicator should not automatically be interpreted as conventional credit utilisation because some values exceeded 100%.

**Interpretation:** Billing and usage measures showed meaningful differences between the supplied classifications, but their exact financial interpretation requires additional documentation.

---

## 8. Logistic Regression Results

Two logistic regression models were evaluated to investigate how customer characteristics and transaction behaviour could distinguish the supplied classifications.

The modelling dataset contained 11,017 complete records after excluding observations with missing values in the selected predictors.

A stratified 80:20 train-test split was used.

### 8.1 Model One: Aggregate Transaction Model

The first model included the aggregate transaction count alongside selected demographic, card, billing and customer activity variables.

Test-set performance:

| Metric | Result |
|---|---:|
| Accuracy | 95.60% |
| ROC-AUC | 0.9752 |
| Not churned F1-score | 0.92 |
| Churned F1-score | 0.97 |

Transaction count was the strongest positive coefficient in the model.

Its standardised coefficient was approximately 6.075, corresponding to an odds ratio of approximately 434.83 per standard deviation increase, conditional on the other model variables.

This unusually large association suggests that transaction count was highly informative for reproducing the supplied classifications.

However, an important data structure issue was identified: aggregate transaction count was almost exactly equal to the sum of the annual transaction components for most records.

Consequently, aggregate transaction count was not combined with the annual transaction components in the second model.

### 8.2 Model Two: Annual Transaction Model

The second model replaced aggregate transaction count with annual transaction measures.

Test-set performance:

| Metric | Result |
|---|---:|
| Accuracy | 95.87% |
| ROC-AUC | 0.9877 |
| Not churned F1-score | 0.93 |
| Churned F1-score | 0.97 |

The annual transaction model achieved the strongest observed test-set performance of the two models.

The annual transaction variables, particularly 2024 and 2025 activity, had large positive associations with the supplied churn classification.

The 2025 transaction variable had the largest standardised coefficient.

However, this result should be interpreted cautiously because the classification date and observation period are unknown.

The strong model performance may partly reflect how the supplied labels were constructed or information that overlaps with the classification process.

### 8.3 Model Comparison

| Metric | Aggregate Model | Annual Model |
|---|---:|---:|
| Accuracy | 95.60% | 95.87% |
| ROC-AUC | 0.9752 | 0.9877 |
| Not churned F1-score | 0.92 | 0.93 |
| Churned F1-score | 0.97 | 0.97 |

The annual transaction model performed better on the held-out test set.

Nevertheless, high classification performance should not be confused with verified future churn prediction.

The models demonstrate how well the selected variables distinguish the supplied classifications under the evaluation setup.

They do not establish that the models can predict future customer attrition.

---

## 9. Business Implications and Recommendations

The findings suggest several areas that a fintech business could investigate further.

These are potential business actions informed by observed associations, not causal conclusions.

### 9.1 Investigate Customer Engagement

The strong differences in transaction activity suggest that transaction behaviour deserves further investigation.

A business could examine customer activity patterns alongside account status, product usage and the timing of customer classification.

### 9.2 Investigate Card Adoption

The large difference in zero-card ownership suggests that card adoption may be an important area for further investigation.

The business could examine whether customers without active cards experience barriers to product activation or usage.

### 9.3 Review Customer Classification Rules

The unexpected relationship between transaction counts, transaction recency and the supplied churn labels makes classification validation particularly important.

The business should establish:

- How churn is operationally defined.
- When a customer receives the churn label.
- Which observation period is used.
- Whether transaction activity is measured before or after classification.

### 9.4 Improve Customer Data Documentation

Several inconsistencies and undocumented variable definitions limited the interpretation of the results.

A business should maintain clear definitions for transaction frequency, billing amounts, usage indicators, active cards and customer status.

### 9.5 Develop a Validated Retention Model

Before deploying a churn prediction system, a business should use a dataset with clearly defined observation periods and future outcomes.

Predictors should be restricted to information available before the prediction date.

This would help prevent information leakage and provide a more realistic assessment of future churn risk.

---

## 10. Limitations

Several limitations affected the scope and interpretation of this analysis.

### 10.1 Undefined Churn Classification

The dataset documentation does not sufficiently explain the operational definition of churn or how customer labels were assigned.

The analysis therefore treats churn as a supplied classification rather than verified real-world attrition.

### 10.2 Unknown Observation Period

The exact extraction date and observation period are not documented.

This limits the interpretation of annual transaction patterns and their relationship with customer classifications.

### 10.3 Incomplete Date Information

Four date-related fields contain day and month information without a year.

These fields were not used to reconstruct customer tenure or complete dates.

### 10.4 Missing Values

Some demographic and transaction fields contained missing values.

The missing values were preserved during data preparation. Complete-case analysis was used for the logistic regression models where required.

### 10.5 Inconsistent Measures

Several related variables did not reconcile consistently.

Examples included active card counts, transaction frequency measures and usage indicators.

These differences were documented rather than silently corrected.

### 10.6 Classification Modelling Limitations

The logistic regression models were evaluated against the supplied labels.

Without a clearly defined classification date and observation period, the analysis cannot establish whether the models are suitable for predicting future churn.

### 10.7 Generalisability

The findings describe the dataset analysed and should not automatically be generalised to every fintech business or customer population.

---

## 11. Project Deliverables

The project produced the following deliverables:

- Excel data inspection and preparation workbook.
- PostgreSQL database and SQL analysis scripts.
- Python notebook containing statistical analysis and logistic regression.
- Data quality assessment documentation.
- Statistical findings documentation.
- Project limitations documentation.
- Four-page interactive Power BI dashboard.
- Dashboard PDF export.
- GitHub repository containing the project files and documentation.

### Repository Structure

```text
fintech-customer-behaviour-analysis/
│
├── README.md
│
├── sql/
│   ├── README.md
│   ├── 00_database_setup.sql
│   ├── 01_customer_classification.sql
│   ├── 02_demographic_analysis.sql
│   ├── 03_transaction_analysis.sql
│   ├── 04_card_ownership_analysis.sql
│   └── 05_billing_and_usage_analysis.sql
│
├── python/
│   ├── README.md
│   └── fintech_customer_analysis.ipynb
│
├── documentation/
│   ├── data_quality_assessment.md
│   ├── statistical_findings.md
│   └── limitations.md
│
├── dashboard/
│   ├── README.md
│   ├── Fintech_Customer_Behaviour_Analysis.pbix
│   ├── Fintech_Customer_Behaviour_Analysis.pdf
│   └── dashboard_overview.png
│
└── case-study/
    └── fintech-customer-analysis.md
```

## 12. Conclusion
This project investigated customer demographics, transaction behaviour, card ownership, billing patterns and usage characteristics across two classifications supplied in a fintech dataset.

The analysis revealed that demographic variables offered limited differentiation, while transaction activity, card ownership and billing characteristics showed considerably stronger associations with the supplied classifications.

Statistical testing helped distinguish meaningful differences from results that were merely statistically significant.

Logistic regression further demonstrated that the available variables could classify the supplied labels with high test-set performance. However, the absence of a clearly documented churn definition, classification date and observation period prevents these results from being treated as evidence of validated future churn prediction.

Beyond the numerical findings, this project reinforced an important analytical principle:

A good analysis does not stop at identifying patterns. It investigates what those patterns mean, how reliable the underlying data is and what decisions the evidence can reasonably support.

## 13. About the Analyst
John Fafiolu
Statistician | Data Analyst

I apply statistical thinking, analytical methods and data tools to investigate business questions, uncover patterns and support evidence-based decision-making.

My approach begins with understanding the question and the data generation process before selecting analytical methods or building visualisations.
