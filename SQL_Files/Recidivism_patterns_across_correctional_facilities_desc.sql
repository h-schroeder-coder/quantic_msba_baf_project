--Recidivism patterns across correctional facilities

SELECT 
    i."Correctional_Facility_ID",
    f."Correctional_Facility_Name",
    COUNT(i."Inmate_ID") AS total_inmates,
    SUM(i."Recidivism_Within_3years"::int) AS recidivism_count_3years,
    ROUND(AVG(i."Recidivism_Within_3years"::int) * 100, 2) AS recidivism_rate_percent_3years,
	SUM(i."Recidivism_Arrest_Year1"::int) AS recidivism_count_year1,
    ROUND(AVG(i."Recidivism_Arrest_Year1"::int) * 100, 2) AS recidivism_year1_percent,
	SUM(i."Recidivism_Arrest_Year2"::int) AS recidivism_count_year2,
    ROUND(AVG(i."Recidivism_Arrest_Year2"::int) * 100, 2) AS recidivism_year2_percent,
	SUM(i."Recidivism_Arrest_Year3"::int) AS recidivism_count_year3,
    ROUND(AVG(i."Recidivism_Arrest_Year3"::int) * 100, 2) AS recidivism_year3_percent
FROM "Inmate_Details" i
JOIN "Correctional_Facilities" f 
    ON i."Correctional_Facility_ID" = f."Correctional_Facility_ID"
GROUP BY 
    i."Correctional_Facility_ID", 
    f."Correctional_Facility_Name"
ORDER BY recidivism_rate_percent_3years DESC;

--total_inmates: Total number of recorded inmates per facility
--recidivism_count: Absolute number of recidivism cases
--recidivism_rate_percent_years: Percentage of recorded inmates with recidivism events in/within year indicated
--leverages direct relationship between inmates and their facilities
--converts boolean Recidivism_Within_3years, Recidivism_Arrest_Year1, Recidivism_Arrest_Year2, and Recidivism_Arrest_Year3 to integers
--facilities with higher rates may need enhanced programming or intervention
--does not establish causation (does not take into account other variables like education level or prior offenses, and does not compare pre/post program implementation recidivism rates)

