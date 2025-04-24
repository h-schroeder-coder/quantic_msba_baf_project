--EBRR_Program_Type_Overall_Totals

SELECT 
    SUM(p."EBRR_CTE_Program"::int) AS "Total_CTE_Programs",
    SUM(p."EBRR_Skills_Training"::int) AS "Total_Skills_Training_Programs",
    SUM(p."EBRR_Soft_Skills"::int) AS "Total_Soft_Skills_Programs",
    SUM(p."EBRR_Work_Ready"::int) AS "Total_Work_Ready_Programs"
FROM "Correctional_Facilities" f
JOIN "EBRR_Programs" p 
    ON f."Correctional_Facility_ID" = p."Correctional_Facility_ID";

--Returns a single row with the total counts of each program type