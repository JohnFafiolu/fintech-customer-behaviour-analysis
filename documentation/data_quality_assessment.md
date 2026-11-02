# Data Quality Assessment

## 1. Dataset Overview

- **Dataset:** Churn XYZ v1.0
- **Source:** [Zenodo](https://doi.org/10.5281/zenodo.17214115)
- **Records:** 11,314 customers
- **Attributes:** 27 columns
- **Unique customer identifiers:** 11,314

Each row represents a customer record. The CIF field was checked for uniqueness, and no duplicate identifiers were found.

## 2. Missing Values

Missing values were identified in the following fields:

| Column | Missing records |
|---|---:|
| CustSex | 3 |
| CustMaritalStatus | 229 |
| LastTrxDate | 297 |
| MonthsSinceLastTrx | 297 |

The missing values were preserved rather than replaced with assumed values. In particular, missing transaction recency values were not converted to zero, as zero would represent a different meaning.

## 3. Structural and Consistency Checks

The dataset was checked for structural issues and inconsistencies across related fields.

### Card Ownership

The `TotalActiveCard` field did not consistently equal the sum of `CustVisaCard` and `CustMastercardCard` for 7,628 customer records.

The supplied values were retained without forcing reconciliation because the dataset documentation does not establish that these fields must sum to the same total.

### Transaction Counts

The `Counttrx` field was compared with the sum of annual transaction counts from 2022 to 2025. Six records did not match.

The supplied values were retained.

### Average Transactions per Month

The `AvgTrxPerMonth` field did not match the calculated ratio of `Counttrx` to `TotalActiveMonths` for 4,192 records.

The original values were preserved because the dataset does not document the precise calculation method.

### Average Billing Amount

Eight records did not match the calculated ratio of `TotalBillingAmount` to `Counttrx`.

The supplied values were retained.

### Usage Percentage

Nine records did not match the calculated ratio of `TotalBillingAmount` to `CustLimit`, multiplied by 100.

The original values were retained. The field was not assumed to represent conventional credit utilisation.

## 4. Date Field Assessment

The fields `FirstDteOpen`, `LastDteOpen`, `FirstExpDate`, and `LastExpDate` contain day-and-month values without a year.

These fields were not used to reconstruct dates or calculate customer tenure because the missing year information makes such calculations unreliable.

## 5. Data Preparation Decisions

The following decisions guided the preparation process:

- Preserved missing values rather than making unsupported replacements.
- Retained supplied values where related fields did not reconcile.
- Kept the original classification field for analysis.
- Avoided reconstructing incomplete dates.
- Retained unusual but valid-looking numerical values pending further documentation.
- Kept customer identifiers and names out of public project outputs.

## 6. Conclusion

The dataset was structurally prepared for SQL and Python analysis. However, several fields contain missing values, undocumented definitions, or inconsistencies between related measures.

These issues were documented rather than silently corrected, so that subsequent analysis would remain transparent about the limitations of the supplied data.
