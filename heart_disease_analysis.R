
# UCI Heart Disease Analysis
# Purpose: Explore clinical data and practice R visualization

# 1. Import data

heart <- read.csv(
  "data/processed.cleveland.data",
  header = FALSE,
  na.strings = "?"
)

# 2. Inspect data

dim(heart)
str(heart)
head(heart)

# Assign meaningful column names

names(heart) <- c(
  "age", "sex", "cp", "trestbps", "chol", "fbs",
  "restecg", "thalach", "exang", "oldpeak", "slope",
  "ca", "thal", "num"
)

# Check the column names

names(heart)


# 3. Prepare variables

heart$sex <- factor(heart$sex)
heart$cp <- factor(heart$cp)
heart$fbs <- factor(heart$fbs)
heart$restecg <- factor(heart$restecg)
heart$exang <- factor(heart$exang)
heart$slope <- factor(heart$slope)
heart$thal <- factor(heart$thal)

# Create a binary diagnosis variable

heart$disease_status <- ifelse(
  heart$num == 0,
  "No disease",
  "Disease"
)

heart$disease_status <- factor(
  heart$disease_status,
  levels = c("No disease", "Disease")
)

# Check the group sizes

table(heart$disease_status)

# Inspect the data types

str(heart)

# 4. Explore missing values

# Count all missing values

sum(is.na(heart))

# Count missing values in each column

colSums(is.na(heart))

# Show only columns that contain missing values

colSums(is.na(heart))[colSums(is.na(heart)) > 0]


# Percentage of missing values in each column

missing_percent <- colMeans(is.na(heart)) * 100

round(missing_percent, 2)

# 5. Visualize data

library(ggplot2)

ggplot(heart, aes(x = age)) +
  geom_histogram(
    binwidth = 5,
    boundary = 0,
    color = "white"
  ) +
  labs(
    title = "Age Distribution in the UCI Heart Disease Dataset",
    x = "Age (years)",
    y = "Number of participants"
  ) +
  theme_minimal()


# Count participants in each 5-year age group

age_groups <- cut(
  heart$age,
  breaks = seq(25, 80, by = 5),
  right = FALSE
)

sort(table(age_groups), decreasing = TRUE)

# Age Distribution by Heart Disease Status

ggplot(heart, aes(x = disease_status, y = age)) +
  geom_boxplot() +
  labs(
    title = "Age Distribution by Heart Disease Status",
    x = "Heart Disease Status",
    y = "Age (years)"
  ) +
  theme_minimal()



# 6. Compare age by heart disease status

# Calculate the median age in each group
aggregate(
  age ~ disease_status,
  data = heart,
  FUN = median
)

# Calculate the mean age in each group
aggregate(
  age ~ disease_status,
  data = heart,
  FUN = mean
)

# Compare mean age between the two independent groups

# using Welch's two-sample t-test.

# Welch's test does not assume equal group variances.

t.test(
  age ~ disease_status,
  data = heart
)

# Interpretation:

# The test provides statistically significant evidence of a difference in mean age between the two groups.The mean age is higher in the disease group.This analysis does not establish causation.



# 7. Explore sex and heart disease status

# Count participants by sex and disease status

table(heart$sex, heart$disease_status)

# Calculate disease status percentages within each sex

# Rows sum to 100%, allowing comparison within each sex

prop.table(
  table(heart$sex, heart$disease_status),
  margin = 1
) * 100

# Test the association between sex and disease status

chisq.test(
  table(heart$sex, heart$disease_status)
)

# Association between sex and heart disease status is statistically significant 

# 8. Cholesterol Distribution Analysis

# Explore the distribution of serum cholesterol levels
# using a histogram.

hist(heart$chol)

# Compare cholesterol levels by disease status

# using boxplots.

boxplot(chol ~ disease_status, data = heart,
        main = "Cholesterol by Disease Status",
        xlab = "Disease Status",
        ylab = "Cholesterol Level")

# Calculate mean cholesterol in each disease group

aggregate(chol ~ disease_status, data = heart, mean, na.rm = TRUE)

t.test(chol ~ disease_status, data = heart )

boxplot.stats(heart$chol)$out

by (
  heart$chol,
  heart$disease_status,
  function(x) boxplot.stats(x)
)
