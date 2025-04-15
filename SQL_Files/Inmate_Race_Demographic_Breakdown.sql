--Inmate Race Demographic Breakdown

SELECT 
	CASE
		WHEN i."Race" IN ('WHITE') then 'White'
		WHEN i."Race" IN ('BLACK') then 'Black'
	END AS Race,
    COUNT(DISTINCT i."Inmate_ID") AS inmate_count
FROM "Inmate_Details" i
GROUP BY 
   i."Race"
ORDER BY inmate_count DESC;

--Returns 2 rows of the total count of inmates with each type of race