-- Bottom 5 correctional facilities by program cohort performance metrics

SELECT 
    f."Correctional_Facility_ID",
    f."Correctional_Facility_Name",
    ROUND(AVG(c."Program_Cohort_Num_Enrolled_Avg")::numeric, 2) AS avg_enrolled,
    ROUND(AVG(c."Program_Cohort_Num_Attended_Avg")::numeric, 2) AS avg_attended,
    ROUND(AVG(c."Program_Cohort_Num_Completed_Avg")::numeric, 2) AS avg_completed
FROM "Correctional_Facilities" f
JOIN "EBRR_Programs" p 
    ON f."Correctional_Facility_ID" = p."Correctional_Facility_ID"
JOIN "EBRR_Program_Cohorts" c 
    ON p."EBRR_Programs_ID" = c."EBRR_Programs_ID"
GROUP BY f."Correctional_Facility_ID", f."Correctional_Facility_Name"
ORDER BY 
    (AVG(c."Program_Cohort_Num_Enrolled_Avg") +
     AVG(c."Program_Cohort_Num_Attended_Avg") +
     AVG(c."Program_Cohort_Num_Completed_Avg")) / 3 ASC
LIMIT 5;


--Calculates facility-level averages for: Enrollment numbers, Attendance rates, Completion percentages, and rounds results to 2 decimal places for readability
--Ranks facilities by the combined average of all three metrics (Enrollment numbers, Attendance rates, Completion percentages)
--Identifies low-performing facilities that are not maintaining strong enrollment, attendance, and completion rates - key indicators of of an at-risk EBRR program
