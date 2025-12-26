# 📊 Student Performance Analysis (R)

## Overview
This project analyzes how family dynamics, romantic status, and address type
(urban vs rural) relate to student academic performance using statistical
methods in R.

The analysis uses exploratory data analysis (EDA), two-way ANOVA, interaction
plots, and post-hoc testing to evaluate both main and interaction effects.

## Key Questions
- Does family educational support affect final grades?
- Does family relationship quality matter?
- Do romantic status and address type significantly influence academic outcomes?

## Data
- Source: UCI Machine Learning Repository – Student Performance Dataset
- Observations: 395 Portuguese secondary school students
- Target Variable: Final Grade (G3)

## Methods
- Data cleaning and factor recoding
- Boxplots and interaction plots
- Two-way ANOVA
- Linear regression modeling
- Tukey HSD post-hoc analysis
- Model diagnostics (residuals, Q-Q plots)

## Key Findings
- Family support and family relationship quality showed **no significant effect**
- Romantic status and address type were **statistically significant predictors**
- Urban and single students performed better on average
- No strong interaction effects were observed

## Repository Structure
```text
scripts/   -> R scripts for each analysis stage  
data/      -> Raw dataset  
docs/      -> Full project report (PDF)
