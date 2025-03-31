-- Economic Inequality | Exploratory Data Analysis

-- Wealth Share (%)

-- Top 10 countries where the richest 1% hold the highest share of total wealth
SELECT country AS "Country", richest_1_wealth_share AS "Wealth Share of the Richest 1%"
FROM wealth_share_richest_1
WHERE report_year=2022 AND richest_1_wealth_share IS NOT NULL
ORDER BY richest_1_wealth_share DESC
LIMIT 10;

-- Top 10 countries where the richest 10% hold the highest share of total wealth
SELECT country AS "Country", richest_10_wealth_share AS "Wealth Share of the Richest 10%"
FROM wealth_share_richest_10
WHERE report_year=2022 AND richest_10_wealth_share IS NOT NULL
ORDER BY richest_10_wealth_share DESC
LIMIT 10;

-- Wealth concentration in major economies
SELECT w10.country AS "Country", 
w1.richest_1_wealth_share AS "Wealth Share of Richest 1%", 
w10.richest_10_wealth_share AS "Wealth Share of Richest 10%"
FROM 
wealth_share_richest_10 AS w10
JOIN 
    wealth_share_richest_1 AS w1 
    ON w10.country = w1.country 
    AND w10.report_year = w1.report_year
WHERE 
    w10.country IN ('India', 'United States', 'Canada', 'South Africa', 'Brazil', 'Russia', 'China', 'Australia') 
AND w10.report_year = 2022
ORDER BY 
    w10.richest_10_wealth_share DESC;

-- Income Inequality - Gini Coefficient

-- Identify the countries with the highest post-tax Gini coefficient in 2022.
SELECT country AS "Country",
gini_post_tax AS "Gini Coefficient After Tax"
FROM gini_coefficient_before_vs_after_tax
WHERE report_year = 2022 AND gini_post_tax IS NOT NULL
ORDER BY gini_post_tax DESC
LIMIT 10;

-- Identify the countries with the highest pre-tax Gini coefficient in 2022.
SELECT country AS "Country",
gini_pre_tax AS "Gini Coefficient Before Tax"
FROM gini_coefficient_before_vs_after_tax
WHERE report_year = 2022 AND gini_pre_tax IS NOT NULL
ORDER BY gini_pre_tax DESC
LIMIT 10;

-- Compare the Gini coefficient before and after tax in key economies.
SELECT country AS "Country", 
gini_pre_tax AS "Gini Coefficient Before Tax",
gini_post_tax AS "Gini Coefficient After Tax"
FROM gini_coefficient_before_vs_after_tax
WHERE country IN ('India', 'United States', 'Canada', 'Germany', 'Brazil', 'Russia', 'China', 'Australia') 
AND report_year = 2022
ORDER BY gini_post_tax DESC
LIMIT 10;

-- Countries with the lowest income inequality in 2022
SELECT country AS "Country",
gini_post_tax AS "Gini Coefficient After Tax"
FROM gini_coefficient_before_vs_after_tax
WHERE report_year = 2022 AND gini_post_tax IS NOT NULL
ORDER BY gini_post_tax Asc
LIMIT 10;

-- Income or Consumption Levels (international $ at 2017 prices)

-- Identify the countries where the bottom 10% of the population have the lowest income in 2022.
SELECT country AS "Country", 
income_poorest_10 AS "Income or Consumption of the Poorest 10%"
FROM income_consumption_of_poorest_richest_decile
WHERE report_year = 2022 AND income_poorest_10 IS NOT NULL
ORDER BY income_poorest_10 ASC
LIMIT 10;

-- Identify the countries where the top 10% of the population earn the highest incomes.
SELECT country AS "Country", income_richest_10 AS "Income of the Richest 10%"
FROM income_consumption_of_poorest_richest_decile
WHERE report_year = 2022 AND income_richest_10 IS NOT NULL
ORDER BY income_richest_10 DESC
LIMIT 10;

-- Distribution of Income

-- Compare how income is distributed across different groups in key economies pre-tax
SELECT country AS "Country", 
       top_1_share_pretax AS "Richest 1%", 
       top_10_share_pretax AS "Richest 10%", 
       middle_40_share_pretax AS "Middle 40%", 
       poorest_50_share_pretax AS "Poorest 50%"
FROM income_share_distribution_pre_tax
WHERE report_year = 2022 
AND country IN ('India', 'United States', 'Canada', 'Mexico', 'Brazil', 'Russia', 'China', 'Australia')
ORDER BY top_10_share_pretax DESC;

-- Compare how income is distributed across different groups in key economies post-tax
SELECT country AS "Country", 
       top_1_share_post_tax AS "Richest 1%", 
       top_10_share_post_tax AS "Richest 10%", 
       middle_40_share_post_tax AS "Middle 40%", 
       poorest_50_share_post_tax AS "Poorest 50%"
FROM income_share_distribution_post_tax
WHERE report_year = 2022 
AND country IN ('India', 'United States', 'Canada', 'Mexico', 'Brazil', 'Russia', 'China', 'Australia')
ORDER BY top_10_share_post_tax DESC;





