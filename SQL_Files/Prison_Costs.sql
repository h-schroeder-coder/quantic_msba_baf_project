--Prison Costs SQL Queries

SELECT "Avg_Cost_Per_Employee_Hour_USD", "Correctional_Facility_Name", "Average_Daily_Inmate_Population"
FROM "Correctional_Facilities"
WHERE "Average_Daily_Inmate_Population" > 1000
ORDER BY "Correctional_Facility_Name" DESC; 
--Returns the correctional facility name, CO wage per hour in USD, and daily inmate population for prisions over 1000 daily inamtes. This was done to reduce the visualization burden when displaying data result in graph format for this section. 

SELECT COUNT (*)
FROM "Correctional_Facilities"
WHERE "Average_Daily_Inmate_Population" > 1000; 
--Returns result of number of correctional facilties with over 1000 inmates. Result is 26. 

SELECT AVG ("Avg_Cost_Per_Employee_Hour_USD")
FROM "Correctional_Facilities"
WHERE "Average_Daily_Inmate_Population" > 1000; 
--Returns average correctional officer wage for a facility with 1000 or more daily inmates. Result is $26.96. 

SELECT "Avg_Cost_Per_Employee_Hour_USD", "Correctional_Facility_Name"
FROM "Correctional_Facilities"
WHERE "Average_Daily_Inmate_Population" > 1000
ORDER BY "Avg_Cost_Per_Employee_Hour_USD" DESC
LIMIT 1; 
--Returns correctional facility name and wage of most well paid correctional officers. Result is Pulaski State Prison with a wage of $36.99. 

SELECT "Avg_Cost_Per_Employee_Hour_USD" - 26.96
FROM "Correctional_Facilities"
WHERE "Average_Daily_Inmate_Population" > 1000
ORDER BY "Avg_Cost_Per_Employee_Hour_USD" DESC
LIMIT 1; 
--Returns result of correctional faclitiy that yeilds the highest wage and subtracts off the known average correctional officer wage of 26.96. Completed as so instead of CTE as one record being actioned rather than multiple. 

SELECT "Avg_Cost_Per_Employee_Hour_USD", "Correctional_Facility_Name" 
FROM "Correctional_Facilities"
WHERE "Average_Daily_Inmate_Population" > 1000
ORDER BY "Average_Daily_Inmate_Population" DESC
LIMIT 3;
--Result yeilds three correctional facilities with the highest populations. Result yielded is: "Ga Diag Class Prison" @ $24.27/hr, "Coffee Corr Facility" @ $24.72/hr, and "Wheeler Corr Facility" @ $20.39/hr 

WITH AvgCost AS (SELECT AVG("Avg_Cost_Per_Employee_Hour_USD") AS AvgWage
FROM "Correctional_Facilities"
WHERE "Average_Daily_Inmate_Population" > 1000),
MostPopCF AS (SELECT "Avg_Cost_Per_Employee_Hour_USD", "Correctional_Facility_Name" 
FROM "Correctional_Facilities"
WHERE "Average_Daily_Inmate_Population" > 1000
ORDER BY "Average_Daily_Inmate_Population" DESC
LIMIT 3)
SELECT mpcf."Correctional_Facility_Name", 
mpcf."Avg_Cost_Per_Employee_Hour_USD",
(mpcf."Avg_Cost_Per_Employee_Hour_USD" - ac.AvgWage) AS DifferenceAvgWage
FROM MostPopCF mpcf, AvgCost ac; 
--Results in the subtraction of the wage of all three most populated correctional facilties with over 1000 daily inmates against the overall average wage with over 1000 daily inmates. 
--Results are all negative values. Result: "Ga Diag Class Prison" -$2.69, "Coffee Corr Facility" -$2.24, "Wheeler Corr Facility" -$6.57