# ALY 6010 Final Project – Exploratory and Inferential Data Analysis: NCAA Basketball Ranking Analytics

## Overview
This project explores relationships within NCAA Division I college basketball rankings from the 2020–2021 season through **exploratory data analysis (EDA)**, **hypothesis testing**, and **regression modeling**.  
The dataset, obtained from Kaggle, contains over **250,000 records** representing weekly rankings from multiple systems such as the Associated Press and USA Today Coaches polls.  

The analysis aimed to identify meaningful statistical patterns, evaluate hypotheses, and uncover correlations between ranking systems and teams’ performances over time.

---

## Objectives
1. Conduct exploratory data analysis (EDA) to understand dataset structure, variable types, and overall distribution.  
2. Formulate and test hypotheses comparing rankings across time and between systems.  
3. Apply regression and correlation analysis to determine relationships between ranking systems and ranking stability.  
4. Communicate findings through visualizations and data-driven insights.

---

## Dataset
- **Source:** Kaggle (compiled dataset of all NCAA Division I basketball rankings for the 2020–2021 season)  
- **Size:** ~250,000 rows × 7 columns  
- **Data types:** mix of numerical (weeks, rankings, IDs) and categorical (school name, ranking system, season)  
- **Primary focus:** The Associated Press (AP) poll, which ranks the top 25 schools weekly.  

---

## Methods and Analysis
### 1. Exploratory Data Analysis (EDA)
- Cleaned and condensed the dataset by removing redundant columns (`season`, `letter_code`).
- Focused on one ranking system (AP poll) for clarity and interpretability.
- Created descriptive summaries and visualizations (histograms, boxplots, scatterplots) to explore data distributions and identify trends.

### 2. Hypothesis Testing
Formulated and tested three main hypotheses:
1. **Poll Stability:** Whether the mean rankings of teams differ significantly between the first and final AP polls.  
   - *Result:* Mean difference (1.5 points) not statistically significant — failed to reject the null hypothesis.
2. **Poll Correlation:** Whether rankings between the AP and USA Today Coaches polls correlate positively.  
   - *Result:* Strong positive correlation found — sufficient evidence to reject the null hypothesis.
3. **Poll Consistency Over Time:** Whether the schools ranked in the two systems changed consistently between the first and last polls.  
   - *Result:* Regression results showed minimal change — failed to reject the null hypothesis.

### 3. Regression Analysis
- Conducted linear regression to evaluate the relationships between rankings, systems, and time.  
- Identified patterns of ranking consistency and outlier behavior between systems.

---

## Key Findings
- Only **47 schools** were ranked at least once in the top 25 during the 2020–2021 season, with a small subset dominating the rankings throughout.  
- **Baylor** appeared most frequently and maintained a top-tier ranking across the season.  
- Strong positive correlation between AP and Coaches polls, indicating similar team evaluations.  
- Mean rankings between the first and last polls remained largely unchanged, confirming ranking stability among top programs.  

---

## Tools & Libraries
- **R** (tidyverse, ggplot2, dplyr, stats)
- **Excel** for initial data inspection and cleaning
- **Visualization tools:** histograms, scatterplots, regression line plots, boxplots

---

## Insights & Future Work
- Future analyses could compare additional ranking systems and include multiple seasons to assess long-term consistency and ranking volatility.  
- Adding more advanced regression models (multivariate, logistic) could help predict which early-season rankings best forecast postseason outcomes.  
- Integrating contextual performance data (win-loss records, strength of schedule) would improve model precision.  
