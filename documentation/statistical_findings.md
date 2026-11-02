# Statistical Findings

## 1. Customer Classification Distribution

The dataset contains 11,314 customer records across two supplied classifications.

| Classification | Customers | Percentage |
|---|---:|---:|
| Not Churned (0) | 3,162 | 27.95% |
| Churned (1) | 8,152 | 72.05% |
| **Total** | **11,314** | **100%** |

The classification is imbalanced, with the churn-labelled group representing 72.05% of the dataset. These figures describe the supplied labels and should not be interpreted as a verified real-world churn rate.

## 2. Demographic Analysis

### Age

The average age was similar across the two classifications.

| Classification | Average Age | Median Age |
|---|---:|---:|
| Not Churned | 39.86 | 38 |
| Churned | 40.69 | 39 |

A chi-square test across age bands indicated a statistically significant association:

- Chi-square statistic: 9.395
- Degrees of freedom: 3
- p-value: 0.02447
- Cramér's V: 0.0288

Although statistically significant, the effect size was negligible.

### Gender

The proportion of churn-labelled customers was 72.25% among females and 71.85% among males.

- Chi-square statistic: 0.2021
- Degrees of freedom: 1
- p-value: 0.6530
- Cramér's V: 0.00423

The analysis found no statistically significant association between gender and the supplied classification.

### Marital Status

The proportion of churn-labelled customers was 71.79% among married customers and 72.31% among customers classified as not married.

- Chi-square statistic: 0.3236
- Degrees of freedom: 1
- p-value: 0.5694
- Cramér's V: 0.00540

No statistically significant association was found.

**Demographic takeaway:** Age, gender and marital status showed limited association with the supplied classification in this dataset.

## 3. Transaction Behaviour

### Overall Transaction Count

| Classification | Average Transactions | Median Transactions |
|---|---:|---:|
| Not Churned | 106.43 | 77 |
| Churned | 350.63 | 262 |

A Mann–Whitney U test indicated a statistically significant difference between the groups:

- U statistic: 1,235,735.5
- p-value: Below displayed precision
- Rank-biserial correlation: 0.9041

The churn-labelled group had substantially higher transaction counts.

### Annual Transaction Patterns

Average annual transaction counts were:

| Year | Not Churned | Churned |
|---|---:|---:|
| 2022 | 55.09 | 83.41 |
| 2023 | 37.23 | 102.00 |
| 2024 | 12.23 | 107.17 |
| 2025 | 1.88 | 58.05 |

Mann–Whitney U tests indicated statistically significant differences across all four years. All four results remained significant using a Bonferroni-adjusted significance threshold of 0.0125.

The differences are descriptive. The dataset does not provide sufficient information about the classification date or observation period to establish a temporal or causal relationship.

### Transaction Recency

| Classification | Average Months Since Last Transaction | Median |
|---|---:|---:|
| Not Churned | 19.60 | 19 |
| Churned | 7.60 | 7 |

The Mann–Whitney U test indicated a statistically significant difference:

- U statistic: 21,585,032
- p-value: Below displayed precision
- Rank-biserial correlation: -0.75898

The not-churned group had higher recency values than the churn-labelled group. This counterintuitive pattern requires caution when interpreting the supplied classification.

## 4. Card Ownership

### Total Active Cards

| Classification | Average Active Cards | Customers with Zero Active Cards |
|---|---:|---:|
| Not Churned | 0.33 | 66.70% |
| Churned | 1.12 | 5.36% |

A chi-square test found a strong association between having zero active cards and the supplied classification:

- Chi-square statistic: 4,911.641
- Degrees of freedom: 1
- p-value: Below displayed precision
- Cramér's V: 0.6589

This was one of the strongest observed associations in the analysis.

### Visa and Mastercard Ownership

Both Visa and Mastercard ownership differed statistically between the two groups.

| Card Type | Rank-Biserial Correlation |
|---|---:|
| Visa | 0.2181 |
| Mastercard | 0.0626 |

The association was stronger for Visa ownership than Mastercard ownership.

## 5. Billing and Credit Behaviour

### Total Billing Amount

| Classification | Average Total Billing | Median Total Billing |
|---|---:|---:|
| Not Churned | 97,102,013.67 | 43,283,244.50 |
| Churned | 254,646,710.56 | 135,887,131.00 |

The Mann–Whitney U test indicated a statistically significant difference:

- U statistic: 6,088,074
- p-value: Below displayed precision
- Rank-biserial correlation: 0.52763

### Customer Credit Limit

| Classification | Average Credit Limit | Median Credit Limit |
|---|---:|---:|
| Not Churned | 13,922,896.73 | 10,000,000 |
| Churned | 21,014,067.30 | 13,000,000 |

The Mann–Whitney U test indicated a statistically significant difference:

- U statistic: 9,481,181
- p-value: 2.5281e-106
- Rank-biserial correlation: 0.26436

### Usage Percentage

| Classification | Average Usage Percentage | Median |
|---|---:|---:|
| Not Churned | 717.68 | 376.665 |
| Churned | 1,381.39 | 882.14 |

The Mann–Whitney U test indicated a statistically significant difference:

- U statistic: 6,695,828
- p-value: Below displayed precision
- Rank-biserial correlation: 0.48047

The usage percentage was not interpreted as conventional credit utilisation because its definition and measurement period were not documented.

## 6. Logistic Regression Findings

Logistic regression was used to investigate how multiple customer attributes related to the supplied classification.

The data was split into training and test sets using an 80:20 stratified split. Standardisation was fitted on the training data.

### Model 1: Aggregate Transaction Count

The first model included `Counttrx` as a predictor.

| Metric | Test Result |
|---|---:|
| Accuracy | 95.60% |
| ROC-AUC | 0.9752 |

### Model 2: Excluding Aggregate Transaction Count

A second model excluded `Counttrx`.

| Metric | Test Result |
|---|---:|
| Accuracy | 89.61% |
| ROC-AUC | 0.9526 |

### Model 3: Annual Transaction Counts

The third model replaced the aggregate transaction count with annual transaction counts from 2022 to 2025.

| Metric | Test Result |
|---|---:|
| Accuracy | 95.87% |
| ROC-AUC | 0.9877 |

This model recorded the highest test accuracy and ROC-AUC among the three models investigated.

However, the annual transaction fields and supplied classification may contain overlapping information. The absence of a documented classification date and observation period prevents the model from being presented as a validated future churn prediction system.

## 7. Overall Statistical Takeaways

The analysis identified several notable patterns:

1. Card ownership, particularly having zero active cards, showed a strong association with the supplied classification.
2. Transaction behaviour differed substantially between the two classification groups.
3. Billing amount and usage percentage also showed meaningful differences.
4. Demographic variables showed limited associations.
5. The annual transaction model achieved the highest observed test performance, but its predictive interpretation is limited by the dataset documentation.

These findings describe statistical associations within the supplied dataset. They do not establish causation or prove that any individual factor causes customer churn.
