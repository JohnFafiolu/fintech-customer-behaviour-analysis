# Fintech Customer Behaviour & Classification Analysis

An end-to-end data analysis project investigating customer characteristics, transaction patterns, card ownership, billing behaviour, and supplied churn classifications using SQL, Python, and statistical methods.

## Project Overview

Customer behaviour data can reveal patterns that are not immediately obvious from summary reports.

This project investigates how customer characteristics and behavioural patterns differ across the two classifications provided in the Churn XYZ dataset.

Rather than relying solely on descriptive dashboards, the analysis combines SQL-based exploration, statistical hypothesis testing, and logistic regression to examine the strength and significance of observed relationships.

## Research Question

**What customer characteristics and behavioural patterns distinguish customers across the two classifications supplied in the dataset?**

## Tools and Technologies

- **PostgreSQL:** Data storage, querying, classification, aggregation, and exploratory analysis.
- **Python:** Data analysis, statistical testing, correlation analysis, and logistic regression.
- **Google Colab:** Python analysis environment.
- **Microsoft Excel:** Initial data inspection, preparation, and quality assessment.
- **GitHub:** Version control and project documentation.

## Dataset

- **Name:** Churn XYZ v1.0
- **Source:** [Zenodo](https://doi.org/10.5281/zenodo.17214115)
- **Records:** 11,314 customer records
- **Attributes:** 27 columns

The dataset contains customer demographics, card ownership, transaction activity, billing information, and a binary classification field.

The original dataset is not included in this repository. Please refer to the original source for access.

## Project Workflow

The project followed this analytical process:

1. **Data Inspection:** Examined the dataset structure, fields, and initial quality.
2. **Data Preparation:** Prepared the working data and documented missing values and inconsistencies.
3. **SQL Analysis:** Investigated customer classifications, demographics, transaction patterns, card ownership, billing, and usage.
4. **Statistical Analysis:** Applied descriptive statistics, hypothesis testing, and effect-size measures.
5. **Predictive Modelling:** Developed and evaluated logistic regression models using different transaction predictors.
6. **Documentation:** Recorded findings, data quality decisions, and analytical limitations.

## Power BI Dashboard

An interactive four-page Power BI report exploring customer classification, transaction behaviour, card ownership, billing patterns and statistical evidence.

The dashboard contains:

1. Customer Overview
2. Customer Behaviour
3. Statistical Evidence
4. Insights & Recommendations

**View the dashboard:**
- [Power BI Dashboard (.pbix)](dashboard/fintech_customer_churn.pbix)
- [PDF Report](dashboard/fintech_customer_churn.pdf)
- [Dashboard Documentation](dashboard/README.md)
## Key Findings

- The supplied churn classification was imbalanced, with 72.05% of records labelled as churned.
- Demographic variables showed limited associations with the supplied classification.
- Transaction counts differed substantially between the two classification groups.
- Having zero active cards showed a strong association with the supplied classification.
- Billing amount and usage percentage also differed between the groups.
- The annual transaction logistic regression model achieved 95.87% test accuracy and a ROC-AUC of 0.9877 among the models investigated.

These findings describe associations within the supplied dataset. They do not establish causation or demonstrate validated future churn prediction.

## Repository Structure

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
└── dashboard/
```
## Important Limitations

The dataset documentation does not establish the operational definition or timing of the churn classification.

Other limitations include incomplete date information, missing values, inconsistencies across related fields, and undocumented monetary units.

Consequently, the project treats the target variable as a supplied classification and interprets model performance cautiously.

Further details are available in the [Project Limitations](documentation/limitations.md) document.

## Author

**John Fafiolu**

Statistician | Data Analyst
