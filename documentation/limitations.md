# Project Limitations

## 1. Undocumented Churn Classification

The dataset provides a binary `Churn` field:

- `0`: Not churned
- `1`: Churned

However, the dataset documentation does not explain the operational definition of churn, the criteria used to assign the labels, or the date on which classification occurred.

Therefore, the analysis treats `Churn` as a supplied classification rather than a verified measure of customer attrition.

## 2. Unknown Observation Period

The dataset does not clearly document its extraction date or the observation period covered by the transaction variables.

Although annual transaction fields are available for 2022 to 2025, the publication date does not establish when the underlying customer data was collected.

Consequently, the analysis does not assume that the 2025 data represents a complete calendar year or use the transaction patterns to establish when churn occurred.

## 3. Incomplete Date Information

The fields `FirstDteOpen`, `LastDteOpen`, `FirstExpDate`, and `LastExpDate` contain day-and-month values without years.

This prevents reliable reconstruction of dates and limits the ability to calculate customer tenure or conduct time-based analysis using these fields.

## 4. Missing Values

Some demographic and transaction recency fields contain missing values.

These values were preserved rather than replaced with assumptions. Analyses involving these variables may therefore use fewer observations than the full dataset.

## 5. Inconsistencies Across Related Variables

Several related fields did not reconcile during data quality assessment.

Examples include:

- Total active cards versus the sum of Visa and Mastercard cards.
- Aggregate transaction counts versus annual transaction totals.
- Average monthly transaction counts versus calculated ratios.
- Average billing amounts versus calculated ratios.
- Usage percentages versus calculated billing-to-limit ratios.

The supplied values were retained because the dataset documentation does not provide sufficient definitions to determine which values, if any, should be corrected.

## 6. Undocumented Monetary Units

The dataset does not clearly specify the currency or measurement period for billing amounts and customer credit limits.

Consequently, these variables were compared using their supplied numerical values without assigning an undocumented currency or interpreting them as specific financial periods.

## 7. Statistical Association Does Not Establish Causation

The statistical tests identify differences and associations between customer characteristics and the supplied classification.

They do not establish that any customer characteristic or behaviour causes churn.

Similarly, statistically significant results should be interpreted alongside effect sizes and the context of the dataset.

## 8. Predictive Modelling Limitations

The logistic regression models were evaluated using a stratified train-test split.

Although the models recorded high test performance, several limitations remain:

- The operational definition and timing of the churn label are unknown.
- The observation period is not clearly documented.
- Some transaction variables may overlap with information used to assign the classification.
- The models have not been validated on an independent dataset or through a time-based validation strategy.

The results should therefore be interpreted as classification performance on the available dataset, not proof of reliable future churn prediction.

## 9. Generalisability

The analysis is based on one supplied dataset. Its findings may not represent the behaviour of customers across other financial institutions, products, markets, or periods.

Further validation using well-documented data from additional sources would be required before applying the findings more broadly.

## 10. Overall Limitation

The project demonstrates how SQL, Python, statistical testing, and logistic regression can be used to investigate customer behaviour and supplied classifications.

However, the quality and interpretation of the findings remain dependent on the definitions, completeness, and reliability of the original dataset.
