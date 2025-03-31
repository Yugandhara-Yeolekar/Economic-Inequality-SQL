-- Wealth Share of the Richest 10%

SELECT * FROM "wealth-share-richest-10-percent";

-- Renaming table
ALTER TABLE "wealth-share-richest-10-percent"
RENAME TO wealth_share_richest_10;

SELECT * FROM wealth_share_richest_10;

-- Renaming columns
ALTER TABLE wealth_share_richest_10
RENAME COLUMN "Entity" TO country;

ALTER TABLE wealth_share_richest_10
RENAME COLUMN "Year" TO report_year;

ALTER TABLE wealth_share_richest_10
RENAME COLUMN "Code" TO country_code;

ALTER TABLE wealth_share_richest_10
RENAME COLUMN p90p100_share_wealth TO richest_10_wealth_share;

-- Deleting non-country entities
DELETE FROM wealth_share_richest_10
WHERE country_code IS NULL OR LENGTH(country_code) > 3;

SELECT MIN(report_year) FROM wealth_share_richest_10;
SELECT MAX(report_year) FROM wealth_share_richest_10;

DELETE FROM wealth_share_richest_10
WHERE report_year < 1990;

-- Wealth Share of the Richest 1%
SELECT * FROM "wealth-share-richest-1-percent";

-- Renaming table
ALTER TABLE "wealth-share-richest-1-percent"
RENAME TO wealth_share_richest_1;

SELECT * FROM wealth_share_richest_1;

-- Renaming columns
ALTER TABLE wealth_share_richest_1
RENAME COLUMN "Entity" TO country;

ALTER TABLE wealth_share_richest_1
RENAME COLUMN "Year" TO report_year;

ALTER TABLE wealth_share_richest_1
RENAME COLUMN "Code" TO country_code;

ALTER TABLE wealth_share_richest_1
RENAME COLUMN p99p100_share_wealth TO richest_1_wealth_share;

-- Deleting non-country entities
DELETE FROM wealth_share_richest_1
WHERE country_code IS NULL OR LENGTH(country_code) > 3;

SELECT MIN(report_year) FROM wealth_share_richest_1;
SELECT MAX(report_year) FROM wealth_share_richest_1;

DELETE FROM wealth_share_richest_1
WHERE report_year < 1990;

-- Income Inequality: Gini Coefficient Before and After Tax
SELECT * FROM "gini-coefficient-after-vs-before-tax";

-- Renaming table
ALTER TABLE "gini-coefficient-after-vs-before-tax"
RENAME TO gini_coefficient_before_vs_after_tax;

SELECT * FROM gini_coefficient_before_vs_after_tax;

-- Renaming columns
ALTER TABLE gini_coefficient_before_vs_after_tax
RENAME COLUMN "Entity" TO country;

ALTER TABLE gini_coefficient_before_vs_after_tax
RENAME COLUMN "Year" TO report_year;

ALTER TABLE gini_coefficient_before_vs_after_tax
RENAME COLUMN "Code" TO country_code;

ALTER TABLE gini_coefficient_before_vs_after_tax
RENAME COLUMN p0p100_gini_posttax_nat TO gini_post_tax;

ALTER TABLE gini_coefficient_before_vs_after_tax
RENAME COLUMN p0p100_gini_pretax TO gini_pre_tax;

ALTER TABLE gini_coefficient_before_vs_after_tax
RENAME COLUMN owid_region TO region;

-- Deleting non-country entities
DELETE FROM gini_coefficient_before_vs_after_tax
WHERE country_code IS NULL OR LENGTH(country_code) > 3;

SELECT MIN(report_year) FROM gini_coefficient_before_vs_after_tax;
SELECT MAX(report_year) FROM gini_coefficient_before_vs_after_tax;

DELETE FROM gini_coefficient_before_vs_after_tax
WHERE report_year < 1980;

DELETE FROM gini_coefficient_before_vs_after_tax
WHERE report_year > 2023;

DELETE FROM gini_coefficient_before_vs_after_tax
WHERE gini_pre_tax IS NULL AND gini_post_tax IS NULL;

-- Auto-populate region
UPDATE gini_coefficient_before_vs_after_tax AS t1
SET region = t2.region
FROM (
    SELECT country, region 
    FROM gini_coefficient_before_vs_after_tax 
    WHERE region IS NOT NULL
    GROUP BY country, region
) t2
WHERE t1.country = t2.country AND t1.region IS NULL;

-- Income or Consumption of the Poorest and Richest 10%
SELECT * FROM "daily-income-of-the-poorest-and-richest-decile";

-- Renaming table
ALTER TABLE "daily-income-of-the-poorest-and-richest-decile"
RENAME TO income_consumption_of_poorest_richest_decile;

SELECT * FROM income_consumption_of_poorest_richest_decile;

-- Renaming columns
ALTER TABLE income_consumption_of_poorest_richest_decile
RENAME COLUMN "Entity" TO country;

ALTER TABLE income_consumption_of_poorest_richest_decile
RENAME COLUMN "Year" TO report_year;

ALTER TABLE income_consumption_of_poorest_richest_decile
RENAME COLUMN "Code" TO country_code;

ALTER TABLE income_consumption_of_poorest_richest_decile
RENAME COLUMN decile1_thr TO income_poorest_10;

ALTER TABLE income_consumption_of_poorest_richest_decile
DROP COLUMN "990210-annotations";

ALTER TABLE income_consumption_of_poorest_richest_decile
RENAME COLUMN decile9_thr TO income_richest_10;

ALTER TABLE income_consumption_of_poorest_richest_decile
DROP COLUMN "990226-annotations";

ALTER TABLE income_consumption_of_poorest_richest_decile
RENAME COLUMN population_historical TO population;

ALTER TABLE income_consumption_of_poorest_richest_decile
RENAME COLUMN owid_region TO region;

-- Deleting non-country entities
DELETE FROM income_consumption_of_poorest_richest_decile
WHERE country_code IS NULL OR LENGTH(country_code) > 3;

-- Auto-populate region
UPDATE income_consumption_of_poorest_richest_decile AS t1
SET region = t2.region
FROM (
    SELECT country, region 
    FROM income_consumption_of_poorest_richest_decile 
    WHERE region IS NOT NULL
    GROUP BY country, region
) t2
WHERE t1.country = t2.country AND t1.region IS NULL;

SELECT MIN(report_year) FROM income_consumption_of_poorest_richest_decile;
SELECT MAX(report_year) FROM income_consumption_of_poorest_richest_decile;

DELETE FROM income_consumption_of_poorest_richest_decile
WHERE report_year < 1963;

DELETE FROM income_consumption_of_poorest_richest_decile
WHERE income_poorest_10 IS NULL AND income_richest_10 IS NULL;

-- Income Share Distribution Across Richer and Poorer Groups Pre-Tax
SELECT * FROM "income-share-distribution-before-tax-wid";

-- Renaming table
ALTER TABLE "income-share-distribution-before-tax-wid"
RENAME TO income_share_distribution_pre_tax;

SELECT * FROM income_share_distribution_pre_tax;

-- Renaming columns
ALTER TABLE income_share_distribution_pre_tax
RENAME COLUMN "Entity" TO country;

ALTER TABLE income_share_distribution_pre_tax
RENAME COLUMN "Year" TO report_year;

ALTER TABLE income_share_distribution_pre_tax
RENAME COLUMN "Code" TO country_code;

ALTER TABLE income_share_distribution_pre_tax
RENAME COLUMN "Top 1% - Share (Pretax) (Estimated)" TO top_1_share_pretax;

ALTER TABLE income_share_distribution_pre_tax
RENAME COLUMN "Between 90th and 99th percentiles - Share (Pretax) (Estimated)" TO next_9_share_pretax;

ALTER TABLE income_share_distribution_pre_tax
ADD COLUMN calc double precision 
GENERATED ALWAYS AS (top_1_share_pretax + next_9_share_pretax) STORED;

ALTER TABLE income_share_distribution_pre_tax
ADD COLUMN top_10_share_pretax double precision;

UPDATE income_share_distribution_pre_tax
SET top_10_share_pretax = calc;

ALTER TABLE income_share_distribution_pre_tax
DROP COLUMN calc;

ALTER TABLE income_share_distribution_pre_tax
RENAME COLUMN "Middle 40% - Share (Pretax) (Estimated)" TO middle_40_share_pretax;

ALTER TABLE income_share_distribution_pre_tax
RENAME COLUMN "Bottom 50% - Share (Pretax) (Estimated)" TO poorest_50_share_pretax;

-- Deleting non-country entities
DELETE FROM income_share_distribution_pre_tax
WHERE country_code IS NULL OR (LENGTH(country_code) > 3 AND country_code != 'OWID_WRL');

SELECT MIN(report_year) FROM income_share_distribution_pre_tax;
SELECT MAX(report_year) FROM income_share_distribution_pre_tax;

DELETE FROM income_share_distribution_pre_tax
WHERE report_year < 1980;

SELECT *
FROM income_share_distribution_pre_tax
ORDER BY country, report_year;

-- Income Share Distribution Across Richer and Poorer Groups Post-Tax
SELECT * FROM "income-share-distribution-after-tax-wid";

-- Renaming table
ALTER TABLE "income-share-distribution-after-tax-wid"
RENAME TO income_share_distribution_post_tax;

SELECT * FROM income_share_distribution_post_tax;

-- Renaming columns
ALTER TABLE income_share_distribution_post_tax
RENAME COLUMN "Entity" TO country;

ALTER TABLE income_share_distribution_post_tax
RENAME COLUMN "Year" TO report_year;

ALTER TABLE income_share_distribution_post_tax
RENAME COLUMN "Code" TO country_code;

ALTER TABLE income_share_distribution_post_tax
RENAME COLUMN "Top 1% - Share (Post-tax national) (Estimated)" TO top_1_share_post_tax;

ALTER TABLE income_share_distribution_post_tax
RENAME COLUMN "Between 90th and 99th percentiles - Share (Post-tax national) (Estimated)" TO next_9_share_post_tax;

ALTER TABLE income_share_distribution_post_tax
ADD COLUMN calc double precision 
GENERATED ALWAYS AS (ROUND((top_1_share_post_tax + next_9_share_post_tax)::numeric, 2)) STORED;

ALTER TABLE income_share_distribution_post_tax
ADD COLUMN top_10_share_post_tax double precision;

UPDATE income_share_distribution_post_tax
SET top_10_share_post_tax = calc;

ALTER TABLE income_share_distribution_post_tax
DROP COLUMN calc;

ALTER TABLE income_share_distribution_post_tax
RENAME COLUMN "Middle 40% - Share (Post-tax national) (Estimated)" TO middle_40_share_post_tax;

ALTER TABLE income_share_distribution_post_tax
RENAME COLUMN "Bottom 50% - Share (Post-tax national) (Estimated)" TO poorest_50_share_post_tax;

-- Deleting non-country entities
DELETE FROM income_share_distribution_post_tax
WHERE country_code IS NULL OR (LENGTH(country_code) > 3 AND country_code != 'OWID_WRL');

SELECT MIN(report_year) FROM income_share_distribution_post_tax;
SELECT MAX(report_year) FROM income_share_distribution_post_tax;

DELETE FROM income_share_distribution_post_tax
WHERE report_year < 1980;

SELECT *
FROM income_share_distribution_post_tax
ORDER BY country, report_year;



















