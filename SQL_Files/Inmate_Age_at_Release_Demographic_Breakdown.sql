--Inmate Age at Release Demographic Breakdown

SELECT 
    CASE
		WHEN i."Age_at_Release" IN ('18-22') then 'age 18-22 years'
		WHEN i."Age_at_Release" IN ('23-27') then 'age 23-27 years'
		WHEN i."Age_at_Release" IN ('28-32') then 'age 28-32 years'
		WHEN i."Age_at_Release" IN ('33-37') then 'age 33-37 years'
		WHEN i."Age_at_Release" IN ('38-42') then 'age 38-42 years'
		WHEN i."Age_at_Release" IN ('43-47') then 'age 43-47 years'
		WHEN i."Age_at_Release" IN ('48 or older') then 'age 48 years or older'
	END AS Age_at_Release,
    COUNT(DISTINCT i."Inmate_ID") AS inmate_count
FROM "Inmate_Details" i
GROUP BY 
    i."Age_at_Release"
ORDER BY inmate_count DESC;

--Returns 7 rows of the total count of inmates within each age category