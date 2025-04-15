--Inmate Educational Level Demographic Breakdown

SELECT 
	CASE
		WHEN i."Education_Level" IN ('At least some college') then 'Some_College_Education'
		WHEN i."Education_Level" IN ('Less than HS diploma') then 'No_HS_Diploma'
		WHEN i."Education_Level" IN ('High School Diploma') then 'HS_Diploma'
	END AS Education_Level,
    COUNT(DISTINCT i."Inmate_ID") AS inmate_count
FROM "Inmate_Details" i
GROUP BY 
    i."Education_Level"
ORDER BY inmate_count DESC;

--Returns 3 rows of the total count of inmates with each type of education level