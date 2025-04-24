--Breakdown of EBRR Program Types at Each Correctional Facility

SELECT 
    f."Correctional_Facility_ID",
    f."Correctional_Facility_Name",
    SUM(p."EBRR_CTE_Program"::int) AS "CTE_Programs",
    SUM(p."EBRR_Skills_Training"::int) AS "Skills_Training_Programs",
    SUM(p."EBRR_Soft_Skills"::int) AS "Soft_Skills_Programs",
    SUM(p."EBRR_Work_Ready"::int) AS "Work_Ready_Programs"
FROM "Correctional_Facilities" f
JOIN "EBRR_Programs" p 
    ON f."Correctional_Facility_ID" = p."Correctional_Facility_ID"
GROUP BY 
    f."Correctional_Facility_ID", 
    f."Correctional_Facility_Name"
ORDER BY f."Correctional_Facility_ID";

--Returns all 56 correctional facilities with the total number of each EBRR program type at each facility