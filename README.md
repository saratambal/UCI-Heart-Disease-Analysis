# UCI Heart Disease Analysis

## 1. Project Objective

Explore the UCI Heart Disease dataset using R, with a focus on data inspection, missing values, and clinical data visualization.

## 2. Dataset Overview

* Number of records: 303
* Number of variables: 14
* Original data file: `processed.cleveland.data`
* Dataset source: [UCI Machine Learning Repository — Heart Disease](https://archive.ics.uci.edu/dataset/45/heart+disease)
* Subset used: Cleveland
* Data file: `processed.cleveland.data`

## 3. Data Quality

* Total missing values: 6
* Missing values in `ca`: 4
* Missing values in `thal`: 2
* Missing values are represented as `?` in the original file and converted to `NA` during import.

## 4. Exploratory Findings

* The largest five-year age group is 55 to less than 60 years.
* This group contains 69 participants (approximately 22.8% of the dataset).

## 5. Interpretation and Limitations

The age distribution describes the participants in this dataset. It does not, by itself, establish a relationship between age and heart disease.

### Age Distribution by Heart Disease Status

The dataset was divided into two groups based on the original diagnosis variable: no disease (`num = 0`) and disease (`num > 0`).

| Age statistic | No disease (n = 164) | Disease (n = 139) |
| ------------- | -------------------: | ----------------: |
| Median age    |             52 years |          58 years |
| Mean age      |          52.59 years |       56.63 years |

**Observation:** Participants classified in the disease group had a higher median age (58 vs. 52 years) and a higher mean age (56.63 vs. 52.59 years).

**Interpretation:** The disease group had a higher mean and median age than the no-disease group. This descriptive comparison does not establish causation or statistical significance.

## 6. Statistical Comparison of Mean Age

Welch's two-sample t-test was used to compare mean age between the disease and no-disease groups. This test does not assume equal population variances.

- Mean age (No disease): 52.59 years
- Mean age (Disease): 56.63 years
- Test statistic: t = -4.0303
- Degrees of freedom: 300.93
- p-value: 0.00007061
- 95% confidence interval for the difference in means (No disease − Disease): -6.01 to -2.07 years

**Interpretation:** The test provides statistically significant evidence of a difference in mean age between the two groups at the 0.05 significance level. Participants in the disease group were older on average by approximately 4.04 years.

This result does not establish causation or demonstrate that age independently predicts heart disease.

### 7. Association Between Sex and Heart Disease Status

A Chi-square test of independence with Yates' continuity correction was used to assess the association between sex and heart disease status.

* Female disease proportion: 25.77% (25/97)
* Male disease proportion: 55.34% (114/206)
* Test statistic: χ² = 22.043
* Degrees of freedom: 1
* p-value: 0.000002667

**Interpretation:** The test provides statistically significant evidence of an association between sex and heart disease status in this dataset at the 0.05 significance level. The proportion of participants classified as having heart disease was higher among males (55.34%) than females (25.77%).

This association does not establish causation and does not account for potential confounding variables.

### 8. Association Between Cholesterol Levels and Heart Disease Status

A Welch's two-sample t-test was used to compare mean cholesterol levels between the disease and no-disease groups.

* Mean cholesterol (No disease): 242.64
* Mean cholesterol (Disease): 251.47
* Test statistic: t = -1.4924
* Degrees of freedom: 298.64
* p-value: 0.1366
* 95% confidence interval for the difference in means (No disease − Disease): -20.48 to 2.82

**Interpretation:** The test did not provide statistically significant evidence of a difference in mean cholesterol levels between the two groups at the 0.05 significance level. The mean cholesterol level was higher among participants classified as having heart disease (251.47) than among those classified as having no disease (242.64).

This result does not establish causation. It also does not provide sufficient evidence to conclude that cholesterol levels are unrelated to heart disease status.

## 9. Limitations

* This analysis uses the Cleveland subset of the UCI Heart Disease dataset, which contains 303 records. The findings may not generalize to other populations.
* The analysis compares participants by heart disease status using descriptive statistics and unadjusted statistical tests.
* Potential confounding variables were not controlled for in these comparisons.
* Missing values were identified in `ca` and `thal`. No imputation was performed in the analyses presented here.
* Statistical associations do not establish causation. A non-significant result does not prove that no association exists

## 10. How to Run the Analysis

1. Clone or download this repository.
2. Open `UCI_Heart_Disease_Analysis.Rproj` in RStudio.
3. Open `heart_disease_analysis.R`.
4. Run the script from beginning to end.

**Requirements:** R and RStudio.
