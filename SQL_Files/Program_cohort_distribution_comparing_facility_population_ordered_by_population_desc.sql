--Analyze program and cohort distribution across correctional facilities in comparison to facility population

SELECT 
    f."Correctional_Facility_ID",
    f."Correctional_Facility_Name",
	f."Average_Daily_Inmate_Population",
	Count(c."EBRR_Programs_ID") AS "Number_of_Programs",
    SUM(c."Number_of_Cohorts") AS "Number_of_Cohorts"
FROM "Correctional_Facilities" f
JOIN "EBRR_Programs" p 
    ON f."Correctional_Facility_ID" = p."Correctional_Facility_ID"
JOIN "EBRR_Program_Cohorts" c 
    ON p."EBRR_Programs_ID" = c."EBRR_Programs_ID"
GROUP BY 
    f."Correctional_Facility_ID", 
    f."Correctional_Facility_Name"
ORDER BY "Average_Daily_Inmate_Population" DESC;

--Returns 56 rows
--Reveals which facilities are most active in program implementation
--Identifies potential resource allocation disparities between facilities
--Enables comparison of program scale vs. facility size/security level