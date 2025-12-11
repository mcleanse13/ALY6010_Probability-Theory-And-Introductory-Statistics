Hypothesis Testing in Healthcare Data: One-Sample t-Tests in R

This project focuses on conducting hypothesis testing using one-sample t-tests in R to analyze two variables from a health dataset of 1,000 individuals. The objective was to determine whether the population means of selected variables significantly differ from hypothesized values, using the t.test() function in R.

In the first analysis, the Body Mass Index (BMI) variable was tested against a hypothesized population mean of 24. The resulting t-value of 3.5913 and p-value of 0.0003 indicated strong evidence to reject the null hypothesis, suggesting that the true population mean BMI is not equal to 24. The sample mean (24.39) was slightly higher than the hypothesized value, confirming a statistically significant difference.

In the second analysis, the Exercise Frequency variable was tested against a hypothesized mean of 1. The t-value of -1.8247 and p-value of 0.0683 exceeded the 0.05 threshold, meaning there was insufficient evidence to reject the null hypothesis. This suggests that the true population mean for exercise frequency is likely not significantly different from 1.

Overall, the results illustrate how p-values guide decisions in hypothesis testing and demonstrate practical application of inferential statistics using R, emphasizing the interpretation of t-statistics, confidence intervals, and hypothesis formulation.
