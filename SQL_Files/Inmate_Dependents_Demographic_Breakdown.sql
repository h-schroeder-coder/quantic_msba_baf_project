--Inmate Dependents Demographic Breakdown

SELECT 
	CASE
		WHEN i."Dependents" IN ('0') then 'O dependents'
		WHEN i."Dependents" IN ('1') then '1 dependent'
		WHEN i."Dependents" IN ('2') then '2 dependents'
		WHEN i."Dependents" IN ('3 or more') then '3 or more dependents'
	END AS Number_of_Dependents,
    COUNT(DISTINCT i."Inmate_ID") AS inmate_count
FROM "Inmate_Details" i
GROUP BY 
    i."Dependents"
ORDER BY inmate_count DESC;

--Returns 4 rows of the total count of inmates within each category for number of dependents