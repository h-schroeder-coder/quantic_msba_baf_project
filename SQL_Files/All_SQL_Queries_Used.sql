--Creates the tables and sets up the data dictionary for the tables in this database

BEGIN;


CREATE TABLE IF NOT EXISTS public."Correctional_Facilities"
(
    "Correctional_Facility_ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Correctional_Facility_Name" text COLLATE pg_catalog."default" NOT NULL,
    "Facility_Sec_Level" text COLLATE pg_catalog."default",
    "Avg_Cost_Per_Employee_Hour_USD" numeric NOT NULL,
    "Average_Daily_Inmate_Population" integer NOT NULL,
    "Average_Inmate_to_CO_Ratio" integer NOT NULL,
    CONSTRAINT "Correctional_Facilities_pkey" PRIMARY KEY ("Correctional_Facility_ID")
);

CREATE TABLE IF NOT EXISTS public."Inmate_Details"
(
    "Inmate_ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Correctional_Facility_ID" integer NOT NULL,
    "Gender" text COLLATE pg_catalog."default" NOT NULL,
    "Race" text COLLATE pg_catalog."default" NOT NULL,
    "Age_at_Release" text COLLATE pg_catalog."default" NOT NULL,
    "Residence_PUMA" integer NOT NULL,
    "Gang_Affiliated" boolean,
    "Supervision_Risk_Score_First" integer,
    "Supervision_Level_First" text COLLATE pg_catalog."default",
    "Education_Level" text COLLATE pg_catalog."default" NOT NULL,
    "Dependents" text COLLATE pg_catalog."default" NOT NULL,
    "Prison_Offense" text COLLATE pg_catalog."default",
    "Prison_Years" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Arrest_Episodes_Felony" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Arrest_Episodes_Misd" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Arrest_Episodes_Violent" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Arrest_Episodes_Property" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Arrest_Episodes_Drug" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Arrest_Episodes_PPViolationCharges" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Arrest_Episodes_DVCharges" boolean NOT NULL,
    "Prior_Arrest_Episodes_GunCharges" boolean NOT NULL,
    "Prior_Conviction_Episodes_Felony" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Conviction_Episodes_Misd" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Conviction_Episodes_Viol" boolean NOT NULL,
    "Prior_Conviction_Episodes_Prop" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Conviction_Episodes_Drug" text COLLATE pg_catalog."default" NOT NULL,
    "Prior_Conviction_Episodes_PPViolationCharges" boolean NOT NULL,
    "Prior_Conviction_Episodes_DomesticViolenceCharges" boolean NOT NULL,
    "Prior_Conviction_Episodes_GunCharges" boolean NOT NULL,
    "Prior_Revocations_Parole" boolean NOT NULL,
    "Prior_Revocations_Probation" boolean NOT NULL,
    "Condition_MH_SA" boolean NOT NULL,
    "Condition_Cog_Ed" boolean NOT NULL,
    "Condition_Other" boolean NOT NULL,
    "Violations_ElectronicMonitoring" boolean NOT NULL,
    "Violations_Instruction" boolean NOT NULL,
    "Violations_FailToReport" boolean NOT NULL,
    "Violations_MoveWithoutPermission" boolean NOT NULL,
    "Delinquency_Reports" text COLLATE pg_catalog."default" NOT NULL,
    "Program_Attendances" text COLLATE pg_catalog."default" NOT NULL,
    "Program_UnexcusedAbsences" text COLLATE pg_catalog."default" NOT NULL,
    "Residence_Changes" text COLLATE pg_catalog."default" NOT NULL,
    "Avg_Days_per_DrugTest" numeric,
    "DrugTests_THC_Positive" numeric,
    "DrugTests_Cocaine_Positive" numeric,
    "DrugTests_Meth_Positive" numeric,
    "DrugTests_Other_Positive" numeric,
    "Percent_Days_Employed" numeric,
    "Jobs_Per_Year" numeric,
    "Employment_Exempt" boolean NOT NULL,
    "Recidivism_Within_3years" boolean NOT NULL,
    "Recidivism_Arrest_Year1" boolean NOT NULL,
    "Recidivism_Arrest_Year2" boolean NOT NULL,
    "Recidivism_Arrest_Year3" boolean NOT NULL,
    CONSTRAINT "Inmate_Details_pkey" PRIMARY KEY ("Inmate_ID")
);

CREATE TABLE IF NOT EXISTS public."Residence_Prison Release_PUMA"
(
    "Release_PUMA_ID_Code" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "PUMAs_Included" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Residence_Prison Release_PUMA_pkey" PRIMARY KEY ("Release_PUMA_ID_Code")
);

CREATE TABLE IF NOT EXISTS public."EBRR_Program_Cohorts"
(
    "EBRR_Program_Cohort_ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Correctional_Facility_ID" integer NOT NULL,
    "EBRR_Programs_ID" integer NOT NULL,
    "Program_Cohort_Size_Max" integer,
    "Program_Cohort_Size_Min" integer,
    "Number_of_Cohorts" integer,
    "Program_Cohort_Num_Enrolled_Avg" integer,
    "Program_Cohort_Num_Attended_Avg" integer,
    "Program_Cohort_Num_Completed_Avg" integer,
    "Program_Cohort_Percent_Completion_Avg" numeric,
    "Program_Cohort_Attendance_Rate_Avg" numeric,
    "Program_Cohort_Hours_Avg" integer,
    "Num_Employee_Hours_Per_Cohort_Avg" integer,
    "Cost_Supply_Max_Per_Cohort _USD" integer,
    CONSTRAINT "EBRR_Program_Cohorts_pkey" PRIMARY KEY ("EBRR_Program_Cohort_ID")
);

CREATE TABLE IF NOT EXISTS public."EBRR_Programs"
(
    "EBRR_Programs_ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Correctional_Facility_ID" integer NOT NULL,
    "EBRR_CTE_Program" boolean NOT NULL,
    "EBRR_Skills_Training" boolean NOT NULL,
    "EBRR_Soft_Skills" boolean NOT NULL,
    "EBRR_Work_Ready" boolean NOT NULL,
    CONSTRAINT "EBRR_Programs_pkey" PRIMARY KEY ("EBRR_Programs_ID")
);

ALTER TABLE IF EXISTS public."Inmate_Details"
    ADD CONSTRAINT "Inmate_Details_Correctional_Facility_ID_fkey" FOREIGN KEY ("Correctional_Facility_ID")
    REFERENCES public."Correctional_Facilities" ("Correctional_Facility_ID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_Inmate_Details_Correctional_Facility_ID_fkey"
    ON public."Inmate_Details"("Correctional_Facility_ID");


ALTER TABLE IF EXISTS public."Inmate_Details"
    ADD CONSTRAINT "Inmate_Details_Residence_PUMA_fkey" FOREIGN KEY ("Residence_PUMA")
    REFERENCES public."Residence_Prison Release_PUMA" ("Release_PUMA_ID_Code") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_Inmate_Details_Residence_PUMA_fkey"
    ON public."Inmate_Details"("Residence_PUMA");


ALTER TABLE IF EXISTS public."EBRR_Program_Cohorts"
    ADD CONSTRAINT "EBRR_Program_Cohorts_EBRR_Program_ID_fkey" FOREIGN KEY ("EBRR_Programs_ID")
    REFERENCES public."EBRR_Programs" ("EBRR_Programs_ID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_EBRR_Program_Cohorts_EBRR_Program_ID_fkey"
    ON public."EBRR_Program_Cohorts"("EBRR_Programs_ID");


ALTER TABLE IF EXISTS public."EBRR_Program_Cohorts"
    ADD CONSTRAINT "EBRR_Programs_Cohorts_Correctional_Facility_ID_fkey" FOREIGN KEY ("Correctional_Facility_ID")
    REFERENCES public."Correctional_Facilities" ("Correctional_Facility_ID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_EBRR_Programs_Cohorts_Correctional_Facility_ID_fkey"
    ON public."EBRR_Program_Cohorts"("Correctional_Facility_ID");


ALTER TABLE IF EXISTS public."EBRR_Programs"
    ADD CONSTRAINT "EBRR_Programs_Correctional_Facility_ID_fkey" FOREIGN KEY ("Correctional_Facility_ID")
    REFERENCES public."Correctional_Facilities" ("Correctional_Facility_ID") MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_EBRR_Programs_Correctional_Facility_ID_fkey"
    ON public."EBRR_Programs"("Correctional_Facility_ID");

END;





-----------
-----------

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



--Categorized Employment Duration vs. Recidivism Patterns

WITH Employment_Categories AS (
    SELECT 
        CASE 
            WHEN "Percent_Days_Employed" >= .75 THEN 'High Employment'
            WHEN "Percent_Days_Employed" BETWEEN .5 AND .74 THEN 'Medium Employment'
            WHEN "Percent_Days_Employed" < .5 THEN 'Low Employment'
            ELSE 'Uncategorized'  -- Explicit handling of nulls
        END AS employment_category,
        *
    FROM "Inmate_Details"
    WHERE "Percent_Days_Employed" IS NOT NULL  -- Exclude null employment values
)

SELECT 
    employment_category,
    COUNT(*) AS total_inmates,
    ROUND(AVG("Percent_Days_Employed"), 2) AS avg_employment,
    ROUND(AVG("Recidivism_Within_3years"::int) * 100, 2) AS recidivism_3yr_rate,
    ROUND(AVG("Recidivism_Arrest_Year1"::int) * 100, 2) AS year1_arrest_rate,
    ROUND(AVG("Recidivism_Arrest_Year2"::int) * 100, 2) AS year2_arrest_rate,
    ROUND(AVG("Recidivism_Arrest_Year3"::int) * 100, 2) AS year3_arrest_rate
FROM Employment_Categories
WHERE employment_category != 'Uncategorized'  -- Additional safeguard
GROUP BY employment_category
ORDER BY avg_employment DESC;

--Correlates post-release employment stability with overall 3-year recidivism and annual arrest patterns
--Classifies inmates into three groups based on percent days employed for comparative analysis (excludes any inmates falling into the uncategorized employment section)
--Excludes records with null percent_days_employeed values
--Groups inmate recidivism rates based on employment category and orders by the highest average employment to the lowest average employment




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




-- Top 5 correctional facilities by program cohort performance metrics

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
     AVG(c."Program_Cohort_Num_Completed_Avg")) / 3 DESC
LIMIT 5;


--Calculates facility-level averages for: Enrollment numbers, Attendance rates, Completion percentages, and rounds results to 2 decimal places for readability
--Ranks facilities by the combined average of all three metrics (Enrollment numbers, Attendance rates, Completion percentages)
--Identifies high-performing facilities that maintain strong enrollment, attendance, and completion rates - key indicators of successful EBRR program implementation




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

--Correctional Facilities Ordered by Average Cost Per Employee Hour 

SELECT * FROM public."Correctional_Facilities"
ORDER BY "Avg_Cost_Per_Employee_Hour_USD" ASC ;

--Returns 56 rows and all columns of data from the Correctional Facilities table with the correctional facility that pays the least listed first




--Correctional Facilities Ordered by Average Inmate to Correctional Officer (CO) Ratio

SELECT * FROM public."Correctional_Facilities"
ORDER BY "Average_Inmate_to_CO_Ratio" ASC ;

--Returns 56 rows and all columns of data from the Correctional Facilities table with the correctional facility that has the lowest inmate to correctional officer ratio listed first



--Correctional Facilities Ordered by Average Daily Inmate Population

SELECT * FROM public."Correctional_Facilities"
ORDER BY "Average_Daily_Inmate_Population" ASC ;

--Returns 56 rows and all columns of data from the Correctional Facilities table with the correctional facility with the lowest average daily inmate population listed first