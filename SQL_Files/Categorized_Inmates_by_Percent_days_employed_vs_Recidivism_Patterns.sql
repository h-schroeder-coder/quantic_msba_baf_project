--Categorized Employment Duration vs. Recidivism Patterns

WITH Employment_Categories AS (
    SELECT 
        CASE 
            WHEN "Percent_Days_Employed" >= .75 THEN 'High Employment'
            WHEN "Percent_Days_Employed" BETWEEN .5 AND .74 THEN 'Medium Employment'
            WHEN "Percent_Days_Employed" < .5 THEN 'Low Employment'
            ELSE 'Uncategorized'  -- Explicit handling of nulls
        END AS employment_category,
        *
    FROM "Inmate_Details"
    WHERE "Percent_Days_Employed" IS NOT NULL  -- Exclude null employment values
)

SELECT 
    employment_category,
    COUNT(*) AS total_inmates,
    ROUND(AVG("Percent_Days_Employed"), 2) AS avg_employment,
    ROUND(AVG("Recidivism_Within_3years"::int) * 100, 2) AS recidivism_3yr_rate,
    ROUND(AVG("Recidivism_Arrest_Year1"::int) * 100, 2) AS year1_arrest_rate,
    ROUND(AVG("Recidivism_Arrest_Year2"::int) * 100, 2) AS year2_arrest_rate,
    ROUND(AVG("Recidivism_Arrest_Year3"::int) * 100, 2) AS year3_arrest_rate
FROM Employment_Categories
WHERE employment_category != 'Uncategorized'  -- Additional safeguard
GROUP BY employment_category
ORDER BY avg_employment DESC;

--Correlates post-release employment stability with overall 3-year recidivism and annual arrest patterns
--Classifies inmates into three groups based on percent days employed for comparative analysis (excludes any inmates falling into the uncategorized employment section)
--Excludes records with null percent_days_employeed values
--Groups inmate recidivism rates based on employment category and orders by the highest average employment to the lowest average employment
