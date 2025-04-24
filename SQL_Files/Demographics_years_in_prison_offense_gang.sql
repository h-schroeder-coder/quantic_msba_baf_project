SELECT * FROM "Inmate_Details"; 

SELECT "Gang_Affiliated", COUNT (*)
FROM "Inmate_Details"
GROUP BY "Gang_Affiliated"
ORDER BY "Gang_Affiliated" DESC; 
--(1)RESULT: Number of Gang affiliated individuals, null:3167, true: 3938, false: 18730. 

SELECT "Prison_Offense", COUNT (*)
FROM "Inmate_Details"
GROUP BY "Prison_Offense"
ORDER BY "Prison_Offense" DESC; 
--(2)RESULT: Number of individuals per arrest offense. Null:3277, Violent/Sex: 830, Violent/Non-Sex:5475, Property:8284, Other:2779, Drug: 5190

SELECT "Prison_Years", COUNT (*)
FROM "Inmate_Details"
GROUP BY "Prison_Years"
ORDER BY "Prison_Years" DESC; 
--(3)RESULT: Number of individuals per years in prision category. More than three years: 5496, Less than one year: 8048, Greater than 2-3 years: 4207, 1-2 years: 8084