# Economic Inequality: Data Cleaning and Exploratory Data Analysis (EDA) | SQL

## Objective

This project focuses on analyzing global economic inequality using SQL. The dataset includes metrics such as wealth distribution, income inequality (pre-tax and post-tax), and income or consumption levels across different economic groups. The goal is to clean the data, explore key insights, and highlight patterns in wealth concentration and income distribution worldwide.

## Data Sources

1. **Wealth share of the richest 10%**  
   World Inequality Database (WID.world) (2025) – Processed by Our World in Data  
   [Dataset link](https://ourworldindata.org/grapher/wealth-share-richest-10-percent)

2. **Wealth share of the richest 1%**  
   World Inequality Database (WID.world) (2025) – Processed by Our World in Data  
   [Dataset link](https://ourworldindata.org/grapher/wealth-share-richest-1-percent)

3. **Income inequality: Gini coefficient before and after tax**  
   World Inequality Database (WID.world) (2025) – Processed by Our World in Data  
   [Dataset link](https://ourworldindata.org/grapher/income-share-distribution-after-tax-wid)

4. **Distribution of income across richer and poorer groups (before tax)**  
   World Inequality Database (WID.world) (2025) – Processed by Our World in Data  
   [Dataset link](https://ourworldindata.org/grapher/income-share-distribution-before-tax-wid)

5. **Distribution of income across richer and poorer groups (after tax)**  
   World Inequality Database (WID.world) (2025) – Processed by Our World in Data  
   [Dataset link](https://ourworldindata.org/grapher/income-share-distribution-after-tax-wid)

6. **Income or consumption of the poorest and richest 10%**  
   World Bank Poverty and Inequality Platform (2024) – Processed by Our World in Data  
   [Dataset link](https://ourworldindata.org/grapher/daily-income-of-the-poorest-and-richest-decile)

## Methodology

The analysis was performed using SQL, focusing on data cleaning and exploratory data analysis (EDA). The key steps included:

- **Data Cleaning**: Handling missing values, standardizing formats, and ensuring consistency in the dataset.
- **Exploratory Data Analysis**: Using SQL queries to extract insights into wealth distribution, income inequality, and the impact of taxation on income distribution.
- **Comparative Analysis**: Identifying differences in economic inequality across countries by analyzing key indicators such as the Gini coefficient and income shares of different economic groups.

The results of this analysis have been visualized in an interactive **Tableau dashboard**. You can explore the visual representation of this data here:

- [**Tableau Dashboard**](https://public.tableau.com/app/profile/yugandhara.yeolekar/viz/EconomicInequality/EconomicInequality) 
- [**GitHub Repository for Tableau Project**](https://github.com/Yugandhara-Yeolekar/Economic-Inequality-Tableau)

## 🔍 Key Findings / Insights
*The insights presented below are based on data from the year 2022.*

### Which countries have the highest wealth concentration in the top 1%?
| Rank | Country      | Wealth Share (%) |
|------|--------------|------------------|
| 1    | South Africa | 55.33            |
| 2    | Eswatini     | 50.22            |
| 3    | Namibia      | 46.41            |
| 4    | Mexico       | 46.00            |
| 5    | Colombia     | 45.69            |

### Where do the richest 10% hold the largest share of national wealth?
| Rank | Country      | Wealth Share (%) |
|------|--------------|------------------|
| 1    | South Africa | 85.75            |
| 2    | Eswatini     | 80.44            |
| 3    | Namibia      | 79.73            |
| 4    | Colombia     | 79.00            |
| 5    | Mexico       | 78.66            |

### How concentrated is wealth in major economies?
| Country       | Richest 1% | Richest 10% |
|---------------|------------|-------------|
| United States | 35.59      | 71.29       |
| Canada        | 24.71      | 58.22       |
| Brazil        | 45.12      | 78.10       |
| China         | 30.35      | 68.03       |
| India         | 34.86      | 66.33       |

### Which countries have the highest income inequality after taxes?
The Gini coefficient measures inequality on a scale from 0 to 1. Higher values indicate higher inequality.
| Rank | Country   | Post-tax Gini Coefficient |
|------|-----------|---------------------------|
| 1    | Mexico    | 0.682                     |
| 2    | Eswatini  | 0.675                     |
| 3    | Angola    | 0.665                     |
| 4    | Peru      | 0.655                     |
| 5    | Yemen     | 0.654                     |

### Where is income inequality highest before taxes?
| Rank | Country      | Pre-tax Gini Coefficient |
|------|--------------|--------------------------|
| 1    | South Africa | 0.739                    |
| 2    | Namibia      | 0.731                    |
| 3    | Colombia     | 0.725                    |
| 4    | Mexico       | 0.709                    |
| 5    | Eswatini     | 0.696                    |

### How do tax systems affect inequality in key economies?
| Country       | Pre-tax Gini | Post-tax Gini |
|---------------|--------------|---------------|
| Brazil        | 0.692        | 0.638         |
| India         | 0.627        | 0.611         |
| Russia        | 0.587        | 0.558         |
| China         | 0.566        | 0.535         |
| United States | 0.588        | 0.462         |

### Which countries have the lowest income inequality?
| Rank | Country    | Gini Coefficient |
|------|------------|------------------|
| 1    | Denmark    | 0.215            |
| 2    | Iceland    | 0.219            |
| 3    | Sweden     | 0.247            |
| 4    | Switzerland| 0.249            |
| 5    | Czechia    | 0.256            |

### Where do the poorest 10% earn the smallest share of income?
| Rank | Country    | Income Share (%) |
|------|------------|------------------|
| 1    | Zambia     | 0.50             |
| 2    | Chad       | 1.40             |
| 3    | Syria      | 1.58             |
| 4    | Bangladesh | 2.53             |
| 5    | Colombia   | 2.94             |

### Which countries have the highest incomes for the top 10%?
| Rank | Country      | Income Share (%) |
|------|--------------|------------------|
| 1    | United States | $156.42           |
| 2    | Chile        | $54.89            |
| 3    | Uruguay      | $53.95            |
| 4    | Costa Rica   | $51.51            |
| 5    | Brazil       | $43.25            |

### How is income distributed before taxation?
| Country       | Richest 1% | Richest 10% | Middle 40% | Poorest 50% |
|---------------|------------|-------------|------------|-------------|
| India         | 25.50      | 59.70       | 25.99      | 14.31       |
| Mexico        | 21.58      | 59.63       | 32.81      | 7.56        |
| Brazil        | 21.13      | 59.21       | 31.66      | 9.12        |
| Russia        | 24.33      | 51.41       | 33.11      | 15.47       |
| United States | 20.73      | 46.86       | 39.80      | 13.34       |

### How does taxation change income distribution?
| Country       | Richest 1% | Richest 10% | Middle 40% | Poorest 50% |
|---------------|------------|-------------|------------|-------------|
| Mexico        | 23.45      | 58.41       | 32.12      | 9.47        |
| India         | 21.96      | 56.72       | 28.44      | 14.84       |
| Brazil        | 19.97      | 56.35       | 31.10      | 12.55       |
| China         | 14.10      | 40.97       | 43.64      | 15.38       |
| United States | 14.35      | 36.75       | 42.38      | 20.87       |

## Conclusion

This analysis highlights the stark disparities in global wealth and income distribution. Some nations, particularly those with high wealth concentration in the top 1%, face extreme economic inequality. The role of taxation and government policies significantly impacts income distribution, with some countries using progressive taxation to reduce inequality, while others show minimal redistribution.

Further research and policy interventions are crucial to addressing these imbalances, ensuring fairer economic opportunities, and promoting sustainable growth.
