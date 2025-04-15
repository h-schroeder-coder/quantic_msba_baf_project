--Inmate Gender Demographic Breakdown

SELECT 
	CASE
		WHEN i."Gender" IN ('M') then 'Male'
		WHEN i."Gender" IN ('F') then 'Female'
	END AS Gender,
	COUNT(DISTINCT i."Inmate_ID") AS inmate_count
FROM "Inmate_Details" i
GROUP BY 
    i."Gender"
 
ORDER BY inmate_count DESC;

--Returns 2 rows of the total count of inmates with each type of gender